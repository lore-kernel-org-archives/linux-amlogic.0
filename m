Return-Path: <SRS0=x2rd=6D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A747C2BA2B
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:40:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B22F20753
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DRYBxeov";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP7fb0V1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B22F20753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VYKklvD/qXKeN2j3sZywZFHbWAdUtxyZ8ivIXgbyQgU=; b=DRYBxeov8p38EZc0OPoHkWeL41
	ppiJCkRvRmyZPqzlY5yErz4U/RAfoZVSmxOSRfj9h5FTp3KvN2FC+iJ4VQR9xKjqCEYAaEAHjOpe5
	aE54f5C9i593bsK/Tix7ur7+hWO6gii/tOqGlhETaZsMHVY4x/vD/85UAwqrjfqETvhpTsTFYeaAi
	KZbQfG5Moc55xDGXO/iwuy3lYbfVECSdfn7DddFn0VFdZunTz5aCMDcyq50UI09MGjP91xYOK52zC
	cRi3K0U3Enb2FFlYciNYIXrvrzGxEdN0zT22/tOxWuPqQB17ermg1VtKcv9N5+FUhG6G+yIVC6pwq
	fwIy/vHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ2h4-0000hI-8h; Sun, 19 Apr 2020 05:40:38 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ2f3-0004pA-Lg; Sun, 19 Apr 2020 05:38:35 +0000
Received: by mail-lf1-x141.google.com with SMTP id 131so5178808lfh.11;
 Sat, 18 Apr 2020 22:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ddvzpi4v1DdjM1yLeMifMRyxfGTNb5nDe0FeVHixmDk=;
 b=HP7fb0V1bSnUs5kIp9q6xiNucjBoE8Im5ICE9u7dFzt9M4jyybrjjZ1JGqj8MnMDgQ
 ZRHWwD7+FSJ3lvatjsRqhtjLJU8h27O86ZHUvumPMY0ewcl8o3Sl831O0mF3Cr0ryHBO
 nhhpi0Q2TA8XMR05xSRk49IlG3pX+azwQG0qQlmIuXlbljOY9RUCpZ4RqVhH9uHludra
 FFIldxa27QjIVJnFHWUj5PPpFKgSFkKVBGeA8dj+K7aGFCuZ5w87UUjPkZWr+vxhkNZP
 T4lXEqDAs0ugbnh7w1dYj1LW/tdaK6AfePlnyl8rYerkvSSoa7m8+x9EbCPgpue9qcEi
 L1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ddvzpi4v1DdjM1yLeMifMRyxfGTNb5nDe0FeVHixmDk=;
 b=kiTo0ehrxT1XZgizMqRkQ1uJRlpHN4OcVckxe4XNpnXSDS+w/Opq/AAQLOuKR3RydZ
 cw50l4NnQiujaWBM5iwNmPA1h/ZgAqYhIjW23PtcyxnCU1z+OFzAQOx/dvUA9kBSZh+C
 so/Aehsil9qKQTWTFODFyOLrPxTAiFPvFHJNzDrsJhSvrGtxiU8T673AFeVoHYOyl4V5
 EQYZl9OEmzP/UNOHOsyImVDuLJEAzKWh/8nqLp30PopGSROj2QOJi7ns6D/HYxtkuDGL
 xhia6XZ3nVlf9OAnM7FL4cL0u5YChtbFpf+ck99sEmQ4wUowrpGLPER/3bEM15NMM8rX
 VzWg==
X-Gm-Message-State: AGi0PuYBUwNB5ikVxPr213t/xujQRQKEHNrv24nYN7zXrxrHq7nBqtRp
 qNIdA2se2uyWy/dySr0sFqM=
X-Google-Smtp-Source: APiQypIU/6kHBkTd4NaOXbY/SsYZR7ZJTnlT6naanXGEPx3mwI7OvyzNyv9MKwhQ3ygKQRu/VkZV7Q==
X-Received: by 2002:ac2:50ce:: with SMTP id h14mr6666282lfm.76.1587274712224; 
 Sat, 18 Apr 2020 22:38:32 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r23sm20416619ljh.34.2020.04.18.22.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 22:38:31 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: meson: convert khadas-vim3/vim3l to hdmi dtsi
Date: Sun, 19 Apr 2020 05:38:14 +0000
Message-Id: <20200419053815.15731-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200419053815.15731-1-christianshewitt@gmail.com>
References: <20200419053815.15731-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_223833_752097_CA8036C4 
X-CRM114-Status: GOOD (  12.02  )
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

Include  meson-g12-audio-hdmi.dtsi in the common Khadas 3* dtsi. This
simplifies the VIM3 dtsi and adds audio support to the VIM3L.

This supercedes previous submissions: [1], [2], [3] for future kernels
but [3] should still be applied as a fix to Linux 5.4.

[1] https://patchwork.kernel.org/patch/11490837/
[2] https://patchwork.kernel.org/patch/11490889/
[3] https://patchwork.kernel.org/patch/11198535/

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   | 85 -------------------
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  1 +
 2 files changed, 1 insertion(+), 85 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index c33e85fbdaba..b8d69d99bc91 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -5,8 +5,6 @@
  * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
  */
 
-#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
-
 / {
 	model = "Khadas VIM3";
 
@@ -47,69 +45,6 @@
 		regulator-boot-on;
 		regulator-always-on;
 	};
-
-	sound {
-		compatible = "amlogic,axg-sound-card";
-		model = "G12B-KHADAS-VIM3";
-		audio-aux-devs = <&tdmout_b>;
-		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
-				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
-				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
-				"TDM_B Playback", "TDMOUT_B OUT";
-
-		assigned-clocks = <&clkc CLKID_MPLL2>,
-				  <&clkc CLKID_MPLL0>,
-				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
-		assigned-clock-rates = <294912000>,
-				       <270950400>,
-				       <393216000>;
-		status = "okay";
-
-		dai-link-0 {
-			sound-dai = <&frddr_a>;
-		};
-
-		dai-link-1 {
-			sound-dai = <&frddr_b>;
-		};
-
-		dai-link-2 {
-			sound-dai = <&frddr_c>;
-		};
-
-		/* 8ch hdmi interface */
-		dai-link-3 {
-			sound-dai = <&tdmif_b>;
-			dai-format = "i2s";
-			dai-tdm-slot-tx-mask-0 = <1 1>;
-			dai-tdm-slot-tx-mask-1 = <1 1>;
-			dai-tdm-slot-tx-mask-2 = <1 1>;
-			dai-tdm-slot-tx-mask-3 = <1 1>;
-			mclk-fs = <256>;
-
-			codec {
-				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
-			};
-		};
-
-		/* hdmi glue */
-		dai-link-4 {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
-
-			codec {
-				sound-dai = <&hdmi_tx>;
-			};
-		};
-	};
-};
-
-&arb {
-	status = "okay";
-};
-
-&clkc_audio {
-	status = "okay";
 };
 
 &cpu0 {
@@ -154,14 +89,6 @@
 	clock-latency = <50000>;
 };
 
-&frddr_b {
-	status = "okay";
-};
-
-&frddr_c {
-	status = "okay";
-};
-
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>;
 	pinctrl-names = "default";
@@ -177,15 +104,3 @@
 	clock-names = "clkin1";
 	status = "okay";
 };
-
-&tdmif_b {
-	status = "okay";
-};
-
-&tdmout_b {
-	status = "okay";
-};
-
-&tohdmitx {
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 094ecf2222bb..9c7841c627d0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
  */
 
+#include "meson-g12-audio-hdmi.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
