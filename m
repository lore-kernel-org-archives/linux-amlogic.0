Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52FCC2D0BF
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C2924650
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SkLQzVJq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="omVWiHXL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3C2924650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQo4sWsYnqeUQLUyp/YBByf+4mpEJjt4tg90c4Jg3QY=; b=SkLQzVJq7zSPYB
	DLP6fMyEjJeyeqXPK4431TkQSGEtlFNlqDyBg4w6Xzh0bA44DYqA9aC4LSYNLzLQB6agY0Kfc9yoz
	B02kSdt5HbNTgGv+x2NoYC0UaDOhypvB+3uCJmP7Jn0/wjaneakMkiNilpbWWLLEzg9gXRtWxnPaJ
	CZKkyzDQNPw2dPezP4KQ8UIczTKnfj7mAMPCeZ8+27968KBL/r6C9GyHwI+ZNX06zCPBsreCOdO2n
	H5G/1351QML31VtsXDi/HwNk2A+zldXYcQMxr1MTfNMP2sn3lZ5RRpSty3cMToex97mep+Np5VsVf
	ohF68dJAWAjOC0F9NBjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbXS-0008Kc-MA; Wed, 18 Dec 2019 15:47:02 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbXF-00083t-W6
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 15:46:51 +0000
Received: by mail-wm1-x344.google.com with SMTP id m24so2332464wmc.3
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 07:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BH6e3bahFkWBTjXwfWXdljOGokLAIKV+wnWDzABNP74=;
 b=omVWiHXLRaPV/ydWfQBU04NH95kIXEj2dP02jegjAK8kLmWE1KU9Sv2MygDYSmBgkL
 1ySn1Eg/LgD5mL9l+KRkxDFRz2gv953PmMSDRsrQBAo/F7O/W5q6KD0uoxxGGcDekonL
 DGuBsISgSk8tB2EIOvreCPHyC7I7P2x8fa387bjQ/3VKRFNOZAiMEsS/C6eYzEuAumNh
 veZmmKEcVuNhypTLKgeCF2HQS6he78ot8MfdB+D2QeKM2llpVOKFk4zo9P48fsL2C0QH
 4vv1KTfy0eq2bDMXcB9bWw0GHBf1bGZAh4xXpKb/nNhlCAHnJg0GhFwhYEFD3oNbHwA1
 Ul1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BH6e3bahFkWBTjXwfWXdljOGokLAIKV+wnWDzABNP74=;
 b=f6Ep0fNG7iJbDafLLMXjpcjIdgbvDGHF6vq4IG2XXoogZUUCgG6ninCtmDXP4x38cm
 sI2wFSOIkNAVK6GtHeFzG3OdyD0HHF7mPsyedmHhjKJUSnXZhWQKW5xPaDeTk7uF0LCB
 ZbkdlGt6v3hfsXM9TFCzPv11ldEUaz4eZOHNvQSfYBLz4rhsjq4ewJ111A58OHMp+abc
 ME4gaWlidceDN+MHscqkKeK8rdg8i8KB+D74zY+KIg99n/VJxZxpI4urWh7wIgtJZePA
 RLg17hef+JGZPLkGB//lGjQQHuK9kzeHLpKxG8Yx5smDV0ADnaupbMteK1374BKqKKvm
 +skw==
X-Gm-Message-State: APjAAAU62MBr/dNd5sDz6sSuqrx7MX+Wn3KXh2ML21+KeHi1cugS7Aow
 08otzCpTag2RgT9F3YgZflI1YA==
X-Google-Smtp-Source: APXvYqwiMmPBuwhf+2rWRor3F5AMIaAs7w/h+pInq8Kwk/3+4ZeaOmiz1xHepKTgUKges0nOG5L2Hw==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr4206960wmj.54.1576684008490; 
 Wed, 18 Dec 2019 07:46:48 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:47 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 08/10] drm/meson: venc: add support for YUV420 setup
Date: Wed, 18 Dec 2019 16:46:35 +0100
Message-Id: <20191218154637.17509-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_074650_059325_62F6ADA0 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds encoding support for the YUV420 output from the
Amlogic Meson SoCs Video Processing Unit to the HDMI Controller.

The YUV420 is obtained by generating a YUV444 pixel stream like
the classic HDMI display modes, but then the Video Encoder output
can be configured to down-sample the YUV444 pixel stream to a YUV420
stream.

In addition if pixel stream down-sampling, the Y Cb Cr components must
also be mapped differently to align with the HDMI2.0 specifications.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 3 ++-
 drivers/gpu/drm/meson/meson_venc.c    | 8 +++++---
 drivers/gpu/drm/meson/meson_venc.h    | 2 ++
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 69926d5d8756..75c133a048d3 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -772,7 +772,8 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
 	DRM_DEBUG_DRIVER("\"%s\" vic %d\n", mode->name, vic);
 
 	/* VENC + VENC-DVI Mode setup */
-	meson_venc_hdmi_mode_set(priv, vic, mode);
+	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, false,
+				 VPU_HDMI_OUTPUT_CBYCR);
 
 	/* VCLK Set clock */
 	dw_hdmi_set_vclk(dw_hdmi, mode);
diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index a9ab78970bfe..f93c725b6f02 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -946,6 +946,8 @@ bool meson_venc_hdmi_venc_repeat(int vic)
 EXPORT_SYMBOL_GPL(meson_venc_hdmi_venc_repeat);
 
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
+			      unsigned int ycrcb_map,
+			      bool yuv420_mode,
 			      const struct drm_display_mode *mode)
 {
 	union meson_hdmi_venc_mode *vmode = NULL;
@@ -1528,14 +1530,14 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
 	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		reg |= VPU_HDMI_INV_VSYNC;
 
-	/* Output data format: CbYCr */
-	reg |= VPU_HDMI_OUTPUT_CBYCR;
+	/* Output data format */
+	reg |= ycrcb_map;
 
 	/*
 	 * Write rate to the async FIFO between VENC and HDMI.
 	 * One write every 2 wr_clk.
 	 */
-	if (venc_repeat)
+	if (venc_repeat || yuv420_mode)
 		reg |= VPU_HDMI_WR_RATE(2);
 
 	/*
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 1abdcbdf51c0..9138255ffc9e 100644
--- a/drivers/gpu/drm/meson/meson_venc.h
+++ b/drivers/gpu/drm/meson/meson_venc.h
@@ -60,6 +60,8 @@ extern struct meson_cvbs_enci_mode meson_cvbs_enci_ntsc;
 void meson_venci_cvbs_mode_set(struct meson_drm *priv,
 			       struct meson_cvbs_enci_mode *mode);
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
+			      unsigned int ycrcb_map,
+			      bool yuv420_mode,
 			      const struct drm_display_mode *mode);
 unsigned int meson_venci_get_field(struct meson_drm *priv);
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
