Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E68FC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 10:43:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D99A321773
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 10:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PC9qCiWq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eszOQgP5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D99A321773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COCJL6NwwWsnQ8QJZvucYjM/9Pll4W2IwjTl5UAy9CY=; b=PC9qCiWqZkZM+9
	3mbcEwxmpMwCl/IXBGr4Uzn+GkNfM99ODY58OT27LoGxuBv1j6kD9QWMwuBSahUggUSABGckLJ7Ef
	q4hCFnfZyeBBRbgDnHry6J0tT1z4WXTmGSqKZ/2hsV6nVIJnySyNd16pm+lvfBCVryEIiigx9XRB+
	AT9iFs4F0qaxfJCPsLx37d0iCkMVM9/+RMfR3m20vnvN/o/PsMhiZrnqHqrnYqUttY1fbFqCtqXJS
	q1cJ7bd6PBBALJnRoQBdZkW1nGp4UObwXraVYiVds9+ZlR8EmOY477S9ibeTlbGOscPXpUn5qRDvi
	+alzCNge0fz4XeG18z5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9oyV-0004Jw-0v; Fri, 29 Mar 2019 10:43:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9oyI-0003zC-0Z
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 10:42:57 +0000
Received: by mail-wr1-x442.google.com with SMTP id k17so1955873wrx.10
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9iPta9zPgZP3XWAC5lhX/snSUTynLHfLroArxcu7BWk=;
 b=eszOQgP58IP41nW+eG+b907BI8xIfNPpUC+HbKnK7kmgGWHJpTChTyC8wUX8H3mgur
 xfoA0acJK4EdmoXFh4WlyovylXqdyJ/s3anJGOgaJW5pUs/nl/nLTKTs4YqpLXd1VE8H
 ryhB4ryNo557UD/9U5Lf+3A0IZyZY9JNR9o/CS4xwbZcoNWZQ57UqLE/yTMtD7t1nyCN
 rqe0ZTRfh2KDfvWRaTr4PT5LIwlPKO1PWm9wkZD2iKIhuJ1ydJ8iKdPpSgIEszjnGpWH
 GJ7lyIl6hliguFtcCxVn5VMsNvlBHZAdF5exwYB0Qpj5vufJHQsc2bWA21HhOCgG7JR3
 Akog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9iPta9zPgZP3XWAC5lhX/snSUTynLHfLroArxcu7BWk=;
 b=aN47pmA+Q6az6scvS/KSXEIohYTlj98aoHWO3sLkx92BX2Qyzs3NRl1sdcCE6cD2dP
 cj26cP5lUvaNrck54Nmk0ZsMMozhDQW/WPZD4Vtry2HCDT0AxSRboV4Lbo41ujlECZri
 O12Ag0Wo75P70/j0s/9kfxCOTf8Csn0ODXRZCl15yYlUcUS59g0U/XZtv9/RekdanUWO
 XOtQ/O2bfnntuY8/wBQbEYPTMf9xofVaiVAMFDsCWoz5QtEEcO3uTq5FbdS7gLV0p0PB
 nVn3fcBNWbYFAa8vyFhfYr5k1hp1qFfzSnNUATxz6s5sR1oFhIeSHhwGqA3yoNjYDw3H
 TgOg==
X-Gm-Message-State: APjAAAXBc1dltsQA64fWcZ0td9xrkBgykoVPDmmiCvyA6a+W7+LltXM3
 Ba0s4ETuzlGeTroH/nuQTRBAhg==
X-Google-Smtp-Source: APXvYqxpswm5L4dzjRqq+BvpCEIouHIZ4JdfSZOysyc0i4t58OaeUknOQKivP42lH6oxGmsIJh1RVA==
X-Received: by 2002:a5d:488d:: with SMTP id g13mr17463196wrq.119.1553856168573; 
 Fri, 29 Mar 2019 03:42:48 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o15sm1632826wrj.59.2019.03.29.03.42.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 29 Mar 2019 03:42:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH RFC 5/5] drm/meson: Output in YUV444 if sink supports it
Date: Fri, 29 Mar 2019 11:42:40 +0100
Message-Id: <20190329104240.29585-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190329104240.29585-1-narmstrong@baylibre.com>
References: <20190329104240.29585-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_034250_438465_B7A61626 
X-CRM114-Status: GOOD (  11.29  )
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
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
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
+	/* Set a connector bus format is required */
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
