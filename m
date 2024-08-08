Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A462C52D7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZyGMW4eNeVzTJwPL72LaUli/F5tLE+hZ4umilTGH9w=; b=FYjE4UMlyGdb1y
	HJLoGSHuaEa6EgO1GuJXDzaYMWglZ8turzT5dWCj8pPVa83Iqkd2E28KwQ7mWUqTt2k0TTqScNDbx
	w/Q04oPXlAa1eiJqSD4I43qYUDSR20PzdNVwtfhMxR2JB4qqC8v/Qdm9vYT8mkgG9z06qzfNrWH3T
	qDLytTTak9WCJYCKy2rLaJNiTj9UEc5lvu/gqm6vVqMF+Ht1qEf5APxcN/Ae0HZwXNo1aG9yovx/+
	KE3V2sz44jXfFnep/0mgpqBSHm0KFOaMFluoeLNyUeMF0h4X0JWKcNiVgbEG2brA/Ml3PWxFdBBiv
	EHUTyV3Df4c3xPlpx3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NP-00000007tP4-0Pgb;
	Thu, 08 Aug 2024 10:28:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NK-00000007tJn-1UyX
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:28:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42809d6e719so5742555e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112884; x=1723717684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr0Cx+l93ievhcSqcQh58PvVUEHk0s6N+Y0wdAmtxHg=;
        b=tWMLLYg5QEFisbyz/Y+QQ7hKUI9p8UDKAe3diAZUcTA3D50f5uf3w8Y50T2MC+S59R
         dcTmoJIJg5ynG1uF+Q6nvnjKMSfGwNT8mexWRnwgAcL4y2W4VflLHvBeNgftjJ6KuA2H
         s8mCsDKpKR16BQvtLlQ/ZUAUanEb3gv+bPulTjY/MjMpJjsNNymnnuS4dWf64T6OB9mB
         3nHTOPLhEgi2xclBf4me/eNLLb4jo2KrJlXpVpHCqULxxfbZEwQGYBqnCcfl1tNqBl8P
         WqPAUlU3N7ZBaGAAaeR3/carF/tXYYrOWUl+2+lVYAv7yGTdRe40NpXbN8jIO7Yxkp4C
         s0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112884; x=1723717684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr0Cx+l93ievhcSqcQh58PvVUEHk0s6N+Y0wdAmtxHg=;
        b=sV/ONFuVOL0NNTVcegFVL88Oay5h/KDSXe5robko2IIGUsPeKuetRP/R6NfCtXBg4v
         XoDYF5Z1sfdGBLcw20lZ/mB24A6jdf40kEJrEeD4lPoEPdM4nz0N6RVlm6t35a2wEKtT
         eMVZOnj3q8W7TpEzqEHev4/1/MF0pv4D7AwxQKpQ4cJjHyC0EAnKab8lH/FEqG5cijqv
         o6Nosm2oO9XWuDTkrCuMQXB2wn/WFXutcaGsZpTtnx3Z8yxgx/c976qZjRJyj0wzcOWZ
         ZBNIxKaQQs2ir1uz3X4EkDjINO7/kW1iXXavKZUBohV7vp2EKWTvTNDXGjxKVFYXhHHD
         +Wug==
X-Forwarded-Encrypted: i=1; AJvYcCWvKkZMX269Myt1G2S6NM8R9jR1YlMop+fE17ZNnIXkT/WWqenr2kzYCoqU4a/h7FCJUZwz4WWSaDeQ0dgNDno8ucCwsRAKC5TJ9iN6Zo+lF+4=
X-Gm-Message-State: AOJu0YwlZ0ruRCWKpI8TzasmY4dcMwY8qYqSL58t3Lgpc0C+rp2GjIXE
	OEfh7/3Pv5erlLpZSMnL4C0yD0cj5W23U0GTTm5O5OGaiaHd3rnHShkIwnhodFg=
X-Google-Smtp-Source: AGHT+IH6euXTuyAeaO2rodq608/hHNhqkkeHwCHczxlGWUhhgunMEiXRlBHFZXboJ9LIxTbuP/bp9A==
X-Received: by 2002:a5d:64c5:0:b0:36b:a3f1:6333 with SMTP id ffacd0b85a97d-36d27554ae8mr1047306f8f.24.1723112884204;
        Thu, 08 Aug 2024 03:28:04 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 4/9] reset: amlogic: add driver parameters
Date: Thu,  8 Aug 2024 12:27:34 +0200
Message-ID: <20240808102742.4095904-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_032806_956000_BE32213D 
X-CRM114-Status: GOOD (  13.56  )
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

To allow using the same driver for the main reset controller and the
auxiliary ones embedded in the clock controllers, allow to customise
the reset offset, same as the level offset. Also add an option to make
the level reset active low or high.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 460ad2f8360f..8addd100e601 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -18,7 +18,9 @@
 
 struct meson_reset_param {
 	unsigned int reg_count;
+	unsigned int reset_offset;
 	unsigned int level_offset;
+	bool level_low_reset;
 };
 
 struct meson_reset {
@@ -46,6 +48,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
 	unsigned int offset, bit;
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->reset_offset;
 
 	return regmap_write(data->map, offset, BIT(bit));
 }
@@ -59,9 +62,10 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
 	offset += data->param->level_offset;
+	assert ^= data->param->level_low_reset;
 
 	return regmap_update_bits(data->map, offset,
-				  BIT(bit), assert ? 0 : BIT(bit));
+				  BIT(bit), assert ? BIT(bit) : 0);
 }
 
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
@@ -84,17 +88,23 @@ static const struct reset_control_ops meson_reset_ops = {
 
 static const struct meson_reset_param meson8b_param = {
 	.reg_count	= 8,
+	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
+	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
 	.reg_count	= 3,
+	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
+	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
 	.reg_count	= 6,
+	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
+	.level_low_reset = true,
 };
 
 static const struct of_device_id meson_reset_dt_ids[] = {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
