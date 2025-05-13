// src/components/OrderHistory/OrderDetailModal.jsx
import React, { useState, useEffect } from 'react';
import api from '../../api/axios';

export default function OrderDetailModal({ order, onClose }) {
  const [tables, setTables] = useState([]);
  const [tableId, setTableId] = useState(order.table?.ID);
  const [items, setItems] = useState(order.items || []);
  const [editableTable, setEditableTable] = useState(false);
  const [editableItems, setEditableItems] = useState(false);

  useEffect(() => {
    api.get('/api/ban-theo-khung/', { params: { ngay: order.date, gio: order.time } })
      .then(res => setTables(res.data.results))
      .catch(console.error);

    const now = new Date();
    const orderDate = new Date(`${order.date}T${order.time}`);
    const hoursDiff = (orderDate - now) / (1000 * 3600);
    setEditableTable(order.status === 'PAID' && hoursDiff >= 24);
    setEditableItems(order.status === 'PAID' && hoursDiff >= 6);
  }, [order]);

  const handleCancel = async () => {
    try {
      const res = await api.post(`/api/api/orders/${order.id}/cancel/`);
      alert(`Bạn sẽ được hoàn ${res.data.results.refund_amount.toLocaleString()} VND`);
      onClose();
    } catch (err) {
      console.error(err);
      alert('Hủy đơn thất bại');
    }
  };

  const handleSave = async () => {
    try {
      await api.put(`/api/api/orders/${order.id}/`, { table_id: tableId, items: items.map(i => ({ id: i.id, quantity: i.quantity })) });
      alert('Cập nhật thành công');
      onClose();
    } catch (err) {
      console.error(err);
      alert('Cập nhật thất bại');
    }
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-lg shadow-lg w-full max-w-2xl p-6 relative">
        <button className="absolute top-3 right-3 text-gray-600 hover:text-black text-xl" onClick={onClose}>×</button>
        <h2 className="text-xl font-bold mb-4">Chi tiết đơn #{order.id}</h2>

        <div className="mb-4">
          <strong>Bàn đã chọn:</strong>{' '}
          {editableTable ? (
            <select value={tableId} onChange={e => setTableId(e.target.value)} className="border p-1 ml-2">
              {tables.map(t => <option key={t.ID} value={t.ID}>{t.TenBan}</option>)}
            </select>
          ) : (
            order.table?.name
          )}
        </div>

        <div className="mb-4">
          <strong>Món đã chọn:</strong>
          <div className="mt-2 space-y-2 max-h-60 overflow-y-auto">
            {items.length > 0 ? items.map((item, idx) => (
              <div key={idx} className="flex justify-between items-center">
                <span>{item.name}</span>
                <div className="flex items-center space-x-4">
                  {editableItems ? (
                    <input type="number" min={1} value={item.quantity}
                      onChange={e => setItems(prev => prev.map(it => it.id === item.id ? { ...it, quantity: parseInt(e.target.value) || 1 } : it))}
                      className="w-16 border p-1" />
                  ) : (
                    <span>x{item.quantity}</span>
                  )}
                  <span>{(item.price * item.quantity).toLocaleString()} VND</span>
                </div>
              </div>
            )) : (
              <p>Không có món</p>
            )}
          </div>
        </div>

        <div className="mt-6 flex justify-end space-x-4">
          {(editableTable || editableItems) && (
            <button onClick={handleSave} className="bg-green-500 text-white px-4 py-2 rounded">Lưu thay đổi</button>
          )}
          {order.status === 'PAID' && (
            <button onClick={handleCancel} className="bg-red-500 text-white px-4 py-2 rounded">Hủy đơn và hoàn tiền</button>
          )}
        </div>
      </div>
    </div>
  );
}
