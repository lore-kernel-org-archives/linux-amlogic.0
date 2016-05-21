From: rhgadsdon@gmail.com (Robert Gadsdon)
Date: Fri, 20 May 2016 19:28:02 -0700
Subject: [PATCH 0/2] Add support for Amlogic Meson MMC controller
In-Reply-To: <20160520193443.GA17269@mephisto>
References: <1463056902-8533-1-git-send-email-carlo@caione.org>
 <573E97BB.1090903@gmail.com> <20160520062700.GA16199@mephisto>
 <20160520080732.GA16732@mephisto> <573F5E6B.5010208@gmail.com>
 <20160520193443.GA17269@mephisto>
Message-ID: <573FC7B2.8040606@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 05/20/2016 12:34 PM, Carlo Caione wrote:
> On 20/05/16 11:58, Robert Gadsdon wrote:
>> On 05/20/2016 01:07 AM, Carlo Caione wrote:
>>> On 20/05/16 08:27, Carlo Caione wrote:
>>>> On 19/05/16 21:51, Robert Gadsdon wrote:
>>>>> Applied this on my Odroid C2, and it worked OK when installed on the
>>>>> SDcard, but failed when installed on the eMMC module:
>>> Oh, reading this again you meant that you put u-boot directly on the
>>> eMMC? Ok then, something is wrong when using the driver with the eMMC.
>>>
>>> Yes, I installed it directly on the eMMC, using the micro-sd adapter,
>>> and following the same instructions as for the SDcard..
> Could you try with this patch?
>
> diff --git a/board/hardkernel/odroid-c2/odroid-c2.c
> b/board/hardkernel/odroid-c2/odroid-c2.c
> index 34b9a95..ab78328 100644
> --- a/board/hardkernel/odroid-c2/odroid-c2.c
> +++ b/board/hardkernel/odroid-c2/odroid-c2.c
> @@ -80,6 +80,11 @@ U_BOOT_DEVICE(meson_mmc) = {
>         .platdata = &gxbb_sd_platdata[CONFIG_MMC_MESON_SD_PORT],
> 	 };
> 	  
> 	  +U_BOOT_DEVICE(meson_emmc) = {
> 	  +       .name = "meson_mmc",
> 	  +       .platdata = &gxbb_sd_platdata[2],
> 	  +};
> 	  +
> 	   static void meson_mmc_pinmux_setup(unsigned int port)
> 	    {
> 	            switch (port) {
>
> Thanks,

Patch applied, and now the eMMC is detected OK:

=> mmc info
Device: <NULL>
Manufacturer ID: 15
OEM: 100
Name: BGND3
Tran Speed: 52000000
Rd Block Len: 512
MMC version 5.0
High Capacity: Yes
Capacity: 29.1 GiB
Bus Width: 8-bit
Erase Group Size: 512 KiB
HC WP Group Size: 8 MiB
User Capacity: 29.1 GiB WRREL
Boot Capacity: 4 MiB ENH
RPMB Capacity: 4 MiB ENH

...  And I can load/boot the Kernel (as far as the /dev/mmc... prompt..)

Thanks!

Robert Gadsdon.
