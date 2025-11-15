# Workflow 維護指南

## 當前架構

**單一 Workflow + Matrix**（`main.yml`）

**優點：** 邏輯集中、修改統一、易除錯  
**適用：** < 1500 行、參數化差異、小團隊

---

## 何時分流？

| 條件 | 保持單一 | 需要分流 |
|------|---------|---------|
| 檔案長度 | < 1500 行 | > 1500 行 |
| 編譯邏輯 | 基本相同 | 差異很大 |
| Kernel 數量 | ≤ 3 個 | > 3 個 |
| 觸發條件 | 相同 | 不同 |

---

## 分流方案

### 方案 A：Reusable Workflow
```
_build-template.yml    # 共用邏輯
build-kernel-4.4.yml   # 配置
build-kernel-5.10.yml  # 配置
```
✅ 邏輯集中、配置獨立  
⚠️ 需理解 workflow_call

### 方案 B：Composite Actions
```
actions/
  setup-environment/
  download-toolchain/
  build-module/
```
✅ 高度模組化  
⚠️ 設定複雜、過度設計

### 方案 C：單一 Workflow（當前）
✅ 簡單直接、易維護  
⚠️ 檔案可能變長

---

## 決策建議

```
單一 Workflow (現在) → Reusable Workflow (中期) → Composite Actions (長期)
      ↑
  目前推薦
```

**當前階段：** 保持單一 workflow（支援 2 個 Kernel、邏輯相同、~800 行）

**中期目標：** 當超過 1500 行或支援 DSM 7.3+ 時，改用 Reusable Workflow

**長期願景：** 社群專案（10+ CPU、多人協作）時考慮 Composite Actions

---

## 維護檢查

**每次修改：**
- [ ] 測試所有 CPU 系列
- [ ] 更新文件
- [ ] 驗證 artifact 命名

**定期審查：**
- [ ] 檔案是否 > 1000 行？
- [ ] 可提取共用 script？
- [ ] 新 DSM 版本支援？

---

**參考：** [Kernel 對照表](./KERNEL_VERSION_REFERENCE.md) | [命名格式](./README.md#-套件命名格式)
