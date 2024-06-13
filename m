Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1485FC27C75
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 11:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/eySJpoOjA6X/OnBOdAqVGy6Mj2Ft8v4mQeE9UuX6k=; b=dmnz8WzxKMKby9
	MJnBGKT6BfIPKmTZtT+Mtr8tZ3l0h1gEySEw0zUUEgIJ+m7QutjLLsU4RNRTHxG3gUKXtAPsPJgim
	7e840GY04rAQqFp2bZZS6CAF5b9eFQULqtf9/Z1bXZG9dpjz2Rvv0Dqy11+u6t4hiJJvmZsFuYTm2
	JDYhxGktTdg07O5Bo8av8+hVLMJlSzP9+BACKNHvBU9TDn6AQwwzlGZv05Qc70J+Z3/PDWCtYZsnL
	vg8uygXhLyJQpFFnWnqm0XgI+a6MUSi2NcwCRQfrhZvIXnw13YVa8uRb0YHeY8mH87rkIbU59SO4M
	lgPPLFwLzSi6axrY0nPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHivK-0000000GMR5-2Hi0;
	Thu, 13 Jun 2024 11:47:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHivF-0000000GMOZ-20q6;
	Thu, 13 Jun 2024 11:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7894DCE2383;
	Thu, 13 Jun 2024 11:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D25FAC4AF1C;
	Thu, 13 Jun 2024 11:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718279233;
	bh=P9Nv2rPgkyI+rwI9+K/xy5zN9qQW0189/gZkEhjsAc0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UWQznOZSzAxaB/69SwoQbOVV1SZMylhjYX8UlpXapkTCYDaYZ2CUe3NrXwekA3b9V
	 tGmGjRKjnkTMczrAccXJ6Ol/UybrgNCSTwbsApreReTm8dfmDmwQYgvf7X7QPU82gv
	 sdPYUGNsa0wIO/GSX4jBizVmiOQjXIROlbutwTzsMe+SrcC8z6l/1PcSbT6od3l6qN
	 XQUiW0vyotvGnXkSsVs6Scowe+UImPZTPpItfwz0sQwgtPmsVYkih2ZDKozVkNVy+I
	 Q7l4moI/7sI7ddurX1aeTzCW45/cOcNLuM57jCtjFDEHbbnXim0eI8rVfstUub+iQp
	 5p7f6BDj5rQoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE9DC27C79;
	Thu, 13 Jun 2024 11:47:13 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Thu, 13 Jun 2024 19:46:35 +0800
Subject: [PATCH v8 1/2] pwm: meson: Add support for Amlogic S4 PWM
MIME-Version: 1.0
Message-Id: <20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
In-Reply-To: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718279231; l=2242;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=dwmGsdqAEwQLKSoMsQIDCvsk9F7mUyX4lQiaMw6xB40=;
 b=PUnfZ4mzns+rxE0HtGPXEcYGpdRjcKqzUBEqN9+o9pLHDZtrkOzknLMkJy6Pm8l7A8vDYRg7E
 16ZoAfi0aG3C8LnJUQ8nrYtr4L3Zsy/ZbWEA+3a4QtgxKIaDCmvSR7w
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_044717_933540_C73E3F3D 
X-CRM114-Status: GOOD (  12.17  )
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
 drivers/pwm/pwm-meson.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index b2f97dfb01bb..98e6c1533312 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -460,6 +460,37 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
 	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
 }
 
+static void meson_pwm_s4_put_clk(void *data)
+{
+	struct clk *clk = data;
+
+	clk_put(clk);
+}
+
+static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
+{
+	struct device *dev = pwmchip_parent(chip);
+	struct device_node *np = dev->of_node;
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	int i, ret;
+
+	for (i = 0; i < MESON_NUM_PWMS; i++) {
+		meson->channels[i].clk = of_clk_get(np, i);
+		if (IS_ERR(meson->channels[i].clk))
+			return dev_err_probe(dev,
+					     PTR_ERR(meson->channels[i].clk),
+					     "Failed to get clk\n");
+
+		ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
+					       meson->channels[i].clk);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to add clk_put action\n");
+	}
+
+	return 0;
+}
+
 static const struct meson_pwm_data pwm_meson8b_data = {
 	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
@@ -498,6 +529,10 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
 };
 
+static const struct meson_pwm_data pwm_s4_data = {
+	.channels_init = meson_pwm_init_channels_s4,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8-pwm-v2",
@@ -536,6 +571,10 @@ static const struct of_device_id meson_pwm_matches[] = {
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
