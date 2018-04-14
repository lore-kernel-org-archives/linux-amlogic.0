From: trini@konsulko.com (Tom Rini)
Date: Sat, 14 Apr 2018 09:51:10 -0400
Subject: [U-Boot, v2, u-boot, 1/2] reset: Add get/assert/deassert/release
 for bulk of reset signals
In-Reply-To: <0c8c73af-7a00-128a-1193-a0d797e708fc@denx.de>
References: <1522748451-21209-2-git-send-email-narmstrong@baylibre.com>
 <20180411140518.GC10996@bill-the-cat.ec.rr.com>
 <0c8c73af-7a00-128a-1193-a0d797e708fc@denx.de>
Message-ID: <20180414135110.GA5346@bill-the-cat.ec.rr.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Apr 14, 2018 at 02:11:38AM +0200, Marek Vasut wrote:
> On 04/11/2018 04:05 PM, Tom Rini wrote:
> > On Tue, Apr 03, 2018 at 11:40:50AM +0200, Neil Armstrong wrote:
> > 
> >> This patch adds a "bulk" API to the reset API in order to get/deassert/
> >> assert/release a group of reset signals associated with a device.
> >>
> >> This bulk API will avoid adding a copy of the same code to manage
> >> a group of reset signals in drivers.
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> Reviewed-by: Simon Glass <sjg@chromium.org>
> > 
> > Applied to u-boot/master, thanks!
> 
> Breaks building of designware_i2c.c and also isn't checkpatch clean.

For which platform?

> ERROR: trailing whitespace
> #90: FILE: drivers/reset/reset-uclass.c:87:
> +^I$
> 
> total: 1 errors, 0 warnings, 0 checks, 229 lines checked

Yes, I probably ought to see about getting checkpatch to fixup issues
like that automatically.

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180414/c9a79a89/attachment.sig>
