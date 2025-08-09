#You can connect to the management interface over the network using utilities such as ssh and telnet. Simple Network Management Protocol (SNMP) can use the management interface to gather statistics from the switch.
#To configure a management port by CLI commands.
#Use the command “family inet address” to configure a management IP address on the interface.
 
set interfaces me0 unit 0 family inet address 10.93.15.246/21

#Configure a static route with the next hop to the management network default gateway

set routing-options static route 0.0.0.0/0 next-hop  10.93.15.1/21

#if you need to delete a port settings:
delete interfaces me0
#then do again the configuration


configure
et system services ssh
set system services ssh protocol-version v2
set system services ssh root-login deny
set system services ssh rate-limit 10
set system services ssh root-login allow
commit
exit




-------------------------------------------------
#if needed in case of firewall

configure
set firewall family inet filter management term allow-ssh from protocol tcp
set firewall family inet filter management term allow-ssh from port 22
set firewall family inet filter management term allow-ssh then accept
set interfaces me0 unit 0 family inet filter input management
commit
