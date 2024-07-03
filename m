Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C68C31D97
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5orDg/3reeGaRPdWC79V68VEnNol/8M6MBHxCSFPnww=; b=N978/GnEQWjgbu
	SssXw8RKYg0l8WznxCV/0lV66JPMd1Y9gu8B4Q/i1theOvLwEKT3KH6tqvsvTehsMF01y8uVg5YzN
	DFhd0wzvlH9u9I07//UlEXsY5WsZzUBuFY54BKgJqfaFSEyZW4RFYTOnR/oRmvjreyL8dsVYehVna
	Su5Wfo0yiG+AZ8U1nSXyCO3yWCOQtVjM098OgCBrW7pelNVYC5CyVAGoYFud51/zCUW0GcB2HpJMg
	dJkTVcG851BqLw0GiyiiYzAs13+GBN5caztDsUAyGlM41y+gFO2cf/afUdaBo8PL0L37GZFdfKqRw
	j3iGXaRAtCTfB9lMKRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdb-00000009c64-3B6A;
	Wed, 03 Jul 2024 09:50:55 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdD-00000009bsC-1Pni;
	Wed, 03 Jul 2024 09:50:32 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-58bac81f341so1721021a12.0;
        Wed, 03 Jul 2024 02:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000229; x=1720605029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYmIYCmqwVvji/gLlU74cbPYmKHONbdVpgfdzYyiV74=;
        b=XmB4e3rnsDWpqS4j4pkNgLs+C5aBREw1A+Dj1vRbrLrenOsoXguceKuMREbLQ6K/V0
         NwwgQaq+GLW2KN/Dz4tBJ+DF18jfFqIu13F/yDgfjUKL2BnZ4xylw+QBt0Hj+5XUVn4n
         +bmq4sQ0W/V3R0FgFlC8rhVcU8EK108ga1S0VapCn0QsUA0GIDmxlhjUnL5hgN2CPteU
         NY8pRpkMc1KKDkSq7d3V6NH1CfEJ1ZLW0lPKqb0xh9u7W56uEubqdOjB/G2Q7wVPdg+H
         xsLH+UAuUfj9Czx7+O7OrffLSlkQ5kMBc/ICibkOlYk2xjCZ5FTs2g2cwM+9FPWKqHDF
         gYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000229; x=1720605029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYmIYCmqwVvji/gLlU74cbPYmKHONbdVpgfdzYyiV74=;
        b=u26B9zcklHyUvr8w7QJMYi4Mq4BhO6DHguTfBg+4+WKvoMTeMdGcoiQdsisbcT7Deb
         4Zy9KogaWR/yj7yq4oexp6ffa5k+DxuRdvcbnM0Gqt/9BCvLgBgvbUEdGhJ2xgh1jGI0
         5CHRTJQJKZHKfVaMvJjsuQxDni3RTTbeZTEmFR7nrNSKBf6Uh6bBxKnm2ExTtGcCCM3m
         wz4C0XN3GBinIgRFvvxoCl4pMpoYCz8i0mLb9si6zRiDzQt6Wh6Wys192jQ0AX5Nbzkg
         H0f9LvEpzReMq7o19zC3Y2Ade/f4gR6kUpijZ7b96nlBQ0v1FiEMSbH9BkVOOn9ON/hp
         jJBg==
X-Forwarded-Encrypted: i=1; AJvYcCUhY4HM9gshYPhZ+Tk/e3iqft28ztQDFYQB9zzwAoC/VifcBF5Yb3UF5gMG+IpbODzCE9yFOFVuWJR2Rl1RbhnBl4QOpHEEKT/hoPJ9SJHeHrQGQlg=
X-Gm-Message-State: AOJu0Yzr1OQc7YxqDGPFZmRh+BeRNfvFARCek8lSyvQuSCQ13Vfiaowm
	RhFSMIa5V+IDfaeBoV7PrquDNtMcms8z2CLGbCl1QnqeQEqdnfOY
X-Google-Smtp-Source: AGHT+IEjqZP4O3mOUQ6GggXaD2dddoBtsXMh2gmEY3SRCb34lAPZsm7CE9jeeuYqrl4eCohJ0y9MQA==
X-Received: by 2002:a05:6402:4304:b0:57c:d237:4fd with SMTP id 4fb4d7f45d1cf-5879f0c6ab5mr8167310a12.4.1720000229439;
        Wed, 03 Jul 2024 02:50:29 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:28 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:15 +0200
Subject: [PATCH 02/10] clk: meson: a1: pll: Constify struct regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-2-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=729;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=w1rOHhvKlNZR5V6gMM58fQeON2s1grhUcmwjN3eUzC4=;
 b=VJKr1FcizeZqWLivzNG3Thfjr+2RDK5PLLnFSUkzF90v7ziEIDUwgUNgPc80/Xsr3c6NTdsUv
 eaNxtmI5CINB3at14UF4KycZXJyoTf9I7pB/2nrA1YleMXLtogVfBdT
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025031_413494_12A6ED68 
X-CRM114-Status: GOOD (  11.56  )
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

`a1_pll_regmap_cfg` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/a1-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index a16e537d139a..4d0a6305b07f 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -295,7 +295,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
 	&hifi_pll,
 };
 
-static struct regmap_config a1_pll_regmap_cfg = {
+static const struct regmap_config a1_pll_regmap_cfg = {
 	.reg_bits   = 32,
 	.val_bits   = 32,
 	.reg_stride = 4,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
