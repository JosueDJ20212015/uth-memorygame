#from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse

def home(request):
    return HttpResponse("🎮 Bienvenido al Memory Game — Django funcionando")
