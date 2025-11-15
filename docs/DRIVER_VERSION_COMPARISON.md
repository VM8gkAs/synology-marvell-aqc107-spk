# Atlantic 驅動版本比較

## 版本資訊

| 項目 | v2.4.3 (舊版) | v2.5.6 | v2.5.12 (目標) |
|------|--------------|--------|----------------|
| 版本號 | 2.4.3.0 | 2.5.6.0 | 2.5.12.0 |
| Kernel | 4.4.302+ | 4.4.302+ | 4.4.302+ |
| 來源 | DSM 7.2 | - | Marvell 官方 |
| 相依性 | crc-itu-t | crc-itu-t | crc-itu-t |

## 支援的硬體 (PCI ID)

### v2.4.3 支援的裝置
```
- AQC107: D107 (07B1 特定 subsystem)
- 限定 Synology 專用版本 (subsystem: 7053:1001, 7053:1009)
```

### v2.5.6+ 支援的裝置
```
完整 AQC 系列支援：
- AQC100/107/108/109 (D100/D107/D108/D109)
- AQC111/112 (07B1/08B1/09B1/11B1/12B1 等)
- AQC113/114/115/116 (11C0/12C0/14C0/34C0 等)
- 通用支援 (不限定 subsystem)
```

**重要差異：** v2.5.6+ 移除了 Synology subsystem 限制，支援所有 AQC 系列網卡！

## 韌體檔案變更

| 版本 | 韌體路徑 | 說明 |
|------|----------|------|
| v2.4.3 | aquantia/*.fw | 內建於驅動或硬體 |
| v2.5.6+ | mrvl/*.fw | 選擇性載入 |

**重要：** AQC107/108/109 系列網卡**硬體內建固件**，驅動會嘗試載入外部固件檔案但失敗時會自動使用晶片內建固件，不影響網卡運作。

## 新增功能 (v2.5.6+)

### 新增參數
```bash
debug              # 除錯訊息等級
sleep_delay        # 睡眠延遲設定
aq_ptp_gpio_hightime  # PTP GPIO 高電平時間
```

### 移除參數
```bash
aq_new_filters_enabled  # 新 RX 過濾器（v2.4.3 有，v2.5.6 移除）
syno_monitor_limit      # Synology 監控限制（v2.4.3 有，v2.5.6 移除）
```

## 關鍵發現

### 1. Synology 客製化移除
v2.4.3 包含 Synology 特定參數：
- `syno_monitor_limit` - Synology 監控功能
- PCI subsystem 限制 (7053:1001, 7053:1009)

v2.5.6+ 為**通用版本**，移除所有 Synology 專屬修改。

### 2. 硬體相容性提升
- **v2.4.3**: 僅支援特定 Synology OEM 版本網卡
- **v2.5.6+**: 支援**所有** Marvell AQC 系列網卡

### 3. 韌體載入機制
AQC 系列網卡**硬體內建固件** (Flash ROM)：
- 驅動會嘗試從 `/lib/firmware/mrvl/*.fw` 載入更新固件
- 若檔案不存在，自動使用晶片內建固件
- 不影響網卡基本功能，僅 `dmesg` 顯示 warning
- 外部固件通常包含最新 bug 修正和效能改進

## 建議

### 使用 v2.5.12 的理由
1. ✅ 支援完整 AQC 系列 (不限 Synology OEM)
2. ✅ 最新錯誤修復和性能改進
3. ✅ Marvell 官方維護版本
4. ✅ 更好的硬體相容性

### 潛在問題
1. ⚠️ 移除 Synology 監控整合（不影響基本功能）
2. ℹ️ 韌體檔案非必需（網卡使用內建固件）
3. ⚠️ 建議在實際硬體上測試確認相容性

## 驗證方法

```bash
# 查看當前驅動版本
modinfo /lib/modules/atlantic.ko | grep version

# 查看支援的硬體
modinfo /lib/modules/atlantic.ko | grep alias

# 查看韌體需求
modinfo /lib/modules/atlantic.ko | grep firmware

# 查看依賴
modinfo /lib/modules/atlantic.ko | grep depends

# 查看 Kernel 相容性
modinfo /lib/modules/atlantic.ko | grep vermagic
```

## 參考資料

- Marvell 官方驅動下載: https://www.marvell.com/support/downloads.html
- Linux Kernel AQC 驅動文檔: https://www.kernel.org/doc/html/latest/networking/device_drivers/ethernet/aquantia/atlantic.html
