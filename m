From: vz@mleia.com (Vladimir Zapolskiy)
Date: Tue, 9 Aug 2016 19:36:55 +0300
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
Message-ID: <a8dd593f-a38e-9661-22f3-ca5e5dfe53c4@mleia.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 09.08.2016 14:36, Wolfram Sang wrote:
> The core will do this for us now.
> 
> Signed-off-by: Wolfram Sang <wsa-dev@sang-engineering.com>
> ---

For 

>  drivers/i2c/busses/i2c-pnx.c            | 4 +---

[snip]

> diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
> index 7ea67aa46fb730..fd5f9d2bf6d94e 100644
> --- a/drivers/i2c/busses/i2c-pnx.c
> +++ b/drivers/i2c/busses/i2c-pnx.c
> @@ -714,10 +714,8 @@ static int i2c_pnx_probe(struct platform_device *pdev)
>  
>  	/* Register this adapter with the I2C subsystem */
>  	ret = i2c_add_numbered_adapter(&alg_data->adapter);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "I2C: Failed to add bus\n");
> +	if (ret < 0)
>  		goto out_clock;
> -	}
>  
>  	dev_dbg(&pdev->dev, "%s: Master at %#8x, irq %d.\n",
>  		alg_data->adapter.name, res->start, alg_data->irq);

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
With best wishes,
Vladimir
