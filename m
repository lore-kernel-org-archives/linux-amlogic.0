Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED16C25B75
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQWYFuOkHUnrfQqK9IoPK7kJRAcfUpdWUfs6JCiS3FQ=; b=v3Qlw5Ol/q68Bd
	M2JNXOwoEQh/cQBgxZBjFgJF3jRC6uQsyVxAoXyRugkpdMrzNy1ZJX7xrsX535n3S2KIm7Os94Cio
	uxo9FtoECKXe9AsFUC8tSvKVBTeroDxFTDxTgltC+UhDHFp2GrHYe+0qk2qBJP7GaI8An1PPVUv0u
	yyNLhKnu8EEdpY5eszEGQWv2eyiiohEGaPimNTWKvopWrX8gFp2IjZIcPUrprxfHjL3uHpBuGDfse
	jjW4zHk3ILCfvgjOHwslvagHYECD0VpZyoa7CgRPrXk9XFvHT0z9qicZjJwGFjXSLUj04DNzQyVmE
	CHdxaF0fjGWRSNY5AkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Kuj-0000000GliO-3by5;
	Tue, 21 May 2024 08:32:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Kuf-0000000Glgn-3hLv;
	Tue, 21 May 2024 08:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 50338CE0EBC;
	Tue, 21 May 2024 08:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E74EC4AF07;
	Tue, 21 May 2024 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716280318;
	bh=FvFfKXmL892C/19FVjh91A40ta7Bup2GELFyNP6Jycw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Bx3PYm6SGeIJCgWyRBd4NJFtPuc9zvFFTpshrrRhzpoMWryJgiflnH0ZXAaURqRrl
	 xFjlA9U7Yj2osmMIb5b1zohISb/fOmn1DNUAztFd50SM2/c7xmmWAMQNPS5xEHtbYV
	 Qw3WasyUuGb7lSwDCUvsMHbDrZ0o/jZAuEU5qc9tLYdhmDWR+60WeYlpJ8bl+bDk9Z
	 /kCtpSVQBmQXt3Q80Sdo7ZlCRIFpqSmEgU34q3jGW4UXDUSZIulvieG5on7FULVhS/
	 Oud7Ah9FPnsQ7AMwRdfin5r5nzaHMUO4k6tuys4/zjINhKQB3E+Jyube3+tkGDvO3k
	 bE3bA+eGEkNpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59678C25B78;
	Tue, 21 May 2024 08:31:58 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Tue, 21 May 2024 16:31:34 +0800
Subject: [PATCH v5 1/2] pwm: meson: Add support for Amlogic S4 PWM
MIME-Version: 1.0
Message-Id: <20240521-s4-pwm-v5-1-0c91f5fa32cd@amlogic.com>
References: <20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com>
In-Reply-To: <20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716280316; l=2531;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=TO8jk1KfAyzCYn3EQLKzqT09OdAOiA4QmoDLOLbNW40=;
 b=5mmETv38pNe+0fspL2pwrWOlZHTqe3xBoP5S/HyPB3sSldBE+iqroQeEX7+lrj6B8K/8KMeGU
 b0igt5ehiIKBiBuNmWcxyEcow9PXSdNQWtU4PVQZpKlNYdMUHcpPyta
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_013202_515793_AE0688A2 
X-CRM114-Status: GOOD (  15.01  )
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

This patch adds support for Amlogic S4 PWM.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 drivers/pwm/pwm-meson.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index b2f97dfb01bb..9fea28a51921 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -460,6 +460,51 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
 	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
 }
 
+static void meson_pwm_s4_put_clk(void *data)
+{
+	int i;
+	struct meson_pwm *meson;
+	struct meson_pwm_channel *channel;
+
+	meson = (struct meson_pwm *)data;
+	for (i = 0; i < MESON_NUM_PWMS; i++) {
+		channel = &meson->channels[i];
+		clk_put(channel->clk);
+	}
+}
+
+static int meson_pwm_init_channels_meson_s4(struct pwm_chip *chip)
+{
+	int i, ret;
+	struct device *dev = pwmchip_parent(chip);
+	struct device_node *np = dev->of_node;
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	struct meson_pwm_channel *channel;
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
@@ -498,6 +543,10 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
 };
 
+static const struct meson_pwm_data pwm_meson_s4_data = {
+	.channels_init = meson_pwm_init_channels_meson_s4,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8-pwm-v2",
@@ -536,6 +585,10 @@ static const struct of_device_id meson_pwm_matches[] = {
 		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
 		.data = &pwm_g12a_ao_cd_data
 	},
+	{
+		.compatible = "amlogic,meson-s4-pwm",
+		.data = &pwm_meson_s4_data
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
