Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4108C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Oct 2022 19:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/160i1xcfNZE0gPQsJtuWN/QA1GQcpX3xvcEswh3lm4=; b=1+7j3VsWhxKcB8
	DZd/0AXPhPntTZ2oRS9h+JsUkl4WgtBrbwUFdy0MTQrL8ggi+8XLQlFtDDhtmx04B51Y9/muedyZ0
	FpK7eD2UEQ2n2IStmWtcQ9fCgCUv6z/SAxa0Bllab6zRROivjgS0qy5XOWS30XnLmhMkDU8kVgW97
	KK6DTXG6ecEpJXYZwMAbvwWBV0VjUobhOo6QukMu3QWrBmimLzsojwnQr9tvgISWxV/xaFGFw/Qjj
	GJZ3PcEjeItuX7l5A8gv/eDz2ZTNAz260vTr4aRp+k+uV3cQXMYMu+ZlsQzZrnHyM68Xdof0fVTs1
	74DjXsGZPJq+uPC5cVdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okseQ-00AHdv-NN; Tue, 18 Oct 2022 19:53:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okseG-00AHcE-NP; Tue, 18 Oct 2022 19:53:14 +0000
Received: by mail-pj1-x102a.google.com with SMTP id h12so15062316pjk.0;
        Tue, 18 Oct 2022 12:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Decn228I23NeLLtliUyA2wHQT/chAyjBvAFPep29TTY=;
        b=gPXw0e5DdOSjS6vUUvJpAJ25al5FdM+3bpuoFbiQViQvegio6bFFg4zi3gRrQqc8QI
         uNd1nwd6fspz6ZrvMd2DvKYPo7yuPe3pPbz1xvMikstoqaxGPr67o75E0KE0VA4orT55
         4KSz4FB75Q3BlufHKu3D58LBG/Gm/tF83H5lUxzVtDjyPNT0WZAaYZ5z1XV/djSnR9/7
         p0p7hcIk2ESbzkY1StAXf9RLw+rFJcE3n9Y/TL4rwvQ2syZxXXtVvylM4HhP165eEpYy
         3R6v4priW798+Ub3UG0W+hb7YrtEuAqx9pfhkT1JsKwwgTZJeGxJJu59xbITIrYevMDO
         Z2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Decn228I23NeLLtliUyA2wHQT/chAyjBvAFPep29TTY=;
        b=RJJdxwA43lUyJmt2mlmOoCjTmMLuK7QuCqRwfJuogo+UyX+T1I5sNjA6Cy/8D4KL3S
         hxt4PlFd86gM7QvvYkdxcWnq0NfdYRZbu44U1FyQBUsY/+mx7EZxvW2XM/Sfm5t9xVpM
         8an+uTSKUDVFkcLNx7i8hM6aCOEMZ8eS9jW8RQAmxogLsQ+GU1pLQcMvE79IUuJy3Z/H
         sai3PJEuhnZItJVXEYn7FU3rDOpzHJ6+PGKQQgeyUG/X0Ph05+AD3o3ByyYuFnkVpOnI
         WfPiWewP6uztV4cD2Cvz+nqNDRpO217YxM6magrdW7CHKEsfV8IN7RS03NvCaqlA2Gs5
         Y3Xw==
X-Gm-Message-State: ACrzQf1Avrr3JVd7CrYW5hXyQGCJU8U/NxcNW3iuHMsjQ69CezOuZtZm
	FcioOotCYWVTMjlnhZW/GtbyfOtvIJo=
X-Google-Smtp-Source: AMsMyM4052ls7BSb0cFjir+Iyuqwp7lSrhnhy4HuHtKCGVeTeGzapD1MCYEa5WwiM98xw7FSZwedAQ==
X-Received: by 2002:a17:902:8491:b0:183:c3d2:2112 with SMTP id c17-20020a170902849100b00183c3d22112mr4773643plo.133.1666122789257;
        Tue, 18 Oct 2022 12:53:09 -0700 (PDT)
Received: from localhost.localdomain ([103.51.72.20])
        by smtp.gmail.com with ESMTPSA id t25-20020aa79479000000b0056126b79072sm9666063pfq.21.2022.10.18.12.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 12:53:08 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on Odroid N2/N2+
Date: Tue, 18 Oct 2022 19:51:19 +0000
Message-Id: <20221018195122.8877-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_125312_797367_6C02ABD0 
X-CRM114-Status: GOOD (  11.91  )
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

Odroid N2/N2+ support active cooling via gpio-fan controller.
Add fan controls and tip point for cpu and ddr thermal sensor
on this boards.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index fd3fa82e4c33..e61a4285a910 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -39,6 +39,14 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
 	};
 
+	fan: gpio-fan {
+		compatible = "gpio-fan";
+		gpios = <&gpio_ao GPIOAO_10 GPIO_ACTIVE_HIGH>;
+		/* Using Dummy Speed */
+		gpio-fan,speed-map = <0 0>, <1 1>;
+		#cooling-cells = <2>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -410,6 +418,40 @@ &cpu103 {
 	clock-latency = <50000>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_active: cpu-active {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&ddr_thermal {
+	trips {
+		ddr_active: cpu-active {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&ddr_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */

base-commit: aae703b02f92bde9264366c545e87cec451de471
-- 
2.38.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
