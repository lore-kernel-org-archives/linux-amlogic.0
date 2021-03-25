Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D9BC433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:44:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48EBA61A17
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48EBA61A17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gDWR4gSFJpkvyRaQeESVbtXhnm6wnhb9c4ktOaS+PWw=; b=b1e5T5nQ3RCUd3PX4+5giPo/i
	Sv6kgJhWQoHrxr7YY9c3bt6Js0MvHdwaSv0gpjLCsXwyVf639Sum28Q+bh4M1wnUJTtdtyGtPTsfV
	MJibmsQ4oMl46Xdgs6SKCFxL0rRhRGEgmI89ikFIBJJLqW1g5H14lEo8ut++K8dPlnlLOzOkvq9A/
	EVCqzkzHn8XHHOfXSe1aND72LdpwFHVric5Dt+o9C41r2UuB9oULgSg5EdXvF330nJdKRuLkYyrUa
	WtMecZcfDC7B4k7/xhyTYez9ju4ZNtCaX/C2kNeATyDrG+kEkJFTOdJh6V5s+y0HvMoLxTgfA05Xh
	fBJUMgNIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPLD-001Q45-Gf; Thu, 25 Mar 2021 12:43:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPKM-001PkJ-Rs; Thu, 25 Mar 2021 12:43:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id c204so1942585pfc.4;
 Thu, 25 Mar 2021 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewEJiuUTUTiMPuh5BO0z//1JOB0w6fbG+bZ6ErXDulI=;
 b=qxsKAo5K6SnRq8s5y0PaFyRkSEBUVeFNRHgCPA+XBFsLd0SY2+zXz9SZMVcaOVnQ4r
 P/TPrYY6YGGlT4riIQV0a7TBaeWlave+J6OCYL1Y9qHjJ7ixoPhX+nCbS1WtXy8XknRw
 GuobUlCyeyUG+PTsBDZdEMMYKA3OzWb/iwuV6515cgH7N0HUFyG58Bm12pCGHRo2MOuY
 o7b4cQnMzypClW3PwcnPSflZER157BM7jR71UiW9PNgl1AWVtrIBkeD1kDDbhgbrjmEt
 iQybUnuIOXIFzp+WDHWxAPiOjkrs95ofJd5o6GxGFPJ8/LLIxfoPiMEBAENp786oABmu
 PxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewEJiuUTUTiMPuh5BO0z//1JOB0w6fbG+bZ6ErXDulI=;
 b=Jj+DILMSSeX2SGG0bSlE8UMtzbYxIPtuwu5Z5CQ46MvjrAbovrKT2r3kh/2+53jxOC
 o/IhmpSg4MsR4gPW6CzF4u0N/aiu0TGnrgYogIW4Aj+/H5pbSNoGD9Ri4qsm0XzrQsV2
 UQ7r8lxPXqhdfO1lm0VV6vE7r43U3oQ0RZuBXc2MFPAFdaHiU4o0VZT3WyUiTYPZT9x/
 aldybLY8sXXrRtMF5s5IsJJY8cPsQIux8sHizs9gClpeV5OXTYqqrmn08d3Iv8K6TJFZ
 cw9g7mGjQMgyxDr1CM9iQkjOPVTja0Z8WWlGsjyBb0qzeBShhX3HWEqKSGo6pEjqxz8A
 DE7Q==
X-Gm-Message-State: AOAM532ELRFMQabGpljyqZeW8ZK8Jd8ba9/Cj8LW4H0iEjax59C+IR6y
 PrA877HOYNL6e98vcw8FK7c=
X-Google-Smtp-Source: ABdhPJw5fm7m4uyEDWOOW4A8Qp1oFNL4AVVvqXdofBzw3DiUHKCyBr8ExRRshq7tvxOKVvkd2maKOQ==
X-Received: by 2002:aa7:8187:0:b029:213:d43b:4782 with SMTP id
 g7-20020aa781870000b0290213d43b4782mr7870651pfi.26.1616676185407; 
 Thu, 25 Mar 2021 05:43:05 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.9])
 by smtp.gmail.com with ESMTPSA id t17sm6125917pgk.25.2021.03.25.05.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:43:05 -0700 (PDT)
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
Subject: [PATCHv1 5/6] arm64: dts: meson-g12: Add missing ethernet phy mdio
 compatible string
Date: Thu, 25 Mar 2021 12:42:24 +0000
Message-Id: <20210325124225.2760-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325124225.2760-1-linux.amoon@gmail.com>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_124307_013525_586E6B30 
X-CRM114-Status: GOOD (  13.44  )
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
initialize the phy on Amlogic SoC sbc.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts    | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 3 ++-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi      | 1 +
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi    | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi     | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 579f3d02d613..32c99035a18f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -335,6 +335,7 @@ &pwm_AO_cd {
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 		eee-broken-1000t;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 58ce569b2ace..12f70b38ce67 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -410,7 +410,8 @@ &cpu103 {
 
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
-		/* Realtek RTL8211F (0x001cc916) */	
+		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index feb088504740..cfb89f5e6eef 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -260,6 +260,7 @@ cvbs_vdac_out: endpoint {
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 877e3b989203..4d4a5d467bc7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -273,6 +273,7 @@ map {
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index d14716b3d0f1..5bdbf0d09bc0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -253,6 +253,7 @@ &cpu3 {
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		max-speed = <1000>;
 
-- 
2.31.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
