 
Hướng dẫn khởi động dự án
[backend sử dụng Django.
frontend sử dụng React + Vite.]

1. Tạo cơ sở dữ liệu

 Trên MySQL, chạy lệnh:

  CREATE DATABASE IF NOT EXISTS `datbandb3`;
  
  Hoặc bạn có thể tự tạo database với tên bất kỳ, sau đó sửa lại tên trong file `.env` cho phù hợp.

  Vào file `.env` sửa lại cho đúng tên người dùng csdl.

2. Nhập dữ liệu

 Import file dump `datbandb3_full.sql` (bao gồm cấu trúc và dữ liệu) bằng thông tin MySQL của bạn:

   Lưu ý: file datbandb3_full.sql phải nằm trong thư mục hiện tại khi chạy lệnh hoặc dùng đường dẫn đầy đủ tới file
  `mysql -u <username> -p<password> datbandb3 < datbandb3_full.sql`
  
 Hoặc bạn có thể sử dụng giao diện đồ họa như MySQL Workbench, phpMyAdmin hoặc Adminer để nhập (import) file SQL một cách trực quan.

3. Backend

 vào thư mục `src`.
 Chuyển vào thư mục `backend_app`:

  `cd src/backend_app`
  
 Cài đặt dependencies (nếu chưa có):

  `pip install -r requirements.txt`
  
 Chạy server Django:

  `python manage.py runserver`
  

4. Frontend

 Chuyển vào thư mục frontend_app:

  `cd ../frontend_app`
  
 Cài đặt dependencies:

  `npm install`
  
 Chạy development server:


  `npm run dev`
  

5. Truy cập ứng dụng

 Mở trình duyệt và vào:

  
  `http://localhost:5173`
  

---
