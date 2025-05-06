FROM python:3.11-slim

# 設定工作目錄
WORKDIR /app

# 複製應用程式檔案
COPY app.py .

# 執行應用程式
CMD ["python", "app.py"]
