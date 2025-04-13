from django.urls import path
from . import views
app_name = 'stack_core'
urlpatterns = [
    path('home/', views.home_view, name='home'),
    path('about/', views.about, name='about'),
    path('crear/', views.crear_pregunta, name='crear_pregunta'),
    path('lista/', views.lista_preguntas, name='lista_preguntas'),
    path('pregunta/<int:pregunta_id>/respuesta/', views.crear_respuesta, name='crear_respuesta'),
]