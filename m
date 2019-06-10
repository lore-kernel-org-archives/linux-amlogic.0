Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9D3C31E43
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:38:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86EA20820
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m7s2qLRo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TCFlyQx1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E86EA20820
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3511FWKLnCgtNN7ryumw6b0vIe3zja3csSAAqTg9Jss=; b=m7s2qLRoPlF+3R
	OQFt7Q7wcSBwKantll6zJwmbvPNhRV8mlqqE5vwrHwPjbfyrVNR9XO5hLqPldzxTRfaledmQJAT6Y
	mlcM1oQR430wvKh89VXpKMXQVE9NWOYzTr/4Zfn5pBcgjskrNG1NIdhhETdFZ0q84XzeHcMQ87wGh
	7G0ZkwSNmSev6MoAe7vkpR7LotGMk87aoKeqxPaPmqKJCsF95kBZT2tpMUtQcLyh8m8bT+hkpojEq
	t+0i3OUVYRcHkP0jxpmyvR4QNIbviPT7Fn5JFL8CLuJwppIPTMfJeJQLZOkI2A7/DjCtUgzVMp4Xl
	fgKclFSEtjNS0j35KhIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haNJq-00085p-2H; Mon, 10 Jun 2019 16:38:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haNJ3-0007Gc-1N; Mon, 10 Jun 2019 16:38:03 +0000
Received: by mail-wm1-x343.google.com with SMTP id c6so35902wml.0;
 Mon, 10 Jun 2019 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVXioOmjgf9ahMEtcObKmzP+wiSIg07/Kqxdh1aZYf0=;
 b=TCFlyQx1+5yd/WO3I1d+xKcptTP7V6K4rA2SGRmSn6H32gqMIn2VsQeVLGZw12Zx1D
 PeVM/+lE9MM+NMF/MRS5Egah0ltp4cOzuxScg88j07B24reg8J41v+P6ic6MbiFI5WZO
 DYZcUla8HVaoisn+FioBGgi6p1RmNm40JflpWL028yZwvqohThcj3zScdeUPANYZ+gzR
 DEbBiAw1B5Gd/N8ee1ggWejfShlr0lDESPl2kdni6isBKM3QHd19dfaanHM4DAIu0sDg
 Yg+iDvgGp7xH+yHKpMb825WBCM+D73eTZ5uw2bHJdC/jl6ZrLUN4wQGtkpMZl7x43Gzq
 IvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVXioOmjgf9ahMEtcObKmzP+wiSIg07/Kqxdh1aZYf0=;
 b=ZS5+iZ4sfh3TRZwaM0iGJtccDoXV7Hd6a5fM0f5I+2K7MwtBSOtSfpYbeBCThNsXND
 g3oPBUe+8tGGZilmXVQcpT6w0D+eNRTTlaCzsVNhe4wGiBdfAV2idQ6bc2AikwN/DytZ
 gYDLRjSKBzljx+WO3jUd3tcPaKwY9lOpO/orHDGNFpHEHAdQUBGjHL8v1Upz/UFckoBN
 9qJiE7JCiBGhOSIfvFr3a8OaDQ6Knz408JW9RvecFjG9Vk+mJrLLnpL9FulMrsCsHkOt
 DEP90RAPQlB80+FVXSo/3ETtyvyqEO/Gut3KDJqzDUjgBX7VyVm3xkdpR7UArM4uf2sb
 ibEg==
X-Gm-Message-State: APjAAAUcsiHnMO2hFyG8wM5G2zdcwHptSE0jub3tTVLSFvvgfNGT0Hov
 Sb+uTLDKmVRxLZ3xNulrY1uDuZqc
X-Google-Smtp-Source: APXvYqzG5Pm36sSPSsZmcLYuna2qFHI0pNfIROeEF9zZZBHfeZqHmT46L6EKeRJwQHKI9bM+JN1WVQ==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr14310280wmc.169.1560184679244; 
 Mon, 10 Jun 2019 09:37:59 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA40000C4C39937FBD289.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:c4:c399:37fb:d289])
 by smtp.googlemail.com with ESMTPSA id g5sm13900517wrp.29.2019.06.10.09.37.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 09:37:58 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 3/4] arm64: dts: meson: use the generic Ethernet PHY reset
 GPIO bindings
Date: Mon, 10 Jun 2019 18:37:35 +0200
Message-Id: <20190610163736.6187-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190610163736.6187-1-martin.blumenstingl@googlemail.com>
References: <20190610163736.6187-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_093801_104776_8DF617CF 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: andrew@lunn.ch, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The snps,reset-gpio bindings are deprecated in favour of the generic
"Ethernet PHY reset" bindings.

Replace snps,reset-gpio from the &ethmac node with reset-gpios in the
ethernet-phy node. The old snps,reset-active-low property is now encoded
directly as GPIO flag inside the reset-gpios property.

snps,reset-delays-us is converted to reset-assert-us and
reset-deassert-us. reset-assert-us is the second cell from
snps,reset-delays-us while reset-deassert-us was the third cell.

Instead of blindly copying the old values (which seems strange since
they gave the PHY one second to come out of reset) over this also
updates the delays based on the datasheets:
- the Realtek RTL8211F PHY needs a 10ms delay (this applies to the
  following boards: GXBB NanoPi K2, GXBB Odroid-C2, GXBB Vega S95
  variants, GXBB Wetek variants, GXL P230, GXM Khadas VIM2, GXM Nexbox
  A1, GXM Q200, GXM RBox Pro)
- the ICPlus IP101GR PHY needs a 2.5ms delay (this applies to the GXBB
  Nexbox A95X)
- the Micrel KSZ9031 seems to require a 100us delay but use the same
  (seemingly safe) values from RTL8211F due to lack of a board to verify
  this (this appleis to the GXBB P200)

The GXBB P201 board is left out from this conversion because it doesn't
have a dedicated PHY node (because it's not clear which PHY is used on
that board).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts  |  9 +++++----
 .../arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts   |  9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts       |  9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi  |  9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi     |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts  | 11 ++++++-----
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts   |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts        | 11 ++++++-----
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts    |  8 ++++----
 11 files changed, 53 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 849c01650c4d..32e901538519 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -154,10 +154,6 @@
 
 	amlogic,tx-delay-ns = <2>;
 
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
@@ -166,6 +162,11 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
+
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
 			interrupt-parent = <&gpio_intc>;
 			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 3c54f26eef15..c2f619a6a96c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -162,10 +162,6 @@
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rmii";
 
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
@@ -174,6 +170,10 @@
 		eth_phy0: ethernet-phy@0 {
 			/* IC Plus IP101GR (0x02430c54) */
 			reg = <0>;
+
+			reset-assert-us = <2500>;
+			reset-deassert-us = <2500>;
+			reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5a139e7b1c60..fc0528a89b6c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -126,10 +126,6 @@
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	amlogic,tx-delay-ns = <2>;
 
 	mdio {
@@ -140,6 +136,11 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
+
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
 			interrupt-parent = <&gpio_intc>;
 			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index 9d2406a7c4fa..eeea17767cab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -68,10 +68,6 @@
 
 	amlogic,tx-delay-ns = <2>;
 
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
@@ -80,6 +76,11 @@
 		eth_phy0: ethernet-phy@3 {
 			/* Micrel KSZ9031 (0x00221620) */
 			reg = <3>;
+
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
 			interrupt-parent = <&gpio_intc>;
 			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 18856f28fd60..a7c2d8bfdd0b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -116,10 +116,6 @@
 
 	amlogic,tx-delay-ns = <2>;
 
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
@@ -128,6 +124,11 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
+
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
 			interrupt-parent = <&gpio_intc>;
 			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 9ef6858779c1..dc0d8c3b4eff 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -137,10 +137,6 @@
 
 	amlogic,tx-delay-ns = <2>;
 
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
@@ -149,6 +145,10 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
+
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index 767b1763a612..003d6aa6964c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -70,11 +70,6 @@
 
 	amlogic,tx-delay-ns = <2>;
 
-	/* External PHY reset is shared with internal PHY Led signals */
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	/* External PHY is in RGMII */
 	phy-mode = "rgmii";
 };
@@ -84,6 +79,12 @@
 		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
+
+		/* External PHY reset is shared with internal PHY Led signal */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <10000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
 		interrupt-parent = <&gpio_intc>;
 		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 		eee-broken-1000t;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index ff4f0780824d..2b6003b605a4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -239,11 +239,6 @@
 
 	amlogic,tx-delay-ns = <2>;
 
-	/* External PHY reset is shared with internal PHY Led signals */
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	/* External PHY is in RGMII */
 	phy-mode = "rgmii";
 
@@ -254,6 +249,11 @@
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <10000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_15 */
 		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 29715eae14a9..a2a7ec5c8fd6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -101,10 +101,6 @@
 
 	amlogic,tx-delay-ns = <2>;
 
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	/* External PHY is in RGMII */
 	phy-mode = "rgmii";
 };
@@ -114,6 +110,10 @@
 		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <10000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 8939c0fc5b62..044668228ece 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -52,11 +52,6 @@
 
 	amlogic,tx-delay-ns = <2>;
 
-	/* External PHY reset is shared with internal PHY Led signals */
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	/* External PHY is in RGMII */
 	phy-mode = "rgmii";
 };
@@ -66,6 +61,12 @@
 		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
+
+		/* External PHY reset is shared with internal PHY Led signal */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <10000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_15 */
 		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 13de1e8f58b5..04eae80585af 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -101,10 +101,6 @@
 	/* Select external PHY by default */
 	phy-handle = <&external_phy>;
 
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	amlogic,tx-delay-ns = <2>;
 
 	/* External PHY is in RGMII */
@@ -116,6 +112,10 @@
 		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <10000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
