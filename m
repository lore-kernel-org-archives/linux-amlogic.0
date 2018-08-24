From: trini@konsulko.com (Tom Rini)
Date: Fri, 24 Aug 2018 16:10:04 -0400
Subject: [U-Boot, u-boot, 1/3] boards: amlogic: remove ethernet gpio
 reset code from boards
In-Reply-To: <20180814130754.19294-2-b.galvani@gmail.com>
References: <20180814130754.19294-2-b.galvani@gmail.com>
Message-ID: <20180824201004.GL26633@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Aug 14, 2018 at 03:07:52PM +0200, Beniamino Galvani wrote:

> The reset is already handled by the designware driver using
> information from device tree.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180824/82676d4b/attachment.sig>
