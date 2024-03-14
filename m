Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEE8C54E60
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 23:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEUBAcKKogH9vNiXqudi64TMJEGuWuCfziPpfDOvZK4=; b=nGy7SSg9PveEsb
	pkzU6jTV5hjALj0nBsjFsMV0SpTKwMU7wiFtVenjlp2NhZGauFppPMYlN+elZ3zzkLrNChbuqqEAw
	1ZdX3ShbxHGKYiSWHWP+KmUzc3cPOC5sXSQbI4bKSTXkcNGhhXwbTlCAsIaUoHtM13pJZYOCYnl1j
	dQ1vlO1Tnj/Kdc+6QZmHOzGe2Zp8J89LsJeYV0jjxoqd37ityZBrIvd3fPnUN3z9GEWyq1qw8HVks
	rXRftHu56qSxemrc6AYucn+tTTQKiHeWaC++hLU0ARG+yzXGaSsKdZUaunQAcgqCfRdZW9fhSfK50
	FemTWCINXkZ4DJzLZhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuRC-0000000FyZn-063h;
	Thu, 14 Mar 2024 23:24:38 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuPu-0000000Fxhp-49CW;
	Thu, 14 Mar 2024 23:23:21 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 57B23100014;
	Fri, 15 Mar 2024 02:23:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 57B23100014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458584;
	bh=JpPi/mOFnVXfj66BfKe1fDh74tyhvH11HXKdHTzjj5w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=NOqBj4IqQ1b+EsHMXHl4EYsP7fvyGyCwL9a2ayBnjVzTcrYUPYG2etDWMAiL0aRWL
	 jTs+0t0+Smln4ZesJM+wOcipu3mry1SNTySyPcweYWXTUGfSGAN6ZhDXoMR9hmDGOr
	 QY4A75vvLhdPqE8sAQBwF0hGztFd6xmxFXPCETYGV0NkHSMyFImHsk+UE3HwHcsILM
	 m3n5RC22Qr7FNWU29Yz27Pjd4qCXLnvmzVIxWeHBmDBgFznYT5ULnma+gX2hXgvkqD
	 Pkt1GiBg3L+M35x4Ykzc2LNjEvNiVO5IYx/2I5zepRAH7kLh/RP3O1hun6N0bw53tt
	 scMYT8epTmESA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:04 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:03 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>
Subject: [PATCH 10/25] ASoC: meson: t9015: prepare to adding new platforms
Date: Fri, 15 Mar 2024 02:21:46 +0300
Message-ID: <20240314232201.2102178-11-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from}, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_162319_609665_7F838B1C 
X-CRM114-Status: GOOD (  20.66  )
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

Move platform specific code to make the reading of upcoming commit
easier.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 sound/soc/meson/t9015.c | 71 ++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 571f65788c59..48f6767bd858 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -51,6 +51,12 @@ struct t9015 {
 	struct regulator *avdd;
 };
 
+struct t9015_match_data {
+	const struct snd_soc_component_driver *component_drv;
+	struct snd_soc_dai_driver *dai_drv;
+	unsigned int max_register;
+};
+
 static int t9015_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
@@ -112,6 +118,11 @@ static SOC_ENUM_SINGLE_DECL(dacl_in_enum, BLOCK_EN, DACL_SRC, dacl_in_txt);
 static const char * const mono_txt[] = { "Stereo", "Mono"};
 static SOC_ENUM_SINGLE_DECL(mono_enum, VOL_CTRL1, DAC_MONO, mono_txt);
 
+static const struct snd_kcontrol_new t9015_right_dac_mux =
+	SOC_DAPM_ENUM("Right DAC Source", dacr_in_enum);
+static const struct snd_kcontrol_new t9015_left_dac_mux =
+	SOC_DAPM_ENUM("Left DAC Source", dacl_in_enum);
+
 static const struct snd_kcontrol_new t9015_snd_controls[] = {
 	/* Volume Controls */
 	SOC_ENUM("Playback Channel Mode", mono_enum),
@@ -126,11 +137,6 @@ static const struct snd_kcontrol_new t9015_snd_controls[] = {
 	SOC_SINGLE("Unmute Ramp Switch", VOL_CTRL1, UNMUTE_MODE, 1, 0),
 };
 
-static const struct snd_kcontrol_new t9015_right_dac_mux =
-	SOC_DAPM_ENUM("Right DAC Source", dacr_in_enum);
-static const struct snd_kcontrol_new t9015_left_dac_mux =
-	SOC_DAPM_ENUM("Left DAC Source", dacl_in_enum);
-
 static const struct snd_soc_dapm_widget t9015_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("Right IN", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("Left IN", NULL, 0, SND_SOC_NOPM, 0, 0),
@@ -223,7 +229,20 @@ static int t9015_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static int t9015_component_probe(struct snd_soc_component *component)
+{
+	/*
+	 * Initialize output polarity:
+	 * ATM the output polarity is fixed but in the future it might useful
+	 * to add DT property to set this depending on the platform needs
+	 */
+	snd_soc_component_write(component, LINEOUT_CFG, 0x1111);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver t9015_codec_driver = {
+	.probe			= t9015_component_probe,
 	.set_bias_level		= t9015_set_bias_level,
 	.controls		= t9015_snd_controls,
 	.num_controls		= ARRAY_SIZE(t9015_snd_controls),
@@ -235,22 +254,25 @@ static const struct snd_soc_component_driver t9015_codec_driver = {
 	.endianness		= 1,
 };
 
-static const struct regmap_config t9015_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= POWER_CFG,
-};
-
 static int t9015_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct t9015_match_data *data;
 	struct t9015 *priv;
 	void __iomem *regs;
+	struct regmap_config config = {
+		.reg_bits = 32,
+		.reg_stride = 4,
+		.val_bits = 32,
+	};
 	struct regmap *regmap;
 	struct clk *pclk;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		dev_err_probe(dev, -ENODEV, "failed to match device\n");
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -276,25 +298,28 @@ static int t9015_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 	}
 
-	regmap = devm_regmap_init_mmio(dev, regs, &t9015_regmap_config);
+	config.max_register = data->max_register;
+	regmap = devm_regmap_init_mmio(dev, regs, &config);
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "regmap init failed\n");
 		return PTR_ERR(regmap);
 	}
 
-	/*
-	 * Initialize output polarity:
-	 * ATM the output polarity is fixed but in the future it might useful
-	 * to add DT property to set this depending on the platform needs
-	 */
-	regmap_write(regmap, LINEOUT_CFG, 0x1111);
-
-	return devm_snd_soc_register_component(dev, &t9015_codec_driver,
-					       &t9015_dai, 1);
+	return devm_snd_soc_register_component(dev, data->component_drv,
+					       data->dai_drv, 1);
 }
 
+static const struct t9015_match_data t9015_match_data = {
+	.component_drv = &t9015_codec_driver,
+	.dai_drv = &t9015_dai,
+	.max_register = POWER_CFG,
+};
+
 static const struct of_device_id t9015_ids[] __maybe_unused = {
-	{ .compatible = "amlogic,t9015", },
+	{
+		.compatible = "amlogic,t9015",
+		.data = &t9015_match_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, t9015_ids);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
