import axios from 'axios';

// Cấu hình baseURL từ biến môi trường, nếu không có thì sử dụng mặc định
const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://127.0.0.1:8000' ;

// Tạo instance của axios
const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Thêm interceptor để tự động gửi token (Authorization Bearer Token) nếu có
api.interceptors.request.use((config) => {
  const accessToken = localStorage.getItem('access_token');  // Lấy access_token từ localStorage
  if (accessToken) {
    config.headers.Authorization = `Bearer ${accessToken}`;  // Đính kèm token vào header
  }
  return config;
});

export default api;
