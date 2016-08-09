From: thierry.reding@gmail.com (Thierry Reding)
Date: Tue, 9 Aug 2016 14:58:46 +0200
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
Message-ID: <20160809125846.GA17535@ulmo.ba.sec>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Aug 09, 2016 at 01:36:17PM +0200, Wolfram Sang wrote:
[...]
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index b126dbaa47e370..d9979da11485ae 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -932,10 +932,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	i2c_dev->adapter.dev.of_node = pdev->dev.of_node;
>  
>  	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to add I2C adapter\n");
> +	if (ret)
>  		goto disable_div_clk;
> -	}
>  
>  	return 0;
>  

Acked-by: Thierry Reding <treding@nvidia.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20160809/e1459211/attachment.sig>
