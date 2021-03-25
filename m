Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37654C433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:43:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C717C61A17
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C717C61A17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uQiGU1Se3e432AXdpkkGvvqW1CD4/RN609K69CMyHhs=; b=cUVRFBY702go1oZbKygPAB5Ti
	4dJBRWosu+K/51LrS6HqipoWc+RLywVdY3pv96/wIX0ZwmKp5EKGSp7l4pzS51TR83aGt/mtiI84C
	bTegrsqdsp4XROpW3xR3dkDfjlLI1cB1khFn3lKRry180hA6chN/Oa2E/n0rtABO6Pee7kDMrIz+n
	wYX6vvO+LBjcaq/D65teIpS3/fFJ7zWsZEy6c/fxsSnU+tvZ8ShaqcpJI15Cqhz9yLxk8tf+TyJPm
	1G0sz9zhffXJ7+FMBQZLKKXhIF1wGRFGXIUHJVkuERCgv0mCOYJ1Hr57b2+rO2riNFK2H8V6lcxyt
	LxvKIxj9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPKx-001PxW-W6; Thu, 25 Mar 2021 12:43:44 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPKH-001Pim-NK; Thu, 25 Mar 2021 12:43:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso2657658pji.3; 
 Thu, 25 Mar 2021 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=np0SSxLTsfaMyZQWpoX2X5BItJhfehHr1tDviU+H3Lc=;
 b=m5N90QbNb9Iz0w2E4mpSUzWYoEK3lSG7cYGOMcMW6i40uvcmKKFnGcfRESuRlCRYqt
 029RJ75YMQQp3e0l7GUHDhDrATTHKROcAPMdSfwfJNSVxX7/pr0pYZ+OhsE7kZtMdRQK
 YHYuZ/aHcslFPHu1VY0KwKD6f0FSfMb4hcaJyuK/LjLWQbCvezJ/jl1noWCIkKuxzShh
 7vJJyqqmXCMk4ovy8w2zyNQJQkBICbKG/hingsjCSE+cxKriOSoTBZb73AIW3v2sUiO1
 cXkCWStHQr8paPS9dwEkoHGqcLwtRdHS7qdotkNqLhW1ybEIuMKlWii0oQSTYYxMk5oB
 +/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=np0SSxLTsfaMyZQWpoX2X5BItJhfehHr1tDviU+H3Lc=;
 b=Pg2LAN4BjQiuO3XKy2BOXYStOkCQVH85uBbeH4YWhIKtAusDkpo/UWTQgwM8m+05HA
 ULWZYyHNGk1WupE7Pe7jNWr/hFz76OL9f21pw1+I9clg0d8Nqy7IbVGtd2hWXDzLujHS
 rc4h2U2v7GVk3OsRo8gf00oYkFm9q2hDghIvRRCnQitLnA7bKNg09zxaUS/wnvY6bKP7
 CfZZUBoWa2xU+2nRV9lJlBTzxRGKstpkU5PoXjYlTSCAxxarWepKNMvlfp+Go557P3y3
 sP/d3dmyH8T4+BTMuEo4JVbCxrS5w9DhzOxMgOEDOaqyvgZLhZOGlQLYZbDKaGEbgA4J
 W6ag==
X-Gm-Message-State: AOAM533dvkW22iLihDt5iyL+4gTWA7rIcgiaY7DvgM6xTXPz5A4HtfiH
 Xm8cknze5jpGy6/51Bdq6k8=
X-Google-Smtp-Source: ABdhPJw8nlmrOvGUCqJ11kK8pHt/A0pB4F7zYvzwpYK3cTiwOCCq4fodhtdztP97FJQBavm7SBWbgQ==
X-Received: by 2002:a17:90a:990a:: with SMTP id
 b10mr8606922pjp.178.1616676180544; 
 Thu, 25 Mar 2021 05:43:00 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.9])
 by smtp.gmail.com with ESMTPSA id t17sm6125917pgk.25.2021.03.25.05.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:43:00 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>,
 linux-amlogic@lists.infradead.org
Subject: [PATCHv1 4/6] arm64: dts: meson-gxl: Add missing ethernet phy mdio
 compatible string
Date: Thu, 25 Mar 2021 12:42:23 +0000
Message-Id: <20210325124225.2760-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325124225.2760-1-linux.amoon@gmail.com>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_124302_563542_3032509B 
X-CRM114-Status: GOOD (  11.89  )
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

Add missing ethernet phy mdio comatible string to help
initialize the phy on Amlogic SoC SBC.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts         | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts   | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts  | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts    | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts         | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts     | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts     | 1 +
 8 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 359589d1dfa9..d7cfcde40fc6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -374,6 +374,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			interrupt-parent = <&gpio_intc>;
 			interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 2d7032f41e4b..5bafb45f6c46 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -272,6 +272,7 @@ &ethmac {
 
 &external_mdio {
 	external_phy: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 		reset-assert-us = <10000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index b2ab05c22090..c0c2505081a5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -77,6 +77,7 @@ &ethmac {
 &external_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 18a4b7a6c5df..7cb834dcc91b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -229,6 +229,7 @@ &ethmac {
 &external_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 
 		reset-assert-us = <10000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index dfa7a37a1281..abaf58b7b765 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -108,6 +108,7 @@ &ethmac {
 &external_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 8edbfe040805..1342ca285d44 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -59,6 +59,7 @@ &ethmac {
 &external_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index dde7cfe12cff..c96fc23fd8f1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -110,6 +110,7 @@ &ethmac {
 &external_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
index d3fdba4da9a6..a99a760f253b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
@@ -32,6 +32,7 @@ &ethmac {
 &external_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 	};
 };
-- 
2.31.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
