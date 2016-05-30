From: trini@konsulko.com (Tom Rini)
Date: Mon, 30 May 2016 13:57:23 -0400
Subject: [U-Boot, v7, 3/4] arm: add initial support for Amlogic Meson and
 ODROID-C2
In-Reply-To: <1462689017-3160-4-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-4-git-send-email-b.galvani@gmail.com>
Message-ID: <20160530175723.GU7419@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, May 08, 2016 at 08:30:16AM +0200, Beniamino Galvani wrote:

> This adds platform code for the Amlogic Meson GXBaby (S905) SoC and a
> board definition for ODROID-C2. This initial submission only supports
> UART and Ethernet (through the existing Designware driver). DTS files
> are the ones submitted to Linux arm-soc for 4.7 [1].
> 
> [1] https://patchwork.ozlabs.org/patch/603583/
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20160530/707978c0/attachment.sig>
