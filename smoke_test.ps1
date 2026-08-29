$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$failed = 0

function Check($name, $ok) {
    if ($ok) {
        Write-Output ("PASS: " + $name)
    } else {
        Write-Output ("FAIL: " + $name)
        $script:failed = 1
    }
}

$index = Get-Content -LiteralPath (Join-Path $root 'index.html') -Raw -Encoding UTF8
$table = Get-Content -LiteralPath (Join-Path $root 'table.html') -Raw -Encoding UTF8
$exam = Get-Content -LiteralPath (Join-Path $root 'exam.html') -Raw -Encoding UTF8
$essay = Get-Content -LiteralPath (Join-Path $root 'essay.html') -Raw -Encoding UTF8

Check 'files exist' ((Test-Path (Join-Path $root 'index.html')) -and (Test-Path (Join-Path $root 'table.html')) -and (Test-Path (Join-Path $root 'exam.html')) -and (Test-Path (Join-Path $root 'essay.html')) -and (Test-Path (Join-Path $root 'favicon.svg')))
Check 'index essay entry' ($index.Contains('href="essay.html"'))
Check 'index exam entry' ($index.Contains('href="exam.html"'))
Check 'favicon links' (($index + $table + $exam + $essay).Contains('href="favicon.svg"'))
Check 'essay data embedded' ($essay.Contains('const TOPICS') -and $essay.Contains('const ESSAYS') -and $essay.Contains('const TEMPLATES'))
Check 'missing passages added' ($exam.Contains('The Thinking Habit That Changed My Life') -and $exam.Contains('Life on the Farm') -and $exam.Contains('My Brother'))
Check 'settings stays on page' (-not $table.Contains("classList.remove('show'); goHome();"))
Check 'cancel settings added' ($table.Contains('function cancelSettings()'))
Check 'tag fields escaped' ($table.Contains("esc(t.id)") -and $table.Contains("esc(t.name)") -and $table.Contains("esc(t.color)"))
Check 'progress normalization' ($table.Contains('if(!prog.studied) prog.studied=[];') -and $table.Contains('if(!prog.wrongWords) prog.wrongWords=[];'))
Check 'dead exam code removed' (-not $exam.Contains('function showAllAnswers()') -and -not $exam.Contains('function renderMatching(') -and -not $exam.Contains('function renderCloze('))
Check 'ocr cleanup rules' ($exam.Contains('i*E/7:00015') -and $exam.Contains('#\w+#\w+'))

if ($failed -ne 0) {
    Write-Output 'SMOKE TEST FAILED'
    exit 1
}
Write-Output 'SMOKE TEST PASSED'
