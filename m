From: webczat_200@poczta.onet.pl (=?UTF-8?Q?Micha=c5=82_Zegan?=)
Date: Thu, 29 Dec 2016 16:39:47 +0100
Subject: emmc problems with linux 4.10-rc1
In-Reply-To: <c36847da-2f19-f18b-1569-e44e0873d15c@baylibre.com>
References: <1c70f4ea-f310-ec70-4a42-ca59da42cc54@poczta.onet.pl>
 <c36847da-2f19-f18b-1569-e44e0873d15c@baylibre.com>
Message-ID: <6e7ee67e-66fc-1ad7-b647-fe007f654a8e@poczta.onet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

As I said, the problem with race conditions when loading or something
cannot be reproduced for now, as for the first problem with module
unloading it is always reproducible.
The kernel is current master from torwalds repo. I do not think it's
configuration matters much in this case. Here are the logs:
 12 znak?w my?lnik[ cut here ] 12 znak?w my?lnik
WARNING: CPU: 0 PID: 104 at drivers/clk/clk.c:594 clk_core_disable+0x78/0x80
Modules linked in: zbud vfat fat meson_gx_mmc(-) pwrseq_emmc fixed
gpio_regulator mmc_
core raid6_pq xor [last unloaded: mmc_block]
CPU: 0 PID: 104 Comm: modprobe Not tainted 4.10.0-rc1 #7
Hardware name: Hardkernel ODROID-C2 (DT)
task: ffffffc0734f9a00 task.stack: ffffffc0739e8000
PC is at clk_core_disable+0x78/0x80
LR is at clk_core_disable_lock+0x20/0x38
pc : [<ffffff80083d22b8>] lr : [<ffffff80083d2388>] pstate: 800001c5
sp : ffffffc0739ebce0
x29: ffffffc0739ebce0 x28: ffffffc0734f9a00
x27: ffffff8008552000 x26: 000000000000006a
x25: 0000000000000123 x24: 0000000000080000
x23: ffffff8008ad23f8 x22: 0000000077100000
x21: ffffff800942f000 x20: ffffffc0739ba300
x19: 0000000000000140 x18: 00000000004ee000
x17: 0000000000000000 x16: ffffffc0734f9a00
x15: 0000007fcd7aeb28 x14: ffffffbf01cad820
x13: ffffffbf0006ac60 x12: 0000000000000030
x11: 00000000ffffffff x10: ffffffbf00000000
x9 : 0000000000000001 x8 : 0000000000000001
x7 : 0000000000000001 x6 : 0000000000000040
x5 : 0000000000000000 x4 : ffffffffffffffff
x3 : ffffff8008bdaf38 x2 : 0000000000760075
x1 : 0000000000000000 x0 : ffffffc0739ba300
---[ end trace bbb00de93a87cf88 ]---
Call trace:
Exception stack(0xffffffc0739ebb10 to 0xffffffc0739ebc40)
bb00:                                   0000000000000140 0000008000000000
bb20: ffffffc0739ebce0 ffffff80083d22b8 ffffffc0739ebb40 ffffff80081848e8
bb40: ffffffc0739ebbd0 ffffff8008185e3c ffffff80088a4770 0000000000000140
bb60: 000000000000001f 0000000000000000 ffffffc076fddd80 000000406e6f3000
bb80: 0000000000000123 000000000000006a ffffff8008552000 ffffffc0734f9a00
bba0: 0000000077100000 0000000000072aed ffffffc0739ba300 0000000000000000
bbc0: 0000000000760075 ffffff8008bdaf38 ffffffffffffffff 0000000000000000
bbe0: 0000000000000040 0000000000000001 0000000000000001 0000000000000001
bc00: ffffffbf00000000 00000000ffffffff 0000000000000030 ffffffbf0006ac60
bc00: ffffffbf00000000 00000000ffffffff 0000000000000030 ffffffbf0006ac60
bc20: ffffffbf01cad820 0000007fcd7aeb28 ffffffc0734f9a00 0000000000000000
[<ffffff80083d22b8>] clk_core_disable+0x78/0x80
[<ffffff80083d23bc>] clk_disable+0x1c/0x30
[<ffffff8000817090>] meson_mmc_remove+0x90/0x180 [meson_gx_mmc]
[<ffffff800848533c>] platform_drv_remove+0x24/0x68
[<ffffff80084837ac>] device_release_driver_internal+0x154/0x1d8
[<ffffff800848389c>] driver_detach+0x4c/0x90
[<ffffff8008482544>] bus_remove_driver+0x5c/0xe0
[<ffffff8008483f6c>] driver_unregister+0x2c/0x50
[<ffffff8008485450>] platform_driver_unregister+0x10/0x18
[<ffffff8000818398>] meson_mmc_driver_exit+0x10/0x2a8 [meson_gx_mmc]
[<ffffff8008133ee4>] SyS_delete_module+0x194/0x228
[<ffffff8008082ef0>] el0_svc_naked+0x24/0x28
 12 znak?w my?lnik[ cut here ] 12 znak?w my?lnik
WARNING: CPU: 0 PID: 104 at drivers/clk/clk.c:476
clk_core_unprepare+0x80/0x90
Modules linked in: zbud vfat fat meson_gx_mmc(-) pwrseq_emmc fixed
gpio_regulator mmc_
core raid6_pq xor [last unloaded: mmc_block]
CPU: 0 PID: 104 Comm: modprobe Tainted: G        W       4.10.0-rc1 #7
Hardware name: Hardkernel ODROID-C2 (DT)
task: ffffffc0734f9a00 task.stack: ffffffc0739e8000
PC is at clk_core_unprepare+0x80/0x90
LR is at clk_unprepare+0x28/0x40
pc : [<ffffff80083d2090>] lr : [<ffffff80083d4130>] pstate: 60000145
sp : ffffffc0739ebcf0
x29: ffffffc0739ebcf0 x28: ffffffc0734f9a00
x27: ffffff8008552000 x26: 000000000000006a
x25: 0000000000000123 x24: 0000000000080000
x23: ffffff8008ad23f8 x22: 0000000077100000
x21: ffffff800942f000 x20: ffffffc073a34400
x19: ffffffc0739ba300 x18: 00000000004ee000
x17: 0000000000000000 x16: 0000000000000000
x15: 0000007fcd7aeb28 x14: ffffffbf01cad820
x13: ffffffbf0006ac60 x12: 0000000000000030
x11: 00000000ffffffff x10: ffffffbf00000000
x9 : 0000000000000001 x8 : 0000000000000001
x7 : 0000000000000001 x6 : 0000000000000040
x5 : ffffffc0734f9a00 x4 : ffffff8008b2a2d8
x3 : 0000000000000000 x2 : ffffffc0734f9a00
x1 : 0000000000000000 x0 : ffffffc0739ba300
---[ end trace bbb00de93a87cf89 ]---
Call trace:
Exception stack(0xffffffc0739ebb20 to 0xffffffc0739ebc50)
bb20: ffffffc0739ba300 0000008000000000 ffffffc0739ebcf0 ffffff80083d2090
bb40: ffffffc0739ebbd0 ffffff8008185e3c ffffff80088a4770 0000000000000140
bb60: 000000000000001f 0000000000000000 ffffffc076fddd80 000000406e6f3000
bb80: 0000000000000123 000000000000006a ffffff8008552000 ffffffc0734f9a00
bba0: ffffff8008bfb7f0 0000000000000140 0000000000000076 ffffff8008bfb7e8
bbc0: ffffffc0739ba300 0000000000000000 ffffffc0734f9a00 0000000000000000
bbe0: ffffff8008b2a2d8 ffffffc0734f9a00 0000000000000040 0000000000000001
bc00: 0000000000000001 0000000000000001 ffffffbf00000000 00000000ffffffff
bc20: 0000000000000030 ffffffbf0006ac60 ffffffbf01cad820 0000007fcd7aeb28
bc40: 0000000000000000 0000000000000000
[<ffffff80083d2090>] clk_core_unprepare+0x80/0x90
[<ffffff8000817098>] meson_mmc_remove+0x98/0x180 [meson_gx_mmc]
[<ffffff800848533c>] platform_drv_remove+0x24/0x68
[<ffffff80084837ac>] device_release_driver_internal+0x154/0x1d8
[<ffffff800848389c>] driver_detach+0x4c/0x90
[<ffffff8008482544>] bus_remove_driver+0x5c/0xe0
[<ffffff8008483f6c>] driver_unregister+0x2c/0x50
[<ffffff8008485450>] platform_driver_unregister+0x10/0x18
[<ffffff8000818398>] meson_mmc_driver_exit+0x10/0x2a8 [meson_gx_mmc]
[<ffffff8008133ee4>] SyS_delete_module+0x194/0x228
[<ffffff8008082ef0>] el0_svc_naked+0x24/0x28
 12 znak?w my?lnik[ cut here ] 12 znak?w my?lnik
WARNING: CPU: 0 PID: 104 at drivers/clk/clk.c:594 clk_core_disable+0x78/0x80
Modules linked in: zbud vfat fat meson_gx_mmc(-) pwrseq_emmc fixed
gpio_regulator mmc_
core raid6_pq xor [last unloaded: mmc_block]
CPU: 0 PID: 104 Comm: modprobe Tainted: G        W       4.10.0-rc1 #7
Hardware name: Hardkernel ODROID-C2 (DT)
task: ffffffc0734f9a00 task.stack: ffffffc0739e8000
PC is at clk_core_disable+0x78/0x80
LR is at clk_core_disable_lock+0x20/0x38
pc : [<ffffff80083d22b8>] lr : [<ffffff80083d2388>] pstate: 800001c5
sp : ffffffc0739ebce0
x29: ffffffc0739ebce0 x28: ffffffc0734f9a00
x27: ffffff8008552000 x26: 000000000000006a
x25: 0000000000000123 x24: 0000000000080000
x23: ffffff8008ad23f8 x22: 0000000077080000
x21: ffffff80093ab000 x20: ffffffc073a01700
x19: 0000000000000140 x18: 00000000004ee000
x17: 0000000000000000 x16: ffffffc0734f9a00
x15: 0000007fcd7aeb28 x14: ffffffc076fde060
x13: ffffffc076fde060 x12: 0000000000000030
x11: 00000000ffffffff x10: ffffffbf00000000
x9 : 0000000000000001 x8 : 0000000000000006
x7 : 0000000000000001 x6 : 0000000000000040
x5 : 0000000000000000 x4 : ffffffffffffffff
x3 : ffffff8008bdaf38 x2 : 00000000007a0079
x1 : 0000000000000000 x0 : ffffffc073a01700
---[ end trace bbb00de93a87cf8a ]---
Call trace:
Exception stack(0xffffffc0739ebb10 to 0xffffffc0739ebc40)
bb00:                                   0000000000000140 0000008000000000
bb20: ffffffc0739ebce0 ffffff80083d22b8 ffffffc0739ebb40 ffffff8008184b18
bb40: ffffffc0739ebbd0 ffffff8008185e3c ffffff80088a4770 0000000000000140
bb60: 000000000000001f 0000000000000000 ffffffc076fddd80 000000406e6f3000
bb80: 0000000000000123 000000000000006a ffffff8008552000 ffffffc0734f9a00
bba0: 0000000077080000 000000000007715f ffffffc073a01700 0000000000000000
bbc0: 00000000007a0079 ffffff8008bdaf38 ffffffffffffffff 0000000000000000
bbe0: 0000000000000040 0000000000000001 0000000000000006 0000000000000001
bc00: ffffffbf00000000 00000000ffffffff 0000000000000030 ffffffc076fde060
bc20: ffffffc076fde060 0000007fcd7aeb28 ffffffc0734f9a00 0000000000000000
[<ffffff80083d22b8>] clk_core_disable+0x78/0x80
[<ffffff80083d23bc>] clk_disable+0x1c/0x30
[<ffffff8000817090>] meson_mmc_remove+0x90/0x180 [meson_gx_mmc]
[<ffffff800848533c>] platform_drv_remove+0x24/0x68
[<ffffff80084837ac>] device_release_driver_internal+0x154/0x1d8
[<ffffff800848389c>] driver_detach+0x4c/0x90
[<ffffff8008482544>] bus_remove_driver+0x5c/0xe0
[<ffffff8008483f6c>] driver_unregister+0x2c/0x50
[<ffffff8008485450>] platform_driver_unregister+0x10/0x18
[<ffffff8000818398>] meson_mmc_driver_exit+0x10/0x2a8 [meson_gx_mmc]
[<ffffff8008133ee4>] SyS_delete_module+0x194/0x228
[<ffffff8008082ef0>] el0_svc_naked+0x24/0x28
 12 znak?w my?lnik[ cut here ] 12 znak?w my?lnik
WARNING: CPU: 0 PID: 104 at drivers/clk/clk.c:476
clk_core_unprepare+0x80/0x90
Modules linked in: zbud vfat fat meson_gx_mmc(-) pwrseq_emmc fixed
gpio_regulator mmc_
core raid6_pq xor [last unloaded: mmc_block]
CPU: 0 PID: 104 Comm: modprobe Tainted: G        W       4.10.0-rc1 #7
Hardware name: Hardkernel ODROID-C2 (DT)
task: ffffffc0734f9a00 task.stack: ffffffc0739e8000
PC is at clk_core_unprepare+0x80/0x90
LR is at clk_unprepare+0x28/0x40
pc : [<ffffff80083d2090>] lr : [<ffffff80083d4130>] pstate: 60000145
sp : ffffffc0739ebcf0
x29: ffffffc0739ebcf0 x28: ffffffc0734f9a00
x27: ffffff8008552000 x26: 000000000000006a
x25: 0000000000000123 x24: 0000000000080000
x23: ffffff8008ad23f8 x22: 0000000077080000
x21: ffffff80093ab000 x20: ffffffc073442100
x19: ffffffc073a01700 x18: 00000000004ee000
x17: 0000000000000000 x16: 0000000000000000
x15: 0000007fcd7aeb28 x14: ffffffc076fde060
x13: ffffffc076fde060 x12: 0000000000000030
x11: 00000000ffffffff x10: ffffffbf00000000
x9 : 0000000000000001 x8 : 0000000000000006
x7 : 0000000000000001 x6 : 0000000000000040
x5 : ffffffc0734f9a00 x4 : ffffff8008b2a2d8
x3 : 0000000000000000 x2 : ffffffc0734f9a00
x1 : 0000000000000000 x0 : ffffffc073a01700
---[ end trace bbb00de93a87cf8b ]---
Call trace:
Exception stack(0xffffffc0739ebb20 to 0xffffffc0739ebc50)
bb20: ffffffc073a01700 0000008000000000 ffffffc0739ebcf0 ffffff80083d2090
bb40: ffffffc0739ebbd0 ffffff8008185e3c ffffff80088a4770 0000000000000140
bb60: 000000000000001f 0000000000000000 ffffffc076fddd80 000000406e6f3000
bb80: 0000000000000123 000000000000006a ffffff8008552000 ffffffc0734f9a00
bba0: ffffff8008bfb7f0 0000000000000140 000000000000007a ffffff8008bfb7e8
bbc0: ffffffc073a01700 0000000000000000 ffffffc0734f9a00 0000000000000000
bbe0: ffffff8008b2a2d8 ffffffc0734f9a00 0000000000000040 0000000000000001
bc00: 0000000000000006 0000000000000001 ffffffbf00000000 00000000ffffffff
bc20: 0000000000000030 ffffffc076fde060 ffffffc076fde060 0000007fcd7aeb28
bc40: 0000000000000000 0000000000000000
[<ffffff80083d2090>] clk_core_unprepare+0x80/0x90
[<ffffff8000817098>] meson_mmc_remove+0x98/0x180 [meson_gx_mmc]
[<ffffff800848533c>] platform_drv_remove+0x24/0x68
[<ffffff80084837ac>] device_release_driver_internal+0x154/0x1d8
[<ffffff800848389c>] driver_detach+0x4c/0x90
[<ffffff8008482544>] bus_remove_driver+0x5c/0xe0
[<ffffff8008483f6c>] driver_unregister+0x2c/0x50
[<ffffff8008485450>] platform_driver_unregister+0x10/0x18
[<ffffff8000818398>] meson_mmc_driver_exit+0x10/0x2a8 [meson_gx_mmc]
[<ffffff8008133ee4>] SyS_delete_module+0x194/0x228
[<ffffff8008082ef0>] el0_svc_naked+0x24/0x28


W dniu 29.12.2016 o 10:04, Neil Armstrong pisze:
> On 12/28/2016 04:19 PM, Micha? Zegan wrote:
>> Hello, it seems there are the following problems with mmc on linux
>> 4.10.0-rc1 or actually the latest master near rc1:
>> First, attempt to unload the module causes a kernel warning, so the
>> module is not properly unloadable
>> Second, I once loaded mmc module first then mmc_block and the kernel
>> panicked because of a fatal exception in interrupt. I was currently
>> unable to reproduce the second problem.
>>
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>
> 
> Hi,
> 
> could you provide some console logs ?
> Those statements won't help us until we have some proper kernel messages,
> current kernel config, kernel exact version and way for use to reproduce the issue.
> 
> Thanks,
> Meil
> 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 525 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161229/cfb55da7/attachment.sig>
