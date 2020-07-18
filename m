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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391F4C433EB
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0685C20724
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yiTlBw4P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9DFora6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0685C20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i54K2S3tlbFoVJUQdVSuVkFBvnG+TtHSHamLti3iuB4=; b=yiTlBw4PvFAkyHRt4N069c67dG
	BZKII/Zp6TY/iVZ8eMUWEWjF+DE23rGxA3/OtQ8NhMUagHe4AElEx8YiMaglLXIA4hcaIUktoxBR8
	NzkaWQntApMi1f1bpdCY3/M/B5ec8jWGKoBZuJM8te43Imsv2g/Z+BYzasDDTGgjqqJCAW8kpCc2L
	vm49/PXwTEAgAwbf5eF5vffCsK6b9oWHIE6IZBetJ9Y/tjXM/Igisdm7TWYWIkPclMwAZuJdK2gMi
	1eh1Y32z0pmO6Pt9dfZzsqXK2jq5X0pBje2Rm/zEIzncT5dJMaF62t4lS0UtOKYCWKHn6rUM4KDyI
	kwl2KfiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgp5-0002Dy-H2; Sat, 18 Jul 2020 06:59:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnO-0001Jz-Ux; Sat, 18 Jul 2020 06:58:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id r12so13145230wrj.13;
 Fri, 17 Jul 2020 23:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lDvI8JDwLjhA5jkV3AvGA6unyQL/mwAeBeK74iYRYOY=;
 b=X9DFora6PLpolmzde1+vkKm3Xlx6DbggTZ8o5nYtKAcsql3ir4ARZbrW5AXMiiVh/7
 uNzvMs80abrDTsEUYxESMVCllcUNylfduzeov5At5F+Da3Ae9Ba8WCM2aDxASsuJ8tmS
 sLhQirwBv7zQNOr6BeXP3d/P3IoC04FDVPpaejfmil0JvtN+meoWIgvW1XYkx0psjJE7
 sByosWshlP7xaCM61yHkVwrnblJ9Qg12lEfa6j4KxFR7Lu6uNBlpZGEc0hc8AAI5Y5Tt
 EaiqcVJGLM00+JfEvbrP8ZO0myGISuv0Qy1Wi8Mx03RRO8jmJxVrZWNM692L0SLnLo1A
 HBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lDvI8JDwLjhA5jkV3AvGA6unyQL/mwAeBeK74iYRYOY=;
 b=KzqUFwZD/006c/wnJeEECKtJVwx4T5kBGT9xT+tKwYGux4kf6NZv8Hlm1hK1+oJMYi
 vI/l8PRQ8mzkvw7pVn/jdrj0G6eJ33PcgMG0VM2+cILCzVN/y+guoGYgXc2YXPnzq7Sw
 8h4G86RD9BRwg/I3XGD/XB78wxDrWvWaCkAQqhLY3ESxHSR5JyvTDel2Z3lpoZUDyEk3
 8NDvjJG74q+Rvj1gEDhuCjKnkKb/b6uenbiHW0ys4uDSQt2INoWLtr58jTIlQhaXe0rY
 r44vUP/h0bEP2mWwtppM42+1Zq9WYPJNI7f7KIygUYOCKze20UqtztNRTHYXY4l/tijG
 szrQ==
X-Gm-Message-State: AOAM530t30KMLFZM1MXtOpUCqDL8lkYm989XMrT3hnB2zfGhh/6iOyn4
 p9K0vjxgeYth9WCZZVQCv68=
X-Google-Smtp-Source: ABdhPJwwBSyTTXbuFejDMCxNajPVQD1NVbIaGwfvqV05fGed1WqCOEHAb9iviWWS+Z+yQV1jb0vUjA==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr14660567wrq.56.1595055486100; 
 Fri, 17 Jul 2020 23:58:06 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:58:05 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] arm64: dts: meson: add audio playback to vega-s95 dtsi
Date: Sat, 18 Jul 2020 06:57:37 +0000
Message-Id: <20200718065739.7802-11-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025807_099963_6A1C5161 
X-CRM114-Status: GOOD (  10.42  )
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
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 222ee8069cfa..1300585a1ec7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "meson-gxbb.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "tronsmart,vega-s95", "amlogic,meson-gxbb";
@@ -17,6 +18,13 @@
 		stdout-path = "serial0:115200n8";
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
 
@@ -97,6 +105,59 @@
 		clocks = <&wifi32k>;
 		clock-names = "ext_clock";
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-VEGA-S95";
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
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
