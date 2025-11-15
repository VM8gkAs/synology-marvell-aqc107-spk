# GitHub 儲存庫重新命名指南

本專案已從 **AQC107 專用** 升級為支援 **完整 Marvell Atlantic (AQC 全系列)** 驅動程式。

## 📋 重新命名檢查清單

### ✅ 已完成的項目

- [x] 更新 README.md 標題和描述
- [x] 更新 GitHub Actions workflow 名稱
- [x] 更新 SPK 套件 displayname 和 description
- [x] 更新安裝/卸載腳本的訊息標題
- [x] 更新所有 GitHub URL 引用

### 🔄 需要手動執行的操作

#### 1. GitHub 儲存庫重新命名

**建議的新名稱：** `synology-atlantic-driver-spk`

**操作步驟：**

1. 前往 GitHub 儲存庫首頁
2. 點擊 **Settings**（設定）
3. 在 **General** 區段找到 **Repository name**
4. 將名稱從 `synology-marvell-aqc107-spk` 改為 `synology-atlantic-driver-spk`
5. 點擊 **Rename** 按鈕

**GitHub 會自動：**
- 設定從舊 URL 到新 URL 的重新導向
- 更新所有現有的 clone/fork 關聯
- 保留所有 Issues、PRs、Stars、Forks

#### 2. 更新本地儲存庫遠端 URL

```bash
# 查看當前遠端 URL
git remote -v

# 更新為新的儲存庫名稱
git remote set-url origin https://github.com/VM8gkAs/synology-atlantic-driver-spk.git

# 驗證更新
git remote -v
```

#### 3. 更新 GitHub Actions Secrets（如果有設定）

如果您在 Settings → Secrets 中有設定任何自訂變數，這些會自動保留，無需額外操作。

#### 4. 通知使用者（可選）

如果有其他人正在使用您的儲存庫：

1. **建立 Release** 說明重新命名和新功能
2. **更新 README** 添加遷移通知（已完成）
3. **在 Discussions 發布公告**（如果有啟用）

## 📝 命名變更對照表

| 項目 | 舊名稱 | 新名稱 |
|------|--------|--------|
| GitHub Repo | `synology-marvell-aqc107-spk` | `synology-atlantic-driver-spk` |
| README 標題 | Synology Marvell AQC107 Driver SPK | Synology Marvell Atlantic Driver (AQC Series) |
| Workflow 名稱 | Build & Package Marvell AQC107 2.5.12 Driver | Build & Package Marvell Atlantic Driver (AQC Series) |
| SPK Display Name | Marvell AQC107 Atlantic Driver | Marvell Atlantic Driver (AQC Series) |
| 支援範圍 | AQC107 單一型號 | AQC100/107/108/109/111/112/113/114/115/116 全系列 |

## 🎯 重新命名的理由

1. **更準確的描述**：驅動程式實際支援整個 AQC 系列，不只是 AQC107
2. **更好的可發現性**：使用者搜尋其他 AQC 型號時也能找到本專案
3. **避免誤解**：舊名稱可能讓使用者以為只支援 AQC107
4. **符合驅動命名**：Marvell 官方驅動名稱就是 "Atlantic"

## 🔗 相關連結

- [GitHub 官方文檔：重新命名儲存庫](https://docs.github.com/en/repositories/creating-and-managing-repositories/renaming-a-repository)
- [Marvell Atlantic 驅動下載](https://www.marvell.com/support/downloads.html)

## ⚠️ 注意事項

- GitHub 會保留舊 URL 的重新導向，但建議盡快更新所有連結
- 如果您有在其他地方（論壇、部落格等）分享過連結，建議一併更新
- CI/CD workflows 中的 GitHub URL 已自動更新為新名稱

---

**完成重新命名後，請刪除本檔案並提交最終更改。**
