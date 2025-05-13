import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';
import { API_BASE_URL } from '../config';
import api from '../api/axios';


export default function RegisterForm() {
  const [email, setEmail] = useState('');
  const [hoTen, setHoTen] = useState('');
  const [sdt, setSdt] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const navigate = useNavigate();

  const validateForm = () => {
    if (!email || !password || !confirmPassword || !hoTen || !sdt) {
      setError('Vui lòng điền đầy đủ thông tin');
      return false;
    }
    if (password !== confirmPassword) {
      setError('Mật khẩu không khớp');
      return false;
    }
    if (!/\S+@\S+\.\S+/.test(email)) {
      setError('Email không hợp lệ');
      return false;
    }
    if (!/^\d{9,11}$/.test(sdt)) {
      setError('Số điện thoại không hợp lệ');
      return false;
    }
    return true;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validateForm()) return;

    setLoading(true);
    setError('');

    // Chuyển sang payload trùng tên với serializer
    const payload = {
     username: email,
     email:    email,
     password: password,
     hoten:    hoTen,
     sdt:      sdt,
     vaitro:   3,
   };

    try {
      const response = await api.post(
        `/api/register/`,
        payload,
        {
          headers: {
            'Content-Type': 'application/json',
          },
        }
      );
      alert('Đăng ký thành công!');
      navigate('/login');
    } catch (err) {
      if (err.response) {
        console.error('Lỗi từ server:', err.response.data);
        // Lấy chi tiết thông báo lỗi từ serializer
        const data = err.response.data;
        // DRF có thể trả về { field: ["error"] } hoặc { detail: "..." }
        const detail = data.detail ||
                       Object.values(data).flat().join(' ') ||
                       'Đăng ký thất bại. Vui lòng thử lại.';
        setError(detail);
      } else {
        setError('Đã xảy ra lỗi. Vui lòng thử lại.');
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="max-w-md w-full mx-auto bg-white rounded-xl shadow-xl p-8 border border-gray-100">
      <h2 className="text-3xl font-bold text-center mb-8 text-gray-800">Đăng ký tài khoản</h2>
      <form onSubmit={handleSubmit} className="space-y-6">
        {error && (
          <div className="text-red-500 text-sm text-center mb-4">{error}</div>
        )}
        {/* Họ tên */}
        <div>
          <label className="block text-gray-700 text-sm font-semibold mb-2">Họ tên</label>
          <input
            type="text"
            value={hoTen}
            onChange={(e) => setHoTen(e.target.value)}
            className="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
            placeholder="Nhập họ tên"
          />
        </div>
        {/* Số điện thoại */}
        <div>
          <label className="block text-gray-700 text-sm font-semibold mb-2">Số điện thoại</label>
          <input
            type="tel"
            value={sdt}
            onChange={(e) => setSdt(e.target.value)}
            className="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
            placeholder="Nhập số điện thoại"
          />
        </div>
        {/* Email */}
        <div>
          <label className="block text-gray-700 text-sm font-semibold mb-2">Email</label>
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
            placeholder="Nhập email"
          />
        </div>
        {/* Mật khẩu */}
        <div>
          <label className="block text-gray-700 text-sm font-semibold mb-2">Mật khẩu</label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
            placeholder="Nhập mật khẩu (tối thiểu 6 ký tự)"
          />
        </div>
        {/* Xác nhận mật khẩu */}
        <div>
          <label className="block text-gray-700 text-sm font-semibold mb-2">Xác nhận mật khẩu</label>
          <input
            type="password"
            value={confirmPassword}
            onChange={(e) => setConfirmPassword(e.target.value)}
            className="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
            placeholder="Nhập lại mật khẩu"
          />
        </div>
        {/* Button đăng ký */}
        <button
          type="submit"
          disabled={loading}
          className="w-full bg-blue-600 text-white py-3 rounded-lg hover:bg-blue-700 transition duration-200 disabled:bg-blue-300 font-semibold"
        >
          {loading ? 'Đang xử lý...' : 'Đăng ký'}
        </button>
        {/* Link đăng nhập */}
        <div className="text-center text-sm text-gray-600 mt-4">
          Đã có tài khoản?{' '}
          <Link 
            to="/login" 
            className="text-amber-600 hover:text-amber-700 font-semibold underline"
          >
            Đăng nhập ngay
          </Link>
        </div>
        {/* Điều khoản sử dụng */}
        <p className="text-xs text-center text-gray-500 mt-6">
          Bằng việc tiếp tục, bạn đồng ý với{' '}
          <Link to="#" className="text-amber-600 hover:underline">
            Điều khoản sử dụng
          </Link>{' '}
          và{' '}
          <Link to="#" className="text-amber-600 hover:underline">
            Chính sách bảo mật
          </Link>
        </p>
      </form>
    </div>
  );
}












