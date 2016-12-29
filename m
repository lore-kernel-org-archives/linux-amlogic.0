From: webczat_200@poczta.onet.pl (=?UTF-8?Q?Micha=c5=82_Zegan?=)
Date: Thu, 29 Dec 2016 20:54:31 +0100
Subject: possible bugs on odroid, or maybe that is not meson related?
In-Reply-To: <CANAwSgS6p6w5U0R-x4aRA=CtEFT7hT68hOfAXR6KuTqbdsbM0A@mail.gmail.com>
References: <edfe1845-3c8a-053a-34c6-4c4930af5c2b@poczta.onet.pl>
 <CANAwSgS6p6w5U0R-x4aRA=CtEFT7hT68hOfAXR6KuTqbdsbM0A@mail.gmail.com>
Message-ID: <4400b987-ba4c-71b2-4657-9103131b48d3@poczta.onet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

You should first get an Image.gz and turn it into uimage using a mkimage
tool provided by uboot
mkimage -a 0x1080000 -e 0x1080000 -d path/to/Image.gz -A arm64 -O linux
-T kernel -C gzip /boot/uimage
Then, you boot everything normally except that instead of booti you use
bootm
Actually i believe booting the "Image" with booti could also work but I
did not check

W dniu 29.12.2016 o 20:45, Anand Moon pisze:
> Hi Michal
> 
> On 30 December 2016 at 00:05, Micha? Zegan <webczat_200@poczta.onet.pl> wrote:
>> Hello.
>>
>> On the odroid c2/meson gxbb/kernel from torwalds master, sometimes I
>> have random problems.
>> Those problems are task stalls. Once it happened when loading the usb
>> module, once it happened after running the find command.
>> A minute ago I have actually tried to switch_root manually from initrd
>> to real root, and there was a stall and something else.
>> Here it is:
>>
>> swapper/2[0]: undefined instruction: pc=ffffff800853f4d4
>> Code: aa1a03f5 14000004 d503201f f94002b5 (b4001555)
>> Internal error: undefined instruction: 0 [#1] SMP
>> Modules linked in: squashfs loop mmc_block meson_gx_mmc pwrseq_emmc
>> mmc_core dwc2 udc_
>> core usbcore phy_meson8b_usb2 rtc_pcf8563 i2c_meson i2c_core
>> scpi_cpufreq arm_big_litt
>> le scpi_hwmon thermal_sys hwmon clk_scpi arm_scpi platform_mhu
>> gpio_regulator fixed nl
>> s_iso8859_1 nls_cp437 vfat fat btrfs raid6_pq xor crc32c_generic
>> crc32_generic
>> CPU: 2 PID: 0 Comm: swapper/2 Not tainted 4.10.0-rc1 #7
>> Hardware name: Hardkernel ODROID-C2 (DT)
>> task: ffffffc074bace00 task.stack: ffffffc074bb8000
>> PC is at __schedule+0x2d4/0x590
>> LR is at __schedule+0x2e8/0x590
>> pc : [<ffffff800853f4d4>] lr : [<ffffff800853f4e8>] pstate: 800001c5
>> sp : ffffffc074bbbef0
>> x29: ffffffc074bbbef0 x28: 0000000000000000
>> x27: 0000000000000000 x26: ffffff8008565428
>> x25: ffffffc074bad320 x24: ffffff800853f7b4
>> x23: ffffff8008897000 x22: ffffffc074bace00
>> x21: ffffff8008565368 x20: 0000000000000000
>> x19: ffffffc076fbba00 x18: 0000000000000000
>> x17: 00000000000045a5 x16: 0000000000000000
>> x15: 0000000000000000 x14: 0000000000000000
>> x13: 0000000000000000 x12: 0000000000000000
>> x11: ffffff8008565298 x10: ffffffc076fbba38
>> x9 : ffffffc074bbbed0 x8 : 0000000000000002
>> x7 : 7fffffffffffffff x6 : 0000000489f55a18
>> x5 : 0000000000000020 x4 : 0000000000000000
>> x3 : 0000000000000000 x2 : ffffff80080f73d8
>> x1 : ffffffc074bace00 x0 : 0000000000000000
>> Process swapper/2 (pid: 0, stack limit = 0xffffffc074bb8000)
>> Stack: (0xffffffc074bbbef0 to 0xffffffc074bbc000)
>> bee0:                                   ffffffc074bbbf50 ffffff800853f7b4
>> bf00: ffffff8008897000 ffffff8008ac9cf8 ffffff8008ac9000 ffffff800889fa48
>> bf20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> bf40: ffffff8008897000 ffffff8008ac9cf8 ffffffc074bbbf60 ffffff800853fadc
>> bf60: ffffffc074bbbf70 ffffff80080f8428 ffffffc074bbbfb0 ffffff80080f8738
>> bf80: 0000000000000075 0000000000000002 0000000000000000 0000000000000000
>> bfa0: 0000000000000000 0000000000000000 ffffffc074bbbfd0 ffffff800808d694
>> bfc0: 0000000000000002 0000000000000000 0000000000000000 000000000154b1a4
>> bfe0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> Call trace:
>> Exception stack(0xffffffc074bbbda0 to 0xffffffc074bbbed0)
>> bda0: ffffffc076fbba00 0000008000000000 ffffffc074bbbef0 ffffff800853f4d4
>> bdc0: 0000000000000000 ffffffc074bace00 ffffff80080f73d8 0000000000000000
>> bde0: 0000000000000000 0000000000000020 0000000489f55a18 7fffffffffffffff
>> be00: 0000000000000002 ffffffc074bbbed0 ffffffc076fbba38 ffffff8008565298
>> be20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> be40: 0000000000000000 00000000000045a5 0000000000000000 ffffffc076fbba00
>> be60: 0000000000000000 ffffff8008565368 ffffffc074bace00 ffffff8008897000
>> be80: ffffff800853f7b4 ffffffc074bad320 ffffff8008565428 0000000000000000
>> bea0: 0000000000000000 ffffffc074bbbef0 ffffff800853f4e8 ffffffc074bbbef0
>> bec0: ffffff800853f4d4 00000000800001c5
>> [<ffffff800853f4d4>] __schedule+0x2d4/0x590
>> [<ffffff800853f7b4>] schedule+0x24/0x80
>> [<ffffff800853fadc>] schedule_preempt_disabled+0xc/0x18
>> [<ffffff80080f8428>] do_idle+0xa8/0x1e8
>> [<ffffff80080f8738>] cpu_startup_entry+0x20/0x28
>> [<ffffff800808d694>] secondary_start_kernel+0x154/0x1b0
>> [<000000000154b1a4>] 0x154b1a4
>> Code: aa1a03f5 14000004 d503201f f94002b5 (b4001555)
>> INFO: rcu_sched detected stalls on CPUs/tasks:
>>         2-...: (1 GPs behind) idle=5a5/140000000000001/0 softirq=595/596
>> fqs=2100
>>         (detected by 1, t=6303 jiffies, g=356, c=355, q=1)
>> Task dump for CPU 2:
>> swapper/2       R  running task        0     0      1 0x00000002
>> Call trace:
>> [<ffffff80080854a4>] __switch_to+0x8c/0xb0
>> [<ffffff800853f4e8>] __schedule+0x2e8/0x590
>> [<ffffff800853f7b4>] schedule+0x24/0x80
>> [<ffffff800853fadc>] schedule_preempt_disabled+0xc/0x18
>> [<ffffff80080f8428>] do_idle+0xa8/0x1e8
>> [<ffffff80080f8738>] cpu_startup_entry+0x20/0x28
>> [<ffffff800808d694>] secondary_start_kernel+0x154/0x1b0
>> [<000000000154b1a4>] 0x154b1a4
>> INFO: rcu_sched detected stalls on CPUs/tasks:
>>         2-...: (1 GPs behind) idle=5a5/140000000000001/0 softirq=595/596
>> fqs=8398
>>         (detected by 1, t=25208 jiffies, g=356, c=355, q=1)
>> Task dump for CPU 2:
>> swapper/2       R  running task        0     0      1 0x00000002
>> Call trace:
>> [<ffffff80080854a4>] __switch_to+0x8c/0xb0
>> [<ffffff800853f4e8>] __schedule+0x2e8/0x590
>> [<ffffff800853f7b4>] schedule+0x24/0x80
>> [<ffffff800853fadc>] schedule_preempt_disabled+0xc/0x18
>> [<ffffff80080f8428>] do_idle+0xa8/0x1e8
>> [<ffffff80080f8738>] cpu_startup_entry+0x20/0x28
>> [<ffffff800808d694>] secondary_start_kernel+0x154/0x1b0
>> [<000000000154b1a4>] 0x154b1a4
>> INFO: rcu_sched detected stalls on CPUs/tasks:
>>         2-...: (1 GPs behind) idle=5a5/140000000000001/0 softirq=595/596
>> fqs=14696
>>         (detected by 1, t=44113 jiffies, g=356, c=355, q=1)
>> Task dump for CPU 2:
>> swapper/2       R  running task        0     0      1 0x00000002
>> Call trace:
>> [<ffffff80080854a4>] __switch_to+0x8c/0xb0
>> [<ffffff800853f4e8>] __schedule+0x2e8/0x590
>> [<ffffff800853f7b4>] schedule+0x24/0x80
>> [<ffffff800853fadc>] schedule_preempt_disabled+0xc/0x18
>> [<ffffff80080f8428>] do_idle+0xa8/0x1e8
>> [<ffffff80080f8738>] cpu_startup_entry+0x20/0x28
>> [<ffffff800808d694>] secondary_start_kernel+0x154/0x1b0
>> [<000000000154b1a4>] 0x154b1a4
>> INFO: rcu_sched detected stalls on CPUs/tasks:
>>         2-...: (1 GPs behind) idle=5a5/140000000000001/0 softirq=595/596
>> fqs=20994
>>         2-...: (1 GPs behind) idle=5a5/140000000000001/0 softirq=595/596
>> fqs=20994
>>         (detected by 1, t=63018 jiffies, g=356, c=355, q=3)
>> Task dump for CPU 2:
>> swapper/2       R  running task        0     0      1 0x00000002
>> Call trace:
>> [<ffffff80080854a4>] __switch_to+0x8c/0xb0
>> [<ffffff800853f4e8>] __schedule+0x2e8/0x590
>> [<ffffff800853f7b4>] schedule+0x24/0x80
>> [<ffffff800853fadc>] schedule_preempt_disabled+0xc/0x18
>> [<ffffff80080f8428>] do_idle+0xa8/0x1e8
>> [<ffffff80080f8738>] cpu_startup_entry+0x20/0x28
>> [<ffffff800808d694>] secondary_start_kernel+0x154/0x1b0
>> [<000000000154b1a4>] 0x154b1a4
>> INFO: rcu_sched detected stalls on CPUs/tasks:
>>
>> .....
>> I do not know if it is related to normal stalls I get, I get them rarely
>> and the one before this had no stacktrace, and there was no such error
>> as "undefined instruction" in kernel space. But it sometimes randomly
>> happens.
>> Not sure if that is odroid problem or something in the core kernel
>> code/regression not related to the meson code.
>>
> 
> I am not able to boot the latest kernel on Odroid C2
> could some body share the u-boot command to boot the kernel.
> I am using the u-boot provided by HK.
> 
> It would nice to work on latest version.
> 
> -Best Regards
> Anand
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161229/3cd75e9f/attachment.sig>
