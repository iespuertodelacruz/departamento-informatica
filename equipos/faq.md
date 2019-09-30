
# No hay red

**Descripción**

Cuando tengamos problemas con la red en nuestros equipos debemos buscar que partes funcionan y cuáles no, para identificar dónde está el problema.

**Ejemplo**

Voy al equipo de los alumnos y compruebo:
* `ip a`, comprobar si coge una configuración de red correcta del DHCP.
* `ping BENDER`, comprobar si tengo acceso al router Bender.
* `ping 192.168.1.1`, comprobar si tengo acceso al router del ISP.
* `ping 8.8.4.4`, comprobar si tengo acceso a Internet desde este equipo.
* `host www.nba.com`, comprobar si el servidor DNS funciona correctamente.

Hacer esta comprobación desde: aula 103, aula108, departamento y servidor Leela.

Si sólo tenemos problemas en un zona, entonces revisar los switches de ese aula, si es de todos, entonces vamos a revisar el router Bender.

Entrar al router Bender y comprobar:
* Que tiene acceso al exterior.
* Que el servidor DHCP está funcionando correctamente.
