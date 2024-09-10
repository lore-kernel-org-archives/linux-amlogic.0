Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F35AEDE99A
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZhANUihhiEJVx7SrnlhiK6NoVSRVoUVqz+LiAYcykc=; b=Subn3mhIa1SDVZ
	+VEl6rT0cUO2FaW/87ryMU0UTmhP6Pa/LT7DxwjEn3uDDQFx1JWRi1DpgU5csrrY1FUloh/tz6GiB
	pMiuu2m3HrAfbmaYuWbFc2AxuTqPowe6NGLoXRnBt8WuCtliBF894QuhfmENcBhSQGH6JvzHTnDUH
	12XIYFfsOYs7v0YJT3x7g0j2yYwAA7l//mYF+u29nNbSyQoWvwrIJiF5sp+0aQzfUDrfR8qKqmEQb
	oyaqenEPDVvyVcXu+uIKbxW3ApCXJdLebd5i23tQrSBkBEQqxhpNVQHcHJH52Cv1Y4MujDjF0nyDP
	f8qs8GykHflG5NSFFGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3tR-00000006NCJ-3XUU;
	Tue, 10 Sep 2024 16:39:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3ng-00000006LEd-0vRA
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so9921015e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985987; x=1726590787; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yr1sayqKxsWDgBZHQ1bM3Uke54ske3bCnU2ZK9PgUEo=;
        b=e/Bxdt3Fhd0cux55q83hV2kvv9y5eVN73c7H/Iu/d18LE81hfNHI4b6bejMVSUGDxQ
         skPgkYIz2crBH0rMa8vyCdlXZ8TzYbcxsrZNlMyGJuMAkxu4t5hwZrgrDho0MCfOp1mx
         t2WttHH6JbZG2M8Ml6QQMRKDR2aENPOEVgA945TC2sL4xFYJYW9ichGw4vq1lA/+j0gK
         jRbuSZU7a7oJE+pZZKvHNpMDZSKxeQNgzdeb/YFc2GX/NqSHmKkTNvZoKHlaAkqFIhjv
         b4/ToFYyu8tXNN1Rqj7QL5msKXDTLcfMM38OQJN5uSTAvQ/2J5dj6tNIjPLgdOB/kvb/
         7ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985987; x=1726590787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yr1sayqKxsWDgBZHQ1bM3Uke54ske3bCnU2ZK9PgUEo=;
        b=LoUBofZZIXrUTfz7aFsmi8Mvht5Z2A4R869Os8M/NPHVbnOMpmuv3OYyxszokx3sYR
         mBWwtNT6Scx29qjpa85yN7YxEEtlrdG8Rgli3OjKpXoAWXSM1QnrbEA/LWKsh347ap1+
         E5XmYQ8BbEMWK0t0LCpExE4QNofajH9yJbJznkmCbKE+fMVO7oEtTu2qPP2UdRvtKixl
         /IjMW5e+yE73aO91VBaLPloXBITH6ZuNXhtzA50M1MJ734gVQ5abxu9Ts8NAlYkqk2Gm
         tFSBDlMP9MyLDLCKtw0Soz3+yFUN3IaD0OpGaw/SjzUJpB5HSjz+XI4BwPngi1mK/6er
         hIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqGyLq1NB3EYv+EbRof3Rn5s6MN7qjx1BJ1AwgicEQsrEeh/f77097CplVabk7NWZh+6Gf2oWh6Pe1eyvR@lists.infradead.org
X-Gm-Message-State: AOJu0YwWx3QRqigbEcgQ2zm4W3/sJjdsXUV0hj8hFvndueE1vsXHdT0b
	hbVl/ugURJsRcNtTS8n1bNCso1LaIlqZA4HJgOapdGT2ereHSWQ25Wgso2w8k+0=
X-Google-Smtp-Source: AGHT+IELeFZVXHB+dwXP0xf8ZS6Er0WzIl4bpD5+ge/OijJX97JS1vEUgvv9Z7lgj+Okf1bFaFzwGg==
X-Received: by 2002:a05:600c:3505:b0:42c:b950:680b with SMTP id 5b1f17b1804b1-42ccd32def2mr1984735e9.20.1725985986626;
        Tue, 10 Sep 2024 09:33:06 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Sep 2024 18:32:47 +0200
Subject: [PATCH v5 5/9] reset: amlogic: use reset number instead of
 register count
MIME-Version: 1.0
Message-Id: <20240910-meson-rst-aux-v5-5-60be62635d3e@baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
In-Reply-To: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=iSedGQJkeoX1rk7eD0ZddgTbF2MZs7+12PeFSEIOANY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS45Bs5y3vQPAmVRmGscavL+gV5EWCMzd7SC
 9DniJBvY4OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0uAAKCRDm/A8cN/La
 hYidD/oDQlXMGcC2jMCZUcZhPtkNwrsiXGV3YnQzZ/hEtN6zIOn1pG2sP692fUaetlarc979okT
 8FKOG19JZIkY3XWvjinkjjAA4r7zladAnmiUBjcIBURVH324hvQEzfvZfyM/rby29mHLZ2TYZt+
 Ck8Xln43sdaOBg29bIzpPGbGFn/YrjYl9uBjpV7rFqzsb7y2mcsShZ/78n/oc1XemLRjEBO5gZM
 RrkCyKKjh9nDwUuP8yeAysbwIIpLDX0r4a9qjc0axe9ZWZb0Ikrw6B3sS9xsXN483JlZaCp0y2Z
 dT/OYZAV7R6uLFfwQztxV8kC7eKiEUQvoDKt+9TIGaJcY7DgGLC+YDW4cWEpkManE4NCyjUQQH+
 96R0YMhIiEqOK8fCbblAVxQucnVT5Ndtx0zB4SOnr1zlWrWboCVPVEdDJp9P/IyyKTddG/Y7egT
 GAvDOY3j5Y9phAbBuldCt/RlckHHXArWis5uvbDmS0UbqiYLDEUHLYDI7V13F+UOYOZ5xPDbK5y
 AVu2RffIF9oihE/UG6u1Hz7/mD5S3AolHvxIGeOMb9vqKW8RQbVwhdF8jZ7DKmU42JLOiZ3DlqN
 KhGydB/QWi59I0xvR53rUOvKYgVJMLt5n7W9smRox69akxsJwjy03hyqVZA+/ZL6zEXhl4lvm87
 vN9FRnWbdwhxqWQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093308_461523_0C6A17D2 
X-CRM114-Status: GOOD (  12.30  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 6a90613c8095..e31c1b7c9e4d 100644
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
@@ -87,28 +87,28 @@ static const struct reset_control_ops meson_reset_ops = {
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
 };
 
 static const struct meson_reset_param t7_param = {
-	.reg_count      = 7,
+	.reset_num      = 224,
 	.reset_offset	= 0x0,
 	.level_offset   = 0x40,
 	.level_low_reset = true,
@@ -156,8 +156,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 				     "can't init regmap mmio region\n");
 
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
-		* regmap_config.reg_stride;
+	data->rcdev.nr_resets = data->param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
