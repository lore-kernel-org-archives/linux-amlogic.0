Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF582C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FF420880
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eOYwh+qF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NNOrlaFb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1FF420880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljp2l7Bprum12C6iYvzjCl6V2u1HPXlYQCfHgjDP8J8=; b=eOYwh+qFlDug/S
	FA7akrFrZaMKX2DmW5d+L1IxNtIVeeoyGHT8v2g79OltoiBjjefAJYPBhBayxnXhOwZLLtswV13XK
	lx0Ge6dWF6ctuVaIQEuExFTmqvFsGqSb91Uaw8MgEsYXB4NForqeYPpZQoDGJww1bkAwM4cBZyzH6
	NgGSen5YVLOTtpSAx6UjV5XFCJNnJJIPDTEFb+PA1ayQCG5aTA11VQ+hNDfkWIO4cQbPAws3xhvur
	ZKbPwn8UTKqe3cX+Zdqi9ToZu/EF42+FMnN7k/xdZol+mFocteQ9shlPfRz7xmpxIbBYH/RaIJM2X
	eMX1J0vhlWSTWMqf40TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudEp-0000sM-QO; Mon, 05 Aug 2019 13:41:23 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudEh-0000ei-C1
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:41:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id r1so84424838wrl.7
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ey1PsfmA4wlAavqiJpE2shxdYitiWZIgciri4C4xXGA=;
 b=NNOrlaFbC6G9Tou31NekV1Ouhhn/xSj9Bsy90P1UEbm9ZP4Ce+OUczmhiGXI1ortyf
 2+rUNATxBIW1waSope2cT9bIGUYin4pyBuxmnAHJfu6Vjv5a2XuaMSLVfG3efjSrQMvL
 X+3Pi9ZFuqSeRI1KjrdTuTuEU7uVgp1WkeHlEjloWwne4xg3mV0ntH30tYf0c0H+kT79
 PTNP2fCK79k7vGVZ5DLBrnkGQ51nMN/pqEpOkFJAa6odkJFZey9yrmS56oooI7KhcrpO
 EgafSUEQpDbkkZkIXzJBd2wOsG/3Hwx2wFOw5DwpDWZRjOuMuA4jfAB8FFpHUaKb66L3
 Wmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ey1PsfmA4wlAavqiJpE2shxdYitiWZIgciri4C4xXGA=;
 b=BIPmuipi9lTBFjTou35hL44QFKtVVfykaTWvPqtt/kJIOg2veKV/4VlTyQy3Fzq+o7
 y7Fs1F3ZeIP/uM9guioMUVl2Ln/cdCP4IhhpY/tuhl5l2Q410Ol0nIPxkY9BPLWlg/ak
 PObCn2k+Za4ZY7JdQiIWMPWVo276xav9c595RdRl3/XMiAJBhVylA08IHdFPBsI6vFz2
 87Rsv7eCOvRixbwKQzVsuvziR5jMNNSi8p2ex/hP7MKlzlAsi4ZMy5M/nWDxfvPRTWv8
 Xp7ae3mjNreW5tdNyR8bHSay6XjWQCpS2ZgCwcvob8QjeNzUZEq3UqjrFpvHJ2oWhLgc
 Q5YA==
X-Gm-Message-State: APjAAAVIzAt3Pm4eYNxeMP/SbmBRmQTslt/In+FYMxJRvQRO8IWRGXVz
 iLtIoRNzXxc9fhFTTVRsRBTTwg==
X-Google-Smtp-Source: APXvYqzQEmYNNKdpwB70iG2hSugrGTyqUNs6qvvdcYTcpEwkg8EPnq7u5XMWR9ACmgixbvAgeKBGug==
X-Received: by 2002:a5d:514f:: with SMTP id u15mr16161947wrt.183.1565012473623; 
 Mon, 05 Aug 2019 06:41:13 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 7/8] drm/bridge: dw-hdmi-i2s: enable only the required i2s
 lanes
Date: Mon,  5 Aug 2019 15:41:01 +0200
Message-Id: <20190805134102.24173-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064115_511741_3B50CE9C 
X-CRM114-Status: GOOD (  10.90  )
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

Cc: Jonas Karlman <jonas@kwiboo.se>
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
