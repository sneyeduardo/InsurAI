from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from django.views.generic import RedirectView

urlpatterns = [
    path('admin/', admin.site.urls),
    # Esta es la única que debe manejar el login
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    # Redirigimos la raíz al login
    path('', RedirectView.as_view(url='/login/')), 
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    # Incluimos lo demás de core
    path('app/', include('core.urls')), # <--- Nota que le puse 'app/' para evitar choques
]