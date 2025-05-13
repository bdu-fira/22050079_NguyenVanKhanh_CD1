//src/components/FoodCard.jsx
import React, { useState } from "react";

const FoodCard = ({ item, onAddToCart }) => {
  const [isHovered, setIsHovered] = useState(false);
  const [isDetailOpen, setIsDetailOpen] = useState(false);

  const openDetail = (e) => {
    e.stopPropagation();
    setIsDetailOpen(true);
  };

  const closeDetail = () => {
    setIsDetailOpen(false);
  };

  return (
    <>
      <div 
        className="flex flex-col bg-white rounded-xl shadow-lg overflow-hidden transition-all duration-300 hover:shadow-xl border border-gray-200 m-2"
        style={{ flex: '1 0 calc(25% - 16px)' }}
        onMouseEnter={() => setIsHovered(true)}
        onMouseLeave={() => setIsHovered(false)}
      >
        {/* Phần ảnh */}
        <div className="relative w-full pt-[100%] overflow-hidden">
          <img
            src={item.image}
            alt={item.name}
            className={`absolute top-0 left-0 w-full h-full object-cover transition-transform duration-300 ${
              isHovered ? "scale-110" : "scale-100"
            }`}
          />
          
          {/* Overlay buttons */}
          {isHovered && (
            <div className="absolute inset-0 bg-black bg-opacity-50 flex flex-col items-center justify-center gap-3 p-4">
              <button 
                className="bg-white text-amber-600 px-4 py-2 rounded-full font-medium hover:bg-amber-100 transition whitespace-nowrap min-w-[120px] text-center"
                onClick={openDetail}
              >
                Xem chi tiết
              </button>
              <button
                onClick={(e) => {
                  e.stopPropagation();
                  onAddToCart(item);
                }}
                className="bg-amber-500 text-white px-4 py-2 rounded-full font-medium hover:bg-amber-600 transition whitespace-nowrap min-w-[120px] text-center"
              >
                Thêm vào giỏ
              </button>
            </div>
          )}
        </div>

        {/* Phần nội dung */}
        <div className="p-4 flex flex-col flex-grow">
          <h3 className="font-bold text-lg truncate mb-1">{item.name}</h3>
          <p className="text-gray-600 text-sm line-clamp-2 mb-2 flex-grow">
            {item.description}
          </p>
          <p className="text-amber-600 font-bold text-right mt-auto">
            {item.price.toLocaleString()} VND
          </p>
        </div>
      </div>

      {/* Modal chi tiết */}
      {isDetailOpen && (
  <div className="fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center p-4">
    <div 
      className="bg-white rounded-2xl max-w-4xl w-full overflow-hidden shadow-2xl relative animate-fade-in"
      onClick={(e) => e.stopPropagation()}
    >
      {/* Nút đóng */}
      <button
        onClick={closeDetail}
        className="absolute top-4 right-4 p-2 rounded-full hover:bg-gray-100 transition z-10"
      >
        <svg className="w-6 h-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>

      {/* Nội dung modal */}
      <div className="flex flex-col md:flex-row h-full">
        {/* Hình ảnh - Chiếm 60% chiều rộng */}
        <div className="md:w-3/5 h-96 md:h-auto">
          <img
            src={item.image}
            alt={item.name}
            className="w-full h-full object-cover md:object-contain"
          />
        </div>

        {/* Thông tin chi tiết - Chiếm 40% chiều rộng */}
        <div className="md:w-2/5 p-6 md:p-8 flex flex-col">
          <h2 className="text-3xl font-bold mb-4">{item.name}</h2>
          <p className="text-gray-600 mb-6 text-lg leading-relaxed">
            {item.description}
          </p>
          
          <div className="mt-auto">
            <p className="text-2xl text-amber-600 font-bold">
              {item.price.toLocaleString()} VND
            </p>
            
            <button
              onClick={() => {
                onAddToCart(item);
                closeDetail();
              }}
              className="w-full bg-amber-500 text-white py-3 rounded-lg hover:bg-amber-600 transition mt-6 text-lg"
            >
              Thêm vào giỏ hàng
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
)}
    </>
  );
};

export default FoodCard;