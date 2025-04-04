Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A622BC36010
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SgOv4Hjx3FpbpEdnumUIY9vYvUkDLIpdyR0ow9ZrEQ=; b=l2JXp4/0Wc3G3J
	h22T4BUmyIUOLoGf5fdyO+a09/6zMLUy/+K/Y3KIeEcZA4gmfrAUsNYPyfykTj+pdrE4BGtG5uqdD
	8mh/oROgpsavkJ87HnZlgXzbEH/QbLDQ9epOL4F0oOeSHLczULD8VzvcSRaz5cp5goDmNR6WNhjE0
	H0uB+PHSunSPCaINaiul96QIVZYxRnv0Lt9pPr/ki8DUT/Y2RTjXdBgKzLr0iX9Mf3EKiGu7jbLP9
	UPk75PngDJt5TddZxoDf67xT8eGwt6ifsOlRMZwRVmtWY0djTb8b55DNsn3i0ARVDBDRGtDjVJAH4
	llgUgECLjE02T/iaYYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fma-0000000BcWw-1Xe7;
	Fri, 04 Apr 2025 12:04:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffW-0000000Bb7c-2GgO
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3913290f754so218064f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767825; x=1744372625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
        b=SzqWlnLIIyW+ZjTYQ4UK3YD7cxoYabZTOX3MPwonQoAzmNunSEh0/EOiFGsfG7yf/Z
         vymXeEkc63ecH8R0TJaTmsbASN1u0oGbi0rqUV7dUd3daAb6R3dlgEHTz5IXOpDbkdVw
         +G5FiQpjCkGZwVjQJXpjuMuwHIPxnx6O5EfGamOqrA150lYrl1LX26UBysbLF+sFUO1S
         QmAPJH0+FXYcWONgxo7ImvkBmRLyIOvvqnihS2OmTBdb1Wa7hzdfcqsb0nbRLB9oLqyX
         9EhQvpKCTgbiRZxz30AReVVU62ea7dDjiO70JyNShIpDsslQ8x2KhytkN91GNfG0EyS6
         4HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767825; x=1744372625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
        b=gQ8jbePsdPvQqxIHDo5sOnyj+e7OwfnA2v2oBlnGXcl3sLP3GIZ/+IVlcD7be1lwo+
         yJjcwQCBGTnqzhn+7FD/z45iiYs/RXFYsf+3Gjy0tWnLxpXV5FA1yzPZ3mAcfAFhfqzO
         NdPA9YX0Mua0gf1MxMXi8W/Fy+c40oOL9OENPyYruBzwI2cW5uKYi18eqMnPagyoJSQL
         CS+zJETHraKU3rmQlkER5/+H3xAS8uGEancQFkyVHeUI06iCNj97hl/KMnCSqut3PuEV
         d7rRIhkljeQomAoIlQELQ5sJ7qVQhNWUL1//+bSR8IHNt48AmP1AufDsvEAYkRhZFapV
         6iXA==
X-Gm-Message-State: AOJu0YwrCckW1K3wak0EcQN86QZzmatW/9v94BCSjjPbbYr69m2TRyRC
	cIn/fOTpmGNyobJPcmxJOv7QcoFE3iU6cFhOXFWZWSl20yrvBo5DRu7F5JkyQkk=
X-Gm-Gg: ASbGncsqunppJtq0sM9qO8/S3LVTJkl0XepTnPUVJ/74uLXPWyG9ABA6aDJS9GLD/Dc
	I3YTBtRasqDtNORIR2aMvjVOvKIQio2UqktxzgM2i7d3vErFgCyQLPI+obJB7NcPUVG015hw545
	OtKiY/6Ha3yfpPQACRPQJ62PnMZNKRO/uiORP8gi2aadbqhdUYC/T+iWvXzPMwPoaLpud1/0T4I
	d1Q9vqOlLrh1eisnFD+/+9dPKX31gVeskdcRmFNOCX3Iv66i7RG9qfuclVF7IwL+gJdGeblTrCZ
	up1mnbdajKTtHo0Z7ymC8HWEqkf70PwIbnFYV3oHJLreiatHD9bCv5aeBD34O/xaOs494fgcPA=
	=
X-Google-Smtp-Source: AGHT+IEbqWVdAZjF0/qLy/H0JxxfBZjOz1OHqDHaLpBpQad1gKc6l1hGJIvzr71knts2F+y5b2ubng==
X-Received: by 2002:a5d:64c7:0:b0:39c:1258:17d7 with SMTP id ffacd0b85a97d-39cba94bb2bmr852989f8f.16.1743767824815;
        Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:59 +0200
Subject: [PATCH 3/5] clk: stm32: Do not enable by default during compile
 testing
MIME-Version: 1.0
Message-Id: <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045706_671067_FC45FDBB 
X-CRM114-Status: GOOD (  10.17  )
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
drivers.  Restrict the default to ARCH also for individual driver, even
though its choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/stm32/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index dca409d52652213cfbd8d5ecf1a339ea53ba5d52..4d2eb993ea0838d408ff5b1e5b6d028cbcaa9301 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -4,7 +4,7 @@
 menuconfig COMMON_CLK_STM32MP
 	bool "Clock support for common STM32MP clocks"
 	depends on ARCH_STM32 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	select RESET_CONTROLLER
 	help
 	  Support for STM32MP SoC family clocks.
@@ -14,21 +14,21 @@ if COMMON_CLK_STM32MP
 config COMMON_CLK_STM32MP135
 	bool "Clock driver for stm32mp13x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp13x SoC family clocks.
 
 config COMMON_CLK_STM32MP157
 	bool "Clock driver for stm32mp15x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp15x SoC family clocks.
 
 config COMMON_CLK_STM32MP257
 	bool "Clock driver for stm32mp25x clocks"
 	depends on ARM64 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp25x SoC family clocks.
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
