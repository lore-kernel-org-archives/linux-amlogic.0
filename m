From: trini@konsulko.com (Tom Rini)
Date: Wed, 11 Apr 2018 10:04:50 -0400
Subject: [U-Boot] serial: meson: Update compatible with new Linux bindings
In-Reply-To: <1522328162-13786-1-git-send-email-narmstrong@baylibre.com>
References: <1522328162-13786-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180411140450.GX10996@bill-the-cat.ec.rr.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Mar 29, 2018 at 02:56:02PM +0200, Neil Armstrong wrote:

> The Amlogic Meson SoCs serial bindings were not written when serial
> support was pushed into Linux and U-Boot.
> A clean bindings document has been merged into Linux tree to correctly
> handle the multiple clocks feeding the serial peripheral.
> This update the U-Boot serial_meson driver with the new compatible
> string for Amlogic Meson GX Socs.
> 
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180411/1c16b02c/attachment.sig>
