Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E08C32750
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FAF7214C6
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YqS/4V3/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="L/jjE0Z+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FAF7214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Rn8Ep+AorK8vz2om6k/HU2JwLYd3n6TquoCvCAacqs=; b=YqS/4V3/aB3WhG
	j/2v9ZGiR17w/Ka5hvZunYRzN1SwHuw0IIrF7zQvWiPXhpSbCaqaAg6JHH3BMuskMbKKU/WeN40HM
	1LRWrF6xr61p6pPoE8AgKHxCzgBousJQvTPgJQrPf7iOw64pkhqJgkwwjJhKaXzDEK11cDFZ4ywjQ
	N1CGGFNdkbzwnxje0X/XJwxMcvs4iMVaz+OTqZVwnc+pPKFXI+SEctlmT0GRxC4+60hwKkS8R/gWx
	1D5fdcLjrF1QIQaDuTVeq0z/S2TMA0zFf/IUcz7oQJSUeHxKP17Wot2R88MJqhFZtD0lWU++DeDFS
	m5t7LTaBIejhHLWC6oDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx976-0006pP-3x; Mon, 12 Aug 2019 12:07:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx96u-0006bz-CG
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:07:37 +0000
Received: by mail-wm1-x342.google.com with SMTP id s3so11934282wms.2
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dBAKQK2TWb6YSZRcSfCJBhSpAFaSf3bVHWGaQNvZ07Y=;
 b=L/jjE0Z+uh9feCmkguYc7tOOBvXTJ2DTkbUR4kDzZ6isTnRr7TZDjGDEF6mDLN8STZ
 3GZGeVOI/dBYGZa6vyrOZB8Dj6VWwEAJR0uv1rxGJVEZvh9DW41NSo4aMra+MPz5b36A
 UFoTyytB4L/uzrZZdbjUV1mDHzMgHzpls39fSbcyuOrCahhcac5jv3fY+uyTA4nh4OXW
 qrzV7pQHNBFW3NqoZTG8Y1ns1WE5CEI7I5bgg+t2saPZdgk22y7ggPFf7dn3/HLwODVw
 PeX5EWRAKOrympN/IGlN4Qwt0NrARSKDvPGYJehhTQcksDpIWpcYJluUoUUbSfhndXbz
 dXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dBAKQK2TWb6YSZRcSfCJBhSpAFaSf3bVHWGaQNvZ07Y=;
 b=tU1vdIF/tL6A79dWdmEc6CdStNf9dLwaYDAmf0ZlD7vHHUXEqssM1y0Fi8vTN9w2EE
 OUdN8IZxzsytx8HAD5zoYkE2fqU3i094DjWu/0HhgeSj1fuq4uZsEPjq7PmGlB8FfBHo
 ABur4Bwkcb/TBvjZ60vNNAbaI601FAdrHDi00D+T1UezUYIAEmPHa3d+qByRsh3DwCVQ
 ryyEW3rwd3PTWN0q8mH1HpndNjLsvFhvgIK+TSJrYR13ZD9z9JoANR9bGV67aOpq2I4M
 Zn9ZdhQcSU7MGq1dsKb7AJIGmtBBacfSHHd2dFRdQqqp2xX5cMcDXGmiP0K3ksJJVeLG
 iODA==
X-Gm-Message-State: APjAAAUUfRasqDZ5x72bP1/yBxmE39I97rLW67hxvqUUuK//nerfmRS5
 eGMnhQQG5BlP/TOdZ6KTmlt4+w==
X-Google-Smtp-Source: APXvYqzfW3eeOX4MX+i/CqoB9uhQnpRtsA/vpMtmJNdTO6GoCfgbeP6QdCyPmPxK8IqalPIZIB0rSg==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr27445823wma.176.1565611654629; 
 Mon, 12 Aug 2019 05:07:34 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 5/8] drm/bridge: dw-hdmi-i2s: set the channel allocation
Date: Mon, 12 Aug 2019 14:07:23 +0200
Message-Id: <20190812120726.1528-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_050736_706281_FBE6865A 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

setup the channel allocation provided by the generic hdmi-codec driver

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index caf8aed78fea..0864dee8d180 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -85,6 +85,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
 	dw_hdmi_set_channel_count(hdmi, hparms->channels);
+	dw_hdmi_set_channel_allocation(hdmi, hparms->cea.channel_allocation);
 
 	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
 	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
