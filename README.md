# cloud_hw4


這是一個簡單的 Docker 專案，展示如何透過 GitHub Actions 自動建構與部署 Docker 映像檔至 Docker Hub。

---

## 🔨 如何打包你的應用程式（`docker build`）

```bash
docker build -t cloud_hw4 .
```

這個指令會產生一個名為 `cloud_hw4` 的本地映像檔。
## 如何運行 Container（`docker run`）

```bash
docker run --rm cloud_hw4
```

執行後會在終端機顯示：

```bash
Hello from 2025cloud container!
```

## ⚙️ 自動化建置與部署流程（GitHub Actions）

我們使用 GitHub Actions 進行 CI/CD，自動建置並推送映像檔至 Docker Hub。以下是整體流程圖與說明：

### 流程圖
```markdown
     git push / pull request
               │
               ▼
        GitHub Actions 啟動
               │
    ┌──────────┴──────────┐
    ▼                     ▼
  Build Docker        Dockerfile 驗證
    │                     │
    ▼                     ▼
  Push 到 Docker Hub   驗證錯誤會阻擋合併
    │
    ▼
  Image 在 Hub 上更新成功

```

### 實作內容說明：
1. 每次 push 到 `main` 或建立 PR 時，會自動觸發工作流程。

2. 使用者無需手動打包，只需提交程式碼，即可自動完成：

    - 建置 Docker Image
    - 登入 Docker Hub
    - 推送至 Repo：`wayneyang7021/2025cloud`

## 🏷️ Image Tag 的設計邏輯

我們目前採用以下策略進行 tag 命名：

| Tag 名稱 | 說明 |
|----------|------|
| `latest` | 預設推送的 tag，對應 main branch |
| `nginx`  | 測試用 image tag（已手動上傳） |
| `alpine` | 測試用 image tag（已手動上傳） |
| `v0.1.0` | 可選版本號，日後可配合 Release 使用 |

> 🔧 **原則：** 相同的 image tag 不應該被覆蓋為不同內容（**Immutable Tag**）。若需修改內容，應更新為新 tag（例如 `v0.1.1`）。

---

## ✅ 什麼情況會產生 Docker Image / Tag？

| 觸發條件                     | 結果                                      |
|------------------------------|-------------------------------------------|
| push 到 `main`               | 自動建構並產生 `latest` tag              |
| 建立 PR 並被合併            | 可選擇產生版本 tag（如 `v0.1.0`）        |
| 手動 tag + push             | 可依需求自定義版本名稱與格式            |
| 測試錯誤（如壞 Dockerfile） | ❌ CI 失敗，**不會**產生任何 Image Tag   |

這樣的流程設計可以確保每次部署的版本都是**可追蹤**且**一致的**，有助於團隊協作與版本控管。




