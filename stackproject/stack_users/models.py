from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    bio = models.TextField(max_length=500, blank=True, null=True)

class Pregunta(models.Model):
    titulo = models.CharField(max_length=255)  # Título de la pregunta
    cuerpo = models.TextField()  # Cuerpo de la pregunta
    autor = models.ForeignKey(User, on_delete=models.CASCADE)  # Relación con el autor
    fecha_creacion = models.DateTimeField(auto_now_add=True)  # Fecha de creación
    fecha_modificacion = models.DateTimeField(auto_now=True)  # Fecha de modificación

    def __str__(self):
        return self.titulo

class Respuesta(models.Model):
    pregunta = models.ForeignKey(Pregunta, related_name='respuestas', on_delete=models.CASCADE)  # Relación con la pregunta
    cuerpo = models.TextField()  # Cuerpo de la respuesta
    autor = models.ForeignKey(User, on_delete=models.CASCADE)  # Relación con el autor
    fecha_creacion = models.DateTimeField(auto_now_add=True)  # Fecha de creación

    def __str__(self):
        return f"Respuesta de {self.autor.username} a {self.pregunta.titulo}"
