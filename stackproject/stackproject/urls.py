from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('stack_users.urls')),
    path('', include('stack_core.urls')),
]
