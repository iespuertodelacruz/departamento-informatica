
# Switch Cisco SOL

SOL es un switch Cisco. En este documento tenemos algunas miniguías para hacer
acciones en dicho switch.

## Cambiar la asociación de los puertos a VLAN

Entrar al switch:
* `ssh usuario@172.20.255.1`, Iniciar conexión SSH para entrar al switch.
  Este switch sólo tiene habilitado el acceso desde la VLAN20.
* `Switch2960X# show running-config`, para consultar la configuración.

Podemos ver cómo están asociados los puertos del switch a cada VLAN:

```
!
interface FastEthernet0
 no ip address
!
interface GigabitEthernet0/1
 switchport access vlan 18
 switchport mode access
!
interface GigabitEthernet0/2
 switchport access vlan 18
 switchport mode access
!
interface GigabitEthernet0/3
 switchport access vlan 19
 switchport mode access
!         
interface GigabitEthernet0/4
 switchport access vlan 19
 switchport mode access
!         
interface GigabitEthernet0/5
 switchport access vlan 26
 switchport mode access
```

* `Switch2960X# show vlan`, consultar la asociación de puertos a cada VLAN.

```
VLAN Name                             Status    Ports
---- -------------------------------- --------- -------------------------------
1    default                          active    Gi0/9, Gi0/10, Gi0/11, Gi0/12, Gi0/21, Gi0/24, Gi0/25, Gi0/26
16   VLAN0016                         active    Gi0/15, Gi0/16, Gi0/17, Gi0/18, Gi0/19, Gi0/20
18   VLAN0018                         active    Gi0/1, Gi0/2
19   VLAN0019                         active    Gi0/3, Gi0/4
20   VLAN0020                         active    Gi0/13, Gi0/14
26   VLAN0026                         active    Gi0/5, Gi0/6
29   VLAN0029                         active    Gi0/7, Gi0/8
30   VLAN0030                         active    
```

Vamos a cambiar la asociación de puertos:

* `Switch2960X# configure terminal`, activar el modo de configuración.
* `Switch2960X(config)# interface range GigabitEthernet 0/13-14`, defino el rango de puertos que quiero configurar.
* `Switch2960X(if-config)# switchport mode access`
* `Switch2960X(if-config)# switchport access vlan 20`, asigno los puertos a una vlan.
* `Switch2960X(if-config)# exit`
* `Switch2960X(config)# exit`

Comprobamos:
* `Switch2960X# show vlan`

Grabar los cambios de configuración de forma permanente:
* `Switch2960X# show running-config`, consultar los cambios realizados
* `Switch2960X# copy running-config startup-config`, grabar los cambios de forma permanente.
* `Switch2960X# exit`, salir del switch.

---

# Configuración marzo-2021

```
Switch2960X#show running-config
Building configuration...

Current configuration : 2756 bytes
!
! No configuration change since last restart
!
version 15.0
no service pad
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname Switch2960X
!
boot-start-marker
boot-end-marker
!
!
enable secret 5 $1$Frgo$kLwaolc94hL4gpbGZlxQo0
!
username admin privilege 15 secret 5 $1$Jse0$5qH4vXtTJ2D1Lrqw3xWy./
no aaa new-model
clock summer-time UTC recurring last Sun Mar 1:00 last Sun Oct 2:00
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!         
!
!
!
!
!
vlan internal allocation policy ascending
!
!
!
!
!
!
interface FastEthernet0
 no ip address
!
interface GigabitEthernet0/1
 switchport access vlan 18
 switchport mode access
!
interface GigabitEthernet0/2
 switchport access vlan 18
 switchport mode access
!
interface GigabitEthernet0/3
 switchport access vlan 19
 switchport mode access
!
interface GigabitEthernet0/4
 switchport access vlan 19
 switchport mode access
!
interface GigabitEthernet0/5
 switchport access vlan 26
 switchport mode access
!
interface GigabitEthernet0/6
 switchport access vlan 26
 switchport mode access
!
interface GigabitEthernet0/7
 switchport access vlan 29
 switchport mode access
!
interface GigabitEthernet0/8
 switchport access vlan 29
 switchport mode access
!
interface GigabitEthernet0/9
 switchport mode access
!
interface GigabitEthernet0/10
 switchport mode access
!
interface GigabitEthernet0/11
 switchport mode access
!
interface GigabitEthernet0/12
 switchport mode access
!
interface GigabitEthernet0/13
 switchport access vlan 20
 switchport mode access
!
interface GigabitEthernet0/14
 switchport access vlan 20
 switchport mode access
!
interface GigabitEthernet0/15
 switchport access vlan 16
 switchport mode access
!
interface GigabitEthernet0/16
 switchport access vlan 16
 switchport mode access
!
interface GigabitEthernet0/17
 switchport access vlan 16
 switchport mode access
!
interface GigabitEthernet0/18
 switchport access vlan 16
 switchport mode access
!
interface GigabitEthernet0/19
 switchport access vlan 16
 switchport mode access
!
interface GigabitEthernet0/20
 switchport access vlan 16
 switchport mode access
!
interface GigabitEthernet0/21
!
interface GigabitEthernet0/22
 switchport mode trunk
!
interface GigabitEthernet0/23
 switchport mode trunk
!
interface GigabitEthernet0/24
 switchport mode trunk
!
interface GigabitEthernet0/25
!
interface GigabitEthernet0/26
!
interface Vlan1
 no ip address
!
interface Vlan19
 no ip address
!
interface Vlan20
 ip address 172.20.255.1 255.255.0.0
!
ip default-gateway 172.20.0.1
ip http server
ip http secure-server
!
!         
!
line con 0
line vty 0 4
 privilege level 15
 login local
 transport input ssh
line vty 5 15
 login local
 transport input ssh
!
end
```
