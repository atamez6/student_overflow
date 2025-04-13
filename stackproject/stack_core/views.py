from django.shortcuts import render
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required
from .models import Pregunta  # Ajusta al nombre de tu modelo


from django.shortcuts import render, redirect
from .forms import PreguntaForm, RespuestaForm
from .models import Pregunta, Respuesta

@login_required
def crear_pregunta(request):
    if request.method == 'POST':
        form = PreguntaForm(request.POST)
        if form.is_valid():
            pregunta = form.save(commit=False)
            pregunta.autor = request.user
            pregunta.save()
            return redirect('stack_core:lista_preguntas')
    else:
        form = PreguntaForm()
    return render(request, 'stack_core/crear_pregunta.html', {'form': form})

def lista_preguntas(request):
    preguntas = Pregunta.objects.all()
    return render(request, 'stack_core/question_list.html', {'preguntas': preguntas})

def crear_respuesta(request, pregunta_id):
    pregunta = Pregunta.objects.get(id=pregunta_id)
    if request.method == 'POST':
        form = RespuestaForm(request.POST)
        if form.is_valid():
            respuesta = form.save(commit=False)
            respuesta.pregunta = pregunta
            respuesta.autor = request.user
            respuesta.save()
            return redirect('stack_core:detalle_pregunta', pregunta_id=pregunta.id)
    else:
        form = RespuestaForm()
    return render(request, 'stack_core/crear_respuesta.html', {'form': form, 'pregunta': pregunta})



def about(request):
    return render(request, 'about.html')