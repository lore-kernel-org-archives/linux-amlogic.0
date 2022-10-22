Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB246C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 08:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VBarnBXUG8DaWOAYNLDrdd8idazpkRXSi5mT3gg/mBw=; b=gyOsIS5zs8SR8C
	BuI3wBeFV0ZzI100FOUUQ5NkWaK5VFpWDJveOMDRhyU46LQYX6VeO55i/rk4SY+uYezVxqa4URxH/
	X0VdyJO74uICdMz3LzvkBjaaPdPM2TA+/RzBywqCy6zuq1lRr2y8ZD+2EaklZ/+jbfERzRWu9grMM
	JGRN+mvfQ/A+D+bbWJ9xkXDzQbz0Uj6d6vtPB7zOW4Zgbk1rmtqA7t/CQvxM6+koLFbhZ422Sfj9v
	TeXjYFYRO5PUiAha6ian5B5mGSSig03uE1Po4YyfGVONzlTtYmlowJ7A634e2Ow+JnaEvjOBUAIUX
	sMdUMbUJmy34ZRFG9scA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omAAv-00BpT4-Q1; Sat, 22 Oct 2022 08:48:13 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omAAk-00BpPv-5m; Sat, 22 Oct 2022 08:48:03 +0000
Received: by mail-pj1-x1036.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso4860689pjc.5;
        Sat, 22 Oct 2022 01:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=weLbIcCNbVsHr1aN9+oDZ9csZQvS2rrHQIhJrGtb3xY=;
        b=ZdhqrO8dUBRyrVmTSDjKjyupq7G+G+kVjVIz8irauY0guJaoETll1LdUIwOJfFCmca
         28S01QR1hirbxyJViBW5U55IuOHMiXihd13MpBdIxY7B9uiAdjW0forCbIFmKI7Asw7V
         uzFD6M8splAU+GsKCmBY698w85NEwWSoCb3iGYOsqoXJqPDq4V+GcD7Eocr5Bkl/MaOM
         XSd4lUBoTkHefZUb0fPxlv33g1X39czbIo96ELLbLAkq8vns6+faSvUS4XSCrDhHMr+Q
         1v10+vgpaCdGFQUvpqtf+xCqoHcgZ3El+k25SBSUfWmfNgJOR5EsUk+U9cSTfmEzxm8+
         ojRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weLbIcCNbVsHr1aN9+oDZ9csZQvS2rrHQIhJrGtb3xY=;
        b=DG2Zb2Zc42uOauDMf579ORx+jFN1EPKaNTt+7nghjBHxflfHMgEJUih4CEVlksD2u4
         1XCdozOUxFF2wAtOTjHkQ89T1MJm9ZlWJjVo5FAfTx6TE7BKyPyKBEdA7MYPLE/uMKmf
         P0WPRs3ft+Nk/x0RnQjB8TeodgE7288k7cqBbUUf0EBG9mmnu2EzrDNf/WskurIUrTno
         VTM66nqB2ed869DMtwqqJIHdxgqECjcZxQrJ5LfLRVgyeueyx3VdpYpuVV2IRnspFmCo
         C+YriydmQNZXZkJVjg+IoTGiLuTAI6959gQcEE/xDkD9iiPzQWlb1OsFLtCfgg4f2jdk
         CZvQ==
X-Gm-Message-State: ACrzQf1hYBqChoQbEgyanpLJus0VckiMUqQ6rjSO59Zl4bgO6v9Wgwsi
	/83CWZqEZBgdMp/S/eWm8oU=
X-Google-Smtp-Source: AMsMyM4r3OWLlX7+sUVn2cpmmJhUIG8Fv5DeOgSPiIFTH50CoR3FZs4S0oHgANqZ54uQexeSvhDVUw==
X-Received: by 2002:a17:902:e80a:b0:184:6043:752d with SMTP id u10-20020a170902e80a00b001846043752dmr23163056plg.137.1666428479543;
        Sat, 22 Oct 2022 01:47:59 -0700 (PDT)
Received: from localhost.localdomain ([103.51.72.20])
        by smtp.gmail.com with ESMTPSA id s5-20020a625e05000000b005631f2b9ba2sm16843911pfb.14.2022.10.22.01.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 01:47:58 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Dan Johansen <strit@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv3] arm64: dts: meson: Enable active coling using gpio-fan on Odroid N2/N2+
Date: Sat, 22 Oct 2022 08:47:34 +0000
Message-Id: <20221022084737.1028-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_014802_255114_728A5E36 
X-CRM114-Status: GOOD (  13.35  )
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
on this boards. Drop bias-disable from set pwm_ao_d_10 the pin
as to allow transition from say pull-up to pull-down for on/off
of the fan.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: changes tip name cpu-active --> ddr-active
v3: drop bias-disable for pwm_ao_d_10 pine.
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  1 -
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 45947c1031c4..10a09fe362fa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1982,7 +1982,6 @@ pwm_ao_d_10_pins: pwm-ao-d-10 {
 						mux {
 							groups = "pwm_ao_d_10";
 							function = "pwm_ao_d";
-							bias-disable;
 						};
 					};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index fd3fa82e4c33..667d2b774924 100644
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
+		ddr_active: ddr-active {
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

base-commit: 4da34b7d175dc99b8befebd69e96546c960d526c
-- 
2.38.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
