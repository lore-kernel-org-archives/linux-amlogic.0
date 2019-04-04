Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225F6C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:18:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B2720855
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UX1q3WO1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FKy5BGl6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B2720855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9AdK3L2eFVQlRwssKyYg2SMTU7j6MVXuCAPYYPCyBDg=; b=UX1q3WO1ovzamB
	b76naDPIwScAh1fLqOCgY8MygsLo5/Dr8y+FgfdECqFO1BTE85aQHOxWSs1Hgc9ZHDZ/I82flD8GQ
	dW9zgn7FBL3r9gR8R6tEg8FKNUOv5WXHsiozRuO5XrVa7XVuy0zOy/UDnlJAMOwLGLWT5aS77sBmc
	5V83CeERKES8iCYzSl7QowLzllv8rcpWFJkBiUkNpedDXYmPncSAyF0+uiYuRSw3muLQOvbGrzKPS
	rCQsU7cEM7OfMaLegRDI4TDAEgs81g6mhCx8BO40u2fZT1JO4GpQDP+Vzukt9At7PXsRvMlR2Em+G
	GZeBJDG3Xu2FkYFnnAow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC0NY-0004Aj-KH; Thu, 04 Apr 2019 11:17:56 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC0NU-00044T-C2
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 11:17:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id k11so3289521wro.5
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bu8sSj/St5z5A/eP0AMpKjvggaQ9cr9OipT1kkMzPs=;
 b=FKy5BGl6KmArpPlYrypEgU7w+7gaLQQFn61H0Cr8I7SW9dY9s0GUCsG67V7nxmikkv
 sGbyt7pq78VPDPtWYF+wf9aid5MKGm2Fi9tDyDf9hgYaLHrnD3PDUJAQT8NDSJHh/Zed
 EIdpVfue+bdWrRnFX1cvbF6F0J2WXSd3oCHVt9HFBCfh7N5rGrVRFvcfgBlD60toQIj7
 NuJsCv9tg95+pE1qeiF25UrAyX2mBgCGGJKC6w2aYxFH555Horzz9AR1ERp3hT1TVMm5
 jP2GXsKIz4350NiTihc/aUQnPkWPtJYTl9LSt8LIevOscFyOoYqSjfnuGkc6Kpwbz/Lv
 XVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bu8sSj/St5z5A/eP0AMpKjvggaQ9cr9OipT1kkMzPs=;
 b=IW9pMqK1Bq5eL7/f/ncpLrQxwNKXcFiaT2+hbObqiTeRrFKhZMqan7UA0gXFyFjs5g
 WjoAWdFmhjH/efhCRykijW+/30bPBaU1trDqw4ljFvtZh554J221v1kY4BFCD13LnZZ0
 +IGGjn278W5Rd02YMvGazrq63rfYdLK4Us5wx7w0Og7c99oybOeJ4wxdPNe8hSDSRQl5
 7a6xo4lCR7DsxPLFmlyGMhsu78cjgTzycXuZVA1Nm0BZlePnHTTTMeSSNt8k/HQV1SKH
 ZKC0YjL6L+Xd4kHLDziRH6T4TXVBPeErw8jBJlK+NMG/ChHA0M4k3HespZkU4DkB33e8
 sQ7A==
X-Gm-Message-State: APjAAAX+uoLc+HQdg//aff3+fCmALHHF8UpWi5j8gODiSncx7Bqkg+zB
 V2CIFHRZGnyvXB1T6FzL9V4rog==
X-Google-Smtp-Source: APXvYqxKQNqcDsBC3ZPMQAra7s/cBMV/W+962KTIaqXV1vVIfB5fm6uKWWJPfbBw2pmhvexpnPG0kw==
X-Received: by 2002:adf:eaca:: with SMTP id o10mr3819260wrn.273.1554376670916; 
 Thu, 04 Apr 2019 04:17:50 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id z23sm9024771wma.0.2019.04.04.04.17.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 04:17:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 4/6] ASoC: meson: axg-frddr: add g12a support
Date: Thu,  4 Apr 2019 13:17:31 +0200
Message-Id: <20190404111733.28705-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404111733.28705-1-jbrunet@baylibre.com>
References: <20190404111733.28705-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_041752_505962_567F547F 
X-CRM114-Status: GOOD (  14.94  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the axg, frddr could only be connected to 1 downstream element, so the
playback was possible on 1 interface only at a time.

On the g12a, the frddr may connect and wait for the request of up to 3
downstream elements. With this, it possible for single playback to be
played on several interfaces at the same time.

Like the toddr fifo, the g12a frddr also need to take care of resetting
the read pointer to the initial fifo address when preparing a playback.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-frddr.c | 143 +++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index a6f6f6a2eca8..2b8807737b2b 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -3,7 +3,9 @@
 // Copyright (c) 2018 BayLibre, SAS.
 // Author: Jerome Brunet <jbrunet@baylibre.com>
 
-/* This driver implements the frontend playback DAI of AXG based SoCs */
+/*
+ * This driver implements the frontend playback DAI of AXG and G12A based SoCs
+ */
 
 #include <linux/clk.h>
 #include <linux/regmap.h>
@@ -14,7 +16,29 @@
 
 #include "axg-fifo.h"
 
-#define CTRL0_FRDDR_PP_MODE	BIT(30)
+#define CTRL0_FRDDR_PP_MODE		BIT(30)
+#define CTRL0_SEL1_EN_SHIFT		3
+#define CTRL0_SEL2_SHIFT		4
+#define CTRL0_SEL2_EN_SHIFT		7
+#define CTRL0_SEL3_SHIFT		8
+#define CTRL0_SEL3_EN_SHIFT		11
+#define CTRL1_FRDDR_FORCE_FINISH	BIT(12)
+
+static int g12a_frddr_dai_prepare(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
+
+	/* Reset the read pointer to the FIFO_INIT_ADDR */
+	regmap_update_bits(fifo->map, FIFO_CTRL1,
+			   CTRL1_FRDDR_FORCE_FINISH, 0);
+	regmap_update_bits(fifo->map, FIFO_CTRL1,
+			   CTRL1_FRDDR_FORCE_FINISH, CTRL1_FRDDR_FORCE_FINISH);
+	regmap_update_bits(fifo->map, FIFO_CTRL1,
+			   CTRL1_FRDDR_FORCE_FINISH, 0);
+
+	return 0;
+}
 
 static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
@@ -119,10 +143,123 @@ static const struct axg_fifo_match_data axg_frddr_match_data = {
 	.dai_drv	= &axg_frddr_dai_drv
 };
 
+static const struct snd_soc_dai_ops g12a_frddr_ops = {
+	.prepare	= g12a_frddr_dai_prepare,
+	.startup	= axg_frddr_dai_startup,
+	.shutdown	= axg_frddr_dai_shutdown,
+};
+
+static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
+	.name = "FRDDR",
+	.playback = {
+		.stream_name	= "Playback",
+		.channels_min	= 1,
+		.channels_max	= AXG_FIFO_CH_MAX,
+		.rates		= AXG_FIFO_RATES,
+		.formats	= AXG_FIFO_FORMATS,
+	},
+	.ops		= &g12a_frddr_ops,
+	.pcm_new	= axg_frddr_pcm_new,
+};
+
+static const char * const g12a_frddr_sel_texts[] = {
+	"OUT 0", "OUT 1", "OUT 2", "OUT 3", "OUT 4",
+};
+
+static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel1_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
+			    g12a_frddr_sel_texts);
+static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel2_enum, FIFO_CTRL0, CTRL0_SEL2_SHIFT,
+			    g12a_frddr_sel_texts);
+static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel3_enum, FIFO_CTRL0, CTRL0_SEL3_SHIFT,
+			    g12a_frddr_sel_texts);
+
+static const struct snd_kcontrol_new g12a_frddr_out1_demux =
+	SOC_DAPM_ENUM("Output Src 1", g12a_frddr_sel1_enum);
+static const struct snd_kcontrol_new g12a_frddr_out2_demux =
+	SOC_DAPM_ENUM("Output Src 2", g12a_frddr_sel2_enum);
+static const struct snd_kcontrol_new g12a_frddr_out3_demux =
+	SOC_DAPM_ENUM("Output Src 3", g12a_frddr_sel3_enum);
+
+static const struct snd_kcontrol_new g12a_frddr_out1_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", FIFO_CTRL0,
+				    CTRL0_SEL1_EN_SHIFT, 1, 0);
+static const struct snd_kcontrol_new g12a_frddr_out2_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", FIFO_CTRL0,
+				    CTRL0_SEL2_EN_SHIFT, 1, 0);
+static const struct snd_kcontrol_new g12a_frddr_out3_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", FIFO_CTRL0,
+				    CTRL0_SEL3_EN_SHIFT, 1, 0);
+
+static const struct snd_soc_dapm_widget g12a_frddr_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_OUT("SRC 1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SRC 2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SRC 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SWITCH("SRC 1 EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_frddr_out1_enable),
+	SND_SOC_DAPM_SWITCH("SRC 2 EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_frddr_out2_enable),
+	SND_SOC_DAPM_SWITCH("SRC 3 EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_frddr_out3_enable),
+	SND_SOC_DAPM_DEMUX("SINK 1 SEL", SND_SOC_NOPM, 0, 0,
+			   &g12a_frddr_out1_demux),
+	SND_SOC_DAPM_DEMUX("SINK 2 SEL", SND_SOC_NOPM, 0, 0,
+			   &g12a_frddr_out2_demux),
+	SND_SOC_DAPM_DEMUX("SINK 3 SEL", SND_SOC_NOPM, 0, 0,
+			   &g12a_frddr_out3_demux),
+	SND_SOC_DAPM_AIF_OUT("OUT 0", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route g12a_frddr_dapm_routes[] = {
+	{ "SRC 1", NULL, "Playback" },
+	{ "SRC 2", NULL, "Playback" },
+	{ "SRC 3", NULL, "Playback" },
+	{ "SRC 1 EN", "Switch", "SRC 1" },
+	{ "SRC 2 EN", "Switch", "SRC 2" },
+	{ "SRC 3 EN", "Switch", "SRC 3" },
+	{ "SINK 1 SEL", NULL, "SRC 1 EN" },
+	{ "SINK 2 SEL", NULL, "SRC 2 EN" },
+	{ "SINK 3 SEL", NULL, "SRC 3 EN" },
+	{ "OUT 0", "OUT 0", "SINK 1 SEL" },
+	{ "OUT 1", "OUT 1", "SINK 1 SEL" },
+	{ "OUT 2", "OUT 2", "SINK 1 SEL" },
+	{ "OUT 3", "OUT 3", "SINK 1 SEL" },
+	{ "OUT 4", "OUT 4", "SINK 1 SEL" },
+	{ "OUT 0", "OUT 0", "SINK 2 SEL" },
+	{ "OUT 1", "OUT 1", "SINK 2 SEL" },
+	{ "OUT 2", "OUT 2", "SINK 2 SEL" },
+	{ "OUT 3", "OUT 3", "SINK 2 SEL" },
+	{ "OUT 4", "OUT 4", "SINK 2 SEL" },
+	{ "OUT 0", "OUT 0", "SINK 3 SEL" },
+	{ "OUT 1", "OUT 1", "SINK 3 SEL" },
+	{ "OUT 2", "OUT 2", "SINK 3 SEL" },
+	{ "OUT 3", "OUT 3", "SINK 3 SEL" },
+	{ "OUT 4", "OUT 4", "SINK 3 SEL" },
+};
+
+static const struct snd_soc_component_driver g12a_frddr_component_drv = {
+	.dapm_widgets		= g12a_frddr_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(g12a_frddr_dapm_widgets),
+	.dapm_routes		= g12a_frddr_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
+	.ops			= &g12a_fifo_pcm_ops
+};
+
+static const struct axg_fifo_match_data g12a_frddr_match_data = {
+	.component_drv	= &g12a_frddr_component_drv,
+	.dai_drv	= &g12a_frddr_dai_drv
+};
+
 static const struct of_device_id axg_frddr_of_match[] = {
 	{
 		.compatible = "amlogic,axg-frddr",
 		.data = &axg_frddr_match_data,
+	}, {
+		.compatible = "amlogic,g12a-frddr",
+		.data = &g12a_frddr_match_data,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_frddr_of_match);
@@ -136,6 +273,6 @@ static struct platform_driver axg_frddr_pdrv = {
 };
 module_platform_driver(axg_frddr_pdrv);
 
-MODULE_DESCRIPTION("Amlogic AXG playback fifo driver");
+MODULE_DESCRIPTION("Amlogic AXG/G12A playback fifo driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
