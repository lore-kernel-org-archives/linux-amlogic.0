From: trini@konsulko.com (Tom Rini)
Date: Tue, 11 Sep 2018 08:25:21 -0400
Subject: [U-Boot, v2, u-boot, 1/2] power: domain: Add the VPU Power
 Domain driver
In-Reply-To: <1533559760-32136-2-git-send-email-narmstrong@baylibre.com>
References: <1533559760-32136-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180911122521.GE4980@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Aug 06, 2018 at 02:49:19PM +0200, Neil Armstrong wrote:

> The Amlogic Meson SoCs embeds a specific Power Domain dedicated to the
> Video Processing Unit.
> This patch implements support for this power domain in preparation of the
> future support for the Video display support in U-Boot.
> 
> This driver will depend on changes in the clock driver to handle the setup
> of the VPU and VAPB clocks configured from DT using assigned-clocks entries.
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180911/01c2c1f8/attachment.sig>
