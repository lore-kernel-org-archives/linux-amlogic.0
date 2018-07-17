From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 17 Jul 2018 17:42:57 +0200
Subject: [PATCH RESEND 08/15] ASoC: meson: add axg tdm interface DT bindings
 documentation
In-Reply-To: <20180717154304.9973-1-jbrunet@baylibre.com>
References: <20180717154304.9973-1-jbrunet@baylibre.com>
Message-ID: <20180717154304.9973-9-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the DT bindings documentation for axg's TDM interfaces

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-tdm-iface.txt       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
new file mode 100644
index 000000000000..cabfb26a5f22
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
@@ -0,0 +1,22 @@
+* Amlogic Audio TDM Interfaces
+
+Required properties:
+- compatible: 'amlogic,axg-tdm-iface'
+- clocks: list of clock phandle, one for each entry clock-names.
+- clock-names: should contain the following:
+  * "sclk" : bit clock.
+  * "lrclk": sample clock
+  * "mclk" : master clock
+	     -> optional if the interface is in clock slave mode.
+- #sound-dai-cells: must be 0.
+
+Example of TDM_A on the A113 SoC:
+
+tdmif_a: audio-controller at 0 {
+	compatible = "amlogic,axg-tdm-iface";
+	#sound-dai-cells = <0>;
+	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
+		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
+	clock-names = "mclk", "sclk", "lrclk";
+};
-- 
2.14.4
