Return-Path: <SRS0=3Avb=UO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363DCC46477
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:40:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020E920861
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:40:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XfoYlVWo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AlwC1tIR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 020E920861
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jjVCJPKqPsagdEybEtmlrT6EH1F/+5+rce4nTdtib0=; b=XfoYlVWoMLLOrP
	JJ036wocDrJSdZFcX5LK2Wrp3KR6Ro8h5336eZHuRcvu518/cUwg9k1U9x5X0TP15i+GJ4xjDs9Vk
	IEFCbVWd24mhzZijnoKK0pepil7opI5QTzeX9JJOdjvUr+6KCR2TOVxMuMvK4rTCaYrDzFkYRLM63
	karxNXxUMIS3LpyKPXLrj/7xXEKg9meKk8hJKYNrQ1gPkcru5AVpDn4aGYyhWeq9oxU92NCWt7WYS
	jDEto/6zRCk/1S83/HOmJX7u+0hJ9JMDAZMoFwAy9/TYw0F0y9qKX0gRpDT+OFTGRcbhhPox0LJtJ
	AGDf6MpampMPJ4Trpc3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc66H-0000S5-Kw; Sat, 15 Jun 2019 10:39:57 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc65d-0008HB-2t; Sat, 15 Jun 2019 10:39:18 +0000
Received: by mail-wr1-x442.google.com with SMTP id x4so5020307wrt.6;
 Sat, 15 Jun 2019 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/QzgniEGEGclZRpn0KBLWO6OR92A4BDuZ9FnJJVEA8=;
 b=AlwC1tIRdEsAvi9VVVpHVrUDgkd8VLGzLgaMll9PnQSGv07Pe2vtxIA5N5sa7FsK4A
 ogctEvFj/2UQNv+OCPc1MY1BZmqc75dANmN5GPWp87gpSX45JyHnt0GSOGH/ik1LBG8L
 jjPNqzWbzZi8U2sW1kNzvwbXo3iBEIy+zsmcz56B+MJILExti5aVzJZfA2wSavQtrQNO
 tTbCGpk2n8Liq4IGjGaYipznJwoOoQIVbEcbfBQQUcHrYJ4gf+6dHC8PgfR/SdzuEbVI
 7MUhILIiS2VjtnzyBEWuhO0dQwhVmwS7fgY0zmMhfTAUz3YJfT0bHx8Q+35A/0gBrshn
 HjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/QzgniEGEGclZRpn0KBLWO6OR92A4BDuZ9FnJJVEA8=;
 b=H95fZBv9jw5JsGy5zF/BUWLXQ+W36cQtTtrFMoJvT/kP80bwG0iDI+3uH9t8iqAuAC
 DQ1ooSnAYsYKBgcJ4EnyqSYQkQLLwsGKPaWrRXFhB/Z4dQNXTSGDJqL0NMUtgoFnKbkF
 O29m2SycLJQ/di0/mIleljPDvGfipOupb6zDE0e9qTm4mR/24/oUbQ6Lrlm2XPBrQLeA
 NwiDQ4efYyYeN248dTqUs28T6Qe6mwuxlHEeBU4F31BJOW4YPx6rBN5eQ/YiUAN6Q8W/
 usx1LJdPaDliiMmN5VvEcv85iVapUExsUgIg94pF2ph33jlSL/pxW64ay1PPk57FmXVv
 3btA==
X-Gm-Message-State: APjAAAXEz8C4VlWI0yz8V73VuS9ixbFlNxkCpe80dY7iZ/09Hjjr1lDm
 9IVSkM7xNuG5M8owG2E1iPZEiTP+gqs=
X-Google-Smtp-Source: APXvYqxwZcfDY15BDA87kog2PnIW1s/kC9IFZFwJu8gtBOIDtptJuvKR7G46QVBVuO6F98UWNpQdYQ==
X-Received: by 2002:a5d:4087:: with SMTP id o7mr54775869wrp.277.1560595155210; 
 Sat, 15 Jun 2019 03:39:15 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C20E00A9A405DFDBBC0790.dip0.t-ipconnect.de.
 [2003:f1:33c2:e00:a9a4:5df:dbbc:790])
 by smtp.googlemail.com with ESMTPSA id
 o126sm12209031wmo.31.2019.06.15.03.39.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 15 Jun 2019 03:39:14 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v3 2/4] ARM: dts: meson: switch to the generic Ethernet PHY
 reset bindings
Date: Sat, 15 Jun 2019 12:38:30 +0200
Message-Id: <20190615103832.5126-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190615103832.5126-1-martin.blumenstingl@googlemail.com>
References: <20190615103832.5126-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_033917_148869_E472E2D5 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: andrew@lunn.ch, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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
- RTL8211F PHY on the Odroid-C1 and MXIII-Plus needs a 10ms assert
  delay (the datasheet mentions: "For a complete PHY reset, this pin
  must be asserted low for at least 10ms") and a 30ms deassert delay
  (the datasheet mentions: "Wait for a further 30ms (for internal
  circuits settling time) before accessing the PHY register"). The
  old settings used 10ms for assert and 1000ms for deassert.
- IP101GR PHY on the EC-100 and MXQ needs a 10ms assert delay (the
  datasheet mentions: "Trst | Reset period | 10ms") and a 10ms deassert
  delay as well (the datasheet mentions: "Tclk_MII_rdy | MII/RMII clock
  output ready after reset released | 10ms")). The old settings used
  10ms for assert and 1000ms for deassert.

No functional changes intended.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-ec100.dts       | 9 +++++----
 arch/arm/boot/dts/meson8b-mxq.dts         | 9 +++++----
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 9 +++++----
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 8 ++++----
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 9bf4249cb60d..96d239d8334e 100644
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
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+
 			icplus,select-interrupt;
 			interrupt-parent = <&gpio_intc>;
 			/* GPIOH_3 */
diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
index ef602ab45efd..bb27b34eb346 100644
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
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+
 			icplus,select-interrupt;
 			interrupt-parent = <&gpio_intc>;
 			/* GPIOH_3 */
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 018695b2b83a..86c4614e0a38 100644
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
+			reset-deassert-us = <30000>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+
 			interrupt-parent = <&gpio_intc>;
 			/* GPIOH_3 */
 			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index 59b07a55e461..d54477b1001c 100644
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
+			reset-deassert-us = <30000>;
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
