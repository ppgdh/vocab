# 部署说明与修复清单

## 本次修复内容

针对“阅读题不显示原文”的问题，已从现有题库数据中找回并补全以下 6 个阅读选择题原文：

- 2017 年 4 月（zk1704）第二部分：Dog Training
- 2018 年 4 月（zk1804）第二部分：Christmas Gift
- 2018 年 10 月（zk1810）第二部分：Horse Talk
- 2019 年 4 月（zk1904）第二部分：Garlic
- 2019 年 10 月（zk1910）第二部分：Mental Illness Hits Small Business Owners Hard
- 2025 年 10 月（2510）第二部分：An Important Piece of Life Advice for the Young

这些原文原本被错误地附加在对应套题第一部分数据的末尾，页面解析时取不到，现已移动到第二部分并验证可以正常显示。

## 仍缺的数据

以下 3 个阅读判断题的原文没有存在于任何仓库数据中，无法靠现有数据恢复：

- 2017 年 4 月（zk1704）第一部分
- 2018 年 4 月（zk1804）第一部分
- 2019 年 4 月（zk1904）第一部分

需要补录对应真题原文文本后，重新生成 `exam.html` 中的 `EXAM_DATA`。

## 部署方式

本目录就是完整站点文件，将以下文件替换到 `ppgdh/vocab` 仓库根目录即可：

- `index.html`
- `table.html`
- `exam.html`
- `banner.png`
- `148db597e3b2d32d3ec6955d3467d7d9.txt`
- `0be360eb684aacc505be68dbc992585e.txt`
- `README.md`

当前机器没有 git、GitHub CLI 或 GitHub Token，因此无法直接 push。拿到仓库访问权限后即可完成部署；GitHub Pages 会自动发布。

## 验证结果

- 6 个找回的阅读选择题原文均已在本地无头浏览器中确认显示。
- 17 套真题其余题型题量与答案覆盖未受影响。
- 站点仍存在一个无关紧要的 404：缺少 `favicon.ico`。
