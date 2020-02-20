
# Equipos VERDE

| Parámetro   | Valor          |
| ----------- | -------------- |
| Responsable | Centro         |
| Uso         | Todo el centro |
| Cantidad    | ?              |
| Adquisición | ?              |
| Comprado en | ?              |

---

# 1. Hardware

| Hardware | Descripción           |
| -------- | --------------------- |
| Modelo   | HP Compaq             |
| CPU      | Intel i5-6400 2,7 GHz |
| RAM      | 8 GB                  |
| Disco    | 932 GB |
| T Red    | ? |
| Monitor  | ? |

---

# 2. Configuraciones

## 2.1 Software

| Software | Descripción   |
| -------- | ------------- |
| SSOO     | Xubuntu 16.04 |
| Aplicaciones | Se instaló el software del siguiente [script](./files/script-instalar-aula206_v3.rb) |

> Pendiente de documentar las aplicaciones que se hayan instalado en cada usuario individual.

---

## 2.2 Usuarios

| Nombre   | Descripción |
| -------- | ----------- |
| Invitado | Usar por la ESO y bachillerato. Se limpia en cada inicio de sesión. Si se quiere persistencia, usar pendrive o email. |
| alumno   | Usar en Tecnología. Se limpia en cada encendido del PC. Se mantiene la persistencia durante 1 día. Si se quiere más persistencia, usar pendrive o email. |
| tfy1     | ? |
| dam      | ? |
| dam1a    | ? |
| dam1b    | ? |
| dam2     | ? |
| dam3     | ? |
| super    | Sólo para tareas del sistema |
| root     | Sólo para tareas del sistema |

> NOTA: En /home se deben guardar ficheros tar con las copias de seguridad de los home de los usuarios en el momento de empezar el curso. La idea es usarlos el próximo septiembre para restaurar dichos usuarios.

## 2.3 Script de personalización del usuario Alumno

En la carpeta `/home/guest`, están los ficheros/scripts que ayudan a gestionar el comportamiento de limpieza del usuario `alumno`.

```
pc31aula206# vdir
-rw-r--r-- 1 root root 1214126080 dic 21  2015 alumno-con-cocodrile.tar
-rw-r--r-- 1 root root 1104486400 dic  3  2015 alumno-sin-cocodrile.tar
-rw-r--r-- 1 root root 1109893120 jun 10  2016 alumno.tar
-rw-r--r-- 1 root root          9 sep 30 07:06 last_execution.dat
-rwxr-xr-x 1 root root        580 dic 21  2015 reset-user.rb
-rwxr-xr-x 1 root root       4663 jun 14  2016 script-instalar-aula206_v3.rb
```

El script [reset-user.rb](./files/reset-user.rb), hace la limpieza del usuario `alumno` cuando el último reinicio registrado (Fichero `last-execution.dat`) es inferior a la fecha actual. Esto es, el fichero `alumno.tar` es el que se usa para restaurar al usuario alumno.

Además el script se puede personalizar para crear un `/home/alumno` con Cocodrile o sin Cocodrille.
* `cp alumno-con-cocodrile.tar alumno.tar`, si queremos que el el siguiente reinicio de PC, el alumno se limpie con Cocodrile.
* `cp alumno-sin-cocodrile.tar alumno.tar`, si queremos que el el siguiente reinicio de PC, el alumno se limpie sin Cocodrile.

Cocodrile es una aplicación de Windows privativa que se ejecuta en GNU/Linux a través del emulador wine. NO SE PUEDE instalar Cocodrile en todos los equipos de forma indiscriminada por limitaciones de la licencia. SOLO SE PUEDE instalar Cocodrile en los equipos que determine el departamento de Tecnología, responsable de las licencias de Cocodrile.

## 2.4 Particiones

```
pc31aula206# df -hT

S.ficheros     Tipo     Tamaño Usados  Disp Uso% Montado en
udev           devtmpfs   3,9G      0  3,9G   0% /dev
tmpfs          tmpfs      787M   9,7M  777M   2% /run
/dev/sda2      ext4        28G    19G  7,1G  74% /
tmpfs          tmpfs      3,9G    23M  3,9G   1% /dev/shm
tmpfs          tmpfs      5,0M   4,0K  5,0M   1% /run/lock
tmpfs          tmpfs      3,9G      0  3,9G   0% /sys/fs/cgroup
/dev/sda5      ext4       886G    69G  773G   9% /home
cgmfs          tmpfs      100K      0  100K   0% /run/cgmanager/fs
tmpfs          tmpfs      787M    40K  787M   1% /run/user/1000


pc31aula206# fdisk -l

/dev/sda: 931,5 GiB, 1000204886016 bytes, 1953525168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0xd8e1d8e1

Disposit.  Inicio    Start      Final   Sectores   Size Id Tipo
/dev/sda1             2048    7813119    7811072   3,7G 82 Linux swap / Solaris
/dev/sda2  *       7813120   66406399   58593280    28G 83 Linux
/dev/sda3         66406400 1953525167 1887118768 899,9G  5 Extendida
/dev/sda5         66408448 1953525167 1887116720 899,9G 83 Linux
```
