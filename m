From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Fri, 23 Mar 2018 13:59:15 +0100
Subject: [PATCHv2 3/3] arm64: dts: meson-gx.dtsi: add cec-disable
In-Reply-To: <20180323125915.13986-1-hverkuil@xs4all.nl>
References: <20180323125915.13986-1-hverkuil@xs4all.nl>
Message-ID: <20180323125915.13986-4-hverkuil@xs4all.nl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Hans Verkuil <hans.verkuil@cisco.com>

The meson-gx boards have two CEC controllers: the DesignWare controller
and a meson-specific controller. Disable the DW controller since the
CEC line is hooked up to the meson controller.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 4ee2e7951482..4e2567012335 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -544,6 +544,7 @@
 			interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			cec-disable;
 			status = "disabled";
 
 			/* VPU VENC Input */
-- 
2.15.1
