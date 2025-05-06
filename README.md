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

