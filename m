Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC90C4741C
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AED3B217F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 15:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kc2bOXgw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PgdbC3nF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AED3B217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwHM/n69P2ren+ABcrpxCbPEg3A2C0c8vPGVSgxSe4E=; b=Kc2bOXgwTadxap
	pPAqHMDdWtpwoWmGHYzljc6xZJaxeAdZPc5hjbKPOFCLLRhpRlYMz2o2odBC14ICqqpZrPmpCv0t+
	yhr6ohzerHIDOh7NYX9Iz7i/hDwFvkeFLGcQZxOTLgf+8WZBIta/cDhZ72ieNUlX4jzarQnW/ovby
	xo9pKwkjQxFY3ynchIu+B/08nRwci7Gh5IGFXNyWojr1gW0ZhUuVSKAQnlCo0y+ZGxbUSgggvQ9zq
	3OFAhwrmh7EWJq1SPhOaW5xUOBe341jva1oCsIglkTpu0GNXv8KEpKxKEM+l8Ig4+jLJje5t4DubY
	8/JL6LkpKNh6a3K6kkKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Gml-0000hL-Sp; Thu, 13 Feb 2020 15:52:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Gmi-0000dU-KS
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 15:52:14 +0000
Received: by mail-wm1-x344.google.com with SMTP id b17so7334450wmb.0
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2020 07:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kz83rwM7wmIisHs5YaSTbeuhE26BFhOcdChWZLO5MoQ=;
 b=PgdbC3nFGCcsgkml75r2M0c9TqvvI0vbQkKTQB19Lyz+cbGPhn+zVh8kybj7lcOhKT
 QSkTfaLGIizi7H64jGxfs7EfLqp1d8WL5wGDboTMt+u1KeGfINbg0SOPQpqMR66l/NGo
 LMEzqiFJXuI4NAuqedXtrwA63zrHsXRldlprdlvRc7gGScc6VPZ7DD4INkdr4RC6B0eA
 ihbD6tvd0JiHohjkLI2ACoDqsbgn3hBYTDQ0jGTYzFFUiBWsx9b2894yIGkzGm8OPsuS
 4i+lX91aTuE28escSWS6/ckV4TK2yPfmKZ8N6Ip0iMJTfn6PV0mk1TH3W3mJ1eV834Vr
 Hvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kz83rwM7wmIisHs5YaSTbeuhE26BFhOcdChWZLO5MoQ=;
 b=ZcbTood0MNetwn5OmAyAcEiY7uIjk5QAiYpfpXYOTNNtgBDq7LdEjAWCtBhdiUjDMT
 IP4bncyW5IxKFuFKnGkyxiwTvnl/GdBqXDSOfJbPCbibuK59eHoyV7PVVnqGpaMKYxC5
 j2W7vKGe04mzlXEX3iFu+3x+fFsMLfDV8hnfUGVm0CW/nlgiC3iK/V4RLQKcVabu2kB9
 Uk+kLTI1At/Vyvsm+Mr5Ul1IA8HUTfnQ9OmvMqncRVBxhPtXlezbM/KyEzRJbNOa8FuP
 +xuTcVtGT/2Vif8qtrVK2EM+Cg8LtSkXP9IduuCeCygNNAaCMxa5bjgq2eiBgVeVZfFJ
 y9Cw==
X-Gm-Message-State: APjAAAVgr2lZ+O8nHcMAxh9xDYenkjWCoy3+ltR1qs3Djqvx9HQNeqYu
 gEPbUZCUBMvEq12ErnaeLg3isw==
X-Google-Smtp-Source: APXvYqzEMEuudLr3azhK1KG9oNVa9/iH6V9Aa+4Hj+KKTng0BZ8d0hnolhAwoL7MOO5TotsCTF9Zcg==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr6324883wmi.14.1581609129642;
 Thu, 13 Feb 2020 07:52:09 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:09 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/9] ASoC: meson: g12a: extract codec-to-codec utils
Date: Thu, 13 Feb 2020 16:51:52 +0100
Message-Id: <20200213155159.3235792-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_075212_675056_5F181846 
X-CRM114-Status: GOOD (  19.62  )
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

The hdmi routing mechanism used on g12a hdmi is also used:
* other Amlogic SoC types
* for the internal DAC path

Each of these codec glues are slightly different but the idea
behind it remains the same. This change extract some helper functions
from the g12a-tohdmitx driver to make them available for other Amlogic
codecs.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig            |   4 +
 sound/soc/meson/Makefile           |   2 +
 sound/soc/meson/g12a-tohdmitx.c    | 219 ++++++-----------------------
 sound/soc/meson/meson-codec-glue.c | 149 ++++++++++++++++++++
 sound/soc/meson/meson-codec-glue.h |  32 +++++
 5 files changed, 230 insertions(+), 176 deletions(-)
 create mode 100644 sound/soc/meson/meson-codec-glue.c
 create mode 100644 sound/soc/meson/meson-codec-glue.h

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 2e3676147cea..ee6d53949d45 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,9 +85,13 @@ config SND_MESON_AXG_PDM
 	  Select Y or M to add support for PDM input embedded
 	  in the Amlogic AXG SoC family
 
+config SND_MESON_CODEC_GLUE
+	tristate
+
 config SND_MESON_G12A_TOHDMITX
 	tristate "Amlogic G12A To HDMI TX Control Support"
 	select REGMAP_MMIO
+	select SND_MESON_CODEC_GLUE
 	imply SND_SOC_HDMI_CODEC
 	help
 	  Select Y or M to add support for HDMI audio on the g12a SoC
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 1a8b1470ed84..529a807b3f37 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -11,6 +11,7 @@ snd-soc-meson-axg-sound-card-objs := axg-card.o
 snd-soc-meson-axg-spdifin-objs := axg-spdifin.o
 snd-soc-meson-axg-spdifout-objs := axg-spdifout.o
 snd-soc-meson-axg-pdm-objs := axg-pdm.o
+snd-soc-meson-codec-glue-objs := meson-codec-glue.o
 snd-soc-meson-g12a-tohdmitx-objs := g12a-tohdmitx.o
 
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
@@ -24,4 +25,5 @@ obj-$(CONFIG_SND_MESON_AXG_SOUND_CARD) += snd-soc-meson-axg-sound-card.o
 obj-$(CONFIG_SND_MESON_AXG_SPDIFIN) += snd-soc-meson-axg-spdifin.o
 obj-$(CONFIG_SND_MESON_AXG_SPDIFOUT) += snd-soc-meson-axg-spdifout.o
 obj-$(CONFIG_SND_MESON_AXG_PDM) += snd-soc-meson-axg-pdm.o
+obj-$(CONFIG_SND_MESON_CODEC_GLUE) += snd-soc-meson-codec-glue.o
 obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += snd-soc-meson-g12a-tohdmitx.o
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 9cfbd343a00c..f8853f2fba08 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -12,112 +12,51 @@
 #include <sound/soc-dai.h>
 
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+#include "meson-codec-glue.h"
 
 #define G12A_TOHDMITX_DRV_NAME "g12a-tohdmitx"
 
 #define TOHDMITX_CTRL0			0x0
 #define  CTRL0_ENABLE_SHIFT		31
-#define  CTRL0_I2S_DAT_SEL		GENMASK(13, 12)
+#define  CTRL0_I2S_DAT_SEL_SHIFT	12
+#define  CTRL0_I2S_DAT_SEL		(0x3 << CTRL0_I2S_DAT_SEL_SHIFT)
 #define  CTRL0_I2S_LRCLK_SEL		GENMASK(9, 8)
 #define  CTRL0_I2S_BLK_CAP_INV		BIT(7)
 #define  CTRL0_I2S_BCLK_O_INV		BIT(6)
 #define  CTRL0_I2S_BCLK_SEL		GENMASK(5, 4)
 #define  CTRL0_SPDIF_CLK_CAP_INV	BIT(3)
 #define  CTRL0_SPDIF_CLK_O_INV		BIT(2)
-#define  CTRL0_SPDIF_SEL		BIT(1)
+#define  CTRL0_SPDIF_SEL_SHIFT		1
+#define  CTRL0_SPDIF_SEL		(0x1 << CTRL0_SPDIF_SEL_SHIFT)
 #define  CTRL0_SPDIF_CLK_SEL		BIT(0)
 
-struct g12a_tohdmitx_input {
-	struct snd_soc_pcm_stream params;
-	unsigned int fmt;
-};
-
-static struct snd_soc_dapm_widget *
-g12a_tohdmitx_get_input(struct snd_soc_dapm_widget *w)
-{
-	struct snd_soc_dapm_path *p = NULL;
-	struct snd_soc_dapm_widget *in;
-
-	snd_soc_dapm_widget_for_each_source_path(w, p) {
-		if (!p->connect)
-			continue;
-
-		/* Check that we still are in the same component */
-		if (snd_soc_dapm_to_component(w->dapm) !=
-		    snd_soc_dapm_to_component(p->source->dapm))
-			continue;
-
-		if (p->source->id == snd_soc_dapm_dai_in)
-			return p->source;
-
-		in = g12a_tohdmitx_get_input(p->source);
-		if (in)
-			return in;
-	}
-
-	return NULL;
-}
-
-static struct g12a_tohdmitx_input *
-g12a_tohdmitx_get_input_data(struct snd_soc_dapm_widget *w)
-{
-	struct snd_soc_dapm_widget *in =
-		g12a_tohdmitx_get_input(w);
-	struct snd_soc_dai *dai;
-
-	if (WARN_ON(!in))
-		return NULL;
-
-	dai = in->priv;
-
-	return dai->playback_dma_data;
-}
-
 static const char * const g12a_tohdmitx_i2s_mux_texts[] = {
 	"I2S A", "I2S B", "I2S C",
 };
 
-static SOC_ENUM_SINGLE_EXT_DECL(g12a_tohdmitx_i2s_mux_enum,
-				g12a_tohdmitx_i2s_mux_texts);
-
-static int g12a_tohdmitx_get_input_val(struct snd_soc_component *component,
-				       unsigned int mask)
-{
-	unsigned int val;
-
-	snd_soc_component_read(component, TOHDMITX_CTRL0, &val);
-	return (val & mask) >> __ffs(mask);
-}
-
-static int g12a_tohdmitx_i2s_mux_get_enum(struct snd_kcontrol *kcontrol,
-					  struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-
-	ucontrol->value.enumerated.item[0] =
-		g12a_tohdmitx_get_input_val(component, CTRL0_I2S_DAT_SEL);
-
-	return 0;
-}
-
 static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
-					  struct snd_ctl_elem_value *ucontrol)
+				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_kcontrol_component(kcontrol);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_dapm_kcontrol_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	unsigned int mux = ucontrol->value.enumerated.item[0];
-	unsigned int val = g12a_tohdmitx_get_input_val(component,
-						       CTRL0_I2S_DAT_SEL);
+	unsigned int mux, changed;
+
+	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
+	changed = snd_soc_component_test_bits(component, e->reg,
+					      CTRL0_I2S_DAT_SEL,
+					      FIELD_PREP(CTRL0_I2S_DAT_SEL,
+							 mux));
+
+	if (!changed)
+		return 0;
 
 	/* Force disconnect of the mux while updating */
-	if (val != mux)
-		snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
 
-	snd_soc_component_update_bits(component, TOHDMITX_CTRL0,
+	snd_soc_component_update_bits(component, e->reg,
 				      CTRL0_I2S_DAT_SEL |
 				      CTRL0_I2S_LRCLK_SEL |
 				      CTRL0_I2S_BCLK_SEL,
@@ -130,30 +69,19 @@ static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static SOC_ENUM_SINGLE_DECL(g12a_tohdmitx_i2s_mux_enum, TOHDMITX_CTRL0,
+			    CTRL0_I2S_DAT_SEL_SHIFT,
+			    g12a_tohdmitx_i2s_mux_texts);
+
 static const struct snd_kcontrol_new g12a_tohdmitx_i2s_mux =
 	SOC_DAPM_ENUM_EXT("I2S Source", g12a_tohdmitx_i2s_mux_enum,
-			  g12a_tohdmitx_i2s_mux_get_enum,
+			  snd_soc_dapm_get_enum_double,
 			  g12a_tohdmitx_i2s_mux_put_enum);
 
 static const char * const g12a_tohdmitx_spdif_mux_texts[] = {
 	"SPDIF A", "SPDIF B",
 };
 
-static SOC_ENUM_SINGLE_EXT_DECL(g12a_tohdmitx_spdif_mux_enum,
-				g12a_tohdmitx_spdif_mux_texts);
-
-static int g12a_tohdmitx_spdif_mux_get_enum(struct snd_kcontrol *kcontrol,
-					    struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-
-	ucontrol->value.enumerated.item[0] =
-		g12a_tohdmitx_get_input_val(component, CTRL0_SPDIF_SEL);
-
-	return 0;
-}
-
 static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 					    struct snd_ctl_elem_value *ucontrol)
 {
@@ -162,13 +90,18 @@ static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_dapm_kcontrol_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	unsigned int mux = ucontrol->value.enumerated.item[0];
-	unsigned int val = g12a_tohdmitx_get_input_val(component,
-						       CTRL0_SPDIF_SEL);
+	unsigned int mux, changed;
+
+	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
+	changed = snd_soc_component_test_bits(component, TOHDMITX_CTRL0,
+					      CTRL0_SPDIF_SEL,
+					      FIELD_PREP(CTRL0_SPDIF_SEL, mux));
+
+	if (!changed)
+		return 0;
 
 	/* Force disconnect of the mux while updating */
-	if (val != mux)
-		snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
 
 	snd_soc_component_update_bits(component, TOHDMITX_CTRL0,
 				      CTRL0_SPDIF_SEL |
@@ -181,9 +114,13 @@ static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static SOC_ENUM_SINGLE_DECL(g12a_tohdmitx_spdif_mux_enum, TOHDMITX_CTRL0,
+			    CTRL0_SPDIF_SEL_SHIFT,
+			    g12a_tohdmitx_spdif_mux_texts);
+
 static const struct snd_kcontrol_new g12a_tohdmitx_spdif_mux =
 	SOC_DAPM_ENUM_EXT("SPDIF Source", g12a_tohdmitx_spdif_mux_enum,
-			  g12a_tohdmitx_spdif_mux_get_enum,
+			  snd_soc_dapm_get_enum_double,
 			  g12a_tohdmitx_spdif_mux_put_enum);
 
 static const struct snd_kcontrol_new g12a_tohdmitx_out_enable =
@@ -201,83 +138,13 @@ static const struct snd_soc_dapm_widget g12a_tohdmitx_widgets[] = {
 			    &g12a_tohdmitx_out_enable),
 };
 
-static int g12a_tohdmitx_input_probe(struct snd_soc_dai *dai)
-{
-	struct g12a_tohdmitx_input *data;
-
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	dai->playback_dma_data = data;
-	return 0;
-}
-
-static int g12a_tohdmitx_input_remove(struct snd_soc_dai *dai)
-{
-	kfree(dai->playback_dma_data);
-	return 0;
-}
-
-static int g12a_tohdmitx_input_hw_params(struct snd_pcm_substream *substream,
-					 struct snd_pcm_hw_params *params,
-					 struct snd_soc_dai *dai)
-{
-	struct g12a_tohdmitx_input *data = dai->playback_dma_data;
-
-	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
-	data->params.rate_min = params_rate(params);
-	data->params.rate_max = params_rate(params);
-	data->params.formats = 1 << params_format(params);
-	data->params.channels_min = params_channels(params);
-	data->params.channels_max = params_channels(params);
-	data->params.sig_bits = dai->driver->playback.sig_bits;
-
-	return 0;
-}
-
-
-static int g12a_tohdmitx_input_set_fmt(struct snd_soc_dai *dai,
-				       unsigned int fmt)
-{
-	struct g12a_tohdmitx_input *data = dai->playback_dma_data;
-
-	/* Save the source stream format for the downstream link */
-	data->fmt = fmt;
-	return 0;
-}
-
-static int g12a_tohdmitx_output_startup(struct snd_pcm_substream *substream,
-					struct snd_soc_dai *dai)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct g12a_tohdmitx_input *in_data =
-		g12a_tohdmitx_get_input_data(dai->capture_widget);
-
-	if (!in_data)
-		return -ENODEV;
-
-	if (WARN_ON(!rtd->dai_link->params)) {
-		dev_warn(dai->dev, "codec2codec link expected\n");
-		return -EINVAL;
-	}
-
-	/* Replace link params with the input params */
-	rtd->dai_link->params = &in_data->params;
-
-	if (!in_data->fmt)
-		return 0;
-
-	return snd_soc_runtime_set_dai_fmt(rtd, in_data->fmt);
-}
-
 static const struct snd_soc_dai_ops g12a_tohdmitx_input_ops = {
-	.hw_params	= g12a_tohdmitx_input_hw_params,
-	.set_fmt	= g12a_tohdmitx_input_set_fmt,
+	.hw_params	= meson_codec_glue_input_hw_params,
+	.set_fmt	= meson_codec_glue_input_set_fmt,
 };
 
 static const struct snd_soc_dai_ops g12a_tohdmitx_output_ops = {
-	.startup	= g12a_tohdmitx_output_startup,
+	.startup	= meson_codec_glue_output_startup,
 };
 
 #define TOHDMITX_SPDIF_FORMATS					\
@@ -304,8 +171,8 @@ static const struct snd_soc_dai_ops g12a_tohdmitx_output_ops = {
 	.id = (xid),							\
 	.playback = TOHDMITX_STREAM(xname, "Playback", xfmt, xchmax),	\
 	.ops = &g12a_tohdmitx_input_ops,				\
-	.probe = g12a_tohdmitx_input_probe,				\
-	.remove = g12a_tohdmitx_input_remove,				\
+	.probe = meson_codec_glue_input_dai_probe,			\
+	.remove = meson_codec_glue_input_dai_remove,			\
 }
 
 #define TOHDMITX_OUT(xname, xid, xfmt, xchmax) {			\
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
new file mode 100644
index 000000000000..97bbc967e176
--- /dev/null
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2019 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/module.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "meson-codec-glue.h"
+
+static struct snd_soc_dapm_widget *
+meson_codec_glue_get_input(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p = NULL;
+	struct snd_soc_dapm_widget *in;
+
+	snd_soc_dapm_widget_for_each_source_path(w, p) {
+		if (!p->connect)
+			continue;
+
+		/* Check that we still are in the same component */
+		if (snd_soc_dapm_to_component(w->dapm) !=
+		    snd_soc_dapm_to_component(p->source->dapm))
+			continue;
+
+		if (p->source->id == snd_soc_dapm_dai_in)
+			return p->source;
+
+		in = meson_codec_glue_get_input(p->source);
+		if (in)
+			return in;
+	}
+
+	return NULL;
+}
+
+static void meson_codec_glue_input_set_data(struct snd_soc_dai *dai,
+					    struct meson_codec_glue_input *data)
+{
+	dai->playback_dma_data = data;
+}
+
+struct meson_codec_glue_input *
+meson_codec_glue_input_get_data(struct snd_soc_dai *dai)
+{
+	return dai->playback_dma_data;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_get_data);
+
+static struct meson_codec_glue_input *
+meson_codec_glue_output_get_input_data(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_widget *in =
+		meson_codec_glue_get_input(w);
+	struct snd_soc_dai *dai;
+
+	if (WARN_ON(!in))
+		return NULL;
+
+	dai = in->priv;
+
+	return meson_codec_glue_input_get_data(dai);
+}
+
+int meson_codec_glue_input_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params,
+				     struct snd_soc_dai *dai)
+{
+	struct meson_codec_glue_input *data =
+		meson_codec_glue_input_get_data(dai);
+
+	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
+	data->params.rate_min = params_rate(params);
+	data->params.rate_max = params_rate(params);
+	data->params.formats = 1 << params_format(params);
+	data->params.channels_min = params_channels(params);
+	data->params.channels_max = params_channels(params);
+	data->params.sig_bits = dai->driver->playback.sig_bits;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_hw_params);
+
+int meson_codec_glue_input_set_fmt(struct snd_soc_dai *dai,
+				   unsigned int fmt)
+{
+	struct meson_codec_glue_input *data =
+		meson_codec_glue_input_get_data(dai);
+
+	/* Save the source stream format for the downstream link */
+	data->fmt = fmt;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_set_fmt);
+
+int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct meson_codec_glue_input *in_data =
+		meson_codec_glue_output_get_input_data(dai->capture_widget);
+
+	if (!in_data)
+		return -ENODEV;
+
+	if (WARN_ON(!rtd->dai_link->params)) {
+		dev_warn(dai->dev, "codec2codec link expected\n");
+		return -EINVAL;
+	}
+
+	/* Replace link params with the input params */
+	rtd->dai_link->params = &in_data->params;
+
+	if (!in_data->fmt)
+		return 0;
+
+	return snd_soc_runtime_set_dai_fmt(rtd, in_data->fmt);
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_output_startup);
+
+int meson_codec_glue_input_dai_probe(struct snd_soc_dai *dai)
+{
+	struct meson_codec_glue_input *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	meson_codec_glue_input_set_data(dai, data);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_dai_probe);
+
+int meson_codec_glue_input_dai_remove(struct snd_soc_dai *dai)
+{
+	struct meson_codec_glue_input *data =
+		meson_codec_glue_input_get_data(dai);
+
+	kfree(data);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_codec_glue_input_dai_remove);
+
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_DESCRIPTION("Amlogic Codec Glue Helpers");
+MODULE_LICENSE("GPL v2");
+
diff --git a/sound/soc/meson/meson-codec-glue.h b/sound/soc/meson/meson-codec-glue.h
new file mode 100644
index 000000000000..07f99446c0c6
--- /dev/null
+++ b/sound/soc/meson/meson-codec-glue.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2018 Baylibre SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef _MESON_CODEC_GLUE_H
+#define _MESON_CODEC_GLUE_H
+
+#include <sound/soc.h>
+
+struct meson_codec_glue_input {
+	struct snd_soc_pcm_stream params;
+	unsigned int fmt;
+};
+
+/* Input helpers */
+struct meson_codec_glue_input *
+meson_codec_glue_input_get_data(struct snd_soc_dai *dai);
+int meson_codec_glue_input_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params,
+				     struct snd_soc_dai *dai);
+int meson_codec_glue_input_set_fmt(struct snd_soc_dai *dai,
+				   unsigned int fmt);
+int meson_codec_glue_input_dai_probe(struct snd_soc_dai *dai);
+int meson_codec_glue_input_dai_remove(struct snd_soc_dai *dai);
+
+/* Output helpers */
+int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai);
+
+#endif /* _MESON_CODEC_GLUE_H */
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
