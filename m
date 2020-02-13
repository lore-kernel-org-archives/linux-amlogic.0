Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CF2C2BA83
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C63B217F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lwt0Yxyx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OcbaJySh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C63B217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmd9yMfrB/wZUf4QDAfIhLeCYrTY1uBVk6Yr1SbD6IY=; b=Lwt0YxyxcquRmk
	yZ+2dQaPxrIw9/kQsEVK08a3yyDaMX3rRoUP5RMCyFFj3HmNi4bEVV8M0S7rtQRKCsQ46DvOdQp0N
	KsiBnpNbbibl/oG+JfjKSUISmWt+J1210JjJuRY8li2/BkwcGiwnVXL9UVqk9bCSU0tKNchoyDxt9
	GdCn1KTc/yAJTSHPw+cThPgVguWbJgX3R6mLaMyvH5SA8gWTWG5uI31mpZeLteNOFaH6CeEtBwtOL
	8i/fAuf0v+VnUlt3sCks1whv1gEG5ihyEVrEL/Md1BFQHAapbAybMCbcpTQoX8VjSs6DZkGl431bf
	odZABxD7l9GwdWsDUrqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Gn0-00014r-LQ; Thu, 13 Feb 2020 15:52:30 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Gmo-0000jF-9A
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 15:52:20 +0000
Received: by mail-wm1-x342.google.com with SMTP id a9so7313899wmj.3
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2020 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tveyt6J2X+uabgEQ/mj5bAqqccazTsWZH5vIdnttJSg=;
 b=OcbaJyShdx1CRYbEg0P7r6/7tU4ttgaXvOw6dIVStzuNDwuKZO9sZNgWdCK71k8pFE
 b5WfunilEzaZF/54lgN1xTSDCi8dtm+WwiyEoWeHJHdRbKu65sCJehSgDxSqLMjvjIlW
 yX4Kb7FqQFH/cos/EMvelQGbB1mLmMkYqpS6OhqmmuPN0Z8Gp+qcUKe1i0bEKveAIsJH
 Tn4kkGKR82GtzFUa5hRT5YyorS9UTW3iFMnyNpPKh04AdbXI9l7uGBrm917etxPjNnMP
 SrcIGXWJ6tWyHuSv7aCiQSbNuq+b9jHF0ozI3VdqXAbEAq8WkGyb1R7X62iKuS6GDHwG
 6NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tveyt6J2X+uabgEQ/mj5bAqqccazTsWZH5vIdnttJSg=;
 b=TTM1TwZIfIrnV+e6MuTztE94uiN3JZdeQvaXmmfs3qaPfEmER6V5HlRxJ/Vsvie9Fb
 14sg1BacYfsPqwdWXNQfnCUA7xVjcR44jiwkbU25nJRTDt+4ZFyv5NCertj4r9Ha5mGs
 NCcne8XxEV9FyaAytS9GQxSv9IkUc2qWwpaI/mCd1/Cg1E6MkudzxF1qeDEmu/MhWj14
 E/vjBzNznMJtnf6478T0mPJJlh5E39i++4DeFWPV8Lefn2QgHPjJMuvMlI17lSvCA8fr
 xcQucQSQ/3cmpf1yCAj+wUFUufCABE7UILRHS9xe5vDs0M2c+ucFRnL7jniB2hyD6rce
 QJoQ==
X-Gm-Message-State: APjAAAWTA36e7/qIUcCQFDzSoM4XAzdyLvKU7Cdgby0EKoobfqEWjuOo
 RQikcwf2tLtSe/BBpnLJUCbY/Q==
X-Google-Smtp-Source: APXvYqwA041IWnaiiF8p6WaNGCtAIMpLGWSuvS9KZogSxJnR7PyvLosI31gLD3ccOvYkV2nUj2AC7g==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr6783621wmi.118.1581609136778; 
 Thu, 13 Feb 2020 07:52:16 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 9/9] ASoC: meson: gx: add sound card support
Date: Thu, 13 Feb 2020 16:51:59 +0100
Message-Id: <20200213155159.3235792-10-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_075218_341071_E1174723 
X-CRM114-Status: GOOD (  14.98  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the sound card used on the amlogic GX SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig   |   7 ++
 sound/soc/meson/Makefile  |   2 +
 sound/soc/meson/gx-card.c | 141 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 sound/soc/meson/gx-card.c

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 347fa78e309a..22d2af75b59e 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -101,6 +101,13 @@ config SND_MESON_CARD_UTILS
 config SND_MESON_CODEC_GLUE
 	tristate
 
+config SND_MESON_GX_SOUND_CARD
+	tristate "Amlogic GX Sound Card Support"
+	select SND_MESON_CARD_UTILS
+	imply SND_MESON_AIU
+	help
+	  Select Y or M to add support for the GXBB/GXL SoC sound card
+
 config SND_MESON_G12A_TOHDMITX
 	tristate "Amlogic G12A To HDMI TX Control Support"
 	select REGMAP_MMIO
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index bef2b72fd7a7..f9c90c391498 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -21,6 +21,7 @@ snd-soc-meson-axg-spdifout-objs := axg-spdifout.o
 snd-soc-meson-axg-pdm-objs := axg-pdm.o
 snd-soc-meson-card-utils-objs := meson-card-utils.o
 snd-soc-meson-codec-glue-objs := meson-codec-glue.o
+snd-soc-meson-gx-sound-card-objs := gx-card.o
 snd-soc-meson-g12a-tohdmitx-objs := g12a-tohdmitx.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
@@ -37,4 +38,5 @@ obj-$(CONFIG_SND_MESON_AXG_SPDIFOUT) += snd-soc-meson-axg-spdifout.o
 obj-$(CONFIG_SND_MESON_AXG_PDM) += snd-soc-meson-axg-pdm.o
 obj-$(CONFIG_SND_MESON_CARD_UTILS) += snd-soc-meson-card-utils.o
 obj-$(CONFIG_SND_MESON_CODEC_GLUE) += snd-soc-meson-codec-glue.o
+obj-$(CONFIG_SND_MESON_GX_SOUND_CARD) += snd-soc-meson-gx-sound-card.o
 obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += snd-soc-meson-g12a-tohdmitx.o
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
new file mode 100644
index 000000000000..7b01dcb73e5e
--- /dev/null
+++ b/sound/soc/meson/gx-card.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright (c) 2020 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "meson-card.h"
+
+struct gx_dai_link_i2s_data {
+	unsigned int mclk_fs;
+};
+
+/*
+ * Base params for the codec to codec links
+ * Those will be over-written by the CPU side of the link
+ */
+static const struct snd_soc_pcm_stream codec_params = {
+	.formats = SNDRV_PCM_FMTBIT_S24_LE,
+	.rate_min = 5525,
+	.rate_max = 192000,
+	.channels_min = 1,
+	.channels_max = 8,
+};
+
+static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct gx_dai_link_i2s_data *be =
+		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
+
+	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
+}
+
+static const struct snd_soc_ops gx_card_i2s_be_ops = {
+	.hw_params = gx_card_i2s_be_hw_params,
+};
+
+static int gx_card_parse_i2s(struct snd_soc_card *card,
+			     struct device_node *node,
+			     int *index)
+{
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai_link *link = &card->dai_link[*index];
+	struct gx_dai_link_i2s_data *be;
+
+	/* Allocate i2s link parameters */
+	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
+	if (!be)
+		return -ENOMEM;
+	priv->link_data[*index] = be;
+
+	/* Setup i2s link */
+	link->ops = &gx_card_i2s_be_ops;
+	link->dai_fmt = meson_card_parse_daifmt(node, link->cpus->of_node);
+
+	of_property_read_u32(node, "mclk-fs", &be->mclk_fs);
+
+	return 0;
+}
+
+static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
+				char *match)
+{
+	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
+		if (strstr(c->dai_name, match))
+			return 1;
+	}
+
+	/* dai not matched */
+	return 0;
+}
+
+static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
+			    int *index)
+{
+	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
+	struct snd_soc_dai_link_component *cpu;
+	int ret;
+
+	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
+	if (!cpu)
+		return -ENOMEM;
+
+	dai_link->cpus = cpu;
+	dai_link->num_cpus = 1;
+
+	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
+				   &dai_link->cpus->dai_name);
+	if (ret)
+		return ret;
+
+	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
+		ret = meson_card_set_fe_link(card, dai_link, np, true);
+	else
+		ret = meson_card_set_be_link(card, dai_link, np);
+
+	if (ret)
+		return ret;
+
+	/* Check if the cpu is the i2s encoder and parse i2s data */
+	if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		ret = gx_card_parse_i2s(card, np, index);
+
+	/* Or apply codec to codec params if necessary */
+	else if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL"))
+		dai_link->params = &codec_params;
+
+	return ret;
+}
+
+static const struct meson_card_match_data gx_card_match_data = {
+	.add_link = gx_card_add_link,
+};
+
+static const struct of_device_id gx_card_of_match[] = {
+	{
+		.compatible = "amlogic,gx-sound-card",
+		.data = &gx_card_match_data,
+	}, {}
+};
+MODULE_DEVICE_TABLE(of, gx_card_of_match);
+
+static struct platform_driver gx_card_pdrv = {
+	.probe = meson_card_probe,
+	.remove = meson_card_remove,
+	.driver = {
+		.name = "gx-sound-card",
+		.of_match_table = gx_card_of_match,
+	},
+};
+module_platform_driver(gx_card_pdrv);
+
+MODULE_DESCRIPTION("Amlogic GX ALSA machine driver");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
