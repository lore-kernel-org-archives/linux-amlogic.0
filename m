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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63374C31E43
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:38:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D5720820
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QXwyk0JX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OjnpuyGd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33D5720820
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2plQelGAsJ/0s8dCs2RzA/xJt3kalWvBtC6tL7ldfw0=; b=QXwyk0JXqbcg7O
	BoYjIfTi+CFLfxFzU4WVxAKx8zq/+BZ5pQTNk7uKgVYhOhZhmpgqBMJ3Ecd8P8KAtivnYfmCba84H
	ubjke73qdJoEhpqpxocM8tipfd0Ut16LG55vtoMxKPfS78lp6H2B1yqvGBrzJ2GNGqrdB7WHrq6gQ
	tcxqIxv2kZOr8Z2dbmtVPNn02sbCjoF6+VETA0l0zplNzOlLtce6J26Z+CxDGJD6bqJ7XN7lsy/Em
	RBWTnph1uvX8hy+9DQ2tWUrWMybnuCqXc1G4X11Z9fb3T098eSEYnHFyJcwTGdtSF9txR6BFrZh8P
	tOBiklfFxtaL5exltdmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haNJY-0007oK-On; Mon, 10 Jun 2019 16:38:32 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haNJ2-0007G4-2S; Mon, 10 Jun 2019 16:38:01 +0000
Received: by mail-wm1-x341.google.com with SMTP id h19so315732wme.0;
 Mon, 10 Jun 2019 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yNTAIz3mJDkLK+YySgzrs7un+Xy5BvadJQvUdsbk+g=;
 b=OjnpuyGd7JLQGol8L8RK5CUC59JzpdS0vEKP4X//P98JFnVj8yhOXyKUZ4FvPYJUyT
 wPkkM8uYPgBO1ae7ZHtIR5SwCksuSY4PdjDMxKkKEfhVIJrFZEEUcvWd3hajsQ5tqrLk
 fU0tcQSUldoOpDm4NzAKS9bnorh0imHpbRz4p19FNzq/xSace4DGuOzcT+J+zgFErHUb
 OyT54AWOVc2TYX06el7lT8CQLRzxpYIQ+SRM7eB7JqAilZvEGbbtzqLvbfJj3wKDrsuw
 IshjpYuloVu8OlKqg6xFtFAlaj04LEbYmzP2AvMstHD9NmfoOLIZIKE2cnAQ57pm1bp6
 A4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yNTAIz3mJDkLK+YySgzrs7un+Xy5BvadJQvUdsbk+g=;
 b=jjH/bJCEJR7DnMjAphvLCrbDwOMIxdjlLOOWlX+JYy2MBjnQYGFEk+Lk4f5ynaknKD
 82lU1sK4m0ERGscJDCb4OsgKgKeuS2jDtgR/DQj8jW8dEdLo5+4pBx65giSh7DigFZIK
 GImZwbnpSA73e91MP2rk3t3CLSNQSFBpj7alQfeQFI3o4u7848jDtlCJyzZU/hNMNAtb
 Hb4YniE5i0TzEbnkmewllEQZF3DcW1LqzhKebXBjFrs40HLG15RJaJjfsZnPj3VNdz0C
 d2roWmftyzjLRLU7CdGeAFSjhAEc/t+x4JNcf/vb3UZUOffRCU7/jWwexfwwYTw54B6U
 od8g==
X-Gm-Message-State: APjAAAVNAQEnt6A3TDaMaYW2Y4oWVF9CjOIIFAGn1P9cX0dscIoTb0Nd
 J458GnJotPQXPUzPExWdUhsLbRZh
X-Google-Smtp-Source: APXvYqymn6rvlpcPNNMw7f+/G8mtoxn4S6Ao+sIHVgyzjum/6MXrQ/JvewfiEWqR9xC/PNBynb0bhQ==
X-Received: by 2002:a1c:e715:: with SMTP id e21mr14832715wmh.16.1560184677982; 
 Mon, 10 Jun 2019 09:37:57 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA40000C4C39937FBD289.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:c4:c399:37fb:d289])
 by smtp.googlemail.com with ESMTPSA id g5sm13900517wrp.29.2019.06.10.09.37.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 09:37:57 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/4] ARM: dts: meson: switch to the generic Ethernet PHY reset
 bindings
Date: Mon, 10 Jun 2019 18:37:34 +0200
Message-Id: <20190610163736.6187-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190610163736.6187-1-martin.blumenstingl@googlemail.com>
References: <20190610163736.6187-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_093800_115454_226A79BA 
X-CRM114-Status: GOOD (  12.18  )
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
- RTL8211F PHY on the Odroid-C1 and MXIII-Plus needs a 10ms delay (the
  old settings used 10ms for assert and 1000ms for deassert)
- IP101GR PHY on the EC-100 and MXQ needs a 2.5ms delay (the old
  settings used 10ms for assert and 1000ms for deassert)

No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-ec100.dts       | 9 +++++----
 arch/arm/boot/dts/meson8b-mxq.dts         | 9 +++++----
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 9 +++++----
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 8 ++++----
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 9bf4249cb60d..e1d4fefa66c0 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -234,10 +234,6 @@
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rmii";
 
-	snps,reset-gpio = <&gpio GPIOH_4 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
@@ -246,6 +242,11 @@
 		eth_phy0: ethernet-phy@0 {
 			/* IC Plus IP101A/G (0x02430c54) */
 			reg = <0>;
+
+			reset-assert-us = <2500>;
+			reset-deassert-us = <2500>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+
 			icplus,select-interrupt;
 			interrupt-parent = <&gpio_intc>;
 			/* GPIOH_3 */
diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
index ef602ab45efd..790441bdffa9 100644
--- a/arch/arm/boot/dts/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/meson8b-mxq.dts
@@ -91,10 +91,6 @@
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rmii";
 
-	snps,reset-gpio = <&gpio GPIOH_4 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
@@ -103,6 +99,11 @@
 		eth_phy0: ethernet-phy@0 {
 			/* IC Plus IP101A/G (0x02430c54) */
 			reg = <0>;
+
+			reset-assert-us = <2500>;
+			reset-deassert-us = <2500>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+
 			icplus,select-interrupt;
 			interrupt-parent = <&gpio_intc>;
 			/* GPIOH_3 */
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 018695b2b83a..c41dbb7acc56 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -176,10 +176,6 @@
 &ethmac {
 	status = "okay";
 
-	snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 10000 30000>;
-
 	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 
@@ -195,6 +191,11 @@
 		/* Realtek RTL8211F (0x001cc916) */
 		eth_phy: ethernet-phy@0 {
 			reg = <0>;
+
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+
 			interrupt-parent = <&gpio_intc>;
 			/* GPIOH_3 */
 			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index 59b07a55e461..46eb656a128f 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -73,10 +73,6 @@
 
 	amlogic,tx-delay-ns = <4>;
 
-	snps,reset-gpio = <&gpio GPIOH_4 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
-
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
@@ -85,6 +81,10 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
+
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
