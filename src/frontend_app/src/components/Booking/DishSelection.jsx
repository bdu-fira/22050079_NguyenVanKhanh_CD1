// // src/components/Booking/DishSelection.jsx
// import { useState } from 'react';
// import FoodCard from '../FoodCard';

// export default function DishSelection({ menuItems, cartItems, onUpdateCart, onComplete }) {
//   const [useCartItems, setUseCartItems] = useState(false);

//   // Thêm món vào order (giỏ)
//   const addToOrder = (item) => {
//     const existing = cartItems.find(i => i.id === item.id);
//     if (existing) {
//       onUpdateCart(
//         cartItems.map(i =>
//           i.id === item.id ? { ...i, quantity: i.quantity + 1 } : i
//         )
//       );
//     } else {
//       onUpdateCart([...cartItems, { ...item, quantity: 1 }]);
//     }
//   };

//   // Xóa toàn bộ 1 món
//   const removeItem = (id) => {
//     onUpdateCart(cartItems.filter(i => i.id !== id));
//   };

//   // Tăng/Giảm số lượng
//   const changeQuantity = (id, delta) => {
//     onUpdateCart(
//       cartItems
//         .map(i => i.id === id ? { ...i, quantity: i.quantity + delta } : i)
//         .filter(i => i.quantity > 0)
//     );
//   };

//   // Lấy mảng để hiển thị: nếu đang xem giỏ thì show cartItems, ngược lại show menuItems
//   const menuToDisplay = useCartItems ? cartItems : menuItems;

//   return (
//     <div className="bg-white p-4 rounded-lg shadow">
//       {/* Danh sách món đã chọn */}
//       <div className="mb-8">
//         <h2 className="text-xl font-bold mb-4">Món đã chọn</h2>
//         {cartItems.length > 0 ? (
//           <div className="space-y-2">
//             {cartItems.map(item => (
//               <div
//                 key={item.id}
//                 className="flex justify-between items-center border-b py-2"
//               >
//                 <span>
//                   {item.name} — {item.price.toLocaleString()}đ x {item.quantity}
//                 </span>
//                 <div className="flex items-center space-x-2">
//                   <button
//                     onClick={() => changeQuantity(item.id, -1)}
//                     className="px-2 bg-gray-200 rounded"
//                   >
//                     -
//                   </button>
//                   <button
//                     onClick={() => changeQuantity(item.id, 1)}
//                     className="px-2 bg-gray-200 rounded"
//                   >
//                     +
//                   </button>
//                   <button
//                     onClick={() => removeItem(item.id)}
//                     className="text-red-500 hover:text-red-700"
//                   >
//                     Xóa
//                   </button>
//                 </div>
//               </div>
//             ))}
//           </div>
//         ) : (
//           <p className="text-gray-500">Chưa có món nào</p>
//         )}
//       </div>

//       {/* Chọn nguồn hiển thị */}
//       <div className="mb-4">
//         <label className="block text-sm font-medium mb-2">Chọn món từ:</label>
//         <div className="flex space-x-4">
//           <button
//             onClick={() => setUseCartItems(false)}
//             className={`p-2 rounded-md ${
//               !useCartItems ? 'bg-amber-500 text-white' : 'bg-gray-200 text-gray-700'
//             }`}
//           >
//             Thực đơn
//           </button>
//           <button
//             onClick={() => setUseCartItems(true)}
//             className={`p-2 rounded-md ${
//               useCartItems ? 'bg-amber-500 text-white' : 'bg-gray-200 text-gray-700'
//             }`}
//           >
//             Giỏ hàng
//           </button>
//         </div>
//       </div>

//       {/* Lưới món */}
//       <div>
//         <h2 className="text-xl font-bold mb-4">
//           Thêm món từ {useCartItems ? 'giỏ hàng' : 'thực đơn'}
//         </h2>
//         <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
//           {menuToDisplay.map(item => (
//             <FoodCard
//               key={item.id}
//               item={item}
//               onAddToCart={() => addToOrder(item)}
//             />
//           ))}
//         </div>
//       </div>

//       {/* Hoàn tất chọn món */}
//       <button
//         onClick={onComplete}
//         className="fixed bottom-6 right-6 bg-green-500 text-white px-6 py-3 rounded-full shadow-lg hover:bg-green-600"
//       >
//         Hoàn tất chọn món
//       </button>
//     </div>
//   );
// }






















/////////////////








// src/components/Booking/DishSelection.jsx
import { useState } from 'react';
import FoodCard from '../FoodCard';

export default function DishSelection({ menuItems, cartItems, onUpdateCart, onComplete }) {
  const [useCartItems, setUseCartItems] = useState(false);

  const addToOrder = (item) => {
    const existing = cartItems.find((i) => i.id === item.id);
    if (existing) {
      onUpdateCart(
        cartItems.map((i) =>
          i.id === item.id ? { ...i, quantity: i.quantity + 1 } : i
        )
      );
    } else {
      onUpdateCart([...cartItems, { ...item, quantity: 1 }]);
    }
  };

  const removeItem = (id) => {
    onUpdateCart(cartItems.filter((i) => i.id !== id));
  };

  const changeQuantity = (id, delta) => {
    onUpdateCart(
      cartItems
        .map((i) => (i.id === id ? { ...i, quantity: i.quantity + delta } : i))
        .filter((i) => i.quantity > 0)
    );
  };

  const menuToDisplay = useCartItems ? cartItems : menuItems;

  return (
    <div className="bg-white p-4 rounded-lg shadow">
      <div className="mb-8">
        <h2 className="text-xl font-bold mb-4">Món đã chọn</h2>
        {cartItems.length > 0 ? (
          <div className="space-y-2">
            {cartItems.map((item) => (
              <div
                key={item.id}
                className="flex justify-between items-center border-b py-2"
              >
                <span>
                  {item.name} — {item.price.toLocaleString()}đ x {item.quantity}
                </span>
                <div className="flex items-center space-x-2">
                  <button onClick={() => changeQuantity(item.id, -1)} className="px-2 bg-gray-200 rounded">-</button>
                  <button onClick={() => changeQuantity(item.id, 1)} className="px-2 bg-gray-200 rounded">+</button>
                  <button onClick={() => removeItem(item.id)} className="text-red-500 hover:text-red-700">Xóa</button>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <p className="text-gray-500">Chưa có món nào</p>
        )}
      </div>
      <div className="mb-4">
        <label className="block text-sm font-medium mb-2">Chọn món từ:</label>
        <div className="flex space-x-4">
          <button
            onClick={() => setUseCartItems(false)}
            className={`p-2 rounded-md ${!useCartItems ? 'bg-amber-500 text-white' : 'bg-gray-200 text-gray-700'}`}>
            Thực đơn
          </button>
          <button
            onClick={() => setUseCartItems(true)}
            className={`p-2 rounded-md ${useCartItems ? 'bg-amber-500 text-white' : 'bg-gray-200 text-gray-700'}`}>
            Giỏ hàng
          </button>
        </div>
      </div>
      <div>
        <h2 className="text-xl font-bold mb-4">
          Thêm món từ {useCartItems ? 'giỏ hàng' : 'thực đơn'}
        </h2>
        <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
          {menuToDisplay.map((item) => (
            <FoodCard key={item.id} item={item} onAddToCart={() => addToOrder(item)} />
          ))}
        </div>
      </div>
      <button
        onClick={onComplete}
        className="fixed bottom-6 right-6 bg-green-500 text-white px-6 py-3 rounded-full shadow-lg hover:bg-green-600"
      >
        Hoàn tất chọn món
      </button>
    </div>
  );
}
