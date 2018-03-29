From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 30 Mar 2018 01:00:34 +0200
Subject: [PATCH net-next v1 1/2] dt-bindings: net: meson-dwmac: add support
 for the Meson8m2 SoC
In-Reply-To: <20180329230035.20958-1-martin.blumenstingl@googlemail.com>
References: <20180329230035.20958-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180329230035.20958-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Meson8m2 SoC uses a similar (potentially even identical) register
layout for the dwmac glue as Meson8b and GXBB. Unfortunately there is no
documentation available.
Testing shows that both, RMII and RGMII PHYs are working if they are
configured as on Meson8b. Add a new compatible string to the
documentation so differences (if there are any) between Meson8m2 and the
other SoCs can be taken care of within the driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/net/meson-dwmac.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/meson-dwmac.txt b/Documentation/devicetree/bindings/net/meson-dwmac.txt
index 354dd9896bb5..61cada22ae6c 100644
--- a/Documentation/devicetree/bindings/net/meson-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/meson-dwmac.txt
@@ -9,6 +9,7 @@ Required properties on all platforms:
 - compatible:	Depending on the platform this should be one of:
 			- "amlogic,meson6-dwmac"
 			- "amlogic,meson8b-dwmac"
+			- "amlogic,meson8m2-dwmac"
 			- "amlogic,meson-gxbb-dwmac"
 		Additionally "snps,dwmac" and any applicable more
 		detailed version number described in net/stmmac.txt
@@ -19,13 +20,13 @@ Required properties on all platforms:
 	configuration (for example the PRG_ETHERNET register range
 	on Meson8b and newer)
 
-Required properties on Meson8b and newer:
+Required properties on Meson8b, Meson8m2, GXBB and newer:
 - clock-names:	Should contain the following:
 		- "stmmaceth" - see stmmac.txt
 		- "clkin0" - first parent clock of the internal mux
 		- "clkin1" - second parent clock of the internal mux
 
-Optional properties on Meson8b and newer:
+Optional properties on Meson8b, Meson8m2, GXBB and newer:
 - amlogic,tx-delay-ns:	The internal RGMII TX clock delay (provided
 			by this driver) in nanoseconds. Allowed values
 			are: 0ns, 2ns, 4ns, 6ns.
-- 
2.16.3
