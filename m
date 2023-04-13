Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73612C77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 07:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QN7qYN9Py9yzOQmia/k0PMI+8fDRTvmuYeWaiIUqo4=; b=gV/v0du7N+emkh
	Crb9WD8C0cWHu75bgKHlL4OSKNvHjjTegIUJaku9U2KBMpT74Ta0azN6mDL70BYjlLCnRzwnKCfru
	2Nqu+gH+rtR8xcuTpUhlRDYqfQtqJx5FJJ/a6H5qLojUU6SdXZ8OtPMJrpU+wuRosFy2HEmAIlKhJ
	p67Xqi6lc0+9edndSbVRRfstTRnHTKYmwuZvnQn33ZL1jodEQFVdIkE2ghKqT1HW8c57SzXVKVtCR
	m3YTbTUP/wk3BV6C5Bl0iMU3YezifhxTGNmCO5CKrXWjNflM4DXXjzcy0GfxeJXvOgLfDn+HgRBZG
	72DvEd3CjLiyVZycgz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmqwj-005Ch7-1A;
	Thu, 13 Apr 2023 07:00:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmpvQ-0056D9-0V;
	Thu, 13 Apr 2023 05:55:18 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5027d3f4cd7so5924737a12.0;
        Wed, 12 Apr 2023 22:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681365314; x=1683957314;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8NswKnCbOdRsUceWkVVSA/1Vuid+dbN+D3gtyr4zCs=;
        b=G5OuamML2e2k2PBZmSqIPjldSRvz5DISmAjF4XfMVNm/ILZbJLWmpk8lH31W5WuIHs
         INC90/UdTi9b1ZfwrGzPJ4uHFRQXFbsReeCvNAR5hegwlvazs4PBJkW5z+c8NiEkZ1Bk
         eLlrDULpPmXH34ncIabbWxtdzIn5OfrD4C5+bkeytavYkziNO+AIkkooAXtNAWYtRHrX
         iHWlgxtyCY8b9EZ0CQiyzok00viM8NEgnPwBzLm4Ba5rXAo3Ei5eRPk/NYPOBNMca9o/
         SHKpwSHQ5Qkv1Ovkc8A8Exsk3m1WN9B7n1hDX1WN0PzEg4dt4Y7zXyEnER27V220S4MH
         WrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681365314; x=1683957314;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8NswKnCbOdRsUceWkVVSA/1Vuid+dbN+D3gtyr4zCs=;
        b=Ymy634ivkDKWc8870F0ZKmTRI2fJ/+ufXWWomSJHYhmbxwC21hpfACpA8LLD8mUzIW
         /3YLAhp+SzTrkbdX0urj3DaN/gCGZSGcf43fDSHrTt+bOujUUwatNSLoaaU0AzlD56XS
         b8YTC4pXY7MoBb1ZQw0glIg51ve7eLu/NF2jApkqUn8p/qx0efDHzBA8Eq7C6OIitTsm
         HF2kXUDxFhjL1S52q37Fu2/e3l4izj3nVDkXp4ZZ2O686IjJk3ph47+xL+s06i0z7aZx
         vFr9SZIQ/MoI/bs9m2re4D4teUBTfLYAB1AAaFo8MqQYqfEM0LjlwoG9diNhyG/HNd/K
         +VmQ==
X-Gm-Message-State: AAQBX9fmx+6vz/ErfBVvy7K0eNWxthK/Bj3NzYv69eKn8MFHSonxmp2Z
	TwtamrJl2C3TzK0HNl/YcnM=
X-Google-Smtp-Source: AKy350YjmHMOR5Hjn7mH/FbFFzlgAUBBWmQNc4XPLT0P2ICLxhln8QaWVhwY8vIi747hOBiblHnnyA==
X-Received: by 2002:a05:6402:4d9:b0:504:b177:3eee with SMTP id n25-20020a05640204d900b00504b1773eeemr1107791edw.33.1681365313955;
        Wed, 12 Apr 2023 22:55:13 -0700 (PDT)
Received: from ?IPV6:2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8? (dynamic-2a01-0c22-738e-4400-9dd0-adc5-d6d8-61d8.c22.pool.telefonica.de. [2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8])
        by smtp.googlemail.com with ESMTPSA id y2-20020aa7ccc2000000b004c2158e87e6sm337648edt.97.2023.04.12.22.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 22:55:13 -0700 (PDT)
Message-ID: <71ae7fd9-f2da-c483-fd64-bf397c6f7bb3@gmail.com>
Date: Thu, 13 Apr 2023 07:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH v4 2/4] pwm: meson: don't use hdmi/video clock as mux parent
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
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
In-Reply-To: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_225516_196400_DCF332F4 
X-CRM114-Status: GOOD (  11.12  )
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

The meson_vclk code from the display driver may change the rate of the
video clock. Therefore better don't use it as pwm mux parent.
After removing this clock from the parent list pwm_gxbb_data and
pwm_g12a_ee_data are the same as pwm_meson8b_data. So we can remove
them.

Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v4:
- improve commit message
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
