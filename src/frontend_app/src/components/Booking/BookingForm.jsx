// src/components/Booking/BookingForm.jsx
import React, { useState, useMemo } from 'react';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';

// So sánh hai ngày
function isSameDate(d1, d2) {
  return (
    d1.getFullYear() === d2.getFullYear() &&
    d1.getMonth() === d2.getMonth() &&
    d1.getDate() === d2.getDate()
  );
}

export default function BookingForm({ onSubmit }) {
  const [formData, setFormData] = useState({
    date: new Date(),
    time: '',
    guests: 2,
    note: ''
  });

  const allTimes = ['11:00','12:00','13:00','18:00','19:00','20:00'];

  // Tính các khung giờ còn khả dụng dựa vào ngày đã chọn
  const availableTimes = useMemo(() => {
    const now = new Date();
    return allTimes.filter(t => {
      const [h, m] = t.split(':').map(Number);
      const slot = new Date(formData.date);
      slot.setHours(h, m, 0, 0);
      if (isSameDate(slot, now)) {
        return slot > now;
      }
      return true;
    });
  }, [formData.date]);

  // Khi thay đổi ngày, reset luôn khung giờ
  const handleDateChange = (date) => {
    setFormData(prev => ({ ...prev, date, time: '' }));
  };

  // Xử lý change chung
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  // Nút submit với validate
  const handleSubmit = (e) => {
    e.preventDefault();
    if (!formData.time) {
      alert('Vui lòng chọn khung giờ hợp lệ.');
      return;
    }
    onSubmit(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="max-w-lg mx-auto bg-white p-8 rounded-2xl shadow-xl border border-gray-100">
      <div className="text-center mb-8">
        <h2 className="text-2xl font-bold text-gray-800 mb-2">Đặt Bàn</h2>
        <p className="text-gray-500">Vui lòng điền thông tin đặt bàn của bạn</p>
      </div>

      <div className="space-y-6">
        {/* Date Picker */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Ngày đặt bàn</label>
          <DatePicker
            selected={formData.date}
            onChange={handleDateChange}
            minDate={new Date()}
            className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all"
            popperClassName="rounded-xl shadow-lg"
            dayClassName={date => 
              isSameDate(date, formData.date) 
                ? 'bg-amber-500 text-white rounded-full' 
                : 'hover:bg-gray-100 rounded-full'
            }
          />
        </div>

        {/* Time Select */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Khung giờ</label>
          <div className="relative">
            <select
              name="time"
              value={formData.time}
              onChange={handleChange}
              className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent appearance-none transition-all"
              required
            >
              {availableTimes.length > 0 ? (
                <>
                  <option value="">Chọn khung giờ...</option>
                  {availableTimes.map(t => (
                    <option key={t} value={t}>{t}</option>
                  ))}
                </>
              ) : (
                <option value="" disabled>Hết chỗ trống trong ngày</option>
              )}
            </select>
            <div className="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3">
              <svg className="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </div>
          </div>
        </div>

        {/* Guests Select */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Số lượng khách</label>
          <div className="relative">
            <select
              name="guests"
              value={formData.guests}
              onChange={handleChange}
              className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent appearance-none transition-all"
              required
            >
              {Array.from({ length: 10 }, (_, i) => i + 1).map(num => (
                <option key={num} value={num}>{num} {num > 1 ? 'người' : 'người'}</option>
              ))}
            </select>
            <div className="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3">
              <svg className="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </div>
          </div>
        </div>

        {/* Notes */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Yêu cầu đặc biệt</label>
          <textarea
            name="note"
            value={formData.note}
            onChange={handleChange}
            className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all"
            rows={3}
            placeholder="Ví dụ: Bàn góc yên tĩnh, yêu cầu về thức ăn..."
          />
        </div>

        {/* Submit Button */}
        <button
          type="submit"
          className="w-full py-4 bg-gradient-to-r from-amber-500 to-amber-600 text-white font-medium rounded-xl hover:shadow-lg hover:from-amber-600 hover:to-amber-700 transition-all"
        >
          Xác Nhận Đặt Bàn
        </button>
      </div>
    </form>
  );
}
