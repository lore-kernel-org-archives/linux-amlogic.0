From: maswabey@purdue.edu (Swabey, Matthew A)
Date: Fri, 25 May 2018 02:19:46 +0000
Subject: Odroid-C2 solid green screen on "echo c > /proc/sysrq-trigger" on
 Arch 4.16/4.17rc6
Message-ID: <84bc747f58f648e1b209bc0005804bc5@wppexc12.purdue.lcl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Odroid-C2 solid green screen on echo c > /proc/sysrq-trigger on Arch Linux mainline 4.16/4.17rc6
Using lightdm on xorg fb. No mali, utgard or odroid specific framebuffers. However it seems to happen on them too.

Steps to reproduce:
1. Boot
2. Echo c > /proc/sysrq-trigger with watchdog set. Or trigger the watchdog another way, i.e. watchdogd or system.
3. Watchdog causes reboot
4. Boots with screen solid green, see photo here: https://photos.app.goo.gl/9VyiweNAIMD07VSM2
	a. No error messages visible, see attached log file bundles containing dmesg, journalctl, package list, Xorg.0.log
	b. Linux-aarch64 is 4.16
	c. Linux-aarch64-rc is 4.17rc6
5. Reboot - screen back to normal and working

Thought - something about the way to trigger this reset isn't working, or a race condition is present which is being more reliably triggered? Perhaps in the dma controller or the HDMI?

Any help to track this bug down would be very helpful, or someone else who would be interested? I can't figure out where in the stack the problem is occurring, but I guess it is the bootloader.

Thanks,

Matthew

-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-aarch64-rc.tar.bz2
Type: application/octet-stream
Size: 103472 bytes
Desc: linux-aarch64-rc.tar.bz2
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180525/3c7014c1/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-aarch64.tar.bz2
Type: application/octet-stream
Size: 99947 bytes
Desc: linux-aarch64.tar.bz2
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180525/3c7014c1/attachment-0001.obj>
