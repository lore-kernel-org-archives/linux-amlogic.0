From: sjg@chromium.org (Simon Glass)
Date: Fri, 24 Nov 2017 15:35:35 -0700
Subject: [PATCH u-boot] ARM: arch-meson: build memory banks using reported
 memory from registers
In-Reply-To: <1511192169-18458-1-git-send-email-narmstrong@baylibre.com>
References: <1511192169-18458-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ2QwOrAEC+nvA+6doG6cKLJKT-4b=P5ry66_SUZyyucGw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On 20 November 2017 at 08:36, Neil Armstrong <narmstrong@baylibre.com> wrote:
> As discussed at [1], the Amlogic Meson GX SoCs can embed a BL31 firmware
> and a secondary BL32 firmware.
> Since mid-2017, the reserved memory address of the BL31 firmware was moved
> and grown for security reasons.
>
> But mainline U-boot and Linux has the old address and size fixed.

U-Boot

>
> These SoCs have a register interface to get the two firmware reserved
> memory start and sizes.
>
> This patch adds a dynamic reservation of the memory zones in the device tree bootmem
> reserved memory zone used by the kernel in early boot.
> To be complete, the memory zones are also added to the EFI reserved zones.
>
> Depends on patchset "Add support for Amlogic GXL Based SBCs" at [2].
>
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/004860.html
> [2] http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005410.html
>
> Changes since RFC v2:
> - reduced preprocessor load
> - kept Odroid-C2 static memory mapping as exception
>
> Changes since RFC v1:
> - switch to fdt rsv mem table and efi reserve memory
> - replaced in_le32 by readl()
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/include/asm/arch-meson/gxbb.h    | 17 +++++++
>  arch/arm/mach-meson/board.c               | 74 +++++++++++++++++++++++++++----
>  board/amlogic/khadas-vim/khadas-vim.c     |  7 +++
>  board/amlogic/libretech-cc/libretech-cc.c |  7 +++
>  board/amlogic/odroid-c2/odroid-c2.c       |  7 +++
>  board/amlogic/p212/p212.c                 |  7 +++
>  configs/khadas-vim_defconfig              |  1 +
>  configs/libretech-cc_defconfig            |  1 +
>  configs/odroid-c2_defconfig               |  1 +
>  configs/p212_defconfig                    |  1 +
>  include/configs/meson-gxbb-common.h       |  2 +-
>  11 files changed, 116 insertions(+), 9 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Various nits/suggestions below.

>
> diff --git a/arch/arm/include/asm/arch-meson/gxbb.h b/arch/arm/include/asm/arch-meson/gxbb.h
> index 74d5290..117f796 100644
> --- a/arch/arm/include/asm/arch-meson/gxbb.h
> +++ b/arch/arm/include/asm/arch-meson/gxbb.h
> @@ -7,10 +7,27 @@
>  #ifndef __GXBB_H__
>  #define __GXBB_H__
>
> +#define GXBB_FIRMWARE_MEM_SIZE 0x1000000
> +
> +#define GXBB_AOBUS_BASE                0xc8100000

Does this not come from the device tree?

>  #define GXBB_PERIPHS_BASE      0xc8834400
>  #define GXBB_HIU_BASE          0xc883c000
>  #define GXBB_ETH_BASE          0xc9410000
>
> +/* Always-On Peripherals registers */
> +#define GXBB_AO_ADDR(off)      (GXBB_AOBUS_BASE + ((off) << 2))
> +
> +#define GXBB_AO_SEC_GP_CFG0    GXBB_AO_ADDR(0x90)
> +#define GXBB_AO_SEC_GP_CFG3    GXBB_AO_ADDR(0x93)
> +#define GXBB_AO_SEC_GP_CFG4    GXBB_AO_ADDR(0x94)
> +#define GXBB_AO_SEC_GP_CFG5    GXBB_AO_ADDR(0x95)
> +
> +#define GXBB_AO_MEM_SIZE_MASK  0xFFFF0000
> +#define GXBB_AO_MEM_SIZE_SHIFT 16
> +#define GXBB_AO_BL31_RSVMEM_SIZE_MASK  0xFFFF0000
> +#define GXBB_AO_BL31_RSVMEM_SIZE_SHIFT 16
> +#define GXBB_AO_BL32_RSVMEM_SIZE_MASK  0xFFFF
> +
>  /* Peripherals registers */
>  #define GXBB_PERIPHS_ADDR(off) (GXBB_PERIPHS_BASE + ((off) << 2))

Can you use lower-case hex consistently?

Also consider a C struct for this peripheral.

>
> diff --git a/arch/arm/mach-meson/board.c b/arch/arm/mach-meson/board.c
> index e89c6aa..855614a 100644
> --- a/arch/arm/mach-meson/board.c
> +++ b/arch/arm/mach-meson/board.c
> @@ -11,6 +11,9 @@
>  #include <asm/arch/sm.h>
>  #include <asm/armv8/mmu.h>
>  #include <asm/unaligned.h>
> +#include <linux/sizes.h>
> +#include <efi_loader.h>
> +#include <asm/io.h>
>
>  DECLARE_GLOBAL_DATA_PTR;
>
> @@ -34,15 +37,70 @@ int dram_init(void)
>         return 0;
>  }
>
> -int dram_init_banksize(void)
> +phys_size_t get_effective_memsize(void)
>  {
> -       /* Reserve first 16 MiB of RAM for firmware */
> -       gd->bd->bi_dram[0].start = 0x1000000;
> -       gd->bd->bi_dram[0].size  = 0xf000000;
> -       /* Reserve 2 MiB for ARM Trusted Firmware (BL31) */
> -       gd->bd->bi_dram[1].start = 0x10000000;
> -       gd->bd->bi_dram[1].size  = gd->ram_size - 0x10200000;
> -       return 0;
> +       /* Size is reported in MiB, convert it in bytes */
> +       return ((readl(GXBB_AO_SEC_GP_CFG0) & GXBB_AO_MEM_SIZE_MASK)
> +                       >> GXBB_AO_MEM_SIZE_SHIFT) * SZ_1M;
> +}
> +
> +static void meson_board_add_reserved_memory(void *fdt, u64 start, u64 size)
> +{
> +       int ret;
> +
> +       ret = fdt_add_mem_rsv(fdt, start, size);
> +       if (ret)
> +               printf("Could not reserve zone @ 0x%llx\n", start);
> +
> +#if defined(CONFIG_EFI_LOADER)

If it possible to do:

if (IS_ENABLED(CONFIG_EFI_LOADER)) {
...

That way we don't introduce a new code path for the build.


> +       efi_add_memory_map(start, ALIGN(size, EFI_PAGE_SIZE) >> EFI_PAGE_SHIFT,
> +                          EFI_RESERVED_MEMORY_TYPE, false);
> +#endif
> +}
> +
> +void ft_cpu_setup(void *fdt, bd_t *bd)

I know this is a standard name, but I fell it would be better to name
it with something containing amlogic so that it is easier to find.

> +{
> +       u64 bl31_size, bl31_start;
> +       u64 bl32_size, bl32_start;
> +       u32 reg;
> +
> +       /*
> +        * Get ARM Trusted Firmware reserved memory zones in :
> +        * - AO_SEC_GP_CFG3: bl32 & bl31 size in KiB, can be 0
> +        * - AO_SEC_GP_CFG5: bl31 physical start address, can be NULL
> +        * - AO_SEC_GP_CFG4: bl32 physical start address, can be NULL
> +        */
> +
> +       reg = readl(GXBB_AO_SEC_GP_CFG3);
> +
> +       bl31_size = ((reg & GXBB_AO_BL31_RSVMEM_SIZE_MASK)
> +                       >> GXBB_AO_BL31_RSVMEM_SIZE_SHIFT) * SZ_1K;
> +       bl32_size = (reg & GXBB_AO_BL32_RSVMEM_SIZE_MASK) * SZ_1K;
> +
> +       bl31_start = readl(GXBB_AO_SEC_GP_CFG5);
> +       bl32_start = readl(GXBB_AO_SEC_GP_CFG4);
> +
> +       /*
> +        * Early Meson GXBB Firmware revisions did not provide the reserved
> +        * memory zones in the registers, keep fixed memory zone handling.
> +        */
> +#ifdef CONFIG_MESON_GXBB

Can you use if () ?

> +       if (!reg && !bl31_start && !bl32_start) {
> +               bl31_start = 0x10000000;
> +               bl31_size = 0x200000;
> +       }
> +#endif
> +
> +       /* Add first 16MiB reserved zone */
> +       meson_board_add_reserved_memory(fdt, 0, GXBB_FIRMWARE_MEM_SIZE);
> +
> +       /* Add BL31 reserved zone */
> +       if (bl31_start && bl31_size)
> +               meson_board_add_reserved_memory(fdt, bl31_start, bl31_size);
> +
> +       /* Add BL32 reserved zone */
> +       if (bl32_start && bl32_size)
> +               meson_board_add_reserved_memory(fdt, bl32_start, bl32_size);
>  }
>
>  void reset_cpu(ulong addr)
> diff --git a/board/amlogic/khadas-vim/khadas-vim.c b/board/amlogic/khadas-vim/khadas-vim.c
> index ece8096..54e31f5 100644
> --- a/board/amlogic/khadas-vim/khadas-vim.c
> +++ b/board/amlogic/khadas-vim/khadas-vim.c
> @@ -56,3 +56,10 @@ int misc_init_r(void)
>
>         return 0;
>  }
> +
> +int ft_board_setup(void *blob, bd_t *bd)
> +{
> +       ft_cpu_setup(blob, bd);
> +
> +       return 0;
> +}
> diff --git a/board/amlogic/libretech-cc/libretech-cc.c b/board/amlogic/libretech-cc/libretech-cc.c
> index ece8096..54e31f5 100644
> --- a/board/amlogic/libretech-cc/libretech-cc.c
> +++ b/board/amlogic/libretech-cc/libretech-cc.c
> @@ -56,3 +56,10 @@ int misc_init_r(void)
>
>         return 0;
>  }
> +
> +int ft_board_setup(void *blob, bd_t *bd)
> +{
> +       ft_cpu_setup(blob, bd);
> +
> +       return 0;
> +}
> diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
> index eac04d8..a9ca34c 100644
> --- a/board/amlogic/odroid-c2/odroid-c2.c
> +++ b/board/amlogic/odroid-c2/odroid-c2.c
> @@ -60,3 +60,10 @@ int misc_init_r(void)
>
>         return 0;
>  }
> +
> +int ft_board_setup(void *blob, bd_t *bd)
> +{
> +       ft_cpu_setup(blob, bd);
> +
> +       return 0;
> +}
> diff --git a/board/amlogic/p212/p212.c b/board/amlogic/p212/p212.c
> index ece8096..abd4f76 100644
> --- a/board/amlogic/p212/p212.c
> +++ b/board/amlogic/p212/p212.c
> @@ -56,3 +56,10 @@ int misc_init_r(void)
>
>         return 0;
>  }
> +
> +int ft_board_setup(void *blob, bd_t *bd)
> +{
> +       ft_cpu_setup(blob, bd);
> +
> +       return 0;
> +}
> diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
> index dcccc69..f2a30a8 100644
> --- a/configs/khadas-vim_defconfig
> +++ b/configs/khadas-vim_defconfig
> @@ -17,6 +17,7 @@ CONFIG_CMD_MMC=y
>  CONFIG_CMD_GPIO=y
>  # CONFIG_CMD_SETEXPR is not set
>  CONFIG_OF_CONTROL=y
> +CONFIG_OF_BOARD_SETUP=y
>  CONFIG_DM_GPIO=y
>  CONFIG_DM_MMC=y
>  CONFIG_MMC_MESON_GX=y
> diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
> index a63e940..6583c43 100644
> --- a/configs/libretech-cc_defconfig
> +++ b/configs/libretech-cc_defconfig
> @@ -17,6 +17,7 @@ CONFIG_CMD_MMC=y
>  CONFIG_CMD_GPIO=y
>  # CONFIG_CMD_SETEXPR is not set
>  CONFIG_OF_CONTROL=y
> +CONFIG_OF_BOARD_SETUP=y
>  CONFIG_DM_GPIO=y
>  CONFIG_DM_MMC=y
>  CONFIG_MMC_MESON_GX=y
> diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
> index f7f8016..4615e03 100644
> --- a/configs/odroid-c2_defconfig
> +++ b/configs/odroid-c2_defconfig
> @@ -15,6 +15,7 @@ CONFIG_CMD_GPIO=y
>  CONFIG_CMD_MMC=y
>  # CONFIG_CMD_SETEXPR is not set
>  CONFIG_OF_CONTROL=y
> +CONFIG_OF_BOARD_SETUP=y
>  CONFIG_NET_RANDOM_ETHADDR=y
>  CONFIG_DM_GPIO=y
>  CONFIG_DM_MMC=y
> diff --git a/configs/p212_defconfig b/configs/p212_defconfig
> index d4b5349..b6e788b 100644
> --- a/configs/p212_defconfig
> +++ b/configs/p212_defconfig
> @@ -17,6 +17,7 @@ CONFIG_CMD_MMC=y
>  CONFIG_CMD_GPIO=y
>  # CONFIG_CMD_SETEXPR is not set
>  CONFIG_OF_CONTROL=y
> +CONFIG_OF_BOARD_SETUP=y
>  CONFIG_DM_GPIO=y
>  CONFIG_DM_MMC=y
>  CONFIG_MMC_MESON_GX=y
> diff --git a/include/configs/meson-gxbb-common.h b/include/configs/meson-gxbb-common.h
> index d88d42d..c2b306a 100644
> --- a/include/configs/meson-gxbb-common.h
> +++ b/include/configs/meson-gxbb-common.h
> @@ -10,7 +10,7 @@
>
>  #define CONFIG_CPU_ARMV8
>  #define CONFIG_REMAKE_ELF
> -#define CONFIG_NR_DRAM_BANKS           2
> +#define CONFIG_NR_DRAM_BANKS           1
>  #define CONFIG_ENV_SIZE                        0x2000
>  #define CONFIG_SYS_MAXARGS             32
>  #define CONFIG_SYS_MALLOC_LEN          (32 << 20)
> --
> 2.7.4
>

Regards,
Simon
