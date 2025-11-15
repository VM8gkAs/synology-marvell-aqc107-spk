# Synology DSM Kernel 版本參考

## DSM 7.2 (Build 72806) Kernel 版本與 CPU 對照

### Linux 3.10.108 - 較舊 CPU 架構
- **Avoton** - Intel Atom C2xxx
- **Braswell** - Intel Celeron/Pentium N3xxx
- **Grantley** - Intel Xeon E5 v3/v4
- **Alpine/Alpine4k** - Annapurna Labs
- **Armada 38x** - Marvell
- **Monaco** - STMicroelectronics

### Linux 4.4.180 - 中期 CPU 架構
- **Apollolake** - Intel Celeron/Pentium J3xxx/J4xxx
- **Broadwell** - Intel Xeon D-1xxx

### Linux 4.4.302 - 主流 CPU 架構（本專案目標）
- **V1000** - AMD Ryzen V1500B ✅ **DS1821+, RS2821RP+, DS1621+**
- **r1000** - AMD Ryzen R1600
- **Broadwellnk** - Intel Xeon D (新版本)
- **Broadwellnkv2** - Intel Xeon D (v2)
- **Broadwellntbap** - Intel Xeon D (NTBAP)
- **Denverton** - Intel Atom C3xxx
- **GeminiLake** - Intel Celeron J4xxx
- **Purley** - Intel Xeon Scalable
- **Kvmx64/Kvmcloud** - 虛擬化平台
- **Armada 37xx** - Marvell
- **rtd1296** - Realtek

### Linux 5.10.55 - 最新 CPU 架構
- **v1000nk** - AMD Ryzen V1xxx (新版) ✅ **DS1825+, RS2825RP+**
- **r1000nk** - AMD Ryzen R1xxx (新版) ✅ **DS923+, DS723+, DS1522+**
- **geminilakenk** - Intel Celeron (新版) ✅ **DS423+, DS224+**
- **epyc7002** - AMD EPYC 7002 ✅ **SA6400**
- **rtd1619b** - Realtek ✅ **DS124, DS223, DS423**

## 重要發現

### 1. Kernel 版本命名規則
- **基礎版本**: 使用標準 CPU 架構名稱（如 v1000, r1000, geminilake）
- **新版本**: 後綴 `nk` 表示使用較新的 5.10 kernel（如 v1000nk, r1000nk）

### 2. 機型與 Kernel 對應
```
x21 系列 (2021) → Linux 4.4.302
├─ DS1821+  → v1000
├─ DS1621+  → v1000
└─ RS2821RP+ → v1000

x22 系列 (2022) → Linux 4.4.302 或 5.10.55
├─ RS822+   → v1000
└─ DS1522+  → r1000nk

x23 系列 (2023) → Linux 5.10.55
├─ DS923+   → r1000nk
├─ DS723+   → r1000nk
└─ DS423+   → geminilakenk

x24/x25 系列 (2024-2025) → Linux 5.10.55
├─ DS224+   → geminilakenk
├─ DS1825+  → v1000nk
└─ DS925+   → v1000nk
```

### 3. 驅動編譯建議

#### 目標機型：DS1821+ (DSM 7.2)
- **CPU 架構**: V1000 (AMD Ryzen V1500B)
- **Kernel 版本**: Linux 4.4.302
- **工具鏈**: v1000-gcc1220_glibc236_x86_64-GPL.txz
- **Kernel Source**: linux-4.4.x.txz

#### 若需支援較新機型（DS1825+, DS923+ 等）
- **CPU 架構**: v1000nk / r1000nk
- **Kernel 版本**: Linux 5.10.55
- **需要**: 額外的相容性調整和測試

## DSM 7.3 狀態

DSM 7.3 的 Kernel 版本尚未完全確認，建議：
1. 先完成 DSM 7.2 支援
2. 實際測試 DSM 7.3 系統確認 kernel 版本
3. 根據測試結果調整編譯參數

## 編譯步驟參考

```bash
# 1. 下載工具鏈（針對 DS1821+ / V1000）
TOOLCHAIN_URL="https://global.synologydownload.com/download/ToolChain/toolchain/7.2-72806/Intel%20x86%20Linux%204.4.302%20%28V1000%29/v1000-gcc1220_glibc236_x86_64-GPL.txz"

# 2. 下載 Kernel Source
KERNEL_SRC_URL="https://global.synologydownload.com/download/ToolChain/Synology%20NAS%20GPL%20Source/7.2-72806/v1000/linux-4.4.x.txz"

# 3. 編譯參數
ARCH=x86
KERNEL_VER=4.4.302
CPU_SERIES=v1000
```

## 參考資源

- [Synology 工具鏈下載](https://archive.synology.com/download/ToolChain/toolchain/)
- [Synology GPL Source](https://archive.synology.com/download/ToolChain/Synology%20NAS%20GPL%20Source/)
- [CPU 規格查詢](https://kb.synology.com/en-global/DSM/tutorial/What_kind_of_CPU_does_my_NAS_have)

---

最後更新：2025-11-15
