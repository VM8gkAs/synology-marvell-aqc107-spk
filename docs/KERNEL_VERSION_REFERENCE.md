# CPU/Kernel 版本對照

## DSM 7.2 (Kernel 4.4.302)
- **v1000** - AMD Ryzen V1xxx → DS1821+, DS1621+, RS2821RP+
- **r1000** - AMD Ryzen R1xxx
- **geminilake** - Intel Celeron J4xxx

## DSM 7.3 (Kernel 5.10.55)
- **v1000nk** - AMD Ryzen V1xxx (新版) → DS1825+, RS2825RP+, DS925+
- **r1000nk** - AMD Ryzen R1xxx (新版) → DS923+, DS723+, DS1522+
- **geminilakenk** - Intel Celeron (新版) → DS423+, DS224+
- **epyc7002** - AMD EPYC 7002 → SA6400

## 命名規則
- **基礎版本**: v1000, r1000, geminilake
- **新版本**: 後綴 `nk` = 使用 5.10 kernel

## 機型年代
```
2021 (x21): v1000 → 4.4.302
2022 (x22): v1000 或 r1000nk
2023 (x23): r1000nk/geminilakenk → 5.10.55
2024+ (x24/x25): v1000nk/r1000nk/geminilakenk → 5.10.55
```

## 參考
- [工具鏈下載](https://archive.synology.com/download/ToolChain/toolchain/)
- [CPU 規格查詢](https://kb.synology.com/en-global/DSM/tutorial/What_kind_of_CPU_does_my_NAS_have)
