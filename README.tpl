#!yaml-readme -p data/*.yaml --output README.md --group-by kind

{{- $icons := dict "Locomotion" "🦿" "Dexterous Manipulation" "🤏" "VLA Model" "🧠" "Tactile Sensing" "👆" "Navigation & SLAM" "🧭" "Sim2Real & Data" "🎲" "Human-Robot Safety" "🛡️" "Actuator & Structure" "⚙️" "Inspection Robotics" "🔎"}}
{{- $descs := dict "Locomotion" "运动控制与平衡：步态规划、全身控制、动态平衡" "Dexterous Manipulation" "灵巧手与操作：抓取、柔性操作、多指控制" "VLA Model" "具身大模型与 VLA：视觉-语言-动作策略、任务规划" "Tactile Sensing" "触觉与传感：触觉皮肤、力觉感知、多模态传感" "Navigation & SLAM" "导航与 SLAM：定位建图、路径规划、场景理解" "Sim2Real & Data" "仿真训练与数据合成：sim2real 迁移、数据采集与蒸馏" "Human-Robot Safety" "人机交互与安全：碰撞检测、柔顺控制、安全策略" "Actuator & Structure" "关节执行器与结构：关节模组、准直驱、整机结构" "Inspection Robotics" "巡检机器人：电力、轨道、隧道、化工等场景的巡检系统与装置"}}
{{- $total := 0}}
{{- range $key, $val := .}}
{{- $total = add $total (len $val)}}
{{- end}}
<div align="center">

# 📜 Awesome Patent

**具身智能（Embodied AI）专利精选：按技术领域与公司两个维度收录人形机器人、操作大模型、灵巧手等方向的代表性专利，持续更新**

[![Stars](https://img.shields.io/github/stars/LinuxSuRen/awesome-patent?style=flat-square)](https://github.com/LinuxSuRen/awesome-patent/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/LinuxSuRen/awesome-patent?style=flat-square)](https://github.com/LinuxSuRen/awesome-patent/commits)
[![Patents](https://img.shields.io/github/badge/patents-{{$total}}-blue?style=flat-square)](#目录)
[![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square)](CONTRIBUTING.md)

</div>

## 专利全景脑图

{{printMindmap . "具身智能专利" "name" "creator"}}

## 目录

{{- range $key, $val := .}}
- {{index $icons $key}} [{{$key}}](#{{lower $key | replace " " "-" | replace "&" ""}})（{{len $val}}）
{{- end}}

{{range $key, $val := .}}
<a id="{{lower $key | replace " " "-" | replace "&" ""}}"></a>
## {{index $icons $key}} {{$key}}({{len $val}})

> {{index $descs $key}}

| Patent | Number | Company | Year |
|---|---|---|---|
{{- range $item := $val}}
| [{{$item.name}}]({{$item.link}}) | {{$item.number}} | {{$item.creator}} | {{if $item.year}}{{$item.year}}{{end}} |
{{- end}}
{{end}}

{{printStarHistory "linuxsuren" "awesome-patent"}}

## Contribution

欢迎推荐新的专利，步骤与字段规范见 [CONTRIBUTING.md](CONTRIBUTING.md)。要点：

1. 在 [data](data) 目录新增一个 YAML 文件（如 `data/unitree-locomotion-1.yaml`），**请勿直接编辑 README.md**
2. `kind` 请使用现有技术领域分类，README 由 [generator workflow](.github/workflows/generator.yaml) 自动重新生成
