From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Tue, 12 Jul 2016 15:49:17 +0200
Subject: [U-Boot] [PATCH 4/6] efi_loader: Improve .dtb search for arm64
In-Reply-To: <4756a883-b3dc-8684-2d26-fda7b65dc095@suse.de>
References: <1468297308-32102-1-git-send-email-afaerber@suse.de>
 <1468297308-32102-5-git-send-email-afaerber@suse.de>
 <e7bb2eed-5208-e4b6-ad93-257041f4354f@suse.de>
 <4756a883-b3dc-8684-2d26-fda7b65dc095@suse.de>
Message-ID: <82a5fecc-db26-b46a-7e47-a869b59706a7@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 12.07.2016 um 14:38 schrieb Andreas F?rber:
> Am 12.07.2016 um 09:29 schrieb Alexander Graf:
>> On 12.07.16 06:21, Andreas F?rber wrote:
>>> On arm64 Linux device trees are organized by SoC vendor. Therefore we
>>> need to search the vendor subdirectory as well.
>>>
>>> Since the SoC vendor may be different from ${vendor}, introduce a new
>>> ${soc_vendor}. If this is not set, the behavior remains unchanged.
>>>
>>> Cc: Alexander Graf <agraf@suse.de>
>>> Signed-off-by: Andreas F?rber <afaerber@suse.de>
>>
>> Stephen had pretty strong opinions on the naming, mostly because "pxe
>> boot" uses the same naming scheme. So we should either change it there
>> as well to stay consistent or just make the implicit ruling always work :).
>>
>> I guess the best case would be to fix up the path names of boards so
>> that $vendor is always $soc_vendor. Do you have an example where that
>> wouldn't work?
> 
> AFAIU for U-Boot $vendor is often the board vendor and matches the
> board/ subdirectory, so there may be plenty vendors.  I didn't see any
> code setting this value, so I assume this comes from .config options.
> 
> My $soc_vendor is the SoC vendor instead and only for the environment.
> 
> And because there were opinions on how to form the 32-bit efi_fdtfile,
> both Tom and Stephen were CC'ed on the cover letter. :)
> 
> On the dragonboard410c:
> CONFIG_SYS_SOC="snapdragon"
> CONFIG_SYS_VENDOR="qualcomm"
> CONFIG_SYS_BOARD="dragonboard410c"
> CONFIG_SYS_CONFIG_NAME="dragonboard410c"
> soc=snapdragon
> vendor=qualcomm
> board=dragonboard410c
> board_name=dragonboard410c
> => Therefore my previous patch setting fdtfile to apq8016-sbc.dtb,
> because it is absolutely different. This patch allows searching qcom/
> for our dtb-qcom aarch64 openSUSE package.
> 
> On the odroid-c2:
> CONFIG_SYS_SOC="meson"
> CONFIG_SYS_VENDOR="amlogic"
> CONFIG_SYS_BOARD="odroid-c2"
> CONFIG_SYS_CONFIG_NAME="odroid-c2"
> board=odroid-c2
> board_name=odroid-c2
> soc=meson
> vendor=amlogic
> => Here $vendor would match Linux' dts subdirectory, but $soc and $board
> are wrong, I need fdtfile=meson-gxbb-odroidc2.dtb.

Adding a 32-bit example:

On the firefly-rk3288:
CONFIG_SYS_SOC="rockchip"
CONFIG_SYS_VENDOR="firefly"
CONFIG_SYS_BOARD="firefly-rk3288"
CONFIG_SYS_CONFIG_NAME="firefly-rk3288"
board=firefly-rk3288
board_name=firefly-rk3288
soc=rockchip
vendor=firefly
=> $vendor is not the SoC vendor, it's the board vendor. My point.
=> $soc is not rk3288, as needed for the ${soc}-${board}${boardrev}.dtb
formula. We either need to fix $soc or define $fdtfile.

Further, I have an early board that needs rk3288-firefly-beta.dtb
instead of rk3288-firefly.dtb. No hits for `git grep firefly-beta`, so
there doesn't seem to be any auto-detection...

Note that ~2016.07 seemed to be completely busted on this board, see the
multiple discussions about disabling EFI_LOADER and other random options
as workaround. Not even bootz succeeded for me any more.

Having a default way to load some uboot.env or uEnv.txt file might help
the user set $fdtfile and similar options while still using the default
boot mechanism.

> 
> But maybe I'm just not understanding what all those configs are good for
> and how deeply they're tied to board/ subdirectories and mach-foo? If we
> can clean them up to match Linux then all the better. If that were
> intended, I wonder why no one flagged that during review.
> 
> Anyway, maybe add an else clause to this patch and reuse $vendor if
> $soc_vendor is unavailable?
> 
> Regards,
> Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
