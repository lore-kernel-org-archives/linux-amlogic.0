Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBD1CE7B10
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlvdD4+4NJQYglI0zY9EOqll2BO+gdvyB7fgk9Ap2oE=; b=DornNgld+wYq3g
	e8Y6C+XlvDeVHAJacGDUO0oroL8MfeuRhB1dSSqvT1jW6gc0KoPlDI94Av+FJUndVjcVrmEBksSAh
	ViG97CBI8A0UcNukvkWOzx8bZnbMXGTACenhAt7rE2ZGBmsFZj93RSWWuV1nTC1U7njU4+5LWNDQs
	e5h/hMq2wvz2LGVyOZCaYTY2TSJFafPc2BYAbk5+0aVB+URtDu/4yAgXZg9K2+OgREmZjGABtNQRI
	y0trTJYvOJgjR3lHBKa2gtcL/8TgLCtvjqu3UnXg/EH1B1xvat12iuLl/lNbwTVtHUb8Ug4/1/lkr
	UIUY9CPVlQpFExsH35KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZDy-0000000CNky-20E9;
	Fri, 06 Sep 2024 13:42:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7V-0000000CMC8-15bw
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42bb72a5e0bso16634495e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629723; x=1726234523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/Yf+6uxXV0kV2P21eOVpIseB4Hi71hF6SfqZ+9Zm0M=;
        b=fQXxMMukRte79MlkU1al/pumsP0dkFRlIT6IhXEpE8U0d7gTzcy/3RITirjRP1xzhP
         jvLXCpwRdunTsmizxgwq1RpbZXlknUs8qtyMNwoE2Rg6AW1JGWV+SSsL4+OrgY4VAAMG
         Qp85p9ceiZ1Mpn0s5r3wIWcqi2E7aZEmm5glsbSOPc4YvbF37cfKj8SizsuiJYacCTu6
         CSiuhSA4zdO90R8uE/ipb4gVbyp/i+CrroNs4GBm17Aj1vpbGhAkug+qphiqZb87v9uX
         PrLn3zaXbmVYoAdJd4cKADw4PK/DzdCtRxdE7AyzpCZ4IU+mHyDSte0EKKNdW0npZ5aU
         KTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629723; x=1726234523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/Yf+6uxXV0kV2P21eOVpIseB4Hi71hF6SfqZ+9Zm0M=;
        b=uWWJ1yDDiYesvLBMCPVw/t3zNEKZ507FxHOVlQ7HDB4//we0oMIe4fZyV+jp+zq/Ak
         lyYKeSMPOdKV8cMJRlOQ9FTONTADT2YewzIXuTVm6Rc+cafIUmVr65+7Pgha0tWSkHn6
         gguqi1CkzjTfE6PWfO/VoQTbujMmiAVFr9jDp78dkG3cCxTkRbThm4l6aTGYECpYH66H
         8zYJtVLwuHSy+4O8vVdYhgZpnETulY2TfX9MYc9fs6tQyJANLveadA9h66gu8EsHkrqG
         VVTTlLEqqITrDrBtdL1kWd//LeO23/owiSUz3NaZJ76xQvbAq3N1XjBy/4xjQo8Tcb4T
         fA1g==
X-Forwarded-Encrypted: i=1; AJvYcCUYyZ5OS/ifuBqncqDIyxCOvPOjbVk35vYwHNSMug0Ozuq5s3WMP9O0eWp6TLD45QLxHijDZuor5FHHwyFm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx92mJp9IBhVQElcQiXtwn5A0V3dCuCX9nUl8tiwwSjK+CP8COP
	znieKJou4ilbF1YoN0yiueG0jMj4b+c06MfUy4Y16SBNOf2vUlQ22Yt/d59Ur6A=
X-Google-Smtp-Source: AGHT+IF4VeYSejIOXDRrzU8oFu6IoWvoH1EbJ5dlPLojrpKx18ZFCT5/tQgZrXuWY+yDBawS4bkpsg==
X-Received: by 2002:a05:600c:5102:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-42bb01bd7f2mr186682155e9.16.1725629722686;
        Fri, 06 Sep 2024 06:35:22 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 06 Sep 2024 15:34:49 +0200
Subject: [PATCH v4 4/9] reset: amlogic: add driver parameters
MIME-Version: 1.0
Message-Id: <20240906-meson-rst-aux-v4-4-08824c3d108b@baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
In-Reply-To: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wURQtL+kwNEuoxQUrfvKDLVp+YLuENebFZ9b
 EI5WC0kuH+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFEQAKCRDm/A8cN/La
 hTELD/9DwP8483wvZNoxdOUqFzHXI3fW9Yq0ENw8+O5MWleGZI7s4zhbM5tR0nhZ+eKIJ/04OLH
 uTBXT/3cAuJbsvKvZhkfHNYFLmwIuZ8TnAeKDv3FOCdOLNI+eTxU/laPVSffIlMeL0IaSmXArU7
 rAtJuSsfQk85EWJAC3Pukr4UTlixjjA47G3MTYNX5fsYwFnnir96qY32HuM1IFKUoeHGqYcg5e/
 xfhXtHap04BOu1MW8ivfRiPP+VcqbHyiRnmHUgSWD7oG+lv/a+5j5j9B4nsb3v9/9EOQ/QwqiWp
 90DR917dWwxagt/dwUl8q157/xg8F1v2LjbQNxNzkHzA+0CeMtmzHEGS65jGyC9xigrqSy2I6z/
 EoFCKxup+FH15RJm3EPgL+xLoy84E9w44Rx9Y4IQgOsjaFEdyPhDY1Qk0UBcZLynvqxQSuIOZv7
 E+RjWDMPz1gqZyp+i4PabmhMkAXe8/4MoXWG+Dc3NX3gk0vS2Kjoc+cfQPBHFnSV+XOkG0FZjyG
 Wf87NMBWnjbOilmSXsAVHUZtRwuI+j2tFpeKFzd2Ct3KM/irXsIixyN8G8gQ3y9uDjViSD+gYrz
 U6VHtXjD7AR+tNrrBdSxscGgheUbcmQNcnYSyJmP07GxaxX2z2mgTIhq3iKkZDOEpyzcn+BvtMy
 Rk9kgTHEN+8PZGw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_063525_483003_7FC5E0ED 
X-CRM114-Status: GOOD (  13.13  )
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
