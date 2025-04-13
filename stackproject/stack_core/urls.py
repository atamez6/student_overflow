from django.urls import path
from . import views
from django.contrib.auth.decorators import login_required


urlpatterns = [
    path('', login_required(views.home_view), name='home'),
    path('preguntar/', views.crear_pregunta_view, name='preguntar'),
    path('responder/<int:pregunta_id>/', views.responder_view, name='responder'),
]
