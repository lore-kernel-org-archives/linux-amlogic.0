From: f.fainelli@gmail.com (Florian Fainelli)
Date: Sun, 12 Nov 2017 10:29:24 -0800
Subject: [PATCH] net: phy: realtek: fix RTL8211F interrupt mode
In-Reply-To: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
References: <66991733-9d1a-dbd2-9857-bba1ffca1cf8@gmail.com>
Message-ID: <3a460dee-e714-e430-ce34-44c55d8a7490@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Heiner,

On 11/12/2017 07:16 AM, Heiner Kallweit wrote:
> After commit b94d22d94ad22 "ARM64: dts: meson-gx: add external PHY
> interrupt on some platforms" ethernet stopped working on my Odroid-C2
> which has a RTL8211F phy.
> 
> It turned out that no interrupts were triggered. Further analysis
> showed the register INER can't be altered on page 0.
> Because register INSR needs to be accessed via page 0xa43 I assumed
> that register INER needs to be accessed via some page too.
> Some brute force check resulted in page 0xa42 being the right one.
> 
> With this patch the phy is working properly in interrupt mode.

What would be the appropriate Fixes: tag for that patch?

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/net/phy/realtek.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
> index d4670ecdb..eda0a6e86 100644
> --- a/drivers/net/phy/realtek.c
> +++ b/drivers/net/phy/realtek.c
> @@ -115,11 +115,13 @@ static int rtl8211f_config_intr(struct phy_device *phydev)
>  {
>  	int err;
>  
> +	phy_write(phydev, RTL821x_PAGE_SELECT, 0xa42);
>  	if (phydev->interrupts == PHY_INTERRUPT_ENABLED)
>  		err = phy_write(phydev, RTL821x_INER,
>  				RTL8211F_INER_LINK_STATUS);
>  	else
>  		err = phy_write(phydev, RTL821x_INER, 0);
> +	phy_write(phydev, RTL821x_PAGE_SELECT, 0);
>  
>  	return err;
>  }
> 

-- 
Florian
