From: trini@konsulko.com (Tom Rini)
Date: Wed, 11 Apr 2018 10:05:24 -0400
Subject: [U-Boot,v2,u-boot,2/2] reset: add sandbox test for bulk API
In-Reply-To: <1522748451-21209-3-git-send-email-narmstrong@baylibre.com>
References: <1522748451-21209-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180411140524.GD10996@bill-the-cat.ec.rr.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Apr 03, 2018 at 11:40:51AM +0200, Neil Armstrong wrote:

> This patch adds the bulk reset API tests for the sandbox test suite.
> 
> Unlike the main test, it also check the "other" reset signal using the bulk API
> and checks if the resets are correctly asserted/deasserted.
> 
> To allow the bulk API to work, and avoid changing the DT, the number of resets
> of the sandbox reset controller has been bumped to 101 for the "other" reset
> line to be valid.
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180411/38185354/attachment.sig>
