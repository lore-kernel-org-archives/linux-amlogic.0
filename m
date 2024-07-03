Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E4EC2BD09
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJS5MMANkQqy9s7/lCIqpn6nvQqPgWJB3JxW2vle74s=; b=hkqgsczIT2xQHa
	+y9YRtnqR71dv5sUB3Ko948EGW6ZYUdhhkErizDRyM+k9tk6mDCtZ8Fr2aBXzFL5M8p5VP9SYfMD4
	rT7E/44lMcVqAjAy2327O++ChMeU+2DewmwFcV17rdYPS2gTMiqldRwasShZ/WKqynXDn23S61pZ2
	xdbwieuIyQ8Ntk8yM/5ExMZLqF0FNA7SAgOiDU9PXmpJrIW1CMCb9tu4+q4B61UhsT3iNdzdLsdQH
	4lOzhu24NMpOOp9VAIlV20NPTCdHnhSMkZmZU2PZeWqIwvw1PmY1ivme8RdhKIfdSyoCxjW7B6oQy
	ou+znSob0ocF7AWAHAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwe7-00000009cP0-37PQ;
	Wed, 03 Jul 2024 09:51:27 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdH-00000009buW-1m3Z;
	Wed, 03 Jul 2024 09:50:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-57d044aa5beso3258189a12.2;
        Wed, 03 Jul 2024 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000234; x=1720605034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VakF1oeyZohqJOzCR2EB+e9QseEPpQNRdPS7foA4iOs=;
        b=DRqZvEr8+MSQ3UAKLUGuM2Dlszvj0QbkCjl7FNJoTxrtjrDnom1r9hDUzunn/DLXDh
         its7UvFSZt2ySaER7o0uwvtWpw23x2AEWYLC1Yq/dq6b9tkeJzS0CxfxMMwaOAxGkSBN
         ye/eWP1X+xi48Y+D9IuzhfNd7FC9d+LJhSHlupM4G9B87wpxvHyf84YoGd2+rzQtv9Ux
         P345lctLTk2FrFs1I1+HLYnAP9Cmf+qsDy29lKVpls1wX8/AwXiFiPPQMX6S+qf2XGnr
         +fx5Jjyc5bShhs27qnRGzHq0nlZEdF/LxY/854E1VeyUbv7vODWRsFnBEz0Dlwg/KLBs
         iHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000234; x=1720605034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VakF1oeyZohqJOzCR2EB+e9QseEPpQNRdPS7foA4iOs=;
        b=ijc/U5qzgXbVs2AmjhbXrkpbt44IaIaZNM9cOzMrcJHW6RW2aw8HyBTel1mZCZvJ0E
         t2lkbAjRzrO2NAW9ZVBT2OEkOPEa4jXsXHVnO2P8BFLhUYUDN/mIMLGyzv2E1k+IrSwa
         9fYOKo7s6arP6D3I0IW6rfdYECaFQ4gxO3SOvTja9DPnAPR/hVMW7HZPrOTnIo8o7Atn
         1kvoyDFDKzzEUzp1gkYiovr9a/fzeDu3uuGbjiZGHtFwAE6Y1LGz0bLrEIfbPQdCh8er
         r6sJhEdAwc2VwP/ZkmHnwZFx7guhyGBpRZhOthMpKDbmWXmtrFNuoknjxXNQRrKNKxYh
         rcJg==
X-Forwarded-Encrypted: i=1; AJvYcCVtmI+PK5gHVnN11NjwbSd86IFnd2UYfS3ylFdtm7zHPiugG74f52yJsk6Pw6c+3rFZp67AmsIbK4jcNIpEY8F0rvEX6KTk3XZZX2uudJHO1eKfXIA=
X-Gm-Message-State: AOJu0YyH66MQwrYPDXwoZBU4OZou86W312cUIGoWD1qsoeOwa4BvZLdc
	kMLJ3TimLA4X2B1TDn3NnvAT0DJ7hr9Lcq0yrBLEMPS6U2TcMSUL
X-Google-Smtp-Source: AGHT+IEGIMF6jrdxS/In8NlkeaCvlqbPYXuxDzo7b2vkqDV6QtioedyCtz1EmFD+tAGLOVsHKUj0Ng==
X-Received: by 2002:a05:6402:1e94:b0:586:e6e3:ea18 with SMTP id 4fb4d7f45d1cf-5879f5a1b6bmr7392371a12.23.1720000233803;
        Wed, 03 Jul 2024 02:50:33 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:33 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:18 +0200
Subject: [PATCH 05/10] clk: meson: s4: peripherals: Constify struct
 regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-5-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=807;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=N0gJOHgxfgNpyO7ny+dBVGTv1J0OImnbpHVOZH5V8Z8=;
 b=brXdgrZt/FFF/7aOoRwCjMcSneXj5ric9H9NFCiK+WzN1kYqNVkq0K4Ee43Qa1H6bBN27toOv
 2nHJ1WXyPk1DAD3OnpS5N4nhsoLAwIQpSJeEY+xoiRb9y0EMDFuiH3s
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025035_505956_BE01AC88 
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

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 130c50554290..ba1d531fce4f 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3747,7 +3747,7 @@ static struct clk_regmap *const s4_periphs_clk_regmaps[] = {
 	&s4_adc_extclk_in_gate,
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
