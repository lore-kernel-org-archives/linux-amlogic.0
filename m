Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC676EDE9A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlvdD4+4NJQYglI0zY9EOqll2BO+gdvyB7fgk9Ap2oE=; b=utZZ/L4LcSM8TX
	tJ9PQFKuuBIDgwKHPr/zDEpg7lzvGxykBGqKKPOfIJ0g7Rhfoxn+NL5rvXoChbiQdEOteJTPIUE83
	KBDAdbhVUy9mVBcelNxffbOJunsjAm4x0sc8S3ersdT/2KyFdJ/aNKt7HPQ0psbQxPAMqNJB3O8kG
	B/kss7DKJ3PB8S3Rb8XXyiUAiwJMI0HUIKriqQNaOSez0qzY0VYKUrnX234SMzUh+Fh6fEow4DFXz
	fDu4SKI/xCJ1KBJ/uNnhbPI7OXkxMh3TSSpWX/yRXD0fPj0Jho8jyttxmsV+wgVOfm0QTiqVfKn66
	8vyFHbLosCzwvfKz+sEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3tR-00000006NC5-1Y1B;
	Tue, 10 Sep 2024 16:39:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3nf-00000006LDI-3C28
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so9920815e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985985; x=1726590785; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/Yf+6uxXV0kV2P21eOVpIseB4Hi71hF6SfqZ+9Zm0M=;
        b=SmrKYEK7HwZpxY+rQj1+rqixcwYlbPkVwW+yDle9iJJwzymCfXTtHpJDmLweSlozsn
         wLZ0xiDmvZBlEK+EIUbg58j65jaYzuTB0XE80ok+jm2CMxObCCXI9+AOyzmDDEEB/S7H
         +p05TBnLXnrYcVvzp2yU9Dho7SljsxC9Wmce1qenuUthq6k2bHIZQJMSTU3CK3bN5Qg2
         XSChOeZtm0DRzc95ms+xjVBq3JpE7eAAz/lV/MMtbNv/ZZ3SRlTtL8w9hTNQA/ZDHrzk
         w8wueuncCIDDSQ3oGpuTTHapu2b5Nt8NLBeLdlDGrppZZR+J1eE90I0dVZyP/Xq3Gq9C
         ivgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985985; x=1726590785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/Yf+6uxXV0kV2P21eOVpIseB4Hi71hF6SfqZ+9Zm0M=;
        b=sZpPlzdil1/oNM4P3eIDQJR3Of9QE62dZGnQ7ewpZVKBV3JO1UuqlrZi0TNbWBTI4l
         ODmMJABovsnjRDCVWMFkPCX0p4r5i1vWKGktUjOLh5E0jsflgKWUgcKTFr1oXgcXWl1o
         MHTbMPFNrsFNJ/m/nwGjbNQARnyjmHxdWnT8UEc5gG28UYTUueY1sSjVmLRZcdpvTAmL
         g3TK+9TxlWnucJbKA81jVH0RaeChE86374lw9Z1Gb8mtppUnbtEXNA8564uHh2npgJ/O
         VGolFkq6jV7phe/mScSpsWuFpT5Y4llnazi7qE0eW/zyBoBsH8j6YsAtZdrNXkc/WDFp
         4xsw==
X-Forwarded-Encrypted: i=1; AJvYcCXPNqLnfEICg9FIhFUBCUF1GlFjgU3+tn8JwltBscUWOctB6ynfH1PU5rkGYRu/vxTbwSWHCayjJ/DkiCwo@lists.infradead.org
X-Gm-Message-State: AOJu0YwKyIGTrnVoxMSqYrR5u5sY+1m+uCXhnQqNFUpAG0weKCd+PPdh
	2LE8pZL/p2vgaiwDKieSVnFMWdV12EP8n5XGmuaLJnP7eZ1DO2uD7ViDYlkB6WyZkcXtri9MJTm
	y
X-Google-Smtp-Source: AGHT+IHTj1g8Y395YW3wLjECUH+eCckaYId/zx6ot0b8rNoXiVuTR4Rq2dpj9I0vr3gefwHx3RCAxA==
X-Received: by 2002:a05:600c:3b25:b0:42c:b905:2c04 with SMTP id 5b1f17b1804b1-42ccd325012mr2207915e9.12.1725985985361;
        Tue, 10 Sep 2024 09:33:05 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Sep 2024 18:32:46 +0200
Subject: [PATCH v5 4/9] reset: amlogic: add driver parameters
MIME-Version: 1.0
Message-Id: <20240910-meson-rst-aux-v5-4-60be62635d3e@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=G/tkeTFlEEIIRl13gZHjvQ8SKXa0knkQG6ZsLKG6Sak=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS3TGn2HCTwzONvcK+JqbnLVn31ARCNTMtTE
 h4EpAyoLdKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0twAKCRDm/A8cN/La
 hZOaEACwoFmJBZJC0dAuoD9d5L/78cmabU9CiavCRFGVKkqa+GZUy6usmXyIac4i0bnd611HSQa
 vtmP1c5D5GRo6kfRDrbP3y4RkINUB19THzvysfcZu2AfMCJDnCb4FE3XrJD/ZRnzZh8gtYVhnYB
 PExbL5n28LHuibOXeGB5pT46CYR3joyRQ6LxwXvxEx6+JZkWjMrd/wkREUuqEfqJ9AbHbBcEGqi
 Bv2lWXv4hntGJWRLUuK6J/n8kZY5Sf0c2ozu1Ho3f4K62kcJlwOmii97BubTJ/sJFFK41SfK0S0
 iWIjpOEA06NfL+VQWsuUrlOKpyiZwB32Hu9El32JS1XrKlwAfUTTG5Cq4ZezmuvqI/draqbT4gc
 H4Cn1cn98ZnBWJ8StokvGVh4RHlD4WjcTBIQqGzxQLQF5ZA/Ypxze125XlTVHmBbY7K3Wln4LgF
 6v+pi0hMlqZiIs4PSEodj8DaCcKLRDwHya6M+XO0Zl4Q9669IKGmbSPtRTRCafd3mozDcUHEGPn
 UmVIjPSo9z9aOdpQqCInKP4wRz3x7Zvuu/0GAqLJRejkZ3ZtmdYXzTFPmYNwJt34HhQvMKGRshR
 68rKKWYbJIxr4/AWTNEPfRZJ/mnnq7I36KrfVW8a0gFRbIW9pTXHaLHzbST7QY2Fw34Gw0vBY51
 +oL2r8AAbh7C/fQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093308_132357_84584427 
X-CRM114-Status: GOOD (  13.46  )
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
 drivers/reset/reset-meson.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 50bd2241ef2f..6a90613c8095 100644
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
@@ -84,22 +88,30 @@ static const struct reset_control_ops meson_reset_ops = {
 
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
 
 static const struct meson_reset_param t7_param = {
 	.reg_count      = 7,
+	.reset_offset	= 0x0,
 	.level_offset   = 0x40,
+	.level_low_reset = true,
 };
 
 static const struct of_device_id meson_reset_dt_ids[] = {

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
