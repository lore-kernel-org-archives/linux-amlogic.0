Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E9BC63798
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 05:29:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4287B20B1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 05:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yxIPtyVX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6PyMx1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4287B20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B2z/yvxfV5HsRhvmOpcCHOug6TcPNoKvT9U6G6fU2JA=; b=yxIPtyVXUS04kn/etNLBSctRk1
	rDjS4XHmqWsSMs3pjXLp+YN+zRThk1zlJ5YIyciPwBqlG61niASGfmio99mBZ9lmccaZH/9dJVwmu
	eBweXTLKF57eiOpJnEplSVA3b7fGqXChZxDfrr/Av+AUyRVVh3OJo5RDCkDy44VBgrcSIXtxMA7eM
	AJacf9AeRvKfAkF/l70n8+OhWrzmLmxW+rjMO/aRxON5f0z5M64IHQDPx/arXjUC6slmcL5M3L/Hx
	5sNjD3mkj5e/Zw75MUYF7ny3yH089m9KSbs4r70ik4u+6llILXi1SF1+G+XJ5r7JeuzCrE51i/8rI
	lbpHXbJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khnMp-0006kn-L1; Wed, 25 Nov 2020 05:29:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khnMl-0006k4-Te; Wed, 25 Nov 2020 05:29:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id h21so965853wmb.2;
 Tue, 24 Nov 2020 21:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9/VyulasGLfNRZhFbuEx/v+zb6WhDEFLeGB6bc5kOlw=;
 b=V6PyMx1YCB2d4scqQohV3x/vNdZFji6nnwTpeehpun0H0R9lj1a05oNcwWLxaOhn71
 tJQYzPjCeZu/7s3tIWP8tEMaaM5MsZCroauf4358BJ1JfZqjxbMDPP20Ck8UyMmlsjb3
 LRXyCZLlZXynxwim7MRT/+CuD8CiBAiedm1k7RxOyIYjwWcpXQRPn1vjJMMpTBeYtwRQ
 vuTNl21ynhZjClO8LgJEraTHyWDgfQUnuHrNg0xwTlbi9kUD9yGYimSKxAwAZSmCRpuo
 SXgzps5XgZZyrkb8MXks5bmWsnZ+/lIXYklb5YBwE/l/DcUe1zQQLvcMJoE8ucmBVHG0
 uyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9/VyulasGLfNRZhFbuEx/v+zb6WhDEFLeGB6bc5kOlw=;
 b=oPGnhzV1mwIIIZWsBST/dhJbUr73Q28Qlwem7KOQ2JL652atTSbhBhPWPJ/2pDzgOn
 NCIyGK7sOhSQpGANdnWa01i2W2lxLnJ3qpScKMW+GMqLebkHuc4TlrJst4knZ5nahl4h
 36vQR2VxhDkT2+qgoDLnFVEJvd39etgKnOAFMxre4FXYg06//blIVKZghOoHsn9u/RJS
 30ESBm0EN4oGjrX1Snqd5DrhgqmcW5jB/zVr2Qse3UPKABlb0D83xG+C9bAdk8FSMv5J
 n44/nljyD1AmlVVqfLxLO+39bQZescXr9gJSDJb2L7MJ0GR1jKllWH8V2YtaZzf3fuu2
 gk4Q==
X-Gm-Message-State: AOAM530VwfVxFihYwng6M7JjscffiQe1YTeSnb632nBQyHl4YgGdmSAA
 Mz24ZEBOlwSCuUvMlQOejFk=
X-Google-Smtp-Source: ABdhPJzzC91a7bxl4p9PJJ0B1x51PIcIGJdAXL14Xb8n+0yVk6tn7FR2vhinu4Fc//tJsTOPPYpZDQ==
X-Received: by 2002:a7b:cf09:: with SMTP id l9mr1860237wmg.54.1606282158885;
 Tue, 24 Nov 2020 21:29:18 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id d128sm2430249wmc.7.2020.11.24.21.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 21:29:18 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: update the Khadas VIM3/3L LED bindings
Date: Wed, 25 Nov 2020 05:29:14 +0000
Message-Id: <20201125052914.4092-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_002919_970376_86864D5B 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: Artem Lapkin <art@khadas.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the VIM3/3L common dtsi to use the new function/color bindings.

Suggested-by: Artem Lapkin <art@khadas.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
This supersedes a previous submission from Art [0] and uses the updated
LED bindings suggested by Neil.

[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20200925033017.1790973-4-art@khadas.com/

 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 87bd8c9516f2..8f8656262ae7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
@@ -42,14 +43,16 @@
 	leds {
 		compatible = "gpio-leds";
 
-		led-white {
-			label = "vim3:white:sys";
+		white {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 
-		led-red {
-			label = "vim3:red";
+		red {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_expander 5 GPIO_ACTIVE_HIGH>;
 		};
 	};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
