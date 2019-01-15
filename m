Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEC7C43444
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0175220657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GI+WQEoX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MA+FRrD2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0175220657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCwfdkuAYOuP4VwKQPevUwKl+Rwm77ZWoZKZN+s+giA=; b=GI+WQEoXpX99Qp
	fCsbKbXWs4ksnWDxafois5UtXCOXK6U2gTOgHD7gHtNQH5FiocZ1pIFzslW3SELi4u0ggILX9R7BV
	MoirfuU8LB3RiOtFok5803jBE4liPtbiCTnNdzmTDOKQgzB91xlrkMvxLlJPZfgcBg0GNQDZ9tOKQ
	KFOgCEv8r6nzCCkRuKEnfqlWEfejEcC4z9FbPnHNVKLd7ODoD6jd5/rHhQmywSDdplZ8gRvoaFNPB
	fIAeTO0b+2R1HcOINeY08kEpV9302iauYRfBN+VIpKXyO/ChhVmVTlc3Bbizyg+Q+w0Iz9ANwTVy9
	okjpy5964pfJ/elhey/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjNuX-0006vC-0M; Tue, 15 Jan 2019 12:33:41 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjNuN-0006kq-Kf
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 12:33:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id r24so937386wmh.0
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 04:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gyRstzIV/tkAOjKYQyUc2I3/RSm50wt24so0Y7Xd4I0=;
 b=MA+FRrD2pAe1tJDkbCSL7E5xbgFJTsqLnnkt0FCKFfj401eznf0TvJ33FnJ4mVwffc
 GTXwuftlxCEEurP2YL6g0gX2fnwSI0gIhSE4arQ8UUU/4/1sJw7aYmnHxrRvmDRIS3ap
 x/LM0RR7e2D/7D6h+ZghwnnTJtmFnDPc4ycOdAbIMFOhWwCtQTH9bzHZF98ti6++BW7U
 7F7xVkqoLMlm2ENUvWZFDYD7uq4gGtWKXPhwPTn6CiUDM1dNwUHkk2AHnWxkG6PWw8HO
 6eyVC16tO9PFW1LCVSghtyf+20hvF4zxH+nGruvePdYCEhNm2zpoSfwHhUg02iNC2vHU
 vZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gyRstzIV/tkAOjKYQyUc2I3/RSm50wt24so0Y7Xd4I0=;
 b=lpu+dJBOWUrciXMZvme1Q8nFEU0qJhdxozRF8mH8eMForbZ5l/6e6uvzyJ1c0tJqJs
 qNUkXgDqBx5yoHChdtFJgmhasK+S5ge2ilzlYmenqJPweLWi/EVGt0JGcPxGlNxxLptc
 gTyamoYpKjttzfT1/+n6IgqCXF6yWCVrxeC3k26glKgOKY9RyirTxnewpS61Mmj1mPXu
 O4tyoDUJvRmlZOamoK6STCU38M3J2hnKjMDSS93Pfc8PU/dWM93CbblgSH0aKZpCibI7
 Y9qTx3gWossQAz3ySl3Ovx8PZ1ui1d7EeZ1Ybz7/ipliBu0R4qgpxSG4sOzsbYb0LCxx
 xr2g==
X-Gm-Message-State: AJcUukcmwoJTkdigsQz5KQ6dpRq35EacmpQ0E+B1Z55u6z1QzNMD57jt
 WvO87fWsEXXgdtRgantf2FUvsmHaSDD7jg==
X-Google-Smtp-Source: ALg8bN4KHxpUruVaC3yEK2Zo21G5jB7Xjk3AuRbqMXTguxiTn86PlJC+fphEuc+YHMEgsDLJrU3lhg==
X-Received: by 2002:a7b:c757:: with SMTP id w23mr3032470wmk.59.1547555609820; 
 Tue, 15 Jan 2019 04:33:29 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x15sm75658842wrs.27.2019.01.15.04.33.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 04:33:29 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH 8/8] drm/meson: Output in YUV444 if sink supports it
Date: Tue, 15 Jan 2019 13:33:15 +0100
Message-Id: <20190115123315.11069-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115123315.11069-1-narmstrong@baylibre.com>
References: <20190115123315.11069-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_043331_674521_3D35B356 
X-CRM114-Status: GOOD (  11.41  )
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
index 068b56a991b5..413575b5c3a0 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -669,7 +669,10 @@ static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
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
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
