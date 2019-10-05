
# VEYON: Software de monitorización

El software iTalc ya está descontinuado, se debe sustituir por veyon (https://veyon.io/).

## Instalación

Para instalarlo, hay que descargar la versión adecuada para el sistema operativo (https://veyon.io/download/) y ejecutar el instalador (hicimos toda la instalación y configuración con usuario "super").

La instalación es igual para el master y los demás equipos (da un aviso en una firma errónea durante el proceso). Luego la diferencia está en la configuración.

## Configuración

* Entrar en el "Veyon configurator" (pide contraseña root).

### Configurar el MASTER

En el master (ordenador del profe):
* Crear un grupo para toda la clase (p.ej aula109 o aula 103) en "Locations & computers".
* Añadir todos los equipos (nombre e IP), de esa forma es más fácil luego acceder a cada uno de ellos e incluso tenemos una panorámica de todas las pantallas y ver el contenido a la vez (se puede hacer zoom con Ctrl + rueda del ratón).
*  Para ver o acceder a los equipos remotos, tenemos que arrancar el `Educación -> Veyon Master` (pide usuario y contraseña del usuario local).
* Además de ver las pantallas, comprobamos que se puede tomar control del equipo y encenderlos si están apagados con WOL. Hay más posibilidades, como apagarlos, etc., pero en un intento inicial no funcionó y no lo probamos más a fondo. El modo de autenticación lo ponemos en "logon".

### Configuración de los CLIENTES

* Abrir el "Veyon configurator" y en "Locations & computers" creamos un grupo donde sólo está el ordenador del profesor (el master), indicando como IP la del master en formato :ffff::172.19.255.0.
* Añadir una regla para que SÓLO se puedan conectar desde el grupo profesor.
* Además, desactivamos todos los módulos para que no puedan conectarse a otros equipos (por seguridad redundante, porque realmente con las reglas ya no lo permite, pero por si acaso... ;)
* Todo este proceso en los clientes ya está hecho y guardado en un fichero de configuración `veyon.conf`. Existe una copia en `Leela -> malu -> LND` (habría que buscar una ruta mejor).

De esta forma, para instalar los esclavos/clientes hay que hacer lo siguiente:
1. Bajarse e instalar el veyon: https://veyon.io/download/ (OpenSuse 15.0 para la 109, Ubuntu 16.04 para la 103), se puede abrir directamente con el instalador.
2. Descargarse el fichero de configuración de `Leela -> malu -> LND -> veyon.conf`.
3. Abrir el veyon configurator, mediante el menú `Educación -> Veyon configurator`. Si no se abre así (en la 103 fallaba), usar `sudo veyon-configurator`.
4. Arriba en el menú "File", escoger "load setting from file" (JSON) y cargar el fichero veyon.conf.
5. Ir a "Access Control" y eliminar la regla "profe2" (se quedó ahí por error, habría que quitarla del JSON que está en leela). Debe haber una ÚNICA regla que ponga "solo profe".
6. Ir a "Locations & computers" y comprobar si el grupo "profe" tiene la IP correcta según se esté en la 109 o la 103 (cambiarla si no)
7. pulsar el botón "Apply" de abajo para salvar los cambios.
8. Ir a "General" y arrancar el demonio (hay un botón con forma de "play")
