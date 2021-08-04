Return-Path: <SRS0=RlPG=M3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFE0C4338F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 14:04:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71D160F14
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 14:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D71D160F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PnnUZ3iq76cB7uTVCORowXdEndX1Z4ocFs8+VVgAIJI=; b=b2nn4YGYx8uGIY
	SZdVNG4ECQasILhT0NKpXtzDxd9NcYZNaRhiaevUB12leEV2n6SjuP3U3Ja8yVhypSmUHAmbNZZij
	pVhhZ7Cks9XniPV+Or54M/vLV+ITvWwyneK097FT9hJTPHt4gKQO/3zoQK3jGu4Ssv4nVFOdWTX3m
	+RmmssG/iUc1OmIsyLMeYmojucpi5Nvur7ZQkznMvtqiuQ88QIGrUSsim9tdaH2Z89BwoATUTT94I
	EU4uXwsgdL0/8mBmftWPRgqFhhnpiaNplVzk/3HtcdOA0BTue2PNbDUz7u65ZKi2clsgU2oVpjAYX
	nqzG9lTUghJGnBfUrUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHV6-006HOf-KY; Wed, 04 Aug 2021 14:04:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHU9-006H2o-1N; Wed, 04 Aug 2021 14:03:06 +0000
Received: by mail-wr1-x430.google.com with SMTP id m12so2359557wru.12;
 Wed, 04 Aug 2021 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=19plOpPW+WVmw0cGjj3q24slWnf3YHJuW1TftKQHmww=;
 b=FDUQYip0F00orvtkAkIcR8qVk3zv/e3ZQ5O0oxkQ72xrb2I84rrvuEftw3nY8nyu8I
 n4kmGGki9xlL4IqZZC2CXDbb1X1f0teTyHkAH+pbrxXkeNu0DMild6XLdq4QvT+vbQxO
 u2gsNHlCQU6i6o6b7/PXHu9dxM3JovsXf6zAoC3UGJx82OHEHLEn5Tbsz333HhuWf1rW
 eRZGk6qsgJ5FrAhZnGK10g9hUnWyxoidZ8sgnhHzMqixSaDndmpgq9DIpVHidSOstYL4
 VILszrfoqM1wIa3bwB/Vi/rEocfZh2eTWAYDz0/R2QiLZ7ruV68242mLf+Ptufrm9Buc
 09qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=19plOpPW+WVmw0cGjj3q24slWnf3YHJuW1TftKQHmww=;
 b=hRcLF+YAyCZAieDnbKt4g5/vsa5ofrOWFGatg3yAe76Yt2HDrKaI/747wl45NLipIA
 XmMXDlSJ3EVFULFhk9a7Pb024hHaS+qwupGKQ1gu+/PSwbrHHBdVgSZnzEJ55nKNHIRe
 tIhVRZ07WTn442phB8++W/VyH5rQF/u/q+UWI3zWs89iBa5cJHEsrcpuLzEPRmsOaAqB
 C7TpdIK6K2Cv1tGjMf0zecfyvNXLhy0zN2Tivf1Ir+tf0nZWhJrytecosY3SQoxm/oRt
 dQ6r3aWgYTgsb1mxZWoGMPnkOHeh+M3bXDGjgj5+SWGl504x7GCAsr09CVfbKuskSGoe
 uwjg==
X-Gm-Message-State: AOAM531Yb7cJpj5H2aozLkq4lrrscRV5h/72p/XiAENKWbezzLr4gBX4
 H8TiMQTZqDAEcRNLDIedkiODMsHuSqyx0ZVE
X-Google-Smtp-Source: ABdhPJzrgSNIUtASBt18jfFqj4fSRQ5BFiwT4yllI7pX4XWLIC3af4Re6vBNJy6vUhU0ie7Hqhmc3w==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr28634456wrv.329.1628085782448; 
 Wed, 04 Aug 2021 07:03:02 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id f5sm2752654wrs.5.2021.08.04.07.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:03:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] arm64: dts: meson: add audio playback to vega-s95 dtsi
Date: Wed,  4 Aug 2021 14:02:58 +0000
Message-Id: <20210804140258.4666-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_070305_136120_940627E3 
X-CRM114-Status: GOOD (  11.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial support limited to HDMI i2s and SPDIF (LPCM).

Tested-by: Oleg Ivanov <150balbes@yandex.ru>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 9b0b81f191f1..66daf3af34c3 100644
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
+		model = "VEGA-S95";
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
