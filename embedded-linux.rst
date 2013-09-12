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
|

Embedded Linux(EL) 
------------------

What is Embedded Linux ?
~~~~~~~~~~~~~~~~~~~~~~~~

Embedded Linux is the use of Linux in embedded computer systems such as mobile 
phones, personal digital assistants (PDA), media players, set-top boxes, and 
other consumer electronics devices, networking equipment, machine control, 
industrial automation, navigation equipment and medical instruments. (Wiki)

Practically, an *EL* is not different from regular laptop, they too contain 
processor, RAM, ROM, Input/Output, ethernet/sound/video support more. Mostly, 
all the peripherals are fit into a single IC, also know as System on Chip(SoC).

Why Embedded Linux ?
~~~~~~~~~~~~~~~~~~~~

One word **cost**. There is no loyality for operating system, GNU/Linux is
a free software and it supports large variants of embedded processors. The 
production cost per *SoC* has become as low as 10$, which enables ultra-low 
cost embedded Linux devices. 

The embedded CPU architectures include SUN-SPARC, MIPS, PowerPC, Zilog, 
AVR and more. The most popular architecture is ARM (Advanced RISC Machines). 

We will install toolchain and perform development on ARM processors only. 
Similar approach can be adopted for any other processor family. 

**Layman comparision of ARM & x86 (2013 approximate price)**

==============      =========   ==========
 Entity              x86(i3)     ARM(A8) 
==============      =========   ==========
Processor/SoC        107$      	  11$
RAM(1GB/DDR3)         15$          5$ 
ROM(SSD/NAND)        60$(60G)      4$(4G)  
Graphics             20$           NA
Power usage          high          low 
Size(Board)          10"x10"      4"x2"
==============      =========   ==========

Today, its cheaper to deploy a quad core ARM based web-server than its x86 
counterpart. With better speed, small size  & low power consumption, ARM boards
are turning out to be real threat for desktop processors. 

**Popular ARM based Open hardware boards**

==============   ======================================     ================   
 Board name        Company / ARM type / Core(s)                 Price       
==============   ======================================     ================   
Raspberry-Pi      Broadcom BCM2835, ARM11, 1                     25$          
BeagleBone(B)     TI OMAP 3, Cortex-A8, 1                        45$          
PandaBoard        TI OMAP 4, Cortex-A9, 2                       182$          
WandBoard         Freescale, Cortex-A9, 1,2,4                  79$ (1 core)          
Cubieboard2       Allwinner A-20, Cortex-A7, 2                   59$      
A13-OLINUXINO     Allwinner A-13(Aakash), Cortex-A8, 1           47$       		
==============   ======================================     ================   

**Companies using ARM architecture**

==============   ==================   =============================================  ======================
 Company           SoC                          Notable products                          ARM type / Core(s) 
==============   ==================   =============================================  ======================
Apple              A4                  iPhone4, iPad(1G), AppleTV(2G)                    Cortex-A8, 1                  
Apple              A5                  iPhone4S, iPad2, AppleTV(3G)                      Cortex-A9, 2
Apple              A7                  iPhone5s                                          Cortex-A7, 64bit          
Samsung            Exynos 3 Single     Samsung Galaxy S, Galaxy Nexus S                  Cortex-A8, 1
Samsung            Exynos 4 Dual       Samsung Galaxy SII, Samsung Galaxy Note           Cortex-A9, 2
Samsung            Exynos 4 Quad       Samsung Galaxy SIII                               Cortex-A9. 4
Nvidia             Tegra               Microsoft Zune HD                                 ARM11, 1
Nvidia             Tegra 2             ASUS Transformer, GalaxyTab 10.1                  Cortex-A9, 2
Nvidia             Tegra 3             ASUS Nexus 7, HTC One X                           Cortex-A9
==============   ==================   =============================================  ======================






U-Boot
------


Kernel
------

Show the hexdump and offsets


Filesystem
----------

