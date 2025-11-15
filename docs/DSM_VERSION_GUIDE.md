# DSM 版本使用指南

> **適用於**: Marvell Atlantic 驅動 (AQC100/107/108/109/111/112/113/114/115/116 系列)

## 📋 推薦版本（2025-11-15 更新）

| DSM 主版本 | 推薦使用版本 | Build Number | 狀態 |
|-----------|--------------|--------------|---------|
| **DSM 7.2** | 7.2.2-72806-4 | 72806-4 | ✅ 可用 |
| **DSM 7.3** | 7.3.1-86003 | 86003 | ⚠️ 工具鏈未釋出 |

## 🔍 版本相容性說明

### DSM 7.2 系列
```
可用版本：
├─ 7.2.2-72806-4  ✅ 推薦（最新）
├─ 7.2.2-72806-3  ✅ 相容
├─ 7.2.2-72806-2  ✅ 相容
├─ 7.2.2-72806-1  ✅ 相容
└─ 7.2.2-72806    ✅ 相容

共同特性：
- Kernel: 4.4.302
- 工具鏈: 7.2-72806 (gcc1220_glibc236)
- 驅動相容: 所有 7.2.x-72806-y 通用

關鍵原則：
⚠️ 工具鏈版本號是關鍵！
- 工具鏈 URL: https://archive.synology.com/download/ToolChain/toolchain/7.2-72806
- 所有 7.2.x-72806-y 版本使用相同工具鏈 (7.2-72806)
- 不是 7.2.x-72746 或其他 build number
```

### DSM 7.3 系列
```
可用版本：
├─ 7.3.1-86003  🚧 最新（工具鏈尚未釋出）
└─ 7.3-81180    🚧 工具鏈尚未釋出

預期特性：
- Kernel: 5.10.55 (待驗證)
- 工具鏈: ⚠️ 尚未公開
- 狀態: 無法構建

⚠️ DSM 7.3 構建狀態：
- 工具鏈 URL 不存在：
  ❌ https://archive.synology.com/download/ToolChain/toolchain/7.3-81180
  ❌ https://archive.synology.com/download/ToolChain/toolchain/7.3-86003
  ❌ https://archive.synology.com/download/ToolChain/toolchain/7.3.1-86003
- 建議：等待 Synology 正式釋出 DSM 7.3 工具鏈
```

## ⚠️ 重要原則

### ✅ 可以互通
相同 **build number** (72806) 的驅動**完全相容**：

| 構建版本 | 可用於 | 原因 |
|---------|--------|------|
| 7.2.2-72806-4 | 所有 7.2.x-72806-y | 工具鏈版本 7.2-72806 相同 |
| 7.2.2-72806-3 | 所有 7.2.x-72806-y | 工具鏈版本 7.2-72806 相同 |

⚠️ **重要**：不同 build number 不相容！
- 7.2.x-72806-y ≠ 7.2.x-72746-y （不同工具鏈）

### ❌ 不可互通
不同主版本或 build number 的驅動**不相容**：

| 構建版本 | 不可用於 | 原因 |
|---------|---------|------|
| 7.2.x-72806-y | 7.3.x-xxxxx | Kernel 不同 (4.4.302 vs 5.10.55) |
| 7.3.x-xxxxx | 7.2.x-72806-y | Kernel 不同 (5.10.55 vs 4.4.302) |
| 7.2.x-72806-y | 7.2.x-72746-y | 工具鏈 build number 不同 |

## 🎯 使用建議

### 場景 1: 生產環境 (DSM 7.2)
```yaml
# 使用最新穩定版構建
build_mode: preset
preset_model: "DS1821+ (v1000, DSM 7.2)"  # 使用 7.2.2-72806-4
```

**優點**：
- ✅ 最新安全更新
- ✅ 最佳穩定性
- ✅ 向下相容所有 7.2.x-72806-y

⚠️ **DSM 7.3 注意**：目前無法構建，等待工具鏈釋出

### 場景 2: 測試環境
```yaml
# 可以指定特定版本測試
build_mode: custom
dsm_ver_full: "7.2.2-72806-2"  # 測試舊版相容性
```

### 場景 3: 多版本部署
```yaml
# 一次構建，多版本使用
構建一次 7.2.2-72806-4：
└─ 可部署到 7.2.x-72806-y （所有相同 build number 的版本）
```

## 📊 版本驗證方法

### 方法 1: 檢查系統版本
```bash
# SSH 登入 NAS
cat /etc/VERSION

# 輸出範例：
# majorversion="7"
# minorversion="2"
# productversion="7.2.2"
# buildnumber="72806"
# smallfixnumber="4"
```

### 方法 2: 檢查 Kernel 版本
```bash
uname -r

# 輸出取決於 CPU 系列：
# v1000 (DSM 7.2)：4.4.302+
# v1000nk (DSM 7.3)：5.10.55+
# r1000 (DSM 7.2)：4.4.180+
# geminilake (DSM 7.2)：4.4.180+
```

### 方法 3: 檢查模組相容性
```bash
modinfo /lib/modules/$(uname -r)/atlantic.ko | grep vermagic

# 預期輸出取決於 CPU 系列：
# vermagic: 4.4.302+ SMP ... (v1000)
# vermagic: 5.10.55+ SMP ... (v1000nk)
# vermagic: 4.4.180+ SMP ... (r1000/geminilake)
```

## 🔄 版本更新策略

### 何時需要重新構建？

| 更新類型 | 需要重建？ | 說明 |
|---------|----------|------|
| 7.2.2-72806-3 → 7.2.2-72806-4 | ❌ 否 | 相同 build number，驅動通用 |
| 7.3-81180 → 7.3.1-86003 | ❌ 否 | 相同 CPU 系列 (v1000nk)，驅動通用 |
| 7.2.x → 7.3.x (相同機型) | ✅ 是 | CPU 系列變更 (v1000 → v1000nk)，Kernel 不同 |
| v1000 → v1000nk | ✅ 是 | Kernel 不同 (4.4.302 → 5.10.55)，必須重建 |

### 升級路徑建議

```
DSM 7.2 → DSM 7.3 升級流程：

1. 備份當前驅動設定
2. 升級 DSM 到 7.3.1-86003
3. 確認 CPU 系列變更 (例如：v1000 → v1000nk)
4. 重新構建驅動（選擇對應 CPU 系列的機型）
5. 安裝新驅動
6. 驗證網卡功能

⚠️ 注意：DSM 升級通常伴隨 CPU 系列 Kernel 變更
例如：DS1821+ 從 v1000 (4.4.302) 升級到 v1000nk (5.10.55)
```

## 📚 相關文件

- [Kernel 版本參考](KERNEL_VERSION_REFERENCE.md) - CPU 與 Kernel 對照表
- [工作流維護](WORKFLOW_MAINTENANCE.md) - CI/CD 維護指南
- [文件索引](README.md) - 套件命名格式說明

## 🔗 官方資源

- [Synology 下載中心](https://archive.synology.com/download/Os/DSM)
- [工具鏈下載](https://archive.synology.com/download/ToolChain/toolchain/)
- [GPL Source](https://archive.synology.com/download/ToolChain/Synology%20NAS%20GPL%20Source/)

---

**最後更新**: 2025-11-15  
**適用範圍**: DSM 7.2.x / 7.3.x  
**維護者**: VM8gkAs
