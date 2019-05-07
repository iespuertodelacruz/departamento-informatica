
# Proceso de clonación - MARTE

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

---

# Comandos

La herramienta de clonación que usa Clonezilla es `partclone`.

Los comandos que se invocan son:

```
/usr/sbin/ocs-sr -g auto -e1 auto -e2 -r -j2 -c -scr -p choose restoredisk 201905-marte-nvme0n1 nvme0n1
```

```
/usr/sbin/ocs-sr -g auto -e1 auto -e2 -r -j2 -c -scr -p choose restoredisk 201905-marte-sda sda

```
