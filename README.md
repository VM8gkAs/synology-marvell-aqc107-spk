# Synology Marvell AQC107 Driver SPK

本倉庫提供了一個完整的 GitHub Actions 流程，自動：

1. 下載並解壓 Synology 官方交叉編譯工具鏈與內核原始碼  
2. 下載並編譯 Marvell AQC107 (atlantic) 驅動模組  
3. 使用 Synology 官方 spksrc 框架，將編譯好的 `atlantic.ko` 打包成 DSM 原生 SPK 套件  
4. 將產物（`.ko` 與 `.spk`）作為 Actions Artifact 發布  

---

## 功能亮點

- **一鍵編譯 + 打包**  
  Push 或手動觸發就能跑完整流水線，無需本地搭建編譯環境  
- **自動產出可在「套件中心」安裝的 SPK**  
- **MIT 開源許可**，自由訂製、二次發布

---

## 目標支持

- DS1821+（DSM 7.2 / Linux 4.4.302）

---

## 快速開始

1. Fork 本倉庫  
2. 進入 Settings → Secrets，添加以下 Secrets（可選覆蓋環境變數）  
   - `DSM_TAG`  
   - `KERNEL_VER`  
   - …  
3. Push 到 `main` 分支，或手動在 Actions 面板觸發 “Build & Package Marvell AQC107 Driver”  
4. 編譯完成後，在對應的 Workflow Run 頁面下載 `.spk`，直接拖入 DSM「套件中心」→「手動安裝」

---

## 📚 文件說明

### 專案結構
- `.github/workflows/main.yml` - 核心 CI/CD 流程腳本  
- `packages/driver/atlantic/` - SPK 套件定義與元數據  
- `packages/cross/atlantic/` - 交叉編譯定義  
- `kernel-config-append/aqc107.cfg` - Kernel 配置  
- `patches/atlantic/2.5.12/` - 驅動相容性補丁  

### 技術文件
完整的技術文件請參閱 **[docs/](./docs/)** 目錄：

- **[Workflow 維護指南](./docs/WORKFLOW_MAINTENANCE.md)** - CI/CD 維護與共用程式碼管理策略
- **[Kernel 版本對照表](./docs/KERNEL_VERSION_REFERENCE.md)** - DSM CPU 與 Kernel 版本映射
- **[SPK 命名規範](./docs/NAMING_CONVENTION.md)** - 套件命名格式與發布建議

### 授權
- `LICENSE` - MIT License

---

## 貢獻&支持

歡迎提交 Issue、Pull Request，或在 Discussions 裡交流使用心得。  
如果你遇到任何相容性問題，也請在 Issue 中回饋，謝謝！
