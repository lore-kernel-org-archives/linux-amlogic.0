From: f.fainelli@gmail.com (Florian Fainelli)
Date: Sat, 26 Nov 2016 21:55:37 -0800
Subject: [PATCH 2/2] net: phy: realtek: fix enabling of the TX-delay for
 RTL8211F
In-Reply-To: <20161125131201.19994-3-martin.blumenstingl@googlemail.com>
References: <20161125131201.19994-1-martin.blumenstingl@googlemail.com>
 <20161125131201.19994-3-martin.blumenstingl@googlemail.com>
Message-ID: <bcc66892-4f2a-dab5-e820-29e2fc73683e@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 11/25/2016 05:12 AM, Martin Blumenstingl wrote:
> The old logic always enabled the TX-delay when the phy-mode was set to
> PHY_INTERFACE_MODE_RGMII. There are dedicated phy-modes which tell the
> PHY driver to enable the RX and/or TX delays:
> - PHY_INTERFACE_MODE_RGMII should disable the RX and TX delay in the
>   PHY (if required, the MAC should add the delays in this case)
> - PHY_INTERFACE_MODE_RGMII_ID should enable RX and TX delay in the PHY
> - PHY_INTERFACE_MODE_RGMII_TXID should enable the TX delay in the PHY
> - PHY_INTERFACE_MODE_RGMII_RXID should enable the RX delay in the PHY
>   (currently not supported by RTL8211F)
> 
> With this patch we enable the TX delay for PHY_INTERFACE_MODE_RGMII_ID
> and PHY_INTERFACE_MODE_RGMII_TXID.
> Additionally we now explicity disable the TX-delay, which seems to be
> enabled automatically after a hard-reset of the PHY (by triggering it's
> reset pin) to get a consistent state (as defined by the phy-mode).
> 
> This fixes a compatibility problem with some SoCs where the TX-delay was
> also added by the MAC. With the TX-delay being applied twice the TX
> clock was off and TX traffic was broken or very slow (<10Mbit/s) on
> 1000Mbit/s links.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
