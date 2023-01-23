Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8857C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 21:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZVaRyHEEKclT+QtzXAfFOvaS+vg9bi7AOpaiReGZvg=; b=lO/fXZTelTw+gL
	puzt8dyZfn/BhD+gssH7zA0WGzIfLvKzjziavI8vAuLNlheSjJgd6id6bBT1X3NE+J2CCewujkM59
	fAtroZnfOQ9Jr0YdkLHe7tZgEroSDLDMe7YKcVuREu2dlMRQ7LmkM4ekn7LnalzEsmx5JARXVCCRV
	kP1U4NbxcsZHcNnTINS8az1BgcWytSGwU/WVu8SjYzfTTflQSTliaTIPSStqXmJ7AP6jCn4eZBMNn
	t8eKG4smdQQiQVSeuXvIc9vmT0ql6BYq2bTTvogfjFU3Gphl9nAJZQ2UcZeZ3Ho08k3ltm/ET5o4W
	vkeeC2421LVfHkeqeBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4QB-001WYN-V8; Mon, 23 Jan 2023 21:32:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4PH-001WDs-49; Mon, 23 Jan 2023 21:31:12 +0000
Received: by mail-ej1-x634.google.com with SMTP id u19so34064790ejm.8;
        Mon, 23 Jan 2023 13:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Un1aIXb/s/PKugP8//FCoRiSMsC8Vbj0OkVggBYv44k=;
        b=BQHQ15sjD9Zmxq9li4qWVrQODpoioHmp69SIDBclES3TT9To/vQdfkNCiegiY9ois3
         dD0Ww/ODn3YhaQK7qZWBlS6oxG9BMNef2WTc7zyVWEs9+CrgyCSP4O5eVzvBla95n+5y
         UoIIQq/BzGNojbEYzDMq3nniVGJvHaQLvGQf8Qc5RmgkcA5l9/LKKmLeN45tOYXfKCLE
         Piujtfx7tyNjIeyPpE/GBeLDxb9YWfbO2Gv+RvvtWDlpPQc5hxy5zsCJwBJ3f3WfjOFi
         gMyEFWeO008QTwGSbGMpR6ZFDR+ikh1XL6+G1zNdtxmAU5ZHYGL7sgtzt711/t53g7sG
         QYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Un1aIXb/s/PKugP8//FCoRiSMsC8Vbj0OkVggBYv44k=;
        b=5usDn1m1KFd5rzQNQzxftVemZeuS0Ezk2STckrmmABD5rp/88VfEjJpKJGP3aYqc07
         0JQ23RRSPeSbYwt13EKUmdBqnF78epYOdQzlHDHV8qbRbhLQGbKUSiefFzNoaLzZ73qg
         qFRUNB7VTKiX7Vn0wDbYQJydnIdrR12NBGXiTudha+GIIZUb3sCApW4ZwZjtHBMJCn0D
         z4Y45UNZG2HWtn5gIQTgi/DDCbBKTDzvXdBW0xzF1JSNtcEoWEYgLmWkcER750v8k1rq
         YavKXwxv/Z51nfmp5WUjmJMAmAmWxxVOKZRvmYrHUbesY54wM5Cg18VIiJLF6boxF+82
         V1+A==
X-Gm-Message-State: AFqh2krgb9jqbc5OP7pyPBypgthyBRt8qarQ8/Ob3NLCZzl24YLOjYQf
	OVEFg2LXXysJBEyDflDtJFs=
X-Google-Smtp-Source: AMrXdXtI5ruDD8b/KqLojtAaBvBuKJTVK0yaBb/og4Phc7X+C2pczX+2Q0VDDWtNn/t03TMBMa5qig==
X-Received: by 2002:a17:906:a88c:b0:7c1:5098:907a with SMTP id ha12-20020a170906a88c00b007c15098907amr27264241ejb.35.1674509468773;
        Mon, 23 Jan 2023 13:31:08 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7? (dynamic-2a01-0c23-bc5b-9400-dc4c-6fb7-47b2-beb7.c23.pool.telefonica.de. [2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7])
        by smtp.googlemail.com with ESMTPSA id ss17-20020a170907039100b0084debc3fdadsm19245354ejb.188.2023.01.23.13.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 13:31:08 -0800 (PST)
Message-ID: <94431754-d187-aad5-c374-67af70fcf982@gmail.com>
Date: Mon, 23 Jan 2023 22:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 4/8] arm64: dts: amlogic: Remove invalid compatible string
 amlogic,meson-gpio-intc
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_133111_206556_39C101BF 
X-CRM114-Status: GOOD (  10.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Remove invalid compatible string amlogic,meson-gpio-intc.
See drivers/irqchip/irq-meson-gpio.c

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 3 +--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 3 +--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 3 +--
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 3 +--
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 3 +--
 7 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index ed895fb32..4ee4d0089 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1761,8 +1761,7 @@ reset: reset-controller@1004 {
 			};
 
 			gpio_intc: interrupt-controller@f080 {
-				compatible = "amlogic,meson-axg-gpio-intc",
-					     "amlogic,meson-gpio-intc";
+				compatible = "amlogic,meson-axg-gpio-intc";
 				reg = <0x0 0xf080 0x0 0x10>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 80d82f739..9bf81e51e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2179,8 +2179,7 @@ reset: reset-controller@1004 {
 			};
 
 			gpio_intc: interrupt-controller@f080 {
-				compatible = "amlogic,meson-g12a-gpio-intc",
-					     "amlogic,meson-gpio-intc";
+				compatible = "amlogic,meson-g12a-gpio-intc";
 				reg = <0x0 0xf080 0x0 0x10>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c0a311da4..86865daf7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -278,7 +278,6 @@ cbus: bus@c1100000 {
 			ranges = <0x0 0x0 0x0 0xc1100000 0x0 0x100000>;
 
 			gpio_intc: interrupt-controller@9880 {
-				compatible = "amlogic,meson-gpio-intc";
 				reg = <0x0 0x9880 0x0 0x10>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 923d2d8bb..8d8fdad6a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -300,8 +300,7 @@ &ethmac {
 };
 
 &gpio_intc {
-	compatible = "amlogic,meson-gpio-intc",
-		     "amlogic,meson-gxbb-gpio-intc";
+	compatible = "amlogic,meson-gxbb-gpio-intc";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 04e9d0f1b..5a8f47313 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -312,8 +312,7 @@ &clkc_AO {
 };
 
 &gpio_intc {
-	compatible = "amlogic,meson-gpio-intc",
-		     "amlogic,meson-gxl-gpio-intc";
+	compatible = "amlogic,meson-gxl-gpio-intc";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index ad50cba42..6b74a6995 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -109,8 +109,7 @@ gpio: bank@4000 {
 			};
 
 			gpio_intc: interrupt-controller@4080 {
-				compatible = "amlogic,meson-s4-gpio-intc",
-					     "amlogic,meson-gpio-intc";
+				compatible = "amlogic,meson-s4-gpio-intc";
 				reg = <0x0 0x4080 0x0 0x20>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 617d322af..733a5d578 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -513,8 +513,7 @@ &ethmac {
 };
 
 &gpio_intc {
-	compatible = "amlogic,meson-sm1-gpio-intc",
-		     "amlogic,meson-gpio-intc";
+	compatible = "amlogic,meson-sm1-gpio-intc";
 };
 
 &pcie {
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
