// src/pages/Booking.jsx
import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import BookingSteps from '../components/Booking/BookingSteps';
import BookingForm from '../components/Booking/BookingForm';
import RestaurantTableMap from '../components/Booking/RestaurantTableMap';
import DishSelection from '../components/Booking/DishSelection';
import PaymentForm from '../components/Booking/PaymentForm';
import { useCart } from '../contexts/CartContext';
import { useAuth } from '../contexts/AuthContext';
import api from '../api/axios';

export default function Booking() {
  const { items: cartItems, clearCart } = useCart();
  const { user } = useAuth();
  const location = useLocation();

  const [step, setStep] = useState(1);
  const [bookingInfo, setBookingInfo] = useState(null);
  const [selectedTable, setSelectedTable] = useState(null);
  const [orderItems, setOrderItems] = useState(cartItems);
  const [menuItems, setMenuItems] = useState([]);

  // Lấy danh sách món ăn từ backend, chuẩn hóa shape
  useEffect(() => {
    api.get('/api/monan/')
      .then(res => {
        const menus = res.data.map(m => ({
          id: m.ID,
          name: m.TenMon,
          image: m.HinhAnh,
          description: m.MoTa,
          price: m.Gia,
        }));
        setMenuItems(menus);
      })
      .catch(err => console.error('Lỗi khi fetch món ăn:', err));
  }, []);

  const handleInfoSubmit = data => {
    setBookingInfo(data);
    setStep(2);
  };

  const handleTableSelect = table => {
    if (table.isBooked) return;
    setSelectedTable(table);
    setStep(3);
  };

  const handleDishComplete = () => {
    setStep(4);
  };

  const handlePayment = async ({ method, note }) => {
    try {
      // Tạo DatBan
      const bookingPayload = {
        IDBan: selectedTable.ID,
        Ngay: bookingInfo.date.toISOString().split('T')[0],
        Gio: bookingInfo.time,
        SoNguoi: bookingInfo.guests,
        IDNguoiDung: user.id,
        TrangThai: 'Đã Xác Nhận',
      };
      const { data: bookingRes } = await api.post('/api/dat-ban/', bookingPayload);
      const bookingId = bookingRes.IDDatBan;

      // Tính tổng tiền
      const total = orderItems.reduce((sum, i) => sum + i.price * i.quantity, 0);

      // Tạo DonHang
      const orderPayload = {
        IDDatBan: bookingId,
        items: orderItems.map(i => ({
          IDMonAn: i.id,
          SoLuong: i.quantity,
          Gia: i.price,
        })),
        TongTien: total,
        GhiChu: note,
        PhuongThuc: method,
      };
      await api.post('/api/don-hang/', orderPayload);

      alert('Đặt bàn & thanh toán thành công!');
      clearCart();
      setStep(1);
      setOrderItems([]);
    } catch (err) {
      console.error('Lỗi thanh toán:', err.response?.data || err.message);
      alert('Thanh toán thất bại.');
    }
  };

  return (
    <div className="container mx-auto p-4 max-w-6xl">
      <BookingSteps currentStep={step} />

      {step === 1 && <BookingForm onSubmit={handleInfoSubmit} />}

      {step === 2 && bookingInfo && (
        <RestaurantTableMap
          date={bookingInfo.date}
          time={bookingInfo.time}
          onSelect={handleTableSelect}
        />
      )}

      {step === 3 && (
        <DishSelection
          menuItems={menuItems}
          cartItems={orderItems}
          onUpdateCart={setOrderItems}
          onComplete={handleDishComplete}
        />
      )}

      {step === 4 && (
        <PaymentForm
          table={selectedTable}
          orderItems={orderItems}
          onComplete={handlePayment}
        />
      )}
    </div>
  );
}
