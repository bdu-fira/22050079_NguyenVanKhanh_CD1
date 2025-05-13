// src/contexts/AuthContext.jsx
import { createContext, useContext, useState, useEffect } from 'react';
import api from '../api/axios';

import { useCart } from './CartContext';  // import hook

const AuthContext = createContext();

export function AuthProvider({ children }) {
  const { clearCart } = useCart();  // lấy clearCart
  const [user, setUser] = useState(null);
  const [checking, setChecking] = useState(true);

  useEffect(() => {
    // Khi mount lần đầu, kiểm tra token + fetch user
    const init = async () => {
      const access = localStorage.getItem('access_token');
      const refresh = localStorage.getItem('refresh_token');
      if (access) {
        try {
          const { data } = await api.get('/api/me/');
          setUser(data);
        } catch {
          if (refresh) {
            try {
              const { data: r } = await api.post('/api/token/refresh/', { refresh });
              localStorage.setItem('access_token', r.access);
              const { data } = await api.get('/api/me/');
              setUser(data);
            } catch {
              localStorage.removeItem('access_token');
              localStorage.removeItem('refresh_token');
              setUser(null);
            }
          } else {
            localStorage.removeItem('access_token');
            setUser(null);
          }
        }
      }
      setChecking(false);
    };
    init();
  }, []);

  // Hàm logout
  const logout = () => {
    localStorage.removeItem('access_token');
    localStorage.removeItem('refresh_token');
    clearCart();                // xoá giỏ
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, setUser, checking, logout }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  return useContext(AuthContext);
}
