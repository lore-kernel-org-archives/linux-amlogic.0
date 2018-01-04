From: davem@davemloft.net (David Miller)
Date: Thu, 04 Jan 2018 14:02:26 -0500 (EST)
Subject: [PATCH net] net: stmmac: enable EEE in MII, GMII or RGMII only
In-Reply-To: <20180103154629.1433-1-jbrunet@baylibre.com>
References: <20180103154629.1433-1-jbrunet@baylibre.com>
Message-ID: <20180104.140226.949194351555593980.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed,  3 Jan 2018 16:46:29 +0100

> Note in the databook - Section 4.4 - EEE :
> " The EEE feature is not supported when the MAC is configured to use the
> TBI, RTBI, SMII, RMII or SGMII single PHY interface. Even if the MAC
> supports multiple PHY interfaces, you should activate the EEE mode only
> when the MAC is operating with GMII, MII, or RGMII interface."
> 
> Applying this restriction solves a stability issue observed on Amlogic
> gxl platforms operating with RMII interface and the internal PHY.
> 
> Fixes: 83bf79b6bb64 ("stmmac: disable at run-time the EEE if not supported")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Tested-by: Arnaud Patard <arnaud.patard@rtp-net.org>

Applied and queued up for -stable, thanks.
