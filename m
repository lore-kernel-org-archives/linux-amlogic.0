From: trini@konsulko.com (Tom Rini)
Date: Mon, 18 Dec 2017 18:37:40 -0500
Subject: [U-Boot,u-boot] ARM: arch-meson: fix writel arguments order
In-Reply-To: <1513085019-8071-1-git-send-email-narmstrong@baylibre.com>
References: <1513085019-8071-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <20171218233740.GN14220@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Dec 12, 2017 at 02:23:39PM +0100, Neil Armstrong wrote:

> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> Using writel causes a "Synchronous Abort". Invert the arguments.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171218/95339b2f/attachment.sig>
