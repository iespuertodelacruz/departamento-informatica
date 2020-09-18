
# Servidor LEELA

## Configuración

* Tarjeta de red eth0 con IP 172.20.1.2.
* Tarjeta de red eth1 son configurar.
* Tiene 3 discos en raid 0.
* Esquema de particionado actual:
```
root@leela:/home/profesores/david# fdisk -l
Disk /dev/sda: 464,5 GiB, 498753077248 bytes, 974127104 sectors

Disposit.  Inicio    Start     Final  Sectores   Size Id Tipo
/dev/sda1  *            63  50395904  50395842    24G 83 Linux
/dev/sda2         50395905  50411969     16065   7,9M 82 Linux swap / Solaris
/dev/sda3         50412031 974117339 923705309 440,5G  5 Extendida
/dev/sda5         50412033 974117339 923705307 440,5G 83 Linux
```

* SO base Ubuntu 16.04 (Xenial).

---

## Servicios instalados

* Servidor web Apache 2 que hace las funciones de NAS.
* Servidor SSH para los profesores.
* [Servidor FreeRadius](freeradius.md)
