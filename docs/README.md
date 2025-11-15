# 文件索引

本目錄包含 Synology Marvell Atlantic 驅動 (AQC 系列) SPK 專案的技術文件。

## 📚 文件清單

### 核心文件

| 文件 | 說明 | 適用對象 |
|------|------|----------|
| [DSM_VERSION_GUIDE.md](./DSM_VERSION_GUIDE.md) | ⭐ DSM 版本使用與相容性指南 | 所有使用者 |
| [WORKFLOW_MAINTENANCE.md](./WORKFLOW_MAINTENANCE.md) | Workflow 維護與共用程式碼策略 | 維護者、開發者 |
| [KERNEL_VERSION_REFERENCE.md](./KERNEL_VERSION_REFERENCE.md) | CPU/Kernel 版本對照表 | 使用者、開發者 |

---

## 📦 套件命名格式

```
atlantic-{driver_ver}-{dsm_ver}-{cpu}_{rev}.spk

範例：atlantic-2.5.12-7.2-72806-v1000_1.spk
```

| 元件 | 說明 | 範例 |
|------|------|------|
| `atlantic` | 驅動名稱 | atlantic |
| `{driver_ver}` | 驅動版本 | 2.5.12 |
| `{dsm_ver}` | DSM 版本 (主版本-build) | 7.2-72806 |
| `{cpu}` | CPU 系列 | v1000, v1000nk, r1000 |
| `{rev}` | 修訂版本 | 1, 2, 3... |

**用途**：從檔名即可辨識適用的 DSM 版本、CPU 系列和驅動版本

---

## 🎯 快速導航

| 目的 | 文件 |
|------|------|
| ❓ 選擇 DSM 版本 | [DSM_VERSION_GUIDE.md](./DSM_VERSION_GUIDE.md) ⭐ |
| 📦 確認機型相容性 | [KERNEL_VERSION_REFERENCE.md](./KERNEL_VERSION_REFERENCE.md) |
| 🔧 維護 Workflow | [WORKFLOW_MAINTENANCE.md](./WORKFLOW_MAINTENANCE.md) |
| 🚀 擴展新機型 | 依序閱讀上述文件 |

---

## 📊 專案資訊

- **支援網卡**: Marvell AQC100/107/108/109/111/112/113/114/115/116 系列
- **目標機型**: DS1821+ (V1000, Kernel 4.4.302) 等
- **DSM 版本**: 7.2.2-72806-4 (最新穩定版)
- **驅動版本**: Marvell Atlantic 2.5.12
- **支援 DSM**: 7.2.x / 7.3.x



---

## 🔗 參考連結

- [Synology Toolchain](https://archive.synology.com/download/ToolChain) | [Marvell 驅動](https://www.marvell.com/support/downloads.html) | [spksrc](https://github.com/SynoCommunity/spksrc)

**最後更新**: 2025-11-15 | **維護**: VM8gkAs
