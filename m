From: arnaud.patard@rtp-net.org (Arnaud Patard (Rtp))
Date: Thu, 14 Dec 2017 13:41:11 +0100
Subject: [RFC PATCH] net: stmmac: enable EEE in MII, GMII or RGMII only
In-Reply-To: <20171205102809.4347-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Tue, 5 Dec 2017 11:28:09 +0100")
References: <20171205102809.4347-1-jbrunet@baylibre.com>
Message-ID: <87ind9fpnc.fsf@lechat.rtp-net.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Note in the databook - Section 4.4 - EEE :
> " The EEE feature is not supported when the MAC is configured to use the
> TBI, RTBI, SMII, RMII or SGMII single PHY interface. Even if the MAC
> supports multiple PHY interfaces, you should activate the EEE mode only
> when the MAC is operating with GMII, MII, or RGMII interface."
>
> Applying this restriction solves a stability issue observed on Amlogic
> gxl platforms operating with RMII interface and the internal PHY.

I was having the issue on my libretech AML-S905X-CC / potato board. With
this patch, I've not been able to trigger it at all. Without it and with
my test case, I was able to trigger the hang several times reliably.

Any hope to see this merged ?

>
> Fixes: 83bf79b6bb64 ("stmmac: disable at run-time the EEE if not supported")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Tested-by: Arnaud Patard <arnaud.patard@rtp-net.org>
