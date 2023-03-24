Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B708FC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 22:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tlBy0/VNUi9EPOHA50RtNPHWOsocegin84exYjiT7TQ=; b=lzuUgprt5W+FTC
	PLBraYEzgKwyQERcXVjpkC/uhMwpwdDgLTPrZ5qMGUDjUzbTu7i2ZtNmdZ1nxl8qiAqTypj/Mh8tb
	NireE+CuFW0jMFUgtq/0tot2pmVO3onvj1qyu5MpWBO2nNZkixQaiYlySth4KqV8/M9wEdnb3NTM/
	JOjx2w+cyC8jZzf7h+ijc0stmVueBmkhZBCNt5P/hBybQIBey3lt4GvXX7tcNGsegalAeKf0uqxGU
	CnQsYDlsivkK8I49TkRJbsVI/flgKqy2nG/sluqWl9ZegT/rLHD/dU1KxfI3A7Ly8E5MUIyEZmZ2w
	+k9U+NyIegWfKnhjvZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfpoo-005jW7-2O;
	Fri, 24 Mar 2023 22:23:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfpoj-005jUQ-34;
	Fri, 24 Mar 2023 22:23:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id u1so1896847wmn.5;
        Fri, 24 Mar 2023 15:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679696603;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rb6cLGwAhVU00J8l+qGq5/4WEL4UbFMyoyqigSKqaVI=;
        b=E3/i93Ram4veQfWYWy/Db48ZY7e+JzpuLHODyfLsQ+w1I48Lz4CkWF9oOCr/amyegz
         P9k/D4q861z3qM15pdHjeEiRhtbKKTXiT7DaGaM3WFLjiMnAETvDO6qQiXaUApY1/LA2
         KbDcxKSS9bdFijZ/pF/06OSVqkS/4WjiqvAS4OfTgnKSpvf7hFzqPbBj82SAMutT5sl6
         FPaABa0S1v+/FtGTGqP4xdN50mxRgbmijQc+QKAkbPHIw992qMCGB0yIViyK9mjSGW0D
         J7txJcjVnlX72apuTeVCbayXAIP6EegGZ0tkMZHfHXNQvM8jTZ3XunZ+QRX9ZUWdQHoq
         lSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679696603;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rb6cLGwAhVU00J8l+qGq5/4WEL4UbFMyoyqigSKqaVI=;
        b=CIvveBuh5E7Rq/wiNM9SCT4KJfFIav7fc9OdNW/B36f96g+dZMFx33O2EAAm1gCOYK
         VtXFOjjnpdX0knXmg+A+Vbih2CrzaCtKd7FTYmCFO3kzKmvPPOaym+gIO3fo2HLTf85x
         jON1pbya623au6Uj+TDu5rAufLv/QwrGKOzgQYOBzElQy8/aJTsFTCdwjdXpoc2Ze4Bs
         TfFFvlrJyKpy3aEJrVYeYCV7Y5zlgOe5dbEdCMWL9a0LINLgIylHvl7bSRA0owqe4c7/
         7LVJ1HAH3YDgLLMkCe6DyL370bv7r6jmvS0rhbQePcHs70OotArjGPo06j7ZXHF/xxox
         BcUA==
X-Gm-Message-State: AO0yUKVe5cjZLV7xt/0/X6yFMg1c9/0qrlh/pc/Hw1MSDGngis4Kj0FP
	nr+rzRwi149ozFBUNODPCmY=
X-Google-Smtp-Source: AK7set/tPWYOvSzI2PNLiRVAgbMprgirpJ/Vl3FX0JHs3AyE/C/7/zGmSk/qdVivqlP6z8hot1iZMw==
X-Received: by 2002:a7b:cb93:0:b0:3ee:814b:9c39 with SMTP id m19-20020a7bcb93000000b003ee814b9c39mr3574790wmi.18.1679696603097;
        Fri, 24 Mar 2023 15:23:23 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b926:df00:a161:16e2:f237:a7d4? (dynamic-2a01-0c23-b926-df00-a161-16e2-f237-a7d4.c23.pool.telefonica.de. [2a01:c23:b926:df00:a161:16e2:f237:a7d4])
        by smtp.googlemail.com with ESMTPSA id j36-20020a05600c1c2400b003ebf73acf9asm12553045wms.3.2023.03.24.15.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 15:23:22 -0700 (PDT)
Message-ID: <fad131e9-265f-6c4d-3223-932f69c9a927@gmail.com>
Date: Fri, 24 Mar 2023 23:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] pwm: meson: add support for S4 chip family
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_152325_992258_138EBE69 
X-CRM114-Status: GOOD (  18.40  )
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

This adds pwm support for (at least) the s4 chip family. The extension
is based on the vendor driver that can be found at [0]. There the
version with the new clock handling is called meson-v2-pwm.
Central change is that the clock is now fully provided by the SoC clock
core. The multiplexer isn't any longer part of the pwm block.

This was tested on a sc2-based system that uses the same pwm block.

[0] https://github.com/khadas/linux/blob/khadas-vims-5.4.y/drivers/pwm/pwm-meson.c

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
Adding the amlogic,meson-s4-pwm compatible to the documentation was part
of the yaml conversion already.
---
 drivers/pwm/pwm-meson.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 16d79ca5d..7a93fdada 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -98,6 +98,7 @@ struct meson_pwm_channel {
 struct meson_pwm_data {
 	const char * const *parent_names;
 	unsigned int num_parents;
+	unsigned int ext_clk:1;
 };
 
 struct meson_pwm {
@@ -158,6 +159,7 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 	struct meson_pwm_channel *channel = &meson->channels[pwm->hwpwm];
 	unsigned int duty, period, pre_div, cnt, duty_cnt;
 	unsigned long fin_freq;
+	int err;
 
 	duty = state->duty_cycle;
 	period = state->period;
@@ -165,6 +167,14 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 	if (state->polarity == PWM_POLARITY_INVERSED)
 		duty = period - duty;
 
+	if (meson->data->ext_clk) {
+		err = clk_set_rate(channel->clk, 0xffffUL * NSEC_PER_SEC / period);
+		if (err) {
+			dev_err(meson->chip.dev, "failed to set pwm clock rate\n");
+			return err;
+		}
+	}
+
 	fin_freq = clk_get_rate(channel->clk);
 	if (fin_freq == 0) {
 		dev_err(meson->chip.dev, "invalid source clock frequency\n");
@@ -173,10 +183,14 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 
 	dev_dbg(meson->chip.dev, "fin_freq: %lu Hz\n", fin_freq);
 
-	pre_div = div64_u64(fin_freq * (u64)period, NSEC_PER_SEC * 0xffffLL);
-	if (pre_div > MISC_CLK_DIV_MASK) {
-		dev_err(meson->chip.dev, "unable to get period pre_div\n");
-		return -EINVAL;
+	if (meson->data->ext_clk) {
+		pre_div = 0;
+	} else {
+		pre_div = div64_u64(fin_freq * (u64)period, NSEC_PER_SEC * 0xffffLL);
+		if (pre_div > MISC_CLK_DIV_MASK) {
+			dev_err(meson->chip.dev, "unable to get period pre_div\n");
+			return -EINVAL;
+		}
 	}
 
 	cnt = div64_u64(fin_freq * (u64)period, NSEC_PER_SEC * (pre_div + 1));
@@ -445,6 +459,10 @@ static const struct meson_pwm_data pwm_g12a_ee_data = {
 	.num_parents = ARRAY_SIZE(pwm_g12a_ee_parent_names),
 };
 
+static const struct meson_pwm_data pwm_s4_data = {
+	.ext_clk = 1,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8b-pwm",
@@ -478,6 +496,10 @@ static const struct of_device_id meson_pwm_matches[] = {
 		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
 		.data = &pwm_g12a_ao_cd_data
 	},
+	{
+		.compatible = "amlogic,meson-s4-pwm",
+		.data = &pwm_s4_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_pwm_matches);
@@ -493,6 +515,14 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 	for (i = 0; i < meson->chip.npwm; i++) {
 		struct meson_pwm_channel *channel = &meson->channels[i];
 
+		if (meson->data->ext_clk) {
+			snprintf(name, sizeof(name), "clkin%u", i);
+			channel->clk = devm_clk_get(dev, name);
+			if (IS_ERR(channel->clk))
+				return PTR_ERR(channel->clk);
+			continue;
+		}
+
 		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
 
 		init.name = name;
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
