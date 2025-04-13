from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from .forms import LoginForm, RegisterForm
from django.urls import reverse


from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from .forms import LoginForm
from django.contrib.auth.forms import AuthenticationForm

def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            next_url = request.GET.get('next', 'home')
            return redirect(next_url)
        else:
            print(form.errors)  # Verifica los errores
    else:
        form = AuthenticationForm()

    return render(request, 'registration/login.html', {'form': form})


def register_view(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')  # Redirige al login después de registro
    else:
        form = RegisterForm()
    return render(request, 'registration/register.html', {'form': form})

def logout_view(request):
    logout(request)
    return redirect('login')  # Redirige al login después de logout

def perfil_view(request):
    return render(request, 'registration/perfil.html')  # Muestra perfil de usuario
