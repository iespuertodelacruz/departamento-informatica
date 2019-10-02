
# Apagón

**Descripción**

Cuando hay un apagón o bajada de corriente y no tenemos energía en los equipos.

**Acciones**

* Comprobar que estén todas las palancas subidas. Si no sabemos o están bajadas, comentarlo con el personal de mantenimiento. Ellos se encargan de tocas los cuadros y subir las palancas. OJO: Subir las palancas NO es algo trivial o sin importancia. Hay una forma correcta y otra incorrecta de hacerlo. Para prevenir el daño de los equipos dejar esta tarea a mantenimiento.
* Luego habrá que revisar los servidores (Bender, Leela, Router ADSL, etc.) y comprobar si están encendidos. En caso contrario hay que encenderlos y esperar a que se inicien los servicios para empezar a trabajar en las aulas.

---

# No hay red

**Descripción**

Cuando tengamos problemas con la red en nuestros equipos debemos buscar que partes funcionan y cuáles no, para identificar dónde está el problema.

**Acciones**

Ir a los equipos de los alumnos:
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
