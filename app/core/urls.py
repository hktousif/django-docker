from django.contrib import admin
from django.urls import path
from .views import homePageView

urlpatterns = [
    path("", homePageView, name="home"),
]