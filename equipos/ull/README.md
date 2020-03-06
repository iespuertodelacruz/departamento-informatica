
---
# Equipos ULL

Relación de equipos:

| Fila | PC | MAC               | Estado | Observaciones            |
| ---- | -- | ----------------- | ------ | ------------------------ |
|      |    |                   |        |                          |
|      |    |                   |        |                          |
|      |    |                   |        |                          |
|      |    |                   |        |                          |
|      |    |                   |        |                          |
|      |    |                   |        |                          |

## Hardware

HP Compaq:
* BIOS: legacy
* RAM: 4GB
* CPU: 64 bit
* Disco: 466GB HDD
* SO: Bardinux (Ubuntu Bionic)


---
# Usuarios

* root
* osl => super
* usuario => alumno

Información sobre consumo de las cuentas de usuario:
```
# du -sh /home/*
```

---
# Discos y particiones


```
$ sudo fdisk -l

```

```
$ df -hT
```

---
## Software

* `apt-get update`, para actualizar los repositorios. Hay uno que da problemas ("gimp" de Otto). Lo he deshabilitado.
* `fuser -kvi /var/lock/dpkg/lock-frontend`, para desbloquear el acceso a las instalaciones. El programa "unattended-upgrade" nos bloquea.

Hay un script [reset-user.rb](files/reset-user.rb) que se encarga de reinicializar usuario en cada reinicio de máquina.
