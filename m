Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B40ECFB458
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 19:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhaZ7FyAK9cLp6yVesogyo3FOOCpPvO1ryBVEdl6ROk=; b=2W1IIKSK6A1BCw
	a1lE2pcuirxQUdzH+bwbxQKX1GaV2ENBHfJPP6LS7O/BX/fwo/pI0ob/aVgiWR5pnldySdyvJksp7
	dfBzvFKDXd0hPEKrI7PapPBm4ke6edZpn1IGb7uPHEO2YmI7HeYkPs4gXlelcAqVAiBhRts9zCGII
	25yXxJ2lzWLU5Bb2PXE4jXUBuY+LvTihEjPNRDnqDwPnSR54XZNgYDDSARiF9miYKpOeL27+b/tsA
	z+dAjnclGxjFu/TGI6OAe+Sh4z2JdhZjKYOhq3giVosDjzDmJHnnmVcCujbacujRPmjcSNUiCNKmc
	jh/nFh+v1xoEpJRZujhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtWn-00000003dA0-0eQ9;
	Mon, 07 Oct 2024 19:36:21 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtSt-00000003cTP-1SA3;
	Mon, 07 Oct 2024 19:32:27 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 66CFB120011;
	Mon,  7 Oct 2024 22:32:11 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 66CFB120011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1728329531;
	bh=xOckyWlx3vfGFI8gSU4IjntaqtjFggaI/dlsC8fZYpo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=kBcuh6tw/ljgY6WKuadYzahlegMbUQpFsrHDYHAZR5pe1luhrLm1wKPRgDxPGEkR8
	 Vju4e4SUbTgzannQvSkrjA6eOkzFuSh4Z1y9rebep2BGy7GsoZvqz9Jfutk5Qs71Ts
	 z7vylzWUDZiraYRDtBb7sPB8Fdu/TYZsHZV7ChQNLn79kQE9y3tJCXZkYfSX0M6lJo
	 3UADjt6mXPwqHkeklptHERWq2IqpQ2Ljm9utS6NjyN7fskVn1anDJg0Awdcu7omaxB
	 dy6tanu6XO9GPwyRAfd24LteN9CpWwMJL8wXFEY4/8gpno2a1Fr4iJ+5P+wPQYDigU
	 +ZEPlX/7ii6eg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  7 Oct 2024 22:32:11 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH 1/3] pwm: meson: Support constant and polarity bits
Date: Mon, 7 Oct 2024 22:32:01 +0300
Message-ID: <20241007193203.1753326-2-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241007193203.1753326-1-gnstark@salutedevices.com>
References: <20241007193203.1753326-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.192.106]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188276 [Oct 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/07 17:50:00 #26714324
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_123219_927232_43E74AE0 
X-CRM114-Status: GOOD (  22.26  )
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

Newer meson PWM IPs support constant and polarity bits. Support them to
correctly implement constant and inverted output levels.

Using constant bit allows to have truly stable low or high output level.
Since hi and low regs internally increment its values by 1 just writing
zero to any of them gives 1 clock count impulse. If constant bit is set
zero value in hi and low regs is not incremented.

Using polarity bit instead of swapping hi and low reg values allows to
correctly identify inversion in .get_state().

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/pwm/pwm-meson.c | 75 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 98e6c1533312..5d51404bdce3 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -6,7 +6,7 @@
  * PWM output is achieved by calculating a clock that permits calculating
  * two periods (low and high). The counter then has to be set to switch after
  * N cycles for the first half period.
- * The hardware has no "polarity" setting. This driver reverses the period
+ * Partly the hardware has no "polarity" setting. This driver reverses the period
  * cycles (the low length is inverted with the high length) for
  * PWM_POLARITY_INVERSED. This means that .get_state cannot read the polarity
  * from the hardware.
@@ -56,6 +56,10 @@
 #define MISC_B_CLK_SEL_SHIFT	6
 #define MISC_A_CLK_SEL_SHIFT	4
 #define MISC_CLK_SEL_MASK	0x3
+#define MISC_B_CONSTANT_EN	BIT(29)
+#define MISC_A_CONSTANT_EN	BIT(28)
+#define MISC_B_INVERT_EN	BIT(27)
+#define MISC_A_INVERT_EN	BIT(26)
 #define MISC_B_EN		BIT(1)
 #define MISC_A_EN		BIT(0)

@@ -68,6 +72,8 @@ static struct meson_pwm_channel_data {
 	u8		clk_div_shift;
 	u8		clk_en_shift;
 	u32		pwm_en_mask;
+	u32		const_en_mask;
+	u32		inv_en_mask;
 } meson_pwm_per_channel_data[MESON_NUM_PWMS] = {
 	{
 		.reg_offset	= REG_PWM_A,
@@ -75,6 +81,8 @@ static struct meson_pwm_channel_data {
 		.clk_div_shift	= MISC_A_CLK_DIV_SHIFT,
 		.clk_en_shift	= MISC_A_CLK_EN_SHIFT,
 		.pwm_en_mask	= MISC_A_EN,
+		.const_en_mask	= MISC_A_CONSTANT_EN,
+		.inv_en_mask	= MISC_A_INVERT_EN,
 	},
 	{
 		.reg_offset	= REG_PWM_B,
@@ -82,6 +90,8 @@ static struct meson_pwm_channel_data {
 		.clk_div_shift	= MISC_B_CLK_DIV_SHIFT,
 		.clk_en_shift	= MISC_B_CLK_EN_SHIFT,
 		.pwm_en_mask	= MISC_B_EN,
+		.const_en_mask	= MISC_B_CONSTANT_EN,
+		.inv_en_mask	= MISC_B_INVERT_EN,
 	}
 };

@@ -99,6 +109,8 @@ struct meson_pwm_channel {
 struct meson_pwm_data {
 	const char *const parent_names[MESON_NUM_MUX_PARENTS];
 	int (*channels_init)(struct pwm_chip *chip);
+	bool has_constant;
+	bool has_polarity;
 };

 struct meson_pwm {
@@ -160,7 +172,7 @@ static int meson_pwm_calc(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * Fixing this needs some care however as some machines might rely on
 	 * this.
 	 */
-	if (state->polarity == PWM_POLARITY_INVERSED)
+	if (state->polarity == PWM_POLARITY_INVERSED && !meson->data->has_polarity)
 		duty = period - duty;

 	freq = div64_u64(NSEC_PER_SEC * 0xffffULL, period);
@@ -204,6 +216,46 @@ static int meson_pwm_calc(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

+static void meson_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
+				   bool inverted)
+{
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	const struct meson_pwm_channel_data *channel_data;
+	unsigned long flags;
+	u32 value;
+
+	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
+
+	spin_lock_irqsave(&meson->lock, flags);
+	value = readl(meson->base + REG_MISC_AB);
+	if (inverted)
+		value |= channel_data->inv_en_mask;
+	else
+		value &= ~channel_data->inv_en_mask;
+	writel(value, meson->base + REG_MISC_AB);
+	spin_unlock_irqrestore(&meson->lock, flags);
+}
+
+static void meson_pwm_set_constant(struct pwm_chip *chip, struct pwm_device *pwm,
+				   bool enable)
+{
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	const struct meson_pwm_channel_data *channel_data;
+	unsigned long flags;
+	u32 value;
+
+	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
+
+	spin_lock_irqsave(&meson->lock, flags);
+	value = readl(meson->base + REG_MISC_AB);
+	if (enable)
+		value |= channel_data->const_en_mask;
+	else
+		value &= ~channel_data->const_en_mask;
+	writel(value, meson->base + REG_MISC_AB);
+	spin_unlock_irqrestore(&meson->lock, flags);
+}
+
 static void meson_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct meson_pwm *meson = to_meson_pwm(chip);
@@ -255,9 +307,9 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int err = 0;

 	if (!state->enabled) {
-		if (state->polarity == PWM_POLARITY_INVERSED) {
+		if (state->polarity == PWM_POLARITY_INVERSED && !meson->data->has_polarity) {
 			/*
-			 * This IP block revision doesn't have an "always high"
+			 * Some of IP block revisions don't have an "always high"
 			 * setting which we can use for "inverted disabled".
 			 * Instead we achieve this by setting mux parent with
 			 * highest rate and minimum divider value, resulting
@@ -284,6 +336,14 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		meson_pwm_enable(chip, pwm);
 	}

+	if (meson->data->has_constant)
+		meson_pwm_set_constant(chip, pwm,
+				       state->duty_cycle == state->period ||
+				       !state->duty_cycle);
+	if (meson->data->has_polarity)
+		meson_pwm_set_polarity(chip, pwm,
+				       !(state->polarity == PWM_POLARITY_NORMAL));
+
 	return 0;
 }

@@ -318,6 +378,11 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	value = readl(meson->base + REG_MISC_AB);
 	state->enabled = value & channel_data->pwm_en_mask;

+	if (meson->data->has_polarity && (value & channel_data->inv_en_mask))
+		state->polarity = PWM_POLARITY_INVERSED;
+	else
+		state->polarity = PWM_POLARITY_NORMAL;
+
 	value = readl(meson->base + channel_data->reg_offset);
 	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
 	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
@@ -325,8 +390,6 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel->hi);
 	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);

-	state->polarity = PWM_POLARITY_NORMAL;
-
 	return 0;
 }

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
