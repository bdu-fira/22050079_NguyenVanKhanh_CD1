# restaurant/models.py
from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from django.conf import settings

class VaiTro(models.Model):
    class Meta:
        db_table = 'VaiTro'  # Giữ nguyên tên bảng
        managed = False
    
    ID = models.AutoField(primary_key=True, db_column='ID')
    TenVaiTro = models.CharField(max_length=50, db_column='TenVaiTro')

    def __str__(self):
        return self.TenVaiTro


class Profile(models.Model):
    class Meta:
        db_table = 'NguoiDung'
        managed = False

    # PK và FK sang auth_user
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        db_column='ID',
        primary_key=True,
    )
    IDVaiTro = models.ForeignKey(
        'VaiTro',
        on_delete=models.CASCADE,
        db_column='IDVaiTro'
    )
    HoTen    = models.CharField(max_length=100, db_column='HoTen')
    Email    = models.EmailField(max_length=254, db_column='Email')
    SDT      = models.CharField(max_length=20, db_column='SDT')
    MatKhau  = models.CharField(max_length=255, db_column='MatKhau')



class Ban(models.Model):
    class Meta:
        db_table = 'Ban'
        managed = False
    
    ID = models.AutoField(primary_key=True, db_column='ID')
    TenBan = models.CharField(max_length=50, db_column='TenBan')
    SoChoNgoi = models.IntegerField(db_column='SoChoNgoi')
    ViTri = models.CharField(max_length=50, db_column='ViTri')
    TrangThai = models.CharField(
        max_length=20, 
        db_column='TrangThai', 
        default='Trống'
    )

class LoaiMonAn(models.Model):
    class Meta:
        db_table = 'LoaiMonAn'
        managed = False
    
    ID = models.AutoField(primary_key=True, db_column='ID')
    TenLoai = models.CharField(max_length=100, db_column='TenLoai')

class MonAn(models.Model):
    class Meta:
        db_table = 'MonAn'
        managed = False
    
    ID = models.AutoField(primary_key=True, db_column='ID')
    TenMon = models.CharField(max_length=100, db_column='TenMon')
    Gia = models.DecimalField(
        max_digits=10, 
        decimal_places=2, 
        db_column='Gia'
    )
    IDLoai = models.ForeignKey(
        LoaiMonAn, 
        on_delete=models.SET_NULL, 
        null=True, 
        db_column='IDLoai'
    )
    HinhAnh = models.URLField(max_length=255, blank=True, null=True, db_column='HinhAnh')  # Thêm trường HinhAnh
    MoTa = models.TextField(blank=True, null=True, db_column='MoTa')  # Thêm trường MoTa

    

class DatBan(models.Model):
    class Meta:
        db_table = 'DatBan'
        managed = False
    
    ID = models.AutoField(primary_key=True, db_column='ID')
    IDNguoiDung = models.ForeignKey(
        # NguoiDung, 
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE, 
        db_column='IDNguoiDung'
    )
    IDBan = models.ForeignKey(
        Ban, 
        on_delete=models.CASCADE, 
        db_column='IDBan'
    )
    Ngay = models.DateField(db_column='Ngay')
    Gio = models.TimeField(db_column='Gio')
    SoNguoi = models.IntegerField(db_column='SoNguoi')
    TrangThai = models.CharField(
        max_length=20, 
        db_column='TrangThai', 
        default='Đang chờ'
    )

class DonHang(models.Model):
    class Meta:
        db_table = 'DonHang'
        managed = False
    
    ID = models.AutoField(primary_key=True, db_column='ID')
    IDDatBan = models.OneToOneField(
        DatBan, 
        on_delete=models.CASCADE, 
        db_column='IDDatBan'
    )
    TongTien = models.DecimalField(
        max_digits=10, 
        decimal_places=2, 
        db_column='TongTien', 
        default=0
    )
    TrangThai = models.CharField(
        max_length=20, 
        db_column='TrangThai', 
        default='Đang xử lý'
    )

class ChiTietDon(models.Model):
    class Meta:
        db_table = 'ChiTietDon'
        managed = False
    
    ID = models.AutoField(primary_key=True, db_column='ID')
    IDDonHang = models.ForeignKey(
        DonHang, 
        on_delete=models.CASCADE, 
        db_column='IDDonHang'
    )
    IDMonAn = models.ForeignKey(
        MonAn, 
        on_delete=models.CASCADE, 
        db_column='IDMonAn'
    )
    SoLuong = models.IntegerField(db_column='SoLuong')
    Gia = models.DecimalField(
        max_digits=10, 
        decimal_places=2, 
        db_column='Gia'
    )

class ThanhToan(models.Model):
    class Meta:
        db_table = 'ThanhToan'
        managed = False
    
    ID = models.AutoField(primary_key=True, db_column='ID')
    IDDonHang = models.OneToOneField(
        DonHang, 
        on_delete=models.CASCADE, 
        db_column='IDDonHang'
    )
    SoTien = models.DecimalField(
        max_digits=10, 
        decimal_places=2, 
        db_column='SoTien'
    )
    PhuongThuc = models.CharField(max_length=20, db_column='PhuongThuc')
    TrangThai = models.CharField(
        max_length=20, 
        db_column='TrangThai', 
        default='Thành công'
    )

class DanhGia(models.Model):
    class Meta:
        db_table = 'DanhGia'
        managed = False
    
    ID = models.AutoField(primary_key=True, db_column='ID')
    IDThanhToan = models.OneToOneField(
        ThanhToan, 
        on_delete=models.CASCADE, 
        db_column='IDThanhToan'
    )
    Diem = models.IntegerField(
        db_column='Diem',
        validators=[
            MinValueValidator(1),
            MaxValueValidator(5)
        ]
    )
    NoiDung = models.TextField(db_column='NoiDung', null=True, blank=True)