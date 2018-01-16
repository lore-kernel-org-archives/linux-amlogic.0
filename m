From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Tue, 16 Jan 2018 01:34:12 +0100
Subject: [PATCH 1/2] ARM: dts: meson8b: extend ethernet controller description
Message-ID: <20180116003412.GA10581@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Extend ethernet controller description adding pin multiplexing and
setting the needed attributes in ethmac node.
As reported in S805 SoC manual, the MAC clock source is MPLL2 only.

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 7cd03ed3742e..3c66d9bdc3a8 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -185,6 +185,27 @@
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
 
@@ -203,8 +224,18 @@
 };
 
 &ethmac {
-	clocks = <&clkc CLKID_ETH>;
-	clock-names = "stmmaceth";
+	compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
+
+	reg = <0xc9410000 0x10000
+	       0xc1108140 0x4>;
+
+	clocks = <&clkc CLKID_ETH>,
+		 <&clkc CLKID_MPLL2>,
+		 <&clkc CLKID_MPLL2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1";
+
+	resets = <&reset RESET_ETHERNET>;
+	reset-names = "stmmaceth";
 };
 
 &gpio_intc {
-- 
2.15.1
