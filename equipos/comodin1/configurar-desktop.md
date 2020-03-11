
```
Curso      : 201617
Requisitos : GNU/Linux y lightdm
```

---
# Experimento sobre la configuración de las sesiones desktop 

En el PC13 del aula comodín1 se hizo el siguiente experimento sobre personalización de los inicios de sesión. 
El objetivo era configurar el inicio de sesión del PC para forzar la ejecución del programa VirtualBox de forma exclusiva.


En el directorio `/usr/share/xsesions` se guardan los ficheros (.desktop) que configuran los diferentes inicios de sesión.

```
/usr/share/xsessions/
├── bucle_logout.sh
├── virtualbox.desktop
├── virtualbox.sh
├── xfce.desktop
└── xubuntu.desktop
```

Los ficheros originales eran xfce y xubuntu. El profesor del experimento añadió el resto.

> Los ficheros .sh deberían estar en otra ruta, y dejar en este directorio sólo los .desktop.

[Ver los archivos](desktop)
