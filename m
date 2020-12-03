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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A5BC64E7A
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:01:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA5C20665
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA5C20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2lUnH/ssFQsYhtwgdGASO6VEyiRyywIf5/f5iY5O74=; b=V+7RO3oWUYZ/vDYUXjMdB1dvQx
	xncvTRQU8fg0RRnYYfTSX19lpSqjPvurQJwf2+cq/TXHH82V6pEZcX5+3Ck7WWqwn5OSU2oa6VFhN
	0KIVCV8dtxIZp3E53f7kxXdtzY5SsE4EIS9MCdZFNXT/wvW+az9Xj6AOT8bXaMP3Nt+oXxcqWNg6+
	whD41009hUmCsvaz1RIisbNY4ooDK/CRyCCizaN1tqBDFjwpOAEXIHxWXraSe8BXX2TFX+ASIe0ap
	yr8+Jys7uD49X8XCtKRmmlx5P6ZTOIhfMR9IpYxDK6Gb78dDmF2mkgs3F1h52e0GzIsBjMcRmaUIt
	Qw+8/jOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhg7-0000Fs-0G; Thu, 03 Dec 2020 06:01:19 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhfY-0008Nk-Bq; Thu, 03 Dec 2020 06:00:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id h21so2572294wmb.2;
 Wed, 02 Dec 2020 22:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0Q2LsdTBYpLDoB7Cj1Qbdhjz0kWaNgxAFVnGw/sfz1U=;
 b=QtXO3tiAI6/rE9SWRU/ZhO0OVFw6FzMAkpmBXmsCns8KNURciKJ4bYtJsEsqUC3Cro
 Wd1LBED6m2sT9lJZrxnfElSD7CU7LbQqc7TPP67G8I0YoaYVR9XqX230+H4vKuCkOyfJ
 Mbjtf8+A61w845BLTaDvW7xuvLbQxcGu3effd8HSNUxw7IImVDN+CQcb7xAEKiVZ7rnO
 6REB/gdTXZgN/OEwLM5bW/2wHzRFx7Qrcu98TPguIr+PkrNfEWKlHkHcwy+wH2EWrg5C
 Fc0+k5/TjK/Uyhlne6zKpm820Qk1B/Hl+mrtydx+DPNzV51C+RmJTkN6U0H/wAeJfR5d
 5dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0Q2LsdTBYpLDoB7Cj1Qbdhjz0kWaNgxAFVnGw/sfz1U=;
 b=e6O+GlfyZQ9P0r75yJv7brQSyf0HwT0JL13l/AoJINGdnodS1cgkUFKjvyi9mYQpsS
 m33P+SiANsug6I5aYlcUjfOOYiiL7SeBma+blrrsdlD0xrxf3YyELuzdgWE+Zd9t8txa
 UavuEBktmA1sJvzPKIPEZ2ZEjepTs2QN68c4OvpnGtYv+wD3UbUTQj3WM3HYNZy5MrIi
 Ld75sho/QXY8BhXZo0dywoQzogxZOvwSdbvudgEVZ/HEJQYu2t4IjCQo5RTA/5tn2zQG
 4F6JGJooyrOU7VLWd0nw+qvO3c954K8Rm3y1dWtyM7EI7AWjG7B71xCYhtqNoIBOZg4k
 Oj1g==
X-Gm-Message-State: AOAM530HahxPYxR7o0hq4gIlDAjniLoWEVHwZNCNwy8E3aaAMm5Q/r49
 VVg42PmMMfnGZVDyGLXge6U=
X-Google-Smtp-Source: ABdhPJwP/TLaHfs0bgnYof8vTgsePTEkN0CTCkbhP4/YlhSskA2ZUPaMbHH7CW/yL59HpuMxxw7zpQ==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr1367107wml.11.1606975243190; 
 Wed, 02 Dec 2020 22:00:43 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i11sm218439wro.85.2020.12.02.22.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 22:00:42 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] arm64: dts: meson: add audio playback to wetek-play2
Date: Thu,  3 Dec 2020 06:00:23 +0000
Message-Id: <20201203060023.9454-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203060023.9454-1-christianshewitt@gmail.com>
References: <20201203060023.9454-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_010044_523013_54BBBA9C 
X-CRM114-Status: GOOD (  13.72  )
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
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
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
