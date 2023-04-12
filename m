Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB28C77B72
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 19:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjc3B68QP7D9Uned/RA5ixtBYuJWc5FhaGjx1R4Pgv0=; b=Cu8/qIgbhkF/69
	poFe7jh3J2Np79d+42wwA3i+EgeKHf+ZHRrlgB+F9h+Yjip4imsAbgICUb3BGJq1z+yNm8TwETnwY
	A2PvoTn0XWfYGhh6SZyF9knChG9MUv+KEq0o/LexVRTFO12R3uq2v5CinA7wNi+DGsx11aOGIOgX2
	Lr5/5WXnWTjIbwpX3VEw6IoyZu9rlIfFqU/LSyCsAh96CZf6qklp223Fgqn4clfkKOM5QPZ2GX1tF
	QAYeIe1JF1Y+IqEcuINQO7P7QDkXLj03AYaoZdJ6+EBBw7E4Rlt3+43zhl0Zwe6nUzqaDXkmhq2IR
	cgxJNwS22Gm6M5GWYJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmg4J-004A8A-1g;
	Wed, 12 Apr 2023 19:23:47 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmg4A-004A4H-0p;
	Wed, 12 Apr 2023 19:23:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id ud9so31351455ejc.7;
        Wed, 12 Apr 2023 12:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681327414; x=1683919414;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gzoR5eTjdX6x0tTj8Yg9Hg0mvL/Rg2ipc11h9oGPMg=;
        b=LnifDVanznGfp5EnwOx7zenvrF0sDNVcbMgrnopS6RNAw4RLaIh/r4M2FVUVebcw45
         PWNwif+mNd6fiildq6OyAeG7MLTY7wJdK6YkuSLBxT59ImqkmdpjxQSnDdAGRN3Mw1oy
         /OLgqkfHWVlDyoA7RgQoiVSfVMy9jW4fc15sJLKRnsfYHJpcwBNFtzhTwqzW1PZqpc+/
         8HE1Kwjg9UWWcxjnlzrlhk75xIQ0giBdsZ5C14P3RuKwtd2oe9u4pH44VMmkWM5AyoIa
         yaSLQRqCRTUllbAN5doEIVRMVf90SfVBls54O0rWaNyawChToDj9tDu16YRzdnm84QNm
         gTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681327414; x=1683919414;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gzoR5eTjdX6x0tTj8Yg9Hg0mvL/Rg2ipc11h9oGPMg=;
        b=Cz+jMWf/9ylqoer7ZJRLd6BPwxgy7vOVYvr06dM3kHpaTqVL/eQ85T8ojNeTW7CH0c
         151Y2Q5uQHNLzuMHPhGM/NFEkYGa9EL1Zy5vpL5VCTDGtarpna8nEMwvcMNEIJTBkyfP
         +vAkMRBfKdtVEkDl1lkyJ+yZ+twYU3hPb7riIpqfWjMVgyKzLVRuQ8D3d/496823dA4T
         NW9wyUDEc0i1loE1Wr9w4djE5n/tgdtU/jYWl/F4LSNc6lOsC5UXtboVvnnKTPSn0SzX
         3DCwQh9UyuwqIfd1Vyyed1ZiuYUzGVvazKMoXaM0HxLNUbds4om9nLHS5hWNM4TFWQwc
         ZL7g==
X-Gm-Message-State: AAQBX9f2Q//Lfo3Kte3JzizszPeNarW223yqizoPAB5yaK+2CMbA6A0k
	f9y7ZUsLpEFpZuzpjxcSZpo=
X-Google-Smtp-Source: AKy350Z51bocLFO+NnEa5ejX6/IQ0VwXAA/I9gDLX46W1cmh+Jj2fQscv9ChmTeGyQ2XEsgLshUQbw==
X-Received: by 2002:a17:906:cc87:b0:948:d1af:3a11 with SMTP id oq7-20020a170906cc8700b00948d1af3a11mr7143768ejb.50.1681327414362;
        Wed, 12 Apr 2023 12:23:34 -0700 (PDT)
Received: from ?IPV6:2a02:3100:903d:3d00:b0e7:6bd7:f613:784b? (dynamic-2a02-3100-903d-3d00-b0e7-6bd7-f613-784b.310.pool.telefonica.de. [2a02:3100:903d:3d00:b0e7:6bd7:f613:784b])
        by smtp.googlemail.com with ESMTPSA id mb8-20020a170906eb0800b0094a9f434fc2sm3196299ejb.176.2023.04.12.12.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 12:23:33 -0700 (PDT)
Message-ID: <8c6ac288-a59d-7c51-aced-3dbcfa828cdd@gmail.com>
Date: Wed, 12 Apr 2023 21:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH v3 2/4] pwm: meson: don't use hdmi/video clock as mux parent
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com>
In-Reply-To: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_122338_294870_AEFD4377 
X-CRM114-Status: GOOD (  11.27  )
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

meson_vclk may change the rate of the video clock. Therefore better
don't use it as pwm mux parent. After removing this clock from the
parent list pwm_gxbb_data and pwm_g12a_ee_data are the same as
pwm_meson8b_data. So we can remove them.

Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/pwm/pwm-meson.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 6a66d5d58..2a86867c1 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -371,7 +371,7 @@ static const struct pwm_ops meson_pwm_ops = {
 };
 
 static const char * const pwm_meson8b_parent_names[] = {
-	"xtal", "vid_pll", "fclk_div4", "fclk_div3"
+	"xtal", NULL, "fclk_div4", "fclk_div3"
 };
 
 static const struct meson_pwm_data pwm_meson8b_data = {
@@ -379,15 +379,6 @@ static const struct meson_pwm_data pwm_meson8b_data = {
 	.num_parents = ARRAY_SIZE(pwm_meson8b_parent_names),
 };
 
-static const char * const pwm_gxbb_parent_names[] = {
-	"xtal", "hdmi_pll", "fclk_div4", "fclk_div3"
-};
-
-static const struct meson_pwm_data pwm_gxbb_data = {
-	.parent_names = pwm_gxbb_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_gxbb_parent_names),
-};
-
 /*
  * Only the 2 first inputs of the GXBB AO PWMs are valid
  * The last 2 are grounded
@@ -437,15 +428,6 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
 	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
 };
 
-static const char * const pwm_g12a_ee_parent_names[] = {
-	"xtal", "hdmi_pll", "fclk_div4", "fclk_div3"
-};
-
-static const struct meson_pwm_data pwm_g12a_ee_data = {
-	.parent_names = pwm_g12a_ee_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_g12a_ee_parent_names),
-};
-
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8b-pwm",
@@ -453,7 +435,7 @@ static const struct of_device_id meson_pwm_matches[] = {
 	},
 	{
 		.compatible = "amlogic,meson-gxbb-pwm",
-		.data = &pwm_gxbb_data
+		.data = &pwm_meson8b_data
 	},
 	{
 		.compatible = "amlogic,meson-gxbb-ao-pwm",
@@ -469,7 +451,7 @@ static const struct of_device_id meson_pwm_matches[] = {
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ee-pwm",
-		.data = &pwm_g12a_ee_data
+		.data = &pwm_meson8b_data
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ao-pwm-ab",
-- 
2.40.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
