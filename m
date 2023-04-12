Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C370C77B71
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 19:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmL+ZmkQVoho3r3ODxmNVEA9UoieBQo4Q8r/442tQ4k=; b=Da+uYH4ACnz1tK
	n4gkj/PxkeW8rtqugShzW9f9QzYdPcHd5x8g5+ah+V41TjlNydzV+PH6l8kKP0yvm+SWNjMkDTRjd
	5YCyjkKbCbV0o33Hr/R4ffwUJh4Ek02rlN60PQsFVQ7wNRqK2x34mDZeAY45TF+nP+fmGbV9DdxFE
	IAtW0Mz/yYoZL8s0n2qJSszDEgB5hyOi6W/n0AzT6NvkJOp4gAPou9j/ZhfGV3UKEpFnYYkVDCnWH
	cZiNoO1tWkHfUM9nM+bv3RrG8+ctrZtQEcU2L6+nai+NAQ8/o9ZzMo8P9RMSVondCBnhZFjOhRyS6
	WRrlvz5Sl7zNK+nIXjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmg4F-004A6e-38;
	Wed, 12 Apr 2023 19:23:43 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmg49-004A4I-15;
	Wed, 12 Apr 2023 19:23:38 +0000
Received: by mail-ej1-x62a.google.com with SMTP id f26so25440809ejb.1;
        Wed, 12 Apr 2023 12:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681327416; x=1683919416;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WY8nJU4JGhn4qxkaH+OT3olc/p65GYAELrfcYdwfocA=;
        b=ZSa2kOhYnvjncifCnFqYuWSwTk6Zrs692+kH/81hke9RJ6A82G6Sn9upz2+IEfGvRm
         gi65V11E5RSY4IuDTK0ekeLMSiNbAgSlp3+U23eP8miPljYDi1/OjOFRfXlpKIqzs4Jo
         N0q0iZop5SaV8GqkYTRlH9Y/3wg/n2duvaFiH0F1a1Id+vKG6i+OXGI1YZ0RKsyXQdvQ
         kOXG+uV3cMPLiQI6LGVVBJbwHU8WYOIbZ+wq2HVWnbS4Tg/Y2Q7XU+jaExEHtbmjiOuc
         dYFi7XK6QGl+B+n681hQzd9dblUaTRJA/Na72FHkucU+81sxz9dMlBChpTinVK4J+wdB
         yd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681327416; x=1683919416;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WY8nJU4JGhn4qxkaH+OT3olc/p65GYAELrfcYdwfocA=;
        b=DLSZ/zHsyM51bGXY/5zHBQAHa76x/SKRsPv/u+R5VJJkNKp/9X06ltWuSu5+viXBcg
         iA6mOiHXBzNzDsQQrcsDm/QarrCn06k4v0da9/u1MuIr8PLZGPBog2fR+rEe3tVQoCv6
         PRpM3hHe6V3+AqzH76H8Q9Nb7c0vIGlHdbEG6iN/fh2L/xslIGyNGElJvZiEr/a1f4Pi
         z6eONhOSN5+5/38TS9G9C5xxkVZXoZOTLs4d6oOtbKmWDcAe2mPw62VIs+QeGZIX81wC
         BIsyh/ARTb/msvHoEnILQEh1OLtX/Jfb949drnzOe3pkebolWiukRiGvCTdGvbFyLuoQ
         9rkg==
X-Gm-Message-State: AAQBX9csbMr1am4BlwkkRPnyFIwLi+oo5wcBu/vaZ+qiWv/j/K3xB43j
	8BPHydNlZDIJVIwITovkF5g=
X-Google-Smtp-Source: AKy350ZtXGSLn1PAolAC+UJ2icarAiI9QSNcbt1Qvbh5sa3G0OmhyT5ao8C7nimZG9OWEmyIv6+q7w==
X-Received: by 2002:a17:906:2347:b0:932:365a:969a with SMTP id m7-20020a170906234700b00932365a969amr24228eja.8.1681327415679;
        Wed, 12 Apr 2023 12:23:35 -0700 (PDT)
Received: from ?IPV6:2a02:3100:903d:3d00:b0e7:6bd7:f613:784b? (dynamic-2a02-3100-903d-3d00-b0e7-6bd7-f613-784b.310.pool.telefonica.de. [2a02:3100:903d:3d00:b0e7:6bd7:f613:784b])
        by smtp.googlemail.com with ESMTPSA id m9-20020a170906848900b00947a97a42f2sm7594773ejx.103.2023.04.12.12.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 12:23:35 -0700 (PDT)
Message-ID: <f7291bab-eb51-3f2d-4eb4-78f6330242ef@gmail.com>
Date: Wed, 12 Apr 2023 21:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH v3 3/4] pwm: meson: change clk/pwm gate from mask to bit
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
X-CRM114-CacheID: sfid-20230412_122337_375705_57045198 
X-CRM114-Status: GOOD (  10.70  )
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

Change single-bit values from mask to bit. This facilitates
CCF initialization for the clock gate in a follow-up patch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/pwm/pwm-meson.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 2a86867c1..40a8709ff 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -49,16 +49,16 @@
 #define PWM_HIGH_MASK		GENMASK(31, 16)
 
 #define REG_MISC_AB		0x8
-#define MISC_B_CLK_EN		BIT(23)
-#define MISC_A_CLK_EN		BIT(15)
+#define MISC_B_CLK_EN		23
+#define MISC_A_CLK_EN		15
 #define MISC_CLK_DIV_MASK	0x7f
 #define MISC_B_CLK_DIV_SHIFT	16
 #define MISC_A_CLK_DIV_SHIFT	8
 #define MISC_B_CLK_SEL_SHIFT	6
 #define MISC_A_CLK_SEL_SHIFT	4
 #define MISC_CLK_SEL_MASK	0x3
-#define MISC_B_EN		BIT(1)
-#define MISC_A_EN		BIT(0)
+#define MISC_B_EN		1
+#define MISC_A_EN		0
 
 #define MESON_NUM_PWMS		2
 #define MESON_MAX_MUX_PARENTS	4
@@ -67,22 +67,22 @@ static struct meson_pwm_channel_data {
 	u8		reg_offset;
 	u8		clk_sel_shift;
 	u8		clk_div_shift;
-	u32		clk_en_mask;
-	u32		pwm_en_mask;
+	u8		clk_en_bit;
+	u8		pwm_en_bit;
 } meson_pwm_per_channel_data[MESON_NUM_PWMS] = {
 	{
 		.reg_offset	= REG_PWM_A,
 		.clk_sel_shift	= MISC_A_CLK_SEL_SHIFT,
 		.clk_div_shift	= MISC_A_CLK_DIV_SHIFT,
-		.clk_en_mask	= MISC_A_CLK_EN,
-		.pwm_en_mask	= MISC_A_EN,
+		.clk_en_bit	= MISC_A_CLK_EN,
+		.pwm_en_bit	= MISC_A_EN,
 	},
 	{
 		.reg_offset	= REG_PWM_B,
 		.clk_sel_shift	= MISC_B_CLK_SEL_SHIFT,
 		.clk_div_shift	= MISC_B_CLK_DIV_SHIFT,
-		.clk_en_mask	= MISC_B_CLK_EN,
-		.pwm_en_mask	= MISC_B_EN,
+		.clk_en_bit	= MISC_B_CLK_EN,
+		.pwm_en_bit	= MISC_B_EN,
 	}
 };
 
@@ -231,7 +231,7 @@ static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 	value = readl(meson->base + REG_MISC_AB);
 	value &= ~(MISC_CLK_DIV_MASK << channel_data->clk_div_shift);
 	value |= channel->pre_div << channel_data->clk_div_shift;
-	value |= channel_data->clk_en_mask;
+	value |= BIT(channel_data->clk_en_bit);
 	writel(value, meson->base + REG_MISC_AB);
 
 	value = FIELD_PREP(PWM_HIGH_MASK, channel->hi) |
@@ -239,7 +239,7 @@ static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 	writel(value, meson->base + channel_data->reg_offset);
 
 	value = readl(meson->base + REG_MISC_AB);
-	value |= channel_data->pwm_en_mask;
+	value |= BIT(channel_data->pwm_en_bit);
 	writel(value, meson->base + REG_MISC_AB);
 
 	spin_unlock_irqrestore(&meson->lock, flags);
@@ -253,7 +253,7 @@ static void meson_pwm_disable(struct meson_pwm *meson, struct pwm_device *pwm)
 	spin_lock_irqsave(&meson->lock, flags);
 
 	value = readl(meson->base + REG_MISC_AB);
-	value &= ~meson_pwm_per_channel_data[pwm->hwpwm].pwm_en_mask;
+	value &= ~BIT(meson_pwm_per_channel_data[pwm->hwpwm].pwm_en_bit);
 	writel(value, meson->base + REG_MISC_AB);
 
 	spin_unlock_irqrestore(&meson->lock, flags);
@@ -335,7 +335,7 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	value = readl(meson->base + REG_MISC_AB);
 
-	tmp = channel_data->pwm_en_mask | channel_data->clk_en_mask;
+	tmp = BIT(channel_data->pwm_en_bit) | BIT(channel_data->clk_en_bit);
 	state->enabled = (value & tmp) == tmp;
 
 	tmp = value >> channel_data->clk_div_shift;
-- 
2.40.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
