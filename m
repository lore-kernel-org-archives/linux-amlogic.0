Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46F6C31E40
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 13:06:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A987E20B1F
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 13:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f9/d2EhC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EHYBOLpk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A987E20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HMRqTC2GWbX+ceK3iN1WyUE1dUynK+QzLM3MpvABFEE=; b=f9/d2EhCMCFKFRp98X6/Hba1XO
	SnUU2SLjZCV+SHpxRvpY+IP/7+IX7+KmKtyLa/pyboORqyrzPg6rJ47c72mzVNQX9+O0antRc2XUm
	cwOZlSG0huHc+tk3d+nNNaLo4mhNqgpL5GElMiu8TBqNFhtnvNfp/5jP8wqQjVsHiOf9cP3KTJbC1
	wR2XfknRzN0PAL9F3HavPbeq34ulbYi2NH/0EC6b7JTzMn7OP0ewwdZuMndLnVsOR9QGVOT6zQxcJ
	/yGEt2vcF+XISpifSFRVrSGOydr9SCFm75Le6Xun3B/1agI719aFUEGYOFxFb7CW1eAv1/vlUcMzK
	Ugz/cn2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huzAq-0001ol-6U; Tue, 06 Aug 2019 13:06:44 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huz9R-0000N7-0o
 for linux-amlogic@lists.infradead.org; Tue, 06 Aug 2019 13:05:21 +0000
Received: by mail-wm1-x343.google.com with SMTP id v15so78143489wml.0
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2019 06:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NiNSwC1w2DwV9CwHEjfRSuQJOciTaxfr2h0JNT+7juw=;
 b=EHYBOLpk8xSLXE7FKn355BKQ13vlwR3ZCnaAz2IWUt2g774DsjpBHoAvqYsqxZVOj4
 XnyXkJ/j3iP23NR0X3Ig5azD/6rscihQu1z4WOmce8usRaz08Bt5oK85tXW8De/oz3uE
 ccZ0Nts615RF+Dvq4909tk5blSKQcmZ0uzvQx5j0vUPCoePCSuRx+ndSQwLFwBLu1rYq
 GGyMuOLy3R4GFzLQ6XwVvAeOJylpXu1dAkcxzIaUpdb9KLRpsWf160lCqdc8o/rOGqlM
 VxePBUUjgTgb1PaIEXmhhX0zRciOVg0R5nyHXACCFOJdkqJ089au+RQxnDteKiG9WzOB
 v2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NiNSwC1w2DwV9CwHEjfRSuQJOciTaxfr2h0JNT+7juw=;
 b=CLudUHLolnLIFp3WUrOHSEjlVH+BNBiITSSlqpgmGUB2ww1oDT7oY17WbP5+1EfFN9
 guQAD7wHnXRRUDlSJXBWFlu+SNtwqfLLFuXVqt/Ne+xH0BTApFobOhFAaLxlJiDF+OC2
 9q+DwuNrcuc0Wj5bCQWCd/bSx/Gb7xja4MgCdyz07mO73WxaiVE0BC3SlOIapGGfBC5k
 asRBQArR/NvU1Tfb4fnut0ZLeCIGgV3Ti9UzM7KqBVeSW2Z+/7jZi6JKs0DWakHcXX3A
 C5rJhnyru3SUIPMRTlchIR5L2fYkvGbxazIfO5Loi68KGvHD1JJyyYKXf3PejAVAh+ud
 QHPw==
X-Gm-Message-State: APjAAAXleOeIdwu23/WgteL68ZuPLrCU+9MASccKl62CApPo9yYs4t7c
 kupPS0uE3PQNLVvB8exkGE5tVA==
X-Google-Smtp-Source: APXvYqypJpfP+/e201HN/T1eYuG4Bi9Q5B29Pi4H41CfmpjOXTeOpKGfzyFQw5yv78N7W36Wh6yuoQ==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr4635611wmk.99.1565096715772; 
 Tue, 06 Aug 2019 06:05:15 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j33sm201888738wre.42.2019.08.06.06.05.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 06:05:15 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: daniel.lezcano@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v3 5/6] arm64: dts: amlogic: odroid-n2: add minimal thermal
 zone
Date: Tue,  6 Aug 2019 15:05:05 +0200
Message-Id: <20190806130506.8753-6-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806130506.8753-1-glaroque@baylibre.com>
References: <20190806130506.8753-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_060517_090320_F9DBC033 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add minimal thermal zone for two temperature sensor
One is located close to the DDR and the other one is
located close to the PLLs (between the CPU and GPU)

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 75ff8a7e373d..a7d73c0c8447 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	compatible = "hardkernel,odroid-n2", "amlogic,g12b";
@@ -20,6 +21,55 @@
 		ethernet0 = &ethmac;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&cpu_temp>;
+
+			trips {
+				cpu_critical: cpu-critical {
+					temperature = <110000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&cpu_critical>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		ddr-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&ddr_temp>;
+
+			trips {
+				ddr_critical: ddr-critical {
+					temperature = <110000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&ddr_critical>;
+					cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -288,6 +338,7 @@
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
 	clock-latency = <50000>;
+	#cooling-cells = <2>;
 };
 
 &cpu1 {
@@ -295,6 +346,7 @@
 	operating-points-v2 = <&cpu_opp_table_0>;
 	clocks = <&clkc CLKID_CPU_CLK>;
 	clock-latency = <50000>;
+	#cooling-cells = <2>;
 };
 
 &cpu100 {
@@ -302,6 +354,7 @@
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
 	clock-latency = <50000>;
+	#cooling-cells = <2>;
 };
 
 &cpu101 {
@@ -309,6 +362,7 @@
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
 	clock-latency = <50000>;
+	#cooling-cells = <2>;
 };
 
 &cpu102 {
@@ -316,6 +370,7 @@
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
 	clock-latency = <50000>;
+	#cooling-cells = <2>;
 };
 
 &cpu103 {
@@ -323,6 +378,7 @@
 	operating-points-v2 = <&cpub_opp_table_1>;
 	clocks = <&clkc CLKID_CPUB_CLK>;
 	clock-latency = <50000>;
+	#cooling-cells = <2>;
 };
 
 &ext_mdio {
@@ -377,6 +433,10 @@
 	};
 };
 
+&mali {
+	#cooling-cells = <2>;
+};
+
 &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
