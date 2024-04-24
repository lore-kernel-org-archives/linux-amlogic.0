Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B6EC4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbGKYrfQu2g0xqPcaxmBYJrAOV5L2jiBzCJQo09SjR0=; b=3kbSdWsXBoD4/u
	AS6y4ipOL/Bgm13e1k1cW7dIhrQ4zpIT+JAIiQHfxbZPSvWTlO4mY/H6fOQ76ihHiTspSBlFdRFea
	wXzOW2Ua2gGSN2bnEHW/I9n4iNpgHg0VisbVQ19ElB1qO0EcnqAdSNtEt7fnwbwDhCwRaKL7PAdZ+
	ndbqvTKnbEyl6s+5I5DAnYRwK6M3HQnFAfjC99xKEvbHnfAp1QGiwozVZTfFIOUFpjCExALUwwe9g
	nKPhHpwKGqPZ34xsBEYxuQqVnM2xFJb72dHhGjWuymeu7QP78yXbezBSiUElOdXb3MWkkOA6RHIoP
	y3kga6WND8rHqoHK2YDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZsB-00000003hEs-1QQK;
	Wed, 24 Apr 2024 10:29:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZs8-00000003hBn-1Wc2;
	Wed, 24 Apr 2024 10:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=/lpv7brR0RF76hxqPeDFsv+yMIPET6CiXSOh/uaU9JU=; b=GrpoZB4uG8S6dKytlvnU5Ohx/9
	tP0e3aW/3NDeqy6tgwC27dR7DDrW3/JgVAoxytYSnLWnd2MXXV4r8ZpqBBgef6eBR9Q5CpjB0lxeO
	oQLX29RoqhKLYN4dxk6HfAH3geuL94DZPkavfgOdsFib0zcSc4Qm9UncXucXuyk6TRWR+azwOrgBF
	MOtwdIqb0GNd4CJYf3uWpA74vM9FoTUXfm0/OdH9C0JXy1olnBUXrgkqXIbzKKusUCXD4poIkGLgR
	lfvGj6mfxTB0dvt6E4mWbNWMg+ELA11gW0kT8QSFEWwrKDdK3agYEcxzVl6MEX/da6OZaiItN41yd
	JY8jfpzg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZs4-0000000EM83-09gG;
	Wed, 24 Apr 2024 10:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6897A619F8;
	Wed, 24 Apr 2024 10:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10352C32781;
	Wed, 24 Apr 2024 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713954525;
	bh=8ajJMJwApKqgCf9f89bVvjuzXAt5v7XkRoPUav8YUV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YMbrlT3q971srEC/EdzXQzYg9th7O/dE3TBkPX+5C9rd86TwGXVoGLBlzixIqn32q
	 gqOFkCj/BOHOUaIWbP5Bpb4Wb6Wc9C4iJyztdGYGbigDAqNU63SzWRH/IMdfVcrlcd
	 p4fdK0b2XnSJEmO5V5Eg9FKu+OLwbhJiFolk3SfNlTlylYcVcsn68USIYn3mqgzRvv
	 VSotiIsqhReg5aL8SgoZoetk+PRnQWcaYSmaHVr4mjqXssEe6cUuR/A2YeQH3k35F/
	 jcoHjcduJZlSNl4FAPAYSwpUjJdSqn+u6Tl2BS0B77ZVJlwsO4n7KYujFAQfzf2nx/
	 VUza5eFYjAORw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DE9C10F15;
	Wed, 24 Apr 2024 10:28:44 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Wed, 24 Apr 2024 18:28:34 +0800
Subject: [PATCH v4 1/2] pwm: meson: Add support for Amlogic S4 PWM
MIME-Version: 1.0
Message-Id: <20240424-s4-pwm-v4-1-ee22effd40d0@amlogic.com>
References: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
In-Reply-To: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713954523; l=2139;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=gtMEBe84ZprBZCQ2WIxZzSC+jfy6SdQC7eTQHo6OrP0=;
 b=2QReknnu4j0rhx43sc1H5ezdFAmc2B0Conf7r5ceTUUiA7AhpLj1EGHL8ako++gaojevQyKMp
 /bUmR33rPpQBpTp6b3G0VADO0q5tb3bJ3U47m/++XxFOOnLyRO0dKc6
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_112900_417231_C79F058B 
X-CRM114-Status: GOOD (  14.56  )
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
 drivers/pwm/pwm-meson.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index ea96c5973488..6abc823745e4 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -462,6 +462,35 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
 	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
 }
 
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
@@ -500,6 +529,10 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
 };
 
+static const struct meson_pwm_data pwm_meson_s4_data = {
+	.channels_init = meson_pwm_init_channels_meson_s4,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8-pwm-v2",
@@ -538,6 +571,10 @@ static const struct of_device_id meson_pwm_matches[] = {
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
