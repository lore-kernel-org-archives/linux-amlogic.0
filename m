Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238E3C31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 12:12:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD6B208CA
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 12:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rU1X8wKN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1g9KtaZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD6B208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kbZkPUxPyUR7cxkrA3d1ZFIKDDEKI59bKzdiR55eE1Y=; b=rU1X8wKNAawg12
	3LvIz34DD+7SsziJqKa9cqgnmdzuEsHMiHO7pcdtS97wZPfAlFH8lN+JGkjxDSOuoEOHu2PSUYZL+
	c8avsbrlRXcxPTx8esKvWZXF9ffi3cK/MS4mT05DDsVXyMpOZDIQtPBlSar5hvok0e1RQVYeuYF3t
	MgfPJ9cxsMEHyFP961i2bnZPYIuKe8htrv81hclPI67DpKTARIUiuOrWY0JTxcLVSzStOod/N5wBh
	wWoBjf/iuiBt+KuKBmKdIVoRwJKwY67n1Djp+Nq+Z5ofytCFZTzGi9YPfKYmgTi/CvEcYuqm65BAh
	hcJeFpb3K3+GT35qf9wQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbOaV-00042G-Fw; Thu, 13 Jun 2019 12:12:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbOaS-00041h-OZ
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 12:12:14 +0000
Received: by mail-wm1-x344.google.com with SMTP id h19so6487311wme.0
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 05:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dxPAopxGigXChNe4VdO4Ubt5YTdhDcINUQzBTzEvzKk=;
 b=1g9KtaZe/+oTpytYwjZO6yBksvr6Iq1cGRxviJuU4NBlxHLTidBtC8fZ57YYsFdFl+
 xtC/aJBuwSN8BisYBx12l/oSJCZy7DIfRqBrq+rpXCGdLCHTxhXFvTmCBtsk8MkI0aAH
 6cChkYFKuHDiK7vinsQXX8B77oajTNHf6lWZJtc6spSEy9LQwmt38ohVGTwWglgjLY4J
 TI3fiUKEsldOjiU9UYzkJmmmskIlq62uhE+mgxWk7wo5ewSljqAyBDENmsZDwvEarMf1
 Mm0rEg0jEZtrwu7KfJ3heI5gmwlBnVyzf4HJO+Q7c9n41FDukqeJvEKo0oefEd/bXC1n
 Yvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dxPAopxGigXChNe4VdO4Ubt5YTdhDcINUQzBTzEvzKk=;
 b=N4qZRhV2/UnuLKNOqBLtbM3OjG3qSeyV9gKtpeIEO6p6x8EHUULBVK+NUfP6kVdFW1
 7TRB6GJVF7IEL5zjq2ChUebv1czxpBqvMw71r2c+tEyKI48VQ+H6/enia8SOY8jlVvDP
 E1KHzMssiqHR3CbSXnBje9BJEiXwuM3O3xh5IMOrrvnQkOV3g27Kkoep3LT6KENWgbw3
 Q0kEumG/t9tkZfQLxSTDvbcLD+LBKF0cNWXcN0abUERP4nXLSF3v/fTGPE4gBkrw8UT7
 fFUFI1zBMuhjHbaA8B2oPjgMr6JBJ4MTUz9wycg0rUSGltwjlkCgsz0OkHYHJzmRr6iB
 vxhA==
X-Gm-Message-State: APjAAAV12IMF6/WXR54W48LHOjPiwIkODE87fLIF/cN2qJR0duH1EJic
 7YAagbs7BIMCY43tyDk55Xagf0UmNKw=
X-Google-Smtp-Source: APXvYqxnPKLSaS0xc8+5oGeF/I6OTATx59AZvwhfSt3I2nQvb+XqlMcdxs+3C8O2o5Llg/zX03VARw==
X-Received: by 2002:a7b:c344:: with SMTP id l4mr3450592wmj.25.1560427931387;
 Thu, 13 Jun 2019 05:12:11 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f6sm2974532wrw.68.2019.06.13.05.12.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 05:12:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: dw-hdmi-i2s: support more i2s format
Date: Thu, 13 Jun 2019 14:12:07 +0200
Message-Id: <20190613121207.12185-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_051212_817943_A2EF02E6 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The dw-hdmi-i2s supports more formats than just regular i2s.
Add support for left justified, right justified and dsp modes
A and B.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Tested on the Amlogic arm64 meson-g12a-sei510 with i2s, left_j, dsp_a
 and dsp_b. right_j is not supported by this platform.

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
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
