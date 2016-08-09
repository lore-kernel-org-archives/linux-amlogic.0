From: heiko@sntech.de (Heiko =?ISO-8859-1?Q?St=FCbner?=)
Date: Tue, 09 Aug 2016 14:13:11 +0200
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
Message-ID: <5423570.keugkegXM3@diego>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am Dienstag, 9. August 2016, 13:36:17 schrieb Wolfram Sang:
> The core will do this for us now.
> 
> Signed-off-by: Wolfram Sang <wsa-dev@sang-engineering.com>
> ---

[...]

> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 2bc8b01153d619..3b87afe82f6394 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1303,10 +1303,8 @@ static int rk3x_i2c_probe(struct platform_device
> *pdev) rk3x_i2c_adapt_div(i2c, clk_rate);
> 
>  	ret = i2c_add_adapter(&i2c->adap);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Could not register adapter\n");
> +	if (ret < 0)
>  		goto err_clk_notifier;
> -	}
> 
>  	dev_info(&pdev->dev, "Initialized RK3xxx I2C bus at %p\n", i2c->regs);

for Rockchip
Acked-by: Heiko Stuebner <heiko@sntech.de>
