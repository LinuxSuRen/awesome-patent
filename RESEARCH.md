# 专利检索与核验指南

本仓库收录专利时的可用检索/核验途径与操作要点（均为实战验证过的方法，随网络环境变化会失效，欢迎更新）。

## 背景：网络限制

- `patents.google.com` 在国内网络直连不可达；走代理可用，但**高频访问会触发限流**（返回 `Sorry...` 页面或 HTTP 503，按 IP 封禁，冷却时间长）
- Espacenet（403 反爬）、SooPAT（需登录）、lens.org（JS 渲染）、百度/必应中国版（反爬）对无头抓取基本不可用

## 可用途径（按优先级）

### 1. Google Patents 专利页 · 经 r.jina.ai 转述 ⭐ 核验首选

```shell
curl -sL "https://r.jina.ai/https://patents.google.com/patent/CN121207173A/zh"
```

- 返回 Markdown：标题、申请人（assignee）、申请/公开日期、摘要、法律状态一应俱全
- 中文专利用 `/zh`，其他用 `/en`
- 注意：页面格式有两种开头（`## CNxxx - 标题 - Google Patents` 或直接 `Title: 标题`），解析时两种都要兼容
- 高频调用偶发失败，重试 + 间隔 3~5 秒

### 2. Google Patents 检索 API · 经 r.jina.ai 转述 ⭐ 按公司找专利

```shell
ENC=$(python3 -c "import urllib.parse;print(urllib.parse.quote('q=assignee=\"Shenzhen Yuejiang Technology\"'))")
curl -sL "https://r.jina.ai/https://patents.google.com/xhr/query?url=${ENC}&exp="
```

- 返回 JSON（需先定位 `{"results"`）：公开号、标题、申请人、公开日期
- **申请人用英文登记名比中文全称命中更多**（英文索引更全），两种都查
- 结果有同名噪声（如 Silicon Laboratories ≠ 越疆），需按 assignee 过滤
- 该通道比专利页更不稳定，失败重试；直连 `patents.google.com/xhr/query` 仅在 IP 未被限时可用

### 3. 中国专利发现 · 金融界/新浪“专利授权”报道

发现新公开号最可靠的免费通道。报道文案固定为“国家知识产权局信息显示，XX 公司申请/取得名为 YY 的专利，公开号 CN xxx”：

- 网易（金融界稿源）：`https://www.163.com/search?keyword=<公司名>+专利`（curl 直连可用），文章页 `www.163.com/dy/article/xxx.html`
- 腾讯新闻同稿源：`https://news.qq.com/rain/a/<id>`
- 360 搜索 `https://www.so.com/s?q=<公司名>+专利+公开号`（直连可用，触发验证码会长期封锁，控制频率）
- 从报道拿到公开号后，**必须回到途径 1 核验标题/申请人一致**才可收录

### 4. WIPO Patentscope · 国际专利检索

`https://patentscope2.wipo.int/search/en/result.jsf?query=PA%3D%22<申请人%22>`

- 检索结果页是 JS 渲染，curl 只能拿到壳；需要真实浏览器（如 Playwright + 本地 Chrome）渲染后解析
- 详情页 `detail.jsf?docId=WO2024073138` 可确认 WO 号标题/申请人
- 适合查 PCT（WO）公开，美国主体 PCT 的 kind code 按惯例取 A1

### 5. Google Patents 专利页 · 引文网络顺藤摸瓜

某公司一条专利的页面含 Cited By / Similar Documents 表格（含公开号+标题+受让人），可以找到引用它的同领域专利；但同公司其他专利未必互相引用，覆盖有限。

## 核验纪律（收录前必读）

1. **公开号必须在权威页确认**：Google Patents 专利页（途径 1）或 Patentscope 详情页，标题与申请人同时核对
2. 只有新闻源、没有权威页复核的条目，PR 中要注明证据等级
3. 禁止编造或“拼凑”公开号；链接统一 `https://patents.google.com/patent/<公开号>`
4. 同名公司注意甄别（登记英文名可能撞名，以页面显示的 assignee 为准）
