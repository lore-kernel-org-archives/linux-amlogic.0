Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD71BC0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0ED2087B
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGkyUXtW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MHoStDTo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0ED2087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwPKTFgI/F3xvhlVgIH5Er8C1CF1vS/17yWVZu1A72w=; b=QGkyUXtWjF1z+V
	feYuBK/no0QMM7f5vqweyN0jL94zbCrDdJJ5bk7/BXVFDMm/60Q4msf5Tj/r/b2u5cfqAm+6+41xp
	uiHQ9W9Fd/5FwaVcBgEo+VixHUMJkYGyIBhtmXWlbUUnWEfiRWd1zTvRmlhB0q/1qR8RVhnI65bom
	HoLRniRB46C1m/5Zs4APk8GJCfOyU2qwaMluosB8Vxvef1RitD9IwF3Uh4nbll0wZdqanEekZR1CL
	rtZQdPxjkfp0WAjP5l0Qypn6TuZuiA8Ve1UID8vCOkO0Sy2suQiqA34iOH+AxU0bZRlfSjcnQiQCA
	tcUHmwvzWSCMdG0kSNWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudEe-0000at-1B; Mon, 05 Aug 2019 13:41:12 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudEa-0000Yw-G8
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:41:09 +0000
Received: by mail-wr1-x441.google.com with SMTP id x1so34567080wrr.9
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u7zeWErMdF5cDye5AhvTdnoHNJxxvxbr+2y5SRXygFM=;
 b=MHoStDToM0MdRmsreIsrkeHnl7ndApf5lYedJ3xZjob55uO1i43CLbVtuy8Iw08zxr
 EknOi1kG8YM26xXqhhZoANy1raTNxAnyNlz3ph0LLBGST5tWhZunQGwVh2P7PEUEwrB4
 w0HpoRCOV9knHIeJE35dlTeS72WUbACmEmW2Rc/cs7t9/KJscpct8svpiL6Uu8zjY9qj
 aNo+XFlfYl74BGc7P0mqMgdWhE2TkAOHZkBh9Xd/zwll8OyAFl28UrV3+9YKjeLObjGE
 l/3pkF5SHP6NCe4NG7CA54wAyMhjYmd/PhifrTXP54ETaQZaqnah1YmO6Ji4J+lCSe7T
 qn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u7zeWErMdF5cDye5AhvTdnoHNJxxvxbr+2y5SRXygFM=;
 b=KSfjHClZv8wC0U2L6SBZuD/M4487RZpIY16axEGG1S6AWAg4NIcIfaQKU0ZuZVgj3Z
 +UM7MfcHtCaiSevt72vu+mhdyoVggX/EUNl2C9cK8DL/GCRJmFyb0PUDh7rg9olgKr+K
 SqbFWiqmC9aSbiFwPhFIIcuQRyzVukX7CtEHYHywy89a4KuSKmkM+3ur8hzCwGXDT3aI
 7qFYxp0QH8tqz0GmhRlgnsn1j4EVW240QOGTyfUchpmUViZpiH6BNmmBXsOaahdgUfK2
 4bYDfndHutU7aIpsdA+1fQPdnzPKBLSXbLB3vD1E7W0wDClqcuwaHi8L4X5c2jlkbzct
 gKyA==
X-Gm-Message-State: APjAAAVbz9A/O66AE6o1LG19F9bRJ942uxg0gg8tJAS0DYZls/bQSpaj
 ZiGPOstnIWs+YJN50Sk+8AnNTQ==
X-Google-Smtp-Source: APXvYqxG5de8oOGia6/RKX4BDBfFqrUciyIWbE/cUEFUzhPAcqXB/v97uk9srpVF1S7gz9QbWrzicA==
X-Received: by 2002:adf:e84a:: with SMTP id d10mr25698441wrn.316.1565012467143; 
 Mon, 05 Aug 2019 06:41:07 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/8] drm/bridge: dw-hdmi-i2s: support more i2s format
Date: Mon,  5 Aug 2019 15:40:55 +0200
Message-Id: <20190805134102.24173-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064108_534251_8ECB4A5F 
X-CRM114-Status: GOOD (  12.27  )
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

The dw-hdmi-i2s supports more formats than just regular i2s.
Add support for left justified, right justified and dsp modes
A and B.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 26 ++++++++++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     |  6 +++--
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 5cbb71a866d5..2b624cff541d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -44,9 +44,8 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	u8 inputclkfs = 0;
 
 	/* it cares I2S only */
-	if ((fmt->fmt != HDMI_I2S) ||
-	    (fmt->bit_clk_master | fmt->frame_clk_master)) {
-		dev_err(dev, "unsupported format/settings\n");
+	if (fmt->bit_clk_master | fmt->frame_clk_master) {
+		dev_err(dev, "unsupported clock settings\n");
 		return -EINVAL;
 	}
 
@@ -63,6 +62,27 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 		break;
 	}
 
+	switch (fmt->fmt) {
+	case HDMI_I2S:
+		conf1 |= HDMI_AUD_CONF1_MODE_I2S;
+		break;
+	case HDMI_RIGHT_J:
+		conf1 |= HDMI_AUD_CONF1_MODE_RIGHT_J;
+		break;
+	case HDMI_LEFT_J:
+		conf1 |= HDMI_AUD_CONF1_MODE_LEFT_J;
+		break;
+	case HDMI_DSP_A:
+		conf1 |= HDMI_AUD_CONF1_MODE_BURST_1;
+		break;
+	case HDMI_DSP_B:
+		conf1 |= HDMI_AUD_CONF1_MODE_BURST_2;
+		break;
+	default:
+		dev_err(dev, "unsupported format\n");
+		return -EINVAL;
+	}
+
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
 
 	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 4e3ec09d3ca4..091d7c28aa17 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -869,8 +869,10 @@ enum {
 
 /* AUD_CONF1 field values */
 	HDMI_AUD_CONF1_MODE_I2S = 0x00,
-	HDMI_AUD_CONF1_MODE_RIGHT_J = 0x02,
-	HDMI_AUD_CONF1_MODE_LEFT_J = 0x04,
+	HDMI_AUD_CONF1_MODE_RIGHT_J = 0x20,
+	HDMI_AUD_CONF1_MODE_LEFT_J = 0x40,
+	HDMI_AUD_CONF1_MODE_BURST_1 = 0x60,
+	HDMI_AUD_CONF1_MODE_BURST_2 = 0x80,
 	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
 	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
