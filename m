From: trini@konsulko.com (Tom Rini)
Date: Wed, 11 Apr 2018 10:05:18 -0400
Subject: [U-Boot, v2, u-boot, 1/2] reset: Add get/assert/deassert/release
 for bulk of reset signals
In-Reply-To: <1522748451-21209-2-git-send-email-narmstrong@baylibre.com>
References: <1522748451-21209-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180411140518.GC10996@bill-the-cat.ec.rr.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Apr 03, 2018 at 11:40:50AM +0200, Neil Armstrong wrote:

> This patch adds a "bulk" API to the reset API in order to get/deassert/
> assert/release a group of reset signals associated with a device.
> 
> This bulk API will avoid adding a copy of the same code to manage
> a group of reset signals in drivers.
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180411/d0fe1857/attachment.sig>
