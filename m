From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 08 Mar 2017 10:17:03 +0100
Subject: [PATCH] i2c: meson: fix wrong variable usage in meson_i2c_put_data
In-Reply-To: <7ecc4542-a6ca-f266-5c34-057b3f5a33bf@gmail.com>
References: <7ecc4542-a6ca-f266-5c34-057b3f5a33bf@gmail.com>
Message-ID: <1488964623.2514.7.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2017-03-07 at 21:06 +0100, Heiner Kallweit wrote:
> Most likely a copy & paste error.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> ?drivers/i2c/busses/i2c-meson.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 2aa61bbb..73b97c71 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -175,7 +175,7 @@ static void meson_i2c_put_data(struct meson_i2c *i2c, char *buf, int len)
> ?		wdata1 |= *buf++ << ((i - 4) * 8);
> ?
> ?	writel(wdata0, i2c->regs + REG_TOK_WDATA0);
> -	writel(wdata0, i2c->regs + REG_TOK_WDATA1);
> +	writel(wdata1, i2c->regs + REG_TOK_WDATA1);
> ?
> ?	dev_dbg(i2c->dev, "%s: data %08x %08x len %d\n", __func__,
> ?		wdata0, wdata1, len);

Good catch, Strange it did not show up before.

You are just missing the Fixes tag.
Fixes: 30021e3707a7 ("i2c: add support for Amlogic Meson I2C controller")

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
