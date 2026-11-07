# Contribution

欢迎推荐具身智能领域的专利！本仓库的 README 由 [generator workflow](.github/workflows/generator.yaml) 基于 `data/` 目录下的 YAML 文件自动生成，请按以下规范提交。

## 收录条目

在 [data](data) 目录新增一个 YAML 文件，文件名用「公司-公开号」的 kebab-case（如 `unitree-cn119839885b.yaml`）：

```yaml
name: 双足机器人的步态控制方法
number: CN103634206A
link: https://patents.google.com/patent/CN103634206A
kind: Locomotion
creator: 优必选
year: 2014
```

| 字段 | 必填 | 说明 |
|---|---|---|
| `name` | ✅ | 专利标题（中文专利用原名，英文专利用英文标题） |
| `number` | ✅ | 公开号/授权号，如 `CN103634206A`、`US20230012345A1` |
| `link` | ✅ | Google Patents 链接，统一使用 `https://patents.google.com/patent/<公开号>` 格式 |
| `kind` | ✅ | 技术领域分类，必须使用下方现有分类之一 |
| `creator` | ✅ | 申请人/受让人（公司维度） |
| `year` | ✅ | 公开年份 |

## 技术领域（kind）白名单

`Locomotion`、`Dexterous Manipulation`、`VLA Model`、`Tactile Sensing`、`Navigation & SLAM`、`Sim2Real & Data`、`Human-Robot Safety`、`Actuator & Structure`

## 注意事项

- **请勿直接编辑 README.md**，它是生成产物，直接编辑的 PR 会被关闭
- 只收录可验证的专利：公开号必须能在 Google Patents 上查到，链接打不开的 PR 会被要求修正
- 每条专利一个文件，不要在别人的文件里追加
- README 会在合并后由 CI 自动重新生成（含专利全景脑图），无需手动更新
