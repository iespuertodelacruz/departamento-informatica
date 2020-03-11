
```
Curso      : 201617
Requisitos : GNU/Linux y lightdm
```

---
# Experimento sobre la configuración de las sesiones desktop

En el PC13 del aula comodín1 se hizo el siguiente experimento sobre personalización de los inicios de sesión.
El objetivo era configurar el inicio de sesión del PC para forzar la ejecución del programa VirtualBox de forma exclusiva.


En el directorio `/usr/share/xsesions` se guardan los ficheros (.desktop) que configuran los diferentes inicios de sesión. Originalmente teníamos:
```
/usr/share/xsessions/
├── xfce.desktop
└── xubuntu.desktop
```

El profesor del experimento realizó los siguientes cambios:
```
/usr/share/xsessions/
├── bucle_logout.sh
├── virtualbox.desktop
├── virtualbox.sh
├── xfce.desktop
└── xubuntu.desktop
```

[Ver los archivos](configurar-desktop)

Observaciones:
* El script bucle_logout parece que no se está usando y se podría eliminar.
* Los ficheros `.sh` deberían estar en otra ruta, y dejar en este directorio sólo los `.desktop`. Por tanto, sería conveniente mover el script virtualbox a /usr/local/bin. 
