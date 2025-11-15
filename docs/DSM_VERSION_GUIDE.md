# DSM 版本指南

> 適用於 Marvell Atlantic 驅動 (AQC 全系列)

## 推薦版本

| DSM | 版本 | Build | 狀態 |
|-----|------|-------|------|
| 7.2 | 7.2.2-72806-4 | 72806 | ✅ 可用 |
| 7.3 | 7.3.1-86003 | 86003 | ⚠️ 工具鏈未釋出 |

## 版本相容性

### DSM 7.2 系列
```
✅ 所有 7.2.x-72806-y 版本共用相同驅動
   - Kernel: 4.4.302
   - 工具鏈: 7.2-72806
   - 一次構建，所有 7.2.x-72806-y 可用
```

### DSM 7.3 系列
```
⚠️ 工具鏈尚未釋出，無法構建
   - Kernel: 5.10.55 (預期)
   - 需等待 Synology 釋出工具鏈
```

## 重要原則

### ✅ 相容：相同 build number
- 7.2.x-72806-y 驅動可用於所有 72806 版本
- 工具鏈版本決定相容性

### ❌ 不相容：不同 build/kernel
- 7.2.x-72806 ≠ 7.2.x-72746（不同工具鏈）
- 7.2.x ≠ 7.3.x（不同 Kernel）

## 檢查方法

```bash
# 查看系統版本
cat /etc/VERSION

# 查看 Kernel 版本
uname -r

# 查看模組相容性
modinfo /lib/modules/$(uname -r)/atlantic.ko | grep vermagic
```

## 升級注意

```
DSM 7.2 → 7.3 升級：
1. 備份驅動設定
2. 升級 DSM
3. 確認 CPU 系列變更（例：v1000 → v1000nk）
4. 重新構建對應版本驅動
5. 安裝並驗證
```

## 參考

- [CPU/Kernel 對照](KERNEL_VERSION_REFERENCE.md)
- [Synology 下載](https://archive.synology.com/download/Os/DSM)
- [工具鏈下載](https://archive.synology.com/download/ToolChain/toolchain/)
