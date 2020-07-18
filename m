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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5151FC433FB
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2112F2076D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OMqMfEYq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIZEdH/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2112F2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FBTSPx8eXa/Zui0fUoLE/JF7S+VMQpqFafQBuuMRjM=; b=OMqMfEYqPX8qn89bZz9Oe2TYyR
	sQbFoFJtDt30p1AY7+jLcpp5NvrQ1q9FxDtTl7ZeOKfmM6uzR/Xbc3fDtSN7Qb2ez5vuXOgwnSR+r
	hozrx7y7H4Ffm1kNfI0NmDS0UShoTnWAu1ITtQBPc25gxyBzFX/SvaKmsyVN7VZlNC/edRUOnp21x
	WNCf/zrvN2Nx4RBGbxtUVnJHzS7q/USeuZGoqGq0wXL8o6jvn3lJ2I0yhWjH39FTtpCSqWdsuQOPr
	8BR4V+yZ+HFpjJsnZPngBJEhIgfbhJQu18Oh9VHJNwhfO37Ba7zz0GBoqvltimmJ3GSPMMnByoBRj
	UdA4BMfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgnO-0001K6-S6; Sat, 18 Jul 2020 06:58:06 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgn8-0001Cr-4T; Sat, 18 Jul 2020 06:57:51 +0000
Received: by mail-wm1-x341.google.com with SMTP id 22so17756721wmg.1;
 Fri, 17 Jul 2020 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d988cBXnFVQ/GWsV54ibiM2GROtIFfDIzMG48hK8mIw=;
 b=oIZEdH/uh1TtykZuv0ukEQCuPEVWNo4glkJgnskWVrWqZbBySTf3C1iuxSIa/lPFl0
 v7Jds4ptBemj8bLOAjXDMjvKEigG5o0B5q9GcYZzpCH/deoFab07POBkE1UPCK3yp1kr
 0tSUJ7vtVYq20TSiWldnLyFEkKTdyiGjF6TFLrCNRqcfqYfGFqigTBFlg1GDqMHtmdeM
 EYKRLEv1ivQErEBvEOTFlM9L47yBSHMbCXyVnyOJVmB+wjfUqviKWTUcWm0X9xr4LM2V
 VMoqNU5caMrZV7xp0dEyfjpE7FmP9tNpDlojKJlqVIuHCFBldlmYLp3miy80l15tWeJ0
 ldXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d988cBXnFVQ/GWsV54ibiM2GROtIFfDIzMG48hK8mIw=;
 b=d7fJ0CVM05h/HYx0Ah4yH9LHG7M7nnKt5wruWC0nMZFQDE0Z3jTPC0IQsn9qkSoRO+
 yUFd7wiVZq8M0R1jGMz4duQzfw965bet7Lfa+yT6ooBHUboCme0+gIUmyS0lX20Mt16G
 NaDezmsxs9+DqSnbV7FD2DY7Bd+D3GUtNJsxdVB7u4BP2MZdvQ1Y0r1c18PZlvCUzC2X
 ipW+Y5/rtwM2HJl6KoRiy514C1FM8RHBlER3Bn++XqR/wLbf8L8mJT/NpOXLRZ33Kqvh
 CxWCJNtl4HEoO7uKJif4RyosJHP/hqYTeqQ5VvxBFd7oKjIC8zHVP+XGucX4fEHgh0+Y
 NWMA==
X-Gm-Message-State: AOAM5337MbruPza5uLFf8lUXYdWw4UBMN6M5JIf0KPo57Ut96QRlegUY
 lIHvrI50wRXId3IJnhqq9u0=
X-Google-Smtp-Source: ABdhPJw8ufDkdQQhKOK9vRr515PVBi+xsM5aKv/nI0+7N1b5f0/EJP+DP89FJdxMmeJoVO5i9bSfGw==
X-Received: by 2002:a1c:2e57:: with SMTP id u84mr13315589wmu.52.1595055468849; 
 Fri, 17 Jul 2020 23:57:48 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:57:48 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] arm64: dts: meson: add audio playback to khadas-vim2
Date: Sat, 18 Jul 2020 06:57:29 +0000
Message-Id: <20200718065739.7802-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025750_233280_8C0B7CB2 
X-CRM114-Status: GOOD (  11.16  )
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

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index bff8ec2c1c70..d4734220443c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -7,9 +7,9 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
-
 #include "meson-gxm.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "khadas,vim2", "amlogic,s912", "amlogic,meson-gxm";
@@ -145,6 +145,45 @@
 		clock-frequency = <32768>;
 		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXM-KHADAS-VIM2";
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
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
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
 };
 
 &cec_AO {
@@ -154,7 +193,6 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
-
 &cpu_cooling_maps {
 	map0 {
 		cooling-device = <&gpio_fan THERMAL_NO_LIMIT 1>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
