
# OpenSUSE

Principales diferencias entre Debian/Ubuntu y OpenSUSE:

|                     | OpenSUSE          | Debian/Ubuntu |
| ------------------- | ----------------- | ------------- |
| Sistema de paquetes | Paquetes RPM      | Paquetes DEB |
| Actualizar catálogo | zypper refresh    | apt-get update |
| Buscar paquete      | zypper se PACKAGE | apt-cache search PACKAGE |
| Instalar paquete    | zypper in PACKAGE | apt-get install PACKAGE |
| Directorio repos    | /etc/zypp/repos   | /etc/apt |
| Fichero de repos    | *.repo            | sources.list |
