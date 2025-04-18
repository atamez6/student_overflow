from django.shortcuts import render, redirect, get_object_or_404
from .models import Pregunta, Respuesta
from .forms import PreguntaForm, RespuestaForm
from django.core.paginator import Paginator
from django.db.models import Q
from django.contrib.auth.decorators import login_required

@login_required
def home_view(request):
    preguntas = Pregunta.objects.all().order_by('-creada')
    paginator = Paginator(preguntas, 5)
    page = request.GET.get('page')
    preguntas_paginadas = paginator.get_page(page)
    return render(request, 'home.html', {'preguntas': preguntas_paginadas})

@login_required
def crear_pregunta_view(request):
    if request.method == 'POST':
        form = PreguntaForm(request.POST)
        if form.is_valid():
            pregunta = form.save(commit=False)
            pregunta.autor = request.user
            pregunta.save()
            return redirect('home')
    else:
        form = PreguntaForm()
    return render(request, 'crear_pregunta.html', {'form': form})

@login_required  # Para asegurar que solo usuarios autenticados pueden eliminar
def delete_question(request, pregunta_id):
    question = get_object_or_404(Pregunta, pk=pregunta_id)
    
    # Verificar que el usuario actual sea el autor de la pregunta
    if  request.user:
        question.delete()
    
    # Redirigir a la página principal o a donde prefieras
    return redirect('home') 

@login_required
def responder_view(request, pregunta_id):
    pregunta = get_object_or_404(Pregunta, id=pregunta_id)
    if request.method == 'POST':
        form = RespuestaForm(request.POST)
        if form.is_valid():
            respuesta = form.save(commit=False)
            respuesta.autor = request.user
            respuesta.pregunta = pregunta
            respuesta.save()
            return redirect('home')
    else:
        form = RespuestaForm()
    return render(request, 'responder.html', {'form': form, 'pregunta': pregunta})


def about(request):
    return render(request, 'about.html')


def search(request):
    query = request.GET.get('q', '')
    
    if query:
        # Buscar en preguntas - usando los nombres correctos: titulo y cuerpo
        preguntas = Pregunta.objects.filter(
            Q(titulo__icontains=query) | 
            Q(cuerpo__icontains=query)
        ).distinct()
        
        # Buscar en respuestas/comentarios
        respuestas = Respuesta.objects.filter(
            cuerpo__icontains=query  # Asumiendo que el campo de contenido se llama cuerpo
        ).distinct()
    else:
        preguntas = Pregunta.objects.none()
        respuestas = Respuesta.objects.none()
    
    context = {
        'query': query,
        'preguntas': preguntas,
        'respuestas': respuestas,
    }
    
    return render(request, 'resultados_busqueda.html', context)