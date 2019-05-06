
# Equipos MARTE

30 PC's entregados por la consejería a finales del curso 201718.

---

# Hardware

Los equipos MARTE tienen las siguientes características.
* Memoria: 16 GB RAM
* CPU:
* Disco:
    * 1 disco SSH 128 GB
    * 1 disco HDD 500 GB

---

# Software

(Pendiente de subir script)

---

# Proceso de clonación

1. Encender equipo y pulsar F10 para acceder a la UEFI-BIOS.
    * Avanzado -> Secure Boot Configuration
    * `Legacy Support Enable and Secure Boot Disable`
1. Iniciar PC con pendrive Clonezilla.
    * Pulsar F9 para mostrar `Boot Menu`
    * Elegir `Legacy USB DISK 2.0...`
1. Estos equipos tienen configuración Marte con dos discos que se clonan por separado.
    * Disco 1 (nvme0n1) => Imagen 201905-marte-nvme0n1
    * Disco 2 (sda) => Imagen 201905-marte-sda

> Las imágenes están en los discos externos USB del departamento.

Durante al clonación elegimos las siguientes opciones:
* Idioma: es_ES
* device-image
* local_dev
* Poner disco01 USB y esperar 5 segundos.
* CTRL+
* Montar partición sdc2
* Done
* Begginer
* Restore Disk
