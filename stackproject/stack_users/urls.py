from django.urls import path
from . import views
from django.contrib.auth import views as auth_views


urlpatterns = [
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('register/', views.register_view, name='register'),
    path('perfil/', views.perfil_view, name='perfil'),
    path('password_change/', auth_views.PasswordChangeView.as_view(template_name='password_change.html', success_url='/'), name='password_change'),

]
