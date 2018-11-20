From: trini@konsulko.com (Tom Rini)
Date: Tue, 20 Nov 2018 16:48:04 -0500
Subject: [U-Boot,u-boot] clk: meson: fix clk81 divider calculation
In-Reply-To: <20181113103838.7167-1-narmstrong@baylibre.com>
References: <20181113103838.7167-1-narmstrong@baylibre.com>
Message-ID: <20181120214804.GM11247@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Nov 13, 2018 at 11:38:38AM +0100, Neil Armstrong wrote:

> From: Jerome Brunet <jbrunet@baylibre.com>
> 
> clk81 divider is 0 based (meaning that 0 value in the register means
> divide by 1). Fix clk81 rate calculation for this.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20181120/357c8413/attachment.sig>
