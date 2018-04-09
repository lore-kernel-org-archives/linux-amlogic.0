From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 9 Apr 2018 15:47:46 +0200
Subject: [PATCH u-boot 2/2] ARM: meson: Add cpu info display for GX SoCs
In-Reply-To: <20180404204953.GA12368@gmail.com>
References: <1522230877-21267-1-git-send-email-narmstrong@baylibre.com>
 <1522230877-21267-3-git-send-email-narmstrong@baylibre.com>
 <20180404204953.GA12368@gmail.com>
Message-ID: <492995cc-3679-54a5-cc47-4eed68f11da5@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 04/04/2018 22:49, Beniamino Galvani wrote:
> On Wed, Mar 28, 2018 at 11:54:37AM +0200, Neil Armstrong wrote:
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
>>
>> diff --git a/arch/arm/include/asm/arch-meson/gx.h b/arch/arm/include/asm/arch-meson/gx.h
>> index 7930efd..6d5b4ea 100644
>> --- a/arch/arm/include/asm/arch-meson/gx.h
>> +++ b/arch/arm/include/asm/arch-meson/gx.h
>> @@ -17,6 +17,7 @@
>>  /* Always-On Peripherals registers */
>>  #define GX_AO_ADDR(off)	(GX_AOBUS_BASE + ((off) << 2))
>>  
>> +#define GX_AO_SEC_SD_CFG8	GX_AO_ADDR(0x88)
>>  #define GX_AO_SEC_GP_CFG0	GX_AO_ADDR(0x90)
>>  #define GX_AO_SEC_GP_CFG3	GX_AO_ADDR(0x93)
>>  #define GX_AO_SEC_GP_CFG4	GX_AO_ADDR(0x94)
>> diff --git a/arch/arm/mach-meson/Makefile b/arch/arm/mach-meson/Makefile
>> index b4e8dde..5a01ff0 100644
>> --- a/arch/arm/mach-meson/Makefile
>> +++ b/arch/arm/mach-meson/Makefile
>> @@ -4,4 +4,4 @@
>>  # SPDX-License-Identifier:	GPL-2.0+
>>  #
>>  
>> -obj-y += board.o sm.o eth.o
>> +obj-y += board.o sm.o eth.o cpu_info.o
>> diff --git a/arch/arm/mach-meson/cpu_info.c b/arch/arm/mach-meson/cpu_info.c
>> new file mode 100644
>> index 0000000..657768f
>> --- /dev/null
>> +++ b/arch/arm/mach-meson/cpu_info.c
>> @@ -0,0 +1,105 @@
>> +/*
>> + * Copyright (C) 2018 BayLibre, SAS
>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>> + *
>> + * SPDX-License-Identifier:	GPL-2.0+
>> + */
>> +
>> +#include <common.h>
>> +#include <asm/io.h>
>> +#include <linux/bitfield.h>
>> +#include <asm/arch/gx.h>
>> +
>> +#ifdef CONFIG_DISPLAY_CPUINFO
>> +
>> +#define SOCINFO_MAJOR	GENMASK(31, 24)
>> +#define SOCINFO_PACK	GENMASK(23, 16)
>> +#define SOCINFO_MINOR	GENMASK(15, 8)
>> +#define SOCINFO_MISC	GENMASK(7, 0)
>> +
>> +static const struct meson_gx_soc_id {
>> +	const char *name;
>> +	unsigned int id;
>> +} soc_ids[] = {
>> +	{ "GXBB", 0x1f },
>> +	{ "GXTVBB", 0x20 },
>> +	{ "GXL", 0x21 },
>> +	{ "GXM", 0x22 },
>> +	{ "TXL", 0x23 },
>> +};
>> +
>> +static const struct meson_gx_package_id {
>> +	const char *name;
>> +	unsigned int major_id;
>> +	unsigned int pack_id;
>> +} soc_packages[] = {
>> +	{ "S905", 0x1f, 0 },
>> +	{ "S905M", 0x1f, 0x20 },
>> +	{ "S905D", 0x21, 0 },
>> +	{ "S905X", 0x21, 0x80 },
>> +	{ "S905L", 0x21, 0xc0 },
>> +	{ "S905M2", 0x21, 0xe0 },
>> +	{ "S912", 0x22, 0 },
>> +};
>> +
>> +static inline unsigned int socinfo_to_major(u32 socinfo)
>> +{
>> +	return FIELD_GET(SOCINFO_MAJOR, socinfo);
>> +}
>> +
>> +static inline unsigned int socinfo_to_minor(u32 socinfo)
>> +{
>> +	return FIELD_GET(SOCINFO_MINOR, socinfo);
>> +}
>> +
>> +static inline unsigned int socinfo_to_pack(u32 socinfo)
>> +{
>> +	return FIELD_GET(SOCINFO_PACK, socinfo);
>> +}
>> +
>> +static inline unsigned int socinfo_to_misc(u32 socinfo)
>> +{
>> +	return FIELD_GET(SOCINFO_MISC, socinfo);
>> +}
>> +
>> +static const char *socinfo_to_package_id(u32 socinfo)
>> +{
>> +	unsigned int pack = socinfo_to_pack(socinfo) & 0xf0;
>> +	unsigned int major = socinfo_to_major(socinfo);
>> +	int i;
>> +
>> +	for (i = 0 ; i < ARRAY_SIZE(soc_packages) ; ++i) {
>> +		if (soc_packages[i].major_id == major &&
>> +		    soc_packages[i].pack_id == pack)
>> +			return soc_packages[i].name;
>> +	}
>> +
>> +	return "Unknown";
>> +}
>> +
>> +static const char *socinfo_to_soc_id(u32 socinfo)
>> +{
>> +	unsigned int id = socinfo_to_major(socinfo);
>> +	int i;
>> +
>> +	for (i = 0 ; i < ARRAY_SIZE(soc_ids) ; ++i) {
>> +		if (soc_ids[i].id == id)
>> +			return soc_ids[i].name;
>> +	}
>> +
>> +	return "Unknown";
>> +}
>> +
>> +int print_cpuinfo(void)
>> +{
>> +	u32 socinfo = readl(GX_AO_SEC_SD_CFG8);
> 
> Perhaps, add a blank line between declarations and code? checkpatch
> issues a warning about this.

Ok

> 
>> +	printf("CPU: Amlogic Meson %s (%s) rev %x:%x (%x:%x)\n",
>> +		socinfo_to_soc_id(socinfo),
>> +		socinfo_to_package_id(socinfo),
>> +		socinfo_to_major(socinfo),
>> +		socinfo_to_minor(socinfo),
>> +		socinfo_to_pack(socinfo),
>> +		socinfo_to_misc(socinfo));
>> +	return 0;
>> +}
>> +#endif /* CONFIG_DISPLAY_CPUINFO */
>> diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
>> index a0b3f8d..970d373 100644
>> --- a/configs/khadas-vim_defconfig
>> +++ b/configs/khadas-vim_defconfig
>> @@ -7,7 +7,7 @@ CONFIG_IDENT_STRING=" khadas-vim"
>>  CONFIG_DEFAULT_DEVICE_TREE="meson-gxl-s905x-khadas-vim"
>>  CONFIG_DEBUG_UART=y
>>  CONFIG_OF_BOARD_SETUP=y
>> -# CONFIG_DISPLAY_CPUINFO is not set
>> +CONFIG_DISPLAY_CPUINFO=y
>>  # CONFIG_DISPLAY_BOARDINFO is not set
>>  # CONFIG_CMD_BDI is not set
>>  # CONFIG_CMD_IMI is not set
>> diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
>> index a7177b9..cfbba30 100644
>> --- a/configs/libretech-cc_defconfig
>> +++ b/configs/libretech-cc_defconfig
>> @@ -7,7 +7,7 @@ CONFIG_IDENT_STRING=" libretech-cc"
>>  CONFIG_DEFAULT_DEVICE_TREE="meson-gxl-s905x-libretech-cc"
>>  CONFIG_DEBUG_UART=y
>>  CONFIG_OF_BOARD_SETUP=y
>> -# CONFIG_DISPLAY_CPUINFO is not set
>> +CONFIG_DISPLAY_CPUINFO=y
>>  # CONFIG_DISPLAY_BOARDINFO is not set
>>  # CONFIG_CMD_BDI is not set
>>  # CONFIG_CMD_IMI is not set
>> diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
>> index 49461aa..657b647 100644
>> --- a/configs/odroid-c2_defconfig
>> +++ b/configs/odroid-c2_defconfig
>> @@ -7,7 +7,7 @@ CONFIG_IDENT_STRING=" odroid-c2"
>>  CONFIG_DEFAULT_DEVICE_TREE="meson-gxbb-odroidc2"
>>  CONFIG_DEBUG_UART=y
>>  CONFIG_OF_BOARD_SETUP=y
>> -# CONFIG_DISPLAY_CPUINFO is not set
>> +CONFIG_DISPLAY_CPUINFO=y
>>  # CONFIG_DISPLAY_BOARDINFO is not set
>>  # CONFIG_CMD_BDI is not set
>>  # CONFIG_CMD_IMI is not set
>> diff --git a/configs/odroid_defconfig b/configs/odroid_defconfig
>> index 810874d..251bf38 100644
>> --- a/configs/odroid_defconfig
>> +++ b/configs/odroid_defconfig
>> @@ -56,3 +56,4 @@ CONFIG_USB_HOST_ETHER=y
>>  CONFIG_USB_ETHER_SMSC95XX=y
>>  CONFIG_LIB_HW_RAND=y
>>  CONFIG_ERRNO_STR=y
>> +CONFIG_DISPLAY_CPUINFO=y
> 
> Odroid is not an Amlogic board.

Oops, will remove it.

> 
> With these 2 issues fixed: Reviewed-by: Beniamino Galvani <b.galvani@gmail.com>
> 
> Beniamino
> 
