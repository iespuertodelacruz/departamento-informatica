
# Crear una imagen de arranque con VHD

En lugar de tener usar una MV desde VirtualBox, esta guía explica como configurar una MV para que se inicie en la máquina real cargándose directamente
desde GRUB.

## Crear el fichero VHD

* Empezamos creando la MV en VirtualBox:
    * Eligir el almacenamiento de tipo VHD.
    * El fichero VHD debe crearse estático, no dinámico, porque de otra forma grub no lo reconoce
    * No instalar las GuestAdditions de VirtualBox.
* Agregar un script dentro de la máquina virtual `/usr/share/initramfs-tools/scripts/local-premount/script` con el siguiente contenido:

```
#!/bin/sh

modprobe loop
modprobe ext4

# Montamos la partición con el fichero vhd  /dev/sdc2.
# Observar que la variable ROOT la toma del parámetro pasado por grub
mkdir /host
mount -n -t ext4 -o rw,data=ordered ${ROOT} /host

# kpartx para hacer los mapeos de /dev con nuestro vhd. La variable loop es la que hemos definido en grub
loop_pt=$(kpartx -av /host${loop} 2>&1 | grep loop | cut -f3 -d" ")

# finalmente montamos el sistema
mount -n -t ext4 -o loop,rw,data=ordered /dev/mapper/${loop_pt} ${rootmnt}
```

* Para regenerar el initrd hacemos: `update-initramfs -c -k  nombredelaversiondelnucleo`. Actualmente con Ubuntu LTS 20 y con el núcleo 5.4.0-52 nos quedaría lo siguiente: `update-initramfs -c -k 5.4.0-52-generic`

## Configurar GRUB

Modificar los ficheros de configuración de GRUB.
* Para ello modificamos el fichero `/etc/grub.d/40_custom` con el siguiente contenido.

> Aclaración sobre la nomenclaturas de discos y particiones.
>
> Podemos hacer una transformación asociando: a => 0, b => 1, ... Así para grub el /dev/sdb sería hd1, si fuera /dev/sdc sería hd2,...
>
> Las particiones se mantienen igual. De esa forma si tenemos la imagen en /dev/sdc2 pondríamos en GRUB: (hd2,2) donde el primer dato: hd2 haría referencia a /dev/sdc y el segundo dato después de la coma: 2 haría referencia a la segunda partición: sdc2

```
#!/bin/sh
exec tail -n +3 $0
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.
menuentry "VHD Ubuntu, Linux" {
  insmod vbe
  insmod vga
  insmod video_bochs

  insmod ntfs
  insmod linux
  insmod part_gpt
  insmod part_msdos
  insmod ext2
  insmod lvm
  insmod ntfs
  insmod probe
  insmod gzio
  insmod lzopio
  set isofile="vhd_desde_grub/lubuntu20.vhd"
  set imagen="vmlinuz-5.4.0-52-generic"
  set inicio="initrd.img-5.4.0-52-generic"
  loopback loop (hd0,6)/$isofile tdisk=VHD

  linux (loop,1)/boot/$imagen root=/dev/sda6 rw loop=/$isofile
  initrd (loop,1)/boot/$inicio
}
```

* En el ejemplo anterior tenemos el fichero VHD en la carpeta `vhd_desde_grub/lubuntu20.vhd`, dentro de la partición `hd0,6`.

> Aclaraciones:
>
> * En la línea que carga el kernel: `linux (loop,1)/boot/$imagen root=/dev/sda6 rw loop=/$isofile` debemos poner en el parámetro root el nombre de la partición donde tenemos puesta nuestra imagen vhd.
> * OJO NO funciona usar enlaces para cargar el núcleo. Hay que poner el nombre del fichero real. Por ejemplo: `set imagen="vmlinuz-5.4.0-52-generic"`y `set inicio="initrd.img-5.4.0-52-generic"`

* Ahora hay que lanzar el siguiente comando para aplicar los cambios a GRUB: `update-grub2`.
* Reiniciamos el equipo, y ahora nos debe aparecer una nueva entrada en el menú de GRUB para iniciar el SO dentro del fichero VHD.

## Otro Ejemplo

Imaginemos que tenemos una partición de almacenamiento en un tercer disco donde ponemos todas nuestras máquinas virtuales.

Así el siguiente ejemplo es lo que tengo en mi equipo ( tengo un tercer disco donde su segunda partición está dedicada exclusivamente a todas las máquinas virtuales )

Ejemplo de menuentry:

```
menuentry "VHD Ubuntu, Linux" {
     insmod vbe
     insmod vga
     insmod video_bochs

     insmod ntfs
     insmod linux
     insmod part_gpt
     insmod part_msdos
     insmod ext2
     insmod lvm
     insmod ntfs
     insmod probe
     insmod gzio
     insmod lzopio
     set isofile="VirtualBoxVMs/lubuntu20/lubuntu20.vhd"
         set imagen="vmlinuz-5.4.0-52-generic"
         set inicio="initrd.img-5.4.0-52-generic"
     loopback loop (hd2,2)/$isofile tdisk=VHD

     linux (loop,1)/boot/$imagen root=/dev/sdc2 rw loop=/$isofile
     initrd (loop,1)/boot/$inicio
}
```
