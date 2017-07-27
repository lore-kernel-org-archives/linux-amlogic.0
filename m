From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 27 Jul 2017 14:24:31 +0200
Subject: Mainline Linux oopses
In-Reply-To: <15f3032b-4895-6de7-2854-063a61de8cf7@free.fr>
References: <15f3032b-4895-6de7-2854-063a61de8cf7@free.fr>
Message-ID: <1501158271.20650.2.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2017-07-25 at 12:14 +0200, Chris Moore wrote:
> Hi,
> 
> I have an Xtreamer mxV Pro S905 TV box which is a clone of the popular?
> KI PLUS boxes.
> I am using the mainline DTS for the Amlogic P201 development board which?
> has similar hardware.
> 
> I have been trying mainline Linux since 4.10 and I have always had?
> random oopses during boot.
> Up till now I put this down to "early days" but as they continue with?
> 4.13.0-rc2 I thought I should report them.
> 
> Here are some extracts from boot logs concerning configuration, errors?
> and warnings:-
> 
> ...
> [????0.000000] Linux version 4.13.0-rc2 (cmoore at G3258) (gcc version?
> 6.3.1 20170404 (Linaro GCC 6.3-2017.05)) #3 SMP PREEMPT Mon Jul 24?
> 11:04:53 CEST 2017
> ...
> [????0.000000] Machine model: Amlogic Meson GXBB P201 Development Board
> [????0.000000] efi: Getting EFI parameters from FDT:
> [????0.000000] efi: UEFI not found.
> ...
> [????0.000000] Kernel command line: console=ttyAML0,115200n8?
> root=/dev/sda2 rootfstype=ext4 rootflags=data=writeback rootwait rw
> ...
> [????0.132061] DMI not present or invalid.
> ...
> [????0.150465] dmi: Firmware registration failed.
> ...
> [????1.243402] dwc2 c9000000.usb: c9000000.usb supply vusb_d not found,?
> using dummy regulator
> [????1.246049] dwc2 c9000000.usb: c9000000.usb supply vusb_a not found,?
> using dummy regulator
> ...
> [????1.358393] irq 31: nobody cared (try booting with the "irqpoll" option)
> [????1.359439] CPU: 0 PID: 3 Comm: kworker/0:0 Not tainted 4.13.0-rc2 #3
> [????1.365818] Hardware name: Amlogic Meson GXBB P201 Development Board (DT)
> [????1.372555] Workqueue: events deferred_probe_work_func
> [????1.377634] Call trace:
> [????1.380055] [<ffff000008088390>] dump_backtrace+0x0/0x230
> [????1.385399] [<ffff000008088684>] show_stack+0x14/0x20
> [????1.390403] [<ffff00000894f238>] dump_stack+0x98/0xb8
> [????1.395405] [<ffff000008114248>] __report_bad_irq+0x38/0xe8
> [????1.400923] [<ffff0000081145dc>] note_interrupt+0x214/0x2e8
> [????1.406443] [<ffff000008111844>] handle_irq_event_percpu+0x44/0x58
> [????1.412566] [<ffff0000081118a0>] handle_irq_event+0x48/0x78
> [????1.418087] [<ffff0000081153a0>] handle_fasteoi_irq+0xa0/0x180
> [????1.423866] [<ffff00000811086c>] generic_handle_irq+0x24/0x38
> [????1.429558] [<ffff000008110eec>] __handle_domain_irq+0x5c/0xb8
> [????1.435337] [<ffff00000808162c>] gic_handle_irq+0x54/0xa8
> [????1.440683] Exception stack(0xffff80002c36ade0 to 0xffff80002c36af10)
> [????1.447067] ade0: ffff80002c36ae10 0001000000000000 ffff80002c36af40?
> ffff0000080c64c4
> [????1.454829] ae00: 0000000040000145 ffff000008126a08 0000000000000000?
> ffff000008e8d000
> [????1.462591] ae20: 00000000fffedc42 00008000234da000 000000000624dd2f?
> 0000000000000020
> [????1.470354] ae40: 000000006ad40eed 7fffffffffffffff 0000000000000020?
> 00000000027f2854
> [????1.478116] ae60: ffff80002c376438 ffff0000089904a0 00000000000004e7?
> 0000000000000000
> [????1.485879] ae80: 000000004ad0cf71 00000000000004e7 0000000000000019?
> 0000000000000001
> [????1.493641] aea0: 0000000000000007 ffff000008e8d000 ffff000008e91ad8?
> 0000000000000000
> [????1.501404] aec0: ffff000008fbf680 ffff80002ac10000 ffff000008e8d000?
> ffff000008e8d000
> [????1.509166] aee0: 0000000000000202 0000000000000040 ffff80002adb9c00?
> ffff80002c36af40
> [????1.516928] af00: ffff0000080c6930 ffff80002c36af40
> [????1.521759] [<ffff0000080827f4>] el1_irq+0xb4/0x128
> [????1.526591] [<ffff0000080c6930>] irq_exit+0xc8/0x100
> [????1.531505] [<ffff000008110ef0>] __handle_domain_irq+0x60/0xb8
> [????1.537284] [<ffff00000808162c>] gic_handle_irq+0x54/0xa8
> [????1.542630] Exception stack(0xffff80002add79b0 to 0xffff80002add7ae0)
> [????1.549013] 79a0: ffff80002a4c789c 0000000000000040
> [????1.556776] 79c0: 0000000000000005 0000000000000000 0000000000000084?
> 000000000000000f
> [????1.564539] 79e0: 0000000055555555 0000000000000000 ffff80002a4b3d80?
> 0000000000000000
> [????1.572301] 7a00: ffff80002a800270 0000000000000040 0000000000000000?
> 2c646e756f662074
> [????1.580064] 7a20: 6420676e69737520 0000000000000006 000000009e732ca1?
> 000000004d91aee7
> [????1.587826] 7a40: 0000000000000010 ffff80002a4c7800 ffff80002a4b3d00?
> 000000000000001f
> [????1.595589] 7a60: ffff80002a4c7868 ffff80002a4c7820 0000000000000000?
> ffff80002a4c7950
> [????1.603351] 7a80: ffff80002a4c789c 0000000000000040 ffff80002c375ea8?
> ffff80002add7ae0
> [????1.611114] 7aa0: ffff0000081138a0 ffff80002add7ae0 ffff000008966518?
> 0000000040000045
> [????1.618876] 7ac0: 000000000000001f ffff80002a4c7868 ffffffffffffffff?
> 000000000000001f
> [????1.626639] [<ffff0000080827f4>] el1_irq+0xb4/0x128
> [????1.631471] [<ffff000008966518>] _raw_spin_unlock_irqrestore+0x10/0x48
> [????1.637938] [<ffff000008113be0>] request_threaded_irq+0xe0/0x188
> [????1.643890] [<ffff000008116530>] devm_request_threaded_irq+0x78/0xf0
> [????1.650187] [<ffff0000087024b8>] dwc2_driver_probe+0x1b0/0x4d8
> [????1.655965] [<ffff00000856d0f8>] platform_drv_probe+0x58/0xc0
> [????1.661657] [<ffff00000856b334>] driver_probe_device+0x214/0x2d0
> [????1.667608] [<ffff00000856b53c>] __device_attach_driver+0x9c/0xf8
> [????1.673645] [<ffff000008569694>] bus_for_each_drv+0x5c/0x98
> [????1.679165] [<ffff00000856affc>] __device_attach+0xc4/0x138
> [????1.684685] [<ffff00000856b5f8>] device_initial_probe+0x10/0x18
> [????1.690550] [<ffff00000856a57c>] bus_probe_device+0x94/0xa0
> [????1.696070] [<ffff00000856a9ec>] deferred_probe_work_func+0x74/0xa8
> [????1.702281] [<ffff0000080d8ecc>] process_one_work+0x1ac/0x318
> [????1.707972] [<ffff0000080d9274>] worker_thread+0x23c/0x420
> [????1.713408] [<ffff0000080df0b4>] kthread+0xfc/0x128
> [????1.718237] [<ffff000008082ec0>] ret_from_fork+0x10/0x50
> [????1.723496] handlers:
> [????1.725740] [<ffff000008701850>] dwc2_handle_common_intr
> [????1.731000] Disabling IRQ #31
> [????1.745313] dwc2 c9000000.usb: DWC OTG Controller
> [????1.745349] dwc2 c9000000.usb: new USB bus registered, assigned bus?
> number 1
> [????1.751535] dwc2 c9000000.usb: irq 31, io mem 0xc9000000
> [????1.757318] hub 1-0:1.0: USB hub found
> [????1.760488] hub 1-0:1.0: 1 port detected
> [????1.765351] dwc2 c9100000.usb: c9100000.usb supply vusb_d not found,?
> using dummy regulator
> [????1.772577] dwc2 c9100000.usb: c9100000.usb supply vusb_a not found,?
> using dummy regulator
> ...
> [???10.630412] meson-drm d0100000.vpu: Failed to create debugfs directory
> ...
> 
> I added irqpoll to the command line as suggested in the boot log above?
> and I got these significant differences:-
> 
> ...
> [????0.000000] Kernel command line: console=ttyAML0,115200n8?
> root=/dev/sda2 rootfstype=ext4 rootflags=data=writeback rootwait rw irqpoll
> [????0.000000] Misrouted IRQ fixup and polling support enabled
> [????0.000000] This may significantly impact system performance
> ...
> [????1.265604] ------------[ cut here ]------------
> [????1.270061] WARNING: CPU: 0 PID: 0 at?
> drivers/mmc/host/meson-gx-mmc.c:739 meson_mmc_irq+0x280/0x290
> [????1.278712] dwc2 c9000000.usb: DWC OTG Controller
> [????1.278740] dwc2 c9000000.usb: new USB bus registered, assigned bus?
> number 1
> [????1.278768] dwc2 c9000000.usb: irq 31, io mem 0xc9000000
> [????1.279315] hub 1-0:1.0: USB hub found
> [????1.279331] hub 1-0:1.0: 1 port detected
> [????1.280300] dwc2 c9100000.usb: c9100000.usb supply vusb_d not found,?
> using dummy regulator
> [????1.280333] dwc2 c9100000.usb: c9100000.usb supply vusb_a not found,?
> using dummy regulator
> [????1.319902] Modules linked in:
> [????1.322924] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.13.0-rc2 #3
> [????1.329131] Hardware name: Amlogic Meson GXBB P201 Development Board (DT)
> [????1.335858] task: ffff000008eb2b00 task.stack: ffff000008ea0000
> [????1.341726] PC is at meson_mmc_irq+0x280/0x290
> [????1.346126] LR is at __handle_irq_event_percpu+0x9c/0x128
> [????1.351469] pc : [<ffff0000087dbd80>] lr : [<ffff000008111774>]?
> pstate: 600001c5
> [????1.358800] sp : ffff80002c36add0
> [????1.362077] x29: ffff80002c36add0 x28: ffff000008eb2b00
> [????1.367339] x27: 0000000000000001 x26: ffff000008c5f590
> [????1.372600] x25: ffff000008ec2668 x24: ffff80002afcd200
> [????1.377861] x23: 0000000000000012 x22: ffff80002c36ae9c
> [????1.383122] x21: 0000000000000000 x20: ffff80002afcd200
> [????1.388384] x19: ffff80002a542b00 x18: 0000000000000007
> [????1.393645] x17: 0000000000000001 x16: 0000000000000019
> [????1.398906] x15: 0000000000000033 x14: 000000004b40b7b7
> [????1.404167] x13: 0000000000000000 x12: ffff80002adbe300
> [????1.409429] x11: 0000000000000040 x10: ffff80002a800270
> [????1.414690] x9 : ffff80002a800300 x8 : 0000000000000000
> [????1.419951] x7 : ffff80002afcd200 x6 : ffff80002afcd200
> [????1.425212] x5 : ffff80002a800248 x4 : ffff80002afcd200
> [????1.430474] x3 : 0000000000000000 x2 : ffff0000087dbb00
> [????1.435735] x1 : ffff80002a777580 x0 : 0000000000000012
> [????1.440997] Call trace:
> [????1.443414] Exception stack(0xffff80002c36ac00 to 0xffff80002c36ad30)
> [????1.449796] ac00: ffff80002a542b00 0001000000000000 ffff80002c36add0?
> ffff0000087dbd80
> [????1.457558] ac20: 0000000000000000 0000000000000400 ffff80002c36ac80?
> ffff0000080eed38
> [????1.465321] ac40: ffff80002adafe00 ffff000008e8d000 0000000000000000?
> 0000000000000001
> [????1.473083] ac60: ffff80002c36ac80 ffff0000080eeb80 ffff80002adafe00?
> 00000000000001a0
> [????1.480845] ac80: ffff80002c36add0 ffff0000080e70f4 ffff80002adbe200?
> 0000000000000000
> [????1.488608] aca0: 0000000000000012 ffff80002a777580 ffff0000087dbb00?
> 0000000000000000
> [????1.496370] acc0: ffff80002afcd200 ffff80002a800248 ffff80002afcd200?
> ffff80002afcd200
> [????1.504133] ace0: 0000000000000000 ffff80002a800300 ffff80002a800270?
> 0000000000000040
> [????1.511895] ad00: ffff80002adbe300 0000000000000000 000000004b40b7b7?
> 0000000000000033
> [????1.519657] ad20: 0000000000000019 0000000000000001
> [????1.524489] [<ffff0000087dbd80>] meson_mmc_irq+0x280/0x290
> [????1.529922] [<ffff000008111774>] __handle_irq_event_percpu+0x9c/0x128
> [????1.536305] [<ffff00000811181c>] handle_irq_event_percpu+0x1c/0x58
> [????1.542428] [<ffff0000081118a0>] handle_irq_event+0x48/0x78
> [????1.547948] [<ffff0000081140cc>] try_one_irq+0x94/0xe8
> [????1.553037] [<ffff0000081145a4>] note_interrupt+0x1dc/0x2e8
> [????1.558558] [<ffff000008111844>] handle_irq_event_percpu+0x44/0x58
> [????1.564681] [<ffff0000081118a0>] handle_irq_event+0x48/0x78
> [????1.570202] [<ffff0000081153a0>] handle_fasteoi_irq+0xa0/0x180
> [????1.575980] [<ffff00000811086c>] generic_handle_irq+0x24/0x38
> [????1.581672] [<ffff000008110eec>] __handle_domain_irq+0x5c/0xb8
> [????1.587451] [<ffff00000808162c>] gic_handle_irq+0x54/0xa8
> [????1.592797] Exception stack(0xffff000008ea3dd0 to 0xffff000008ea3f00)
> [????1.599180] 3dc0: 0000000000000000 0000000000000000
> [????1.606943] 3de0: 0000000000000001 0000000000000000 0000000000000000?
> ffff000008ea3f00
> [????1.614705] 3e00: 00008000234da000 0000000000000001 00000000000000c0?
> ffff000008ea3e70
> [????1.622468] 3e20: 0000000000000a00 0000000000000000 ffff80002adbe300?
> 0000000000000000
> [????1.630230] 3e40: 000000004b40b7b7 0000000000000033 0000000000000019?
> 0000000000000001
> [????1.637993] 3e60: 0000000000000007 ffff000008e8d000 ffff000008ea9df0?
> ffff000008ea9000
> [????1.645756] 3e80: ffff000008e9b3a0 0000000000000000 0000000000000000?
> ffff000008eb2b00
> [????1.653518] 3ea0: 0000000033ef0528 0000000037f67d10 0000000001d90018?
> ffff000008ea3f00
> [????1.661281] 3ec0: ffff000008084adc ffff000008ea3f00 ffff000008084ae0?
> 0000000000000045
> [????1.669043] 3ee0: 0000000037f67d10 ffff000008135bec ffffffffffffffff?
> 7fffffffffffffff
> [????1.676805] [<ffff0000080827f4>] el1_irq+0xb4/0x128
> [????1.681637] [<ffff000008084ae0>] arch_cpu_idle+0x10/0x18
> [????1.686898] [<ffff0000080fc854>] do_idle+0x10c/0x1d8
> [????1.691813] [<ffff0000080fcab0>] cpu_startup_entry+0x20/0x28
> [????1.697421] [<ffff000008960be8>] rest_init+0xd8/0xe8
> [????1.702338] [<ffff000008d90b4c>] start_kernel+0x384/0x398
> [????1.707683] [<ffff000008d901e0>] __primary_switched+0x64/0x6c
> [????1.713374] ---[ end trace 813001d8fe4efe3f ]---
> ...
> [????6.703261] ------------[ cut here ]------------
> [????6.703283] WARNING: CPU: 0 PID: 0 at?
> drivers/mmc/host/meson-gx-mmc.c:739 meson_mmc_irq+0x280/0x290
> [????6.703285] Modules linked in: ip_tables x_tables ipv6
> [????6.703298] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W???????
> 4.13.0-rc2 #3
> [????6.703300] Hardware name: Amlogic Meson GXBB P201 Development Board (DT)
> [????6.703303] task: ffff000008eb2b00 task.stack: ffff000008ea0000
> [????6.703306] PC is at meson_mmc_irq+0x280/0x290
> [????6.703312] LR is at __handle_irq_event_percpu+0x9c/0x128
> [????6.703315] pc : [<ffff0000087dbd80>] lr : [<ffff000008111774>]?
> pstate: 600001c5
> [????6.703316] sp : ffff80002c36add0
> [????6.703318] x29: ffff80002c36add0 x28: ffff000008eb2b00
> [????6.703323] x27: 0000000000000001 x26: ffff000008c5f590
> [????6.703327] x25: ffff000008ec2668 x24: ffff80002afcd000
> [????6.703331] x23: 0000000000000011 x22: ffff80002c36ae9c
> [????6.703335] x21: 0000000000000000 x20: ffff80002afcd000
> [????6.703339] x19: ffff80002a546100 x18: 0000000000000000
> [????6.703343] x17: 0000ffffacc6be08 x16: ffff0000082446e8
> [????6.703347] x15: 000000018f8a7c77 x14: 000000018f8ad0c6
> [????6.703351] x13: 0000000000000000 x12: ffff80002a408f00
> [????6.703355] x11: 0000000000000040 x10: ffff80002a800270
> [????6.703358] x9 : ffff80002a8002f8 x8 : 0000000000000000
> [????6.703363] x7 : ffff80002afcd000 x6 : ffff80002afcd000
> [????6.703366] x5 : ffff80002a800248 x4 : ffff80002afcd000
> [????6.703371] x3 : 0000000000000000 x2 : ffff0000087dbb00
> [????6.703375] x1 : ffff80002a554580 x0 : 0000000000000011
> [????6.703379] Call trace:
> [????6.703383] Exception stack(0xffff80002c36ac00 to 0xffff80002c36ad30)
> [????6.703387] ac00: ffff80002a546100 0001000000000000 ffff80002c36add0?
> ffff0000087dbd80
> [????6.703390] ac20: ffff000008e9c000 ffff000008ea9000 0000000000000000?
> ffff80002a4091b0
> [????6.703393] ac40: 0000000000000001 ffff000008eb2b00 0000000000000001?
> ffff80002a4091b0
> [????6.703396] ac60: ffff80002c36ac80 ffff0000080f0b94 ffff80002c36ac80?
> ffff0000080f0b24
> [????6.703400] ac80: ffff80002c36ace0 ffff0000080e582c ffff80002c376400?
> ffff80002c376400
> [????6.703403] aca0: 0000000000000011 ffff80002a554580 ffff0000087dbb00?
> 0000000000000000
> [????6.703406] acc0: ffff80002afcd000 ffff80002a800248 ffff80002afcd000?
> ffff80002afcd000
> [????6.703409] ace0: 0000000000000000 ffff80002a8002f8 ffff80002a800270?
> 0000000000000040
> [????6.703412] ad00: ffff80002a408f00 0000000000000000 000000018f8ad0c6?
> 000000018f8a7c77
> [????6.703415] ad20: ffff0000082446e8 0000ffffacc6be08
> [????6.703419] [<ffff0000087dbd80>] meson_mmc_irq+0x280/0x290
> [????6.703422] [<ffff000008111774>] __handle_irq_event_percpu+0x9c/0x128
> [????6.703426] [<ffff00000811181c>] handle_irq_event_percpu+0x1c/0x58
> [????6.703429] [<ffff0000081118a0>] handle_irq_event+0x48/0x78
> [????6.703433] [<ffff0000081140cc>] try_one_irq+0x94/0xe8
> [????6.703437] [<ffff0000081145a4>] note_interrupt+0x1dc/0x2e8
> [????6.703441] [<ffff000008111844>] handle_irq_event_percpu+0x44/0x58
> [????6.703444] [<ffff0000081118a0>] handle_irq_event+0x48/0x78
> [????6.703449] [<ffff0000081153a0>] handle_fasteoi_irq+0xa0/0x180
> [????6.703452] [<ffff00000811086c>] generic_handle_irq+0x24/0x38
> [????6.703456] [<ffff000008110eec>] __handle_domain_irq+0x5c/0xb8
> [????6.703460] [<ffff00000808162c>] gic_handle_irq+0x54/0xa8
> [????6.703462] Exception stack(0xffff000008ea3d20 to 0xffff000008ea3e50)
> [????6.703465] 3d20: ffff80002c376400 000000000000ad79 0000000000000002?
> 00008000234da000
> [????6.703469] 3d40: 0000000000000000 00008000234da000 ffff80002a408f28?
> 00000000ffffffff
> [????6.703472] 3d60: ffff000008eb3560 ffff000008ea3e70 0000000000000a00?
> 0000000000000000
> [????6.703475] 3d80: ffff80002a408f00 0000000000000000 000000018f8ad0c6?
> 000000018f8a7c77
> [????6.703478] 3da0: ffff0000082446e8 0000ffffacc6be08 0000000000000000?
> ffff000008eb2b00
> [????6.703481] 3dc0: ffff80002c376400 ffff000008962278 ffff80002a384000?
> ffff80002a408e00
> [????6.703484] 3de0: 0000000000000001 ffff000008eb3110 0000000000000000?
> 0000000037f67d10
> [????6.703487] 3e00: 0000000001d90018 ffff000008ea3e50 ffff0000080e4988?
> ffff000008ea3e50
> [????6.703491] 3e20: ffff000008966560 0000000060000145 ffff000008e8d000?
> ffff000008962acc
> [????6.703493] 3e40: ffffffffffffffff 0000000000000000
> [????6.703496] [<ffff0000080827f4>] el1_irq+0xb4/0x128
> [????6.703502] [<ffff000008966560>] _raw_spin_unlock_irq+0x10/0x48
> [????6.703506] [<ffff000008962278>] __schedule+0x1a0/0x5d8
> [????6.703509] [<ffff000008962acc>] schedule_idle+0x24/0x40
> [????6.703514] [<ffff0000080fc7f8>] do_idle+0xb0/0x1d8
> [????6.703517] [<ffff0000080fcab4>] cpu_startup_entry+0x24/0x28
> [????6.703521] [<ffff000008960be8>] rest_init+0xd8/0xe8
> [????6.703526] [<ffff000008d90b4c>] start_kernel+0x384/0x398
> [????6.703530] [<ffff000008d901e0>] __primary_switched+0x64/0x6c
> [????6.703532] ---[ end trace 813001d8fe4efe40 ]---
> ...
> 
> I should be grateful for any information on whether these are real?
> problems or if I am doing something wrong.
> If my log extracts are insufficient I should be pleased to supply any?
> missing information.
> 
> I am then running Ubuntu 17.04 without an initramfs.
> It works fine headless and is stable even after these oopses.
> However unfortunately I have never been able to get Mali to work on?
> mainline despite trying several recipes.
> If anybody can point me to one that works with 4.13.0-rc2 I should be?
> most grateful.
> 
> I now boot from a USB stick as I have fried two UHS-I micro-SD cards?
> during my experiments.
> I suspect that they may have been over-voltaged by my box.
> Has anybody else had this problem?
> 

Hi Chris,

>From the oops, it looks like you are getting an irq while in the irq handler of
mmc driver, isn't it ?

It should not happen but it is not entirely impossible with the current driver.
I'm working on series of patches which should, hopefully, address this.

https://github.com/jeromebrunet/linux/commits/amlogic/wip/mmc

Regarding your (fried) cards, I have no idea.

Switching to UHS  requires voltage  switch from 3.3v to 1.8v (signal, not power)

In the current driver, this is not implemented (also something I've been working
on), so cards should remain in high speed mode and not use UHS.

cheers
jerome

> TIA.
> 
> Cheers,
> Chris
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
