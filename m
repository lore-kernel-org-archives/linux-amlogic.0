Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26B4C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:38:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52CF20856
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:38:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y+IUbrfF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MFzRgLfc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52CF20856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWyzDXLxdHZ2LffLtsijqfPjJrbBwBijJtvci1hgM88=; b=Y+IUbrfFBsmOpK
	MJTxg80dNaXL5YaCaeq6oxncLCiu5sDs813d4bLAt9EwNTr0KKZY4A3q7Mdoq4zBdlLfE6xBdrsLM
	5WZ+iRC/psi54TZrkF+Jr85o0tSgnpr7Hi0YTdy32MGNmfmfL4bg+8u7QK56mS6RVh9e+GnePoSR7
	nFxgGJ6WFLUWr/YkAH3oguW7phXVoxKLV74Fp2K6u83wABlR97AfOnRLUyMrCODRC7t74NvbnBA8Q
	GbksXtq0SeUc9RKSkninOWctAFW6A5cQvfz5qV6YslF+1exmWhRuhUkyokpny5GlmogtOlY/is2sZ
	C2Tf7PZY0ks9qZUHv3pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSiUb-00058L-HK; Mon, 20 May 2019 13:38:17 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSiUN-0004xG-Cy
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 13:38:05 +0000
Received: by mail-wr1-x442.google.com with SMTP id m3so1688192wrv.2
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8wgz8PuMWuN+4Z5p71iE5tvMWtrysycjZtvpJoHqTb8=;
 b=MFzRgLfcO1fE8BtJGYgW7dy78r2oMlQTupaOww9NPc63xJJu1uJDO3pVnYO+xYi1fm
 IEktfJOgOtkUh7m4wKGu7QyFGM7h5ks522Wb8RsUs2ZP3ynI4Rlu2utFvcl6h28xhY88
 yE7PXh3P7VjWbRnm1Bg1d+Q7Bkry3ejtzGRmh2gqDX+JDqMKH1hBbaABemGHiM5f40wN
 Rs7yW57OsSCERyHB71BCV/zQNMfNpq+vxuLWLeVnh4bsTs3MpwyW19NDFaSpLgv+UBNT
 fjJmwwNh083bMesydSKFwRKq5XVXvEWdJLhfsHIAMMWAaxJ+sDEhYfbFpDrFTu3Q91qH
 L1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8wgz8PuMWuN+4Z5p71iE5tvMWtrysycjZtvpJoHqTb8=;
 b=hsxG1EJZ1HrXXvvk3TZFUxSYXtlsXZmSGCIhp1vpNEweD2i6pl4/AWGzP2xHiTXNX8
 bmWKcGMgcHrNKbaTuQfsSjAZbugVRxRHo6xDjqHRHfe/DdcpI2WD7uX6zOjwNS1/o8es
 fTximfcAa1pHKXACVom9J1a9gF1WrmvwDG1e3mZQ+SJ1Dg8qVcXgTBWdnlKksle2ub7K
 iKyoLkMRpvZWyrQoBz6aPZI4MH5Zs9eWPM8sx922L3yCYlZNfNj456RZlXupnyssTGAc
 xMSZiTfmF8oN2k52GpxmernvVO4PZnbm7q2Mp3TcDDkoXed63of7xWI36oUwUTB2oYMk
 ffTQ==
X-Gm-Message-State: APjAAAVCfeF4INtNF4ElY0jIODr6qTCP4h/cmf6zd8ODBZtDH57BM8l1
 qI6nRwpe+mxj+lN8UBcsxVZ3Fw==
X-Google-Smtp-Source: APXvYqwFVGiliaIe2yHIHUvGdrFvbFinbVKbndUVa7UC/xbova7lvQo1At2nx2PcoZC9tcvPyp3rjQ==
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr18078192wrs.103.1558359481967; 
 Mon, 20 May 2019 06:38:01 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t19sm12167059wmi.42.2019.05.20.06.38.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 06:38:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH 5/5] drm/meson: Output in YUV444 if sink supports it
Date: Mon, 20 May 2019 15:37:53 +0200
Message-Id: <20190520133753.23871-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520133753.23871-1-narmstrong@baylibre.com>
References: <20190520133753.23871-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_063803_651503_E3EF060C 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: jernej.skrabec@siol.net, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>, maxime.ripard@bootlin.com,
 jonas@kwiboo.se, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
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
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5d67e2beba58..8bf9db7f39a4 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -723,12 +723,23 @@ static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct drm_display_mode *mode = &crtc_state->mode;
 	bool is_hdmi2_sink =
 		conn_state->connector->display_info.hdmi.scdc.supported;
+	bool specify_out_format = false;
+	u32 out_format;
 
 	if (drm_mode_is_420_only(info, mode) ||
 	    (!is_hdmi2_sink && drm_mode_is_420_also(info, mode)))
 		dw_hdmi->input_bus_format = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
-	else
+	else {
 		dw_hdmi->input_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
+		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444) {
+			out_format = MEDIA_BUS_FMT_YUV8_1X24;
+			specify_out_format = true;
+		}
+	}
+
+	/* Set a connector bus format if required */
+	drm_display_info_set_bus_formats(info, &out_format,
+					 (specify_out_format ? 1 : 0));
 
 	/* Specify the encoder output format to the bridge */
 	if (!drm_bridge_format_set(encoder->bridge,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
