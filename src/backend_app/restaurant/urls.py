from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView 
from . import views 
from .views import  create_don_hang , OrderHistoryViewSet
 
router = DefaultRouter()
router.register(r'dat-ban', views.DatBanViewSet, basename='dat-ban')
router.register(r'ban', views.BanViewSet, basename='ban')
router.register(r'orders', OrderHistoryViewSet, basename='orders')

urlpatterns = [
    # JWT endpoints
    path('token/',         TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(),    name='token_refresh'),
    # Current user info
    path('me/',            views.get_me,                   name='get_me'),
    # Các API function-based
    path('monan/',         views.get_mon_an,               name='get_mon_an'),
    path('ban-theo-khung/',views.ban_theo_khung,           name='ban_theo_khung'),
    path('ban-trong/',     views.get_ban_trong,            name='get_ban_trong'),
    path('dat-ban/',       views.dat_ban,                  name='dat_ban'),
    path('register/',      views.RegisterView.as_view(),   name='api_register'),
    path('don-hang/', create_don_hang, name='create_don_hang'),
    # ViewSets tự động tạo CRUD dưới /api/
    path('api/', include(router.urls)),
]



