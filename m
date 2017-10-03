From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 03 Oct 2017 10:04:20 +0200
Subject: ATF regions and Synchronous External Aborts
Message-ID: <1507017860.17300.106.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Dear Amlogic users,

Some of you may have recently experienced "Synchronous External Abort" error
while running amlogic devices with the mainline kernel.

This may happen if the memory reserved for the Arm Trusted Firmware (see meson-
gx.dtsi) is not aligned with the ATF binary embedded in your u-boot. If/When the
kernel use the memory region allocated by the ATF, this will raise an exception
and show a "Synchronous External Abort" in your kernel logs.

It entirely depends on when the kernel use that region. It may never happen, or
it may happen very quickly.

A quick and easy way to check your platform for this issue is using the mmc and
dd.

> dd if=/dev/mmcblkX of=/dev/zero bs=4M count=YYYY

the important things is that 4M*count is more than the ram amount you have.
The kernel is going write buffer everywhere and, if the region is not properly
set, it will eventually trigger the issue.

So far, ATF and meson-gx.dtsi is aligned for all known gxbb devices.
It's more tricky for gxl and gxm. Some early released devices (such as the kvim)
use the old 0x10000000-0x10200000 (OK) region while most recent one uses
0x5000000-0x5300000 (will trigger the problem).

This entirely depends on the u-boot (bl31 and bl32) which is used on the device.
It is possible to have different regions for the same platform, which is why we
can't really fix this by updating every DT we have.

There is a way to get those regions at runtime (please see aml u-boot sources in
their buildroot, in ./common/cmd_rsvmem.c ... you can also check khadas github
[0]) ... only 3 registers to read...

We are currently looking for the best way to address this problem:

* We could patch the DT in u-boot. Problem is that there is wide variety of u-
boot binary out there. This issue might reported a lot until we get everyone to
a update u-boot (mainline or vendor)

* We could try to detect this in Linux boot. I think this would be the best as
anyone running mainline would get the fix immediately. Problem is, I think, this
would need to done before the call to request_standard_ressources() in
arch/arm64/kernel/setup.c:setup_arch(). This pretty early and I don't know if we
can execute platform specific init that early on arm64 ?
Feel free to comment on this !

In the meantime, If you experience this kind of error, and you are running a
vendor u-boot, please try the following in u-boot prompt:

> rsvmem dump

If the regions reported are different from what you have in your dts, you can
* Modify you are dts accordingly, or
* Patch the dts on-the-fly, using u-boot fdt api

[0]: https://github.com/khadas/u-boot/blob/Vim/common/cmd_rsvmem.c

Cheers
Jerome
