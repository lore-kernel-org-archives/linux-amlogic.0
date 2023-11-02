Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CC0C4167D
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Nov 2023 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFWm+HqUxah8VTOjjztytOMCYsAoMtjwkZX033SOqG0=; b=iNwz/4wKn+R06L
	H3LIZEhC0uGNIttJhODmK88CxaxMy7E66/eFZ9/rxDkPfLGeGBJw9nwzbWRrBUfXZfQd8Nz/RuY+O
	Vb0f6H+AgPECXJn+2VxWF8QDEqgtH06cblPSXJY+2BVNEMxMdq4+SkkhCd823XR9x8jrBIpvYG2KV
	TFK5zXQ+G+VqnSly9H206kwRaynp3FENGkSuDDRxQYW6G79dgup+EBD7zFpv4l/t9c3zpGSkxlGX4
	a+XgAlGRNo/ekjBLCgDkqhcAJbD1Cdp4/AnW70IGsLTpv6tEMTjJxvazGuu9bxO0bO1VeBmbzx2wK
	7U0XK73ezCgrce0ZEnsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQwp-008o9J-3B;
	Thu, 02 Nov 2023 06:12:55 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQwk-008o81-0J;
	Thu, 02 Nov 2023 06:12:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E10714745F;
	Thu,  2 Nov 2023 06:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1698905560; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=d6bGpQGMcWTfIFXeJnfNXYglphqaXvj//mewEVDo5i0=;
	b=peJtDkTo1fNDhJPVKfV17W63VXWPpCxUauH1uYj6bxUZ9eoQ6v8ABr/dZwnxQXodj5zU0P
	Rn9NfOkNTc2R8AhjMDeN5IPnDtA9UocjysHowSqFnVjwg6vF+tpC3vfcWL4ykOhqg3fvcL
	HhfeCeu5q+g1BVH5A/CkAV5FO9743knw2OQCpPp7LyFh1/t6xK7zuguuz7QsN+odaXap3w
	gwcNpZ3MwdVnBLWcOd9av3sWQvQEbxHKjEH0MTXTipikcb13fDUc2Wn/2sMHGB1hAXWKNF
	LuVzo1MJInSYfw09bX3PyHDbqbMynCDwLi9uB4mrPf9pA/tHlscCB5ntarjeHQ==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-axg: jethub-jxx add support for EEPROM
Date: Thu,  2 Nov 2023 09:12:33 +0300
Message-Id: <20231102061233.3113249-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_231250_733430_5DD6A42E 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add dts node for EEPROM placed on baseboard in JetHub D1+ devices.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 .../amlogic/meson-axg-jethome-jethub-j110-rev-2.dts  | 12 ++++++++++++
 .../amlogic/meson-axg-jethome-jethub-j110-rev-3.dts  | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
index 0062667c4f65..2c684f0ca99a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
@@ -35,3 +35,15 @@ bluetooth {
 		device-wake-gpios = <&gpio GPIOZ_6 GPIO_ACTIVE_HIGH>;
 	};
 };
+
+&i2c_AO {
+	/* EEPROM on base board */
+	eeprompd: eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+		pagesize = <0x20>;
+		label = "eeprompd";
+		address-width = <0x10>;
+		vcc-supply = <&vddao_3v3>;
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts
index c2d22b00c1cd..c356bd2cc63a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts
@@ -25,3 +25,15 @@ memory@0 {
 &sd_emmc_b {
 	broken-cd;/* cd-gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;*/
 };
+
+&i2c_AO {
+	/* EEPROM on base board */
+	eeprompd: eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+		pagesize = <0x20>;
+		label = "eeprompd";
+		address-width = <0x10>;
+		vcc-supply = <&vddao_3v3>;
+	};
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
