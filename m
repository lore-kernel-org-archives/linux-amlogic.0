Return-Path: <SRS0=ZFy2=FH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E59C63777
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:01:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEB6320665
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEB6320665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yatVB7EaJXz0LMGCej9OPeT9dgFUZ4L8c3WYUxPDvIg=; b=yJnjpUL1LGC5KJZRkk0qEy7X/K
	+R4R2vTA7VNMmNVgbHO9Xr/tTRkGU/vhLx7T+jHmVZeOjMSDy0EXjAcm7cx2Oq+9idQSKsKOxEkaL
	br0OfISxTesx5pQ/Mbkjqp8tJDjpB0BgI945Y3M6nT4GxYoohOBYkK/SdyEOUhLN7P6ehsEYyZae/
	uspcspr3iyOTZBswuKTBCTR0LIEmHgn35XYEclf8tRE45uROwEpOZGbWyC07efNYp8qhN0i9qOyGP
	wz9wkaHb6yzYipW4sPasnug/DW9NLPXvhRS333btuvyouS1GahQu3j9FMEjSVR2FXcpv6CyX+BPmo
	keNz/I9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhfo-0008Uq-92; Thu, 03 Dec 2020 06:01:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhfS-0008LX-1s; Thu, 03 Dec 2020 06:00:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id 64so590313wra.11;
 Wed, 02 Dec 2020 22:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y6xywWA0Bg+0Yb66SGd8bpy5ReZjATNnwobMf9jnUk0=;
 b=txM2XXYv+owk/t9tGZPgZb5z+KXtTKNy9WLyz4ek8IXqPi719LgMaQE42ITTlwr199
 Mq+uTy3TOa0Y6nQnzhCNcXLAgNxVdTwZfqx84XO/d8kMTxAoOcF6g4OROqWUbB9jp0mC
 I1x+WNlMcYFed6KGp+Xavln2XueFo5WK5HXPK+QZj7/8aNbWXfSGDj1em/QOSqdBPYba
 0xzM+htnHeA+6Q64eLyYWtg+ZRMOsjr2oyWQY65JTIcMsFxXJP7iOKVAOMkZFSUOBDbk
 vmg5mnSrclfvSiNQ/eT12Pwz1/LsXnAg2SmtTHFJ0dCefUEzNm0MFTQV/jM/xnY+ned4
 suGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y6xywWA0Bg+0Yb66SGd8bpy5ReZjATNnwobMf9jnUk0=;
 b=Htk2keQ+nX35SsjtNvGf7INlawL036HZg/M0VJx3RLqg5Bsd6+/rOE8Y65tw4xun7x
 1Bhh+JRa1xnjXpPHPVFve331MJObr9L+ewwEfhKp7QbdzsyFgKzMYn+7NNvCkNZK3Jxt
 y08GJKK+Tx1616Qr3w1SoKAuS7NgpJqqxKn6YZGYJBdraz+XE+NmBIsGSWSiCQ5u7IPP
 wKYig8EhuGVKrhhrR3nuFAM4mKEzPpTzMuy0JqxaaMVSTaD7rbi0S4IGNSfiOl4SYVqK
 KFtXXdtmI1+8lYOPs4Y//tMpp5i2BEb6QH62bsTT16z0CeP9QVUBSbXf38SOzhU1rmXh
 g7Pw==
X-Gm-Message-State: AOAM531uabXogahG5HblOb+QjZy0fsfMc0HtO2iD8TD8e75BHoNiFNKT
 uUKf+BDUfrlD/p3ZTBP3FSc=
X-Google-Smtp-Source: ABdhPJyw9t2B/075IWN9syQsHo2Mci4h69VZm4AOiLICb2Jz/0++4DbImVQOULxhNLZGWx2hN6B0GQ==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr1736698wrp.51.1606975236662;
 Wed, 02 Dec 2020 22:00:36 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i11sm218439wro.85.2020.12.02.22.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 22:00:36 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] arm64: dts: meson: add audio playback to nanopi-k2
Date: Thu,  3 Dec 2020 06:00:20 +0000
Message-Id: <20201203060023.9454-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203060023.9454-1-christianshewitt@gmail.com>
References: <20201203060023.9454-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_010038_116000_7ADA9191 
X-CRM114-Status: GOOD (  13.49  )
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
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7be3e354093b..8e5df00b06a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -7,6 +7,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "friendlyarm,nanopi-k2", "amlogic,meson-gxbb";
@@ -130,6 +131,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-NANOPI-K2";
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
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
