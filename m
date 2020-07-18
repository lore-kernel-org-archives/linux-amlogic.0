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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B723C433F2
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:00:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF443207FB
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iaOqyN2h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIvb2Ngq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF443207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcjfQuuwiReBH6s/3z25BikQQoUPjwPNQI7YR/3cFHs=; b=iaOqyN2hSkYcWZCaStD+bt6Z47
	itiZ70sUm8bWWhoqSJPyASr0zT+uSrWXRql7AjJIQtv19dmZZBQFT9T9GCxVzGBUDFqFesVOKpaH6
	72zgCCZV4ICEe37VGnA6VqVbEhwh/rvIRtvHDUcryYiNVfydsN22f7oNxPSIr8NOpH9kwlQHOb74S
	0UlsOI1dBif++26M0wHTEbo2A5/NcAadAi1f/M0z61eNA1CUE1bBkABAYgGh/XAeHpr+UrvlEfpPf
	VCprqkvQ8FKj0eedvqdxS+EQKWwTp4Ma1dZ79ZbpUvIufbKtiFMGd2aKYTm0pxs0KDhtTkMUlI2rP
	BYA71idQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgpK-0002PM-UF; Sat, 18 Jul 2020 07:00:07 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnT-0001M1-Fb; Sat, 18 Jul 2020 06:58:13 +0000
Received: by mail-wr1-x443.google.com with SMTP id s10so13187033wrw.12;
 Fri, 17 Jul 2020 23:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1gIivsKhrs5B4E2eM/SXdSVH3UTq3Ox3b3pPitMs8zM=;
 b=JIvb2Ngqnjk847TFxnaUZHKhchB8YfVtdu/CTHONMKczeOW8Le0mBfXZDoBYduxujB
 lTAIwDhYvrjH+Um9LwOxUH5mkHPSGWYRULG0+9+2mucvkp/5p/mdmhaJOHBcrvqNKMSZ
 xmIFrQEAA/FMLCGEZpQLUvRZrp+Jtslprw1QlZ+mHzVcit9c+ecHYD6BCHXBxImZALwy
 m6Iw7MCdMPUbaiyNAiGRvKoqKA+FZkanTdd+/KbTTRp8v2fspqCYTYBa3Jp6ijLCZYJk
 eFtr3EttuKnBPd7OvYPdQZ51rWiu+uIOxN9Mn2XNmiNgGX0OczdUmeNp2GYZsmHMcvis
 cVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1gIivsKhrs5B4E2eM/SXdSVH3UTq3Ox3b3pPitMs8zM=;
 b=fSIW6gubkVXA+1xplagOxz5viS2ZwjX6m9rPsZa2LDikx3sF9eDk2FEIn2MnTNgmzb
 G6u8P4K2i7iY343fJFqlgKHshn0+KJQh+C4LWJURiY07zrZt8AApBIlzI3TbMew4Yx5l
 K3aArVWfBKxsXA7FUoEKMkFKrEmvY9f7XmVr0iRvpjMzRBKGjIlHWU2SNvv1aLsARTfn
 vPLPDJXCZUClmn4+ayHEf6CNmkJkwyiYdq1v073aSyxyV4BAzoXSIUhQw10mxUyyNWKi
 OgvWmMCmHeIshCOhOLRNxZgCIOVOIMvUbLE+UspgNH3Bm4TNdfsbYj9wyqiLz4313bMe
 FVLA==
X-Gm-Message-State: AOAM533Cap6OpWvMPVkJwIk7/B1qlbRBL7Vg2PowpgDZ+SF8ZDH8Lumc
 ITHI6vtoiBniR4lnzGcRzNU=
X-Google-Smtp-Source: ABdhPJxEIE/fyCFRu3RRxgW1mThwfcZwyiNFLjxzNHyGDN6C7wSEse0IChWCM1AhE9sSWWyDdWzz3g==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr14399637wrv.394.1595055490357; 
 Fri, 17 Jul 2020 23:58:10 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:58:09 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] arm64: dts: meson: add audio playback to wetek-play2
Date: Sat, 18 Jul 2020 06:57:39 +0000
Message-Id: <20200718065739.7802-13-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025811_689919_6E0671E8 
X-CRM114-Status: GOOD (  11.06  )
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
 .../dts/amlogic/meson-gxbb-wetek-play2.dts    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
index 2ab8a3d10079..f2562c7de67c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
@@ -8,11 +8,19 @@
 
 #include "meson-gxbb-wetek.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "wetek,play2", "amlogic,meson-gxbb";
 	model = "WeTek Play 2";
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	leds {
 		led-wifi {
 			label = "wetek-play:wifi-status";
@@ -39,6 +47,59 @@
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-WETEK-PLAY2";
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
 
 &i2c_A {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
