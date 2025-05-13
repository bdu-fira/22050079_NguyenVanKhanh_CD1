import React, { useState, useEffect, useRef } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { FaUserCircle } from 'react-icons/fa';
import { HiHome, HiBookOpen, HiPhone } from 'react-icons/hi';
import Logo from './Logo';
import { useAuth } from '../contexts/AuthContext';

export default function Header() {
  const navigate = useNavigate();
  const { user, logout } = useAuth();
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const dropdownRef = useRef(null);
  const [isVisible, setIsVisible] = useState(true);
  const [lastScrollY, setLastScrollY] = useState(0);

  // Xử lý ẩn header khi scroll
  useEffect(() => {
    const handleScroll = () => {
      const currentScrollY = window.scrollY;
      
      if (currentScrollY > lastScrollY && currentScrollY > 100) { // Tăng ngưỡng scroll lên 100px
        setIsVisible(false);
      } else if (currentScrollY < lastScrollY || currentScrollY <= 50) {
        setIsVisible(true);
      }
      setLastScrollY(currentScrollY);
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, [lastScrollY]);

  // Xử lý click outside dropdown
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (dropdownRef.current && !dropdownRef.current.contains(e.target)) {
        setDropdownOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const navItems = [
    { path: '/', label: 'Trang chủ', icon: <HiHome className="mr-1" /> },
    { path: '/booking', label: 'Đặt bàn', icon: <HiBookOpen className="mr-1" /> },
    { path: '/contact', label: 'Liên hệ', icon: <HiPhone className="mr-1" /> },
    { path: '/orderhistory', label: 'Đơn đặt bàn', icon: <HiPhone className="mr-1" /> },
  ];

  const handleLogout = () => {
    logout();
    navigate('/login', { replace: true });
  };

  return (
    <header className={`
      bg-gradient-to-r from-violet-600 to-amber-400
      text-white shadow-lg sticky top-0 z-50 h-20
      transform transition-transform duration-300 ease-out
      ${isVisible ? 'translate-y-0' : '-translate-y-full'}
    `}>
      <div className="container mx-auto px-4 h-full">
        <div className="flex justify-between items-center h-full">
          {/* Logo với hiệu ứng xoay */}
          <div 
            className="cursor-pointer transition-all duration-500 hover:rotate-[360deg] hover:scale-105"
            onClick={() => navigate('/')}
          >
            <Logo className="h-12 w-auto" />
          </div>

          {/* Navigation links - căn giữa màn hình */}
          <nav className="hidden md:flex absolute left-1/2 -translate-x-1/2 items-center space-x-6">
            {navItems.map((item) => (
              <div
                key={item.path}
                className="flex items-center px-4 py-2 rounded-lg cursor-pointer 
                  transition-all hover:bg-white/20 backdrop-blur-sm
                  hover:scale-105 group"
                onClick={() => navigate(item.path)}
              >
                {React.cloneElement(item.icon, { 
                  className: "mr-2 text-amber-100 group-hover:text-white transition-colors" 
                })}
                <span className="font-medium tracking-wide text-amber-50 group-hover:text-white">
                  {item.label}
                </span>
              </div>
            ))}
          </nav>

          {/* Profile dropdown */}
          <div className="relative" ref={dropdownRef}>
            {user ? (
              <>
                <button
                  onClick={() => setDropdownOpen(o => !o)}
                  className="cursor-pointer transition-transform hover:scale-110"
                >
                  <FaUserCircle className="text-3xl text-amber-50 hover:text-white transition-colors" />
                </button>

                {dropdownOpen && (
                  <div className="absolute right-0 mt-2 w-48 bg-white/95 text-gray-800 rounded-lg shadow-xl overflow-hidden backdrop-blur-sm">
                    <div className="px-4 py-3 border-b border-amber-100">
                      <p className="text-xs text-gray-500">Đăng nhập với</p>
                      <p className="font-semibold truncate text-amber-600">
                        {user.username || user.email}
                      </p>
                    </div>
                    <button
                      onClick={handleLogout}
                      className="w-full text-left px-4 py-3 hover:bg-amber-50/80 transition-colors text-whitewhite"
                    >
                      Đăng xuất
                    </button>
                  </div>
                )}
              </>
            ) : (
              <Link 
                to="/login" 
                className="cursor-pointer transition-transform hover:scale-110"
              >
                <FaUserCircle className="text-3xl text-amber-50 hover:text-white transition-colors" />
              </Link>
            )}
          </div>
        </div>
      </div>
    </header>
  );
}


///-----------------------------------------------------














//------------------





































// // src/components/Header.jsx
// import React, { useState, useEffect, useRef } from 'react';
// import { useNavigate, Link } from 'react-router-dom';
// import { FaUserCircle, FaBell } from 'react-icons/fa';
// import { HiHome, HiBookOpen, HiPhone, HiMenu, HiSun, HiMoon, HiSearch } from 'react-icons/hi';
// import { motion, AnimatePresence } from 'framer-motion';
// import Logo from './Logo';
// import { useAuth } from '../contexts/AuthContext';
// import useRipple from '../hooks/useRipple';

// export default function Header() {
//   const navigate = useNavigate();
//   const { user, logout } = useAuth();
//   const [dropdownOpen, setDropdownOpen] = useState(false);
//   const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
//   const [isDarkMode, setIsDarkMode] = useState(false);
//   const [isSearchExpanded, setIsSearchExpanded] = useState(false);
//   const [scrollProgress, setScrollProgress] = useState(0);
//   const [isVisible, setIsVisible] = useState(true);
//   const [lastScrollY, setLastScrollY] = useState(0);
  
//   const dropdownRef = useRef(null);
//   const logoRef = useRef(null);
//   const rippleRef = useRef(null);
  
//   useRipple(rippleRef);

//   // Xử lý scroll
//   useEffect(() => {
//     const handleScroll = () => {
//       const winScroll = document.documentElement.scrollTop;
//       const height = document.documentElement.scrollHeight - 
//                     document.documentElement.clientHeight;
      
//       setScrollProgress((winScroll / height) * 100);

//       if (winScroll > 100 && winScroll > lastScrollY) {
//         setIsVisible(false);
//       } else {
//         setIsVisible(true);
//       }
//       setLastScrollY(winScroll);
//     };

//     window.addEventListener('scroll', handleScroll);
//     return () => window.removeEventListener('scroll', handleScroll);
//   }, [lastScrollY]);

//   // Đóng dropdown khi click outside
//   useEffect(() => {
//     const handleClickOutside = (e) => {
//       if (dropdownRef.current && !dropdownRef.current.contains(e.target)) {
//         setDropdownOpen(false);
//       }
//     };
//     document.addEventListener('mousedown', handleClickOutside);
//     return () => document.removeEventListener('mousedown', handleClickOutside);
//   }, []);

//   // Danh sách navigation items
//   const navItems = [
//     { path: '/', label: 'Trang chủ', icon: <HiHome /> },
//     { path: '/booking', label: 'Đặt bàn', icon: <HiBookOpen /> },
//     { path: '/contact', label: 'Liên hệ', icon: <HiPhone /> },
//   ];

//   const handleLogout = () => {
//     logout();
//     navigate('/login');
//   };

//   // Animation variants
//   const mobileMenuVariants = {
//     open: { height: 'auto', opacity: 1 },
//     closed: { height: 0, opacity: 0 }
//   };

//   return (
//     <header className={`
//       bg-gradient-to-r from-violet-600 to-amber-400
//       dark:from-gray-800 dark:to-gray-900
//       text-white shadow-lg sticky top-0 z-50 h-20
//       transition-all duration-300 ease-out
//       ${isVisible ? 'translate-y-0' : '-translate-y-full'}
//     `}>
//       {/* Progress bar */}
//       <div 
//         className="absolute bottom-0 left-0 h-1 bg-amber-300 transition-all duration-200"
//         style={{ width: `${scrollProgress}%` }}
//       />

//       <div className="container mx-auto px-4 h-full">
//         <div className="flex justify-between items-center h-full">
//           {/* Mobile menu button và logo */}
//           <div className="flex items-center gap-4">
//             <button 
//               className="md:hidden p-2 hover:bg-white/10 rounded-lg"
//               onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
//             >
//               <HiMenu className="text-2xl" />
//             </button>
            
//             <div 
//               ref={logoRef}
//               className="cursor-pointer transition-all duration-500 hover:rotate-[360deg] hover:scale-105"
//               onClick={() => navigate('/')}
//             >
//               <Logo className="h-12 w-auto" />
//             </div>
//           </div>

//           {/* Desktop navigation */}
//           <nav className="hidden md:flex absolute left-1/2 -translate-x-1/2 items-center space-x-6">
//             {navItems.map((item) => (
//               <div
//                 key={item.path}
//                 className="flex items-center px-4 py-2 rounded-lg cursor-pointer 
//                   transition-all hover:bg-white/20 backdrop-blur-sm
//                   hover:scale-105 group relative"
//                 onClick={() => navigate(item.path)}
//               >
//                 {React.cloneElement(item.icon, { 
//                   className: "mr-2 text-amber-100 group-hover:text-white transition-colors text-xl" 
//                 })}
//                 <span className="font-medium tracking-wide text-amber-50 group-hover:text-white relative">
//                   {item.label}
//                   <span className="absolute bottom-0 left-0 w-0 h-[2px] bg-white transition-all duration-300 group-hover:w-full" />
//                 </span>
//               </div>
//             ))}
//           </nav>

//           {/* Right section */}
//           <div className="flex items-center gap-4">
//             {/* Search bar */}
//             <div className={`flex items-center ${isSearchExpanded ? 'w-48' : 'w-8'} transition-all duration-300`}>
//               <input
//                 type="text"
//                 placeholder="Tìm kiếm..."
//                 className={`bg-transparent border-b border-white/30 focus:outline-none transition-all duration-300 ${
//                   isSearchExpanded ? 'w-full opacity-100 px-2' : 'w-0 opacity-0'
//                 }`}
//               />
//               <HiSearch 
//                 className="ml-2 cursor-pointer hover:text-amber-200 text-xl" 
//                 onClick={() => setIsSearchExpanded(!isSearchExpanded)}
//               />
//             </div>

//             {/* Theme toggle */}
//             <button
//               onClick={() => {
//                 setIsDarkMode(!isDarkMode);
//                 document.documentElement.classList.toggle('dark');
//               }}
//               className="p-2 rounded-full hover:bg-white/10 transition-colors"
//             >
//               {isDarkMode ? (
//                 <HiSun className="text-xl" />
//               ) : (
//                 <HiMoon className="text-xl" />
//               )}
//             </button>

//             {/* Notification */}
//             <div className="relative cursor-pointer hover:text-amber-200">
//               <FaBell className="text-xl" />
//               <span className="absolute -top-1 -right-1 bg-red-500 text-xs w-5 h-5 rounded-full flex items-center justify-center">
//                 2
//               </span>
//             </div>

//             {/* Profile dropdown */}
//             <div className="relative" ref={dropdownRef}>
//               {user ? (
//                 <>
//                   <button
//                     ref={rippleRef}
//                     onClick={() => setDropdownOpen(!dropdownOpen)}
//                     className="relative overflow-hidden transition-transform hover:scale-110"
//                   >
//                     <FaUserCircle className="text-3xl text-amber-50 hover:text-white" />
//                   </button>

//                   <AnimatePresence>
//                     {dropdownOpen && (
//                       <motion.div
//                         initial={{ opacity: 0, y: -10 }}
//                         animate={{ opacity: 1, y: 0 }}
//                         exit={{ opacity: 0, y: -10 }}
//                         className="absolute right-0 mt-2 w-48 bg-white/95 dark:bg-gray-800/95 text-gray-800 dark:text-white rounded-lg shadow-xl overflow-hidden backdrop-blur-sm"
//                       >
//                         <div className="px-4 py-3 border-b border-amber-100 dark:border-gray-700">
//                           <p className="text-xs text-gray-500 dark:text-gray-400">Đăng nhập với</p>
//                           <p className="font-semibold truncate text-amber-600 dark:text-amber-400">
//                             {user.username || user.email}
//                           </p>
//                         </div>
//                         <button
//                           onClick={handleLogout}
//                           className="w-full text-left px-4 py-3 hover:bg-amber-50/80 dark:hover:bg-gray-700 transition-colors text-amber-600 dark:text-amber-400"
//                         >
//                           Đăng xuất
//                         </button>
//                       </motion.div>
//                     )}
//                   </AnimatePresence>
//                 </>
//               ) : (
//                 <Link 
//                   to="/login" 
//                   className="cursor-pointer transition-transform hover:scale-110"
//                 >
//                   <FaUserCircle className="text-3xl text-amber-50 hover:text-white" />
//                 </Link>
//               )}
//             </div>
//           </div>
//         </div>

//         {/* Mobile menu */}
//         <AnimatePresence>
//           <motion.div
//             initial="closed"
//             animate={isMobileMenuOpen ? "open" : "closed"}
//             exit="closed"
//             variants={mobileMenuVariants}
//             className="md:hidden absolute left-0 w-full bg-violet-600 dark:bg-gray-800 overflow-hidden"
//           >
//             <div className="p-4 space-y-4">
//               {navItems.map((item) => (
//                 <div
//                   key={item.path}
//                   className="flex items-center p-3 rounded-lg hover:bg-white/10 transition-colors"
//                   onClick={() => {
//                     navigate(item.path);
//                     setIsMobileMenuOpen(false);
//                   }}
//                 >
//                   {React.cloneElement(item.icon, { className: "mr-3 text-xl text-white" })}
//                   <span className="font-medium text-white">{item.label}</span>
//                 </div>
//               ))}
//             </div>
//           </motion.div>
//         </AnimatePresence>
//       </div>
//     </header>
//   );
// }