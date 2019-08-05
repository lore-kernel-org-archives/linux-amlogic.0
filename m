Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA429C32751
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA4720880
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="auq5aOZC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="djq1XNNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEA4720880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjvhZSmo3OOpAQYCjAdJnYYJxiLJ1W5yUttXDfzb7DY=; b=auq5aOZCb4LIqe
	0Kd9rwIT6s0WrDfgHDLuoHuqtdbLiQ89XJRxpWQD5fVuvw9X9qCsN7r60V/FdZmRuNistBioPj6gx
	lOCyaicNAqmg54gvY5+19Hv0iQL9616+COmPnVqui7QBZZkEzLXafk1t6McgWtwSnNMHErjRW7V6K
	zQeylYXqX/KhCjIGMV2SC8mOw/eq/4NbpZOhMgCsdVyKKTa1rYlX2AduZRUZpZS5zfmFYm03gD1uK
	GFCU5S0O/27MFwJ9AAl7DH1gWAvIhLwhhT8k6mOnQF3ebIl9X9r5ouon3Ku5KhyD6WGA5xpKiHD1y
	7afTTDbCRH6nZoCD3n4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudEr-0000vj-Pn; Mon, 05 Aug 2019 13:41:25 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudEi-0000g5-1s
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:41:17 +0000
Received: by mail-wm1-x341.google.com with SMTP id s15so51712354wmj.3
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+WcHBmr4prRt0vIkSfM9PPUqwEgU3pvt4JgB//l4IQ=;
 b=djq1XNNCaa80etpmbt/t52jE3VOpu447E/HlXbMrdXc4UCAeGM1biJA8j1G/SxpTSI
 v+VzJq4HpD++RmUH3M6U3m+jS8S2emGkORh5sRBm2LnD9l6vrNZNF8aqU+4Z1nZXDBvZ
 uNvwfeYVTsBbHmQ94RdlN/ll9Xb00pD7PfEn9Ef/bE+ysLCoMdKRAtubd3m2ovyEq/qY
 IdB3WIu2s2PYsQ53POMt1Q7JvfrjWPiqZ6MrTYCRz+1WSPX/3JoDdnzghdJQLSskqINU
 eKFIJqbT0a7cN2Lngixg3wJqPQrhYfjyovnI9dvgYknO7XVgISZUhzYhvXawyv4IVOdA
 YzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+WcHBmr4prRt0vIkSfM9PPUqwEgU3pvt4JgB//l4IQ=;
 b=UUfqNZ+KTpNoHiuUsEKLbDofhrRzq4CPLBDD2PtCajzstAw89xbSEAxJxH2HX6sO7q
 BOK5jUSy+8zUmvelukcRznXoa2ZPfI22CvERbjg34G7iR8AY3HJgVHwA2AFDaq2v+uaL
 qxUdtbLeOSG5IVIP7ATMQ56Auxh2QFylRbsa8UzqMDX8Ci7d9t3b63SoWqn/U7UPVaVB
 JHldv2scVj/fASoREMIa4LFQtJWew8e2H65aDL+8WMITwvKajLZ2MWxJAUIQSmcYfXeV
 zDLSsjzgW7lbI8U+avfV+5UfJi3C1gAPCYW4FU1uElkOxNBhbPC/bpWoP8JRvMJiwwY2
 OpDQ==
X-Gm-Message-State: APjAAAVCS5U8x3XAJWf+4JjFDYb4tPgFiolzvkPDaOgeJsQcUr0s6pyt
 8LYL+k0pVVPySIJvMrri65EF5Q==
X-Google-Smtp-Source: APXvYqy/drVrAb85EbTmmCjdLZAL3PlrstNRykKo/mQZKHCMjPluiL7BXjLnhtg2pTt038NuwCvmCA==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr18887642wma.120.1565012474656; 
 Mon, 05 Aug 2019 06:41:14 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld support
Date: Mon,  5 Aug 2019 15:41:02 +0200
Message-Id: <20190805134102.24173-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064116_129010_DFFA8E2A 
X-CRM114-Status: GOOD (  12.06  )
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

Provide the eld to the generic hdmi-codec driver.
This will let the driver enforce the maximum channel number and set the
channel allocation depending on the hdmi sink.

Cc: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h     |  1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 10 ++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
index 63b5756f463b..cb07dc0da5a7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
@@ -14,6 +14,7 @@ struct dw_hdmi_audio_data {
 
 struct dw_hdmi_i2s_audio_data {
 	struct dw_hdmi *hdmi;
+	u8 *eld;
 
 	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
 	u8 (*read)(struct dw_hdmi *hdmi, int offset);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index b8ece9c1ba2c..14d499b344c0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -121,6 +121,15 @@ static void dw_hdmi_i2s_audio_shutdown(struct device *dev, void *data)
 	dw_hdmi_audio_disable(hdmi);
 }
 
+static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
+			       size_t len)
+{
+	struct dw_hdmi_i2s_audio_data *audio = data;
+
+	memcpy(buf, audio->eld, min(sizeof(audio->eld), len));
+	return 0;
+}
+
 static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
 				  struct device_node *endpoint)
 {
@@ -144,6 +153,7 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
 static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
 	.hw_params	= dw_hdmi_i2s_hw_params,
 	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
+	.get_eld	= dw_hdmi_i2s_get_eld,
 	.get_dai_id	= dw_hdmi_i2s_get_dai_id,
 };
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index bed4bb017afd..8df69c9dbfad 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2797,6 +2797,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		struct dw_hdmi_i2s_audio_data audio;
 
 		audio.hdmi	= hdmi;
+		audio.eld	= hdmi->connector.eld;
 		audio.write	= hdmi_writeb;
 		audio.read	= hdmi_readb;
 		hdmi->enable_audio = dw_hdmi_i2s_audio_enable;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
