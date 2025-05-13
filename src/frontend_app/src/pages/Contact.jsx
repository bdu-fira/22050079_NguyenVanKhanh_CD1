import { FaPhone, FaMapMarkerAlt, FaClock } from 'react-icons/fa';

export default function Contact() {
  const handleSubmit = (e) => {
    e.preventDefault();
    // Xử lý submit form ở đây
    console.log('Form submitted');
  };

  return (
    <div className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">Liên Hệ Với Chúng Tôi</h1>
          <p className="text-xl text-gray-600">Chúng tôi luôn sẵn sàng lắng nghe ý kiến của bạn</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
          {/* Thông tin liên hệ */}
          <div className="space-y-8">
            <div className="bg-white p-8 rounded-2xl shadow-lg">
              <div className="flex items-start mb-6">
                <FaMapMarkerAlt className="text-amber-500 text-2xl mr-4 mt-1" />
                <div>
                  <h3 className="text-xl font-semibold mb-2">Địa Chỉ Nhà Hàng</h3>
                  <p className="text-gray-600">Hoàng Hoa Thám</p>
                  <p className="text-gray-600">Đại lộ 13, Thủ Dầu Một, Bình Dương</p>
                </div>
              </div>

              <div className="flex items-start mb-6">
                <FaPhone className="text-amber-500 text-2xl mr-4 mt-1" />
                <div>
                  <h3 className="text-xl font-semibold mb-2">Điện Thoại</h3>
                  <p className="text-gray-600">Hotline: 0900 123 456</p>
                  <p className="text-gray-600">Đặt bàn: 012 1234 1234</p>
                </div>
              </div>

              <div className="flex items-start">
                <FaClock className="text-amber-500 text-2xl mr-4 mt-1" />
                <div>
                  <h3 className="text-xl font-semibold mb-2">Giờ Mở Cửa</h3>
                  <p className="text-gray-600">Thứ 2 - Thứ 6: 9:00 - 22:00</p>
                  <p className="text-gray-600">Thứ 7 & CN: 8:00 - 23:00</p>
                </div>
              </div>
            </div> 

             {/* Bản đồ Thủ Dầu Một */}
            <div className="bg-white p-4 rounded-2xl shadow-lg">
              <iframe
                title="map-tdm"
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3916.43100690201!2d106.65731941533613!3d11.02689919215281!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d60a3d6d79a1%3A0x8c1c4463f736a5f7!2sBecamex%20Tower!5e0!3m2!1svi!2s!4v1700322247649!5m2!1svi!2s"
                className="w-full h-96 rounded-lg border-0"
                allowFullScreen
                loading="lazy"
              ></iframe>
            </div>
          </div>

          {/* Form liên hệ */}
          <div className="bg-white p-8 rounded-2xl shadow-lg">
            <form onSubmit={handleSubmit} className="space-y-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Họ và tên</label>
                <input
                  type="text"
                  required
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-amber-500 focus:border-amber-500"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
                <input
                  type="email"
                  required
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-amber-500 focus:border-amber-500"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Số điện thoại</label>
                <input
                  type="tel"
                  required
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-amber-500 focus:border-amber-500"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nội dung</label>
                <textarea
                  rows="4"
                  required
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-amber-500 focus:border-amber-500"
                ></textarea>
              </div>

              <button
                type="submit"
                className="w-full bg-amber-500 text-white py-3 px-4 rounded-lg font-medium hover:bg-amber-600 transition-colors"
              >
                Gửi Liên Hệ
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}