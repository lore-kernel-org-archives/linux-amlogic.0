From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Mon, 19 Mar 2018 12:43:45 +0100
Subject: [PATCH 3/3] arm64: dts: meson-gxl-s905x-libretech-cc: add cec-disable
In-Reply-To: <20180319114345.29837-1-hverkuil@xs4all.nl>
References: <20180319114345.29837-1-hverkuil@xs4all.nl>
Message-ID: <20180319114345.29837-4-hverkuil@xs4all.nl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Hans Verkuil <hans.verkuil@cisco.com>

This board has two CEC controllers: the DesignWare controller and
a meson-specific controller. Disable the DW controller since the
CEC line is hooked up to the meson controller.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 9671f1e3c74a..271bd486fd65 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -155,6 +155,7 @@
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	cec-disable;
 };
 
 &hdmi_tx_tmds_port {
-- 
2.15.1
