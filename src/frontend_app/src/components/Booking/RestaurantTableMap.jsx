


// src/components/Booking/RestaurantTableMap.jsx
import { useState, useEffect } from "react";
import axios from "axios";
import { API_BASE_URL } from "../../config";
import api from "../../api/axios";
axios.defaults.baseURL = API_BASE_URL;




export default function RestaurantTableMap({ date, time, onSelect }) {
  const [tables, setTables] = useState([]);
  const [loading, setLoading] = useState(true);
  // Xử lý sự kiện khi chọn bàn
  const handleClick = (table) => {
    if (table.isBooked) return;
    onSelect(table);
  };
  
  useEffect(() => {
    // Chỉ fetch khi đã có date và time
    if (!date || !time) return;

    const ngay = date.toISOString().split("T")[0];

    const fetchTables = async () => {
      setLoading(true);
      try {
        const res = await api.get('/api/ban-theo-khung/', {
           params: { ngay, gio: time }
        });
        // res.data là mảng { ID, TenBan, SoChoNgoi, ..., isBooked }
        setTables(res.data);
      } catch (error) {
        console.error("Lỗi khi lấy danh sách bàn theo khung:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchTables();
  }, [date, time]);

  if (loading) {
    return (
      <div className="text-center py-12 text-amber-700">
        Đang tải dữ liệu bàn...
      </div>
    );
  }

  return (
    <div className="relative bg-amber-50 p-8 rounded-xl shadow-lg max-w-4xl mx-auto">
      <h2 className="text-2xl font-bold text-center mb-6 text-amber-800">
        Chọn bàn của bạn
      </h2>

      <div className="relative bg-white p-8 rounded-lg border border-amber-200 shadow-sm min-h-[500px]">
        {/* layout decor giống cũ */}
        <div className="absolute top-0 left-0 right-0 h-8 bg-amber-100 flex justify-evenly items-center">
          {[1, 2, 3].map((_, i) => (
            <div key={i} className="w-16 h-6 bg-blue-300 rounded-b-lg shadow" />
          ))}
        </div>
        <div className="absolute top-8 left-14 bg-amber-700 text-white px-3 py-1 rounded-b-lg text-xs">
          LỐI VÀO
        </div>
        <div className="absolute top-32 left-4 w-6 h-32 bg-amber-400 rounded-r-lg shadow-md flex items-center justify-center">
          <span className="transform -rotate-90 whitespace-nowrap text-xs text-amber-800">
            QUẦY BAR
          </span>
        </div>
        <div className="absolute bottom-8 right-8 bg-amber-700 text-white px-3 py-1 rounded-lg text-xs shadow">
          WC
        </div>
        <div className="absolute left-32 right-12 top-1/2 border-t-2 border-amber-300" />
        <div className="absolute left-[calc(50%-64px)] right-[calc(50%-64px)] top-1/2 bg-white h-4" />

        <div className="relative pt-12 space-y-12">
          {/* Hiển thị 2 hàng: chia mảng thành các chunk 6 phần tử */}
          {chunkTables(tables, 6).map((row, idx) => (
            <div key={idx} className="grid grid-cols-6 gap-8 pl-32">
              {row.map((t) => {
                const status = t.isBooked ? "unavailable" : "available";
                return (
                  <div
                    key={t.ID}
                    className={`p-4 rounded-lg text-center cursor-pointer shadow-md ${
                      status === "available"
                        ? "bg-green-50 hover:bg-green-100 border border-green-300"
                        : "bg-gray-100 text-gray-400 cursor-not-allowed"
                    }`}
                    onClick={() => handleClick(t)}
                  >
                    <div className="font-bold">{t.TenBan}</div>
                    <div className="text-sm">Sức chứa: {t.SoChoNgoi}</div>
                    <div
                      className={`text-xs mt-1 px-2 py-1 rounded-full inline-block ${
                        status === "available"
                          ? "bg-green-100 text-green-800"
                          : "bg-gray-300"
                      }`}
                    >
                      {status === "available" ? "Trống" : "Đã đặt"}
                    </div>
                  </div>
                );
              })}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

// Hàm tiện ích chia mảng thành các hàng
function chunkTables(arr, size) {
  const chunks = [];
  for (let i = 0; i < arr.length; i += size) {
    chunks.push(arr.slice(i, i + size));
  }
  return chunks;
}
