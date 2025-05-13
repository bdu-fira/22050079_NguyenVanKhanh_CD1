// src/pages/Home.jsx
import { useEffect, useState } from 'react';
import { FiFilter } from 'react-icons/fi';
import FoodCard from '../components/FoodCard';
import Filter from '../components/Filter';
import api from '../api/axios';
import { useCart } from '../contexts/CartContext';

export default function Home() {
  const [filters, setFilters] = useState({
    search: '',
    category: 'all',
    priceRange: [0, 200000],
  });
  const [showFilter, setShowFilter] = useState(false);
  const [items, setItems] = useState([]);

  // Lấy data
  useEffect(() => {
    api.get('/api/monan/')
      .then((res) => {
        // normalize API data
        const normalized = res.data.map((item) => ({
          id: item.ID,
          name: item.TenMon,
          image: item.HinhAnh,
          description: item.MoTa,
          price: item.Gia,
          category: item.IDLoai,
        }));
        setItems(normalized);
      })
      .catch((err) => console.error('Lỗi khi fetch món ăn:', err));
  }, []);

  const { items: cartItems, addItem } = useCart();

  // Lọc món ăn
  const filteredItems = items.filter((item) => {
    const nameMatch = item.name.toLowerCase().includes(filters.search.toLowerCase());
    const categoryMatch = filters.category === 'all' || item.category === filters.category;
    const priceMatch = item.price >= filters.priceRange[0] && item.price <= filters.priceRange[1];
    return nameMatch && categoryMatch && priceMatch;
  });

  return (
    <div className="relative min-h-screen p-4">
      <button
        onClick={() => setShowFilter(!showFilter)}
        className={`fixed z-20 left-2 top-100 p-4 rounded-full shadow-lg ${
          showFilter ? 'bg-gray-200' : 'bg-amber-500 text-white'
        }`}
      >
        <FiFilter
          size={24}
          className={`transition-transform duration-300 ${
            showFilter ? 'rotate-90' : 'rotate-0'
          }`}
        />
      </button>

      <div
        className={`fixed z-10 left-0 top-100 h-full w-64 bg-white shadow-lg transition-all duration-300 ${
          showFilter ? 'translate-x-0' : '-translate-x-full'
        }`}
      >
        {showFilter && (
          <div className="p-4 pt-16">
            <Filter filters={filters} setFilters={setFilters} />
          </div>
        )}
      </div>

      <div className={`transition-all duration-300 ${showFilter ? 'md:ml-64' : 'ml-0'}`}>
        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-5 gap-4">
          {filteredItems.map((item) => (
            <FoodCard
              key={item.id}
              item={item}
              onAddToCart={() => addItem({
                ID: item.id,
                TenMon: item.name,
                HinhAnh: item.image,
                MoTa: item.description,
                Gia: item.price,
              })}
            />
          ))}
        </div>
      </div>

      <div className="fixed bottom-4 right-4 bg-white p-4 rounded shadow-lg">
        <h3 className="font-semibold">Giỏ hàng ({cartItems.length})</h3>
        {cartItems.map((i) => (
          <div key={i.id} className="flex justify-between mt-2">
            <span>
              {i.name} x{i.quantity}
            </span>
          </div>
        ))}
      </div>
    </div>
  );
}