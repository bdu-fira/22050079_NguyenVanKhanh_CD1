// src/App.jsx
import { BrowserRouter as Router, Routes, Route, Navigate, useLocation } from 'react-router-dom';
import { AuthProvider, useAuth } from './contexts/AuthContext';
import Header from './components/Header';
import LoginForm from './components/LoginForm';
import Register from './pages/Register';
import Home from './pages/Home';
import Booking from './pages/Booking';
import { CartProvider } from './contexts/CartContext';
import OrderHistory from './pages/OrderHistory';
import Contact from './pages/Contact';
// import './App.css';


function AppWrapper() {
  const { user, checking } = useAuth();
  const { pathname } = useLocation();

  if (checking) return <div>Đang xác thực…</div>;

  if (user && (pathname === '/login' || pathname === '/register')) {
    return <Navigate to="/" replace />;
  }
  if (!user && pathname !== '/login' && pathname !== '/register') {
    return <Navigate to="/login" replace />;
  }

  return (
    <>
      <Header />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<LoginForm />} />
        <Route path="/register" element={<Register />} />
        <Route path="/booking" element={<Booking />} />
        <Route path="/orderhistory" element={<OrderHistory />} />
        <Route path="/contact" element={<Contact />} />
      </Routes>
    </>
  );
}

export default function App() {
  return (
    <CartProvider>
      <AuthProvider>
        <Router>
          <AppWrapper />
        </Router>
      </AuthProvider>
    </CartProvider>
  );
}
