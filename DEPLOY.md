# 部署说明与修复清单

## 部署状态

- 英语作文功能已完成开发并部署到 GitHub Pages。
- 线上地址：`https://ppgdh.github.io/vocab/`
- 已通过线上验证：首页“历年真题 / 英语作文”5:5 入口、10 道真题题目、22 篇范文、万能句模板、范文翻转显示中文均正常。

## 审查修复

- 学习设置保存/重置后不再强制跳回首页，取消按钮单独负责返回。
- 真题原文增加 OCR 水印清洗规则，`zk1810` 等页首扫描残留已去除。
- 移除 `showAllAnswers`、`renderMatching`、`renderCloze` 等死代码。
- 自定义标签渲染字段已统一转义。
- 全站新增 `favicon.svg`，消除 favicon 404。
- 新增 `smoke_test.ps1` 静态回归检查，运行方式：
  ```powershell
  powershell -ExecutionPolicy Bypass -File smoke_test.ps1
  ```

## 本次新增功能

- 首页新增“英语作文”入口，与“历年真题”并列显示。
- 新增 `essay.html`，包含：
  - 10 道真题作文题目列表
  - 22 篇中英对照范文列表
  - 万能句 / 连接词 / 议论文与邮件模板
  - 点击范文可查看完整英文，点击卡片翻转显示中文
- 数据来自用户提供的 `topics.json`、`essays.json`、`templates.json`，已嵌入页面。

## 阅读原文补充

- 2017 年 4 月（zk1704）第一部分已补入原文：The Thinking Habit That Changed My Life
- 2018 年 4 月（zk1804）第一部分已补入原文：Life on the Farm
- 2019 年 4 月（zk1904）第一部分已补入原文：My Brother
- 原文从用户提供的《自考英语二真题演练 17.04~21.10》PDF 中 OCR 提取并人工整理，已随 `exam.html` 部署上线。
- 线上验证：三套题的阅读判断均显示 10 题并带完整原文。

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
