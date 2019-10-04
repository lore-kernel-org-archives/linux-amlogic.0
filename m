Return-Path: <SRS0=++Ji=X5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87282C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:02:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50AC7206C0
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VnUdj4RO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BSv5Bycm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50AC7206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4jo055EYHZbno7y8u8Dgk03vWgcGojZ03L4Xn27fd5E=; b=VnUdj4ROZrx4467lobM++P3D7J
	SiPIpF4zUC2EjDdoObTDwadZBYIb40u8FvZRxzMu4O6DqFv2KWDkIFN1Ut3PavM+9mXlk3FIAgOSa
	4i4qu7VHXG6fy2G9mW5YKLC5Dn3f3Bou1DTyXD8Esr/QMUIWnfsVn5LCBERmibbtPaVtqRBqkQ125
	yDJY2Pyv/2throMbRNkSFqwWc9PFxsJQdGm8U5GDZ8bWEzkFvfthaZazB49qQP/AZsVvR8xcFMme3
	08lm/dP1KBCnbA87scmJos7+AxAuEkAGEwOAMukJgTyfYawuXvzC+AxSgtuoUqoD12AXjJWtZUpMt
	yox009ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGJTj-0001gT-Vd; Fri, 04 Oct 2019 09:02:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGJSl-0000hj-0S
 for linux-amlogic@lists.infradead.org; Fri, 04 Oct 2019 09:01:25 +0000
Received: by mail-wm1-x343.google.com with SMTP id r17so9090997wme.0
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Oct 2019 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gKlncKkeKiOPhKAIhttqbr6HYS2dTyRQP+4Baa5xLmI=;
 b=BSv5Bycmn4XtgAhc6+7VYH4IbEvzSwbW2t+hZmS2GoP+VLplDuZF103AwDwHjtjW4V
 q4gJrMYJPkkiFHyNjhp/zm0QuBXfOMO5PaXUJhdIy6XUuxufRovFlvp2C59lEyXSuvcw
 Kd29tObmyi6qJDb17C09EvX7ko4jurraqABZsn16WrjpHBkZXTUL3PhTE7A3JnDzBVdc
 fLZi1uUHFLh7oLJHx3RB87oPPEUtd4gPkmF/WB6hHoKv97bLTJE3UuqZiQmAH9Q4sDeC
 t1nRvr7AZnpwjKwqB4XY1L3eX9sLtponVvNE2z2Td6P1RqQGnYNQcDR4wu2joV7BI4IQ
 scKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gKlncKkeKiOPhKAIhttqbr6HYS2dTyRQP+4Baa5xLmI=;
 b=GQG5eabqXk4mOrCVC87pkCwsP6BfnBXHbexx0NUvptVkSzVToIr+XKtNfTuzAW9lUi
 KcF9vUdKc+5tOaI3n/6G8r5sxOnFJ/J/W8PMYu7MDlmgkxvnNtuIcfGJTJ+A15ItV26O
 av/nbPU8bQbE30k71JxZZgOqrDX7/qToIFitiJmrjq3nGNxUjLYw3rAOZxwjGLWCJFsJ
 2RfkA+BvmPn3Vt7FzksJD+fJdBKxe0CuUS+UMABSSrv0Aex2uv5THlEFrcU3kba0VNHo
 WOvPj4aERVhZNASlXpcRDU8JYwk1igAlsTio5yz70ms4TNmmcDcUVkBbStlezJMc/1XB
 5/4A==
X-Gm-Message-State: APjAAAW+vzSQNMX7iy1KHei9EDIx8I/xPtze1QwYre5rlT18Fpjt6UZa
 mVgtQKV7kDXS9Yb9HBC/Prh4LA==
X-Google-Smtp-Source: APXvYqx8aNzo3ZYZjTc1LIfBgqGsmtdQFK4IhoYvZX3PB6pFJxFE5P7+1MnQrQAZfG0vVA7IaIiSbA==
X-Received: by 2002:a1c:a8d8:: with SMTP id r207mr9701863wme.135.1570179681779; 
 Fri, 04 Oct 2019 02:01:21 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v8sm7765170wra.79.2019.10.04.02.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 02:01:21 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v7 4/7] arm64: dts: meson: g12: Add minimal thermal zone
Date: Fri,  4 Oct 2019 11:01:11 +0200
Message-Id: <20191004090114.30694-5-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004090114.30694-1-glaroque@baylibre.com>
References: <20191004090114.30694-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_020123_113273_1B9494DC 
X-CRM114-Status: GOOD (  10.00  )
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

Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0660d9ef6a86..a98c16e163c2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
 #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -94,6 +95,61 @@
 		#size-cells = <2>;
 		ranges;
 
+		thermal-zones {
+			cpu_thermal: cpu-thermal {
+				polling-delay = <1000>;
+				polling-delay-passive = <100>;
+				thermal-sensors = <&cpu_temp>;
+
+				trips {
+					cpu_passive: cpu-passive {
+						temperature = <85000>; /* millicelsius */
+						hysteresis = <2000>; /* millicelsius */
+						type = "passive";
+					};
+
+					cpu_hot: cpu-hot {
+						temperature = <95000>; /* millicelsius */
+						hysteresis = <2000>; /* millicelsius */
+						type = "hot";
+					};
+
+					cpu_critical: cpu-critical {
+						temperature = <110000>; /* millicelsius */
+						hysteresis = <2000>; /* millicelsius */
+						type = "critical";
+					};
+				};
+			};
+
+			ddr_thermal: ddr-thermal {
+				polling-delay = <1000>;
+				polling-delay-passive = <100>;
+				thermal-sensors = <&ddr_temp>;
+
+				trips {
+					ddr_passive: ddr-passive {
+						temperature = <85000>; /* millicelsius */
+						hysteresis = <2000>; /* millicelsius */
+						type = "passive";
+					};
+
+					ddr_critical: ddr-critical {
+						temperature = <110000>; /* millicelsius */
+						hysteresis = <2000>; /* millicelsius */
+						type = "critical";
+					};
+				};
+
+				cooling-maps {
+					map {
+						trip = <&ddr_passive>;
+						cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					};
+				};
+			};
+		};
+
 		ethmac: ethernet@ff3f0000 {
 			compatible = "amlogic,meson-axg-dwmac",
 				     "snps,dwmac-3.70a",
@@ -2412,6 +2468,7 @@
 			assigned-clock-rates = <0>, /* Do Nothing */
 					       <800000000>,
 					       <0>; /* Do Nothing */
+			#cooling-cells = <2>;
 		};
 	};
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
