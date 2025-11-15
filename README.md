# Synology Marvell Atlantic Driver (AQC Series)

自動編譯並打包 **Marvell Atlantic 驅動程式** 為 Synology DSM 7.x SPK 套件。

## 支援網卡

完整支援 Marvell AQC 系列：
- **AQC100** - 1GbE
- **AQC107/108/109** - 10GbE/5GbE/2.5GbE
- **AQC111/112** - 5GbE/2.5GbE  
- **AQC113/114/115/116** - 最新多速率網卡
- **S/C 變體** - Server/OEM 版本

## 支援機型

透過 GitHub Actions 預設配置支援以下機型：

| 機型 | CPU | DSM | Kernel | 狀態 |
|------|-----|-----|--------|------|
| DS1621+ | v1000 | 7.2 | 4.4.302 | ✅ |
| DS1821+ | v1000 | 7.2 | 4.4.302 | ✅ |
| RS2821RP+ | v1000 | 7.2 | 4.4.302 | ✅ |
| DS1522+ | r1000nk | 7.3 | 5.10.55 | ⚠️ 工具鏈未釋出 |
| DS423+ | geminilakenk | 7.3 | 5.10.55 | ⚠️ 工具鏈未釋出 |
| DS723+ | r1000nk | 7.3 | 5.10.55 | ⚠️ 工具鏈未釋出 |
| DS923+ | r1000nk | 7.3 | 5.10.55 | ⚠️ 工具鏈未釋出 |
| DS224+ | geminilakenk | 7.3 | 5.10.55 | ⚠️ 工具鏈未釋出 |
| DS1825+ | v1000nk | 7.3 | 5.10.55 | ⚠️ 工具鏈未釋出 |
| DS925+ | v1000nk | 7.3 | 5.10.55 | ⚠️ 工具鏈未釋出 |

> ⚠️ DSM 7.3 工具鏈尚未由 Synology 正式釋出，相關機型暫時無法構建

## 快速開始

### 方法 1：使用預設配置（推薦）

1. Fork 本倉庫
2. 前往 **Actions** → **Build & Package Marvell Atlantic Driver**
3. 點擊 **Run workflow**
4. 選擇 **preset** 模式，選擇您的機型（例：DS1821+ (v1000, DSM 7.2)）
5. 執行完成後下載 `.spk` 檔案
6. 在 DSM **套件中心** → **手動安裝** 安裝

### 方法 2：自訂參數

如需指定 DSM 版本或機型組合：
1. 選擇 **custom** 模式
2. 填入對應參數（DSM 版本、機型、CPU 系列、架構）
3. 執行並下載

## 技術文件

- **[DSM 版本指南](./docs/DSM_VERSION_GUIDE.md)** - 版本選擇與相容性
- **[CPU/Kernel 對照](./docs/KERNEL_VERSION_REFERENCE.md)** - 機型與 Kernel 對應

## 專案結構

```
.github/workflows/main.yml  # CI/CD 流程
kernel-config-append/       # Kernel 配置
packages/                   # SPK 套件定義
patches/                    # 驅動相容性補丁
docs/                       # 技術文件
```

## 授權

MIT License - 自由使用、修改、發布

## 貢獻

歡迎提交 Issue 或 Pull Request！
