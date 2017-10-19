From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Thu, 19 Oct 2017 11:45:07 +0100
Subject: [RFC PATCH u-boot] ARM: arch-meson: build memory banks using
 reported memory from registers
In-Reply-To: <1508403892-22578-1-git-send-email-narmstrong@baylibre.com>
References: <1508403892-22578-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <9b4348badf34883c6262fd6f1c87e584@codethink.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 2017-10-19 10:04, Neil Armstrong wrote:
> As discussed at [1], the Amlogic Meson GX SoCs can embed a BL31 
> firmware
> and a secondary BL32 firmware.
> Since mid-2017, the reserved memory address of the BL31 firmware was 
> moved
> and grown for security reasons.
> 
> But mainline U-boot and Linux has the old address and size fixed.
> 
> These SoCs have a register interface to get the two firmware reserved
> memory start and sizes.
> 
> This patch adds a dynamic memory bank redistribution according to the
> values in the firmware.
> 
> Note that the memory address ordering between BL31 and BL32 is not 
> etablished,
> so it must be determined dynamically.
> 
> [1] 
> http://lists.infradead.org/pipermail/linux-amlogic/2017-October/004860.html
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/include/asm/arch-meson/gxbb.h | 15 ++++++
>  arch/arm/mach-meson/board.c            | 99 
> +++++++++++++++++++++++++++++++---
>  include/configs/meson-gxbb-common.h    |  2 +-
>  3 files changed, 109 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch-meson/gxbb.h
> b/arch/arm/include/asm/arch-meson/gxbb.h
> index 74d5290..57db37e 100644
> --- a/arch/arm/include/asm/arch-meson/gxbb.h
> +++ b/arch/arm/include/asm/arch-meson/gxbb.h
> @@ -7,10 +7,25 @@
>  #ifndef __GXBB_H__
>  #define __GXBB_H__
> 
> +#define GXBB_AOBUS_BASE		0xc8100000
>  #define GXBB_PERIPHS_BASE	0xc8834400
>  #define GXBB_HIU_BASE		0xc883c000
>  #define GXBB_ETH_BASE		0xc9410000
> 
> +/* Always-On Peripherals registers */
> +#define GXBB_AO_ADDR(off)	(GXBB_AOBUS_BASE + ((off) << 2))
> +
> +#define GXBB_AO_SEC_GP_CFG0	GXBB_AO_ADDR(0x90)
> +#define GXBB_AO_SEC_GP_CFG3	GXBB_AO_ADDR(0x93)
> +#define GXBB_AO_SEC_GP_CFG4	GXBB_AO_ADDR(0x94)
> +#define GXBB_AO_SEC_GP_CFG5	GXBB_AO_ADDR(0x95)
> +
> +#define GXBB_AO_MEM_SIZE_MASK	0xFFFF0000
> +#define GXBB_AO_MEM_SIZE_SHIFT	16
> +#define GXBB_AO_BL31_RSVMEM_SIZE_MASK	0xFFFF0000
> +#define GXBB_AO_BL31_RSVMEM_SIZE_SHIFT	16
> +#define GXBB_AO_BL32_RSVMEM_SIZE_MASK	0xFFFF
> +
>  /* Peripherals registers */
>  #define GXBB_PERIPHS_ADDR(off)	(GXBB_PERIPHS_BASE + ((off) << 2))
> 
> diff --git a/arch/arm/mach-meson/board.c b/arch/arm/mach-meson/board.c
> index e89c6aa..bd330af 100644
> --- a/arch/arm/mach-meson/board.c
> +++ b/arch/arm/mach-meson/board.c
> @@ -11,6 +11,8 @@
>  #include <asm/arch/sm.h>
>  #include <asm/armv8/mmu.h>
>  #include <asm/unaligned.h>
> +#include <linux/sizes.h>
> +#include <asm/io.h>
> 
>  DECLARE_GLOBAL_DATA_PTR;
> 
> @@ -34,14 +36,99 @@ int dram_init(void)
>  	return 0;
>  }
> 
> +phys_size_t get_effective_memsize(void)
> +{
> +	/* Size is reported in MiB, convert it in bytes */
> +	return ((in_le32(GXBB_AO_SEC_GP_CFG0) & GXBB_AO_MEM_SIZE_MASK)
> +			>> GXBB_AO_MEM_SIZE_SHIFT) * SZ_1M;

Is in_le32 suitable here?

> +}
> +
>  int dram_init_banksize(void)
>  {
> -	/* Reserve first 16 MiB of RAM for firmware */
> -	gd->bd->bi_dram[0].start = 0x1000000;
> -	gd->bd->bi_dram[0].size  = 0xf000000;
> -	/* Reserve 2 MiB for ARM Trusted Firmware (BL31) */
> -	gd->bd->bi_dram[1].start = 0x10000000;
> -	gd->bd->bi_dram[1].size  = gd->ram_size - 0x10200000;
> +	u32 bl31_size, bl31_start;
> +	u32 bl32_size, bl32_start;
> +	/* Start after first 16MiB reserved zone */
> +	unsigned int next = 0;
> +	u32 last = 0x1000000;
> +	u32 reg;
> +
> +	/*
> +	 * Get ARM Trusted Firmware reserved memory zones in :
> +	 * - AO_SEC_GP_CFG3: bl32 & bl31 size in KiB, can be 0
> +	 * - AO_SEC_GP_CFG5: bl31 physical start address, can be NULL
> +	 * - AO_SEC_GP_CFG4: bl32 physical start address, can be NULL
> +	 */

Can you use bootmem reserve to do this?


> +
> +	reg = in_le32(GXBB_AO_SEC_GP_CFG3);
> +
> +	bl31_size = ((reg & GXBB_AO_BL31_RSVMEM_SIZE_MASK)
> +			>> GXBB_AO_BL31_RSVMEM_SIZE_SHIFT) * SZ_1K;
> +	bl32_size = (reg & GXBB_AO_BL32_RSVMEM_SIZE_MASK) * SZ_1K;
> +
> +	bl31_start = in_le32(GXBB_AO_SEC_GP_CFG5);
> +	bl32_start = in_le32(GXBB_AO_SEC_GP_CFG4);
> +
> +	if (bl31_size && bl31_start && bl32_size && bl32_start) {
> +		/* Reserve memory for ARM Trusted Firmware (BL31 && BL32) */
> +		gd->bd->bi_dram[next].start = last;
> +		if (bl31_start > bl32_start)
> +			gd->bd->bi_dram[next].size = bl32_start - last;
> +		else
> +			gd->bd->bi_dram[next].size = bl31_start - last;
> +
> +		last = gd->bd->bi_dram[next].start +
> +			gd->bd->bi_dram[next].size;
> +
> +		if (bl31_start > bl32_start)
> +			last += bl32_size;
> +		else
> +			last += bl31_size;
> +		next++;
> +
> +		gd->bd->bi_dram[next].start = last;
> +		if (bl31_start > bl32_start)
> +			gd->bd->bi_dram[next].size = bl31_start - last;
> +		else
> +			gd->bd->bi_dram[next].size = bl32_start - last;
> +
> +		last = gd->bd->bi_dram[next].start +
> +			gd->bd->bi_dram[next].size;
> +
> +		if (bl31_start > bl32_start)
> +			last += bl31_size;
> +		else
> +			last += bl32_size;
> +		next++;
> +	} else if ((bl31_size && bl31_start) || (bl32_size && bl32_start)) {
> +		/* Reserve memory for ARM Trusted Firmware (BL31 || BL32) */
> +		gd->bd->bi_dram[next].start = last;
> +		if (bl31_start && bl31_size)
> +			gd->bd->bi_dram[next].size = bl31_start - last;
> +		else
> +			gd->bd->bi_dram[next].size = bl32_start - last;
> +
> +		last = gd->bd->bi_dram[next].start +
> +			gd->bd->bi_dram[next].size;
> +
> +		if (bl31_start && bl31_size)
> +			last += bl31_size;
> +		else
> +			last += bl32_size;
> +
> +		next++;
> +	}
> +
> +	/* Add remaining memory */
> +	gd->bd->bi_dram[next].start = last;
> +	gd->bd->bi_dram[next].size = get_effective_memsize() - last;
> +	next++;
> +
> +	/* Reset unused banks */
> +	for ( ; next < CONFIG_NR_DRAM_BANKS ; ++next) {
> +		gd->bd->bi_dram[next].start = 0;
> +		gd->bd->bi_dram[next].size = 0;
> +	}
> +
>  	return 0;
>  }
> 
> diff --git a/include/configs/meson-gxbb-common.h
> b/include/configs/meson-gxbb-common.h
> index d88d42d..e70fccd 100644
> --- a/include/configs/meson-gxbb-common.h
> +++ b/include/configs/meson-gxbb-common.h
> @@ -10,7 +10,7 @@
> 
>  #define CONFIG_CPU_ARMV8
>  #define CONFIG_REMAKE_ELF
> -#define CONFIG_NR_DRAM_BANKS		2
> +#define CONFIG_NR_DRAM_BANKS		3
>  #define CONFIG_ENV_SIZE			0x2000
>  #define CONFIG_SYS_MAXARGS		32
>  #define CONFIG_SYS_MALLOC_LEN		(32 << 20)
