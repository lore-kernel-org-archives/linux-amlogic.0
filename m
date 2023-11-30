Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20ABC4167B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 05:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztRjlwk9ZEEOF7hZAMncNKYS56AIRuAGxTTKFOK/KB4=; b=ic+SqtZQ7n2aho
	JFL8sBz8LS7w1RzFMuzSBGrCclvbcMpVvw7wraMEPLb/vF/2UWzUb7bjQ9Qcrmakkx9LpR3QL+1/U
	NztH/aJQ7/TZrP7U9G/pe0rpr06/54vFo7u9byvlrHsvwnLPUSe3z3YtIScZ21HAWbPJCvJSoS/tm
	+CK6g2QLMLVomxNc2jOlhOvOP2E5bcIW6S8W9EMtAOpezr1uCnMkRjnjzHkduzfxlWtEvYOw1eada
	Oen98LlM6zRNDZD8g9y+0kSyjGGRAMHA2aUIsLQyn1oWYrISDgMd8nHrxpnLSOdsnFuTckjoXC5Uc
	B86d4pj7GtQkajDcpa/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Zej-009yId-0k;
	Thu, 30 Nov 2023 05:32:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Zeg-009yGk-1F;
	Thu, 30 Nov 2023 05:32:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cfc2bcffc7so5432415ad.1;
        Wed, 29 Nov 2023 21:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701322322; x=1701927122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t8tXe6ccmmDxngyTtST79lozTn11v8rTEVF91HUREg=;
        b=K87X+tgy4r9SbUPeKdeBa924qyxECnstDNgtRD7/YXqg71k+G/RCNDAAy+DQd1/ajM
         JkF3gEhgiCZh7dfa6m7Dz3qtgr9nfsc4ETG3bMvqcEiYGGh+2eOZCPPWsJgmn5vhKbrp
         HlZdgCGPT4FFQ0VP4cpBU4BpoGDRJMesvJ1l8CYkyF8gM3qL2oOn972VP3mFyngQDCKh
         SYAk9s0eg+ipuWwuq+Gts7ZwQq1nT9FBe7cvZyVEr/iJ+/K45j269DELE7fRpALS+VBG
         nvF4NgdNMRB1tDIYXGSTvdYSG4OH6gV8t0QJyzY7osTLkoCwUzUyjQfw/K+zQi1pZaP8
         0WZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701322322; x=1701927122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+t8tXe6ccmmDxngyTtST79lozTn11v8rTEVF91HUREg=;
        b=YSP6WUQ5nAjRNKzVpB2pqx9txGsJwgOcyK8Nht/PvdZ519t6MmhZs20P/MykLCNnT8
         X6sLJejnYSB6j8OLXgtXj1dWrOJYvXxLRU4Ti+4inxqoFNNnLrlhZ6i262igAEaRbQH4
         KQoKQVpg1JBYN5OuaaMjv8dzzkTMWo/4M5oCLsLRXuxkOgkisJK4CZVxTsqMsMaenHEZ
         RCpakZKZotQTNx1dhepsXjwR2CfGQ4bL152cWBodbPx/PuPGVNqtWunpuBaZM7I7oeg/
         e0Fwh2nyj05cK+3PJLwC9Z69UlZN6YWbIJ4zZ7BizzvVNzb3kOYH+bMC7IhzX7aD00Xh
         XwUw==
X-Gm-Message-State: AOJu0YyG1VrjLcNwXJwYfW2n5EAXtiJL0NBUDMx2Z/Tp3k9XNBn0ds3X
	kZIeEuKBurV0MHJtTcH1c+4=
X-Google-Smtp-Source: AGHT+IFkSs+BFMZkK/X6EAkUmwIyMPu/FcBsDElxRS2kmwraWkSpbAYx6zSlpvdYGXyQFuL5buv7Pw==
X-Received: by 2002:a17:902:6b41:b0:1cc:32df:40e7 with SMTP id g1-20020a1709026b4100b001cc32df40e7mr20277808plt.66.1701322322550;
        Wed, 29 Nov 2023 21:32:02 -0800 (PST)
Received: from localhost.localdomain ([49.205.245.83])
        by smtp.gmail.com with ESMTPSA id t5-20020a170902a5c500b001cfad1a60cesm336330plq.137.2023.11.29.21.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 21:32:01 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] arm64: dts: amlogic: Used onboard usb hub reset on odroid n2
Date: Thu, 30 Nov 2023 11:01:27 +0530
Message-ID: <20231130053130.21966-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130053130.21966-1-linux.amoon@gmail.com>
References: <20231130053130.21966-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_213206_421821_6C69DF83 
X-CRM114-Status: GOOD (  16.71  )
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

On Odroid n2/n2+ previously use gpio-hog to reset the usb hub,
switch to used on-board usb hub reset to enable the usb hub
and enable power to hub.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++++++++-------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 91c9769fda20..9e671444eca6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -31,6 +31,30 @@ hub_5v: regulator-hub_5v {
 		enable-active-high;
 	};
 
+	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
+	usb-hub {
+		dr_mode = "host";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* 2.0 hub on port 1 */
+		hub_2_0: hub@1 {
+			compatible = "usb5e3,610";
+			reg = <1>;
+			peer-hub = <&hub_3_0>;
+			vdd-supply = <&usb_pwr_en>;
+		};
+
+		/* 3.0 hub on port 4 */
+		hub_3_0: hub@2 {
+			compatible = "usb5e3,620";
+			reg = <2>;
+			peer-hub = <&hub_2_0>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&vcc_5v>;
+		};
+	};
+
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "ODROID-N2";
@@ -234,18 +258,6 @@ &gpio {
 		"PIN_3",  /* GPIOX_17 */
 		"PIN_5",  /* GPIOX_18 */
 		"PIN_36"; /* GPIOX_19 */
-	/*
-	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	usb-hub-hog {
-		gpio-hog;
-		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
 };
 
 &i2c3 {
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
