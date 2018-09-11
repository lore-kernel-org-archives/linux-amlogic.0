From: trini@konsulko.com (Tom Rini)
Date: Tue, 11 Sep 2018 08:25:24 -0400
Subject: [U-Boot, v2, u-boot, 2/2] clk: clk_meson: Add mux and div
 support for reparent and rate setting
In-Reply-To: <1533559760-32136-3-git-send-email-narmstrong@baylibre.com>
References: <1533559760-32136-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180911122524.GF4980@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Aug 06, 2018 at 02:49:20PM +0200, Neil Armstrong wrote:

> This patch adds support for :
> - Rate calculation through muxes and generic dividers
> - Basic gate setting propagation
> - Reparenting for muxes
> - Clock rate setting through generic dividers without reparenting
> 
> Support is only added to the Composite VPU and VAPB clocks in order
> to support the Video Processing Unit Power Domain clock setup.
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180911/73f91e2c/attachment.sig>
