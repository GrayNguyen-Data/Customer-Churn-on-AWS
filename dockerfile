# 1. Sử dụng image cơ bản gọn nhẹ cho Python
FROM python:3.11-slim

# 2. Thiết lập thư mục làm việc bên trong container
WORKDIR /app

# 3. Sao chép file dependency (Tận dụng Docker caching)
COPY requirements.txt .

# 4. Cài đặt các thư viện cần thiết
RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    # Loại bỏ cache và danh sách apt để giữ image nhỏ gọn
    && rm -rf /root/.cache/pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 5. Sao chép toàn bộ mã nguồn của ứng dụng
# (Giả định code API FastAPI/Flask của bạn nằm trong thư mục /app)
COPY . .

# 6. Sao chép MÔ HÌNH ĐÃ HUẤN LUYỆN VÀO THƯ MỤC CỦA APP
# Giả sử mô hình của bạn đã được lưu ra file 'final_churn_model.pkl' 
# và cần được đặt tại /app/model/
# => Đảm bảo bạn có thư mục 'model' ở thư mục gốc project
COPY final_churn_model.pkl ./model/final_churn_model.pkl

# Đặt biến môi trường
# PYTHONUNBUFFERED=1: Đảm bảo log được hiển thị ngay lập tức (quan trọng khi deploy)
ENV PYTHONUNBUFFERED=1

# 7. Mở cổng cho FastAPI
EXPOSE 8000

# 8. Chạy ứng dụng FastAPI bằng uvicorn
# Thay thế 'your_module.main:app' bằng đường dẫn thực tế đến ứng dụng FastAPI của bạn
# Ví dụ: Nếu file main.py của bạn nằm ở thư mục gốc: main:app
# Nếu nằm ở thư mục src/api/: src.api.main:app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]