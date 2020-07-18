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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CE4C433EA
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC9C20724
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GppDAxgs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpG1hof2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC9C20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XF/x14eEHa5vI1WUliBgKFZKFgvB3cOrh4bzOlH7im8=; b=GppDAxgsqFBCApvcDCsjeMqV2x
	gVs9+Upyj4g2ISCDio1K35ktGC6A4cClOr8PbJ1dRPAqpVPmGnk8SPIjAz9oqPLpp6J61xAdM+DYP
	wi9yzbCQ3naGURu5elpqjcMNFkzDrOM2PSwFaU5l0zOrRObPH3H/pqVtilZyZvsvrBSxP+BHprl1k
	+suUazWdzgh7Bvb0cSWP9fwH9xQ3lDGmpN/+GDS7nrRaPK6nmNkQqMcf9R0+VQuNE3xFhcWOmdmYX
	ypMh08PUi+olxRgBI9WKezpjwHTRUOS24qDyPk85QvYCInRkRMi0ZmpWkl8tQcQjz1appZCaQ/Qmi
	ID/B3Vkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgoj-0001zK-Ka; Sat, 18 Jul 2020 06:59:29 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnN-0001J0-8p; Sat, 18 Jul 2020 06:58:06 +0000
Received: by mail-wr1-x443.google.com with SMTP id z13so13242656wrw.5;
 Fri, 17 Jul 2020 23:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1ErSCHcHzIsW6dIDBmuhPbxBHo15N9XHrkYPsBItQXg=;
 b=NpG1hof2UuA8uOhIZVzRSzgmpKseK3rVcoP/nS6cW9E4Uvr3YzrvkNChzT88/F2/0O
 3hmuaJJGaQJ6qrop0qxOzYDQHwnb0Xof/TFogslwZzkdOVn2pmXBow8gw1gem49LckHK
 1bDvB92jF8nEMr2/DXjWm15V5idJx554gFcbWLqv9g6h4F+G3x3jm+qjxs4JQZhWS5dW
 QItDxeg34g1tdhtpEQn/79sxiDY3WZrSgAoqqDAAQ83QD6WyD17O6Pc/4GGOGLKrg1n2
 OvSjA/NXVf9O88oEWO6wT2/HeoRlmVgJaG/Var3r29EYmAXlGu+Ix8+Kz5sCeIOaQdMK
 bOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1ErSCHcHzIsW6dIDBmuhPbxBHo15N9XHrkYPsBItQXg=;
 b=D/d4OlZt7b271tzykSISi0IGgSW8jFP87Ep3sODVu32Jb3nKCeYRLmt/AqSAo75akF
 5eBfqH+oKgtaC9fUTijiMbudfNBFP8174B7n8J1J+lubyZmwMPZcRY9NmRIM0l2bT7pP
 OQAFquBvvGEO/j4SQFzERGvPP8n/nkmwMbVTC1Y9kCB1T5P/EKelbkiqckkSOmRIBZIC
 oRg8Gdod+VyfBkek1KPffpE2hAyM+0A7UM1S3y6ZRHSSVKpWEJDrB+G+xiRzgbStygoC
 M4omcLUw1zuLJhMPMx4DeZhxqenmcezwGvSJ1nKH5pgiysuR4rZVkbN08oCy4Nbrt93e
 kQXw==
X-Gm-Message-State: AOAM532QePSb8pECx+hEEidkNEuV+J8ZVe7Sg9241h34912Otxng+FbG
 2aQzxqVobJrTRHKkBdrQ9qE=
X-Google-Smtp-Source: ABdhPJwiBHU86HzVfaoGD0RkxLOOV9NbiNE/ASSoYy6mAhnB4uUbH9sHF3oqDPumKSV/KsiuT9Yy1Q==
X-Received: by 2002:adf:e850:: with SMTP id d16mr13997770wrn.426.1595055483838; 
 Fri, 17 Jul 2020 23:58:03 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:58:03 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] arm64: dts: meson: add audio playback to rbox-pro
Date: Sat, 18 Jul 2020 06:57:36 +0000
Message-Id: <20200718065739.7802-10-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025805_398764_FE77BD6D 
X-CRM114-Status: GOOD (  10.63  )
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
 .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index c89c9f846fb1..7b23b3da27ff 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -14,6 +14,7 @@
 /dts-v1/;
 
 #include "meson-gxm.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "kingnovel,r-box-pro", "amlogic,s912", "amlogic,meson-gxm";
@@ -33,6 +34,13 @@
 		reg = <0x0 0x0 0x0 0x80000000>; /* 2 GiB or 3 GiB */
 	};
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -51,6 +59,25 @@
 		};
 	};
 
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	hdmi_5v: regulator-hdmi-5v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "HDMI_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio GPIOH_3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
@@ -90,6 +117,59 @@
 		clocks = <&wifi32k>;
 		clock-names = "ext_clock";
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXM-RBOX-PRO";
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
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
 };
 
 &ethmac {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
