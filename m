Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676E0C27C4F
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2024 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFKXfwm8CRQ9st4Z98GsdB3Chuwbky/wGx4GzxI4pSk=; b=LKUDhIhay6M/P5
	vUjrNIgsUteIzytnyL6hRuz0e+0j5M7h3uzhNZm0zazlWt5bVbuBoedClAfup+rCh65iKwMXR0YOi
	xrxSdh1CXuPi0KNsYpzq5i5vKDjPZV8peQt8I84RzMA67dkr81Pq4W/SBGGoSDXwma4AbI4PPuMNC
	r5B2H4GjgE0yV5aCi6QeAbpK4Qss3sbVCNVBgy5bxphQamWm8muR7/Ls8uoLEGDUVIWrZ8dPk6XrZ
	d6/YcrBba9RsLSkefaYgArZ22rqbh5Uzg1ha3xspr6J36bhLdwesfvGVESgajF9J7xDH+oyJWptWr
	TJ0E+wwBfArTYhbAfi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUYn-00000007ODA-154g;
	Wed, 26 Jun 2024 15:27:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUYh-00000007OAI-3R4v
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Jun 2024 15:27:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso4206635e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2024 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719415662; x=1720020462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8eDGzZ+IErnn0aKNGPDs0TY+0W/jTGDRNGvqdMq9Lg=;
        b=psmASIaZsWmUFgOVyt6NLIJOpH0D4ZTDLet01w/ZIt2YbMHhm8J3L8wBL15Cf/AgJY
         et2rpveI0fiJHzlQwzXxyF/V+G7WleSfFtzeM64PZ4ezGBOhXjL+TKu5ILTaNq1t+PJ6
         Yk7DS3zQIlASU8hq3UYH1oA/FVFYuMnhGz3jH2lXFj51ka7mTXuyE1AR5Aei8n2bRnjw
         85Q16FwkbkkKiF9gLkArG214j4GtzBhe4BBetqXRG2JB9728G/Ea35oXCyR9N5CPhw35
         67MpZEVta01aGbBURxoAkBXxMszOxgoRiL0szIS8j16Z+mnLRTvrK+UcAlvmw5OIqMRn
         iVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719415662; x=1720020462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8eDGzZ+IErnn0aKNGPDs0TY+0W/jTGDRNGvqdMq9Lg=;
        b=F0RsIlLwK5c4ZHol/K2ifcqHGbIrn9E2qWSC4JRtW8T5JHh0x+Zfnd7qxxjjzNKnwF
         3oxvuoJNli3mYkf9EYWvydePn3l0YNwf0j4ESxIOEJDv9FXilkqjzK/bU5nndTi5Jifs
         wkez2CbnkZruHzzZAcWatsWPjlrQuJgb3bY/Ww+aee29X2pAKCkGLtHpie9GzJcmx8PM
         qy1orBv+MBTEr36jRSFMQYyv5QEinEulN3pX1V/Oa4AQT+rZeLfqKWyXwES6GAGiN1ej
         v5oC9mNpS8yPHJxAg2+jy/G8o3WXvUifLSdCvAkXjwr9nWqTEDX+SDazKQMQRmqQvEVQ
         jEKg==
X-Forwarded-Encrypted: i=1; AJvYcCWiIWnDTVkwWNSJQdCRMIasrZ7vGAaII00nmIec6alI7ibteXQdpyTOOFRpeXENOfkuQ+WCm2L9AAUJPO8CsqgezvqWTaTZNTm2fXbp01sDmv0=
X-Gm-Message-State: AOJu0YyrM53NOVqlLxo0vn/+QvueUKy+U6yx/ldIihJAp1ugCHRyl5Bj
	QflzD+mueXL/NN2lf/1xUmGKTM+bmEewsMflJF5iiC0+NqR5Bp8nZT+cIVmIqyo=
X-Google-Smtp-Source: AGHT+IHHnjS6+dJqx70WoQTYtvaGWcpY7e+5P/bQbgSAIxnlHIm5/9MX4ZlCOoXCOvUP9hGlPkhlVg==
X-Received: by 2002:a05:600c:4496:b0:424:a578:fc5 with SMTP id 5b1f17b1804b1-424a5781145mr33388605e9.32.1719415662054;
        Wed, 26 Jun 2024 08:27:42 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7be7:aef1:af9e:fff6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4249b4233b3sm42321675e9.0.2024.06.26.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:27:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/2] arm64: dts: amlogic: gx: correct hdmi clocks
Date: Wed, 26 Jun 2024 17:27:30 +0200
Message-ID: <20240626152733.1350376-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626152733.1350376-1-jbrunet@baylibre.com>
References: <20240626152733.1350376-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_082744_005869_CA38C278 
X-CRM114-Status: GOOD (  11.41  )
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

The clocks provided to HDMI tx are not consistent between gx and g12:
* gx receives the peripheral clock as 'isfr' while g12 receives it as
  'iahb'
* g12 gets the HDMI system clock as 'isfr' but gx does not even get it.
  It surely needs that clock since the driver is directly poking around
  the clock controller's registers for that clock.

Align gx SoCs with g12 and provide:
 * the HDMI peripheral clock as 'iahb'
 * the HDMI system clock as 'isfr'

Fixes: 6939db7e0dbf ("ARM64: dts: meson-gx: Add support for HDMI output")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index d8a386c31914..041c37b809f2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -311,8 +311,8 @@ &hdmi_tx {
 		 <&reset RESET_HDMI_SYSTEM_RESET>,
 		 <&reset RESET_HDMI_TX>;
 	reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
-	clocks = <&clkc CLKID_HDMI_PCLK>,
-		 <&clkc CLKID_CLK81>,
+	clocks = <&clkc CLKID_HDMI>,
+		 <&clkc CLKID_HDMI_PCLK>,
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
 	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 82386feb5177..067108800a58 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -323,8 +323,8 @@ &hdmi_tx {
 		 <&reset RESET_HDMI_SYSTEM_RESET>,
 		 <&reset RESET_HDMI_TX>;
 	reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
-	clocks = <&clkc CLKID_HDMI_PCLK>,
-		 <&clkc CLKID_CLK81>,
+	clocks = <&clkc CLKID_HDMI>,
+		 <&clkc CLKID_HDMI_PCLK>,
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
 	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
