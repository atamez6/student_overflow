from django.db import models
from django.contrib.auth.models import User

class Pregunta(models.Model):
    titulo = models.CharField(max_length=255)
    cuerpo = models.TextField()
    autor = models.ForeignKey(User, on_delete=models.CASCADE)
    creada = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.titulo

class Respuesta(models.Model):
    pregunta = models.ForeignKey(Pregunta, related_name="respuestas", on_delete=models.CASCADE)
    cuerpo = models.TextField()
    autor = models.ForeignKey(User, on_delete=models.CASCADE)
    creada = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Respuesta a {self.pregunta.titulo}"
