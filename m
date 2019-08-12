Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3159C41514
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79039208C2
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jic1gfip";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aOQF4iSE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79039208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uUXUogdRnPdEAzki9jOODRtBbLWXRIonvUDI/fEcCw=; b=jic1gfipFXdHkI
	GkBfHOpNcRHnNyqRN9oZcFjflDdMiy3e3/9dw2bNOs/sIi/5fTPwoEd+/xCQesVMfVjF3PRFmZyp+
	BdalF11802qIVgcF2SeNXfgn1U6gGcTvBpAdvLs7AGfhknBGsZrALUWRJqx9uc2Qjogm1QiSRG5ex
	TPCUmY7H8pYkRO9osKGGt5IwYP4oNVmKBpMdjN8TEsKm/+bDurVnibFDi175ZRw3cbqz5dMFXkfwS
	DMyF6WRkxIqPfTZgy6NG3U+TyfNG4I+g3hfzbzSbqS4Jof4BHs0x7/w1aleDv906y8O/gDxo/fWBf
	LTFxAAhPmtbaKie18SaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx970-0006jM-Vg; Mon, 12 Aug 2019 12:07:42 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx96r-0006as-2U
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:07:35 +0000
Received: by mail-wr1-x442.google.com with SMTP id z11so2394287wrt.4
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f27o2oE+oJHz4miX1Hf8EQ6LoL/TmaOJvKtMiSXbELE=;
 b=aOQF4iSEbmZZ5KY0hvPeBd8BItPqgtiP29FyURV+eKXNUeVijOxMVfVCNA5pEXVaji
 K05N5EAuVNZVkbw5HIZWo9Izbd+BKrdQneWJUE6mR8E+bFCl+BOy+iXJdUoH//looyMM
 i6Cd2+/WCQrlwCpG+k0SFfRmr5S5ndy2CL20JE4IcoCQ+HoOQ1dxHJ/Xz9zcpiee+ahQ
 UfLEAmK4UaIPrcB9cSrXtFILshBuSU1EESYiJu2DnqMEZBKC1EkoPtR6qYMeG7GqJFWZ
 LG4qrbnPerpCH8mP2DWE16gQQZT8R85kXCoRm6Ncr4Z/OVzVjb+ds4OvOnBsstAWEezE
 W5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f27o2oE+oJHz4miX1Hf8EQ6LoL/TmaOJvKtMiSXbELE=;
 b=KspYJ5vt0BbAGNrT82lHZC7Bzer8opSNkB+jyIokfDAhBEbeSU/rGoJ3MLmQoOXh8U
 +RZor00pXp+nyMfxvIOX1jwYtByxt2v2BqsIUOqw50wvthJkObSNqiam4a5Sxj6b8yTz
 ny4su7rbuy5mXIOen7T0VzMwOrLIpvQuAbUcb65uw/slh2NwRwA3R5xObyjssAmNnMt6
 P/v0vKRDkVL9dEtT7xbcvXXFIzRrTv+PL+/Jf0OpTTBY1FARMTejr6F+9sf5OseRP/9w
 cmnad506RVyRshpWGEnQeVmXswMrOKWDBqSuaTDyQ0pcBhsXHEb66ZZFIMMNlfIxFrKI
 j8VA==
X-Gm-Message-State: APjAAAVVpUia+NU7qaiKSnCSlBaXp1QXxjwkvR2z+hga8wHtCGAICiG1
 xKebgQqiZexTiZdXn3VF5gRzqg==
X-Google-Smtp-Source: APXvYqwQMpGaWCUJTwGWrRgVVpAUR9EHakWwjQhtB4VAuAtKJl/x804rET/ORPE8DjACKRip0STzcw==
X-Received: by 2002:adf:a1de:: with SMTP id v30mr5234110wrv.138.1565611651778; 
 Mon, 12 Aug 2019 05:07:31 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/8] drm/bridge: dw-hdmi: move audio channel setup out of
 ahb
Date: Mon, 12 Aug 2019 14:07:20 +0200
Message-Id: <20190812120726.1528-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_050733_114447_ED7F9452 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Part of the channel count setup done in dw-hdmi ahb should
actually be done whatever the interface providing the data.

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
Let's move it to dw-hdmi driver instead.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 20 +++---------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 32 +++++++++++++++++++
 include/drm/bridge/dw_hdmi.h                  |  2 ++
 3 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index a494186ae6ce..2b7539701b42 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -63,10 +63,6 @@ enum {
 	HDMI_REVISION_ID = 0x0001,
 	HDMI_IH_AHBDMAAUD_STAT0 = 0x0109,
 	HDMI_IH_MUTE_AHBDMAAUD_STAT0 = 0x0189,
-	HDMI_FC_AUDICONF2 = 0x1027,
-	HDMI_FC_AUDSCONF = 0x1063,
-	HDMI_FC_AUDSCONF_LAYOUT1 = 1 << 0,
-	HDMI_FC_AUDSCONF_LAYOUT0 = 0 << 0,
 	HDMI_AHB_DMA_CONF0 = 0x3600,
 	HDMI_AHB_DMA_START = 0x3601,
 	HDMI_AHB_DMA_STOP = 0x3602,
@@ -403,7 +399,7 @@ static int dw_hdmi_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dw_hdmi *dw = substream->private_data;
-	u8 threshold, conf0, conf1, layout, ca;
+	u8 threshold, conf0, conf1, ca;
 
 	/* Setup as per 3.0.5 FSL 4.1.0 BSP */
 	switch (dw->revision) {
@@ -434,20 +430,12 @@ static int dw_hdmi_prepare(struct snd_pcm_substream *substream)
 	conf1 = default_hdmi_channel_config[runtime->channels - 2].conf1;
 	ca = default_hdmi_channel_config[runtime->channels - 2].ca;
 
-	/*
-	 * For >2 channel PCM audio, we need to select layout 1
-	 * and set an appropriate channel map.
-	 */
-	if (runtime->channels > 2)
-		layout = HDMI_FC_AUDSCONF_LAYOUT1;
-	else
-		layout = HDMI_FC_AUDSCONF_LAYOUT0;
-
 	writeb_relaxed(threshold, dw->data.base + HDMI_AHB_DMA_THRSLD);
 	writeb_relaxed(conf0, dw->data.base + HDMI_AHB_DMA_CONF0);
 	writeb_relaxed(conf1, dw->data.base + HDMI_AHB_DMA_CONF1);
-	writeb_relaxed(layout, dw->data.base + HDMI_FC_AUDSCONF);
-	writeb_relaxed(ca, dw->data.base + HDMI_FC_AUDICONF2);
+
+	dw_hdmi_set_channel_count(dw->data.hdmi, runtime->channels);
+	dw_hdmi_set_channel_allocation(dw->data.hdmi, ca);
 
 	switch (runtime->format) {
 	case SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE:
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 218a7b2308f7..be6d6819bef4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -645,6 +645,38 @@ void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate)
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_set_sample_rate);
 
+void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt)
+{
+	u8 layout;
+
+	mutex_lock(&hdmi->audio_mutex);
+
+	/*
+	 * For >2 channel PCM audio, we need to select layout 1
+	 * and set an appropriate channel map.
+	 */
+	if (cnt > 2)
+		layout = HDMI_FC_AUDSCONF_AUD_PACKET_LAYOUT_LAYOUT1;
+	else
+		layout = HDMI_FC_AUDSCONF_AUD_PACKET_LAYOUT_LAYOUT0;
+
+	hdmi_modb(hdmi, layout, HDMI_FC_AUDSCONF_AUD_PACKET_LAYOUT_MASK,
+		  HDMI_FC_AUDSCONF);
+
+	mutex_unlock(&hdmi->audio_mutex);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_set_channel_count);
+
+void dw_hdmi_set_channel_allocation(struct dw_hdmi *hdmi, unsigned int ca)
+{
+	mutex_lock(&hdmi->audio_mutex);
+
+	hdmi_writeb(hdmi, ca, HDMI_FC_AUDICONF2);
+
+	mutex_unlock(&hdmi->audio_mutex);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_set_channel_allocation);
+
 static void hdmi_enable_audio_clk(struct dw_hdmi *hdmi, bool enable)
 {
 	if (enable)
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index c402364aec0d..cf528c289857 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -155,6 +155,8 @@ void dw_hdmi_resume(struct dw_hdmi *hdmi);
 void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
 
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
+void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt);
+void dw_hdmi_set_channel_allocation(struct dw_hdmi *hdmi, unsigned int ca);
 void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
 void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);
 void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
