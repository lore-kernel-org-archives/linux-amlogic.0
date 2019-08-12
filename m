Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AFEC433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:50:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2FBD208C2
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:50:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IurxQcXE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hS7Kx+wO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2FBD208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ItUTRH76D0IZcHtGUli0VDijREVgDeXKMdsKlNRAVs=; b=IurxQcXEYM/dvt
	wSbeUWyeEl81Na6z5NHejESpnYiZhQnfVMFb7+S3oQsSLG/q3JPjVPBBSjcmrG7zRqedMWs7DWwyh
	dU1SbevOlzT/Htgk2zI1UOu0CWQ7LnY7vaSRlWQGaiCzwkq3nMolnO1M9VPqH5+P/LVbp8jP5A9zo
	R1s/L2+exvzv/LfKSqCrAoRG8r8ws9mnO85bVo4aQQEy8VUKP4rj1J9wuKkGc/0RVdTknvVHaWcHN
	T/TM0viQZ92F4INfYghKxo7qmblb9mEq/0WcPm3B/H3VJPEYESjCWGbH0SEa4j6LGNgGQ6EvelAib
	T2n/SXfXYiP7PWhVx+aQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx9mW-0001WD-3P; Mon, 12 Aug 2019 12:50:36 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx9mT-0001Vp-GN
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:50:35 +0000
Received: by mail-wm1-x344.google.com with SMTP id v19so11655528wmj.5
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nuL4TLbuiajteIBUcLht3A9vUK/cqgNo9Cf0dYF6/nc=;
 b=hS7Kx+wOvRPyPbK4skt43H1PfDxHj/p/cn434dg/BQt9yVt/ySb9q4VxmXqpbcQvqR
 GavtSTsLNe7rVhEjG9UPXpd0Q7ymkWVCgxHP386VObqiwHXgMFGPBTQr5lKcLnI5D10z
 IqGc1dLK1K9isXdUt/aZcrMcFzgt2z3Bru0+ZqQX6A6fzH3MhBHTaq05EXAHg9DhamBm
 eIjC+dOqRKSvw5FRqmqCJgzh3bZNJe4gc/YH9Gi0jmgpJouQ1nSXlc/7LBH/9FvJWrg1
 ckSYGMBCIFESxN1VyIveMVps/K52K7gnD9oUz2/vJfT3BzZmGTNHlrJZTauoo4NF+A0i
 Kuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nuL4TLbuiajteIBUcLht3A9vUK/cqgNo9Cf0dYF6/nc=;
 b=K6Gm5y49FTMihEWs1VkE25IJEGGtUeBoNvgHIgCRTq4aBCVNzecLs7mEGnVfZQ1zji
 7EKfL/O3V3txyP2+NxJK+orBt+gpnVZC4Vl0HMyLnnyI/18fs0Nce5URhJjUwowbzWEh
 fz69itzizEJy3qwjlTpEm1obU4kkD7cyRz23Xc/2gntwc5IvdSKYemR4B52rTnUPd1Qd
 /KasQZvS8O+So47qophe2SBsokK8VGBYZpCd1J47+S4aiHiD6U2iD5ydxsXfD5BfUZtP
 3wPTxs6lIQ/oBTPfDH4Ef5Se0X0ToIzpi4ARfx/bBMgRdd2TvwA5oY5eG30kA4Hc78TM
 oxcg==
X-Gm-Message-State: APjAAAU4Cq8l5MFsXNX9fv4hXfcY22kHplhUQ1pb5xBsaD3rgCJjuEoe
 IN7DLzOsPpSAxy841OSurcSe8w==
X-Google-Smtp-Source: APXvYqzz/wdsFPSBb7Iv51fpxD7mYrRzkV5Mt16VX8X+OU4vA0sD1wYsRjv5/wSlhihAoZqsMX27Aw==
X-Received: by 2002:a1c:7a02:: with SMTP id v2mr27485520wmc.159.1565614231714; 
 Mon, 12 Aug 2019 05:50:31 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e11sm13740504wrc.4.2019.08.12.05.50.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:50:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH v2 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld support
Date: Mon, 12 Aug 2019 14:50:16 +0200
Message-Id: <20190812125016.20169-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-9-jbrunet@baylibre.com>
References: <20190812120726.1528-9-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_055033_547001_1B3EA1DD 
X-CRM114-Status: GOOD (  11.93  )
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 11 +++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  1 +
 3 files changed, 13 insertions(+)

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
index b8ece9c1ba2c..1d15cf9b6821 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 
 #include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_crtc.h>
 
 #include <sound/hdmi-codec.h>
 
@@ -121,6 +122,15 @@ static void dw_hdmi_i2s_audio_shutdown(struct device *dev, void *data)
 	dw_hdmi_audio_disable(hdmi);
 }
 
+static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
+			       size_t len)
+{
+	struct dw_hdmi_i2s_audio_data *audio = data;
+
+	memcpy(buf, audio->eld, min_t(size_t, MAX_ELD_BYTES, len));
+	return 0;
+}
+
 static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
 				  struct device_node *endpoint)
 {
@@ -144,6 +154,7 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
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
