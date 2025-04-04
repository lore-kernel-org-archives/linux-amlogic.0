Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A89C3601E
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m5gHjevGMH0VU+kPo6hMRLrPcv8nhNJmioxGlfjpJ94=; b=OjRRjjzKh4NI2y
	VfQPaWya9V2o4mVJ+UL4O9WpbgtSVSl13ySn7JYL0xibjs5jHqDXR49+qZfYegKDtJsehdGIXdaUB
	4wMdu2NKQKZCkIZ9UtcDPrauiChSPiL6TGZxolgBCK4EM0E9hFlYd1DxqzY/+ZUVb3H2JMiqGXiV2
	OgT7l7nEBYkss0sfvYB801Z9llyELkvHGOvKIiQg6i/i906vJ37vOnbb8/1YjeNjxNvMjDfNuWdmd
	aVyDrhG+ywz8Tk8ExryDy/7K+doTzoEFDeRlJJxg/HvzF0ks4pPmXv6t/iRW8Gqe80IbVWAivxcXH
	oNnQBB3eu/1JEIc0UWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0frt-0000000BdnQ-2ReL;
	Fri, 04 Apr 2025 12:09:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffp-0000000BbHi-0NeC
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:26 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39973c72e8cso195060f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767843; x=1744372643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3JdFQg9OP+vObOtg3YucUTBQsfmVEuB77cG86LXLR4=;
        b=AlNe792o9IrCRdWfuMLsuTSIVATS60ceDbrok/n5MTEDRdH1O15sbI2kTlWAeffIIf
         cr5qEai3Mw3b+94IPGHbe1N/1pv5ABr1nMGg6tLfqZExPco2j1/xaBR7V2U9ZZKQulli
         ecs5F5mW0hoNUyZgUfEAXdztp18W5F2HjOCO+TIQu+1rBaU8RGY7vklAk+P7XAw8D41R
         yFgeNnYXyjPrQRu1USnRk0Ev9FakRIGAu5qSmZvWIOyxfgH4ikHPw/euTitldYN6j91Y
         jHoKVuHPs1y9r+VF9V17rCO87FrDhRpamAjhmwVF/0NOxI8RHTR32FXblwmctnf1ONJ2
         i+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767843; x=1744372643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3JdFQg9OP+vObOtg3YucUTBQsfmVEuB77cG86LXLR4=;
        b=QmcANDJZSjAj24ni2wxA3RoQwF/NNjGOfkS52lC8o/qUPCcNoKg9elHGAFdqvuC5Y/
         MLJ6+sAjIhjHmDmDuk49RsfH4I+YRwKA7MqHeM71FWxuIGbi6JsZQq7RF8vgKf+QOKk7
         BioFO5CgOmMR36t+Ix9e0ZHXaIlTYQh6nIxaQH4HGOFNV7uPrL9MAzVYc130lj7kLM3j
         L7F09z2xWLQ3dLscw56Ej2BKgXIZLz8bBTKHHS+ic0zviAm/6uTljDD1Rcp+VxX5K4J7
         yF6h34kZpX8Spq3iiYs4JYQL8539dpQZXUgsQsjRCnWcW61br9IE+k/6H0aWPCG5f91l
         eDVA==
X-Forwarded-Encrypted: i=1; AJvYcCUFbvbNjc4qk2OKmlSIAIkBYrYcDTvrkL31Ml2HGMJrrjvR56FcLTpuSy1Ax+4pZkKlx5t75puzrc1yUOk5@lists.infradead.org
X-Gm-Message-State: AOJu0YwrtnoyWxBBqntrVehxswjjBcwFFOrHmT2LAtyKsolaxD/ddewO
	/x4wzG/sND6LWyQouy6CtU3p0VzQNyYVaNVom30Y4dzECX0wyVtAJLyCTTSucfE=
X-Gm-Gg: ASbGnctEdOVL/t+X741Wjf7BbsDz0ObiT8bOPfyFrIJg0h/ZaMp4LhRrO7QwwKqoIi5
	QB6lAU2rOAWiZrhhEHDF7wglg0no05pJQRxTLgjmlSctcdhwIiQlTmZSqoTt83gB4662uAMY09i
	IGBW2FtkeCl9AhbFBQIacXct29FChS+6luS0r1GC2QXWrykaLT5D69OXYtGJCQfR3NSXxTKX1KV
	bAOvOqLfCMEpL7PFt5A0fxloAwGfNGQnK1ynvLncHN97apnmt2U0oI6mp9HEju99XV6ImceHIO2
	esIFslkmD8vv6ing2FZPrm4YmhDSQJD2G/XLgYC2ihwi++OcHWOOjA==
X-Google-Smtp-Source: AGHT+IErSp1UfkWiyQZSYQ4Fs3U5j3CAQMjPo78hcc56nmGo8lsKvG80Q29kD9bY+/gtM61oyOPwyg==
X-Received: by 2002:a05:600c:1c1c:b0:43d:fa59:bce9 with SMTP id 5b1f17b1804b1-43ecfa4d95bmr7235225e9.9.1743767843351;
        Fri, 04 Apr 2025 04:57:23 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm4209455f8f.60.2025.04.04.04.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] pinctrl: meson: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 13:57:18 +0200
Message-ID: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045725_128237_346FE46F 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/meson/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 90639bc171f6..0315e224bce6 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -3,7 +3,7 @@ menuconfig PINCTRL_MESON
 	tristate "Amlogic SoC pinctrl drivers"
 	depends on ARCH_MESON || COMPILE_TEST
 	depends on OF
-	default y
+	default ARCH_MESON
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -17,25 +17,25 @@ config PINCTRL_MESON8
 	bool "Meson 8 SoC pinctrl driver"
 	depends on ARM
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON8B
 	bool "Meson 8b SoC pinctrl driver"
 	depends on ARM
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_GXBB
 	tristate "Meson gxbb SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_GXL
 	tristate "Meson gxl SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON8_PMX
 	tristate
@@ -44,7 +44,7 @@ config PINCTRL_MESON_AXG
 	tristate "Meson axg Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_AXG_PMX
 	tristate
@@ -53,24 +53,24 @@ config PINCTRL_MESON_G12A
 	tristate "Meson g12a Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_A1
 	tristate "Meson a1 Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_S4
 	tristate "Meson s4 Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_A4
 	bool "AMLOGIC pincontrol"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	help
 	  This is the driver for the pin controller found on Amlogic SoCs.
 
@@ -82,12 +82,12 @@ config PINCTRL_AMLOGIC_C3
 	tristate "Amlogic C3 SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_T7
 	tristate "Amlogic T7 SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 endif
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
