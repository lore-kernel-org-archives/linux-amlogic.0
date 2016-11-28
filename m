From: davem@davemloft.net (David Miller)
Date: Mon, 28 Nov 2016 12:07:13 -0500 (EST)
Subject: [PATCH 0/2] net: phy: realtek: fix RTL8211F TX-delay handling
In-Reply-To: <20161125131201.19994-1-martin.blumenstingl@googlemail.com>
References: <20161125131201.19994-1-martin.blumenstingl@googlemail.com>
Message-ID: <20161128.120713.220612302416318577.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Nov 2016 14:11:59 +0100

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

Series applied, thanks Martin.
