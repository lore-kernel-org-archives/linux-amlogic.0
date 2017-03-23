From: wsa@the-dreams.de (Wolfram Sang)
Date: Thu, 23 Mar 2017 21:31:56 +0100
Subject: [PATCH v4 03/10] i2c: meson: set clock divider in probe instead
 of setting it for each transfer
In-Reply-To: <c85a5f83-0013-001e-6c2d-3fe66c5267aa@gmail.com>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
 <c85a5f83-0013-001e-6c2d-3fe66c5267aa@gmail.com>
Message-ID: <20170323203156.jjsiu7hydebzh66l@ninjato>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Mar 14, 2017 at 10:53:29PM +0100, Heiner Kallweit wrote:
> The bus frequency won't change, therefore we can set the clock divider
> in probe already and we don't have to set it for each transfer.

This is true for some SoCs, but not for all. So, some proof we can
really do it like this would be nice in the commit message, e.g. "parent
clock is fixed anyhow" or something.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170323/7ec05da9/attachment.sig>
