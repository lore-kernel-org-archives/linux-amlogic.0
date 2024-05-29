Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC7FC27C44
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5xaW4gz8e+yESm5Fv85zsk8OpuS0XNDDfFwV4MVGN4=; b=W+e7JOkbKgaSCg
	7BlO8AisDA1BoYwD/DxeGYZQ+Bme6ahYqTdDeM49uBDP1k1xVpg6CQG8BTTm0yt8Q4bkKKDuuSBKv
	mSxE5R3FgPmuqduV84HQbKUz0JpTBVVFfc9icvtDNMmcIqPsg7qXWHQwero/PnH5S+6qdM3Ryxbic
	k1mZAP/N7Ib+AeWGgMKucXiyvw/b0y+Gbe01+lZcSRJrFqcAYI9pXvfiKHNJCfgsYrhrkp05jc6yU
	L/wkhkPgqZHdhljO2toVV+Yi173Ygsd2Ls54WJz8qLf3dG9s7U9xX70WpsRis4VvltOobDe6VDO1/
	HA/NEuP3rLxX7Cvn328A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCG7c-00000003is0-1qfq;
	Wed, 29 May 2024 10:01:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCG7Z-00000003ipa-2Nu1;
	Wed, 29 May 2024 10:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8594BCE171E;
	Wed, 29 May 2024 10:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B57EBC32786;
	Wed, 29 May 2024 10:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716976877;
	bh=8ZKgQ6HDURS9lZbhYYRP1FlK44swQk44vF9iL4f8vjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=omxfpRCS+BoYU6p579+U4qWBBrimrfNMcdYqj6k0zG8ZD4dZiNo7tckkZrS6wqQs0
	 ZnBOVPh8hsXqB3hwX/mMzNliZyTNIG9nQ53fn+Xjw3BGfWeQol8DeKtBpc3/rEzu8P
	 V6EQe0oVeD8PZwjz17lIqvK36Eeg2s3Ykr2lwxghLhpEfROmg24at2q+VkEhbWl0fp
	 zIUBDGmTd4GnHRM0vuvLMCLg7Uaxn3WvzN72LWzQKw5DV3zyOsvUbgAojredWDHiGt
	 0JM2arRfjgerXzUFSfYNnRtv5yK3keQ+NYqJJhi3kouXZDWOviFkej2yL9KXLDQ1Gb
	 TEUJuZPB74R2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F917C27C44;
	Wed, 29 May 2024 10:01:17 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Wed, 29 May 2024 18:00:56 +0800
Subject: [PATCH v6 1/2] pwm: meson: Add support for Amlogic S4 PWM
MIME-Version: 1.0
Message-Id: <20240529-s4-pwm-v6-1-270f63049f20@amlogic.com>
References: <20240529-s4-pwm-v6-0-270f63049f20@amlogic.com>
In-Reply-To: <20240529-s4-pwm-v6-0-270f63049f20@amlogic.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kelvin Zhang <kelvin.zhang@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716976876; l=2415;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=8sG15QArjOg32TnDx5atK6muQxwE/8zIMoEGBdYsNU0=;
 b=xckEUtXiz+UAPnFeNXgRskIwNtR3eYtZJMf1R5mGYu+oGQ25XoliidjORSerGwmAPGCZKySzh
 QUO2Eb4P9uqAfJg4F3jzq1qCFNq4Zqd7I+034OIQKrlVHJB1c27Jb/b
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_030126_011181_A3DA57A6 
X-CRM114-Status: GOOD (  14.31  )
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
Reply-To: kelvin.zhang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Junyi Zhao <junyi.zhao@amlogic.com>

Add support for Amlogic S4 PWM.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 drivers/pwm/pwm-meson.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index b2f97dfb01bb..a513ebbb5666 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -460,6 +460,47 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
 	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
 }
 
+static void meson_pwm_s4_put_clk(void *data)
+{
+	struct meson_pwm *meson = (struct meson_pwm *)data;
+	int i;
+
+	for (i = 0; i < MESON_NUM_PWMS; i++)
+		clk_put(meson->channels[i].clk);
+}
+
+static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
+{
+	struct device *dev = pwmchip_parent(chip);
+	struct device_node *np = dev->of_node;
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	struct meson_pwm_channel *channel;
+	int i, ret;
+
+	for (i = 0; i < MESON_NUM_PWMS; i++) {
+		channel = &meson->channels[i];
+		channel->clk = of_clk_get(np, i);
+		if (IS_ERR(channel->clk)) {
+			ret = PTR_ERR(channel->clk);
+			dev_err_probe(dev, ret, "Failed to get clk\n");
+			goto err;
+		}
+	}
+	ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk, meson);
+	if (ret)
+		return ret;
+
+	return 0;
+
+err:
+	while (--i >= 0) {
+		channel = &meson->channels[i];
+		clk_put(channel->clk);
+	}
+
+	return ret;
+}
+
 static const struct meson_pwm_data pwm_meson8b_data = {
 	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
@@ -498,6 +539,10 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
 };
 
+static const struct meson_pwm_data pwm_s4_data = {
+	.channels_init = meson_pwm_init_channels_s4,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8-pwm-v2",
@@ -536,6 +581,10 @@ static const struct of_device_id meson_pwm_matches[] = {
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

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
