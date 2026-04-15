# Sử dụng image chứa sẵn Ubuntu, Java, Android SDK và Flutter
FROM ghcr.io/cirruslabs/flutter:stable

# Cài đặt thêm một số công cụ cần thiết (nếu muốn)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Cấp quyền cho thư mục làm việc
WORKDIR /workspace