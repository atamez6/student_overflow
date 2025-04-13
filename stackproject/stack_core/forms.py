from django import forms
from .models import Pregunta, Respuesta

class PreguntaForm(forms.ModelForm):
    class Meta:
        model = Pregunta
        fields = ['titulo', 'cuerpo']

class RespuestaForm(forms.ModelForm):
    class Meta:
        model = Respuesta
        fields = ['cuerpo']
