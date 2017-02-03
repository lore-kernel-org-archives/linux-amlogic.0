From: davem@davemloft.net (David Miller)
Date: Thu, 02 Feb 2017 22:00:09 -0500 (EST)
Subject: [PATCH] net: stmmac: don't set tx delay in RGMII_ID and
 RGMII_TXID mode
In-Reply-To: <ed022e67-2494-209e-9e51-b7a57c219d02@gmail.com>
References: <ed022e67-2494-209e-9e51-b7a57c219d02@gmail.com>
Message-ID: <20170202.220009.1028272302182207088.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Wed, 1 Feb 2017 20:19:25 +0100

> As documented in Documentation/devicetree/bindings/net/ethernet.txt,
> in RGMII_ID and RGMII_TXID mode the MAC should not add a tx delay.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to net-next, thank you.
