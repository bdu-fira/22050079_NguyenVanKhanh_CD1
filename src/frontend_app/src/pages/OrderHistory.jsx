// src/pages/OrderHistory.jsx
import React, { useEffect, useState } from 'react';
import OrderDetailModal from '../components/OrderHistory/OrderDetailModal';
import api from '../api/axios';
import { useAuth } from '../contexts/AuthContext';

export default function OrderHistory() {
  const { user } = useAuth();
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [selectedOrder, setSelectedOrder] = useState(null);

  useEffect(() => {
    setLoading(true);
    api.get('/api/api/orders/')
      .then(res => {
        setOrders(res.data.results);
        setLoading(false);
      })
      .catch(err => {
        console.error('Error fetching orders:', err);
        setError('Không thể tải lịch sử đơn hàng.');
        setLoading(false);
      });
  }, [user]);

  const refreshOrders = () => {
    api.get('/api/api/orders/')
      .then(res => setOrders(res.data.results))
      .catch(err => console.error(err));
  };

  const handleCloseModal = () => {
    setSelectedOrder(null);
    refreshOrders();
  };

  if (loading) return <p>Đang tải...</p>;
  if (error) return <p className="text-red-500">{error}</p>;

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-2xl font-bold mb-4">Lịch sử đơn hàng</h1>
      <div className="overflow-x-auto bg-white rounded-lg shadow">
        <table className="min-w-full text-left">
          <thead className="bg-gray-100">
            <tr>
              <th className="py-2 px-4">Mã đơn</th>
              <th className="py-2 px-4">Ngày đặt</th>
              <th className="py-2 px-4">Giờ đặt</th>
              <th className="py-2 px-4">Bàn</th>
              <th className="py-2 px-4">Trạng thái</th>
              <th className="py-2 px-4">Tổng tiền</th>
              <th className="py-2 px-4">Hành động</th>
            </tr>
          </thead>
          <tbody>
            {orders.length > 0 ? (
              orders.map(order => (
                <tr key={order.id} className="border-t">
                  <td className="py-2 px-4">{order.id}</td>
                  <td className="py-2 px-4">{order.date}</td>
                  <td className="py-2 px-4">{order.time}</td>
                  <td className="py-2 px-4">{order.table?.name || '—'}</td>
                  <td className="py-2 px-4 uppercase">{order.status}</td>
                  <td className="py-2 px-4 text-right">{order.total.toLocaleString()} VND</td>
                  <td className="py-2 px-4">
                    <button
                      className="text-blue-600 hover:underline"
                      onClick={() => setSelectedOrder(order)}
                    >Xem</button>
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td className="py-4 px-4 text-center" colSpan={7}>
                  Bạn chưa có đơn hàng nào.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      {selectedOrder && (
        <OrderDetailModal
          order={selectedOrder}
          onClose={handleCloseModal}
        />
      )}
    </div>
  );
}