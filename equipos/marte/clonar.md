
# 1. Proceso de clonación - MARTE

## 1.1 Boot sequence

1. Encender equipo y pulsar F10 para acceder a la UEFI-BIOS.
    * Avanzado -> Secure Boot Configuration
    * `Legacy Support Enable and Secure Boot Disable`
1. Iniciar PC con pendrive Clonezilla.
    * Pulsar F9 para mostrar `Boot Menu`
    * Elegir `Legacy USB DISK 2.0...(con clonezilla)`

## 1.2 Clonar por entorno gráfico

> NOTA: Localizar los discos con las imágenes para clonar.
>
> * Indicar que en los discos externos del departamento hay 2 particiones, una de arranque de 1GB con el clonezilla (en principio todos tienen la misma versión de clonezilla) y la otra con el espacio restante donde están las imágenes, así que ya no es necesario usar los pendrives, se puede hacer todo desde los discos duros externos. Al usar el disco externo hay que elegir la partición sdb2 y cuando pregunte dónde están las imágenes, como están en el raíz, pulsar el "DONE" directamente sin elegir ningún directorio.
> * Al conectar los discos duros, hay que fijarse que el conector sea USB 3.0 (conector azul o indica SS), porque si se pone en otro conector USB 2.x, la clonación va a durar más del doble de tiempo.

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

# 2. Comandos para clonar

En lugar de clonar usando el entorno gráfico, también podemos usar directamente el comando. Cuando se conoce es más rápido.

Por ejemplo, iniciar un CDLIVE que tenga la herramienta de clonación que usa Clonezilla (`partclone`), y luego los comandos que se invocan son:

Para restaurar el disco `nvme0n1`:
```
/usr/sbin/ocs-sr -g auto -e1 auto -e2 -r -j2 -c -scr -p choose restoredisk 201905-marte-nvme0n1 nvme0n1
```

Para restaurar el disco `sda`:
```
/usr/sbin/ocs-sr -g auto -e1 auto -e2 -r -j2 -c -scr -p choose restoredisk 201905-marte-sda sda
```

---

# 3. Problemas encontrados y las soluciones propuestas

## 3.1 Problemas con el GRUB (EN PC4 y PC6)

**Descripción**

La creación de la imagen y la restauración se hacen usando versiones diferentes de Clonezilla, y esto conlleva que las versiones de GRUB también sean diferentes (en principio la 2.02 y la 2.02-2). Tras terminar de clonar, parece que el proceso fue bien, pero el GRUB no funciona correctamente y al arrancar los equipos se queda en una pantalla de shell con prompt y el siguiente mensaje:

```
GNU GRUB version 2.02
Minimal BASH-like line editing is supported. For the first word, TAB lists possible command completions. Anywhere else TAB lists possible device or file completion.

grub> _
```

**SOLUCIÓN:**

Se prueba a clonar de nuevo el equipo con la versión correcta de Clonezilla, pero el error sigue siendo el mismo. Buscando en foros, se encuentra en varios de ellos una solución similar usando boot-repair (https://itsfoss.com/fix-minimal-bash-line-editing-supported-grub-error-linux/). Usando un LiveCD instalamos el boot-repair tal y como se indica en las instrucciones, todo funciona bien, pero se requiere exactamente la misma imagen del sistema operativo instalado para restaurar. Nos descargamos una imagen de OpenSUSE Leap 15.0, que es en principio la que tiene la imagen, pero aún así da error de versión no válida y no se consigue que se restaure el grub.

Como habíamos perdido ya mucho tiempo probando diferentes alternativas, se decide ser un poco más "drástico". Usamos el LiveCD para instalar la versión mínima de Ubuntu (la instalación es bastante rápida, el instalador está en el pendrive naranja). Una vez finaliza la instalación mínima de Ubuntu, volvemos a clonar y ahora sí funciona todo bien (seguro que hay una solución más "elegante", pero esta es bastante rápida)

## 3.2 Problemas con la EFI-BIOS (PC12 y PC16)

**Descripcion**

Estos dos equipos tenían problemas con la BIOS. En el PC12 no entraba al menú de la BIOS usando ESC ni F9, F10, etc., mientras que el PC16 encendía correctamente, pero al apagar el botón de encendido cambiaba a rojo y daba una serie de pitidos, y la clonación no acababa correctamente.

HP usa un código de colores para informar de los errores, y en concreto el PC16 tenía el error 2.3 (el LED del botón de encendido daba 2 destellos rojos largos y luego 3 blancos cortos): https://support.hp.com/ee-en/document/bph07107 Según esta tabla, el error 2.3 es "The embedded controller policy requires the user to enter a key sequence." y la solución "1. Follow any prompts given. 2. If issue persists, attempt Sure Start recovery"

**SOLUCIÓN:**

Tras consultar en varias páginas de HP, parece que ambos casos se puede acceder a la BIOS arrancando el equipo mientras se pulsa la combinación de teclas Windows+B, pero sólo si esta combinación está activada en los modelos en cuestión (parece que principalmente en portátiles). Se intenta, pero el equipo no entra en la BIOS.

Se procede entonces a actualizar la BIOS desde Windows para restaurar los valores de fábrica:
* Nos conectamos a la página de drivers y software de HP: https://support.hp.com/us-en/drivers, elegimos DESKTOP
* Nos dice que introduzcamos el número de serie, el número de producto o el modelo (toda esta información está al fondo de la parte superior de los equipos). Intentamos números de serie y producto, pero no funcionan, el que sí funciona es el modelo: HP EliteDesk 880 G3 Tower PC (https://support.hp.com/us-en/drivers/selfservice/hp-elitedesk-880-g3-tower-pc/15776511)
* Nos vamos a la sección BIOS y descargamos la última disponible (ahora mismo la última es la versión 2.27: HP EliteDesk 800 G3 System BIOS (P01) 02.27 Rev.A", que se supone que incorpora el BCU (Bios Config Utility) necesario para actualizar.
* Ejecutamos el fichero descargado, y nos indica diferentes formas de actualizar la BIOS, elegimos la opción: HP BIOS Update and Recovery (HPBIOSUPDREC) BIOS Flashing
* Dentro de esa opción, elegimos EJECUTAR el HPBIOSUPDREC (es IMPORTANTE EJECUTAR directamente el fichero, NO descargarlo y ejecutarlo, porque si se hace así, no va a encontrar los ficheros de la BIOS)
* Luego seguimos las instrucciones de pantalla, básicamente es ir aceptando lo que se indica. Durante la actualización el equipo se enciende y se apaga, es importante dejar que termine de actualizar, sin tocar nada.
* Una vez termina de actualizar, ya se puede entrar en la BIOS sin problema, y el equipo se puede clonar igual que los otros

> NOTA: Aunque en principio no sea necesario, antes de hacer los pasos descritos también se instaló la última versión del BCU (Bios Configuration Utility) que se descargó desde la web: https://ftp.hp.com/pub/caps-softpaq/cmit/HP_BCU.html  (se eligió la última versión, pero esto en principio no es necesario porque el instalador de la BIOS ya incluye el BCU).
