From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 10 Apr 2018 15:51:01 +0200
Subject: [PATCH u-boot 2/2] ARM: meson: Add cpu info display for GX SoCs
In-Reply-To: <CAPnjgZ0w9v6_6Qiw0uzKzFcTOMThtcQ6C6Q0gnKfHnX9ZZihUQ@mail.gmail.com>
References: <1522230877-21267-1-git-send-email-narmstrong@baylibre.com>
 <1522230877-21267-3-git-send-email-narmstrong@baylibre.com>
 <CAPnjgZ0w9v6_6Qiw0uzKzFcTOMThtcQ6C6Q0gnKfHnX9ZZihUQ@mail.gmail.com>
Message-ID: <08220462-5c2e-0858-31bb-c899d8801350@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 08/04/2018 15:50, Simon Glass wrote:
> Hi,
> 
> On 28 March 2018 at 05:54, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> The Amlogic SoCs have a registers containing the die revision
>> and packaging type to determine the SoC family and package marketing
>> name like S905X for the GXL SoC Family.
>> This code is taken for the Linux meson-gx-socinfo driver and adapted
>> to U-Boot printing.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  arch/arm/include/asm/arch-meson/gx.h |   1 +
>>  arch/arm/mach-meson/Makefile         |   2 +-
>>  arch/arm/mach-meson/cpu_info.c       | 105 +++++++++++++++++++++++++++++++++++
>>  configs/khadas-vim_defconfig         |   2 +-
>>  configs/libretech-cc_defconfig       |   2 +-
>>  configs/odroid-c2_defconfig          |   2 +-
>>  configs/odroid_defconfig             |   1 +
>>  configs/p212_defconfig               |   2 +-
>>  8 files changed, 112 insertions(+), 5 deletions(-)
>>  create mode 100644 arch/arm/mach-meson/cpu_info.c
> 
> Please can you use driver model's CPU interface for this?
> 
> Regards,
> Simon
> 

Hi Simon,

The CPU uclass is designed for the /cpu/* nodes, here we fetch the SoC information
in some /soc/ subnodes which cannot be used with the current CPU uclass and
won't be probed before relocation.

Either I push is as a MISC driver (with the pre-reloc issue) or we leave this in mach-meson.

What do you think ?

Thanks,
Neil
