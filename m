Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C762C31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09E3C214C6
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLQT0pAj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mj7VPqoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09E3C214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htWYyPcr4Vhr3e2I9EC59EnrpJ1ZY0uE0PvKiC4LT7A=; b=CLQT0pAjE7Y4hU
	nJQFNqOFZus2PDKfbpY70oTRIwzBpsszXneMf4YZ4It52RDM0A5HuScS3TCDgjBX+ZIGAipjm8ppJ
	Kt74Q/PSFYar68NyqapJaRbIrUYB9RIcuPwnmg62Dl7nv9rRfaX2j5L+eIqsS+77ggdboCPpLNrty
	NZcaI16c+UPMlzEg6OWA5QsF1gPsw5hP04FcrKqaFWGg4cP2x01XrvWYBUZ968VDjuLkUg8p3GcLe
	USHldtjPnvaxhfHym6QhlB3gVA0LrCUF6OaTFwjhyaJ+dXTc6PxRBEbTlXRm0T31E8+UEByhZlRqr
	tpFjYU3DkR/SKwKc/P8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx973-0006mk-Px; Mon, 12 Aug 2019 12:07:45 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx96t-0006bX-0h
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:07:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id 207so11932473wma.1
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wxGGO+eJqHNHPL320ZApEdBEJuHkt1WmWaw3TLqcWg=;
 b=mj7VPqoP3QaypYZk5wdhlVro9KJGAVFvrtL+ktS1443PAbjOUKqGny5CD/pIW5bwl3
 By1MKtNas4S3X0b1lwcmcLVPc6255JAMYCn2iAraSMcyV4K1BbTH0G1SSb5cO4QVt+hD
 7bo0J0Rjcv/ydPYjs+WmXR64f7gXNpqVUx/3b6/+ynaviRLMmGPtlmvf6dyKfzSU3KPx
 yca4gQRCBh1PJ6440JPgr8bKQwOzWTbTmuRNmO1rdoCENmZzHLT6Wp2piNEN5PPokr0Q
 Kv9ujN38fe+RAP8cys4QHft3PyKqgD//+9PLkzVbz8jj/GxP+gsIN4pIpWPsAdxDKmtn
 WG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1wxGGO+eJqHNHPL320ZApEdBEJuHkt1WmWaw3TLqcWg=;
 b=VgWKaY09nMBFQ8LdLZo1GMGqZZNnaooG2u91pcP5/wW8rgHBsyxghArST0PTFkJFDt
 wWKrHZYldCbg417eR4YwqWDIB7kb5MjTgtqZppNwptFRiDJoZdx7nSoVp9tuN5dxiBLc
 /YVKpBWM/ehFy319nyZMcaXyx7D7Y9NBVnIAS0/MEzfWzfJRSm+1emKHbTJLK7coGDmJ
 vONBTNkVbmcClWuKKU9g8L1GwbwAicdKLbjSeapZdCndGLslhVGVqE3DcO64bygQlL+w
 fwyZF6Ib+Pl4AQwiVPMmCDUkDCJRSb/HV6GhggxU5X7+wEqYmF2Du+x/zNTBbwNSVsRL
 3sDw==
X-Gm-Message-State: APjAAAVzs/u+WkbmiHRccAO35JjjtoHEcUJQc32xKWPjJrLJS1jeuPqy
 gIc+O6tCMb0WhXW7Oiomz5P9iQ==
X-Google-Smtp-Source: APXvYqx9z2jQLFkDizV87BtrLYpHzdRxjWMpEtJKKyo9UUrpvSaOAgtLfuCnUIKtDmf5rpfXp8NLWA==
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr7473128wme.174.1565611653536; 
 Mon, 12 Aug 2019 05:07:33 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 4/8] drm/bridge: dw-hdmi-i2s: enable lpcm multi channels
Date: Mon, 12 Aug 2019 14:07:22 +0200
Message-Id: <20190812120726.1528-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_050735_086987_F34E6A45 
X-CRM114-Status: GOOD (  10.25  )
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

Properly setup the channel count and layout in dw-hdmi i2s driver so
we are not limited to 2 channels.

Also correct the maximum channel reported by the DAI from 6 to 8 ch

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 2b624cff541d..caf8aed78fea 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -84,6 +84,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	}
 
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
+	dw_hdmi_set_channel_count(hdmi, hparms->channels);
 
 	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
 	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
@@ -139,7 +140,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 
 	pdata.ops		= &dw_hdmi_i2s_ops;
 	pdata.i2s		= 1;
-	pdata.max_i2s_channels	= 6;
+	pdata.max_i2s_channels	= 8;
 	pdata.data		= audio;
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
