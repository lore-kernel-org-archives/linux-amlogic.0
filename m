Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76092C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTfQkmOFUof4D7wLHZ5lye3Sm+8rhnQJYWxddDlCqZk=; b=jlU1obMU2FF6LK
	hPL51T5NIioJAj+cXqaD4nMlXT54XtphJLti+g2XbcDtP/CGlOLBvgWBkpcZN2/gseZp4LmxE5maM
	BmvCCWZ3D2sw6d/+PddSogKZrbQCxzAJmStXPOWjYypAmO0pGkVfYWS2fhLnAYpnIuiKdlFPINiiC
	6hFb1l+oI8k0tPyHMaNkFxklywvDJtAnwyDpHbRBLo4TmsIyR1dt+rAcZk/YP832oRbycKKlTJi9j
	rRr7jJHKjK4PpCwmNh6ZbdFjoSpsDecgWO3KfTXePSwK76lSrEREQBBoKmgOE5caDTSFpsTgy1oZj
	UXzANlqVXanp7omedTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXa-00EWPn-16;
	Wed, 24 May 2023 19:52:58 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXR-00EWDN-0V;
	Wed, 24 May 2023 19:52:51 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-510b6a24946so2717269a12.0;
        Wed, 24 May 2023 12:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684957965; x=1687549965;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vibbdVSC64d7h0aZ4zXN81eGjJt2js9ztMIl2I7znr0=;
        b=sHNiDeEsiB+i6Qy9bW4IQWAPrZYLRsMXHgaa1UBglt/EZ3bzXb5b1rSM6wFLdGLwmd
         v0nZ/l8uO54gBYvWXbGqLyxH0uYFNFp2RiSdvxqmFUnA1BgsMHiFSC/wsm7fs0lxRZz7
         zDjj1Js1MKGhYc4zmUT1j9iVWVOv7OlQIwg6dkgwuiuhoH9GjRqy/ZrZVv3VoZ+F+k6D
         MsYiWjihqZmrgEsWs9358wBK+vVH8YuraSRGEm7PcQ1t6rbrS69EpHvxi+z+B7H55Cp0
         7YROOMDRx3FGVHxJPVrWiMhZFoSjOhXWQWUPU6M9sUlk7ynkIC/TSS9klizcw8yVAmHP
         Cubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684957965; x=1687549965;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vibbdVSC64d7h0aZ4zXN81eGjJt2js9ztMIl2I7znr0=;
        b=huletzmr3M/oIHmIoaI9Dr47WoChqvqCVtkGlvnePoM87W1Yt1o49X3Ebn1H2Wi7Fl
         FrdbQFf/Z8bt9diRf89uvsoTZ7xwqdSu0vyZMg7MZ5CiRjqQzDAqsZLXPwd0iRtafZkT
         zDH8gqVxyFPttlNXTZaOQuDjROCzmE/kJ1ZcjaSQJsP2vCUllR+5qkckaCxXZ0XMOswy
         AFOwvBHOwWwPpf4E/N1/k5jZ8xSl70Gw3r9IRfVcv2otBK2vV4leR4gK6RntOiOrPTR9
         EzXfjzGZInHfc3rwOUYcz0FpqlVSZgQE/Ocz92bNeO+OesDQY9unnSJTMRSZI4x8vxsO
         xHhw==
X-Gm-Message-State: AC+VfDy0GvDQ1Uxr2DafqkNWC/B10ZVpA14Sq5ok0StwAzIL2VdhIoHk
	farydj/GMSiB3/n2t7W59QI=
X-Google-Smtp-Source: ACHHUZ6WZWgjjLO4fmRZODK6B57Zb98c8JVVM8dsgjY437DZUOUIXbPUET+ZELL9pob+GvDjO4d06g==
X-Received: by 2002:a05:6402:494:b0:50b:d5e5:519d with SMTP id k20-20020a056402049400b0050bd5e5519dmr2864310edv.4.1684957965267;
        Wed, 24 May 2023 12:52:45 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c519:9c00:cd4b:d130:35c7:5e08? (dynamic-2a01-0c23-c519-9c00-cd4b-d130-35c7-5e08.c23.pool.telefonica.de. [2a01:c23:c519:9c00:cd4b:d130:35c7:5e08])
        by smtp.googlemail.com with ESMTPSA id u24-20020a05640207d800b00504a356b149sm246313edy.25.2023.05.24.12.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:52:44 -0700 (PDT)
Message-ID: <8970e813-1fd8-edbd-afe0-7ebf94b31044@gmail.com>
Date: Wed, 24 May 2023 21:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v5 6/6] pwm: meson: make full use of common clock framework
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
 linux-pwm@vger.kernel.org, Dmitry Rokosov <ddrokosov@sberdevices.ru>
References: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
In-Reply-To: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_125249_203723_96EAAB72 
X-CRM114-Status: GOOD (  33.28  )
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

Newer versions of the PWM block use a core clock with external mux,
divider, and gate. These components either don't exist any longer in
the PWM block, or they are bypassed.
To minimize needed changes for supporting the new version, the internal
divider and gate should be handled by CCF too.

I didn't see a good way to split the patch, therefore it's somewhat
bigger. What it does:

- The internal mux is handled by CCF already. Register also internal
  divider and gate with CCF, so that we have one representation of the
  input clock: [mux] parent of [divider] parent of [gate]
  
- Now that CCF selects an appropriate mux parent, we don't need the
  DT-provided default parent any longer. Accordingly we can also omit
  setting the mux parent directly in the driver.
  
- Instead of manually handling the pre-div divider value, let CCF
  set the input clock. Targeted input clock frequency is
  0xffff * 1/period for best precision.
  
- For the "inverted pwm disabled" scenario target an input clock
  frequency of ULONG_MAX. This ensures that the remaining low pulses
  have minimum length.

I don't have hw with the old PWM block, therefore I couldn't test this
patch. With the not yet included extension for the new PWM block
(channel->clk coming directly from get_clk(external_clk)) I didn't
notice any problem. My system uses PWM for the CPU voltage regulator
and for the SDIO 32kHz clock.

Note: The clock gate in the old PWM block is permanently disabled.
This seems to indicate that it's not used by the new PWM block.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
Changes to RFT/RFC version:
- use parent_hws instead of parent_names for div/gate clock
- use devm_clk_hw_register where the struct clk * returned by
  devm_clk_register isn't needed

v2:
- add patch 1
- add patch 3
- switch to using clk_parent_data in all relevant places
v3:
- add flag CLK_IGNORE_UNUSED
v4:
- remove variable tmp in meson_pwm_get_state
- don't use deprecated function devm_clk_register
v5:
- add clk_en_shift
- use div_u64 when dividing by NSEC_PER_SEC
- use div64_ul in meson_pwm_cnt_to_ns
- remove check for __clk_is_enabled(channel->clk) from meson_pwm_get_state()
  because this is always true once the PWM is requested
---
 drivers/pwm/pwm-meson.c | 158 +++++++++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 68 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 48dcc44df..22f54db3a 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -49,9 +49,9 @@
 #define PWM_HIGH_MASK		GENMASK(31, 16)
 
 #define REG_MISC_AB		0x8
-#define MISC_B_CLK_EN		BIT(23)
-#define MISC_A_CLK_EN		BIT(15)
-#define MISC_CLK_DIV_MASK	0x7f
+#define MISC_B_CLK_EN_SHIFT	23
+#define MISC_A_CLK_EN_SHIFT	15
+#define MISC_CLK_DIV_WIDTH	7
 #define MISC_B_CLK_DIV_SHIFT	16
 #define MISC_A_CLK_DIV_SHIFT	8
 #define MISC_B_CLK_SEL_SHIFT	6
@@ -67,32 +67,33 @@ static struct meson_pwm_channel_data {
 	u8		reg_offset;
 	u8		clk_sel_shift;
 	u8		clk_div_shift;
-	u32		clk_en_mask;
+	u8		clk_en_shift;
 	u32		pwm_en_mask;
 } meson_pwm_per_channel_data[MESON_NUM_PWMS] = {
 	{
 		.reg_offset	= REG_PWM_A,
 		.clk_sel_shift	= MISC_A_CLK_SEL_SHIFT,
 		.clk_div_shift	= MISC_A_CLK_DIV_SHIFT,
-		.clk_en_mask	= MISC_A_CLK_EN,
+		.clk_en_shift	= MISC_A_CLK_EN_SHIFT,
 		.pwm_en_mask	= MISC_A_EN,
 	},
 	{
 		.reg_offset	= REG_PWM_B,
 		.clk_sel_shift	= MISC_B_CLK_SEL_SHIFT,
 		.clk_div_shift	= MISC_B_CLK_DIV_SHIFT,
-		.clk_en_mask	= MISC_B_CLK_EN,
+		.clk_en_shift	= MISC_B_CLK_EN_SHIFT,
 		.pwm_en_mask	= MISC_B_EN,
 	}
 };
 
 struct meson_pwm_channel {
+	unsigned long rate;
 	unsigned int hi;
 	unsigned int lo;
-	u8 pre_div;
 
-	struct clk *clk_parent;
 	struct clk_mux mux;
+	struct clk_divider div;
+	struct clk_gate gate;
 	struct clk *clk;
 };
 
@@ -125,16 +126,6 @@ static int meson_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 	struct device *dev = chip->dev;
 	int err;
 
-	if (channel->clk_parent) {
-		err = clk_set_parent(channel->clk, channel->clk_parent);
-		if (err < 0) {
-			dev_err(dev, "failed to set parent %s for %s: %d\n",
-				__clk_get_name(channel->clk_parent),
-				__clk_get_name(channel->clk), err);
-			return err;
-		}
-	}
-
 	err = clk_prepare_enable(channel->clk);
 	if (err < 0) {
 		dev_err(dev, "failed to enable clock %s: %d\n",
@@ -157,9 +148,9 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 			  const struct pwm_state *state)
 {
 	struct meson_pwm_channel *channel = &meson->channels[pwm->hwpwm];
-	unsigned int pre_div, cnt, duty_cnt;
+	unsigned int cnt, duty_cnt;
 	unsigned long fin_freq;
-	u64 duty, period;
+	u64 duty, period, freq;
 
 	duty = state->duty_cycle;
 	period = state->period;
@@ -173,7 +164,11 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 	if (state->polarity == PWM_POLARITY_INVERSED)
 		duty = period - duty;
 
-	fin_freq = clk_get_rate(channel->clk);
+	freq = div64_u64(NSEC_PER_SEC * 0xffffULL, period);
+	if (freq > ULONG_MAX)
+		freq = ULONG_MAX;
+
+	fin_freq = clk_round_rate(channel->clk, freq);
 	if (fin_freq == 0) {
 		dev_err(meson->chip.dev, "invalid source clock frequency\n");
 		return -EINVAL;
@@ -181,40 +176,31 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 
 	dev_dbg(meson->chip.dev, "fin_freq: %lu Hz\n", fin_freq);
 
-	pre_div = div64_u64(fin_freq * period, NSEC_PER_SEC * 0xffffLL);
-	if (pre_div > MISC_CLK_DIV_MASK) {
-		dev_err(meson->chip.dev, "unable to get period pre_div\n");
-		return -EINVAL;
-	}
-
-	cnt = div64_u64(fin_freq * period, NSEC_PER_SEC * (pre_div + 1));
+	cnt = div_u64(fin_freq * period, NSEC_PER_SEC);
 	if (cnt > 0xffff) {
 		dev_err(meson->chip.dev, "unable to get period cnt\n");
 		return -EINVAL;
 	}
 
-	dev_dbg(meson->chip.dev, "period=%llu pre_div=%u cnt=%u\n", period,
-		pre_div, cnt);
+	dev_dbg(meson->chip.dev, "period=%llu cnt=%u\n", period, cnt);
 
 	if (duty == period) {
-		channel->pre_div = pre_div;
 		channel->hi = cnt;
 		channel->lo = 0;
 	} else if (duty == 0) {
-		channel->pre_div = pre_div;
 		channel->hi = 0;
 		channel->lo = cnt;
 	} else {
-		duty_cnt = div64_u64(fin_freq * duty, NSEC_PER_SEC * (pre_div + 1));
+		duty_cnt = div_u64(fin_freq * duty, NSEC_PER_SEC);
 
-		dev_dbg(meson->chip.dev, "duty=%llu pre_div=%u duty_cnt=%u\n",
-			duty, pre_div, duty_cnt);
+		dev_dbg(meson->chip.dev, "duty=%llu duty_cnt=%u\n", duty, duty_cnt);
 
-		channel->pre_div = pre_div;
 		channel->hi = duty_cnt;
 		channel->lo = cnt - duty_cnt;
 	}
 
+	channel->rate = fin_freq;
+
 	return 0;
 }
 
@@ -224,16 +210,15 @@ static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 	struct meson_pwm_channel_data *channel_data;
 	unsigned long flags;
 	u32 value;
+	int err;
 
 	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
 
-	spin_lock_irqsave(&meson->lock, flags);
+	err = clk_set_rate(channel->clk, channel->rate);
+	if (err)
+		dev_err(meson->chip.dev, "setting clock rate failed\n");
 
-	value = readl(meson->base + REG_MISC_AB);
-	value &= ~(MISC_CLK_DIV_MASK << channel_data->clk_div_shift);
-	value |= channel->pre_div << channel_data->clk_div_shift;
-	value |= channel_data->clk_en_mask;
-	writel(value, meson->base + REG_MISC_AB);
+	spin_lock_irqsave(&meson->lock, flags);
 
 	value = FIELD_PREP(PWM_HIGH_MASK, channel->hi) |
 		FIELD_PREP(PWM_LOW_MASK, channel->lo);
@@ -272,16 +257,16 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			/*
 			 * This IP block revision doesn't have an "always high"
 			 * setting which we can use for "inverted disabled".
-			 * Instead we achieve this using the same settings
-			 * that we use a pre_div of 0 (to get the shortest
-			 * possible duration for one "count") and
-			 * "period == duty_cycle". This results in a signal
+			 * Instead we achieve this by setting mux parent with
+			 * highest rate and minimum divider value, resulting
+			 * in the shortest possible duration for one "count"
+			 * and "period == duty_cycle". This results in a signal
 			 * which is LOW for one "count", while being HIGH for
 			 * the rest of the (so the signal is HIGH for slightly
 			 * less than 100% of the period, but this is the best
 			 * we can achieve).
 			 */
-			channel->pre_div = 0;
+			channel->rate = ULONG_MAX;
 			channel->hi = ~0;
 			channel->lo = 0;
 
@@ -300,13 +285,12 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
-static unsigned int meson_pwm_cnt_to_ns(struct pwm_chip *chip,
-					struct pwm_device *pwm, u32 cnt)
+static u64 meson_pwm_cnt_to_ns(struct pwm_chip *chip, struct pwm_device *pwm,
+			       u32 cnt)
 {
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	struct meson_pwm_channel *channel;
 	unsigned long fin_freq;
-	u32 fin_ns;
 
 	/* to_meson_pwm() can only be used after .get_state() is called */
 	channel = &meson->channels[pwm->hwpwm];
@@ -315,9 +299,7 @@ static unsigned int meson_pwm_cnt_to_ns(struct pwm_chip *chip,
 	if (fin_freq == 0)
 		return 0;
 
-	fin_ns = div_u64(NSEC_PER_SEC, fin_freq);
-
-	return cnt * fin_ns * (channel->pre_div + 1);
+	return div64_ul(NSEC_PER_SEC * (u64)cnt, fin_freq);
 }
 
 static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -326,7 +308,7 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	struct meson_pwm_channel_data *channel_data;
 	struct meson_pwm_channel *channel;
-	u32 value, tmp;
+	u32 value;
 
 	if (!state)
 		return 0;
@@ -335,15 +317,9 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
 
 	value = readl(meson->base + REG_MISC_AB);
-
-	tmp = channel_data->pwm_en_mask | channel_data->clk_en_mask;
-	state->enabled = (value & tmp) == tmp;
-
-	tmp = value >> channel_data->clk_div_shift;
-	channel->pre_div = FIELD_GET(MISC_CLK_DIV_MASK, tmp);
+	state->enabled = value & channel_data->pwm_en_mask;
 
 	value = readl(meson->base + channel_data->reg_offset);
-
 	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
 	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
 
@@ -473,6 +449,7 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 
 	for (i = 0; i < meson->chip.npwm; i++) {
 		struct meson_pwm_channel *channel = &meson->channels[i];
+		struct clk_parent_data div_parent = {}, gate_parent = {};
 		struct clk_init_data init = {};
 
 		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
@@ -492,18 +469,63 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 		channel->mux.table = NULL;
 		channel->mux.hw.init = &init;
 
-		channel->clk = devm_clk_register(dev, &channel->mux.hw);
-		if (IS_ERR(channel->clk)) {
-			err = PTR_ERR(channel->clk);
+		err = devm_clk_hw_register(dev, &channel->mux.hw);
+		if (err) {
+			dev_err(dev, "failed to register %s: %d\n", name, err);
+			return err;
+		}
+
+		snprintf(name, sizeof(name), "%s#div%u", dev_name(dev), i);
+
+		init.name = name;
+		init.ops = &clk_divider_ops;
+		init.flags = CLK_SET_RATE_PARENT;
+		div_parent.index = -1;
+		div_parent.hw = &channel->mux.hw;
+		init.parent_data = &div_parent;
+		init.num_parents = 1;
+
+		channel->div.reg = meson->base + REG_MISC_AB;
+		channel->div.shift = meson_pwm_per_channel_data[i].clk_div_shift;
+		channel->div.width = MISC_CLK_DIV_WIDTH;
+		channel->div.hw.init = &init;
+		channel->div.flags = 0;
+		channel->div.lock = &meson->lock;
+
+		err = devm_clk_hw_register(dev, &channel->div.hw);
+		if (err) {
 			dev_err(dev, "failed to register %s: %d\n", name, err);
 			return err;
 		}
 
-		snprintf(name, sizeof(name), "clkin%u", i);
+		snprintf(name, sizeof(name), "%s#gate%u", dev_name(dev), i);
 
-		channel->clk_parent = devm_clk_get_optional(dev, name);
-		if (IS_ERR(channel->clk_parent))
-			return PTR_ERR(channel->clk_parent);
+		init.name = name;
+		init.ops = &clk_gate_ops;
+		init.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED;
+		gate_parent.index = -1;
+		gate_parent.hw = &channel->div.hw;
+		init.parent_data = &gate_parent;
+		init.num_parents = 1;
+
+		channel->gate.reg = meson->base + REG_MISC_AB;
+		channel->gate.bit_idx = meson_pwm_per_channel_data[i].clk_en_shift;
+		channel->gate.hw.init = &init;
+		channel->gate.flags = 0;
+		channel->gate.lock = &meson->lock;
+
+		err = devm_clk_hw_register(dev, &channel->gate.hw);
+		if (err) {
+			dev_err(dev, "failed to register %s: %d\n", name, err);
+			return err;
+		}
+
+		channel->clk = devm_clk_hw_get_clk(dev, &channel->gate.hw, NULL);
+		if (IS_ERR(channel->clk)) {
+			err = PTR_ERR(channel->clk);
+			dev_err(dev, "failed to register %s: %d\n", name, err);
+			return err;
+		}
 	}
 
 	return 0;
-- 
2.40.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
