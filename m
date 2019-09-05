Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75D4C3A5A5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A4D722CEC
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="md0E0RtY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hEH6ZzUL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A4D722CEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFGzGXt0KNFN9IIUZbpTNGIEYfBdKrUSG29+J5/5/eM=; b=md0E0RtY8iwBa2
	lYnlSKWRyrnc0Yb+I2ifMhxvxW54IS0AmVERgplKqXrNeuH6B/LPvxPykbzJIT4TBEYFwxP+HJgha
	nzhB8VAVwN0vhXFWwS+Ouduugr2Wueemoz10H8yxs1VXhpMFLg/ZpoZD2b++xvEoPjv24dIx9G6sP
	7dZh/eKnG0iraSdKoCZAxaAcOO3o/GnPhqSw3Fyxrs18tSHTeMhju1njp0YGTdzhpbS6ef7akLGCU
	swVKd5uh3lPSJPw34PEtm6XMOZoGkyp/13tfucK2TEwe6J4YzSTS8kJkfCB7D6O3KXx+4wZWW7qyC
	YlXk+MDPDlA1PC/c2GbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5qSJ-00088q-Or; Thu, 05 Sep 2019 12:01:39 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qSD-00080l-9z
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 12:01:34 +0000
Received: by mail-wr1-x441.google.com with SMTP id w13so2447689wru.7
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 05:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cj+xRSKwyNiG3WxbYk3EzxKZy6mBMzhtFu6vqSlSsIE=;
 b=hEH6ZzULAcBUkR1Q6yIgBkAgn6572zSGLcHJzNX9o8GjeGom1qFmNHgIUE+FCVzH6m
 elgPgQsnkhGo7fWdGYHoiHnZtTDhBEVKxW722L5mrvmRjc73MzbyGD9yxrlHw7um4D0w
 WQqZ3yZk2Y0t8lg3+G1WHbyiXLfkYvCI5LMVHIuYQkIIojDtzaQML0pvjI+xGoe01mXg
 WgXNYc6VkUeNuo7wsCPWuH0wlvt1OZfepRl3qLGy1TO2nEkkumLhYUqr+NIHmiBRoZAV
 bINPVS81H26mFy0xV/bkolv4SWJdI7dbTkf5d1xOqwojLzDUdNDSH+NSvE3Oq5uF3Zxl
 KMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cj+xRSKwyNiG3WxbYk3EzxKZy6mBMzhtFu6vqSlSsIE=;
 b=MILoHa0ejwC131r1CDSC4ZhDAZb4fasqPZIzWARTe87lb6PuWQlm52uxaEAe0WSqq1
 ggvBGufY6wO3XsfUDRg1lyL1Uusz7lPY1HCO5IeFkS23UR4lvisfirMwkSATqmCYUkuW
 xYouH9UNIP44dxSdqSzA7vq60pSPGY1Y7bMXg0g4mEbHHI9NNUCrqbtiN1t9T6aBifED
 z+H6UMBIzOpyyijhPqIrpRFJ3NR/bpfTFsSp956erhoWETHD0oNtyGSH96zPpSZ7Iv51
 os7HJ7Iq2aW0zBEw0ziNfc1F/Auxboo13Z34b/86KYI68ToXatcTpnT2VyaHk/Sl9dgr
 21nQ==
X-Gm-Message-State: APjAAAWwM3kDE6p6JMl0B4n6k+TEsCFhACFtPVpm7weiujkAD+/t/ZkS
 P+2KYMyjH1p8J5vO+UUX+GKCVw==
X-Google-Smtp-Source: APXvYqziOr8Gaxr0aNjdG/0c+A5ueIJxf7uLcnCfDDYrzhPawEingY+F6Xn70XqHUHjwCEKumyPZiA==
X-Received: by 2002:adf:f7c7:: with SMTP id a7mr2255564wrq.273.1567684891412; 
 Thu, 05 Sep 2019 05:01:31 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/8] ASoC: meson: axg-frddr: expose all 8 outputs
Date: Thu,  5 Sep 2019 14:01:15 +0200
Message-Id: <20190905120120.31752-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_050133_345599_7AB4AC0A 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

The FRDDR component, as it, has a maximum of 8 outputs. Depending on
the SoC, these may not all be connected.

Instead of decribing only the connected outputs of each SoC, describe
them all and let ASoC routing do the rest.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-frddr.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 2b8807737b2b..0968e8375000 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -104,7 +104,7 @@ static struct snd_soc_dai_driver axg_frddr_dai_drv = {
 };
 
 static const char * const axg_frddr_sel_texts[] = {
-	"OUT 0", "OUT 1", "OUT 2", "OUT 3"
+	"OUT 0", "OUT 1", "OUT 2", "OUT 3", "OUT 4", "OUT 5", "OUT 6", "OUT 7",
 };
 
 static SOC_ENUM_SINGLE_DECL(axg_frddr_sel_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
@@ -120,6 +120,10 @@ static const struct snd_soc_dapm_widget axg_frddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("OUT 1", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route axg_frddr_dapm_routes[] = {
@@ -128,6 +132,10 @@ static const struct snd_soc_dapm_route axg_frddr_dapm_routes[] = {
 	{ "OUT 1", "OUT 1",  "SINK SEL" },
 	{ "OUT 2", "OUT 2",  "SINK SEL" },
 	{ "OUT 3", "OUT 3",  "SINK SEL" },
+	{ "OUT 4", "OUT 4",  "SINK SEL" },
+	{ "OUT 5", "OUT 5",  "SINK SEL" },
+	{ "OUT 6", "OUT 6",  "SINK SEL" },
+	{ "OUT 7", "OUT 7",  "SINK SEL" },
 };
 
 static const struct snd_soc_component_driver axg_frddr_component_drv = {
@@ -162,16 +170,12 @@ static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
 	.pcm_new	= axg_frddr_pcm_new,
 };
 
-static const char * const g12a_frddr_sel_texts[] = {
-	"OUT 0", "OUT 1", "OUT 2", "OUT 3", "OUT 4",
-};
-
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel1_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel2_enum, FIFO_CTRL0, CTRL0_SEL2_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel3_enum, FIFO_CTRL0, CTRL0_SEL3_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 
 static const struct snd_kcontrol_new g12a_frddr_out1_demux =
 	SOC_DAPM_ENUM("Output Src 1", g12a_frddr_sel1_enum);
@@ -211,6 +215,9 @@ static const struct snd_soc_dapm_widget g12a_frddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route g12a_frddr_dapm_routes[] = {
@@ -228,16 +235,25 @@ static const struct snd_soc_dapm_route g12a_frddr_dapm_routes[] = {
 	{ "OUT 2", "OUT 2", "SINK 1 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 1 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 1 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 1 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 1 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 1 SEL" },
 	{ "OUT 0", "OUT 0", "SINK 2 SEL" },
 	{ "OUT 1", "OUT 1", "SINK 2 SEL" },
 	{ "OUT 2", "OUT 2", "SINK 2 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 2 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 2 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 2 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 2 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 2 SEL" },
 	{ "OUT 0", "OUT 0", "SINK 3 SEL" },
 	{ "OUT 1", "OUT 1", "SINK 3 SEL" },
 	{ "OUT 2", "OUT 2", "SINK 3 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 3 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 3 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 3 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 3 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 3 SEL" },
 };
 
 static const struct snd_soc_component_driver g12a_frddr_component_drv = {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
