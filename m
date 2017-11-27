From: sjg@chromium.org (Simon Glass)
Date: Mon, 27 Nov 2017 10:12:55 -0700
Subject: [PATCH u-boot v2] ARM: arch-meson: build memory banks using
 reported memory from registers
In-Reply-To: <1511775346-5082-1-git-send-email-narmstrong@baylibre.com>
References: <1511775346-5082-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ2vRT=H7M=VwOgVKMWBiCGzdvcKC84nprJ-ZYE_UGJULg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 27 November 2017 at 02:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
> As discussed at [1], the Amlogic Meson GX SoCs can embed a BL31 firmware
> and a secondary BL32 firmware.
> Since mid-2017, the reserved memory address of the BL31 firmware was moved
> and grown for security reasons.
>
> But mainline U-Boot and Linux has the old address and size fixed.
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
> Changes since v1:
> - switched the #if to if(IS_ENABLED()) to compile all code paths
> - renamed function to meson_board_add_reserved_memory()
> - added a mem.h header with comment
> - updated all boards ft_board_setup()
>
> Changes since RFC v2:
> - reduced preprocessor load
> - kept Odroid-C2 static memory mapping as exception
>
> Changes since RFC v1:
> - switch to fdt rsv mem table and efi reserve memory
> - replaced in_le32 by readl()
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/include/asm/arch-meson/gxbb.h    | 17 +++++++
>  arch/arm/include/asm/arch-meson/mem.h     | 16 +++++++
>  arch/arm/mach-meson/board.c               | 74 +++++++++++++++++++++++++++----
>  board/amlogic/khadas-vim/khadas-vim.c     |  7 +++
>  board/amlogic/libretech-cc/libretech-cc.c |  8 ++++
>  board/amlogic/odroid-c2/odroid-c2.c       |  8 ++++
>  board/amlogic/p212/p212.c                 |  8 ++++
>  configs/khadas-vim_defconfig              |  1 +
>  configs/libretech-cc_defconfig            |  1 +
>  configs/odroid-c2_defconfig               |  1 +
>  configs/p212_defconfig                    |  1 +
>  include/configs/meson-gxbb-common.h       |  2 +-
>  12 files changed, 135 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm/include/asm/arch-meson/mem.h

Seems good, so far as I understand it.

Reviewed-by: Simon Glass <sjg@chromium.org>
