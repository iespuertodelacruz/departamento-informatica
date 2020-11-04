
# Crear una imagen de arranque con VHD

En lugar de tener usar una MV desde VirtualBox, esta guía explica como
configurar una MV para que se inicie en la máquina real cargándose directamente
desde GRUB.

* Empezamos creando la MV en VirtualBox, pero eligiendo el almacenamiento
de tipo VHD. En este ejemplo supondremos que tenemos el VHD en la ruta `vhd_desde_grub/lubuntu20.vhd`,
dentro de la partición `hd0,6`.
* Vamos a modificar los ficheros de configuración de GRUB. Para ello creamos el fichero `/etc/grub.d/20_ubuntu_vhd` con el siguiente contenido:

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

* Ahora hay que lanzar el siguiente comando para aplicar los cambios a GRUB: `update-grub2`.
* Reiniciamos el equipo, y ahora nos debe aparecer una nueva entrada en el menú de GRUB para iniciar el SO dentro del fichero VHD.
