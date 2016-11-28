From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 28 Nov 2016 14:25:46 +0100
Subject: [PATCH 0/2] net: phy: realtek: fix RTL8211F TX-delay handling
In-Reply-To: <20161125131201.19994-1-martin.blumenstingl@googlemail.com>
References: <20161125131201.19994-1-martin.blumenstingl@googlemail.com>
Message-ID: <4678b66f-8281-fe94-b249-73268e48f9af@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 11/25/2016 02:11 PM, Martin Blumenstingl wrote:
> The RTL8211F PHY driver currently enables the TX-delay only when the
> phy-mode is PHY_INTERFACE_MODE_RGMII. This is incorrect, because there
> are three RGMII variations of the phy-mode which explicitly request the
> PHY to enable the RX and/or TX delay, while PHY_INTERFACE_MODE_RGMII
> specifies that the PHY should disable the RX and/or TX delays.
> 
> Additionally to the RTL8211F PHY driver change this contains a small
> update to the phy-mode documentation to clarify the purpose of the
> RGMII phy-modes.
> While this may not be perfect yet it's at least a start. Please feel
> free to drop this patch from this series and send an improved version
> yourself.
> 
> These patches are the results of recent discussions, see [0]
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2016-November/001688.html
> 
> Martin Blumenstingl (2):
>   Documentation: devicetree: clarify usage of the RGMII phy-modes
>   net: phy: realtek: fix enabling of the TX-delay for RTL8211F
> 
>  Documentation/devicetree/bindings/net/ethernet.txt | 24 ++++++++++++++++++----
>  drivers/net/phy/realtek.c                          | 20 ++++++++++--------
>  2 files changed, 32 insertions(+), 12 deletions(-)
> 

Along the "stmmac: dwmac-meson8b: configurable RGMII TX delay" v2 patchset,
fixes the link issue on my Nexbox A1 board and does not break my Amlogic P230 board.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
