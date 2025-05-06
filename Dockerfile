# 模擬錯誤的 Dockerfile
FROM pythonn:3.11-bad   


# 設定工作目錄
WORKDIR /app

# 複製應用程式檔案
COPY app.py .

# 執行應用程式
CMD ["python", "app.py"]
