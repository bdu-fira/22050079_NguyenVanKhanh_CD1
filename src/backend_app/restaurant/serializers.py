from rest_framework import serializers
from .models import MonAn, Ban , DatBan , DonHang, ChiTietDon ,ThanhToan , VaiTro , Profile
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.contrib.auth.hashers import make_password , check_password


class MonAnSerializer(serializers.ModelSerializer):
    Gia = serializers.SerializerMethodField()
    class Meta:
        model = MonAn
        fields = ['ID', 'TenMon', 'Gia', 'IDLoai','HinhAnh', 'MoTa']
    def get_Gia(self, obj):
        return int(float(obj.Gia))

class BanSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ban
        fields = ['ID', 'TenBan', 'SoChoNgoi', 'ViTri', 'TrangThai']


class DatBanSerializer(serializers.ModelSerializer):
    class Meta:
        model = DatBan
        fields = '__all__'  # hoặc ghi rõ các field nếu muốn kiểm soát

    def validate(self, data):
        id_ban = data.get('IDBan')
        ngay = data.get('Ngay')
        gio = data.get('Gio')

        if DatBan.objects.filter(IDBan=id_ban, Ngay=ngay, Gio=gio).exists():
            raise serializers.ValidationError("Bàn đã có người đặt vào thời gian này.")

        return data
    




    
class RegisterSerializer(serializers.ModelSerializer):
    hoten = serializers.CharField(write_only=True)
    sdt   = serializers.CharField(write_only=True)
    vaitro = serializers.PrimaryKeyRelatedField(
        queryset=VaiTro.objects.all(),
        write_only=True,
        required=False,                              # không bắt buộc
        default=VaiTro.objects.get(pk=3)              # nếu bỏ trống, gán VaiTro id=3
    )

    class Meta:
        model = User
        fields = ['username', 'email', 'password', 'hoten', 'sdt', 'vaitro']
        extra_kwargs = {
            'password': {'write_only': True},
        }

    def create(self, validated_data):
        hoten  = validated_data.pop('hoten')
        sdt    = validated_data.pop('sdt')
        vaitro = validated_data.pop('vaitro', None) or VaiTro.objects.get(pk=3)

        # Kiểm tra xem email đã tồn tại chưa
        if User.objects.filter(email=validated_data['email']).exists():
            raise serializers.ValidationError("Email này đã có người sử dụng.")

        # tạo User (hash password tự động)
        user = User.objects.create_user(**validated_data)

        # tạo Profile, ghi đủ Email + MatKhau để không bị NOT NULL constraint
        Profile.objects.create(
            user=user,
            IDVaiTro=vaitro,
            HoTen=hoten,
            SDT=sdt,
            Email=user.email,
            MatKhau=user.password,   # đã hash
        )
        return user






class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField(write_only=True)

    def validate(self, data):
        try:
            user = User.objects.get(email=data['email'])
        except User.DoesNotExist:
            raise serializers.ValidationError("Email hoặc mật khẩu không đúng.")

        user = authenticate(username=user.username, password=data['password'])
        if not user:
            raise serializers.ValidationError("Email hoặc mật khẩu không đúng.")

        data['user'] = user
        return data




#/////////////////////////////////////////////////////]]]]]]]]]]]]]]]]


class ChiTietDonSerializer(serializers.ModelSerializer):
    IDMonAn = serializers.PrimaryKeyRelatedField(queryset=MonAn.objects.all())
    class Meta:
        model = ChiTietDon
        fields = ['IDMonAn', 'SoLuong', 'Gia']

class ThanhToanSerializer(serializers.ModelSerializer):
    class Meta:
        model = ThanhToan
        fields = ['SoTien', 'PhuongThuc']

class DonHangSerializer(serializers.ModelSerializer):
    # nested write-only fields
    chi_tiet  = ChiTietDonSerializer(many=True, write_only=True)
    thanhtoan = ThanhToanSerializer(write_only=True)

    class Meta:
        model = DonHang
        fields = ['IDDatBan', 'TongTien', 'TrangThai', 'chi_tiet', 'thanhtoan']

    def create(self, validated_data):
        # tách riêng chi tiết và thanh toán
        details = validated_data.pop('chi_tiet')
        pay_data = validated_data.pop('thanhtoan')

        # tạo DonHang
        order = DonHang.objects.create(**validated_data)

        # tạo ChiTietDon
        for item in details:
            ChiTietDon.objects.create(
                IDDonHang=order,
                IDMonAn=item['IDMonAn'],
                SoLuong=item['SoLuong'],
                Gia=item['Gia']
            )

        # tạo ThanhToan
        ThanhToan.objects.create(
            IDDonHang=order,
            SoTien=pay_data['SoTien'],
            PhuongThuc=pay_data['PhuongThuc']
        )

        return order






#/===============================



 



 #======//////////////\\\\\\\\\\\\\\\\\\\\\///////////////////

class OrderTableSerializer(serializers.ModelSerializer):
    name = serializers.CharField(source='TenBan')
    class Meta:
        model = Ban
        fields = ['ID', 'name']

class OrderItemSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(source='IDMonAn.ID')
    name = serializers.CharField(source='IDMonAn.TenMon')
    price = serializers.FloatField(source='Gia')
    quantity = serializers.IntegerField(source='SoLuong')

    class Meta:
        model = ChiTietDon
        fields = ['id', 'name', 'price', 'quantity']

class OrderHistorySerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(source='ID')
    created_at = serializers.DateField(source='IDDatBan.Ngay', read_only=True)
    date       = serializers.DateField(source='IDDatBan.Ngay', read_only=True)
    time       = serializers.TimeField(source='IDDatBan.Gio',   read_only=True)
    status = serializers.CharField(source='TrangThai')
    total = serializers.FloatField(source='TongTien')
    table = OrderTableSerializer(source='IDDatBan.IDBan', read_only=True)
    items = OrderItemSerializer(source='chitietdon_set', many=True, read_only=True)

    class Meta:
        model = DonHang
        fields = ['id', 'created_at', 'date', 'time', 'status', 'total', 'table', 'items']

