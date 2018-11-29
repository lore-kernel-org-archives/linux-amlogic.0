From: trini@konsulko.com (Tom Rini)
Date: Thu, 29 Nov 2018 16:36:30 -0500
Subject: [U-Boot]  Please pull u-boot-amlogic-20181126
In-Reply-To: <fee8d8fc-f531-171e-4ac0-d381bdd1eabd@baylibre.com>
References: <fee8d8fc-f531-171e-4ac0-d381bdd1eabd@baylibre.com>
Message-ID: <20181129213630.GT5048@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Nov 27, 2018 at 02:56:16PM +0100, Neil Armstrong wrote:

> Hi Tom,
> 
> The following changes since commit 5830791d91d1200854ef78fcb32f808c8080f0f0:
> 
>   Merge tag 'pull-tg18' of git://git.denx.de/u-boot-dm (2018-11-23 17:25:27 -0500)
> 
> are available in the Git repository at:
> 
>   git://git.denx.de/u-boot-amlogic.git tags/u-boot-amlogic-20181126
> 
> for you to fetch changes up to d96a782d09dbdc4a28ece3d18dc17a572e39d4f2:
> 
>   ARM: meson: Add boot device discovery (2018-11-26 14:40:52 +0100)

FWIW, please make sure to put me in the to: line next time as well.

Also, I fixed it up this time but please run:
$ ./tools/genboardscfg.py -f

to make sure no new configs show up that aren't listed in MAINTAINERS.
I've added the boards added here to the relevant spots.

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20181129/48bd6bdf/attachment.sig>
