Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72877C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 461E722CED
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ojoeaMs2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C9GqNB7Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 461E722CED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94koFlFaqCiGApuIxLII/j4jwdI8mc3c7pOMTofRMNg=; b=ojoeaMs2jCMekj
	YIf1VHAert6Fqzf9YQYMjO0SEUj9DALDr2g3R4s3wxbYZb1pbyL31JNV0ie6YN6Z3KsU+rHsiDPWq
	s+AYPGzuZLh7ig4LtqJZGp8RW7+rH/mJwuvBNfUSNQeIkZ96bb7Br8OPH2hb3ukKitBp5WZ1xeUI4
	7u8oVbRh281sP7h773qazCPuc+D4sa1YyTXmxDnjNWXKpfn0TOGFHfGPQqin6uL37Gz3ks9iOxHzR
	c7UWjCxgfTDmeie63wtCySqJjHA8xukJvMEGBk8ap0my0JwuZvIFVaji2qu5dWBw9WiI6mTSSzyal
	jpIB/d3kr/sNeMGBwXkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Wce-0003o5-CI; Tue, 27 Aug 2019 08:14:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Wca-0003lo-SF
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 08:14:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id z11so17833467wrt.4
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 01:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3fwLgPt/sy0VRW5cHDJyRotay9sWSMyISJ5IvQ5QQMA=;
 b=C9GqNB7Zx2gcvaVzTdzCbkKaigQKRB7taaAM92mqpg588P/+1/L5odJieFPNb0LTwN
 8RczG1CjJ/RyL5OyJlcfTqSew2yax0JYZJh/l4Y+UzzRSp+ANIfP7SuSkrWustPY4+Hn
 6RV1d5TbNu7JaqsqYlY6hA8inCmFL8gan4+a+SNE0xAC7sYznX0dy3LZPVLvgtfu1YOf
 Nm9n7/2lm6kIyvnOk45RNmGIvQKdiozzb6wQDVoBIvrcdt9EbEoNaJ6Rv1wXxZ8eSLBq
 9qktKeEvuLDRO2wI+b/aPcWoljP8SN7KpIkah35+Ca945fvXDNHjsexq3DlTPS0lUDnE
 S/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3fwLgPt/sy0VRW5cHDJyRotay9sWSMyISJ5IvQ5QQMA=;
 b=s9mhD9DWiNRfiTF6a3psGG40oIrDXMbyLWDxWsdiJOMbda6ZF4C01EWVt/BE+cALJd
 1gs78cTVOElLtjjfG8zxopvHIAZrq+rFamK0rC9q5OhcCESHMJa5nWMblkaGQzJv2oAX
 Wy3D2jH8dczriKw3Khw+0yQ03V1i/Tp5RQeHr4bbHurK4vUPuPeRL/s9EVT6shlo5QBe
 8vCq49MzE3qOj1HZKqh4oIW3XHbdeGgGEw1W9Sj5MjLUPn4QIH1yf+5L4ysRYWIgVALe
 g/YsakCcbkulrp2MYRObX5yLf0dH281LFYfryw5zw6RnzIq/46ExMAyd3PjNSDUylGfE
 R+vg==
X-Gm-Message-State: APjAAAXokAi/ktt54WRcCwuGHHfp0vVqLlk1Un1Ac6WW6uk4tUCjRVW1
 j4A6tI4ArVVG90wuzci4Rl9FKg==
X-Google-Smtp-Source: APXvYqztWS6qzctrIjcT+AV41CNogqI+Ep6+I+AnpQFdQmvtAHxf1STFdqtf+tvOdN6+ooP8EYCImA==
X-Received: by 2002:a5d:658b:: with SMTP id q11mr2210567wru.211.1566893669171; 
 Tue, 27 Aug 2019 01:14:29 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 1/8] drm/meson: venc: make drm_display_mode const
Date: Tue, 27 Aug 2019 10:14:18 +0200
Message-Id: <20190827081425.15011-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827081425.15011-1-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_011433_055807_60D39FEF 
X-CRM114-Status: UNSURE (   9.10  )
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

Before switching to bridge funcs, make sure drm_display_mode is passed
as const to the venc functions.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 2 +-
 drivers/gpu/drm/meson/meson_venc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 679d2274531c..d2d4c3ebf46b 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -946,7 +946,7 @@ bool meson_venc_hdmi_venc_repeat(int vic)
 EXPORT_SYMBOL_GPL(meson_venc_hdmi_venc_repeat);
 
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
-			      struct drm_display_mode *mode)
+			      const struct drm_display_mode *mode)
 {
 	union meson_hdmi_venc_mode *vmode = NULL;
 	union meson_hdmi_venc_mode vmode_dmt;
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 576768bdd08d..1abdcbdf51c0 100644
--- a/drivers/gpu/drm/meson/meson_venc.h
+++ b/drivers/gpu/drm/meson/meson_venc.h
@@ -60,7 +60,7 @@ extern struct meson_cvbs_enci_mode meson_cvbs_enci_ntsc;
 void meson_venci_cvbs_mode_set(struct meson_drm *priv,
 			       struct meson_cvbs_enci_mode *mode);
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
-			      struct drm_display_mode *mode);
+			      const struct drm_display_mode *mode);
 unsigned int meson_venci_get_field(struct meson_drm *priv);
 
 void meson_venc_enable_vsync(struct meson_drm *priv);
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
