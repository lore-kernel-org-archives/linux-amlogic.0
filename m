From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 27 Sep 2017 23:39:53 +0200
Subject: [PATCH 2/4] ARM: dts: meson8b: extending ethernet controller
 description
In-Reply-To: <cover.1506507688.git.ingrassia@epigenesys.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
Message-ID: <aecccf76841a035f8dc5cc23dadfad66fbbac03e.1506507688.git.ingrassia@epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds ethernet controller pin description and extend its
attributes in the relative node.

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---

This patch corrects the meson8b-dwmac reg attributes updated by the previous
2/4 patch (450a483abe07f8d903c6cb74091592743975a8eb).
The second addresses range, taken from S805 (aka Meson8b) SoC manual,
was not correct.

Please, apply this patch and discard the previous
(450a483abe07f8d903c6cb74091592743975a8eb).

 arch/arm/boot/dts/meson8b.dtsi | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index bc278da7df0d..816bc9188f44 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -154,12 +154,48 @@
 			#gpio-cells = <2>;
 			gpio-ranges = <&pinctrl_cbus 0 0 130>;
 		};
+
+		eth_rgmii_pins: eth-rgmii {
+			mux {
+				groups = "eth_tx_clk",
+					 "eth_tx_en",
+					 "eth_txd1_0",
+					 "eth_txd1_1",
+					 "eth_txd0_0",
+					 "eth_txd0_1",
+					 "eth_rx_clk",
+					 "eth_rx_dv",
+					 "eth_rxd1",
+					 "eth_rxd0",
+					 "eth_mdio_en",
+					 "eth_mdc",
+					 "eth_ref_clk",
+					 "eth_txd2",
+					 "eth_txd3";
+				function = "ethernet";
+			};
+		};
 	};
 };
 
 &ethmac {
-	clocks = <&clkc CLKID_ETH>;
-	clock-names = "stmmaceth";
+	compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
+
+	interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 14 IRQ_TYPE_EDGE_RISING>;
+	interrupt-names = "macirq",
+			  "eth_lpi";
+
+	clock-names = "stmmaceth", "clkin0", "clkin1";
+	clocks = <&clkc CLKID_ETH>,
+		 <&clkc CLKID_FCLK_DIV2>,
+		 <&clkc CLKID_MPLL2>;
+
+	resets = <&reset RESET_ETHERNET>;
+	reset-names = "stmmaceth";
+
+	rx-fifo-depth=<4000>;
+	tx-fifo-depth=<2000>;
 };
 
 &hwrng {
-- 
2.14.1
