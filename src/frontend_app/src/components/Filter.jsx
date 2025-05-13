import React from "react";

const Filter = ({ filters, setFilters }) => {
  return (
    <div className="bg-white p-3 rounded-lg shadow-md sticky top-4">
      <h2 className="font-bold text-sm mb-3">BỘ LỌC</h2>
      
      <div className="space-y-3">
        <div>
          <label className="block text-xs font-medium mb-1">Tìm kiếm</label>
          <input
            type="text"
            placeholder="Tên món..."
            className="w-full p-1.5 text-xs border rounded"
            value={filters.search}
            onChange={(e) => setFilters({...filters, search: e.target.value})}
          />
        </div>

        <div>
          <label className="block text-xs font-medium mb-1">Danh mục</label>
          <select
            className="w-full p-1.5 text-xs border rounded"
            value={filters.category}
            onChange={(e) => setFilters({...filters, category: e.target.value})}
          >
            <option value="all">Tất cả</option>
            <option value="appetizer">Khai vị</option>
            <option value="main">Món chính</option>
          </select>
        </div>

        <button
          onClick={() => setFilters({ search: "", category: "all", priceRange: [0, 200000] })}
          className="w-full py-1.5 text-xs bg-gray-100 hover:bg-gray-200 rounded"
        >
          Reset
        </button>
      </div>
    </div>
  );
};

export default Filter;