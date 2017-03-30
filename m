From: wsa@the-dreams.de (Wolfram Sang)
Date: Thu, 30 Mar 2017 17:56:51 +0200
Subject: [PATCH v5 00/10] i2c: meson: series with improvements
In-Reply-To: <645519b8-93e6-57b1-ae8f-7804c6beb9b1@gmail.com>
References: <645519b8-93e6-57b1-ae8f-7804c6beb9b1@gmail.com>
Message-ID: <20170330155651.be6kcggq4bb7py4p@ninjato>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Mar 25, 2017 at 01:57:00PM +0100, Heiner Kallweit wrote:
> This patch series includes several improvements for the i2c-meson
> driver.
> 
> Changes in v2:
> - removed patches 8 and 12
> - removed one small change in patch 6
> - don't print error message in patch 7
> 
> Changes in v3:
> - changed order of patches 3, 4, 5 what makes the patches more simple
> - remove one change from patch 7 to still properly deal with timeouts
> 
> Changes in v4:
> - update DT binding documentation as part of patch 4
> 
> Changes in v5:
> - extend commit message for patch 3
> - remove unused properties from binding documentation in patch 4
> - replace WARN_ON with dev_err in patch 5
> 
> Heiner Kallweit (12):

Note that since v2 the above "12" is obsolete ;)

>   i2c: meson: use min instead of min_t where min_t isn't needed
>   i2c: meson: remove member irq from struct meson_i2c
>   i2c: meson: set clock divider in probe instead of setting it for each transfer
>   i2c: meson: use i2c core for DT clock-frequency parsing
>   i2c: meson: use full 12 bits for clock divider
>   i2c: meson: remove variable count from meson_i2c_xfer
>   i2c: meson: improve interrupt handler and detect spurious interrupts
>   i2c: meson: don't create separate token chain just for the stop command
>   i2c: meson: remove meson_i2c_write_tokens
>   i2c: meson: improve and simplify interrupt handler

Applied all to for-next, thanks!

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170330/80936071/attachment.sig>
