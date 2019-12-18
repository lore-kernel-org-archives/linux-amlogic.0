Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADD2C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D19A20684
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="koHKzySB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b1AS6CxX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D19A20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTtzFGNsDVHSeUMj8stvE9d5m3bByWYV1jiLbqbByBM=; b=koHKzySBNI4+38
	Hxzntc85Rg+v0DVCfyePU7rksT0gWc5w/EDThledWBaJYXnPgBv8LTvJyZDrWpvPI3sHHrMC7Surv
	lBOGi/93VB8NuWn/hCAy1Za1cP1f1YJgZvP3zyTI7d8lqZL9QocJchIAiZtfmlS2YWVrbRbzZrX//
	61hDfL/Oa5wLxTjjoZZd/LYbcs+DBePUoYzN6IgSfbUfivFHjUPvK9KNMhWmdLmu63cLyih2ISUtM
	il2hZlkI5p547Sx8+Dhz2IP7jwmLhB4dO6QOVjdeTDRfLaEBwHphjOnpleihWu7hTsM3WFZb7tkBR
	9l+XTsm4uWPh2wz/SvKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbXR-0008Ic-6j; Wed, 18 Dec 2019 15:47:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbXE-00082X-SH
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 15:46:50 +0000
Received: by mail-wm1-x344.google.com with SMTP id f129so2427492wmf.2
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=spj22Kg+dWdyjSNSykFKUU/hDbOBLgtGt0g5yBFUVac=;
 b=b1AS6CxX5nI9P5gV5fLOMWoiZOTh5Yc72/xDMj78dPgssSaHOIuMro9cBLupbrf38J
 rcIq5bCgjTB1DQ9VgunE61IWYLlghOS/mVI6myWrU7FS+g7eVlm4STFVP1Y17B/4qsx/
 gAaROAjMzchyX2CPaGs+Z8blB0Qeo7Pb6zpRvaw9mOkO2G8A14CaKwNPu3c9aI40aLd5
 LIrFCGYIf6/l9IIsrbY2ZfuXGJvbT6GHi3LhLPu0ez9wk4uA7bV9u6FCTbtaM0SsePAh
 /iSafvh6DlYtB3B+L+EO9IG/BuHtoEAoYgd2Syc+DGLOPxOfde8OhBXHZhDABSf5Lwv6
 fZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=spj22Kg+dWdyjSNSykFKUU/hDbOBLgtGt0g5yBFUVac=;
 b=ZlCUtPq+ai4aO/Bb+EbPHPnIPtMLCFe/UYBv2M/GCYCTxKl2ORQw11jQ11jaUZKB3t
 v6wMqNLp/aI/LhzBXDQch8F9F682IhmNaLsO3GhMTrmtqFHcrEdovCyEFx5PNQLiGQ1W
 Y3X3RlAT/smPycBd85WYE2suI1RclXv2N2pLC10R9QikPHMLND7j1jJlYcGp2gqa2ZVh
 UqmFcsM1uwTQU8pooepc4Q5SyTpSmTW8ryOSuKcXBrj3Rtl6EcLCO8FJADIseRoDj3No
 04B/72lgl0N8YAWdPf7JShQak5KKxFx9YKEnfxGzyeVDvq50aMsohRe62SZVSdqyLP7a
 3MMg==
X-Gm-Message-State: APjAAAWuzZyFMXCsQ+LoeJ5LwOx2FcSZyz6kHLooAk+Qu3TlYWC4aBxc
 OHQjsSS0fOIwTAFGS45uEv88Rw==
X-Google-Smtp-Source: APXvYqw+pDIQ46qs/l7D3sSMhzpMvSIoK6+jQ8CQGtK8rR4qHoA0VQKD5aEh0qODdimQC3lB1EeJZw==
X-Received: by 2002:a1c:ded6:: with SMTP id v205mr4006272wmg.86.1576684007437; 
 Wed, 18 Dec 2019 07:46:47 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:46 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 07/10] drm/meson: dw-hdmi: stop enforcing input_bus_format
Date: Wed, 18 Dec 2019 16:46:34 +0100
Message-Id: <20191218154637.17509-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_074648_961281_333B5085 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

To allow using formats from negotiation, stop enforcing input_bus_format
in the private dw-plat-data struct.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 8729575777d5..69926d5d8756 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -1032,7 +1032,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
 	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
 	dw_plat_data->phy_data = meson_dw_hdmi;
-	dw_plat_data->input_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
 	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
 
 	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
