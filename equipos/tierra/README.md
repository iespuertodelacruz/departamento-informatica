
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

# Hardware

| Hardware | Descripción |
| -------- | -------------- |
| CPU      |
| RAM      | 8 GB |
| Disco 1  | SSH 128 GB |
| Disco 2  | HDD 1 TB |
| T Red    | |
| Monitor  | |

---

# Software

| Software | Descripción |
| -------- | ----------- |
| SSOO     | Lubuntu 16.04.05 LTS |
| italc    | Monitorización |

* Consultar script de instalación para ver el detalle del software instalado.

---

# Usuarios

| Nombre   | Home           | Descripción |
| -------- | -------------- |----------- |
| asir     | /mnt/asir/home | Usar en el turno de mañana por alumnos y profesores |
| daw      | /mnt/daw/home | Usar en el turno de tarde por alumnos y profesores |
| super    | Sólo para tareas sysadmin del sistema |
| root     | Sólo para tareas sysadmin del sistema |

---

# Particiones


root@profesor:~# fdisk -l
Disk /dev/sda: 119,2 GiB, 128035676160 bytes, 250069680 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x069d446d

Disposit.  Inicio    Start     Final  Sectores  Size Id Tipo
/dev/sda1             2048    206847    204800  100M  b W95 FAT32
/dev/sda2           206848   4401151   4194304    2G 82 Linux swap / Solaris
/dev/sda3          4401152  46344191  41943040   20G 83 Linux
/dev/sda4  *      46344192 250064895 203720704 97,1G  7 HPFS/NTFS/exFAT


Disk /dev/sdb: 931,5 GiB, 1000204886016 bytes, 1953525168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0x000b8509

Disposit.  Inicio      Start      Final  Sectores  Size Id Tipo
/dev/sdb1               2048  949999615 949997568  453G 83 Linux
/dev/sdb2          949999616 1899999231 949999616  453G 83 Linux
/dev/sdb3         1899999232 1953523711  53524480 25,5G  b W95 FAT32


Disk /dev/zram0: 982 M

root@profesor:~# df -hT
S.ficheros     Tipo     Tamaño Usados  Disp Uso% Montado en
udev           devtmpfs   3,9G      0  3,9G   0% /dev
tmpfs          tmpfs      786M   9,7M  776M   2% /run
/dev/sda3      ext4        20G    14G  4,8G  75% /
tmpfs          tmpfs      3,9G    29M  3,9G   1% /dev/shm
tmpfs          tmpfs      5,0M   4,0K  5,0M   1% /run/lock
tmpfs          tmpfs      3,9G      0  3,9G   0% /sys/fs/cgroup
/dev/sda1      vfat        99M   3,0K   99M   1% /boot/efi
/dev/sdb2      ext4       446G   196G  228G  47% /mnt/daw
/dev/sdb1      ext4       446G    90G  334G  22% /mnt/asir
/dev/sdb3      vfat        26G    80K   26G   1% /mnt/temp
cgmfs          tmpfs      100K      0  100K   0% /run/cgmanager/fs
tmpfs          tmpfs      786M      0  786M   0% /run/user/0
tmpfs          tmpfs      786M    40K  786M   1% /run/user/1001
root@profesor:~# 
