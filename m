Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B7BC4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2ADB204EA
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KBTBMKtv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2ADB204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UOO5kQ84mlJ5yneZEA9SUkHKkahqYIP5vf3ecFU1jx8=; b=KBTBMKtv4haCpeLainscB4bgK
	VKKcBAiw0VvErdDHB6qCaAWy9d9XaSdJfN8LCTs3O45ddBWIgLjy0rQ2l3UYMYv8n+2ltjE3SoAs8
	jeX2T7akjS3V/PrBHzTIDrZ6u3+5oyXUNZUw9LZ28K4/Dq5Wit1+phuKv6PbcsoNpZrZq4WwtWhyx
	vGxz+HSY+DaB5vAO+RnXKFgcBEksL1yWEx1y9w30p6VE4wJGSYtT8MYGX6eqRrzUd0+IMXWZI5gvP
	Y17zNCuqNtbZQ9Dp+t1g+2fCR9+OaaC2mqzHm4SODwu6JVoeP4NHj90gFp23U9XtX8LRpkIsli9YY
	YNnm05Qvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXFG-0007ZX-UE; Mon, 05 Oct 2020 20:38:07 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXDd-0006ax-JS; Mon, 05 Oct 2020 20:36:27 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdwRi-1kz9922frS-00b5yY; Mon, 05 Oct 2020 22:35:54 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD4-0004WP-KP; Mon, 05 Oct 2020 22:35:52 +0200
Received: (nullmailer pid 10337 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:38 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 05/12] ARM: dts: at91: Fix schema warnings for pwm-leds
Date: Mon,  5 Oct 2020 22:34:44 +0200
Message-Id: <20201005203451.9985-6-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 5fde76b173404089831f025d7aa48043
X-Provags-ID: V03:K1:X5984x5Mu6KOMVT8raz47lW3KsqCqdPqMZbE4qgc5W7KVXr0jy1
 CH2YvDaBph3KN0DNsoz23Pvf8KxfdsvsO4K5peRSNDq5NF+fUAY8FNPx+XoWP4fwymsy+Nt
 3jvlyodVkxO5i4+6qCMJEadwuONX85U59RkMQrnT3SjRgOU/8FYlUwbBSedVDvHVZypybIY
 mf42H18AqHnNwyM84HbDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/zrJ9qxpvgo=:xigd7oe7ORlWmLXKg0ViLX
 tqes9NtZqSYmmQ7y0YYQE+SsBWBvfti0HAg1v65umwnsBXzpe3CPduch2Izat6lcnKHoi9VcN
 55E2CLnpCxmH/ECvfnfr6aSTawQ50JtX0TvlB7/S6UT7OXLgb/RJF86i0SgRv+CIK4qjwrpmV
 PVSBIBCqQsZ4RC0VQyg71xIuL3JWIR44bKYjZT4Qj9kO8g0Gd/PHOstBJMm+im/UTwYUJxi0K
 ywP7C+BmxDmGEUZaRteqcgJiKqdnWFQ/qkXsK06w1b5l56FTFtBpVnNSwK5Af57RIGgJjZM5U
 eAvubOgMmJ/KFmr+XsA4SQDeoEDGHXKNnbGtj1/4nH+zOmP0HLXx7WpAMJwTSVcf/ogqGF5L6
 SOkM3h6p2xhEkF16IoDfHFTsvCRsBnv6cLjz1tnnVPAQQETg1YehfVgSZAF1J4tj1ssrVzUiV
 RqeaeCeHdJXxl/fwrEzUIb8Rgdrxu+CGDWgp7W75+Fsw7rDQUNddYVbhNph63wRsBjgYd8wAg
 /ET8+8lpPreITtTW8fBMF3KzGfjAYA5lYSjAafTM2DOdqNyoCQ6Du8VkjLRYxEmRiCk30yrzU
 laJ5CWOC/aapEAznciZgDfrQ4yFloFACOKkdmYUkPyCw87tZGUFxXPF3t7IPh0pDp+BeQ9Yer
 eyxj0OlfALcVFAyg6jmlUXFPF/yV7dr3moiTsrQEqkg8zkXNmWl6Ts6xHwcTrgJjDFIOxp+wd
 4mInr8g7xGE9eCHhm2+h+3M5b1l7c/EyLLx+Pe6raAM3uyR/e7g87YoRREltUS14Z9OrWcdqb
 Ri4XI4SWgffUGeyYP0zfNTwbYVyWwbn6JEbxFRaRWD+DibbE8ndrimUoOQuSHcqCbsbvseP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163626_015071_BE097430 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/at91-kizbox2-2.dt.yaml
  CHECK   arch/arm/boot/dts/at91-kizbox2-2.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/at91-kizbox2-2.dt.yaml: pwm_leds: 'blue', 'green', 'red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml
  CHECK   arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: pwm_leds: 'blue', 'green', 'red', 'white' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

(Warnings above are for armv7 only, armv5 would produce similar warnings.)

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/at91-kizbox.dts             | 10 +++++-----
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 ++++----
 arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++++--------
 arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++++-----
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 ++++----
 arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++++-----
 arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++++-----
 7 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/at91-kizbox.dts b/arch/arm/boot/dts/at91-kizbox.dts
index 7d938ccf71b0..6ea5e60d881d 100644
--- a/arch/arm/boot/dts/at91-kizbox.dts
+++ b/arch/arm/boot/dts/at91-kizbox.dts
@@ -48,31 +48,31 @@
 		};
 	};
 
-	pwm_leds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		network_green {
+		led-1 {
 			label = "pwm:green:network";
 			pwms = <&tcb_pwm 2 10000000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		network_red {
+		led-2 {
 			label = "pwm:red:network";
 			pwms = <&tcb_pwm 4 10000000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		user_green {
+		led-3 {
 			label = "pwm:green:user";
 			pwms = <&tcb_pwm 0 10000000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		user_red {
+		led-4 {
 			label = "pwm:red:user";
 			pwms = <&tcb_pwm 1 10000000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91-kizbox2-common.dtsi b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
index af38253a6e7a..8dc880c6b9d0 100644
--- a/arch/arm/boot/dts/at91-kizbox2-common.dtsi
+++ b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
@@ -58,24 +58,24 @@
 		};
 	};
 
-	pwm_leds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		blue {
+		led-1 {
 			label = "pwm:blue:user";
 			pwms = <&pwm0 2 10000000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "none";
 		};
 
-		green {
+		led-2 {
 			label = "pwm:green:user";
 			pwms = <&pwm0 1 10000000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		red {
+		led-3 {
 			label = "pwm:red:user";
 			pwms = <&pwm0 0 10000000 0>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91-kizbox3-hs.dts b/arch/arm/boot/dts/at91-kizbox3-hs.dts
index 0da1f0557eaf..2799b2a1f4d2 100644
--- a/arch/arm/boot/dts/at91-kizbox3-hs.dts
+++ b/arch/arm/boot/dts/at91-kizbox3-hs.dts
@@ -15,40 +15,40 @@
 	model = "Overkiz KIZBOX3-HS";
 	compatible = "overkiz,kizbox3-hs", "atmel,sama5d2", "atmel,sama5";
 
-	pwm_leds {
+	led-controller-1 {
 		status = "okay";
 
-		red {
+		led-1 {
 			status = "okay";
 		};
 
-		green {
+		led-2 {
 			status = "okay";
 		};
 
-		blue {
+		led-3 {
 			status = "okay";
 		};
 
-		white {
+		led-4 {
 			status = "okay";
 		};
 	};
 
-	leds  {
+	led-controller-2  {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_led_red
 			     &pinctrl_led_white>;
 		status = "okay";
 
-		red {
+		led-5 {
 			label = "pio:red:user";
 			gpios = <&pioA PIN_PB1 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		white {
+		led-6 {
 			label = "pio:white:user";
 			gpios = <&pioA PIN_PB8 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
diff --git a/arch/arm/boot/dts/at91-kizbox3_common.dtsi b/arch/arm/boot/dts/at91-kizbox3_common.dtsi
index 7c3076e245ef..9ce513dd514b 100644
--- a/arch/arm/boot/dts/at91-kizbox3_common.dtsi
+++ b/arch/arm/boot/dts/at91-kizbox3_common.dtsi
@@ -62,7 +62,7 @@
 		regulator-always-on;
 	};
 
-	pwm_leds {
+	led-controller-1 {
 		compatible = "pwm-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pwm0_pwm_h0
@@ -71,7 +71,7 @@
 			     &pinctrl_pwm0_pwm_h3>;
 		status = "disabled";
 
-		red {
+		led-1 {
 			label = "pwm:red:user";
 			pwms = <&pwm0 0 10000000 0>;
 			max-brightness = <255>;
@@ -79,7 +79,7 @@
 			status = "disabled";
 		};
 
-		green {
+		led-2 {
 			label = "pwm:green:user";
 			pwms = <&pwm0 1 10000000 0>;
 			max-brightness = <255>;
@@ -87,14 +87,14 @@
 			status = "disabled";
 		};
 
-		blue {
+		led-3 {
 			label = "pwm:blue:user";
 			pwms = <&pwm0 2 10000000 0>;
 			max-brightness = <255>;
 			status = "disabled";
 		};
 
-		white {
+		led-4 {
 			label = "pwm:white:user";
 			pwms = <&pwm0 3 10000000 0>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91-kizboxmini-common.dtsi b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
index fddf267b2d17..5892f20f7b16 100644
--- a/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
+++ b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
@@ -54,10 +54,10 @@
 		};
 	};
 
-	leds: pwm_leds {
+	leds: led-controller-1 {
 		compatible = "pwm-leds";
 
-		led_blue: pwm_blue {
+		led_blue: led-1 {
 			label = "pwm:blue:user";
 			pwms = <&pwm0 2 10000000 0>;
 			max-brightness = <255>;
@@ -65,14 +65,14 @@
 			status = "disabled";
 		};
 
-		led_green: pwm_green {
+		led_green: led-2 {
 			label = "pwm:green:user";
 			pwms = <&pwm0 0 10000000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		led_red: pwm_red {
+		led_red: led-3 {
 			label = "pwm:red:user";
 			pwms = <&pwm0 1 10000000 0>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/dts/at91sam9m10g45ek.dts
index a3a5c82d9f29..c50706b653d0 100644
--- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
+++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
@@ -313,27 +313,27 @@
 		};
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		d8 {
+		led-1 {
 			label = "d8";
 			gpios = <&pioD 30 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		d6 {
+		led-2 {
 			label = "d6";
 			pwms = <&pwm0 3 5000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 			linux,default-trigger = "nand-disk";
 		};
 
-		d7 {
+		led-3 {
 			label = "d7";
 			pwms = <&pwm0 1 5000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
diff --git a/arch/arm/boot/dts/at91sam9rlek.dts b/arch/arm/boot/dts/at91sam9rlek.dts
index 0de75d3c4f18..035ce5dedff7 100644
--- a/arch/arm/boot/dts/at91sam9rlek.dts
+++ b/arch/arm/boot/dts/at91sam9rlek.dts
@@ -218,26 +218,26 @@
 		};
 	};
 
-	pwmleds {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		ds1 {
+		led-1 {
 			label = "ds1";
 			pwms = <&pwm0 1 5000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 		};
 
-		ds2 {
+		led-2 {
 			label = "ds2";
 			pwms = <&pwm0 2 5000 PWM_POLARITY_INVERTED>;
 			max-brightness = <255>;
 		};
 	};
 
-	leds {
+	led-controller-2 {
 		compatible = "gpio-leds";
 
-		ds3 {
+		led-3 {
 			label = "ds3";
 			gpios = <&pioD 14 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
