
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

| Hardware | Descripción |
| -------- | -------------- |
| CPU      |
| RAM      | 16 GB |
| Disco 1  | SSH 128 GB |
| Disco 2  | HDD 500 GB |
| T Red    | |
| Monitor  | |

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

---

# Usuarios

| Nombre   | Descripción |
| -------- | ----------- |
| asir     | Para usar en el turno de mañana por los alumnos y profesores |
| daw      | Para usar en el turno de tarde por los alumnos y profesores |
| super    | Sólo para tareas del sistema |
| root     | Sólo para tareas del sistema |

---

# Particiones


---

# Software

| Software | Descripción |
| -------- | ----------- |
| SSOO     | Windows10 pro education |

* Consultar script de instalación para ver el detalle del software instalado.
