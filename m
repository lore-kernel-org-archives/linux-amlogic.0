From: steev@kali.org (Steev Klimaszewski)
Date: Fri, 26 Oct 2018 12:49:14 -0500
Subject: Big Endian boot failures with sdcard or emmc on ODROID-C2
Message-ID: <949b2b53-11c5-5ddf-6939-b1e9af39ff87@kali.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hey all,

Asked about this in the #linux-amlogic irc channel on freenode, and Neil 
asked that I send a mail to the list about it.

I'm trying to do a few things with arm64 in big endian.  The current 
setup is that I have a NanoPi NEO Plus2 running big endian, but I wanted 
to test another board, so I decided to grab the ODROID-C2 to test it out 
as well.

When I attempt to boot the 4.18 kernel on the ODROID-C2 with 
CONFIG_CPU_BIG_ENDIAN=y, I get the following output when it attempts to 
mount the root partition.

[    2.237646] mmc0: error -84 whilst initialising MMC card
[    2.237765] WARNING: CPU: 0 PID: 0 at 
drivers/mmc/host/meson-gx-mmc.c:1025 meson_mmc_irq+0x100/0x218
[    2.238628] usb 1-1.1: new low-speed USB device number 3 using dwc2
[    2.246371] Modules linked in:
[    2.246379] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.18.16 #1
[    2.246381] Hardware name: Hardkernel ODROID-C2 (DT)
[    2.246386] pstate: 00000085 (nzcv daIf -PAN -UAO)
[    2.271209] pc : meson_mmc_irq+0x100/0x218
[    2.275265] lr : __handle_irq_event_percpu+0x5c/0x148
[    2.280263] sp : ffff000008003e40
[    2.283540] x29: ffff000008003e40 x28: ffff000009122680
[    2.288802] x27: 0000000000000001 x26: ffff000008e83df0
[    2.294063] x25: ffff000009249b82 x24: ffff8000710e3e00
[    2.299325] x23: 0000000000000014 x22: ffff000008003f04
[    2.304586] x21: 0000000000000000 x20: ffff8000710e3e28
[    2.309847] x19: ffff800070c97080 x18: ffff00000912e4c4
[    2.315108] x17: 0000000000002812 x16: 0000000000000000
[    2.320370] x15: ffff000008b227f0 x14: 0000000000000007
[    2.325631] x13: ffff000008b227c8 x12: 0000000000000062
[    2.330892] x11: ffff000008b227d0 x10: 0000000000000040
[    2.336153] x9 : ffff0000091314d0 x8 : ffff800071800248
[    2.341415] x7 : ffff800071800270 x6 : 0000000000000000
[    2.346676] x5 : ffff800071800248 x4 : 0000800076e7c000
[    2.351937] x3 : 0000000000000000 x2 : ffff0000089229d8
[    2.357198] x1 : ffff800071262580 x0 : 0000000000000000
[    2.362460] Call trace:
[    2.364875]  meson_mmc_irq+0x100/0x218
[    2.368584]  __handle_irq_event_percpu+0x5c/0x148
[    2.373242]  handle_irq_event_percpu+0x34/0x88
[    2.377641]  handle_irq_event+0x48/0x78
[    2.381435]  handle_fasteoi_irq+0xa8/0x180
[    2.385490]  generic_handle_irq+0x24/0x38
[    2.389457]  __handle_domain_irq+0x5c/0xb8
[    2.393511]  gic_handle_irq+0x58/0xb0
[    2.397133]  el1_irq+0xb0/0x128
[    2.400238]  arch_cpu_idle+0x10/0x18
[    2.403775]  do_idle+0x1d4/0x2a0
[    2.406965]  cpu_startup_entry+0x20/0x28
[    2.410850]  rest_init+0xd0/0xe0
[    2.414040]  start_kernel+0x3e0/0x40c
[    2.417659] ---[ end trace dc32aa4982a84211 ]---

This seems to still be the case with 4.19(+?) - as you can see at 
https://storage.kernelci.org/mainline/master/v4.19-4404-g44adbac8f721/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/lab-baylibre-seattle/boot-meson-gxbb-odroidc2.html 
- but it claims there are no warnings or errors - which if you scroll 
down do where lsmod gets run by pyboot, you can see the same 
warnings/errors.

Any help or attention to the issue would be greatly appreciated!

-- Steev
