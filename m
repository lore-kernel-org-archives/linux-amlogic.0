From: trini@konsulko.com (Tom Rini)
Date: Mon, 4 Dec 2017 13:36:32 -0500
Subject: [U-Boot, u-boot, v2] ARM: arch-meson: build memory banks using
 reported memory from registers
In-Reply-To: <1511775346-5082-1-git-send-email-narmstrong@baylibre.com>
References: <1511775346-5082-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <20171204183632.GY3587@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Nov 27, 2017 at 10:35:46AM +0100, Neil Armstrong wrote:

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
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171204/ed560e94/attachment.sig>
