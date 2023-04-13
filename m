Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52141C77B71
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 07:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lN/rnLweiFkVpMrYqaPr8dbvGs8Bp36GyjWTtcIShJs=; b=1pTAOD+xQyslMM
	w+m2lBuipOQVr+n2+Fk/Ufqrn7dE/o/6xbqHIFSHUYmqxUO/gQXESHl7hQ389OE6e4MQJP7uiuKHL
	VyPDcDtpmVFQwrwvNcJOZiy8KmxR9DRpiC+pN1gSvTy3TPPWqtzdHVLDmCywUvDt18k6AatFz0IcG
	ZMnT25fKpUZI8hh/vzwr/u0X6UQd3+9HtK1Fa59sXM64VMbLkHKPPkDVlFas0ogLU+zZ7w94FaczU
	A2qxBsEzCM5Wj4c0Kcm87XJRZeO5x9Kx8qHN8zp5orcQQf94vQLOL7rf/C5BOAIlgP2c/rYMsQpvi
	uin5XMHTCMOispRduYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmqwk-005ChM-2E;
	Thu, 13 Apr 2023 07:00:42 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmpva-0056Ea-0P;
	Thu, 13 Apr 2023 05:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=P54WqQ6ttxssfZnCLvERrSx5J7WBjwRUTax22UHoySE=; b=UxdDyEbghhnUi9QkaKMnyP+rKe
	yOo29cgfjhroztMqA67yd+O1tPqQo1KuepKanXVdXSLqjJy3DBNltn+562l3HFJ0ew2nuIA42VkR3
	Aysekn2bPbgyhp21VxHP+I5JVLnBRZjrUJBpU1R36+ufZkP4px6V5M5iD0WrCOuBEFLZb9Wi4wLJy
	+RWYLUSDCxpFpfOyE1Dy2YJjiDuSh2smuMwqW3uXW/HGIHozFmQJUGvWoaSVz3KlB6McZWRzDAMDY
	6w0TAA4b9rScGTTLRsBezCZGDQd38pM171zFz1G0DaKWCElmlRyl7kwEm+WTTHRpMxWSAD3Owc47C
	9qT5GD2g==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmpvT-00EdND-1T;
	Thu, 13 Apr 2023 05:55:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id jg21so34213595ejc.2;
        Wed, 12 Apr 2023 22:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681365315; x=1683957315;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P54WqQ6ttxssfZnCLvERrSx5J7WBjwRUTax22UHoySE=;
        b=Yk6H84kSXPn6GUvL7iJ5Mlqx2REDU2PaQ3hycknlrUEAp+BcHSvsDad7QazANgMtTD
         Q0zC6iaX1ma4PgFW8pWd0w6fE6q00Yhm4AdkFhPjLbzfAEL7ikoeUocelGwS79M937or
         WxJH9PPRjO6FueaGwK+ifg48KXOfArWK5nf3ayDDlT7SZ0C0TskklrDC3qdXQdDaT6gf
         XM9n1f5uJX47rlJ5Jt3jp3OV4cKV8szOWSd1goQZ8h9QmV2v0Hjiu8yM4q0eOfEuDaYM
         9LFf7B7iRUx/fZhJ902FpL3gGdtvCb5+r/FUZLfVlvo64CBmuMMVZ1owcXE0k+k8VMbB
         n1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681365315; x=1683957315;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P54WqQ6ttxssfZnCLvERrSx5J7WBjwRUTax22UHoySE=;
        b=QI4AFDpwpq1owp2rED4z66toGrFvGVocBdSTDSbP8cYsjiV8Od9iqL/sA5rdOEcDLW
         j/X4uGWiU0A2RNz/QqAsil5CXve8JGb5jyWbf8C6z9faeJVwa+cTJpFf0UcBvxDD7WhI
         QnQWLeVHtKaBmR84+zifvtnBn7EYNSs8W8zq+4eI5hlsUsjygbJR2N00KJYdEi5q9Qqc
         cw/dC6JpXtxM4YkSD9JVxzWHx2bR50XPUFU7xL/BnoIskJGRqhkJPCZDhmRSNk3N/4y/
         d3GfpZY0Nns5VHPrWwVah7AV0X+4fZFtijMiGq9kU4yOthjl6QSRFdYlcuVk9TprCqPv
         GZcg==
X-Gm-Message-State: AAQBX9c+yhpWCtNA7NW11O9Uc0CNQncJfyZB/KsoYJ+DS+jq7qObU8TE
	DQGL1v1EoMdaa8tCWYUyj3c=
X-Google-Smtp-Source: AKy350anK3iDzZnssp0S6ENBBi2b8VkpkYa7umUO1HGP54vhv2rwjLvtrdokUEtipzY+yiWerTtqVg==
X-Received: by 2002:a17:906:70d1:b0:92d:145a:6115 with SMTP id g17-20020a17090670d100b0092d145a6115mr1897215ejk.38.1681365315256;
        Wed, 12 Apr 2023 22:55:15 -0700 (PDT)
Received: from ?IPV6:2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8? (dynamic-2a01-0c22-738e-4400-9dd0-adc5-d6d8-61d8.c22.pool.telefonica.de. [2a01:c22:738e:4400:9dd0:adc5:d6d8:61d8])
        by smtp.googlemail.com with ESMTPSA id s5-20020a170906168500b0094d69608f5fsm414212ejd.97.2023.04.12.22.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 22:55:14 -0700 (PDT)
Message-ID: <4236e082-fd21-c393-dc75-ad6bb0533249@gmail.com>
Date: Thu, 13 Apr 2023 07:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH v4 3/4] pwm: meson: change clk/pwm gate from mask to bit
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
X-CRM114-CacheID: sfid-20230413_065520_112498_29BA4B68 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
