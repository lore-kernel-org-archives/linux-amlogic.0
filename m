From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 08 Mar 2017 10:28:50 +0100
Subject: [PATCH 06/12] i2c: meson: remove variable count from
 meson_i2c_xfer
In-Reply-To: <95687966-387c-f9ba-ae0a-9b0258f7ad43@gmail.com>
References: <d5f0545a-fb4c-b436-20f5-7df9d10605b1@gmail.com>
 <95687966-387c-f9ba-ae0a-9b0258f7ad43@gmail.com>
Message-ID: <1488965330.2514.12.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 2017-03-08 at 07:46 +0100, Heiner Kallweit wrote:
> Variable count has always the same value as i, so we don't need it.
> In addition use &msgs[i] instead of msgs + i to improve readability
> of code a little.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> ?drivers/i2c/busses/i2c-meson.c | 7 +++----
> ?1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 594fec22..81304840 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -364,20 +364,19 @@ static int meson_i2c_xfer(struct i2c_adapter *adap,
> struct i2c_msg *msgs,
> ?			??int num)
> ?{
> ?	struct meson_i2c *i2c = adap->algo_data;
> -	int i, ret = 0, count = 0;
> +	int i, ret = 0;
> ?
> ?	clk_enable(i2c->clk);
> ?
> ?	for (i = 0; i < num; i++) {
> -		ret = meson_i2c_xfer_msg(i2c, msgs + i, i == num - 1);
> +		ret = meson_i2c_xfer_msg(i2c, &msgs[i], i == num - 1);

It's a matter of taste whether this is more readable. I personally prefer it the
way it was.


> ?		if (ret)
> ?			break;
> -		count++;
> ?	}
> ?
> ?	clk_disable(i2c->clk);
> ?
> -	return ret ? ret : count;
> +	return ret ?: i;
> ?}
> ?
> ?static u32 meson_i2c_func(struct i2c_adapter *adap)
