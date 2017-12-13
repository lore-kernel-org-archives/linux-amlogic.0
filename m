From: trini@konsulko.com (Tom Rini)
Date: Tue, 12 Dec 2017 21:33:27 -0500
Subject: [U-Boot,4/4] meson: use the clock driver
In-Reply-To: <20171203091713.22029-5-b.galvani@gmail.com>
References: <20171203091713.22029-5-b.galvani@gmail.com>
Message-ID: <20171213023327.GA24685@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Dec 03, 2017 at 10:17:13AM +0100, Beniamino Galvani wrote:

> Use the clk framework to initialize clocks from drivers that need them
> instead of having hardcoded frequencies and initializations from board
> code.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> ---
>  arch/arm/include/asm/arch-meson/gxbb.h | 10 ----------
>  arch/arm/include/asm/arch-meson/i2c.h  | 11 -----------
>  board/amlogic/odroid-c2/odroid-c2.c    |  4 +---
>  board/amlogic/p212/p212.c              |  3 +--
>  drivers/i2c/meson_i2c.c                | 20 +++++++++++++++++---
>  5 files changed, 19 insertions(+), 29 deletions(-)
>  delete mode 100644 arch/arm/include/asm/arch-meson/i2c.h

This fails to apply in non-trivial ways, please update and re-test,
thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171212/5cd90295/attachment.sig>
