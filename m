Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863BEC3DA6C
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoat7DkhUyfa6iD6pK10z3BycAMltqppkJQ67kxbh/s=; b=LdUwuGPNUMTZU3
	Tu0opCZuVPkiDSEKSG2nn+xpL5FwjkFiVatPe57qonUC5D3SjDaa2Fgd0yNII9gFSdwfMJS+b2gdx
	wqvkHUce/1QLyskxQov7igAy/0EkKM6Ugh+zqwni2GVJiZGQkxOOaot9KFPi764ug2umjpDEmFC9S
	T1MwN+2nyI0FjDkrQ7ucFI/vb1PeN2QMABvhQwdBRemNDF5KLh1rZ2mukNmKCK/uD5UaW73XBP9QY
	3ooMs0nDpqrZfOEZ0e04J0Qdrz4yeP+RxZ7y7VgCdVruMh9/vS82TowVsa6zOpjxQq15f/Kdq4adD
	1Rlqi9yBCi1jX3duYDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNts-0000000Gd5P-04aY;
	Thu, 18 Jul 2024 09:58:12 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNto-0000000Gd2S-2jXc
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 09:58:10 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52e98087e32so137030e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296686; x=1721901486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsHCgll+Hmm8fed0dFMQNF0ix1j3UG0Ow/yT3gZX+Ck=;
        b=PZG//nwlVIktcjlt/NpoIcwjeYE+YwMRnCrUVPHWHQs2wBLFHShZFVX4Pl2QfF9vxK
         xyh7EY14evL6pdWt9aj3+e5l1of3Ob2t4j0niKvmtB2mnZfv93rU/lV0m0rNVvfgp+h2
         vqoeL4ca4hZWc7Fz++SivDbJdwmt7dvPoSrzB81JZ2BBvh03IGExqmFoW0E3SfHUlrK3
         aD+hW0SUhiEpgGvUscDdldMI5WboHUhL61gGZKeoKa3MnT/Uzd6g1WrasZ0ErDe8BYkl
         mZAhB79wgEhgCGNJsopLSMPNxwZKX+m9sf6jHHFB0HpQuG/7YrBvXesh/MKEsMRfTPYI
         KiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296687; x=1721901487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsHCgll+Hmm8fed0dFMQNF0ix1j3UG0Ow/yT3gZX+Ck=;
        b=SKzK3eIVhxQb3/N+6q8LFku+hSZsE4hvj60k7SjC8LpKn+mg/oTJ9NBOg7Hdk3p+lQ
         eukHvyyyurSSLkTFoaJP8gqJytrfX2JEKCfDk+AEdW3LIAWx9vy4P0HBsknHYYWGd2/D
         tuYAX3Czz+26tUWCmfzcBLfbtygPNeoLABxGVKGal8O76wBfSxi4wnKwZuvgl5RRB/dQ
         Goa8gm3/Pen6Ra2dMMHkumljefSb6b7sPwp1s7sDIioL4oVyOELHYSZx674LWISuVEo5
         y1RnZz2aSbRdP4mz9JikQAA72tW65LYd7uDiJ1b9zhtJLnkLPcEeMUGhWsc+NGZNHITA
         thHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2nrgx7aRZwlKO2hjfUSG4sVrc2eUXxDTEYnq1uvjnfDBOdsCJpkcp05UN+JUz7Ca32/h4tUeQu9x7EueFFRUY3wwJn0RxVpvhSof/1Rg2/s=
X-Gm-Message-State: AOJu0YxPoA8nw2RjCNtWa74E2XGsXPtCLF5PLofbvXqVqV4koyNgk/PK
	GiQINSDPvyGWaK/BOrQn2E/d0mjl6Rn6VGJBb8SaVy2uZ/g00kyNCR0zucHTjlM=
X-Google-Smtp-Source: AGHT+IHCNw6mvVs0JqyoFHW8EQrkH7lFTfsUSnH12CIgfhfeQ/Vay1c4tow8aO7Uajm253zXYZe4DA==
X-Received: by 2002:a05:6512:2385:b0:52d:b1e4:b337 with SMTP id 2adb3069b0e04-52ee53b284dmr3180536e87.21.1721296686619;
        Thu, 18 Jul 2024 02:58:06 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 4/9] reset: amlogic: add driver parameters
Date: Thu, 18 Jul 2024 11:57:48 +0200
Message-ID: <20240718095755.3511992-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025808_718875_9D6CACF8 
X-CRM114-Status: GOOD (  13.31  )
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
index a4705021b8f2..09b23f320f57 100644
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
