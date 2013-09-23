==============================
Embedded Linux & Open hardware
==============================

.. contents::

.. section-numbering::

.. raw:: pdf

   PageBreak oneColumn

.. footer::
   
   Page: ###Page###/###Total###,
   Embedded Linux Workshop, IIT Bombay

|

Embedded Linux(EL) 
------------------


What is Embedded Linux ?
~~~~~~~~~~~~~~~~~~~~~~~~

Embedded Linux is the use of Linux in embedded computer systems such as mobile 
phones, personal digital assistants (PDA), media players, set-top boxes, and 
other consumer electronics devices, networking equipment, machine control, 
industrial automation, navigation equipment and medical instruments. (Wiki)

Practically *EL* devices are no different from any regular desktop Linux,
except the fact that most of the input/output, sound/video/graphics components
are embedded in one IC(integrated circuit), also known as System on Chip(SoC).


Why Embedded Linux ?
~~~~~~~~~~~~~~~~~~~~

* Linux is a free software(free as freedom), it supports large variants of 
  embedded processors.

* Linux can be optimized to run on any low profile hardware(with 5MB ROM/RAM),
  as resources can be easily configured using userspace scripts. 

* The kernel device drivers are modular, and can be loaded at runtime without restarting OS.

* The most of the core kernel code is architecture independent, so it is easy to add support for
  new processor.

* There is no fee, no renewals, no hidden clauses

The production cost per *SoC* has now become as low as 10$, which enables low 
cost embedded Linux devices. Android is also an embedded Linux device. 


ARM based Embedded Linux
~~~~~~~~~~~~~~~~~~~~~~~~

**ARM (Advanced RISC Machines)** is the most actively developed, low cost, low 
power embedded processor available in both 32bit & 64bit versions. ARM based 
SoCs are manufactured by Samsung, Texas Instruments, ATMEL, NVIDIA, Apple,
Qualcomm and more. 

Beyond ARM, the other notable embedded processors are SUN-SPARC, MIPS, PowerPC,
Zilog, AVR, and more.

We will install toolchain and perform development for ARM processors only. 
Similar approach can be adopted for any other architectures too. 

|

**Layman comparision of ARM & x86 (2013 approximate price)**

==============      =========   ===============
 Entity              x86(i3)     ARM(Cortex-A8) 
==============      =========   ===============
Processor/SoC        107$      	  11$
RAM(1GB/DDR3)         15$          5$ 
ROM(SSD/NAND)        60$(60G)      4$(4G)  
Graphics             20$           NA
Power usage          high          low 
Size(Board)          10"x10"      4"x2"
==============      =========   ===============

Today, it is cheaper to deploy a quad core ARM based web-server than its x86 
counterpart. With better speed, small size  & low power consumption, ARM boards
are turning out to be real threat for desktop processors. 

|

**ARM architecture based Open hardware Embedded Linux boards**

==============   ======================================     ===================   
 Board name        Company / ARM type / Core(s)              Approximate Price       
==============   ======================================     ===================   
Raspberry-Pi      Broadcom BCM2835, ARM11, 1                     25$          
BeagleBone(B)     TI OMAP 3, Cortex-A8, 1                        45$          
PandaBoard        TI OMAP 4, Cortex-A9, 2                       182$          
WandBoard         Freescale, Cortex-A9, 1,2,4                  79$ (1 core)          
Cubieboard2       Allwinner A-20, Cortex-A7, 2                   59$      
A13-OLINUXINO     Allwinner A-13(Aakash), Cortex-A8, 1           47$       		
==============   ======================================     ===================   

|

**Companies using ARM architecture**

==============   ==================   =============================================  ======================
 Company           SoC Name                   Notable products                          ARM type / Core(s) 
==============   ==================   =============================================  ======================
Apple              A4                  iPhone4, iPad(1G), AppleTV(2G)                    Cortex-A8, 1                  
Apple              A5                  iPhone4S, iPad2, AppleTV(3G)                      Cortex-A9, 2
Apple              A7                  iPhone5s                                          Cortex-A7, 64bit          
Samsung            Exynos 3 Single     Samsung Galaxy S, Galaxy Nexus S                  Cortex-A8, 1
Samsung            Exynos 4 Dual       Samsung Galaxy SII, Samsung Galaxy Note           Cortex-A9, 2
Samsung            Exynos 4 Quad       Samsung Galaxy SIII                               Cortex-A9. 4
Nvidia             Tegra               Microsoft Zune HD                                 ARM11, 1
Nvidia             Tegra 2             ASUS Transformer, GalaxyTab 10.1                  Cortex-A9, 2
Nvidia             Tegra 3             ASUS Nexus 7, HTC One X                           Cortex-A9, 4
Qualcomm           Snapdragon S2       Nokia Lumia 900                                   NA, 1
Qualcomm           Snapdragon S3       HP TouchPad                                       NA, 2
Qualcomm           Snapdragon S4       HTC EVO 4G LTE                                    NA, 2
TI                 Omap 3              Barnes and Noble Nook Color                       Cortex-A8, 1
TI                 Omap 4              KindleFire,GalaxyTab 2,Blackberry Playbook        Cortex-A9, 2
TI                 Omap 5              NA                                                Cortex-A15, 2 
==============   ==================   =============================================  ======================

|

Boot sequence in Linux
----------------------

**The steps involved in Linux boot process (x86 and ARM) :**


1. **BIOS (assembly & C)** - is the first program run by x86 based motherboard. ARM boards do 
   not have BIOS, but each SoC has its own program to verify the on-board peripherals 
   after power on. 

   This BIOS equivalent program in EL is mostly hardcoded in SoCs, hence updating them
   is usually not possible in case of embedded devices. 

   The purpose of this stage is to check the integrety of peripherals connected,
   if found OK, it will look for `bootloader` application in first boot-able device.
   

#. **Bootloader (C & assembly)** - is used to copy and uncompress *kernel* to RAM from a given 
   location. GRUB(GRand Unified Bootloader) is the popular bootloader for desktop 
   Linux machines. 

   Embedded Linux uses `U-Boot <http://www.denx.de/wiki/U-Boot/>`_ bootloader.

#. **kernel (C & assembly)** - again probes all connected hardware and initializes 
   them systematically. At the end of the kernel stage, it calls *init* process
   from filesystem to initialize user space scripts and startup jobs. 

#. **initrd (initial ramdisk)** - is an optional scheme for loading a temporary 
   root file system containing device drivers into memory in the boot process of 
   the Linux kernel. 

#. **file-system** - is the last stage of boot process, it contains *glibc* and 
   other architecture specific shared libraries to run user space applications. 

   Filesystem optionally may contains X-server which provides graphical desktop
   environment such as GNOME, KDE etc. 

|

Setting up development environment
----------------------------------

Software requirements
~~~~~~~~~~~~~~~~~~~~~

#. In Ubuntu 12.04+, issue the below command to install cross compiler ::

	sudo apt-get install gcc-arm-linux-gnueabihf

#. Install dependencies for kernel and u-boot compilation ::

	sudo apt-get install build-essential dpkg-dev kernel-wedge make automake\
    	checkinstall git u-boot-tools

#. Install ``qemu-user-static`` for setting up chroot based ARM virtualization to
   install packages in ARM-fileystem ::

	sudo apt-get install qemu-user-static

#. If you have serial console (Rx, Tx) lines from the board/tablet, then to  
   view console output install *minicom* (optional) ::

	sudo apt-get install minicom


Hardware requirements
~~~~~~~~~~~~~~~~~~~~~

#. A development board such as R-pi, beagleboard, cubieboard or Aakash tablet

#. An sdcard of 2 GB or above

#. USB hub, keyboard and mouse (optional)

#. Serial(Rx,Tx) cable, and USB to serial convertor (optional, for debugging)  

|


Preparing U-boot, kernel & filesystem 
-------------------------------------

At the end of this stage you will have a bootable sdcard with your custom
embedded Linux.

For those who want to try Linux on Aakash now, can download this sdcard image. 


U-Boot for embedded boards
~~~~~~~~~~~~~~~~~~~~~~~~~~

Compiling U-boot
^^^^^^^^^^^^^^^^

1. Clone the repository by ::
    
        git clone -b sunxi https://github.com/androportal/uboot-allwinner.git --depth=1


#. ``cd`` into ``uboot-allwinner`` ::

        cd uboot-allwinner

#.  To compile uboot issue::

        make a13_olinuxino CROSS_COMPILE=arm-linux-gnueabihf-


#.  After successful compilation ``u-boot.bin`` will be available at root of the
    directory and ``sunxi-spl.bin`` will be in ``spl`` directory
    


Writing U-boot on sdcard
^^^^^^^^^^^^^^^^^^^^^^^^

1. Insert ``sdcard`` in card reader or MMC reader available in laptops/netbooks


#. Backup all your sdcard data, and issue the following commands carefully, replace 
   *X* in /dev/sdX with suitable letter(a lower case alphabet) alloted for your
   sdcard, remember *X* will never be *a* if you have a hard disk installed, so keep
   in mind it must be something like ``/dev/sdb`` or ``/dev/sdc`` etc. Please check
   twice and if you are still unsure then do not perform these steps ::

        sudo fdisk -u=sectors /dev/sdX

#. First clear the previous u-boot and its configurations, if any::

		sudo dd if=/dev/zero of=/dev/sdX bs=1024 seek=544 count=128

#. Now from same ``uboot-allwinner`` directory issue these commands, again replace 
   X with suitable value, now to write ``sunxi-spl.bin`` to sdcard issue::

        sudo dd if=spl/sunxi-spl.bin of=/dev/sdX bs=1024 seek=8

   Similarly to burn ``u-boot.bin`` issue ::

        sudo dd if=u-boot.bin of=/dev/sdX bs=1024 seek=32

At this point we have a bootable sdcard readly. Get kernel and rootfs to make a usuable
Linux for your tablet.



Kernel
~~~~~~

Show the hexdump and offsets


Filesystem
~~~~~~~~~~

Debugging 
---------

Serial monitor using minicom
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Image with connections (from net) also Aakash connections (if required)

Screenshots with uboot running on Aakash (white background)




