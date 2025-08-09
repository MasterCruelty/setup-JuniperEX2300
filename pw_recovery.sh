On EX2300/EX3400 switches, the password recovery procedure is different. Please refer to step 5 in  Troubleshooting Loss of the Root Password​ .

Reboot the switch and interrupt the boot process by pressing "Control + c" when you see the following Main Menu:

Main Menu

1. Boot [J]unos volume
2. Boot Junos volume in [S]afe mode

3. [R]eboot

4. [B]oot menu
5. [M]ore options  <---press 5

Choice:
Options Menu

1. Recover [J]unos volume
2. Recovery mode - [C]LI  <---press 2 
3. Check [F]ile system

4. Enable [V]erbose boot

5. [B]oot prompt

6. [M]ain menu


Choice:
Booting Junos in CLI recovery mode ...
|
/packages/sets/active/boot/os-kernel/kernel data=0xd0c000 syms=[0x4+0x4cde0+0x4+0x6d35f]
/packages/sets/active/boot/os-kernel/ex3400.dtb size=0x1ce1
/packages/sets/active/boot/junos-modules/fips_core.ko text=0x1074 data=0x247 syms=[0x4+0x600+0x4+0x40f]
...
...
...

<Some boot messages omitted>


Starting CLI ...

warning: This chassis is operating in a non-master role as part of a virtual-chassis (VC) system.
warning: Use of interactive commands should be limited to debugging and VC Port operations.
warning: Full CLI access is provided by the Virtual Chassis Master (VC-M) chassis.
warning: The VC-M can be identified through the show virtual-chassis status command executed at this console
warning: Please logout and log into the VC-M to use CLI.

Reset password by typing commands printed in blue 
{linecard:0}
root> configure
Entering configuration mode

{linecard:0}[edit]
root# set system root-authentication plain-text-password
New password:
Retype new password:

{linecard:0}[edit]
root# commit
1970-01-01 00:04:43 UTC: Running FIPS Self-tests
veriexec: no signatures for device. file='/sbin/kats/cannot-exec' fsid=137 fileid=51404 gen=1 uid=0 pid=2433
1970-01-01 00:04:46 UTC: FIPS Self-tests Passed
commit complete

root@11N_SW_A# exit
Exiting configuration mode

root@11N_SW_A> request system reboot
Reboot the system at now? [yes,no] (no) yes

Jan  1 00:06:22 shutdown: reboot requested by root at Thu Jan  1 00:06:22 1970
Shutdown NOW!
[pid 2789]
