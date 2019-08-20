Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC783C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82CDA2377F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fSPPbiiS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2BWi2Jq5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82CDA2377F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msByxnKsVda5fyCE0gn2lS/E9CVSZhAYfVns0vK61Ig=; b=fSPPbiiSJ5Sy8F
	W8dVAMhTPQG7UDklqcejAw7SkiVmAo9AZufXjlYmG6tLFROF+wLR65Uy4BP722KGt6bdDWOkjOry0
	sXLycYQGKZcnfjDDNIaA517dE3fG5ihQ2iog5DcJU576fu6dH3Z03CjDzMeRDRfkRO0+KrsKjSmXm
	jBbkg9claIfiY7MHcKqcuXUy8VmaIZU37ipZjsjgJpIOjFcZNZL50TXywM4SSBiR6H2msroGsFQ7L
	87ulZ3FXYgaLdTRxsqLg/a3T/oDZT7nvKPAPKrStQ4kIYL6tzSHra2MdRZP9ueF0l0JFi9qVzR4lr
	RqtuC0fXJ4aEPYRpy8Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzziP-0005RT-5n; Tue, 20 Aug 2019 08:42:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzhl-0004yx-9r
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 08:41:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id z1so11450186wru.13
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7CqeKSTem021QoPp6JMnzxB9YluOu4hz8452YyClyt8=;
 b=2BWi2Jq51jt3oPw7UPWuxQyqpGWZKI70o4EjJXih00uU8MIkxMjYRAWRXzAKWwJwM3
 GaeHHXClhv1khlSjvruQwPO5tR2CE8TwMygb4TMdXoMnwtKaKSr8Yk5YhBWfpL0jGRGB
 YjBJiUbK8BUfb3g0ykPqVihuxE5NzQs3qcyPOfgjEUBl85xR+q8B9qRwAVxGqWTSQmKp
 U6+RmYehn7/s90A+vHmqOYmglQp8Nz/SRe0te9BBhKvYVI/ogOufQtOEfQBpoEPE6bHt
 iKkjhxc6x0DT72d+apRYr9yPu2N4tD305l++30hathlf6pZxh7KXz1MJ2POltmnwg+ik
 V3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7CqeKSTem021QoPp6JMnzxB9YluOu4hz8452YyClyt8=;
 b=hXnbvEJVn4TMNJzacqSwr0Jf/aeKmX1j+tQ3PzFhMGqgou5S7G2CN9FZaD4Nab8/Ln
 3rgaXxtpy7q8odilQMk8vEVTkdxnyIFuMFpro23v4rUuAIQ9zxAG1ce3iVHyyYerv5H5
 qSbdZf+LXeaRKzYRVZ7mUDjYvZGzPi9kEC69nv1Fi74t5E1Ub5XNpQ+vONpFxe2nS/Zk
 BcWkfQyt5bSghJFUIjDnmb2YWW4upKbH6EaLC2b/UsBFkZvdmF8zZVsZt66qwvwTDlmf
 LbsZ6LeWUzTESZgUuy0O5RIuP8DQqpVb28ZVgQxgmVX+UJLLVi78zu1KcMzpFdMTzf2V
 Y/LA==
X-Gm-Message-State: APjAAAWrw+1a4GWJPMa39wv2meydLXAC97yzu+KBSmJPyAZhpfg8h5+u
 +GSvSo7kUzjxYr6mhwv4CFUDr4Hw/5yn5Q==
X-Google-Smtp-Source: APXvYqyeY205T67m+BbcYhK3smYHwphV4Tyn7CKS0K7OP65pmIueJKbfUILQJODLQ0EjvD26NCVBYw==
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr32742798wro.337.1566290483453; 
 Tue, 20 Aug 2019 01:41:23 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 09/11] drm/meson: venc: add support for YUV420 setup
Date: Tue, 20 Aug 2019 10:41:07 +0200
Message-Id: <20190820084109.24616-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_014125_507900_4B84AC30 
X-CRM114-Status: GOOD (  12.08  )
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
 drivers/gpu/drm/meson/meson_dw_hdmi.c |  3 ++-
 drivers/gpu/drm/meson/meson_venc.c    |  6 ++++--
 drivers/gpu/drm/meson/meson_venc.h    | 11 +++++++++++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index fb09592eba3e..2b278ee75100 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -719,7 +719,8 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
 	DRM_DEBUG_DRIVER("\"%s\" vic %d\n", mode->name, vic);
 
 	/* VENC + VENC-DVI Mode setup */
-	meson_venc_hdmi_mode_set(priv, vic, mode);
+	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, false,
+				 MESON_VENC_MAP_CB_Y_CR);
 
 	/* VCLK Set clock */
 	dw_hdmi_set_vclk(dw_hdmi, mode);
diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index c8e9840ad450..ec2723822552 100644
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
@@ -1496,8 +1498,8 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
 	writel_relaxed((use_enci ? 1 : 2) |
 		       (mode->flags & DRM_MODE_FLAG_PHSYNC ? 1 << 2 : 0) |
 		       (mode->flags & DRM_MODE_FLAG_PVSYNC ? 1 << 3 : 0) |
-		       4 << 5 |
-		       (venc_repeat ? 1 << 8 : 0) |
+		       (ycrcb_map << 5) |
+		       (venc_repeat || yuv420_mode ? 1 << 8 : 0) |
 		       (hdmi_repeat ? 1 << 12 : 0),
 		       priv->io_base + _REG(VPU_HDMI_SETTING));
 
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 1abdcbdf51c0..88ded5451c49 100644
--- a/drivers/gpu/drm/meson/meson_venc.h
+++ b/drivers/gpu/drm/meson/meson_venc.h
@@ -23,6 +23,15 @@ enum {
 	MESON_VENC_MODE_HDMI,
 };
 
+enum {
+	MESON_VENC_MAP_CR_Y_CB = 0,
+	MESON_VENC_MAP_Y_CB_CR,
+	MESON_VENC_MAP_Y_CR_CB,
+	MESON_VENC_MAP_CB_CR_Y,
+	MESON_VENC_MAP_CB_Y_CR,
+	MESON_VENC_MAP_CR_CB_Y,
+};
+
 struct meson_cvbs_enci_mode {
 	unsigned int mode_tag;
 	unsigned int hso_begin; /* HSO begin position */
@@ -60,6 +69,8 @@ extern struct meson_cvbs_enci_mode meson_cvbs_enci_ntsc;
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
