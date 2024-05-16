Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F805C25B74
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mW+Rk2K+u4cy7NdqaHLI7M4FR+qcmWJNJc3iACk20M=; b=HNAhC6XClwYWAz
	+sLGD9ovOIKIb+TElXuBH6I4T0ScIUb2tHwsnc+1a4WilFA/sSa1EO0DWhGR4rnJ1Ih1eX/cIWeZC
	ohGbPz2FVrRq9AbGTEFGJovGWXDqm6/cY59iS2tfaufYX4wRnYH+FggJSnegskygVT8qTHXouzHOg
	ZqnMKJNLifUNFdntd+fk5c4XQYAehtzsy1TfVFHpdbdKO97fl5mvHwukzUKeEsk1UIcGc2xI0w7CP
	whnk/iUdZSXsBx5UsxJUoRIljJK3Kb9/jkUEDFoso7WEdi2HGr8DVX2n4lh95c4Ehcq7TZLVCpKTI
	WJ93EvjlqGkBi2BzJ6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cj4-00000005Fpk-3sIk;
	Thu, 16 May 2024 15:08:59 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cix-00000005FkZ-0xI0
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:08:54 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2df83058d48so11219301fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872129; x=1716476929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEvOpWPnO+AdwLbOiUNmMA/qUdgyKNblxOI/csLZzos=;
        b=eaHCteu09lb78zw3+Lq3k0kMKn/OAWbP/iJNHNai3/44gqS3teH0HGBvi1kFw7Z5dn
         m/qqG1jhkQPSEC9kCN3C3XPBem/GWqgjqI0oGsZfvxSnN79rd83m85A9C4KgZBu/18tD
         /3cuQTO8HfOr5IMJJRBIVZ9eV2hipFjeTWP8NSe6XfTqos3XweCXzRYNx8guUZQe5XXZ
         IydjP3CGjri4UsUw6G9NYHdLtKhN6j37v8Qh7MtRrqdCdzsMl47i9QEJHurqsiyLPwS3
         /0n8UEFZ6mDiZwe6n91GbgVkhAkElOIVn9HQc2BTURe3+/lS3BFG5qfHe0E5bR1LoRBr
         29cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872129; x=1716476929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEvOpWPnO+AdwLbOiUNmMA/qUdgyKNblxOI/csLZzos=;
        b=k0PaKXYoO4VOG+nHfwhlsDxcjFrkM1GgQRz/od85EHGl36FBy7OA4EdNzpliZ/hpY9
         cOexT41HIh6i1XO3LHe0TqbyxkY+MUlY+4jdtMLQGeig0ToSXmE2BG607RqIqx4NLXTC
         SuhZ0G6684e11mtCbuFOkDFP3cidEkXQUMDEzDp3SrDuN+SAllc1Mjz8NMG9TxDws4/k
         ZKxgJDVc2d7KnRO8j0CwXv5hxm8ei0wOQa/s4UzGcs0xZWPVp1C0CGrqifO6owPRX2ar
         Fh/0SGRNDtYvv4QaaPDHqchlq95YUEwYhnf3RJ3H993uGltO+ds7eJRDAp0RocOvSiYA
         Agbw==
X-Forwarded-Encrypted: i=1; AJvYcCVuc+JOp+F5zAQbFnHSgrt4e8xHnk2K+SbmEnbzcfDiGK0giDkHsgDYjXNDk5DtTjszzbcled2f/bxuLUbftw+Rnx1HldM9nMhaFcvFMtgvNeA=
X-Gm-Message-State: AOJu0Yy5nIr5q+NTpeaDuueZaSUEDAMwkBpuqYTScK/rSbIk2rkXvYkn
	31WJdJs6ZXznUmCBxLGS/TH6cu/Mm0jROn+pM8M66dK5/JeFIkj+Zb14h4/WwkA=
X-Google-Smtp-Source: AGHT+IGYAck85LsbcTOvXFQY8nZM3fKLyOR5JchkAjsB3ueKLHe+uoUsgS+o6TUKMWmJKolx9ml/0A==
X-Received: by 2002:a2e:a412:0:b0:2e4:e15d:40b0 with SMTP id 38308e7fff4ca-2e52028aefemr120909581fa.32.1715872129220;
        Thu, 16 May 2024 08:08:49 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 2/9] reset: amlogic: add driver parameters
Date: Thu, 16 May 2024 17:08:32 +0200
Message-ID: <20240516150842.705844-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080851_369071_EC7827D9 
X-CRM114-Status: GOOD (  13.16  )
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
index 8f3d6e9df235..59126c9f194a 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -18,7 +18,9 @@
 
 struct meson_reset_param {
 	int reg_count;
+	int reset_offset;
 	int level_offset;
+	bool level_low_reset;
 };
 
 struct meson_reset {
@@ -46,6 +48,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
 	unsigned int offset, bit;
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->reset_offset;
 
 	return regmap_update_bits(data->map, offset,
 				  BIT(bit), BIT(bit));
@@ -60,9 +63,10 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
 	offset += data->param->level_offset;
+	assert ^= data->param->level_low_reset;
 
 	return regmap_update_bits(data->map, offset,
-				  BIT(bit), assert ? 0 : BIT(bit));
+				  BIT(bit), assert ? BIT(bit) : 0);
 }
 
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
@@ -85,17 +89,23 @@ static const struct reset_control_ops meson_reset_ops = {
 
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
