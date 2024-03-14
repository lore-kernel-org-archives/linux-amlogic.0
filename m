Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00A2C54E5D
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 23:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDwrEZlPqaeDy/OYwf0AilYAvpPyL1XAbShWJov6rZg=; b=KGWqeK4OMwnCgH
	KzgJnI4fZl2ZIMJxDnII44vhMHLcjWyxFT4j+q80zckjsX7E+h5yDHK8ZfGDC4dAPf40xmkj+okhX
	FRchGBp7AdxaF6WqPZg7LPMzxCwZnJ+DMiye0wsa9hgCmDbRSuH4aMY9Q/jizU6I/CbxnTRzhoFnM
	biizFDnnaM3QPvoX/9DPlsyFtSI5M9RNI4JJSnnDm2dBIt6VfuieASAL4y7ZiKIxB5u4or38HGdxQ
	haDvY28EiH8mG6ZpOR/Y72zEktvPaU1BE5C3kyCkEqP+BSUyG785Wz7uz1tJdgQD7HZjVVuqxpVKA
	T4OSrZt6/8ehPC8wV6Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuRB-0000000FyZe-2PZ4;
	Thu, 14 Mar 2024 23:24:37 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuPu-0000000Fxhw-4Bhm;
	Thu, 14 Mar 2024 23:23:21 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9E315100016;
	Fri, 15 Mar 2024 02:23:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9E315100016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458585;
	bh=V+vdRcALSbTUGDcgP2YFpiUK4bL8vNQx31BjTGtvoQs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=jJzF+8WIvZ6FNhovzxBDvIydD2hZBQ81dr6xTs0quRU/a8qXKLjYh6mUHjPhQ7pv5
	 F8kURAHZ7RS6f3EJA6Z0sJ/lpAPuXEiGYpjsgH7njsvZbpJSfR+9xUN7B3H28d/aH3
	 OYC3M35dtS+dpV+tAEl7RjJUgPkMeSYiA+vzJ2TCa2mD/OJnT0ZmxnXGgDKwPt+V31
	 N0uSSPDdVn5dfzwpXMiACnFwKUDtYc3xl+tJPDXCWpNfOgQuwdiHXDTitW35bYEZ8l
	 409gv/tCzlVoLd7A/0hoW7m6B8aIwKWUizIzKyaK+LzSpS0FxvbRjHceKd3gE1r5ID
	 ROjOQ7+k/SSKA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:05 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:05 +0300
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
Subject: [PATCH 14/25] ASoC: meson: axg-pdm: introduce 'sysrate' property
Date: Fri, 15 Mar 2024 02:21:50 +0300
Message-ID: <20240314232201.2102178-15-jan.dakinevich@salutedevices.com>
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
X-CRM114-CacheID: sfid-20240314_162319_629773_29B3B141 
X-CRM114-Status: GOOD (  16.31  )
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

This driver unconditionally set the rate of DSP system clock to 250MHz,
that on A1 SoC family causes reconfiguring of 'hifi_pll' clock to some
rate, that is multiple to 250MHz.

Further, when playback is activating 'hifi_pll' would be reconfigured
to another rate to produce audio clock like 12288000Hz. Both these rates
can't coexist on same parent.

To avoid the fight for 'hifi_pll' clock allow PDM controller to
configure its maximum sysrate through device tree. It will allow to
inherit 'sysclk' from another clock (i.e. 'fclk_div2') and isolate
'hifi_pll' from PDM influence.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 sound/soc/meson/axg-pdm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/axg-pdm.c b/sound/soc/meson/axg-pdm.c
index d59050914d3c..a132444a51fb 100644
--- a/sound/soc/meson/axg-pdm.c
+++ b/sound/soc/meson/axg-pdm.c
@@ -94,6 +94,7 @@ struct axg_pdm {
 	struct clk *dclk;
 	struct clk *sysclk;
 	struct clk *pclk;
+	u32 sys_rate;
 };
 
 static void axg_pdm_enable(struct regmap *map)
@@ -172,10 +173,10 @@ static int axg_pdm_set_sysclk(struct axg_pdm *priv, unsigned int os,
 	 * the requested sample rate. In this case, the sample pointer
 	 * counter could overflow so set a lower system clock rate
 	 */
-	if (sys_rate < priv->cfg->sys_rate)
+	if (sys_rate < priv->sys_rate)
 		return clk_set_rate(priv->sysclk, sys_rate);
 
-	return clk_set_rate(priv->sysclk, priv->cfg->sys_rate);
+	return clk_set_rate(priv->sysclk, priv->sys_rate);
 }
 
 static int axg_pdm_set_sample_pointer(struct axg_pdm *priv)
@@ -386,7 +387,7 @@ static int axg_pdm_dai_probe(struct snd_soc_dai *dai)
 	 * sysclk must be set and enabled as well to access the pdm registers
 	 * Accessing the register w/o it will give a bus error.
 	 */
-	ret = clk_set_rate(priv->sysclk, priv->cfg->sys_rate);
+	ret = clk_set_rate(priv->sysclk, priv->sys_rate);
 	if (ret) {
 		dev_err(dai->dev, "setting sysclk failed\n");
 		goto err_pclk;
@@ -623,6 +624,9 @@ static int axg_pdm_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->sysclk))
 		return dev_err_probe(dev, PTR_ERR(priv->sysclk), "failed to get dclk\n");
 
+	if (device_property_read_u32(dev, "sysrate", &priv->sys_rate))
+		priv->sys_rate = priv->cfg->sys_rate;
+
 	return devm_snd_soc_register_component(dev, &axg_pdm_component_drv,
 					       &axg_pdm_dai_drv, 1);
 }
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
