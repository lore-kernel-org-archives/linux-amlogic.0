Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9436FC32751
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD8820880
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jtxHKJCq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="o9lEr+Sk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD8820880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqt/f4kD9a0jHEYJLTAL8HLt0XSv0ORMH8Kj6VLAfgA=; b=jtxHKJCqBgMPPx
	jWFK9UMb3VJ17958GWYktJ3rkOblB5yzana/KR28aZ7VOzpfawzzxNuBLFnhMB+a8cMpEONMX2lhc
	1uh2/E3Itaq0KLJhQTojmPtBwfrXxC4Nyo5mxDhgWAy1/oUGr0yAskyVDcERFmqknm50qIkUTDozR
	zili6LDoYBfLIbKhjHrJrzuwMYAqrI1JtchfMMfWDbP/oKUPsBRIYHxAck8ny8XgTHaIFagKs+2sj
	ra1TjGNCJrx5fYcU1xAzM8CcYp35qPkj2SWTSWI727zTbqYajbLxmmSiDIKObZVVO743KdslyiyiI
	WsfU14mkHEHJLtxShOrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudEf-0000ds-Ol; Mon, 05 Aug 2019 13:41:13 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudEb-0000ZL-Mz
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:41:11 +0000
Received: by mail-wm1-x344.google.com with SMTP id 207so74821364wma.1
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GncMVDz5Vd7/NEmfnXs9hYV3ld42S/SQ0pl+I46T4l8=;
 b=o9lEr+Skep04ad2BOwbVmN36Q5i0vAAvaall6aKeayBrBMJfcswlnOFmDDkEyHqQvz
 l6r6b5ma5Uw8b97m/7ZdXjYphKsrWHAUoFElJMElt217BZVGYEeVFpBkrywXBYBmgd8e
 LRVFIRSCpBzGhiJubWPADBLwMBClmqU4YEgVS6nU5tjNFdfT62fkfU654GJ66Ag0ZNx9
 pbvJ6dfHI0YEmy8RC+gxOa/BDRkSa9K9AIQf0W4tEZwmcyDboR8Aj0mknHwOr5mXBBsY
 QSGmdro7WtQgXW5fDZdvzazaYQjg5h3dgprYSG8hZpH3J7DkCkOYvIX366+tCyK6L2Qu
 tSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GncMVDz5Vd7/NEmfnXs9hYV3ld42S/SQ0pl+I46T4l8=;
 b=iQ446KGkNJrtw3GeJdRecvIIOKLfwNOC08n1soVEaIS9apZ/ziPU6WjGAl6iAEgTiV
 2W8wzUJeoXWNcwRW6M2vhA5aW1d5jX3KqACgOYbqqr24i3eYWYd2qVQL0eFRjVTithDP
 lEzdaViAYzW72OWfHGi+ys/UVzXoKYrMJ/s4yLszz0BbNrADySw/K9nmBaoMW/0il/8h
 tw4J9MIbttpQHhVBRWJd/zkUBgLBYyMPV1TzNyjwlhLxBq+s8oQkrK3OVn0P1RWhPbSI
 QVVpJitMVy+p5UJ43Z4I7s8Mihru/UXKZ4hBmB+HdlbzJmKTtoU/t0NmZ3MgmJI88ghI
 2uFQ==
X-Gm-Message-State: APjAAAWhx7c+toCf4qRHP1hG+BFk3nfp6+wfQNyz/cuS5ahvjyqfYs12
 It5KaiKunCzpMtw10de67hPELg==
X-Google-Smtp-Source: APXvYqwcSww8Y0uffTimxqmSNt9Jd/RKdAMe2bp2vn9qOiDZl//WDAehUdAAkviXn9l9223SKA46fA==
X-Received: by 2002:a1c:e710:: with SMTP id e16mr19446088wmh.38.1565012468451; 
 Mon, 05 Aug 2019 06:41:08 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/8] drm/bridge: dw-hdmi: move audio channel setup out of ahb
Date: Mon,  5 Aug 2019 15:40:56 +0200
Message-Id: <20190805134102.24173-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064109_752599_25B44535 
X-CRM114-Status: GOOD (  11.65  )
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
