Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DB2C76196
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBv9h2a73R7EpnZCyYJdTHKpYieEsjt2HApNl3+648o=; b=2B7t20Lc2ILJ/8
	0uKYWExtFK9T2lsq8sbBlRibQtPzuhn/+bH7x7y2RSgqRMB7sGakddeRQno8lYHvMsXZgDn8/5sHk
	Z3S7LTIuQeWoifjNoOaNode3XGuMQIPnKfYbAbWfIU4w52wkTzZFYB1s2rj3bD+qK80z9xMamJ3qT
	rQI/kYuS9B6I8IVLoqqL2UKDj6Vq/mkzZenrFsLLc2OpGCzodCeGjc+u1yLUpuj61S1TF9+jhdqVv
	jJCJXjQibUE4u3R+2gFzNnkqjR1WWWpddYmxoaDplSPcmVrGeLqkObW9QO1JdqHnwIn2ez/x1gGiG
	8aIMUqKGSbzet0ym6NWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJdZ-000wTC-2a;
	Tue, 11 Apr 2023 19:26:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJdU-000wPx-2t;
	Tue, 11 Apr 2023 19:26:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l18so8592889wrb.9;
        Tue, 11 Apr 2023 12:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681241193; x=1683833193;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+z8YpC2eOejAdzfjBHEwDRl9Fr5MgCbUHcvYTd3HmNY=;
        b=aoQupWLGNf4cLI0OgUlJMqZu0kloECrUcXOvi3XOP8Psft1XBcIYdvkJ6U8S2WRfXW
         43V6+2lWgYbQ8Oy96dCdWQAaACs1o0LBbLMzErqucQtDKLzai9Xmo1vnviHDlZ7VKFFa
         Y/WGHSV7Df+9d8jeFsXiY6SY9aiz9p29p+FgwfyjWTqBnbo/pegKw4nccSd0PFtlRCcH
         eS5cH8ZIjrddgo9zFNTFIFoIdRmVT7TJ9JLTt8NkJ8pXwnmA/5bM2dqJ2krGLc8K+UTz
         PVMhe1rqQ5De5sVoh3nZtSuTeiWs4FpDUfiWARX7XC8/vcK+p1oc3daMT1g6QiBUvtJj
         qKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681241193; x=1683833193;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+z8YpC2eOejAdzfjBHEwDRl9Fr5MgCbUHcvYTd3HmNY=;
        b=WFU/IRjQLlcnHX703r5DnmDzUenj56h4VPPxF192G+uSE63tBqh0pnL/oFLSz1zKHm
         8G6K1twevWrdh1t3++ZTGhz/4vuA5m9r0h6WJ1WZHqBwCFTZRvL5IkFg19QzGg9YvNGs
         G1580g18l9z3drMkMNDjpQ103gsk9tKwAZS+UymRpimBsAmt+ri2FtDQpkHuKB0xLyth
         z1ZvNJl0tlkkD9lRVtWxHlZ+6eW15/N9uWmS6EgpnnfWqx13UbiP9iVgJddGoR2tlVgq
         SJOVzx5w+J1Twtpfsd/yb3mnjknO3pauEmy5uM6i9oRPOJtX2VjVWj/rsGws1XVc49Z9
         5O+w==
X-Gm-Message-State: AAQBX9eKUNMY7F8Gw9P2wR5u+LWH/AR6WYdvHqDfXdYXluh6A3kmN1Mu
	UV9VoJf1CQcZweF6/GTZays=
X-Google-Smtp-Source: AKy350bOAxztOgN2CwmM2wYn4R8YGgKVKJjv7V726pbvbhBozS+/RaKpacGtWcfjjjjtdkWGsAGSzQ==
X-Received: by 2002:adf:f146:0:b0:2cf:e3d0:2a43 with SMTP id y6-20020adff146000000b002cfe3d02a43mr169952wro.4.1681241193048;
        Tue, 11 Apr 2023 12:26:33 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c4bb:c200:90e3:4731:63e4:d333? (dynamic-2a01-0c23-c4bb-c200-90e3-4731-63e4-d333.c23.pool.telefonica.de. [2a01:c23:c4bb:c200:90e3:4731:63e4:d333])
        by smtp.googlemail.com with ESMTPSA id fm7-20020a05600c0c0700b003f063a709dbsm3898839wmb.2.2023.04.11.12.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 12:26:32 -0700 (PDT)
Message-ID: <d4394f13-b481-ca2e-3ce5-737a7bbc0e3d@gmail.com>
Date: Tue, 11 Apr 2023 21:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 2/4] pwm: meson: don't use hdmi/video clock as mux parent
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
References: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
In-Reply-To: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_122636_932617_28620983 
X-CRM114-Status: GOOD (  11.13  )
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
index 52a2104f0..931cf14ca 100644
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
