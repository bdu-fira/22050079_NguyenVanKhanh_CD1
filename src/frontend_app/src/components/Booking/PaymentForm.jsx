// // src/components/Booking/PaymentForm.jsx
// import React, { useState } from 'react';

// export default function PaymentForm({ orderItems, onComplete }) {
//   const [paymentMethod, setPaymentMethod] = useState('');
//   const [isConfirmed, setIsConfirmed] = useState(false);

//   const totalAmount = orderItems.reduce((sum, item) => sum + item.price, 0);

//   const handleConfirm = () => {
//     if (!paymentMethod) {
//       alert('Vui lòng chọn phương thức thanh toán');
//       return;
//     }
//     setIsConfirmed(true);  // Chuyển qua bước nhập thông tin tài khoản
//   };

//   return (
//     <div className="max-w-lg mx-auto bg-white p-6 rounded-lg shadow">
//       <h2 className="text-2xl font-bold mb-6 text-center">Thanh toán</h2>

//       {/* Thông tin người đặt */}
//       <div className="mb-4">
//         <div className="font-medium">Thông tin người đặt:</div>
//         <div>Tên: <input type="text" defaultValue="Nguyễn Văn A" className="w-full p-2 border rounded" disabled /></div>
//         <div>Email: <input type="email" defaultValue="nguyenvana@example.com" className="w-full p-2 border rounded" disabled /></div>
//         <div>Điện thoại: <input type="text" defaultValue="0987654321" className="w-full p-2 border rounded" disabled /></div>
//       </div>

//       {/* Thông tin bàn đã chọn */}
//       <div className="mb-4">
//         <div className="font-medium">Bàn đã chọn:</div>
//         <div>{orderItems[0]?.name || 'Bàn 1'}</div>
//       </div>

//       {/* Danh sách món */}
//       <div className="mb-4">
//         <div className="font-medium">Danh sách món:</div>
//         <ul className="list-disc list-inside">
//           {orderItems.map((item, index) => (
//             <li key={index}>{item.name} - {item.price}₫</li>
//           ))}
//         </ul>
//       </div>

//       {/* Tổng tiền */}
//       <div className="mb-4">
//         <div className="font-medium">Tổng tiền:</div>
//         <div className="text-amber-600 font-bold text-lg">{totalAmount}₫</div>
//       </div>

//       {/* Phương thức thanh toán */}
//       <div className="mb-4">
//         <label className="block mb-1 font-medium">Phương thức thanh toán</label>
//         <select
//           className="w-full p-2 border rounded"
//           onChange={(e) => setPaymentMethod(e.target.value)}
//           value={paymentMethod}
//         >
//           <option value="">Chọn phương thức</option>
//           {/* <option value="Tiền mặt">Tiền mặt</option> */}
//           <option value="Chuyển khoản">Chuyển khoản</option>
//           <option value="Thẻ tín dụng">Thẻ tín dụng</option>
//         </select>
//       </div>

//       {/* Ghi chú */}
//       <div className="mb-6">
//         <label className="block mb-1 font-medium">Ghi chú</label>
//         <textarea className="w-full p-2 border rounded" rows="3" placeholder="Ghi chú thêm nếu có..."></textarea>
//       </div>

//       {/* Nút xác nhận */}
//       {!isConfirmed ? (
//         <button
//           onClick={handleConfirm}
//           className="w-full bg-amber-500 hover:bg-amber-600 text-white font-bold py-2 px-4 rounded"
//         >
//           Xác nhận thanh toán
//         </button>
//       ) : (
//         <div>
//           <h3 className="text-lg font-bold mb-4">Thông tin chuyển khoản</h3>
//           {/* Form nhập thông tin tài khoản (STK) */}
//           <div className="mb-4">
//             <div className="font-medium">Chủ tài khoản: Nguyễn Văn A</div>
//             <div className="font-medium">Số tài khoản: 1234567890</div>
//             <div className="font-medium">Ngân hàng: Ngân Hàng TMCP ABC</div>
//           </div>



//           <button
//             onClick={() => {
//               alert('Thanh toán thành công!');
//               onComplete();  // Hoàn thành đơn đặt bàn
//             }}
//             className="w-full bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded"
//           >
//             Hoàn tất thanh toán
//           </button>
//         </div>
//       )}
//     </div>
//   );
// }

















import React, { useState } from 'react';
import { useAuth } from '../../contexts/AuthContext';

export default function PaymentForm({ table, orderItems, onComplete }) {
  const { user } = useAuth();
  const [paymentMethod, setPaymentMethod] = useState('');
  const [isConfirmed, setIsConfirmed] = useState(false);

  const totalAmount = orderItems.reduce((sum, item) => sum + item.price * item.quantity, 0);

  const handleConfirm = () => {
    if (!paymentMethod) {
      alert('Vui lòng chọn phương thức thanh toán');
      return;
    }
    setIsConfirmed(true);
  };

  return (
    <div className="max-w-lg mx-auto bg-white p-6 rounded-lg shadow">
      <h2 className="text-2xl font-bold mb-6 text-center">Thanh toán</h2>

      <div className="mb-4">
        <div className="font-medium">Thông tin người đặt:</div>
        <input type="text" value={user?.hoTen || user?.username || ''} className="w-full p-2 border rounded mb-2" disabled />
        <input type="email" value={user?.email || ''} className="w-full p-2 border rounded mb-2" disabled />
        <input type="text" value={user?.sdt || ''} className="w-full p-2 border rounded" disabled />
      </div>

      <div className="mb-4">
        <div className="font-medium">Bàn đã chọn:</div>
        <div className="p-2 border rounded bg-gray-50">
          {table?.TenBan || table?.name || 'Chưa chọn bàn'}
        </div>
      </div>

      <div className="mb-4">
        <div className="font-medium">Danh sách món:</div>
        <ul className="list-disc list-inside">
          {orderItems.map((item, idx) => (
            <li key={idx}>
              {item.name} x{item.quantity} — {(item.price * item.quantity).toLocaleString()}₫
            </li>
          ))}
        </ul>
      </div>

      <div className="mb-4">
        <div className="font-medium">Tổng tiền:</div>
        <div className="text-amber-600 font-bold text-lg">{totalAmount.toLocaleString()}₫</div>
      </div>

      <div className="mb-4">
        <label className="block mb-1 font-medium">Phương thức thanh toán</label>
        <select
          className="w-full p-2 border rounded"
          value={paymentMethod}
          onChange={e => setPaymentMethod(e.target.value)}
        >
          <option value="">Chọn phương thức</option>
          <option value="Chuyển khoản">Chuyển khoản</option>
          <option value="Thẻ tín dụng">Thẻ tín dụng</option>
        </select>
      </div>

      <div className="mb-6">
        <label className="block mb-1 font-medium">Ghi chú</label>
        <textarea
          id="note"
          className="w-full p-2 border rounded"
          rows="3"
          placeholder="Ghi chú thêm nếu có..."
        />
      </div>

      {!isConfirmed ? (
        <button
          onClick={handleConfirm}
          className="w-full bg-amber-500 hover:bg-amber-600 text-white font-bold py-2 rounded"
        >
          Xác nhận thanh toán
        </button>
      ) : (
        <button
          onClick={() => {
            const note = document.getElementById('note').value;
            onComplete({ method: paymentMethod, note });
          }}
          className="w-full bg-green-500 hover:bg-green-600 text-white font-bold py-2 rounded"
        >
          Hoàn tất thanh toán
        </button>
      )}
    </div>
  );
}
