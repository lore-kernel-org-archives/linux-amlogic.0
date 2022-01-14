Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA62C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W4CGRUxK2JsqxjxydDF2squG+jDuAQWlB++sez4GMSk=; b=h7Ni9TVXdFfaGo
	xDJKBGboOmPr9n4IfqXQ8O/Ptpwo/271E5qJzQcc2lJwrzVO8JlV+Jwq9pIhHGiAh6OqPe1aTeKrx
	6aU1s0RSs4dAgupw4pxLMQWoTpNCuGiLeMmKUd0AaYuL9rMgveJM80DPvPwk+ECHCoh4DERFpaC3n
	Pf01q8VA3kN2XRcpPr0v0Wuq1CPYBEYYpUzXqVie/Qi/OVyfHo425N6utyTucHa+3P4odSnuKFVAT
	6KKoKfAIefkgxDWFI9zmm6vAz6NCGwz3CGRVteQmNsmhScDD3gm3A0GZH0n3hqX3FRATFuqe7yPGJ
	lDIpaSP7P/XGa22Nz4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8IZ9-008QDG-QX; Fri, 14 Jan 2022 09:08:11 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8IYx-008QBs-Cb; Fri, 14 Jan 2022 09:08:01 +0000
Received: from droid10-sz.amlogic.com (10.28.8.20) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Fri, 14 Jan 2022
 17:07:56 +0800
From: <Jiayi.Zhou@amlogic.com>
To: <jbrunet@baylibre.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Jiayi.zhou <jiayi.zhou@amlogic.com>
Subject: [PATCH v2] pwm: meson: external clock configuration for s4
Date: Fri, 14 Jan 2022 17:07:53 +0800
Message-ID: <20220114090753.34873-1-Jiayi.Zhou@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.20]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_010759_468575_53657B32 
X-CRM114-Status: GOOD (  20.31  )
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

From: "Jiayi.zhou" <jiayi.zhou@amlogic.com>

For PWM controller in the Meson-S4 SoC,
PWM needs to obtain an external clock source.
This patch tries to describe them in the DT compatible data.

Signed-off-by: Jiayi.zhou <jiayi.zhou@amlogic.com>
---
 drivers/pwm/pwm-meson.c | 145 ++++++++++++++++++++++++++++++----------
 1 file changed, 110 insertions(+), 35 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 3cf3bcf5ddfc..54db56c95be2 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -51,6 +51,7 @@
 #define REG_MISC_AB		0x8
 #define MISC_B_CLK_EN		BIT(23)
 #define MISC_A_CLK_EN		BIT(15)
+
 #define MISC_CLK_DIV_MASK	0x7f
 #define MISC_B_CLK_DIV_SHIFT	16
 #define MISC_A_CLK_DIV_SHIFT	8
@@ -93,11 +94,13 @@ struct meson_pwm_channel {
 	struct clk *clk_parent;
 	struct clk_mux mux;
 	struct clk *clk;
+	struct clk *clk_mux;
 };
 
 struct meson_pwm_data {
 	const char * const *parent_names;
 	unsigned int num_parents;
+	unsigned int extern_clk;
 };
 
 struct meson_pwm {
@@ -105,6 +108,7 @@ struct meson_pwm {
 	const struct meson_pwm_data *data;
 	struct meson_pwm_channel channels[MESON_NUM_PWMS];
 	void __iomem *base;
+
 	/*
 	 * Protects register (write) access to the REG_MISC_AB register
 	 * that is shared between the two PWMs.
@@ -130,13 +134,15 @@ static int meson_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 
 	channel = &meson->channels[pwm->hwpwm];
 
-	if (channel->clk_parent) {
-		err = clk_set_parent(channel->clk, channel->clk_parent);
-		if (err < 0) {
-			dev_err(dev, "failed to set parent %s for %s: %d\n",
-				__clk_get_name(channel->clk_parent),
-				__clk_get_name(channel->clk), err);
-			return err;
+	if (!meson->data->extern_clk) {
+		if (channel->clk_parent) {
+			err = clk_set_parent(channel->clk, channel->clk_parent);
+			if (err < 0) {
+				dev_err(dev, "failed to set parent %s for %s: %d\n",
+					__clk_get_name(channel->clk_parent),
+					__clk_get_name(channel->clk), err);
+					return err;
+			}
 		}
 	}
 
@@ -171,7 +177,11 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 	if (state->polarity == PWM_POLARITY_INVERSED)
 		duty = period - duty;
 
-	fin_freq = clk_get_rate(channel->clk);
+	if (meson->data->extern_clk) {
+		fin_freq = clk_get_rate(channel->clk_mux);
+	} else {
+		fin_freq = clk_get_rate(channel->clk);
+	}
 	if (fin_freq == 0) {
 		dev_err(meson->chip.dev, "invalid source clock frequency\n");
 		return -EINVAL;
@@ -228,17 +238,32 @@ static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 	struct meson_pwm_channel_data *channel_data;
 	unsigned long flags;
 	u32 value;
+	unsigned long set_clk;
+	u32 err;
 
 	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
 
-	spin_lock_irqsave(&meson->lock, flags);
-
 	value = readl(meson->base + REG_MISC_AB);
-	value &= ~(MISC_CLK_DIV_MASK << channel_data->clk_div_shift);
-	value |= channel->pre_div << channel_data->clk_div_shift;
-	value |= channel_data->clk_en_mask;
-	writel(value, meson->base + REG_MISC_AB);
+	if (meson->data->extern_clk) {
+		set_clk = clk_get_rate(channel->clk_mux);
+
+		if (set_clk == 0)
+			dev_err(meson->chip.dev, "invalid source clock frequency\n");
+		set_clk /= channel->pre_div + 1;
+		err = clk_set_rate(channel->clk, set_clk);
+		if (err)
+			dev_err(meson->chip.dev, "%s: error in setting pwm rate!\n", __func__);
+	} else {
+		spin_lock_irqsave(&meson->lock, flags);
+
+		value &= ~(MISC_CLK_DIV_MASK << channel_data->clk_div_shift);
+		value |= channel->pre_div << channel_data->clk_div_shift;
+		value |= channel_data->clk_en_mask;
+		writel(value, meson->base + REG_MISC_AB);
 
+		spin_unlock_irqrestore(&meson->lock, flags);
+	}
+	spin_lock_irqsave(&meson->lock, flags);
 	value = FIELD_PREP(PWM_HIGH_MASK, channel->hi) |
 		FIELD_PREP(PWM_LOW_MASK, channel->lo);
 	writel(value, meson->base + channel_data->reg_offset);
@@ -246,7 +271,6 @@ static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 	value = readl(meson->base + REG_MISC_AB);
 	value |= channel_data->pwm_en_mask;
 	writel(value, meson->base + REG_MISC_AB);
-
 	spin_unlock_irqrestore(&meson->lock, flags);
 }
 
@@ -333,7 +357,8 @@ static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	struct meson_pwm_channel_data *channel_data;
 	struct meson_pwm_channel *channel;
-	u32 value, tmp;
+	u32 value_pwm, value, tmp;
+	unsigned long gate_clk, fre;
 
 	if (!state)
 		return;
@@ -341,30 +366,42 @@ static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	channel = &meson->channels[pwm->hwpwm];
 	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
 
-	value = readl(meson->base + REG_MISC_AB);
-
-	tmp = channel_data->pwm_en_mask | channel_data->clk_en_mask;
-	state->enabled = (value & tmp) == tmp;
-
-	tmp = value >> channel_data->clk_div_shift;
-	channel->pre_div = FIELD_GET(MISC_CLK_DIV_MASK, tmp);
-
+	value_pwm = readl(meson->base + REG_MISC_AB);
 	value = readl(meson->base + channel_data->reg_offset);
 
 	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
 	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
 
-	if (channel->lo == 0) {
-		state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
-		state->duty_cycle = state->period;
-	} else if (channel->lo >= channel->hi) {
-		state->period = meson_pwm_cnt_to_ns(chip, pwm,
-						    channel->lo + channel->hi);
-		state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm,
-							channel->hi);
+	if (meson->data->extern_clk) {
+		gate_clk = clk_get_rate(channel->clk);
+		fre = gate_clk / (channel->lo + channel->hi);
+		state->period = div_u64(NSEC_PER_SEC, fre);
+		state->duty_cycle = div_u64(state->period * channel->hi, channel->lo + channel->hi);
+		tmp = channel_data->pwm_en_mask;
+
+		if (((value_pwm & tmp) == tmp) && __clk_is_enabled(channel->clk))
+			state->enabled = true;
+		else
+			state->enabled = false;
 	} else {
-		state->period = 0;
-		state->duty_cycle = 0;
+		tmp = channel_data->pwm_en_mask | channel_data->clk_en_mask;
+
+		state->enabled = (value_pwm & tmp) == tmp;
+
+		tmp = value_pwm >> channel_data->clk_div_shift;
+		channel->pre_div = FIELD_GET(MISC_CLK_DIV_MASK, tmp);
+
+		if (channel->lo == 0) {
+			state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
+			state->duty_cycle = state->period;
+		} else if (channel->lo >= channel->hi) {
+			state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->lo
+							    + channel->hi);
+			state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
+		} else {
+			state->period = 0;
+			state->duty_cycle = 0;
+		}
 	}
 }
 
@@ -452,6 +489,10 @@ static const struct meson_pwm_data pwm_g12a_ee_data = {
 	.num_parents = ARRAY_SIZE(pwm_g12a_ee_parent_names),
 };
 
+static const struct meson_pwm_data pwm_meson_data = {
+	.extern_clk = true,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8b-pwm",
@@ -485,6 +526,10 @@ static const struct of_device_id meson_pwm_matches[] = {
 		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
 		.data = &pwm_g12a_ao_cd_data
 	},
+	{
+		.compatible = "amlogic,meson-s4-pwm",
+		.data = &pwm_meson_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_pwm_matches);
@@ -534,6 +579,33 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 	return 0;
 }
 
+static int meson_pwm_extern_init_channels(struct meson_pwm *meson)
+{
+	struct meson_pwm_channel *channels = meson->channels;
+	struct device *dev = meson->chip.dev;
+	unsigned int i;
+	char name[255];
+
+	for (i = 0; i < meson->chip.npwm; i++) {
+		snprintf(name, sizeof(name), "clkin%u", i);
+		(channels + i)->clk = devm_clk_get(dev, name);
+		if (IS_ERR((channels + i)->clk)) {
+			dev_err_probe(meson->chip.dev, PTR_ERR((channels + i)->clk),
+				      "can't get device clock\n");
+			return PTR_ERR((channels + i)->clk);
+		}
+		snprintf(name, sizeof(name), "mux%u", i);
+		(channels + i)->clk_mux = devm_clk_get(dev, name);
+		if (IS_ERR((channels + i)->clk_mux)) {
+			dev_err_probe(meson->chip.dev, PTR_ERR((channels + i)->clk_mux),
+				      "can't get device clock\n");
+			return PTR_ERR((channels + i)->clk_mux);
+		}
+	}
+
+	return 0;
+}
+
 static int meson_pwm_probe(struct platform_device *pdev)
 {
 	struct meson_pwm *meson;
@@ -553,8 +625,11 @@ static int meson_pwm_probe(struct platform_device *pdev)
 	meson->chip.npwm = MESON_NUM_PWMS;
 
 	meson->data = of_device_get_match_data(&pdev->dev);
+	if (meson->data->extern_clk)
+		err = meson_pwm_extern_init_channels(meson);
+	else
+		err = meson_pwm_init_channels(meson);
 
-	err = meson_pwm_init_channels(meson);
 	if (err < 0)
 		return err;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
