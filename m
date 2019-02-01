Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BA2C282DA
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9F2218AC
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YmXrIh2e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zvcNuf5P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9F2218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DMQGPe4HaHihKRJtu0IRwyKHHHyCFNpr2yrc8pbr9KU=; b=YmXrIh2eUMyBs6ATy3MBDgVwZj
	ELZfm5M3pLyu6AJjlHRBszY9xLYmgZcYI3thcHqH5yGNypiFBv39KMn6t2w29VhMJbuaWP+Cg/CHc
	Y0jgTPs1JN0hHxMeGflIW6KijH47YmplkhMuwwXzt8m1D/ZeUsHQSPsMOMK+eAp3Bs9111jFlVDIt
	OMLbmwavEpu9nrOcGCi3a3EfMgXENt01e0rcpKEpzUHpM6GkTkuUD79GoxAyBywpuapuJqVwq2eMh
	vfjjmSkPOKLsVZ8Ih+0hsEXl7BKMBXjKvBCsNgjLcJItFy0jeBq1q7i+MKIpB776W6uivVb1+tPiH
	5LlkdFhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpXcF-0007j3-03; Fri, 01 Feb 2019 12:08:15 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpXc6-0007XY-M3
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:08:10 +0000
Received: by mail-wr1-x442.google.com with SMTP id l9so6766391wrt.13
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HQOoUB0rgLtmYotjEraQRM2tqr+yR8VV5kceQJyYLDI=;
 b=zvcNuf5Prmwt7s9u71yqsqADM+sILJuGe6MILPhv/QoYcaFDNMa9bjFyNLI5L/XOv1
 2kMoTVUwSlRBUEsoN53Izcdt5U/EECacXaEURBWwv3kJnQQBvLl9QvYCUt0Je5F7xS/h
 9enbFDmqnFJxiouy7N9iPLK1Gtll4IZsNN4keuiG6Q5KHT95fXC3xHjO+Tl387hyFI+l
 44O2pBRhsLsKT9ZL9s+tm/8QyksRduRXkxPJGmtHOmGjFQNzVUpm8RZdKuqxItqseiYO
 6sZNB7okRaw5BAV8zz7217h+sjkQPQXYsmkBdw41J+xwPRpXuF8+kgP2mHlmrg3GHtbi
 xANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HQOoUB0rgLtmYotjEraQRM2tqr+yR8VV5kceQJyYLDI=;
 b=k/zZF+OHrvevVooWMz7Jlio1p4kxpomZ55u0nb5oVQHN7yBtzsSmBQvEaw9aNZaQ3W
 nrZdnnoK7/lEOXf9k/Vwfgla6CpWririRF95Qqi8CSCCu88xGM9uoQs7PMe8NJX7zILV
 3g1xHiPaXTED/5nI0hAH26Ijdj4vBLr9FSnS3W6N+2KY8g5RjLR3zK4bSyiRJUXhrZ7f
 Zc8uT/Bc+8OYeYqbfUcUoVmCJDobP1KIwH2OjCZsuceMi05dHb4cUd7IqphySy6QT4xA
 r7FHP/Jw/LCfngVNIrkQDY0WzSqQAhHtOgV1wHgBvRxZizd5cjsZVVEl69r3ZJ0mY8YE
 Ho9A==
X-Gm-Message-State: AJcUukeEEeeycc+DrSH2g95vjMkHYRKWmcGvJvSheCXw8SMoQUT3Ww0Q
 KPlv7+benXrj/7W+1iAY7xL++A==
X-Google-Smtp-Source: ALg8bN6W6UUSJgBgN8zNCuHul8qB4MBOiy7g3LviRj/8/vg/TkfEZrq1xKdupKqZnIdk3MzmrTQ0jQ==
X-Received: by 2002:adf:b102:: with SMTP id l2mr37076933wra.296.1549022884854; 
 Fri, 01 Feb 2019 04:08:04 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.gmail.com with ESMTPSA id m13sm2577103wmd.6.2019.02.01.04.08.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Feb 2019 04:08:03 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 p.zabel@pengutronix.de, Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 maxime.ripard@bootlin.com
Subject: [PATCH v2 8/8] drm/meson: Output in YUV444 if sink supports it
Date: Fri,  1 Feb 2019 12:07:53 +0000
Message-Id: <1549022873-40549-9-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
References: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_040807_079037_09B9347B 
X-CRM114-Status: GOOD (  11.76  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

With the YUV420 handling, we can dynamically setup the HDMI output
pixel format depending on the mode and connector info.
So now, we can output in YUV444, which is the native video pipeline
format, directly to the HDMI Sink if it's supported without
necessarily involving the HDMI Controller CSC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 540971a..69f9b2a 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -664,7 +664,10 @@ static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		dw_hdmi->output_bus_format = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
 	} else {
 		dw_hdmi->input_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
-		dw_hdmi->output_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+			dw_hdmi->output_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
+		else
+			dw_hdmi->output_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	}
 
 	return 0;
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
