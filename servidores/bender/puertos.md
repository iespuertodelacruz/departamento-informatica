
# Router BENDER

## PENDIENTE - Redireccionar puertos

Para redireccionar puertos en un router cisco, hay que tener cierta información:
* El puerto que necesitamos abrir
* La ip fija del servidor que queremos abrir a internet
* El puerto que queremos abrir hacía internet

El comando sería:
```
ip nat inside source static [tcp/udp] [ip servidor local] [puerto local] interface [Interfaz wan] [puerto exterior]
```

> Un ejemplo para abrir un servidor web:
> ```
> Router(config)# ip nat inside source static tcp 192.168.1.1 80 interface FastEthernet0/1 80
> ```
>
> El puerto 80 del host que tenga la ip 192.168.1.1 será accesible desde fuera de la red local, con lo cual la gente de Internet podrá acceder a nuestra pagina web.

* `ssh user@IP-de-Bender`, Iniciar conexión SSH para entrar al router
* `BENDER# show running-config`, para consultar la configuración de las interfaces que vamos a modificar.

```
!
interface GigabitEthernet0/1
 ip address 192.168.1.254 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
 duplex auto
 speed auto
!         
interface GigabitEthernet0/1/0
 no ip address
 duplex auto
 speed auto
!         
interface GigabitEthernet0/1/0.20
 encapsulation dot1Q 20
 ip address 172.20.0.1 255.255.0.0
 ip nat inside
 ip virtual-reassembly in
!
```

* `BENDER# configure terminal`, activar el modo de configuración.
* `BENDER(config)# ip nat source static tcp 172.20.1.2 22 interface GigabitEthernet0/1 2222`, activar la redirección del puerto 2222.
