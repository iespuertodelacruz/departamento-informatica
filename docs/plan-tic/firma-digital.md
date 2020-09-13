
# Firma digital

> Enlace de interés:
> * [Firma digital en Ubuntu](https://www.atareao.es/como/firma-digital-en-ubuntu/)

Hay varias formas de firmar y de validar un firma.

## Página web VALIDE

* Primero importamos nuestro certificado en el navegador web.
* Luego vamos a la página web de [VALIDE](https://valide.redsara.es/valide/validarFirma/ejecutar.html)
* Elegimos firmar.

## Aplicación AUTOFIRMA

* Para instalar la aplicación AutoFirma en GNU/Linux hay que decargar un ZIP. Dentro
de este fichero comprimido tenemos varias versiones del instalador para distintas
distribuciones: deb, rpm, rpm para Suse.
* Se ejecuta el programa AutoFirma y se selecciona el fichero que queremos firmar.

Si tenemos problemas porque no se encuentra la firma:
* Buscar el fichero del certificado (p12)
* Hacer doble click en el fichero para intentar importarlo en el depósito de certificados.

## AutoFirma por comandos

Si no funcionan las opciones anteriores, también podemos firmar usando el programa
AutoFirma por comandos. Veamos un ejemplo para firmar un fichero pdf:

```
autofirma sign -i fichero.pdf -o firmado.pdf -store pkcs:/ruta/al/fichero.p12 -filter VARGAS -password CLAVEDELCERTIFICADO
```

Este comando puede muestrar varios warnings pero al final finaliza con éxito.
Para validar la firmar hacemos:

```
autofirma verify -i firmado.pdf
```

Esto nos muestra una ventana donde se nos confirma que el documento está firmado correctamente.
