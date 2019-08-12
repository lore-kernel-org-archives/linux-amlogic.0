Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D743EC31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A792F214C6
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/YNY2iT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="daHHObEV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A792F214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vY33ADAkjl/7g5wru6xxXnc88v8Mcr7v81zC4/R8ak=; b=K/YNY2iTVAexN5
	ghxwigikiH5+trYdgHhyYT0xVxNh0M9KMbIt/GJoMpb1iaaaDn+H8epBlyPlFHFgo7m5K49RnMGq5
	CWydLscS9b1epv4OQceW5vzuhi1SJMX/MRkh1KFZOy5ucrD5ud22iy3IAPTdMDHP8Go+acz+/aTVu
	TJlvXe0IcrUrI8xGo5y/bM9zNrJkXFkIm4kBvbKZj5C+CMa7HGnBuzXCsR3L5Fbp6HsWxiwv01h+0
	1NuMasPcU4CiKhQtEMBeI01jMZiBH0WPM9i99Z5qenVSEoo6IBvZbqef84hD8MKSK1l2VGjg8PJR6
	nHjfkyUaHiHtp6b35VHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx97C-0006uv-MM; Mon, 12 Aug 2019 12:07:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx96v-0006dB-JW
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:07:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id l2so11550372wmg.0
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nyk3iRwUiWOF3HR8AgEI8oTD0AAO9L4Qd9ulSVgUQuc=;
 b=daHHObEVwiPB5m8eB3TinS4M9hhoYOX7OGD3cCnIcEdu8mEBbC2sxvbHgwNQgNQaGl
 e+ADZVLpFJLcl5mKHLragQdiafg85cuqpCUuGO05kZO+gqWvdMosoWdf76Lir6wDtR+G
 wnM/evLYE5mIEGNMDuMjreFZbxAt2EM/BzD4bWna14viPvYztIKdPE8Jjk2RtbvecAiH
 +vTiUF5wWddKT/m+Wal8DQpROpSVRSZ7RWDQLYKJ0cneQ7GBQEZGV/d/J3AAidyIBRzk
 kxtw4nWL8qMqRra9ftu6k3t/ezDcKlv0PBbJUX4418BaYieMPY6X3fasAC7Y3ddZnMCg
 N1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nyk3iRwUiWOF3HR8AgEI8oTD0AAO9L4Qd9ulSVgUQuc=;
 b=hDmktURmG/ypVNMBoANQy4N/PUUrzRm/K8eSEJAVjzMvQd4QIxKq6dvdjKerSv2x0s
 MlGRDz2h9DF0+8UT+3lgk3nYtdSGZaZIJiDkEmaSDKJFUN8RkushkF5kczk9Yq6uJ7z+
 0LSm+EkoJF1TNKlc/YlZ5pWttQ2LXZzgsKD+uogTFabJzdPa2cG+luhBhpDCWekcIZoc
 HyD9wNZti3WLuecC6WzqfQl6UtEuHNjfEO6E6dXZgZd1rOVGA3SIsK2S3pfsGuUKbr0+
 ss4qazuGmU4i7b96DMBUmj7aIWH8Kydwe7TQax+IMLo+mkA6J5D7dlRXEDx41TCn7paw
 4R1g==
X-Gm-Message-State: APjAAAUNSGkN/0tFuNfx5pzfH9Q4U43lM51GXImYxYctaoxy0XQnhF/F
 Bkq9/Gi2oHQ+2lhstMXFsXNysw==
X-Google-Smtp-Source: APXvYqwZVxC6uqEmw1OcoTKuej0fydwIHFvl7lI/fxWxv8zWW97aQe6c/fxAXhNOvT0IR2pM7GDSRA==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr26440820wmc.175.1565611656356; 
 Mon, 12 Aug 2019 05:07:36 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 7/8] drm/bridge: dw-hdmi-i2s: enable only the required i2s
 lanes
Date: Mon, 12 Aug 2019 14:07:25 +0200
Message-Id: <20190812120726.1528-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_050737_862417_D3385464 
X-CRM114-Status: GOOD (  10.55  )
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

Enable the i2s lanes depending on the number of channel in the stream

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 15 ++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h         |  6 +++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 41bee0099578..b8ece9c1ba2c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -54,7 +54,20 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	hdmi_write(audio, (u8)~HDMI_MC_SWRSTZ_I2SSWRST_REQ, HDMI_MC_SWRSTZ);
 
 	inputclkfs	= HDMI_AUD_INPUTCLKFS_64FS;
-	conf0		= HDMI_AUD_CONF0_I2S_ALL_ENABLE;
+	conf0		= (HDMI_AUD_CONF0_I2S_SELECT | HDMI_AUD_CONF0_I2S_EN0);
+
+	/* Enable the required i2s lanes */
+	switch (hparms->channels) {
+	case 7 ... 8:
+		conf0 |= HDMI_AUD_CONF0_I2S_EN3;
+		/* Fall-thru */
+	case 5 ... 6:
+		conf0 |= HDMI_AUD_CONF0_I2S_EN2;
+		/* Fall-thru */
+	case 3 ... 4:
+		conf0 |= HDMI_AUD_CONF0_I2S_EN1;
+		/* Fall-thru */
+	}
 
 	switch (hparms->sample_width) {
 	case 16:
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index a272fa393ae6..6988f12d89d9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -865,7 +865,11 @@ enum {
 
 /* AUD_CONF0 field values */
 	HDMI_AUD_CONF0_SW_RESET = 0x80,
-	HDMI_AUD_CONF0_I2S_ALL_ENABLE = 0x2F,
+	HDMI_AUD_CONF0_I2S_SELECT = 0x20,
+	HDMI_AUD_CONF0_I2S_EN3 = 0x08,
+	HDMI_AUD_CONF0_I2S_EN2 = 0x04,
+	HDMI_AUD_CONF0_I2S_EN1 = 0x02,
+	HDMI_AUD_CONF0_I2S_EN0 = 0x01,
 
 /* AUD_CONF1 field values */
 	HDMI_AUD_CONF1_MODE_I2S = 0x00,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
