Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C8BC369A1
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 12:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdynYR3+UzRbLSNTtL79Kihvj/IlCToqMrCXQey1Z8g=; b=5BSA6e17JFN43h
	Y0AQYHr8+gWtcd+BhejnygnNjrQ7SuJl8oO+RU5Sin43fwixL5VYSTPMRlfx1gedoOj4RLqJJdQRk
	3KPJq/aa7FdCgnH66EfqaXqtFHDVIjmRPBE5K1OFUZu1mHx03eVG/e26IbyIQcNkT/JADbrr3eubf
	cOCBcW49x7yjnXoOdzbwFr0GsmCjR1hHzTsiHP894I/L8Eo9FRnEC3meM+NxvqeLkqOkBE/z+V6ZM
	xnu3RQqH8BjE39jNlpAriiiXCH9/shaLI1DA+nyRGj3mgte0EmyV4760YJwahHCQtMuLhqo/hy36W
	F/sy7f2vNPwwiLHMmUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0foM-0000000Bd8F-36Gn;
	Fri, 04 Apr 2025 12:06:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffa-0000000BbAv-21Q8
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so1376505e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767829; x=1744372629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
        b=WhbiFZam+O4flKKumj3ZkIuA17feGKZkP9/SxKUNXUlQXn/JtmyQTo0ysJk0GWXyJV
         GzAmfui0hRI2oaCMfswMdvuFU60T2J8aYySsbmuhD2BjvHFI5SqU+QxPF4GBao++9OBB
         YrGS+XS7ZEnoKX2pl9SxFNyrl5V5I4aQrceYSUYg9n/CnrWYcr0YLOtYA2u5y+buqtRt
         r2DC167mprbi3u8vEioRp5XF9FC/KOSeCxGoHcq6dQe67T4fFYTTjDbiyda6c2V1X1FI
         7V+I39Z9+SsZxH3A15gn+yeQTEChMTt84CIS6adPSQuAd+rFzNkCBnsE6jBYFC62r+eu
         LO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767829; x=1744372629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d106TqNSzkY12ISczNEwfjZ5zhpWhqK85bfmJ3moKtE=;
        b=UTDJk24o9Oz8C1rChnUajXKea5b0hHwGt8lkI1aAO6V50ZyP6EXTvZuuGM5htGnc0Y
         pCmkU1GJsugLUzycRQfoYDdOp1ev3jXmGNwVH/pFAIrzg/wNAggf42LSE4TUC5yGTjsP
         pulllDzirvxHF7JzQbHpvvWL00zwHaVw+8vOE2JS5fpFeMpOtaAntucGusQ5MrrasZwI
         6UY6dlCSWcs/xrGnKYrtWvloQRpdWWlnaGtqprIguou2yuRLeJPt0uPbaEYyVku+12TI
         YeoNsO0zpeKwbaPZsuJ0FdPiaV1NV5xhJArOeMnO6WWb1LTi+LBy+RlX9OGY2ANin4JS
         HgIw==
X-Gm-Message-State: AOJu0YzyCsyT21FFuHoJFW6Wxu0qHDRhLmuzkd+3mVajXWaV2eIi6a5o
	O8o0zfWMpCGM5K6dAWI4Q8LPznPTB/cb1nBEm2FmrEJ/q5f8nugT2ymojEEYkg8=
X-Gm-Gg: ASbGncsEF6xAJzLBup3XevnjJ+6yGqARMmhC2n5bU9FJ7pKzhsldUENZsEluK5836dk
	KkrEYJoyb5xk4+ZbN6HhSibjUFnTqcEFK9skI6oanwMhC4rM/I1CDt3vCRXGVy90OEiE0WZCEY2
	qIdshlf7iCYQDQHwTYpQm2gefmuiA8AUUMiMi5U2Rk5RosTfmTJlpuvRl1H1R2lfIjiT+w7rI2N
	yaFcEiIAezHdy4uauLVEhdRDEmL34D916Inc13oLm628YphryxDlaHVAG98prDNlvq8kj4fftL4
	nPsRMktU5Pq9DcgUbS5KCBbYcR0Qm8E7EwDxrx30qv8DuwQ4Jjr7m0XV+BKWuSU=
X-Google-Smtp-Source: AGHT+IFUn3Ncq3UJFAd17WQ9Pi1CnRMlttoznJGCzpSMvyRtLW9B9mLaVZY4lCtohUQhqeiWfvicpw==
X-Received: by 2002:a05:600c:3592:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-43ecfa18f83mr8121025e9.7.1743767829072;
        Fri, 04 Apr 2025 04:57:09 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:01 +0200
Subject: [PATCH 5/5] clk: sunxi: Do not enable by default during compile
 testing
MIME-Version: 1.0
Message-Id: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
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
X-CRM114-CacheID: sfid-20250404_045710_558634_E7B98D04 
X-CRM114-Status: GOOD (  10.50  )
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
 drivers/clk/sunxi/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b175dce798ac8b3268b0 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -2,13 +2,13 @@
 menuconfig CLK_SUNXI
 	bool "Legacy clock support for Allwinner SoCs"
 	depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
-	default y
+	default (ARM && ARCH_SUNXI)
 
 if CLK_SUNXI
 
 config CLK_SUNXI_CLOCKS
 	bool "Legacy clock drivers"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock drivers being used on older (A10, A13, A20,
 	  A23, A31, A80) SoCs. These drivers are kept around for
@@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
 
 config CLK_SUNXI_PRCM_SUN6I
 	bool "Legacy A31 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A31 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.
 
 config CLK_SUNXI_PRCM_SUN8I
 	bool "Legacy sun8i PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the sun8i family PRCM clocks.
 	  Those are usually needed for the PMIC communication,
@@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
 
 config CLK_SUNXI_PRCM_SUN9I
 	bool "Legacy A80 PRCM driver"
-	default y
+	default ARCH_SUNXI
 	help
 	  Legacy clock driver for the A80 PRCM clocks. Those are
 	  usually needed for the PMIC communication, mostly.

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
