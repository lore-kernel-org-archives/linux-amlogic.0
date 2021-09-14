Return-Path: <SRS0=aLbU=OE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9DFC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Sep 2021 15:16:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F92560EE7
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Sep 2021 15:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F92560EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w1g0JRu/KIRKF9no9J1nsF8k0Skt0pfh14wObonJRoc=; b=rbVNG/qflHCT50
	Dyg2yRd7iJ9yrRYHoGlbWnd9O38sLL5/qp7r8OOox5QK/kjUHd3HcIHe4eJkkHFDC7y+Y+EWsTOQu
	uav4pcZ8NxoCGplJok8OrgdqNQonakSHZubf3cHPNv0kT5/ildBHig/uUfeHtUNehOykbvSuEAQv4
	W2MSKqD8IzjO/r+9IvwKODjAGHWKMwJQZOhUST8UkPDc424Il9wkdeN0VzeNnS1PRyCH+4vOpewnJ
	zRJmTBqWEv4zn5LRS4KotxG7kg+60TXpNGgJ9CMzE+lcyPnFznc0j2jy6ItZ2br9Erpi+ZWxpcrFA
	dGLZ1q08oD3lDqACi6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQAB2-006Bb5-RE; Tue, 14 Sep 2021 15:16:52 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQAAo-006BXv-6B; Tue, 14 Sep 2021 15:16:39 +0000
Received: by mail-ed1-x529.google.com with SMTP id z94so14283125ede.8;
 Tue, 14 Sep 2021 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=y4C7y9yJzTQudhCL/GHuZMtYngDM40ymN0HTRwvsckQ=;
 b=iAVdVA2EgO9QsXTzpLndE0Po4h/y/qQrRmQfUiLtKaar7C2wTdegTmqF7Nu+TysdKp
 5BAqiDSPftJYqaKPWzzGkWDgHfvj/and+2n6wpJlZ4zIoIvdDXUbiP8jul2L9Ofj3kQy
 tSxR2zWKZ0QWEXIZA5mEuSKwcktjF++SnMQTwqD9an+7rgCUBrWnj0CTFMMGzKLqoocF
 lPZqSQ23U/MlVvR5AetSppaPTUIQ0R+WMJ/DFLnqCAODCccVRrAnncsLPG0AI0Eu/M5M
 CX2CeUXsbl+DObJdSGvA0OUWDHnFYFsl3CgbNGTHULTrMBYp8uOfw9Z0ZWw3k9rx2b3A
 4qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=y4C7y9yJzTQudhCL/GHuZMtYngDM40ymN0HTRwvsckQ=;
 b=t4mAO+Tv+KV95o1ze80yhkvgDl9siMtH7PMQ6yFuXAH1E5kWa4mw0+WHa/IFwkFJQi
 FHxXj3boKePEfhsDTmG5q/q5Up4UCobEtm5hALQ9a1U8NHu04TYVrXK64uZJdi/bqG92
 7Xm6waT4soSVd4gCGZ7p58T+lmeQUOVEnnOAy8p1oZVfZoeqD2zGtPl3TRf66QJQxiYs
 mZn+f/cx9Fv7EU+4IlUZiYarjczWyW2J8Z0UyQi+ZIcYZrmai1NZhczgA6RcnyGrxC4h
 SXCTcEzoIVhS+VcVNKe5WGw3Amd0mULOXiaakbRXeQidDfe7vPkbsnxQ5pT/pf7D42Go
 6P7Q==
X-Gm-Message-State: AOAM532GnF3222gWlDTm7umI8yrLT0MhzEckWOJs+jPsyIFN9MoSNcVv
 X20G8NI2i80rhOXkjCMhPV8=
X-Google-Smtp-Source: ABdhPJxcpflDkKriUpwXnmQ91xvw+QQ2tRPyfz+7x2m8TLRQSCCUzKP02myJJM14tbNU0Ev45LWzUA==
X-Received: by 2002:a05:6402:2c9:: with SMTP id
 b9mr20207344edx.109.1631632595532; 
 Tue, 14 Sep 2021 08:16:35 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x12sm4932833edd.51.2021.09.14.08.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 08:16:35 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] arm64: dts: meson: add audio playback to rbox-pro
Date: Tue, 14 Sep 2021 15:16:31 +0000
Message-Id: <20210914151631.2841-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_081638_276297_6165B1DA 
X-CRM114-Status: GOOD (  11.48  )
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

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
This reworks an earlier submission which was rejected due to errant
inclusion of some regulators with the patch.

 .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index dde7cfe12cff..50137aafab10 100644
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
 
@@ -90,6 +98,59 @@
 		clocks = <&wifi32k>;
 		clock-names = "ext_clock";
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "RBOX-PRO";
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
