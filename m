Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1716C32750
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B689A214C6
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UBX9ER/Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JCgKaHji"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B689A214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZWadmSIfxk+g+68bR10LzeNexTNOY4HrmQM59VkPLs=; b=UBX9ER/ZwWErLf
	d3ZWcmM4P2FVEv2zawT5XYKeO+rSN7jv6T2xrcD0uTgx5YsU5u4KBwYYlThsTe9/hqWyoQEXwIW1B
	LnegCOeVW2QNTdmmKNqwHrs8wtQhtuQ4cAIuTY2cE858ukDVjBcQ5fMCG1Sl1JcADe4uAgV2Yf6Zr
	9r6v8L37Sw/BsXlrO11J3EkfNUhMUggZriYPA25l3JDLS90KQEszxHECHZ9exYX3hVJ/LxZ3IbsDQ
	kUxqbzOpuEiPQ3cw1pwmeiJ6erdU9FwQFi8HWLeX7prJ7AZ1LzDtxvTS3TodFn94UFaiqX+g/lbwz
	XdPiMfMkPq7HJ2MiyyVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx97G-0006zC-0d; Mon, 12 Aug 2019 12:07:58 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx96w-0006db-Di
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:07:39 +0000
Received: by mail-wm1-x342.google.com with SMTP id l2so11550426wmg.0
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc9/cSBhIwTuXPvQDL6txYFXAJblot8ynaeVI0KB+kI=;
 b=JCgKaHjiK9nXytoYeRJc1oNQnDr/iTA4L8Cs/nMSQTvwrHCjI8V6q/fMKElW1iq4kH
 QVfNygjYCJLIR2X+73dkH1YWR5jd4IZKoHby+j8qpmF4XhZajY4Kjk0JETHWN8nefT3I
 BfO806OgbneAJNQFFiN1knQc1xLRpBUENeHPFywv44hICM1gob6lINnEr6lMqhzVnZI0
 45ko6hz6x7sRZ4R5nYlMEf5MlYQPrQ0o3lAqjqwFZ8KdHKkua1sCJd0NOmLrjZP+qAlF
 e2qBWgoDEBeqiW5bZLuERfieGV41O7+oENtJiTUejXx6Sj1XEVjw8F1jz4H8xldgpDiF
 UFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc9/cSBhIwTuXPvQDL6txYFXAJblot8ynaeVI0KB+kI=;
 b=mRGBuKREt4mQ9rAuwSnWd33Az1Cfu52snfcXSbxSCcBF8auAXjuBC90ZiUMkG86/Gw
 sBjy24sc0nymyuIuZGw5p0oUHRbqf25jm9z3gPWedUxj2wUrF1yyAeADtPRWb3DrXJqi
 d4Fr+/ryJ/geslEfMkOgEiZEno9/bLQ2VJo87K8xPiCoMZpel19nMxQUcy9XHo5PkU3x
 +916vBxUUAtlVN0KItffLuurPOgI02Kr7R9NwfFLKeXO1nc2wIe16IuUSNKzEBTsrMzd
 Du8tVNVqFKTsVKT9xlPeNj5hF6b8N8P0Ify2tVJTZGo2/ypL2OZEna5EpfO8tjU6O0Pf
 fCkQ==
X-Gm-Message-State: APjAAAV486JkjOAWR5hFe0v6om7IgnyBJI1TTyR0GmKX2KMN7XXwViU/
 z2zfFkQAoZBrC/RpGyufQYmZeQ==
X-Google-Smtp-Source: APXvYqyA8FXUTAV5OWQlM4IOpnMuM4a1amICXKUVnbBgBqhQLoLXQVYGeXcaLrL4ghbO8MhHX2OFhw==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr28033074wmg.111.1565611657147; 
 Mon, 12 Aug 2019 05:07:37 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld support
Date: Mon, 12 Aug 2019 14:07:26 +0200
Message-Id: <20190812120726.1528-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_050738_545923_EA8DE200 
X-CRM114-Status: GOOD (  12.15  )
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
index b8ece9c1ba2c..62e737b81462 100644
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
+	memcpy(buf, audio->eld, min(sizeof(MAX_ELD_BYTES), len));
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
