Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D928C36010
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 12:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TU8Uch28zY82U367zRZpfB2Me2YBBquV9Zs9uKwFBs=; b=18UgnBHQKzKpfB
	TB71Tmy4irTWcaKHM5am7HHk9+Ps7eW8HcrjyNPbGB6di8CCRZJafaJXMgsH4AwEieXtdglS4F17Q
	yMxh6xsQ4ha39HgxagDDUcOEsQWweSRSZqRLrjgGIPoFm9aOXKK92u+2trsAIYuhGbK4t4iKM3SDu
	GMsG1ARnpQfmaEGIB5Lt187NX8qzAeDQFli+e/h5cIGJcLAiwXHo1x0emQrs+gDTqTjgFL9DZBUSY
	XsDPQ0IyVArNrcT7FyTFD5fIGZ8+2FW45acDd4Tnb7Jw6rWWmGcfWthQZMlt7kBp2mlLvWWs0/azy
	tSOzJhntz3viwoSWrxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fko-0000000Bc8g-19H0;
	Fri, 04 Apr 2025 12:02:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffU-0000000Bb67-3ZIA
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39973c72e8cso195028f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767823; x=1744372623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
        b=q2qB1xRO/YW+lV1RnVrsGW370m96S0//VmPjGAskuRX90ATZRNC0ugJBfXx5js0Iwt
         vqLmjAW+xkHNMEcF/MfY7qHV+KbPkcsXB3xyz3mqqmYlLr4JKrwwl6au+8lWRJL0xPmq
         b6BQbPsQJLwEKZKFykRKGn/QJS1wM2ebjLeEuJ+NAGIZjo2krwNWp/B1bNyThTiN9Gj1
         wV2vZ5uBw8xHVTn/IpJRLOxZvfuPGezBvB9gtoC9WOYIJGHmxaJ99xcWfQr6jwXcKa50
         hlhzOrA/c4j6oN9pu109x6DAK5QSGukRfbX8G60Ad9C+mi5SXtUpJSAOH98w4oDNnFRr
         Uz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767823; x=1744372623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
        b=dYyPY3vSm65zsEAlJO2RaD42VMbl51OfnO1HL1Q99JtdoJ5MTu8o5ZXbUpgeZfujwj
         Z0WbK9LPyMDIGxWbuEkagpoNbbXRR4z3XlW1zL5PI3uGIJ+nskZRdai2zlKtg7dve31i
         qRKa4EFFgzonsmy0HodJTXpxfP9MR2EI19yBY1jPgz8RSRWyIjhuqfajwaavV4ZCl7qP
         qhMZvI+r+haS9aSG/2TqxXrWD7iUhM5N0ABQcjlZcR9mHyI4+s6gNSlijpo6uRsDRcgd
         +pRf4elf6MbFZAam88AGBodiBpzcxz7vDV3TKOsnCouxv4Mb9T3Uu+OLoUtDaoJtgul7
         jF/A==
X-Gm-Message-State: AOJu0Yz29yJ0SwuI5xzfInvR+wOPt85CCMI0otVurIiXzCSFEZ9Cg4sL
	pEz0rwX/mf/qOckBVamzva0orw1uenkf2WHzaWPnQ7/8WUSbNQ/r4R5p7wRzmWc=
X-Gm-Gg: ASbGnctI/fzFXAh9jGwkknLBW3nbaw1hrIIeUK+2rCEdVB+qgRHNoMAB+eyxcvtjlU/
	1pEYFFzRdPl/slr3oN4MhMHEQG19vr2oYobJj5G6hvm/BWa52rUUqI7z45Nq2baBicpgkXCm/ec
	0KajALJCVyWP9RtX51iE391Cv+AvqpMhzWHwApqZKtaddeVe6QW8iv/61nztQnljqrRvsn3nNMn
	sA7Dy2VV6iKmd9ZTvGTMxMAS6OLmNxjkIM64C3rFWVjjbufZc0shGIe7UO5S2s/wTgN49DaSYUq
	Z894+mIqt1fly0TCGtN4f4GxLA9+TP7Pj3zAwvqpwwYSV7t7C/KF4sO/w1Y1uJ4=
X-Google-Smtp-Source: AGHT+IGREdRnQ2gEflgpMySypGT2xrFpTeuT80iZBzxVkRizH3MB1Iv/GdfxP0Mu67TBThpOTa6MIw==
X-Received: by 2002:a05:6000:188e:b0:39c:266c:dae with SMTP id ffacd0b85a97d-39cba936215mr862740f8f.11.1743767823172;
        Fri, 04 Apr 2025 04:57:03 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:58 +0200
Subject: [PATCH 2/5] clk: nuvoton: Do not enable by default during compile
 testing
MIME-Version: 1.0
Message-Id: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
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
X-CRM114-CacheID: sfid-20250404_045704_893196_80537545 
X-CRM114-Status: GOOD (  11.16  )
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
 drivers/clk/nuvoton/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/Kconfig b/drivers/clk/nuvoton/Kconfig
index fe4b7f62f467048b7c86890972d55faebd066947..e7019b69ea74824de6943108f30ec259aa52e5f4 100644
--- a/drivers/clk/nuvoton/Kconfig
+++ b/drivers/clk/nuvoton/Kconfig
@@ -4,7 +4,7 @@
 config COMMON_CLK_NUVOTON
 	bool "Nuvoton clock controller common support"
 	depends on ARCH_MA35 || COMPILE_TEST
-	default y
+	default ARCH_MA35
 	help
 	  Say y here to enable common clock controller for Nuvoton platforms.
 
@@ -12,7 +12,7 @@ if COMMON_CLK_NUVOTON
 
 config CLK_MA35D1
 	bool "Nuvoton MA35D1 clock controller support"
-	default y
+	default ARCH_MA35
 	help
 	  Build the clock controller driver for MA35D1 SoC.
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
