
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

---

## Network

* Configurar OpenSUSE para usar NetworkManager como servicio de red en lugar de Wicked.
* El motivo es porque Wicked no está cogiendo correctamente la configuración de red vía DHCP. Pendiente de revisar.

---

## Monitorización

* El software de monitorización que vamos a usar es **Veyon** (Anteriormente se llamaba iTalc)
* [Installar Veyon](https://docs.veyon.io/en/latest/admin/installation.html?highlight=installation#installation-on-a-linux-computer)
* Se pueden descargar los paquetes desde https://veyon.io/download/
