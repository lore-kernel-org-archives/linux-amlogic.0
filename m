Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFB1C433E5
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E63920724
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QcknrGJc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neHTgbqf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E63920724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y17kKEVlBSrZBxTR0WFjnwVod5LtYPPsA2ZKDMxR+Ps=; b=QcknrGJc8kE2ZhQq4ksALLi1za
	QA0POQrjZVOdEf1TJLQ6C8O4aSJYOJfDLZEIs3zr5np9MioEm6bbZhFYgViEqsehVBJU5eQdLzzVE
	PNmi4P6pbH8Gz0ojsE+1ahh4UqE1l/XH51qNw97p3Kb9slJ36AK7LzGabe7DtR4ttljY/y5rEDqil
	l2IFPB6yXqxbiNYk2l90y5o1QIq3Su/iTWTpRrVWHLLf28kqbhsvCtSQAz+R30xzFD+B/va7Ft/5W
	bz50TtDEmwFlngyZSYsxAcW02CufNpX9kdsYkbJzBjKDptwLIb92oTPymAxZieEmzJN0RWr28JNTH
	Q5hcLP7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgoP-0001lM-PZ; Sat, 18 Jul 2020 06:59:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnI-0001Gj-Js; Sat, 18 Jul 2020 06:58:01 +0000
Received: by mail-wr1-x441.google.com with SMTP id z13so13242572wrw.5;
 Fri, 17 Jul 2020 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3IIVS7MhfURH0UVnp76zcUfKlv8hfdezuu29h1qTO9Q=;
 b=neHTgbqfGpClsL0gQHB67RRXau6lnk7fbLn9xgBy3PbSToJl1m5N4Z3HP05r7yFwiv
 +FPXZgtCdnDtY/9lx51m4vVBJXvPhBj9W/BUsnDRCHVm1a3dTNtVViXysW2aL/uHorYp
 6mJSJyfgpxfwbkRUVvnUPAzQDzrflpv73pXKg9R5Vtuiv6g42DRzxw5e0X1HmesTM+4O
 J988NtRNnW+ea1shLNC9e0xMmIR2aTPnNKT5pfZh8vKZ4cRVK0Yp0PNs1nL/ZcyIzbru
 aAiIwppV2XgbKPm71NusWFxxSPUFSYM5XBt/iEYcS2JHd5/AICUVeQVMGsn8LVFhhyAp
 9t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3IIVS7MhfURH0UVnp76zcUfKlv8hfdezuu29h1qTO9Q=;
 b=Jf8GHbluQ1zgsMz+xsB68Fld+k1KHaQrxmJzHBDy5dbAR9rJSqgwIkU+osvJLQ3MPn
 y5+hnRNh3Nrki/PVBXXPeT6FzdUyxYPPsrh0mip7j1wgQWUU65rjsin41Tf2+0A4SIDq
 zBpkXhqUEOz91rwPw+z0SreqZ5u8Zjd7b6Qm25zmXtcyonRNILJTmUxG7baqXgjbjfKC
 rW3PhmcL3kjullkknFj+LRAdOnIi1s1Nubs/qCkEPK76vFTuZ/MPkXXx/FjybwbQzxOY
 wu0MHsFJevbCA0WFJ+6PfJWHgjGJbqvSBCV1DmwL2L2upnfmJg/Xv2ttJoipFqiXLSzT
 UnPg==
X-Gm-Message-State: AOAM531U5Zqweg8mAQ35ETmqHcPY4uRvSRfrCk4WV2w1vp4dW6wHcnv5
 b8vbwr8wO0QD4/k4kZBpTBs=
X-Google-Smtp-Source: ABdhPJxENi3dgreYnZ/rBF9Fp1/H2p/cBJM+q9VtdrscIG6c3xfl5obsf4gBCK3S/TGY2xHmPM4rsA==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr643263wru.372.1595055479486;
 Fri, 17 Jul 2020 23:57:59 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:57:59 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] arm64: dts: meson: add audio playback to p200
Date: Sat, 18 Jul 2020 06:57:34 +0000
Message-Id: <20200718065739.7802-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025800_739447_9A2A4449 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial support limited to HDMI i2s and SPDIF (LPCM).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-p200.dts      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index 3c93d1898b40..a16dac72600d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -9,11 +9,19 @@
 
 #include "meson-gxbb-p20x.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "amlogic,p200", "amlogic,meson-gxbb";
 	model = "Amlogic Meson GXBB P200 Development Board";
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	avdd18_usb_adc: regulator-avdd18_usb_adc {
 		compatible = "regulator-fixed";
 		regulator-name = "AVDD18_USB_ADC";
@@ -57,6 +65,59 @@
 			press-threshold-microvolt = <0>; /* 0% */
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-P200";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
+
+		dai-link-4 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
+	pinctrl-0 = <&spdif_out_y_pins>;
+	pinctrl-names = "default";
 };
 
 &ethmac {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
