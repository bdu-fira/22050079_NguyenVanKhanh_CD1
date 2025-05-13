from django.shortcuts import render

# Create your views here.
from rest_framework.decorators import api_view , permission_classes , action
from rest_framework.response import Response
from .models import MonAn, Ban , DatBan , DonHang ,  ChiTietDon, ThanhToan ,Profile
from .serializers import MonAnSerializer, BanSerializer , DatBanSerializer , RegisterSerializer, LoginSerializer , DonHangSerializer , OrderHistorySerializer
from datetime import datetime
from rest_framework import status , authentication, permissions , viewsets


from rest_framework.views import APIView
from rest_framework.permissions import AllowAny , IsAuthenticated
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth.models import User

from django.contrib.auth import login , logout
from django.views.decorators.csrf import ensure_csrf_cookie

from django.db import transaction



@api_view(['GET'])
def get_mon_an(request):
    mon_an = MonAn.objects.all()
    serializer = MonAnSerializer(mon_an, many=True)
    return Response(serializer.data)



@api_view(['GET'])
def get_ban(request):
    ban = Ban.objects.filter(TrangThai='Trống')
    serializer = BanSerializer(ban, many=True)
    return Response(serializer.data)

class BanViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Ban.objects.all()
    serializer_class = BanSerializer






@api_view(['GET'])
def get_ban_trong(request):
    # Lấy thông tin ngày và giờ từ request
    ngay = request.query_params.get('ngay')
    gio = request.query_params.get('gio')

    # Kiểm tra xem ngày và giờ có hợp lệ không
    if not ngay or not gio:
        return Response({"error": "Ngày và giờ là bắt buộc!"}, status=400)

    # Kiểm tra định dạng ngày và giờ
    try:
        datetime.strptime(ngay, '%Y-%m-%d')
        datetime.strptime(gio, '%H:%M')
    except ValueError:
        return Response({"error": "Định dạng ngày hoặc giờ không hợp lệ!"}, status=400)

    # Lọc các bàn có trạng thái "Trống" và chưa có đặt bàn vào ngày giờ này
    ban_trong = Ban.objects.filter(
        TrangThai='Trống'
    ).exclude(
        ID__in=DatBan.objects.filter(
            Ngay=ngay, Gio=gio
        ).values('IDBan')  # Loại bỏ các bàn đã có đặt bàn
    )

    # Serialize kết quả và trả về
    serializer = BanSerializer(ban_trong, many=True)
    return Response(serializer.data)



@api_view(['GET'])
def ban_theo_khung(request):
    ngay = request.query_params.get('ngay')
    gio = request.query_params.get('gio')

    # Validate
    if not ngay or not gio:
        return Response({"error": "Ngày và giờ là bắt buộc!"}, status=400)
    try:
        datetime.strptime(ngay, '%Y-%m-%d')
        datetime.strptime(gio, '%H:%M')
    except ValueError:
        return Response({"error": "Định dạng không hợp lệ!"}, status=400)

    # Tập ID bàn đã đặt vào khung đó
    booked_ids = set(
        DatBan.objects
              .filter(Ngay=ngay, Gio=gio)
              .values_list('IDBan', flat=True)
    )

    # Lấy tất cả bàn
    all_bans = Ban.objects.all()
    # Xây mảng kết quả kèm cờ
    data = []
    for ban in all_bans:
        b = BanSerializer(ban).data
        b['isBooked'] = ban.ID in booked_ids
        data.append(b)

    return Response(data)





@api_view(['POST'])
def dat_ban(request):
    try:
        id_nguoi_dung = request.data.get('IDNguoiDung')
        id_ban = request.data.get('IDBan')
        ngay = request.data.get('Ngay')
        gio = request.data.get('Gio')
        so_nguoi = request.data.get('SoNguoi')

        # Kiểm tra thông tin bắt buộc
        if not all([id_nguoi_dung, id_ban, ngay, gio, so_nguoi]):
            return Response({"error": "Thiếu thông tin đặt bàn!"}, status=status.HTTP_400_BAD_REQUEST)

        # Kiểm tra định dạng ngày và giờ
        try:
            datetime.strptime(ngay, '%Y-%m-%d')
            datetime.strptime(gio, '%H:%M')
        except ValueError:
            return Response({"error": "Định dạng ngày hoặc giờ không hợp lệ!"}, status=400)

        # Kiểm tra xem bàn đã được đặt chưa
        trung_lich = DatBan.objects.filter(
            IDBan=id_ban, Ngay=ngay, Gio=gio
        ).exists()
        if trung_lich:
            return Response({"error": "Bàn này đã có người đặt vào thời gian đó!"}, status=status.HTTP_409_CONFLICT)

        # Tạo mới đặt bàn
        datban = DatBan.objects.create(
            IDNguoiDung_id=id_nguoi_dung,
            IDBan_id=id_ban,
            Ngay=ngay,
            Gio=gio,
            SoNguoi=so_nguoi,
            TrangThai="Đang chờ"
        )

        return Response({"message": "Đặt bàn thành công!", "IDDatBan": datban.ID}, status=status.HTTP_201_CREATED)

    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    


class DatBanViewSet(viewsets.ModelViewSet):
    queryset = DatBan.objects.all()
    serializer_class = DatBanSerializer





# Register View
class RegisterView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            return Response({
                "message": "Đăng ký thành công!",
                "ID": user.id        # user.id thay vì user.ID
            }, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)





@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_me(request):
    user = request.user
    # lấy Profile liên kết
    try:
        profile = user.profile  # do bạn đã map OneToOneField(settings.AUTH_USER_MODEL, related_name='profile')
    except Profile.DoesNotExist:
        return Response({'error': 'Không tìm thấy profile'}, status=404)

    return Response({
        'id':     user.id,
        'email':  user.email,
        'hoTen':  profile.HoTen,
        'sdt':    profile.SDT,
        'vaitro': profile.IDVaiTro.TenVaiTro,
    })





@api_view(['POST'])
@permission_classes([IsAuthenticated])
def create_don_hang(request):
    """
    POST /api/don-hang/
    Payload:
    {
      "IDDatBan": <int>,
      "items": [
        {"IDMonAn": <int>, "SoLuong": <int>},
        ...
      ],
      "TongTien": <decimal>,
      "GhiChu": <string>,
      "PhuongThuc": <string>
    }
    """
    user = request.user
    data = request.data

    # Basic validation
    try:
        datban = DatBan.objects.get(pk=data['IDDatBan'], IDNguoiDung=user)
    except (KeyError, DatBan.DoesNotExist):
        return Response({"error": "DatBan không hợp lệ hoặc không tồn tại."}, status=status.HTTP_400_BAD_REQUEST)

    items = data.get('items', [])
    if not items:
        return Response({"error": "Phải có ít nhất một món."}, status=status.HTTP_400_BAD_REQUEST)

    with transaction.atomic():
        # 1) Tạo DonHang
        donhang = DonHang.objects.create(
            IDDatBan=datban,
            TongTien=data.get('TongTien', 0),
            TrangThai='Đã Xác Nhận'
        )

        # 2) Tạo ChiTietDon
        for it in items:
            ChiTietDon.objects.create(
                IDDonHang=donhang,
                IDMonAn_id=it['IDMonAn'],
                SoLuong=it['SoLuong'],
                Gia=it.get('Gia', 0)  # bạn có thể truyền giá qua payload nếu cần
            )

        # 3) Tạo ThanhToan
        ThanhToan.objects.create(
            IDDonHang=donhang,
            SoTien=data.get('TongTien', 0),
            PhuongThuc=data.get('PhuongThuc', ''),
            TrangThai='Thành công'
        )

    return Response({
        "message": "Đơn hàng & thanh toán thành công!",
        "IDDonHang": donhang.ID
    }, status=status.HTTP_201_CREATED)










class OrderHistoryViewSet(viewsets.ReadOnlyModelViewSet):
    """
    Endpoint:
    GET    /api/orders/         -> list user's orders
    GET    /api/orders/{id}/    -> retrieve single order
    POST   /api/orders/{id}/cancel/ -> cancel an order (refund logic)
    """
    serializer_class = OrderHistorySerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        return DonHang.objects.filter(IDDatBan__IDNguoiDung=user)

    @action(detail=True, methods=['post'])
    def cancel(self, request, pk=None):
        order = self.get_object()
        from django.utils import timezone
        now = timezone.now()
        # determine refund policy
        cutoff = order.IDDatBan.Ngay  # simplistic, use datetime fields
        # example: full lộ trình refund logic here
        refund = order.TongTien * 0.5  # adjust based on business rules
        order.TrangThai = 'CANCELLED'
        order.save()
        return Response({'refund_amount': refund}, status=status.HTTP_200_OK)





