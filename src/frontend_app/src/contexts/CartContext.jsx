// src/contexts/CartContext.jsx
import React, { createContext, useContext, useState, useEffect } from 'react';

const CartContext = createContext();

export function CartProvider({ children }) {
  const [items, setItems] = useState([]);

  // Khi mount lần đầu, load từ localStorage
  useEffect(() => {
    const saved = localStorage.getItem('cart');
    if (saved) {
      try {
        setItems(JSON.parse(saved));
      } catch {
        setItems([]);
      }
    }
  }, []);

  // Mỗi khi items thay đổi thì lưu vào localStorage
  useEffect(() => {
    localStorage.setItem('cart', JSON.stringify(items));
  }, [items]);

  // Chuẩn hóa món ăn về đúng shape
  const normalize = (monAn) => ({
    id: monAn.ID,
    name: monAn.TenMon,
    image: monAn.HinhAnh,
    description: monAn.MoTa,
    price: monAn.Gia,
    quantity: 1,
  });

  // Thêm món
  const addItem = (monAn) => {
    setItems((cur) => {
      const idx = cur.findIndex((i) => i.id === monAn.ID);
      if (idx > -1) {
        const nxt = [...cur];
        nxt[idx].quantity += 1;
        return nxt;
      } else {
        return [...cur, normalize(monAn)];
      }
    });
  };

  // Xóa món
  const removeItem = (id) => {
    setItems((cur) => cur.filter((i) => i.id !== id));
  };

  // Clear toàn bộ giỏ
  const clearCart = () => {
    setItems([]);
    localStorage.removeItem('cart');
  };

  return (
    <CartContext.Provider value={{ items, addItem, removeItem, clearCart }}>
      {children}
    </CartContext.Provider>
  );
}

// Hook để dùng trong component
export function useCart() {
  return useContext(CartContext);
}
