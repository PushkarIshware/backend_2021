from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def auth_123(request):
    return HttpResponse("***cus_auth***")