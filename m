Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EA2C55ABD
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:22:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E5020684
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:22:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PIE+jSif";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj00KA0a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75E5020684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcjfQuuwiReBH6s/3z25BikQQoUPjwPNQI7YR/3cFHs=; b=PIE+jSif7jhIjZSzGY/6z6dbjR
	YAgg+D2OP4o/ZiXrUH3/of0fYhuNO6uINjRi/y3sfyug7TAuhmKj8CgnQAK0CgL0bOlWdtBhFAmdn
	uebAnVNdnIDLGNrQ+S4XJp8vkAukodV4B0uKm7KlgDlpdPxcyP9vyhd0NLD7MBX21cLEleYx16sAE
	3FnxSCplum7XULLW+7MHD9/dziBQR2w3MTvn48ttrE3ombASu5q3utY+mbFjqz0uIheC+FTErv2BS
	doEW7kYdZwStdWrNb3hOPO0SuOts48NVdsD7JXq/hiGZJuYoQ2ZsGR+e3YS955tKdV9K0nAotwoTT
	PtZppCDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keXtu-0001jk-MU; Mon, 16 Nov 2020 06:22:06 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keXsh-00018x-C3; Mon, 16 Nov 2020 06:20:55 +0000
Received: by mail-wr1-x444.google.com with SMTP id 23so17346201wrc.8;
 Sun, 15 Nov 2020 22:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1gIivsKhrs5B4E2eM/SXdSVH3UTq3Ox3b3pPitMs8zM=;
 b=Mj00KA0a7s4QpdkqkPSUoIVCe5VfTiL38H3A13Q1CwiP6l6gZBjrN3DfiIYzehSVeR
 f1mtaedQdInmz3m+Ia+ZCoWGtDYtbk7ilngUhVrgqE92Xo9a+eX2HYlfaYSc6lwesVvK
 zeY21EZy2lhcd9txYzzgKj5KI2sdIi6279Evj4GTs+iQfiCXGPaCxn5RNDjbXhoWaMXg
 HRO8OoYoJuUiX9S7DCZ1Bs7cEc5l8sMTNb0kNSLJnPnI0EUU+uEYb3Yf8zsRkMbmgw22
 mYIb47ZhxzetB5ykPRGbaRsH+c58y4VeE9LAmvxOv8VLeOKXwKdtaf84STQRVJVqKOTM
 w+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1gIivsKhrs5B4E2eM/SXdSVH3UTq3Ox3b3pPitMs8zM=;
 b=EuX1R3vcNZtGAnVK0Ub2/V/oXq70ycey7GsSOQ7tK9Gfu8a1pZUGEMZsubSV5fWfQ9
 ITgElSp5EXRxxomDoVy1gPpMZu1AiJDlxjrKFZI7DyohfdJzDqLmrvN8XoSUHvK6CT2j
 o1UGtgGjInUEiEOFjR0O9V4WexJsJQrma2+lZrVJNb5lWI0ZZ+LN+iug6yH2t2qqfRcl
 dWAZO6qHvKuXFGoMJ5Rsge1Ixcm9t1uMxw1liFGPGWyvESY+v8P8mc/ZRWwMjCI3EwGO
 +Ke3g06MpUTnvf9Wy7JiuxbV7+FWP748H+5NpQdNdMijt92oMsPHkOR3AZDXmL/Hf6ks
 j5qQ==
X-Gm-Message-State: AOAM531ebWpS8tR1CIMaLB3HahNy5OmV/R84FT/6Ms77SeT8hAI98KFC
 ladQWZcG5Cw7buZ/hC0poNs=
X-Google-Smtp-Source: ABdhPJzX9nR3wvtsqiKz74R6KI/jvBf0xlZXoVn401YSQ4zdG0j+kueNoBq2SybGSrh59EePeSCWtw==
X-Received: by 2002:adf:8028:: with SMTP id 37mr17153751wrk.111.1605507650109; 
 Sun, 15 Nov 2020 22:20:50 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m3sm17065985wrv.6.2020.11.15.22.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 22:20:49 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] arm64: dts: meson: add audio playback to wetek-play2
Date: Mon, 16 Nov 2020 06:20:31 +0000
Message-Id: <20201116062031.11233-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116062031.11233-1-christianshewitt@gmail.com>
References: <20201116062031.11233-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_012051_499169_61202DFF 
X-CRM114-Status: GOOD (  14.12  )
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
