From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 25 May 2018 09:53:56 +0200
Subject: Odroid-C2 solid green screen on "echo c > /proc/sysrq-trigger" on
 Arch 4.16/4.17rc6
In-Reply-To: <84bc747f58f648e1b209bc0005804bc5@wppexc12.purdue.lcl>
References: <84bc747f58f648e1b209bc0005804bc5@wppexc12.purdue.lcl>
Message-ID: <5d1512ae-51eb-7e05-ad8b-b8e851aee90e@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

On 25/05/2018 04:19, Swabey, Matthew A wrote:
> Odroid-C2 solid green screen on echo c > /proc/sysrq-trigger on Arch Linux mainline 4.16/4.17rc6
> Using lightdm on xorg fb. No mali, utgard or odroid specific framebuffers. However it seems to happen on them too.
> 
> Steps to reproduce:
> 1. Boot
> 2. Echo c > /proc/sysrq-trigger with watchdog set. Or trigger the watchdog another way, i.e. watchdogd or system.
> 3. Watchdog causes reboot
> 4. Boots with screen solid green, see photo here: https://photos.app.goo.gl/9VyiweNAIMD07VSM2
> 	a. No error messages visible, see attached log file bundles containing dmesg, journalctl, package list, Xorg.0.log
> 	b. Linux-aarch64 is 4.16
> 	c. Linux-aarch64-rc is 4.17rc6
> 5. Reboot - screen back to normal and working
Well, since screen goes back to normal means there is no bug on the kernel side.

This is caused by Amlogic's U-Boot.
The HW watchdog does a complete SoC reset, we cannot execute any code from kernel when the watchdog wakes up.

Please report this to Armbian and ask them to use Mainline U-Boot, this won't happen anymore.

Neil

> 
> Thought - something about the way to trigger this reset isn't working, or a race condition is present which is being more reliably triggered? Perhaps in the dma controller or the HDMI?
> 
> Any help to track this bug down would be very helpful, or someone else who would be interested? I can't figure out where in the stack the problem is occurring, but I guess it is the bootloader.
> 
> Thanks,
> 
> Matthew
> 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
