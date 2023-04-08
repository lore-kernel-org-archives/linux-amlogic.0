Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71472C7619A
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Apr 2023 20:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCFw0Ch6jHEKF8vIUytkbF6n9QHwiNs2WMFqqYb060I=; b=Hu+Cz9T4VhB/sJ
	BH1Fv4SRwg8eBOVoEmNSgafpy2qhkMghEZnA9hIJe9wuAKSUfasVZMzsneqmbt66IL0yUbQAqF3Fj
	ipJZxveltwzn5vGXk4KZzIoXj6pcTJ97fXxMcHrDLJzLY5OBYJsMlq+Kf2koeEYfdnNp00tUk+tsw
	tMXgxpWR8249R1ktRGn2jGPjSq1e3bvkHXp8/1pFKYgtML4b9JM2y8tEbineewogmCMc+DwYriBjQ
	KbGmskMaXHoTyK0TllesuvMpOEPLKvqAdKnDmihhalvbpWSqk1JjqhFJXtxr86oqgAm/RJ0DWp6a3
	johDtcOCk05tvkBP9k2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plFPn-00CneX-2r;
	Sat, 08 Apr 2023 20:44:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plFPk-00CndP-2j;
	Sat, 08 Apr 2023 20:44:02 +0000
Received: by mail-ej1-x633.google.com with SMTP id sh8so4181810ejc.10;
        Sat, 08 Apr 2023 13:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680986639; x=1683578639;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7eafkPVOocoktXz8vsbR8n0IOKWvGAP/Nz2b8qlhl4=;
        b=qpt8z+cFUm9GfNlmqH8F127hBYR+ZQcDTemrzh+Q5YApYzLG/nih+IJVTQVvs5Sww3
         iTRv6GmpRx7xJPVciDhsX3VxhFDkfeQyVLkJdGdgetrLYjpoOxumRTeUn/8DfpcQliXo
         gp5HkeDvE+R1Oh93YBibYlzao3vVmmX8RxbHqIqzLRpnxVG/XO1weKJnaKMIqtQnHknK
         /mTng/YJ6wMAL/JtA89aicuA/uRDuEUZav3vM9bbZVDet7Ih8tx6yJxkUN39OqJ+ntoF
         1+ugcc6xrHTpzRxCZJEwtYHSaBixFr0JLlLwZoA8NpJwB9ULvELT58jxnb6lm6Afa0pt
         WDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680986639; x=1683578639;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7eafkPVOocoktXz8vsbR8n0IOKWvGAP/Nz2b8qlhl4=;
        b=EDKVGklQlDVAUoasWxurMcD/JdHiuicPTYj50d3+0HCJtDCpSQyd5ZTSG+sGVPdJI1
         7tPRDh5Mr2nnDqnNbgN6mdk4o9CSNWi4sN4bf8CUX7zBCMpK6ZwSa1OKA9sp9udSgIs1
         ZHqGgAsThVTkC5GIGDsbZF/xowFixPMy5RLKKzjlLgYNW39nJVuewfmcObD7LwRDHzNq
         wAP7z3lB2ev/y/rIGkYJYtWbP7cglWGLfEg1GumVmQiLNihEVSQ61tC0XF2x7SC+HVqK
         qouZKzOFBzyLsqXhUhKAoMjXNRBsqY6sH80hYPEZYbnDQud18AeEdHn0Lgh8pj9niFEr
         85EA==
X-Gm-Message-State: AAQBX9ekJI9ofaXLimYHWksBbshnbSTiEXUGic/x5/RqcFQh0w1kSt9s
	H7kU9V46mpwQOFjinpbn1mQ=
X-Google-Smtp-Source: AKy350abkQTtebQwFTHN6NO3HN0ZJfnYc2YmtKA6dvx8wYR/7TzlImVlrKoSpVzM9DgY3kJpOaQafw==
X-Received: by 2002:a17:906:4812:b0:947:79b3:c2fa with SMTP id w18-20020a170906481200b0094779b3c2famr3014123ejq.17.1680986639229;
        Sat, 08 Apr 2023 13:43:59 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c57c:9500:b062:7c54:caa1:b5c1? (dynamic-2a01-0c23-c57c-9500-b062-7c54-caa1-b5c1.c23.pool.telefonica.de. [2a01:c23:c57c:9500:b062:7c54:caa1:b5c1])
        by smtp.googlemail.com with ESMTPSA id s12-20020a17090699cc00b008ec4333fd65sm3429717ejn.188.2023.04.08.13.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 13:43:58 -0700 (PDT)
Message-ID: <a3fb613f-73d4-c9c7-f48f-ffd79fa654aa@gmail.com>
Date: Sat, 8 Apr 2023 22:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 2/2] pwm: meson: omit video/hdmi clock as mux parent
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
References: <275c72a8-b9cb-e675-f1c0-4da658c3f98e@gmail.com>
In-Reply-To: <275c72a8-b9cb-e675-f1c0-4da658c3f98e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_134400_902809_5E742279 
X-CRM114-Status: GOOD (  11.42  )
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
 drivers/pwm/pwm-meson.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 9ec96c926..b5c746fab 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -99,6 +99,7 @@ struct meson_pwm_channel {
 struct meson_pwm_data {
 	const char * const *parent_names;
 	unsigned int num_parents;
+	bool omit_video_clock_parent;
 };
 
 struct meson_pwm {
@@ -348,21 +349,13 @@ static const struct pwm_ops meson_pwm_ops = {
 };
 
 static const char * const pwm_meson8b_parent_names[] = {
-	"xtal", "vid_pll", "fclk_div4", "fclk_div3"
+	"xtal", "fclk_div4", "fclk_div3"
 };
 
 static const struct meson_pwm_data pwm_meson8b_data = {
 	.parent_names = pwm_meson8b_parent_names,
 	.num_parents = ARRAY_SIZE(pwm_meson8b_parent_names),
-};
-
-static const char * const pwm_gxbb_parent_names[] = {
-	"xtal", "hdmi_pll", "fclk_div4", "fclk_div3"
-};
-
-static const struct meson_pwm_data pwm_gxbb_data = {
-	.parent_names = pwm_gxbb_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_gxbb_parent_names),
+	.omit_video_clock_parent = true,
 };
 
 /*
@@ -414,15 +407,6 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
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
@@ -430,7 +414,7 @@ static const struct of_device_id meson_pwm_matches[] = {
 	},
 	{
 		.compatible = "amlogic,meson-gxbb-pwm",
-		.data = &pwm_gxbb_data
+		.data = &pwm_meson8b_data
 	},
 	{
 		.compatible = "amlogic,meson-gxbb-ao-pwm",
@@ -446,7 +430,7 @@ static const struct of_device_id meson_pwm_matches[] = {
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ee-pwm",
-		.data = &pwm_g12a_ee_data
+		.data = &pwm_meson8b_data
 	},
 	{
 		.compatible = "amlogic,meson-g12a-ao-pwm-ab",
@@ -480,6 +464,9 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 		init.parent_names = meson->data->parent_names;
 		init.num_parents = meson->data->num_parents;
 
+		if (meson->data->omit_video_clock_parent)
+			channel->mux.table = (u32[]){ 0, 2, 3 };
+
 		channel->mux.reg = meson->base + REG_MISC_AB;
 		channel->mux.shift =
 				meson_pwm_per_channel_data[i].clk_sel_shift;
-- 
2.40.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
