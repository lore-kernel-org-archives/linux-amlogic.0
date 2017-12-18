From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 18 Dec 2017 12:59:27 +0100
Subject: [PATCH u-boot] net: phy: meson-gxl: detect LPA corruption
In-Reply-To: <1513091035-32503-1-git-send-email-narmstrong@baylibre.com>
References: <1513091035-32503-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <ca582095-0680-730d-b837-66086d944c95@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 12/12/2017 16:03, Neil Armstrong wrote:
> From: Jerome Brunet <jbrunet@baylibre.com>
> 
> This patch is ported from the Linux patch posted at [1] and applied to
> net tree as commit f1e2400a80ff.
> 
> The purpose of this change is to fix the incorrect detection of the link
> partner (LP) advertised capabilities which sometimes happens with this PHY
> (roughly 1 time in a dozen)
> 
> This issue may cause the link to be negotiated at 10Mbps/Full or
> 10Mbps/Half when 100MBps/Full is actually possible. In some case, the link
> is even completely broken and no communication is possible.
> 
> To detect the corruption, we must look for a magic undocumented bit in the
> WOL bank (hint given by the SoC vendor kernel) but this is not enough to
> cover all cases. We also have to look at the LPA ack. If the LP supports
> Aneg but did not ack our base code when aneg is completed, we assume
> something went wrong.
> 
> The detection of a corrupted LPA triggers a restart of the aneg process.
> This solves the problem but may take up to 6 retries to complete.
> 
> [1] https://lkml.kernel.org/r/20171208110811.30789-1-jbrunet at baylibre.com
> 
> Fixes: 8995a96d1d67 ("net: phy: Add Amlogic Meson GXL Internal PHY support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> 
> This patch has been tested on LibreTech-CC and adapted to U-Boot PHY calls.
> 
> Comments from Jerome from the original patch :
> ""
> I suppose this patch probably seems a bit hacky, especially the part
> about the link partner acknowledge. I'm trying to figure out if the
> value in MII_LPA makes sense but I don't have such a deep knowledge
> of the ethernet spec.
> 
> To me, it does not makes sense for the LP to support ANEG (Bit 1 in
> MII_EXPENSION), the aneg to have successfully complete and, at the
> same time, LP does not ACK our base code word, which we should have
> sent during this aneg.
> 
> If you think this may have unintended consequences or if you have
> an idea to do this differently, feel free to let me know.
> 
> This fix has been tested on the libretech-cc and khadas VIM
> ""
> 
>  drivers/net/phy/meson-gxl.c | 88 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index ccf70c9..5f4ecb1 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -10,8 +10,94 @@
>  #include <config.h>
>  #include <common.h>
>  #include <linux/bitops.h>
> +#include <dm.h>
>  #include <phy.h>
>  
> +/* This function is provided to cope with the possible failures of this phy
> + * during aneg process. When aneg fails, the PHY reports that aneg is done
> + * but the value found in MII_LPA is wrong:
> + *  - Early failures: MII_LPA is just 0x0001. if MII_EXPANSION reports that
> + *    the link partner (LP) supports aneg but the LP never acked our base
> + *    code word, it is likely that we never sent it to begin with.
> + *  - Late failures: MII_LPA is filled with a value which seems to make sense
> + *    but it actually is not what the LP is advertising. It seems that we
> + *    can detect this using a magic bit in the WOL bank (reg 12 - bit 12).
> + *    If this particular bit is not set when aneg is reported being done,
> + *    it means MII_LPA is likely to be wrong.
> + *
> + * In both case, forcing a restart of the aneg process solve the problem.
> + * When this failure happens, the first retry is usually successful but,
> + * in some cases, it may take up to 6 retries to get a decent result
> + */
> +int meson_gxl_startup(struct phy_device *phydev)
> +{
> +	unsigned int retries = 10;
> +	int ret, wol, lpa, exp;
> +
> +restart_aneg:
> +	ret = genphy_update_link(phydev);
> +	if (ret)
> +		return ret;
> +
> +	if (phydev->autoneg == AUTONEG_ENABLE) {
> +		/* Need to access WOL bank, make sure the access is open */
> +		ret = phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x0000);
> +		if (ret)
> +			return ret;
> +		ret = phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x0400);
> +		if (ret)
> +			return ret;
> +		ret = phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x0000);
> +		if (ret)
> +			return ret;
> +		ret = phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x0400);
> +		if (ret)
> +			return ret;
> +
> +		/* Request LPI_STATUS WOL register */
> +		ret = phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x8D80);
> +		if (ret)
> +			return ret;
> +
> +		/* Read LPI_STATUS value */
> +		wol = phy_read(phydev, MDIO_DEVAD_NONE, 0x15);
> +		if (wol < 0)
> +			return wol;
> +
> +		lpa = phy_read(phydev, MDIO_DEVAD_NONE, MII_LPA);
> +		if (lpa < 0)
> +			return lpa;
> +
> +		exp = phy_read(phydev, MDIO_DEVAD_NONE, MII_EXPANSION);
> +		if (exp < 0)
> +			return exp;
> +
> +		if (!(wol & BIT(12)) ||
> +			((exp & EXPANSION_NWAY) && !(lpa & LPA_LPACK))) {
> +			
> +			/* Looks like aneg failed after all */
> +			if (!retries) {
> +				printf("%s LPA corruption max attempts\n",
> +					phydev->dev->name);
> +				return -ETIMEDOUT;
> +			}
> +
> +			printf("%s LPA corruption - aneg restart\n",
> +				phydev->dev->name);
> +
> +			ret = genphy_restart_aneg(phydev);
> +			if (ret)
> +				return ret;
> +
> +			--retries;
> +
> +			goto restart_aneg;
> +		}
> +	}
> +
> +	return genphy_parse_link(phydev);
> +}
> +
>  static int meson_gxl_phy_config(struct phy_device *phydev)
>  {
>  	/* Enable Analog and DSP register Bank access by */
> @@ -45,7 +131,7 @@ static struct phy_driver meson_gxl_phy_driver = {
>  	.mask = 0xfffffff0,
>  	.features = PHY_BASIC_FEATURES,
>  	.config = &meson_gxl_phy_config,
> -	.startup = &genphy_startup,
> +	.startup = &meson_gxl_startup,
>  	.shutdown = &genphy_shutdown,
>  };
>  
> 

Hi Tom,

This patch made the LibreTech-CC board survive 14638 reboots while
triggering 593 LPA corruption and successfully getting a DHCP answer
in each case.

Neil
