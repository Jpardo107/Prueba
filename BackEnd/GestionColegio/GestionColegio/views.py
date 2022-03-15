import code

from django.http import HttpResponse
from django.shortcuts import render






def nuevaNota(request):
    return render(request, 'nuevanota.html')

def nuevaPrueba(request):
    return  render(request, 'nuevaprueba.html')

def nuevoCurso(request):
    return render(request, 'nuevocurso.html')

def nuevoEstudiante(request):


    return render(request, 'nuevoestudiante.html')