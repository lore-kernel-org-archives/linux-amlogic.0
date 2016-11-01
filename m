From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Tue, 1 Nov 2016 22:51:14 +0100
Subject: [PATCH] odroid-c2: Enable distro boot
In-Reply-To: <10583128-f7ef-8196-7533-fd7406fa6621@suse.de>
References: <1478034714-8743-1-git-send-email-afaerber@suse.de>
 <10583128-f7ef-8196-7533-fd7406fa6621@suse.de>
Message-ID: <9e90b2e4-0e5c-0c99-51e2-2601757c8dce@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Alex,

Am 01.11.2016 um 22:19 schrieb Alexander Graf:
> On 01/11/2016 22:11, Andreas F?rber wrote:
>> diff --git a/include/configs/meson-gxbb-common.h
>> b/include/configs/meson-gxbb-common.h
>> index 3bba2e6..0c467fe 100644
>> --- a/include/configs/meson-gxbb-common.h
>> +++ b/include/configs/meson-gxbb-common.h
>> @@ -40,4 +40,17 @@
>>
>>  #include <config_distro_defaults.h>
>>
>> +#define BOOT_TARGET_DEVICES(func) \
>> +    func(DHCP, dhcp, na)
> 
> Does the board have more common I/O available than Ethernet? MMC? SATA?

The board yes, U-Boot no. :) That's why I needed to get PXE to work. ;)
Thanks for your help.

FTR I noticed that in v2016.11-rc3 `bootp; bootefi 0x01000000` leads to
an odd $net_{default,efinet0}_mac in GRUB. CONFIG_DISTRO_DEFAULTS
(pulling in CONFIG_CMD_DHCP) resolved this, even when not booting
through the distro framework as before.

BTW it was unclear to me why CONFIG_CMD_SOURCE was disabled in the
defconfig - the distro framework emits an error if missing when it first
tries to execute the PXE file as script, therefore restoring the default
of enabling.

> If so, please add those too :).
> 
>> +#include <config_distro_bootcmd.h>
>> +
>> +#define CONFIG_EXTRA_ENV_SETTINGS \
>> +    "fdt_addr_r=0x01000000\0" \
> 
> This puts the device tree at 16MB. I don't know how smart the kernel is
> these days about accessing
> 
>   a) critical memory below its own starting point
>   b) memory that might collide with its own relocation point
> 
> so to be safe I think you're better off putting the device tree
> somewhere higher up. Maybe around 800MB?

The fdt and kernel addresses were adopted from the vendor U-Boot and
they worked for my PXE GRUB setup. ramdisk_addr_r was chosen by me and
is untested.

That said, maybe the linux-amlogic people have some input here.

Cheers,
Andreas

>> +    "scriptaddr=0x1f000000\0" \
>> +    "kernel_addr_r=0x20000000\0" \
>> +    "pxefile_addr_r=0x20000000\0" \
>> +    "ramdisk_addr_r=0x28000000\0" \
>> +    MESON_FDTFILE_SETTING \
>> +    BOOTENV
>> +
>>  #endif /* __MESON_GXBB_COMMON_CONFIG_H */
[snip]

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
