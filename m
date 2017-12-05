From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 05 Dec 2017 19:47:14 +0100
Subject: [PATCH net-next] net: phy: meson-gxl: cleanup by defining the
 control registers
In-Reply-To: <20171205180142.GS12805@lunn.ch>
References: <20171205093334.8261-1-jbrunet@baylibre.com>
 <20171205180142.GS12805@lunn.ch>
Message-ID: <1512499634.21892.6.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2017-12-05 at 19:01 +0100, Andrew Lunn wrote:
> On Tue, Dec 05, 2017 at 10:33:34AM +0100, Jerome Brunet wrote:
> > From: Neil Armstrong <narmstrong@baylibre.com>
> > 
> > Define registers and bits in meson-gxl PHY driver to make a bit
> > more human friendly. No functional change
> 
> 
> >  static int meson_gxl_config_init(struct phy_device *phydev)
> >  {
> > -	/* Enable Analog and DSP register Bank access by */
> > -	phy_write(phydev, 0x14, 0x0000);
> > -	phy_write(phydev, 0x14, 0x0400);
> > -	phy_write(phydev, 0x14, 0x0000);
> > -	phy_write(phydev, 0x14, 0x0400);
> > +	int ret;
> >  
> > -	/* Write Analog register 23 */
> > -	phy_write(phydev, 0x17, 0x8E0D);
> > -	phy_write(phydev, 0x14, 0x4417);
> > +	/* Write PLL Configuration 1 */
> > +	ret = meson_gxl_write_reg(phydev, BANK_ANALOG_DSP, A6_CONFIG_REG,
> > +				  A6_CONFIG_PLLMULX4ICH |
> > +				  FIELD_PREP(A6_CONFIG_PLLBUFITRIM, 7) |
> > +				  A6_CONFIG_PLLRSTVCOPD |
> > +				  A6_CONFIG_PLLCPOFF |
> > +				  A6_CONFIG_PLL_SRC);
> > +	if (ret)
> > +		return ret;
> 
> This does not look like "No functional Change".
> 
> Please can you break this up. First make use of #defines.
> That should be a clear "No functional Change".
> 
> Then a second patch adding a helper for banked registers?

Sure, It would be better.
I also noticed that the write function was inlined which is probably not good.

> 
>      Thanks
> 	Andrew
