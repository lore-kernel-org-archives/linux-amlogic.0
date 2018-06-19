From: trini@konsulko.com (Tom Rini)
Date: Tue, 19 Jun 2018 14:43:31 -0400
Subject: [U-Boot,u-boot,4/5] meson: use the clock driver
In-Reply-To: <1528976621-8397-5-git-send-email-narmstrong@baylibre.com>
References: <1528976621-8397-5-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180619184331.GK4609@bill-the-cat.ec.rr.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jun 14, 2018 at 01:43:40PM +0200, Neil Armstrong wrote:

> From: Beniamino Galvani <b.galvani@gmail.com>
> 
> Use the clk framework to initialize clocks from drivers that need them
> instead of having hardcoded frequencies and initializations from board
> code.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180619/1724ec93/attachment.sig>
