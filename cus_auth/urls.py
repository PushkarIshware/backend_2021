from django.urls import path
from cus_auth import views

urlpatterns = [
    path('hehe/',views.auth_123),
]