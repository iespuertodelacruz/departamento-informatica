
# Equipos MARTE

| Parámetro | Valor |
| --------- | ----- |
| Responsable | Departamento de Informática |
| Uso actual  | 2ASIR y 2DAW |
| Cantidad    | 30 |
| Adquisición | Finales del curso 201718 |
| Comprado en | Entregados por la consejería |

---

# Hardware

_Pendiente_

| Hardware | Descripción |
| -------- | ----------- |
| CPU      |
| RAM      | 16 GB |
| Disco 1  | SSH 128 GB |
| Disco 2  | HDD 500 GB |
| T Red    | |
| Monitor  | |

---

# Software

| Software        | Detalle                           |
| --------------- | --------------------------------- |
| SSOO base       | [OpenSUSE Leap 15.0](opensuse.md) |
| Servicio de red | Usar NetworkManager en lugar de Wicked |
| Aplicaciones instaladas | Consultar [script de instalación](./files/install.sh) para ver el detalle del software instalado. |
| Repositorios agregados | [atom](./files/atom.repo), [Education](./files/Education.repo), [virtualbox](./files/virtualbox.repo) y [visualcode](./files/visualcode.repo) |

---

# Usuarios

| Nombre | Descripción |
| ------ | ----------- |
| asir   | Usar en turno de mañana por los alumnos y profesores |
| daw    | Usar en turno de tarde por los alumnos y profesores |
| super  | Sólo para tareas del sistema |
| root   | Sólo para tareas del sistema |

---

# Particiones

```
# fdisk -l

Disco /dev/nvme0n1: 238,5 GiB
Tipo de etiqueta de disco: gpt

Disposit.  Tamaño Tipo
nvme0n1p1    476M Sistema EFI
nvme0n1p2    2,8G Linux swap
nvme0n1p3   74,5G Sistema de ficheros de Linux
nvme0n1p4   74,5G Sistema de ficheros de Linux
nvme0n1p5   86,2G Sistema de ficheros de Linux

Disco /dev/sda: 465,8 GiB
Tipo de etiqueta de disco: gpt

Disposit.  Tamaño Tipo
sda1       235,8G Sistema de ficheros de Linux
sda2         230G Sistema de ficheros de Linux
```

```
# df -hT

S.ficheros     Tipo     Tamaño Usados  Disp Uso% Montado en
/dev/nvme0n1p1 vfat       476M   9,6M  466M   3% /boot/efi
/dev/nvme0n1p3 btrfs       75G    15G   59G  20% /
/dev/sda1      xfs        236G   376M  236G   1% /home/asir
/dev/sda2      xfs        230G   605M  230G   1% /home/daw
```
