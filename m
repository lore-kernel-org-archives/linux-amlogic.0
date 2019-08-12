Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE0EC31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 702F8214C6
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ju4dYDV3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rDwjvizq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 702F8214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuLWY3dpDlL+OjlMpAEczRFX08xsyvMhTrncpAzR+zc=; b=ju4dYDV39/Yyhe
	xDroiL2Lo6T8gYk9Lawj8h1pbQn2JZBIsTozT+suzSeSRnIQEYhp8hCfznfkr9hY/l4r858N8fA+M
	aKjKM1vrPs1XnMjeSsc/I93aaU15ZnTsUXsEVVETLv72zkLQz7h6KFtmHKVkjR24ubVDcTAnEAUgr
	R8iK+SXjROjSY1v129qzZoZfTyrgGAURDJiJDiWtqkjFjVqWhysEJ/vMCJX8ZMHnZr4oybi59zsKm
	inCbB+WipMsmLpkhcOmEGIf/pjIDZItrrYtgY7YfxkGErtvbbJut7ctCEyzhdFoMFjE+fH7CiiwlO
	NnfJp8HXVlVoi2K83ebg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx978-0006rb-Vu; Mon, 12 Aug 2019 12:07:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx96u-0006cP-LU
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:07:38 +0000
Received: by mail-wm1-x342.google.com with SMTP id 207so11932530wma.1
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+7rNGhftPAm98gxQzspW2Bl38AWTm/sVwK1bJUwi+9s=;
 b=rDwjvizqSw6Jz6AkOORykYkiAVItW36h9yIqrSC6nXnNDmDCRZtcTAJJCA4PBosGnH
 udRGdq/OsG7HCT1oFBaXuW0dQ6f9+s4m2z+tnI96mdsZGFqBYABurZMO8EQtvQgJOsWG
 ZuPZy9FPI8wgr5HIADP9ult6InbBe4KL1ExExYGEU96fwU9dimdR6xtIHI9XAhqE3YvC
 fSlYBsOBJdwSPg5xqueM2fiMOQD/huROetdJhaDMeb5qjgGVvpTUq98oh0/ytyf5dl9C
 +i2+2g+Mu+TW0YXap8l1FGYxX7g7ietxEAmQtKO9SlSKPgGROCnAuQQKJm1wJBCUncWw
 UN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+7rNGhftPAm98gxQzspW2Bl38AWTm/sVwK1bJUwi+9s=;
 b=Y5NKmfIf3GRcp4UeAwW5yGqlTRZx0u3aOqE5GxsgPEBDCYtTkqJoJpB9Yl3ngmfVsD
 QVf3yicnAA9K+PAiRIMJKOUb3GsguyTeVCTPH0i8CuT4nw76L+iX4w1y1fXeCad/wlJ3
 pwYk88JdNaSsLPJOoMk01uZrqaqMn/O6o338DSawfLv0axj/EVxr9dQN/ZrEqnYu4pKS
 Afyx7MUG516I98nuKy6wZp6BmTtyYZNo/VC2kypo5+4UAZZhnFma2RomCnVu1Xd7yE2e
 ZpNWPHNckYoWhdQ4/O6Q+IBlx2dq1mr/xBqLNd1ei9vhhtNatVh7qDFm805FcIK0xLKz
 cj6w==
X-Gm-Message-State: APjAAAV97RN/Mpb3ikHkngI09aNtOyvnrowQXtt4aBgGFAliRS71Ev1p
 xYVuG5z3LMQS3uMlEMUMci1EZ1NJqqg=
X-Google-Smtp-Source: APXvYqzfPZVz7gWpdlttsi/wKeTKZdYi6SBdhAvNGLWGXbHVP91D0/y3OiVgUj4sWE1/dLgWfQri7w==
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr28067454wmf.176.1565611655458; 
 Mon, 12 Aug 2019 05:07:35 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 6/8] drm/bridge: dw-hdmi-i2s: reset audio fifo before
 applying new params
Date: Mon, 12 Aug 2019 14:07:24 +0200
Message-Id: <20190812120726.1528-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_050736_712821_BDACEE95 
X-CRM114-Status: GOOD (  12.26  )
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

When changing the audio hw params, reset the audio fifo to make sure
any old remaining data is flushed.

The databook mentions that such reset should be followed by a reset of
the i2s block to make sure the samples stay aligned

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 6 ++++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h           | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 0864dee8d180..41bee0099578 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -49,6 +49,10 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 		return -EINVAL;
 	}
 
+	/* Reset the FIFOs before applying new params */
+	hdmi_write(audio, HDMI_AUD_CONF0_SW_RESET, HDMI_AUD_CONF0);
+	hdmi_write(audio, (u8)~HDMI_MC_SWRSTZ_I2SSWRST_REQ, HDMI_MC_SWRSTZ);
+
 	inputclkfs	= HDMI_AUD_INPUTCLKFS_64FS;
 	conf0		= HDMI_AUD_CONF0_I2S_ALL_ENABLE;
 
@@ -102,8 +106,6 @@ static void dw_hdmi_i2s_audio_shutdown(struct device *dev, void *data)
 	struct dw_hdmi *hdmi = audio->hdmi;
 
 	dw_hdmi_audio_disable(hdmi);
-
-	hdmi_write(audio, HDMI_AUD_CONF0_SW_RESET, HDMI_AUD_CONF0);
 }
 
 static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 091d7c28aa17..a272fa393ae6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -940,6 +940,7 @@ enum {
 	HDMI_MC_CLKDIS_PIXELCLK_DISABLE = 0x1,
 
 /* MC_SWRSTZ field values */
+	HDMI_MC_SWRSTZ_I2SSWRST_REQ = 0x08,
 	HDMI_MC_SWRSTZ_TMDSSWRST_REQ = 0x02,
 
 /* MC_FLOWCTRL field values */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
