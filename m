From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Mon, 11 Jul 2016 06:41:35 +0200
Subject: [U-Boot] [PATCH v7 0/4] Amlogic Meson GXBaby and ODROID-C2 support
In-Reply-To: <CALeDE9OM__RZT7Re1+bHn0h41Hku9=k_yj_0hqiW8REjsYx0Uw@mail.gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
 <57831945.2040009@suse.de>
 <CALeDE9OM__RZT7Re1+bHn0h41Hku9=k_yj_0hqiW8REjsYx0Uw@mail.gmail.com>
Message-ID: <5783237F.4090807@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 11.07.2016 um 06:23 schrieb Peter Robinson:
> On Mon, Jul 11, 2016 at 4:57 AM, Andreas F?rber <afaerber@suse.de> wrote:
>> P.S. The upstream arm-trusted-firmware fip_create tool doesn't know
>> about --bl30 and --bl301 btw, anyone any insights?
> 
> If you find details on the upstream ATF support I'd love a link for more details

https://github.com/ARM-software/arm-trusted-firmware/tree/master/tools/fip_create

I found a commit renaming BL3-0 to SCP_BL2, but no mention of BL3-0-1
beyond Hardkernel and this patchset.

https://github.com/ARM-software/arm-trusted-firmware/commit/f59821d51255f14e0ac00eef7bc98ef75c686876

$ make -C u-boot-hardkernel fip_create
$ ./u-boot-hardkernel/tools/fip_create/fip_create --dump fip.bin
Firmware Image Package ToC:
---------------------------
- SCP Firmware BL3-0: offset=0x4000, size=0x9E88
- SCP Firmware BL3-0-1: offset=0x10000, size=0x1758
- EL3 Runtime Firmware BL3-1: offset=0x14000, size=0x110D0
- Non-Trusted Firmware BL3-3: offset=0x28000, size=0x36AF6
---------------------------

$ make -C arm-trusted-firmware fiptool
$ ./arm-trusted-firmware/tools/fip_create/fip_create --dump fip.bin
Firmware Image Package ToC:
---------------------------
- SCP Firmware SCP_BL2: offset=0xD8, size=0x9E88
- Unknown entry: offset=0x9F60, size=0x1758
- EL3 Runtime Firmware BL31: offset=0xB6B8, size=0x110D0
- Non-Trusted Firmware BL33: offset=0x1C788, size=0x36AF6
---------------------------

Note that the offsets for BL30[1] are shown differently.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
