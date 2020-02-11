
```
Curso: 201920
Autor: Juan Carlos
```

---
# 1. Instalación de linuxbrew en OpenSUSE

**Como superusuario**

* `su -`, nos convertimos a superusuario.
* `zypper install -t pattern devel_C_C++`, esta parece no necesaria por ya instalada.
* `zypper install git curl file`, también ya instalado.
* `su - super`
* `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"`, se solicita password para sudo y luego ya lo hace.

> DUDA: ¿La descarga y/o instalación de linuxbrew se está haciendo sobre /home/linuxbrew?

**Como usuario daw**

Cambiando a usuario `daw` para configurar variables de entorno (PATH y ETC) en profile:

```
exit
su - daw
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.profile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
exit
```

* `chown daw /home/linuxbrew/ -R`, haciendo propietario de la carpeta instalada al usuario `daw`.

> DUDA: ¿Entonces linuxbrew sólo está disponible para el usuario daw? En tal caso, por qué no haber puesto la ruta en /home/daw/linuxbrew?

```
su - daw
source .profile
brew install gcc

echo export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib" >> .profile
echo export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include" >> .profile
echo export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib/pkgconfig" >> .profile

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
source .profile

echo export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH" >> .profile
echo export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH" >> .profile
echo export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH" >> .profile
```

Las últimas líneas son importantes para composer.

---
# 2. Acciones para prevenir problemas con algunas aplicaciones

Lo siguiente es para prevenir diferentes problemas observados con la instalación de los programas: `mysql`, `apache` y `php`. No es preciso para la instalación en sí de linuxbrew.

## 2.1 Instalar mysql@5.7

* `brew install mysql@5.7`

El fichero my.cfg debe contener:
```
# Default Homebrew MySQL server config
[mysqld]
# Only allow connections from localhost
bind-address = 0.0.0.0
log-error = /home/linuxbrew/.linuxbrew/var/log/mysqld.error.log
```

* `mkdir /home/linuxbrew/.linuxbrew/var/log`
* `brew install mysql-client`

```
/home/linuxbrew/.linuxbrew/opt/mysql@5.7/bin/mysql.server start --skip-grant-tables
/home/linuxbrew/.linuxbrew/opt/mysql-client/bin/mysql -uroot

UPDATE mysql.user
    SET authentication_string = ""
    WHERE User = 'root' AND Host = 'localhost';
FLUSH PRIVILEGES;
```

Una vez se entra en modo normal con el root ( sin pass) crear un usuario admin es fácil:
```
GRANT ALL PRIVILEGES ON *.* TO admin@localhost
           IDENTIFIED BY 'something' WITH GRANT OPTION;
```
``
Si hay problemas entrar con skip-grant-tables:
* Lanzar `/home/linuxbrew/.linuxbrew/opt/mysql-client/bin/mysql_upgrade`
* Luego parar servidor, entrar normal.

## 2.2 Instalar apache2

En el fichero `/home/linuxbrew/.linuxbrew/etc/httpd/httpd.conf`:
* Cambiar:
    * User a daw y
    * Group a users.
* To enable PHP in Apache add the following to httpd.conf and restart Apache:

```
    LoadModule php7_module /home/linuxbrew/.linuxbrew/opt/php/lib/httpd/modules/libphp7.so

    <FilesMatch \.php$>
        SetHandler application/x-httpd-php
    </FilesMatch>
```

Para phpmyadmin:
* To enable phpMyAdmin in Apache, add the following to httpd.conf and
restart Apache:

```
    Alias /phpmyadmin /home/linuxbrew/.linuxbrew/share/phpmyadmin
    <Directory /home/linuxbrew/.linuxbrew/share/phpmyadmin/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        <IfModule mod_authz_core.c>
            Require all granted
        </IfModule>
        <IfModule !mod_authz_core.c>
            Order allow,deny
            Allow from all
        </IfModule>
    </Directory>
```

* Then open http://localhost/phpmyadmin

## 2.3 Para instalar xdebug en php

* `pecl install xdebug`
* Luego hay que modificar php.ini al comienzo del fichero:

```
[xDebug]
zend_extension="/home/linuxbrew/.linuxbrew/Cellar/php/7.3.10/pecl/20180731/xdebug.so"
xdebug.remote_enable=1
xdebug.remote_connect_back = 1
xdebug.remote_autostart=1
xdebug.remote_port = 9000
xdebug.idekey = VSCODE
```
