From: kishon@ti.com (Kishon Vijay Abraham I)
Date: Tue, 15 Nov 2016 18:24:46 +0530
Subject: [PATCH 2/3] phy: meson8b-usb2: request a shared reset line
In-Reply-To: <20161112131305.26088-3-martin.blumenstingl@googlemail.com>
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-3-martin.blumenstingl@googlemail.com>
Message-ID: <582B0596.4060903@ti.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On Saturday 12 November 2016 06:43 PM, Martin Blumenstingl wrote:
> Both PHYs are sharing one reset line. With recent improvements to the
> reset framework we can now also use reset_control_reset with shared
> resets.
> This allows us to drop some workarounds where the reset was only
> specified for one PHY but not the other, to make sure that the reset it
> only executed once (as the reset framework was not able to use
> reset_control_reset with shared reset lines).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

merged $patch to -next.

Thanks
Kishon
> ---
>  drivers/phy/phy-meson8b-usb2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/phy-meson8b-usb2.c b/drivers/phy/phy-meson8b-usb2.c
> index 73bf632..f1ee96a 100644
> --- a/drivers/phy/phy-meson8b-usb2.c
> +++ b/drivers/phy/phy-meson8b-usb2.c
> @@ -237,8 +237,7 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->clk_usb))
>  		return PTR_ERR(priv->clk_usb);
>  
> -	priv->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> -								NULL);
> +	priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
>  	if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
>  		return PTR_ERR(priv->reset);
>  
> 
