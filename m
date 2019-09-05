Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A46BC3A5A5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C2222CF5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WNDzO9u/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K1wgI+Bm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C2222CF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzkysPkI7+YcUgcVmj8SwKpzhRc+3UEITQT9daYkF7A=; b=WNDzO9u/qNqF+F
	ajGnAUwinQwiDVyMOFePkJNsS9jtGaeRyr5Hzhi1uSIoXH+Nb4outRn+lwMeZCmEQCTVXdCGsKY2j
	jh/gXXu6g5sugXOJh5JRqORjVHngTZWH/cXmVb9muFHolt2PLOtScFPtNnXiMZQiWEVqsSBvj8iU5
	atoT//fWTYHTvPrGlm/2CGqsY4mSaEIBvuvJx6rXomXQsnWgRUA8byp2ho8uQNWIiqDd5tmSQS4qc
	77YOS/GKvCgRXIaLual+CN4ZfqpaZkcXFUrkEVqHZEyRV3AJXBn2RQIhxsrNcJ/frQZFA2exPkxiX
	YCzXAVKP/lszLKc+0pBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5qSR-0008IO-Nn; Thu, 05 Sep 2019 12:01:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qSF-00082o-DM
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 12:01:36 +0000
Received: by mail-wr1-x442.google.com with SMTP id y8so2433476wrn.10
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 05:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MS5XJHYT75fAQfNDJZYmwsq3IlOqs5XUG9bj/DNEg1Y=;
 b=K1wgI+BmLlwGuWLvWOKjgEhqHak7dEDjBF6ia+HKWkPbjOg55sHa+seoDjFEUKR32D
 EQG+xGcV5myYoBYwljoZI1XJTj2u2VTdMQHT6YaqBzo1naDi19CrI6+xwYm/8O1R1Plt
 y8xx3bew6U/zIbR1KOWbOFyNqtD7I/e6tBpq7beLfwQMnw5bS5dNE8BCl25cDh3dVh64
 X9Xmy4zUUExSFPPO/DWhtKEq5eowO6MSxJE+NZlFIgEGDk7G2zLdmVMr/+Q4yvmQaOfq
 ql4u1c4Uxts+yUfrXqB8AocXfyskaBTf7MODWsh1uCHHCxKv52CpgYcYKG9+mQQpgxDg
 6z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MS5XJHYT75fAQfNDJZYmwsq3IlOqs5XUG9bj/DNEg1Y=;
 b=QxPuaxwvDOHbDaxtYSxWXz/xt+QdtwNlZsfGe4kd/lgdEY248Y2rZIv/uxtkov8sf4
 aPT1+iShgXlh4c12azQvJxAHMYewEbLOdFyehdxdJudirx3OYK55Msxj/hlf8ZlhFKj/
 6JE/Zr23zL8Lh4BH0xvTr6a67DqS3g3pLXSVhNPXCXBSk5sCkSKJvUYfZdGXMqBa/Ycg
 DhszI3hwm552pXka4nMx/wBklNdQQsAZNFq/DIl9v94H2yAIgWnhNWj14Iu8O12N8BFH
 xmms19OzL+LYpRnnCu5BgUftm92c0/npDKyzn3PFlomPE7Pk41J51m6PTO67HFRtAaNa
 L6nQ==
X-Gm-Message-State: APjAAAVkR6eRvVZOIMWFFes5c+KZK3er+82EdD+GE6fRZc8/DFrJ88AD
 7JUXMwWMWSIO4EzJZlM2VZz0LA==
X-Google-Smtp-Source: APXvYqz5PhdEL3jHaKHC3XzHvW9oTc+P2oasn9+crC56FOm8eG1k5Or2C2eIBzLJjHuj8/2pZCZ33A==
X-Received: by 2002:adf:e908:: with SMTP id f8mr1956221wrm.210.1567684894141; 
 Thu, 05 Sep 2019 05:01:34 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 6/8] ASoC: meson: axg-frddr: add sm1 support
Date: Thu,  5 Sep 2019 14:01:18 +0200
Message-Id: <20190905120120.31752-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_050135_511492_A70F6940 
X-CRM114-Status: GOOD (  11.31  )
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

On sm1, the output routing bits have moved to CTRL2 register

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c  |  2 +-
 sound/soc/meson/axg-fifo.h  |  1 +
 sound/soc/meson/axg-frddr.c | 73 +++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 80a3dde35b5c..5a3749938900 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -306,7 +306,7 @@ static const struct regmap_config axg_fifo_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= FIFO_INIT_ADDR,
+	.max_register	= FIFO_CTRL2,
 };
 
 int axg_fifo_probe(struct platform_device *pdev)
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index 5caf81241dfe..bb1e2ce50256 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -61,6 +61,7 @@ struct snd_soc_pcm_runtime;
 #define  STATUS1_INT_STS(x)		((x) << 0)
 #define FIFO_STATUS2			0x18
 #define FIFO_INIT_ADDR			0x24
+#define FIFO_CTRL2			0x28
 
 struct axg_fifo {
 	struct regmap *map;
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 0968e8375000..6ab111c31b28 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -23,6 +23,12 @@
 #define CTRL0_SEL3_SHIFT		8
 #define CTRL0_SEL3_EN_SHIFT		11
 #define CTRL1_FRDDR_FORCE_FINISH	BIT(12)
+#define CTRL2_SEL1_SHIFT		0
+#define CTRL2_SEL1_EN_SHIFT		4
+#define CTRL2_SEL2_SHIFT		8
+#define CTRL2_SEL2_EN_SHIFT		12
+#define CTRL2_SEL3_SHIFT		16
+#define CTRL2_SEL3_EN_SHIFT		20
 
 static int g12a_frddr_dai_prepare(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
@@ -269,6 +275,70 @@ static const struct axg_fifo_match_data g12a_frddr_match_data = {
 	.dai_drv	= &g12a_frddr_dai_drv
 };
 
+/* On SM1, the output selection in on CTRL2 */
+static const struct snd_kcontrol_new sm1_frddr_out1_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", FIFO_CTRL2,
+				    CTRL2_SEL1_EN_SHIFT, 1, 0);
+static const struct snd_kcontrol_new sm1_frddr_out2_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", FIFO_CTRL2,
+				    CTRL2_SEL2_EN_SHIFT, 1, 0);
+static const struct snd_kcontrol_new sm1_frddr_out3_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", FIFO_CTRL2,
+				    CTRL2_SEL3_EN_SHIFT, 1, 0);
+
+static SOC_ENUM_SINGLE_DECL(sm1_frddr_sel1_enum, FIFO_CTRL2, CTRL2_SEL1_SHIFT,
+			    axg_frddr_sel_texts);
+static SOC_ENUM_SINGLE_DECL(sm1_frddr_sel2_enum, FIFO_CTRL2, CTRL2_SEL2_SHIFT,
+			    axg_frddr_sel_texts);
+static SOC_ENUM_SINGLE_DECL(sm1_frddr_sel3_enum, FIFO_CTRL2, CTRL2_SEL3_SHIFT,
+			    axg_frddr_sel_texts);
+
+static const struct snd_kcontrol_new sm1_frddr_out1_demux =
+	SOC_DAPM_ENUM("Output Src 1", sm1_frddr_sel1_enum);
+static const struct snd_kcontrol_new sm1_frddr_out2_demux =
+	SOC_DAPM_ENUM("Output Src 2", sm1_frddr_sel2_enum);
+static const struct snd_kcontrol_new sm1_frddr_out3_demux =
+	SOC_DAPM_ENUM("Output Src 3", sm1_frddr_sel3_enum);
+
+static const struct snd_soc_dapm_widget sm1_frddr_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_OUT("SRC 1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SRC 2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SRC 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SWITCH("SRC 1 EN", SND_SOC_NOPM, 0, 0,
+			    &sm1_frddr_out1_enable),
+	SND_SOC_DAPM_SWITCH("SRC 2 EN", SND_SOC_NOPM, 0, 0,
+			    &sm1_frddr_out2_enable),
+	SND_SOC_DAPM_SWITCH("SRC 3 EN", SND_SOC_NOPM, 0, 0,
+			    &sm1_frddr_out3_enable),
+	SND_SOC_DAPM_DEMUX("SINK 1 SEL", SND_SOC_NOPM, 0, 0,
+			   &sm1_frddr_out1_demux),
+	SND_SOC_DAPM_DEMUX("SINK 2 SEL", SND_SOC_NOPM, 0, 0,
+			   &sm1_frddr_out2_demux),
+	SND_SOC_DAPM_DEMUX("SINK 3 SEL", SND_SOC_NOPM, 0, 0,
+			   &sm1_frddr_out3_demux),
+	SND_SOC_DAPM_AIF_OUT("OUT 0", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_component_driver sm1_frddr_component_drv = {
+	.dapm_widgets		= sm1_frddr_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(sm1_frddr_dapm_widgets),
+	.dapm_routes		= g12a_frddr_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
+	.ops			= &g12a_fifo_pcm_ops
+};
+
+static const struct axg_fifo_match_data sm1_frddr_match_data = {
+	.component_drv	= &sm1_frddr_component_drv,
+	.dai_drv	= &g12a_frddr_dai_drv
+};
+
 static const struct of_device_id axg_frddr_of_match[] = {
 	{
 		.compatible = "amlogic,axg-frddr",
@@ -276,6 +346,9 @@ static const struct of_device_id axg_frddr_of_match[] = {
 	}, {
 		.compatible = "amlogic,g12a-frddr",
 		.data = &g12a_frddr_match_data,
+	}, {
+		.compatible = "amlogic,sm1-frddr",
+		.data = &sm1_frddr_match_data,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_frddr_of_match);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
