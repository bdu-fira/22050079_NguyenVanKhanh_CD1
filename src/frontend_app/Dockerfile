# Sử dụng Node.js 18 Alpine
FROM node:18-alpine

# Tạo thư mục làm việc
WORKDIR /app

# Copy và cài dependencies
COPY package*.json ./
RUN npm install

# Copy toàn bộ mã nguồn
COPY . ./

# Expose cổng Vite
EXPOSE 5173

# Chạy Vite dev server cho phép truy cập ngoài
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]