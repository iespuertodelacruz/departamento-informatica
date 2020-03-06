
# Equipos TIERRA

| Parámetro | Valor |
| --------- | ----- |
| Responsable | Departamento de Informática |
| Uso actual  | 1ASIR y 1DAW |
| Cantidad    | 30 |
| Adquisición | ? |
| Comprado en | ? |

> NOTA: Como uno de los equipos lo usa el profesor, se ha incluido otro equipo (PC01) con características diferentes.
---

# 1. Hardware

| Hardware | Descripción |
| -------- | ----------- |
| CPU      |
| RAM      | 8 GB |
| Disco 1  | SSH 128 GB |
| Disco 2  | HDD 1 TB |
| T Red    | |
| Monitor  | |

---
# 2. Software

## 2.1 Sistema y aplicaciones

| Software | Descripción          |
| -------- | -------------------- |
| SSOO     | Lubuntu 16.04.05 LTS |
| Veyon    | Monitorización       |

* Consultar script de instalación para ver el detalle del software instalado.
* Consultar la guía para configurar el montorizador [Veyon](../general/veyon.md)

## 2.2 Actualización

Actualizar todos los equipos al comienzo del curso:
* `sudo apt update`, refrescar el catálogo.
* `sudo apt upgrade`, actualizar todos los paquetes.

Actualizar VirtualBox:
* Como VirtualBox no se instaló mediante repositorio (Es lo recomendado), sino por descargar del fichero deb, entonces debemos actualizar manualmente de la versión 5 a la 6.
* Las Guest Additions de la versión 5 que estaba instaladas ya no funcionan (en la lista de extensiones aparece con una exclamación). Se prueba a cargar una máquina virtual del curso pasado y no funciona. Se procede a desinstalar el paquete de extensiones y se instala el de la versión 6. Se vuelve a cargar la máquina virtual y ahora sí parece funcionar bien.

## 2.3 Usuarios

| Nombre   | Home           | Descripción                              |
| -------- | -------------- |----------------------------------------- |
| asir     | /mnt/asir/home | Turno de mañana por alumnos y profesores |
| daw      | /mnt/daw/home  | Turno de tarde por alumnos y profesores  |
| super    | /home/super    | Sólo para tareas sysadmin del sistema    |
| root     | /root          | Sólo para tareas sysadmin del sistema    |

* Para "limpiar" los home de los usuarios, usamos ficheros tar con la copia de seguridad que se hizo nada más instalar el sistema.

# 2.4 Particiones

```
# fdisk -l

Disk /dev/sda: 119,2 GiB, 128035676160 bytes, 250069680 sectors

Disposit.  Inicio    Start     Final  Sectores  Size Id Tipo
/dev/sda1             2048    206847    204800  100M  b W95 FAT32
/dev/sda2           206848   4401151   4194304    2G 82 Linux swap / Solaris
/dev/sda3          4401152  46344191  41943040   20G 83 Linux
/dev/sda4  *      46344192 250064895 203720704 97,1G  7 HPFS/NTFS/exFAT

Disk /dev/sdb: 931,5 GiB, 1000204886016 bytes, 1953525168 sectors

Disposit.  Inicio      Start      Final  Sectores  Size Id Tipo
/dev/sdb1               2048  949999615 949997568  453G 83 Linux
/dev/sdb2          949999616 1899999231 949999616  453G 83 Linux
/dev/sdb3         1899999232 1953523711  53524480 25,5G  b W95 FAT32
```

```
# df -hT

S.ficheros     Tipo     Tamaño Usados  Disp Uso% Montado en
/dev/sda1      vfat        99M   3,0K   99M   1% /boot/efi
/dev/sda3      ext4        20G    14G  4,8G  75% /
/dev/sdb1      ext4       446G    90G  334G  22% /mnt/asir
/dev/sdb2      ext4       446G   196G  228G  47% /mnt/daw
/dev/sdb3      vfat        26G    80K   26G   1% /mnt/temp
```
