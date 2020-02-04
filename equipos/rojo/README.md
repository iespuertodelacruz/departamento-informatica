
`Actualmente están en el aula comodín1.`

---
# Equipos ROJO

Relación de equipos:

| Fila | PC | MAC               | Estado | Observaciones            |
| ---- | -- | ----------------- | ------ | ------------------------ |
| d    | 01 |                   | ?      | |
| d    | 02 |                   | rev    | Problemas con la tarjeta gráfica |
| d    | 03 |                   | rev    | Pantalla OK pero sin imagen. PDTE Cambiar t.gráfica |
|      |    |                   | ?      | |
|      | 05 |                   | rev    | Problemas con MV |
|      |    |                   | ?      | |
|      | 07 |                   | rev    | Problema GUEST. Para INFO DAM está OK |
|      | 08 |                   | ? ||
|      | 09 |                   | rev    | Problema GUEST |
|      | 10 |                   | ?      ||
|      | 11 |                   |        | OK para INFO DAM |
|      | 12 |                   | ?      ||
|      | 13 |                   | rev    | Problema GUEST. Para INFO DAM está OK |
|      | 14 |                   | rev    | Problemas de teclado |
|      |    |                   | ? ||
|      |    |                   | ? ||
|      |    |                   | ? ||
|      |    |                   | ? ||
|      |    |                   | ? ||
|      |    |                   | ? ||
|      | 21 |                   |   | Poca RAM para virtualizar Ubuntu 18.4 |
| a    | 22 | 20-CF-30-8E-A2-EF |   | PC profesor |
| a    | 23 | 00:24:81:21:6c:33 |   ||
| a    | 24 | 00:24:81:21:a5:b3 | rev   | Problemas con el teclado. Tecla CTRL |
| a    | 25 | 00:24:81:21:a4:ab |       |
| a    | 26 | 00:24:81:21:a4:ce | rev   | Problemas con el teclado |
| a    | 27 | 00:24:81:21:a4:b8 | rev   | Error interno SO. Pantalla mal. Problema GUEST. Máquina lenta |
| a    | 28 | 00:24:81:21:a5:97 | rev   | Problemas con el teclado. Problema GUEST |

## Hardware 

HP Compaq:
* BIOS: legacy
* RAM: 4GB
* CPU: 64 bit
* Disco: 466GB HDD
* SO: Xubuntu 16.04

HP Compaq DC7900:
* BIOS: legacy
* RAM: 2GB
* CPU: Core2Duo E8500 3.16 GHz
* Disco: 250GB HDD
* SO: Xubuntu 16.04

PC profesor:
* BIOS: legacy
* RAM 2GB
* CPU: 32 bits
* Disco : 931 GB
* SO: Windows

---
# Usuarios

* alumno
* dam
* dam1a
* dam1b
* dam2
* dam3
* guest
* super
* tfy1

Información sobre consumo de las cuentas de usuario:
```
# du -sh /home/*
1,1G	alumno
111M	dam
695M	dam1a
427M	dam1b
833M	dam2
13G	dam3
3,2G	guest
1,6G	super
298M	tfy1
```

---
# Discos y particiones


```
$ sudo fdisk -l

Disk /dev/sda: 465,8 GiB, 500107862016 bytes, 976773168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xd8e1d8e1

Disposit.  Inicio    Start     Final  Sectores   Size Id Tipo
/dev/sda1             2048   7813119   7811072   3,7G 82 Linux swap / Solaris
/dev/sda2  *       7813120  66406399  58593280    28G 83 Linux
/dev/sda3         66408446 488396799 421988354 201,2G  5 Extendida
/dev/sda5         66408448 488396799 421988352 201,2G 83 Linux
```

```
$ df -hT
S.ficheros     Tipo     Tamaño Usados  Disp Uso% Montado en
/dev/sda2      ext4        28G    19G  7,5G  72% /
/dev/sda5      ext4       198G    21G  168G  11% /home
```

---
## Software

Se usa el siguiente [Script](files/script-instalar-aula206_v3.rb) de instalación. Además hay software que aparece en el usuario dam3:
* Android Studio
* Angular Base
* NetBeans
* Eclipse
* sqldeveloper en dam2?

Software que aparece en el directorio /opt
```
root@pc19comodn1:/opt# du -sh *
1,3G	android-studio
525M	atom
264M	brackets
193M	godot-engine
227M	SceneBuilder
21M	sublime_text
```

Hay un script [reset-user.rb](files/reset-user.rb) que se encarga de reinicializar usuario en cada reinicio de máquina.
