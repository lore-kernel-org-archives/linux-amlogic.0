Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0DEC4332B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:23:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 353FF2080C
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b5pW2sQs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0FQ0JYNo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 353FF2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnbHHvV9XrMgEI4IH4+AVLcFJAeThOatePbi6hnPWMY=; b=b5pW2sQsfehhEV
	p+MjqUGshyqT/PK4OMkG+eQWs7hFxuPG5fDi2Yk2I7VCabnnBJCTqpnBBVOnaw8LLmOVVp5mhQ2/r
	ZybRfPYdIsAvIK4hm/dSnetTfOhBIywUeTMkrofXdsTAvorPX248Q1W7o8hxitC+Pl9dHpVj2vsSi
	RIQIb4b8Q/FOYmAY2dGsL5keOYjRWpbptVCzyeZsLNNBHcFRKmV6sz5BFXKKF47DohAaUEmE3a74/
	AMK8xIB/Lca20Zir8u4LDQRVkwiZjI0qUMj+mkBDsGNCJeoK1NdZ8jhsWNKMPWZsCf4X0IrcCZ79u
	0eOQdcQJVz7l31j/8hfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGgiZ-0004TY-6T; Tue, 24 Mar 2020 10:23:31 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGgfz-0001yz-Ee
 for linux-amlogic@lists.infradead.org; Tue, 24 Mar 2020 10:20:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id j17so17280764wru.13
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2020 03:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUZC0y6m91wh8P6MloCluJN4MyzlpiujN56N7qyR1cU=;
 b=0FQ0JYNonm/ag5zASwww42AGRmy29MPr1EIDEnkdJCW8oANQ1A+HfjHMcH+Gh+7hBZ
 iQNGfhGZXzNsAwgS/pTdIKpWXrp7lwdb1aaOsz8sYm6HDK4dSFtjmmFXaiLW6su6XQ2X
 WFACp/E9Sqf/dI3rFOyKzyGWVUTZ/5IVti4OzZt5IpAhC0jycqmSkskmmmycRI62p2Yp
 rG5rMiu5Ys72COSlWYNnowX1kBLOOmJefR7e8zQoT87PwfkxSPULj669O+cR+KBSz/Uc
 SsJszUhpaT5BcxMv4uM0/6O/JA9g/ijrhnaUZ1eo1iMl0EqcOlyJFuUp76rImeHte4f3
 PtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUZC0y6m91wh8P6MloCluJN4MyzlpiujN56N7qyR1cU=;
 b=ab3Q0EjC1MBYi9M4IHQDq0bCksvv22/kfsHYXA9/QSW3wiLkR39uOgXIRieSpfkBbY
 OxAQ8YxFigpCgfQhCsdwjHO+S3ruZynzk41qQK2Jm7Ls9qkfK7IWoN3yFkC6lsSMkp0u
 K2Kx5T/n9qTBl8NETGCkRzgjADJywFYE9CMhSB8HB0rtjCN8hjKeaEQqe+u9hVrqGYWs
 hr1Tgy5d8cPspZaNVuB83HLCtOtPLdmO2T1k3q/5PlEXk3f+8o81C9D/RqlBRf4bn1dG
 n6OIYR0FF5GcfZMzu6Rq/BPJyopq4XT6j4OtE3ei0wXJDflT1G2q+8rLk8sHb1fINNTu
 AH9g==
X-Gm-Message-State: ANhLgQ3ik5X/LDzevrr1eL0+YfipXeogx7k6UAIHtid38cyb9fuY5165
 j6z8ZtDSfWmTdGE6of0lK9xYhQ==
X-Google-Smtp-Source: ADFU+vuiIbLUejePRIv3X2iK+eVyZu3p6TH7RADbrPHxVPS0D1EZcldi8PEsppiY9lcbA0/PTKj0mQ==
X-Received: by 2002:a5d:4a10:: with SMTP id m16mr34229352wrq.333.1585045249895; 
 Tue, 24 Mar 2020 03:20:49 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 03:20:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH 09/13] arm64: dts: amlogic: use the new USB control driver for
 GXL and GXM
Date: Tue, 24 Mar 2020 11:20:26 +0100
Message-Id: <20200324102030.31000-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_032051_770459_CEC9FB24 
X-CRM114-Status: GOOD (  12.03  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Add the correcly architectured USB Glue node and adapt all the Amlogic
GXL and GXM board to the new organization.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    |  2 +-
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  2 +-
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  |  3 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  3 +-
 .../amlogic/meson-gxl-s905d-phicomm-n1.dts    |  4 ++
 .../boot/dts/amlogic/meson-gxl-s905w-p281.dts |  4 ++
 .../dts/amlogic/meson-gxl-s905w-tx3-mini.dts  |  4 ++
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |  4 ++
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  |  7 ++-
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  3 +-
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |  7 ++-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 45 ++++++++++---------
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |  3 +-
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  |  3 +-
 .../boot/dts/amlogic/meson-gxm-vega-s96.dts   |  4 ++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    |  7 ++-
 16 files changed, 68 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 248b018c83d5..ec195e88b777 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -360,7 +360,7 @@
 	status = "okay";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 12d5e333e5f2..52525fcc5944 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -223,6 +223,6 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index 4d5949496596..2cfea3094f6c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -243,6 +243,7 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index a1119cfb0280..867e30f1d62b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -216,6 +216,7 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
index b5667f1fb2c8..9ef210f17b4a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
@@ -29,3 +29,7 @@
 &cvbs_vdac_port {
 	status = "disabled";
 };
+
+&usb {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts
index 6509c4950950..ecc9df7ca023 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts
@@ -20,3 +20,7 @@
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 };
+
+&usb {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts
index dd729ac2300d..6705c2082a78 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts
@@ -24,3 +24,7 @@
 &ir {
 	linux,rc-map-name = "rc-tanix-tx3mini";
 };
+
+&usb {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 440bc23c7342..8bcdffdf55d0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -207,3 +207,7 @@
 	pinctrl-0 = <&uart_ao_b_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	dr_mode = "peripheral";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index e8348b2728db..bd62d06d072f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -272,14 +272,13 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
-};
+	dr_mode = "host";
 
-&usb2_phy0 {
 	/*
 	 * even though the schematics don't show it:
 	 * HDMI_5V is also used as supply for the USB VBUS.
 	 */
-	phy-supply = <&hdmi_5v>;
+	vbus-supply = <&hdmi_5v>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index 62dd87821ce5..f1acca5c4434 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -218,6 +218,7 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 43eb7d149e36..b998f935e18d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -188,13 +188,12 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
-};
+	dr_mode = "host";
 
-&usb2_phy0 {
 	/*
 	 * HDMI_5V is also used as supply for the USB VBUS.
 	 */
-	phy-supply = <&hdmi_5v>;
+	vbus-supply = <&hdmi_5v>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 259d86399390..95b301a7c725 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -14,26 +14,43 @@
 	compatible = "amlogic,meson-gxl";
 
 	soc {
-		usb0: usb@c9000000 {
-			status = "disabled";
-			compatible = "amlogic,meson-gxl-dwc3";
+		usb: usb@d0078080 {
+			compatible = "amlogic,meson-gxl-usb-ctrl";
+			reg = <0x0 0xd0078080 0x0 0x20>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
 
-			clocks = <&clkc CLKID_USB>;
-			clock-names = "usb_general";
+			clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1_DDR_BRIDGE>;
+			clock-names = "usb_ctrl", "ddr";
 			resets = <&reset RESET_USB_OTG>;
-			reset-names = "usb_otg";
 
-			dwc3: dwc3@c9000000 {
+			dr_mode = "otg";
+
+			phys = <&usb2_phy0>, <&usb2_phy1>;
+			phy-names = "usb2-phy0", "usb2-phy1";
+
+			dwc2: usb@c9100000 {
+				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
+				reg = <0x0 0xc9100000 0x0 0x40000>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_USB1>;
+				clock-names = "otg";
+				phys = <&usb2_phy1>;
+				dr_mode = "peripheral";
+				g-rx-fifo-size = <192>;
+				g-np-tx-fifo-size = <128>;
+				g-tx-fifo-size = <128 128 16 16 16>;
+			};
+
+			dwc3: usb@c9000000 {
 				compatible = "snps,dwc3";
 				reg = <0x0 0xc9000000 0x0 0x100000>;
 				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
 				maximum-speed = "high-speed";
 				snps,dis_u2_susphy_quirk;
-				phys = <&usb3_phy>, <&usb2_phy0>, <&usb2_phy1>;
 			};
 		};
 
@@ -71,18 +88,6 @@
 		reset-names = "phy";
 		status = "okay";
 	};
-
-	usb3_phy: phy@78080 {
-		compatible = "amlogic,meson-gxl-usb3-phy";
-		#phy-cells = <0>;
-		reg = <0x0 0x78080 0x0 0x20>;
-		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clkc CLKID_USB>, <&clkc_AO CLKID_AO_CEC_32K>;
-		clock-names = "phy", "peripheral";
-		resets = <&reset RESET_USB_OTG>, <&reset RESET_USB_OTG>;
-		reset-names = "phy", "peripheral";
-		status = "okay";
-	};
 };
 
 &efuse {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index f82f25c1a5f9..4310f01ccc89 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -437,6 +437,7 @@
 	vref-supply = <&vddio_ao18>;
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "peripheral";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index c2bd4dbbf38c..83eca3af44ce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -179,6 +179,7 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
index 0bdf51d041ae..d3fdba4da9a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
@@ -39,3 +39,7 @@
 &ir {
 	linux,rc-map-name = "rc-vega-s9x";
 };
+
+&usb {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index 5ff64a0d2dcf..84399e802188 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
@@ -141,8 +141,11 @@
 	compatible = "amlogic,meson-gxm-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
 };
 
-&dwc3 {
-	phys = <&usb3_phy>, <&usb2_phy0>, <&usb2_phy1>, <&usb2_phy2>;
+&usb {
+	compatible = "amlogic,meson-gxm-usb-ctrl";
+
+	phy-names = "usb2-phy0", "usb2-phy1", "usb2-phy2";
+	phys = <&usb2_phy0>, <&usb2_phy1>, <&usb2_phy2>;
 };
 
 &vdec {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
