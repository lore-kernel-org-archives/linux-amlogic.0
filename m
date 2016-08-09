From: ray.jui@broadcom.com (Ray Jui)
Date: Tue, 9 Aug 2016 09:15:41 -0700
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
Message-ID: <1fc84a39-733e-5867-1f74-26a5076b18fc@broadcom.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Wolfram,

On 8/9/2016 4:36 AM, Wolfram Sang wrote:
> The core will do this for us now.
>
> Signed-off-by: Wolfram Sang <wsa-dev@sang-engineering.com>

[...]

> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 19c843828fe2ca..8e3477f9297eda 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -488,13 +488,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
>  	adap->dev.parent = &pdev->dev;
>  	adap->dev.of_node = pdev->dev.of_node;
>
> -	ret = i2c_add_adapter(adap);
> -	if (ret) {
> -		dev_err(iproc_i2c->device, "failed to add adapter\n");
> -		return ret;
> -	}
> -
> -	return 0;
> +	return i2c_add_adapter(adap);
>  }
>
>  static int bcm_iproc_i2c_remove(struct platform_device *pdev)
> diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
> index ac9f47679c3a4b..a5c9098507896b 100644
> --- a/drivers/i2c/busses/i2c-bcm-kona.c
> +++ b/drivers/i2c/busses/i2c-bcm-kona.c
> @@ -858,10 +858,8 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
>  	adap->dev.of_node = pdev->dev.of_node;
>
>  	rc = i2c_add_adapter(adap);
> -	if (rc) {
> -		dev_err(dev->device, "failed to add adapter\n");
> +	if (rc)
>  		return rc;
> -	}
>
>  	dev_info(dev->device, "device registered successfully\n");
>

For both i2c-bcm-iproc.c and i2c-bcm-kona.c:

Acked-by: Ray Jui <ray.jui@broadcom.com>

Thanks,

Ray
