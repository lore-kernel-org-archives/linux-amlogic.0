From: f.fainelli@gmail.com (Florian Fainelli)
Date: Sat, 26 Nov 2016 21:53:47 -0800
Subject: [PATCH 1/2] Documentation: devicetree: clarify usage of the RGMII
 phy-modes
In-Reply-To: <20161125131201.19994-2-martin.blumenstingl@googlemail.com>
References: <20161125131201.19994-1-martin.blumenstingl@googlemail.com>
 <20161125131201.19994-2-martin.blumenstingl@googlemail.com>
Message-ID: <61b8fa1b-e947-16ca-fb97-02a1125042aa@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 11/25/2016 05:12 AM, Martin Blumenstingl wrote:
> RGMII requires special RX and/or TX delays depending on the actual
> hardware circuit/wiring. These delays can be added by the MAC, the PHY
> or the designer of the circuit (the latter means that no delay has to
> be added by PHY or MAC).
> There are 4 RGMII phy-modes used describe where a delay should be
> applied:
> - rgmii: the RX and TX delays are either added by the MAC (where the
>   exact delay is typically configurable, and can be turned off when no
>   extra delay is needed) or not needed at all (because the hardware
>   wiring adds the delay already). The PHY should neither add the RX nor
>   TX delay in this case.
> - rgmii-rxid: configures the PHY to enable the RX delay. The MAC should
>   not add the RX delay in this case.
> - rgmii-txid: configures the PHY to enable the TX delay. The MAC should
>   not add the TX delay in this case.
> - rgmii-id: combines rgmii-rxid and rgmii-txid and thus configures the
>   PHY to enable the RX and TX delays. The MAC should neither add the RX
>   nor TX delay in this case.
> 
> Document these cases in the ethernet.txt documentation to make it clear
> when to use each mode.
> If applied incorrectly one might end up with MAC and PHY both enabling
> for example the TX delay, which breaks ethernet TX traffic on 1000Mbit/s
> links.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
