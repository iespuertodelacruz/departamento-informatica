
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

* SSOO base: OpenSUSE Leap 15.0
* Aplicaciones instaladas: Consultar [script de instalación](./files/install.sh) para ver el detalle del software instalado.
* Repositorios agregados: [atom](./files/atom.repo), [Education](./files/Education.repo), [virtualbox](./files/virtualbox.repo) y [visualcode](./files/visualcode.repo).

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

---

# Proceso de clonación

1. Encender equipo y pulsar F10 para acceder a la UEFI-BIOS.
    * Avanzado -> Secure Boot Configuration
    * `Legacy Support Enable and Secure Boot Disable`
1. Iniciar PC con pendrive Clonezilla.
    * Pulsar F9 para mostrar `Boot Menu`
    * Elegir `Legacy USB DISK 2.0...(con clonezilla)`
1. Realizar la clonación (Las imágenes están en los discos externos USB del departamento). Durante al clonación elegimos las siguientes opciones:
    * Idioma: `es_ES`
    * `device-image`
    * `local_dev`, lugar de donde cogemos las imágenes.
    * Poner disco USB con las imágenes y esperar 5 segundos.
    * CTRL+C para seguir
    * Montar partición sdc2 (Donde estén las imágenes)
    * `Done`
    * `Beginner`
    * `Restore Disk`. Estos equipos tienen configuración Marte con dos discos que se clonan por separado. Esto es:
        * Imagen 201905-marte-nvme0n1 => Disco 1 (nvme0n1)
        * Imagen 201905-marte-sda => Disco 2 (sda)
1. Al terminar, reiniciar. Tendremos un mensaje de error "Bootable Device Not found".
    * Pulsar `F2` para entrar en "System Disagnostics".
    * Elegir `Hard drive Check -> Quick -> Test All`
    * Reiniciamos. Si se repite el mensaje de error. Repetimos este paso.
