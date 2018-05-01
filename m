From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed,  2 May 2018 00:00:45 +0200
Subject: [PATCH 1/1] ARM: dts: meson8b: RGMII doesn't use the eth_txd1_1 and
 eth_txd0_1 pins
In-Reply-To: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
References: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180501220045.2004-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The pin groups eth_txd0_0 and eth_txd0_1 are both connected to the
Ethernet controller's TXD0 data line. The only difference is that
eth_txd0_0 is routed to GPIOH_6 while eth_txd0_1 is routed to DIF_2_P.
eth_txd1_0 and eth_txd1_1 are similar: eth_txd1_0 is routed to GPIOH_5
and eth_txd1_1 is routed to DIF_2_N.

The schematics of the Odroid-C1+ show that it uses GPIOH_5 and GPIOH_6
for the TXD0 and TXD1 data lines. Thus we can drop eth_txd0_1 and
eth_txd1_1 (which are routed to DIF_2_P and DIF_2_N) from the RGMII
group.

Fixes: b96446541d8390 ("ARM: dts: meson8b: extend ethernet controller description")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Emiliano Ingrassia <ingrassia@epigenesys.com>
Cc: Linus L?ssing <linus.luessing@c0d3.blue>
---
 arch/arm/boot/dts/meson8b.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 6cfd7e225cee..5deff6819f7d 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -200,9 +200,7 @@
 				groups = "eth_tx_clk",
 					 "eth_tx_en",
 					 "eth_txd1_0",
-					 "eth_txd1_1",
 					 "eth_txd0_0",
-					 "eth_txd0_1",
 					 "eth_rx_clk",
 					 "eth_rx_dv",
 					 "eth_rxd1",
-- 
2.17.0
