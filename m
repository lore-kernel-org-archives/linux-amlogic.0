Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0EBC52D7E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZpifPePBPRjMzY2plM1XovwX0uD5v/2c/wyrJmMDP0=; b=0aSWlyEsObxaU1
	zK+s6tivts+qw0zeqgR36kzWchEIEvQVjpjdpFnsO1RwogDV8d2ON8qVbnzH5aMSxqTjxI02SZXdc
	EErYf52oqebLpyjwnKt80LcZfI5iJU+1UMZYtaWrfnBIf4urMwapZ2naPn8sAZIckqsGcjwW105n5
	cfnTWlzMU2SjaB0sAKOrapeopJTX6LIIEfhB7OwfDqspHUTLoUZby5yf+0VKjvYC/bZSoYsMBn9hG
	BfjcecwiIzjeqw+fzUe9KnD7MO5ddPwa7MTe5/9bV0FCE8q5hrmbejYBmCO4c+cFFARrixE82bT5i
	67nQsJz1o02eTb6+rF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NP-00000007tPu-369j;
	Thu, 08 Aug 2024 10:28:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NL-00000007tKI-0LT2
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:28:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4266dc7591fso5833385e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112885; x=1723717685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPYzDSfyZeo+xZ43EsOSaQrJlRNd4kYLYsIOWeBqO/s=;
        b=zBneeasxsCNgOsx+04oEAZUzwPUO784QqLuhYuKa5APxt0uOepFzhmeqhu4//ipxOb
         CU5N8agf76SjVzbRX2amkUTb8d15GMmoPtGNEuIlR+5j2zOibZzyAJOvAlZbVfvNT9Pc
         xzjb3OA7l5DB5j6tOXmWPb18bjNCm+tfppp/mV5EELjChCHnLLr6L8bbabJkFh3LRyTX
         U4Qwt94OakqD2Je5FfN4vEu51oG5uevb8Uy7TAccBRRgZ9Z+B/2Mc5zRMtAJvqdu5kS2
         SDrEJnXPpo04lzwW6qIVAyxDpvv8GLJLbFFtWfhLtqbhJ0lc0acLzYCloqF9NK2AJV2t
         FD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112885; x=1723717685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPYzDSfyZeo+xZ43EsOSaQrJlRNd4kYLYsIOWeBqO/s=;
        b=PKEo83PV4pdGDIK79KLf3kSw17Hz9c+roV6nv6BZkW1J7UxdxzkBatFPUD1QkQH7DW
         SxSn9m/P6+vMe5ut9utHtEV+y8ETIF5QzyTdK53LU+IOposqY4SutJ4CCuESTEeHk0Xr
         e32C3gozMsLKfN3VlmbxyZ62+zWcO5d0cJD3KWZMdCU42aoORE+nEj5tIOj8Kn2IhLYE
         wdLFfOO2RTPiM/oyFRWO2tqt23VYvkVkFL8CS9sYtEPU85ET/uZCagiujCwv6kcFpmUf
         vQwORT4XMIK1UkCWtFfk4UB1C8sfeGcA84B36Mziu9YlUoK4casU+fTkmSDMoJYR9vmO
         XyaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLzVBrsjwmQ+hmFXrsED5mClIcV5IW2rTXrR2+xnXpvkWLMKKCkua8LR5vWy1T4Hhp0bF7jUpxx+2hZIZReV6Xa1SFzbSGIF4YT4etuB3cDGI=
X-Gm-Message-State: AOJu0YxjPsoY3ZNRBHwnSOtgjFthkKjwG9Xk/jU67+zNj4TrBHKm/wQU
	luHyBBsi3PAvSpqIQBimf84zEiz0DITgQinlBz8uV37ptBEJYu3kfdwSBkd1yWu48h8h5yADoXM
	5Ho8=
X-Google-Smtp-Source: AGHT+IEvuEQLxY5NIcMxDxzPylcOhqHiALm1zbKzM1rXD702BA4RHo40fITpoOTHXRDRu8mJI7TSYg==
X-Received: by 2002:a5d:588d:0:b0:368:4e38:a349 with SMTP id ffacd0b85a97d-36d274e0773mr1313790f8f.22.1723112885055;
        Thu, 08 Aug 2024 03:28:05 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 5/9] reset: amlogic: use reset number instead of register count
Date: Thu,  8 Aug 2024 12:27:35 +0200
Message-ID: <20240808102742.4095904-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_032807_211766_4703C847 
X-CRM114-Status: GOOD (  11.99  )
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

The reset driver from audio clock controller may register less
reset than a register can hold. To avoid making any change while
switching to auxiliary support, use the number of reset instead of the
register count to define the bounds of the reset controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 8addd100e601..5b6f934c0265 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,7 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	unsigned int reg_count;
+	unsigned int reset_num;
 	unsigned int reset_offset;
 	unsigned int level_offset;
 	bool level_low_reset;
@@ -87,21 +87,21 @@ static const struct reset_control_ops meson_reset_ops = {
 };
 
 static const struct meson_reset_param meson8b_param = {
-	.reg_count	= 8,
+	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
-	.reg_count	= 3,
+	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
-	.reg_count	= 6,
+	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
@@ -148,8 +148,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 				     "can't init regmap mmio region\n");
 
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
-		* regmap_config.reg_stride;
+	data->rcdev.nr_resets = data->param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
