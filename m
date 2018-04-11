From: trini@konsulko.com (Tom Rini)
Date: Wed, 11 Apr 2018 10:05:33 -0400
Subject: [U-Boot,v2,u-boot,2/2] clk: add sandbox test for bulk API
In-Reply-To: <1522748659-21622-3-git-send-email-narmstrong@baylibre.com>
References: <1522748659-21622-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180411140533.GF10996@bill-the-cat.ec.rr.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Apr 03, 2018 at 11:44:19AM +0200, Neil Armstrong wrote:

> This patch adds the bulk clock API tests for the sandbox test suite.
> 
> It's very similar to the main test but only uses the _bulk() API and
> checks if the clocks are correctly enabled/disabled.
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180411/a280eb10/attachment.sig>
