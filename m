From: trini@konsulko.com (Tom Rini)
Date: Mon, 4 Dec 2017 13:36:29 -0500
Subject: [U-Boot, u-boot, v3, 5/5] arm: Add Khadas VIM support based on
 Meson GXL family
In-Reply-To: <1511774180-22672-6-git-send-email-narmstrong@baylibre.com>
References: <1511774180-22672-6-git-send-email-narmstrong@baylibre.com>
Message-ID: <20171204183629.GX3587@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Nov 27, 2017 at 10:16:20AM +0100, Neil Armstrong wrote:

> This adds platform code for the Khadas VIM board based on a
> Meson GXL (S905X) SoC with the Meson GXL configuration.
> 
> This initial submission supports UART, MMC/SDCard and Ethernet with the
> Internal RMII PHY.
> 
> The meson-gxl-s905x-khadas-vim.dts is synchronised from the linux 4.13
> stable tree as of 4.13.8.
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171204/9ebdbb15/attachment.sig>
