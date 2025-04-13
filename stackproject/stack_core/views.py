from django.shortcuts import render, redirect, get_object_or_404
from .models import Pregunta
from .forms import PreguntaForm, RespuestaForm
from django.core.paginator import Paginator
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