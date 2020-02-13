Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04275C2BA83
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F21217F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MP3K8dDD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qgh7smu+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3F21217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eM5A651icqVHPNXdJI7J4EinNXHwtSBNoO855OyGFOU=; b=MP3K8dDDCvxZtQ
	7u3M6J9MMETdz+m+H9MLt/7Bc+BJAl02GJQzykG0fk63z8SDRiKhVl+gObgnR98+zO33PKXVskFQG
	MWBHv8jps63lL7N5iKFlUClxFQbHPF9hToCYzyjjNw4301qe5WYJjw5NrrjY5GUC8CdySfznIRgWl
	sNiqoDdGIsP1ZzLVWCuXQ2+BFQAoDcz/V2+YozfF6QHmhYqe0FVQZgwI0pJpujmqK42tK0aEKuINA
	RxTfBglV8UGBS3MHRfElTTduJAez8VUzwgDw0oiGXWPlTwZqgMtFncvm674wYO4SKJ9BvZ2NTkJxM
	zQc/8c4aEqyJj1/uS2nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Gms-0000ns-1P; Thu, 13 Feb 2020 15:52:22 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Gmk-0000eq-3u
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 15:52:16 +0000
Received: by mail-wr1-x442.google.com with SMTP id y17so7293892wrh.5
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2020 07:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ad7UP5GkRuyRzx3mOlQeziETnaIJrw5CaQcjZBxduWE=;
 b=qgh7smu+CPrPyBfPqkNBQ6RRiMp310lxB65DDrR+87rYr+QWAWV4yRiZ6fIzwtnFkK
 k/rDfoouplgFUD4mJ0HcJ5u3qMgPPFoQM9AMGNk7x+txvUytEntW2+R4U4nLZ882wL8l
 qYWosTFaSdasJ1nuxMXy3FGpc7cR9mE7AgP2Fhj2/J5/cc2ixdofzOfdPB362rYTg0yj
 Cgilp9KjSR+/NSPge2Op0Ic4pg2tQTKIUZF9D3XO0yzFwy2kNXvTNh9xn1dUYQ0LY6fd
 297wR/oM2vogCUCxS0Dyf+nM3EPk0V0ti1b3ueXjk+7Mi/SvZcmfRFReEZdezo97im5i
 pWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ad7UP5GkRuyRzx3mOlQeziETnaIJrw5CaQcjZBxduWE=;
 b=CU9WKHd2tp5bJ85ffREB1SpD+hr06+MQrakRVo2tq4GvEQB09Mp2JmWHTGEzhwMWWs
 1W5n9JYRGMARZC36XWn9ifOE60MOigIVOtJARfKzmyZRKnHyXREKXrs+78BRaZFj3NlH
 qjSrQXJJ+1jw9Ce+0hitzrnMz31T0erTqGcG5HdAEk14JO0+qnfN543cGWAZwxNhxMCk
 59+QpFKDwY8bxeu3IafvGoFMhl3tqvgeUhgvU9ItOo3wPq5czA/A+lc8th3WEFzK/FuJ
 T3LxVEorxEtdytVs1a3lWjWxJp2+IHNnCAjyS9EAs5yduioHLxrdqQ2MkNLJyeYlxfIz
 HlAg==
X-Gm-Message-State: APjAAAVMIR5pwC8j7PAFS30mkt9csxWhxGWeTS1H8pw/0cbQcbbU5ll8
 00sNSfMdSEq7OEbqzdfnefBG/g==
X-Google-Smtp-Source: APXvYqzHx5OuMae50LV2pfP3FZjaSow8+3J6VxETyg+AXMtrDdomw5migEXzukeyNq0B55OWaFY73A==
X-Received: by 2002:a05:6000:124b:: with SMTP id
 j11mr20695090wrx.285.1581609132857; 
 Thu, 13 Feb 2020 07:52:12 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:12 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 5/9] ASoC: meson: aiu: add hdmi codec control support
Date: Thu, 13 Feb 2020 16:51:55 +0100
Message-Id: <20200213155159.3235792-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_075214_212970_527E1095 
X-CRM114-Status: GOOD (  17.71  )
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

Add the codec to codec component which handles the routing between
the audio producers (PCM and I2S) and the synopsys hdmi controller
on the amlogic GX SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig          |   2 +
 sound/soc/meson/Makefile         |   1 +
 sound/soc/meson/aiu-codec-ctrl.c | 152 +++++++++++++++++++++++++++++++
 sound/soc/meson/aiu.c            |  34 ++++++-
 sound/soc/meson/aiu.h            |   8 ++
 5 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/meson/aiu-codec-ctrl.c

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index ca269dedfc7f..19de97ae4ce9 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -4,7 +4,9 @@ menu "ASoC support for Amlogic platforms"
 
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
+	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
+	imply SND_SOC_HDMI_CODEC if DRM_MESON_DW_HDMI
 	help
 	  Select Y or M to add support for the Audio output subsystem found
 	  in the Amlogic GX SoC family
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index a7b79d717288..3b21f648e322 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 snd-soc-meson-aiu-objs := aiu.o
+snd-soc-meson-aiu-objs += aiu-codec-ctrl.o
 snd-soc-meson-aiu-objs += aiu-encoder-i2s.o
 snd-soc-meson-aiu-objs += aiu-encoder-spdif.o
 snd-soc-meson-aiu-objs += aiu-fifo.o
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
new file mode 100644
index 000000000000..8646a953e3b3
--- /dev/null
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include <dt-bindings/sound/meson-aiu.h>
+#include "aiu.h"
+#include "meson-codec-glue.h"
+
+#define CTRL_CLK_SEL		GENMASK(1, 0)
+#define CTRL_DATA_SEL_SHIFT	4
+#define CTRL_DATA_SEL		(0x3 << CTRL_DATA_SEL_SHIFT)
+
+static const char * const aiu_codec_ctrl_mux_texts[] = {
+	"DISABLED", "PCM", "I2S",
+};
+
+static int aiu_codec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int mux, changed;
+
+	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
+	changed = snd_soc_component_test_bits(component, e->reg,
+					      CTRL_DATA_SEL,
+					      FIELD_PREP(CTRL_DATA_SEL, mux));
+
+	if (!changed)
+		return 0;
+
+	/* Force disconnect of the mux while updating */
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+
+	/* Reset the source first */
+	snd_soc_component_update_bits(component, e->reg,
+				      CTRL_CLK_SEL |
+				      CTRL_DATA_SEL,
+				      FIELD_PREP(CTRL_CLK_SEL, 0) |
+				      FIELD_PREP(CTRL_DATA_SEL, 0));
+
+	/* Set the appropriate source */
+	snd_soc_component_update_bits(component, e->reg,
+				      CTRL_CLK_SEL |
+				      CTRL_DATA_SEL,
+				      FIELD_PREP(CTRL_CLK_SEL, mux) |
+				      FIELD_PREP(CTRL_DATA_SEL, mux));
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+
+	return 0;
+}
+
+static SOC_ENUM_SINGLE_DECL(aiu_hdmi_ctrl_mux_enum, AIU_HDMI_CLK_DATA_CTRL,
+			    CTRL_DATA_SEL_SHIFT,
+			    aiu_codec_ctrl_mux_texts);
+
+static const struct snd_kcontrol_new aiu_hdmi_ctrl_mux =
+	SOC_DAPM_ENUM_EXT("HDMI Source", aiu_hdmi_ctrl_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  aiu_codec_ctrl_mux_put_enum);
+
+static const struct snd_soc_dapm_widget aiu_hdmi_ctrl_widgets[] = {
+	SND_SOC_DAPM_MUX("HDMI CTRL SRC", SND_SOC_NOPM, 0, 0,
+			 &aiu_hdmi_ctrl_mux),
+};
+
+static const struct snd_soc_dai_ops aiu_codec_ctrl_input_ops = {
+	.hw_params	= meson_codec_glue_input_hw_params,
+	.set_fmt	= meson_codec_glue_input_set_fmt,
+};
+
+static const struct snd_soc_dai_ops aiu_codec_ctrl_output_ops = {
+	.startup	= meson_codec_glue_output_startup,
+};
+
+#define AIU_CODEC_CTRL_FORMATS					\
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |	\
+	 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |	\
+	 SNDRV_PCM_FMTBIT_S32_LE)
+
+#define AIU_CODEC_CTRL_STREAM(xname, xsuffix)			\
+{								\
+	.stream_name	= xname " " xsuffix,			\
+	.channels_min	= 1,					\
+	.channels_max	= 8,					\
+	.rate_min       = 5512,					\
+	.rate_max	= 192000,				\
+	.formats	= AIU_CODEC_CTRL_FORMATS,		\
+}
+
+#define AIU_CODEC_CTRL_INPUT(xname) {				\
+	.name = "CODEC CTRL " xname,				\
+	.playback = AIU_CODEC_CTRL_STREAM(xname, "Playback"),	\
+	.ops = &aiu_codec_ctrl_input_ops,			\
+	.probe = meson_codec_glue_input_dai_probe,		\
+	.remove = meson_codec_glue_input_dai_remove,		\
+}
+
+#define AIU_CODEC_CTRL_OUTPUT(xname) {				\
+	.name = "CODEC CTRL " xname,				\
+	.capture = AIU_CODEC_CTRL_STREAM(xname, "Capture"),	\
+	.ops = &aiu_codec_ctrl_output_ops,			\
+}
+
+static struct snd_soc_dai_driver aiu_hdmi_ctrl_dai_drv[] = {
+	[CTRL_I2S] = AIU_CODEC_CTRL_INPUT("HDMI I2S IN"),
+	[CTRL_PCM] = AIU_CODEC_CTRL_INPUT("HDMI PCM IN"),
+	[CTRL_OUT] = AIU_CODEC_CTRL_OUTPUT("HDMI OUT"),
+};
+
+static const struct snd_soc_dapm_route aiu_hdmi_ctrl_routes[] = {
+	{ "HDMI CTRL SRC", "I2S", "HDMI I2S IN Playback" },
+	{ "HDMI CTRL SRC", "PCM", "HDMI PCM IN Playback" },
+	{ "HDMI OUT Capture", NULL, "HDMI CTRL SRC" },
+};
+
+static int aiu_hdmi_of_xlate_dai_name(struct snd_soc_component *component,
+				      struct of_phandle_args *args,
+				      const char **dai_name)
+{
+	return aiu_of_xlate_dai_name(component, args, dai_name, AIU_HDMI);
+}
+
+static const struct snd_soc_component_driver aiu_hdmi_ctrl_component = {
+	.name			= "AIU HDMI Codec Control",
+	.dapm_widgets		= aiu_hdmi_ctrl_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(aiu_hdmi_ctrl_widgets),
+	.dapm_routes		= aiu_hdmi_ctrl_routes,
+	.num_dapm_routes	= ARRAY_SIZE(aiu_hdmi_ctrl_routes),
+	.of_xlate_dai_name	= aiu_hdmi_of_xlate_dai_name,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+int aiu_hdmi_ctrl_register_component(struct device *dev)
+{
+	return aiu_add_component(dev, &aiu_hdmi_ctrl_component,
+				 aiu_hdmi_ctrl_dai_drv,
+				 ARRAY_SIZE(aiu_hdmi_ctrl_dai_drv),
+				 "hdmi");
+}
+
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index a62aced9b687..b765dfb70726 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -71,6 +71,26 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 	return 0;
 }
 
+int aiu_add_component(struct device *dev,
+		      const struct snd_soc_component_driver *component_driver,
+		      struct snd_soc_dai_driver *dai_drv,
+		      int num_dai,
+		      const char *debugfs_prefix)
+{
+	struct snd_soc_component *component;
+
+	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return -ENOMEM;
+
+#ifdef CONFIG_DEBUG_FS
+	component->debugfs_prefix = debugfs_prefix;
+#endif
+
+	return snd_soc_add_component(dev, component, component_driver,
+				     dai_drv, num_dai);
+}
+
 static int aiu_cpu_of_xlate_dai_name(struct snd_soc_component *component,
 				     struct of_phandle_args *args,
 				     const char **dai_name)
@@ -313,9 +333,21 @@ static int aiu_probe(struct platform_device *pdev)
 	ret = snd_soc_register_component(dev, &aiu_cpu_component,
 					 aiu_cpu_dai_drv,
 					 ARRAY_SIZE(aiu_cpu_dai_drv));
-	if (ret)
+	if (ret) {
 		dev_err(dev, "Failed to register cpu component\n");
+		return ret;
+	}
 
+	/* Register the hdmi codec control component */
+	ret = aiu_hdmi_ctrl_register_component(dev);
+	if (ret) {
+		dev_err(dev, "Failed to register hdmi control component\n");
+		goto err;
+	}
+
+	return 0;
+err:
+	snd_soc_unregister_component(dev);
 	return ret;
 }
 
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index a3488027b9d5..9242ab1ab64b 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -45,6 +45,14 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 			  const char **dai_name,
 			  unsigned int component_id);
 
+int aiu_add_component(struct device *dev,
+		      const struct snd_soc_component_driver *component_driver,
+		      struct snd_soc_dai_driver *dai_drv,
+		      int num_dai,
+		      const char *debugfs_prefix);
+
+int aiu_hdmi_ctrl_register_component(struct device *dev);
+
 int aiu_fifo_i2s_dai_probe(struct snd_soc_dai *dai);
 int aiu_fifo_spdif_dai_probe(struct snd_soc_dai *dai);
 
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
