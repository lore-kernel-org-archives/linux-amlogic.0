From: ludovic.desroches@atmel.com (Ludovic Desroches)
Date: Wed, 10 Aug 2016 08:17:15 +0200
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
Message-ID: <20160810061715.GH12809@odux.rfo.atmel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Aug 09, 2016 at 01:36:17PM +0200, Wolfram Sang wrote:
> The core will do this for us now.
> 
> Signed-off-by: Wolfram Sang <wsa-dev@sang-engineering.com>
> ---

[...]

>  drivers/i2c/busses/i2c-at91.c           | 2 --

Acked-by: Ludovic Desroches <ludovic.desroches@atmel.com>

[...]

> diff --git a/drivers/i2c/busses/i2c-at91.c b/drivers/i2c/busses/i2c-at91.c
> index f23372669f770f..03a519d29616d7 100644
> --- a/drivers/i2c/busses/i2c-at91.c
> +++ b/drivers/i2c/busses/i2c-at91.c
> @@ -1118,8 +1118,6 @@ static int at91_twi_probe(struct platform_device *pdev)
>  
>  	rc = i2c_add_numbered_adapter(&dev->adapter);
>  	if (rc) {
> -		dev_err(dev->dev, "Adapter %s registration failed\n",
> -			dev->adapter.name);
>  		clk_disable_unprepare(dev->clk);
>  
>  		pm_runtime_disable(dev->dev);
