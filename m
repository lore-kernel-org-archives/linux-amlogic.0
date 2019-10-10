Return-Path: <SRS0=8dHl=YD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4340AC10F14
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:26:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181902064A
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rboOkg9p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="p60Etojj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 181902064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2meNbOfa5ro3ENj2oKBeC9tOEeznbGKq+tZUNhxFEg=; b=rboOkg9pjWYrYp
	6JAF8VZDhsUE5ybXoHkYGzv1Cjz+E925C0hn8+Jo63sCsVDfD2HDPsX9nNMw7T0Lr1YYxgh0rxcg6
	4yEy/lh3BmjPBcf917Pdk7SvIfoTGds9Z2d2Ktls6UUQaU4tXpuwc2Y3YXntOvo8269NJsWxkpK+p
	LxNj5/P4p0V+3ZvGlJpmti1GNQT3rtng5xwEA3w/g/wvP0tJXHYeA667zaftGnRiJPq0mnXnb/Yvn
	8Q7tC1rEnkzW0Yf+RBnwp2qO50cug+3PBrpBXrVlu2is2uOa5sSYyP/wFp0vfnhqsNg0pY7Mfp8S4
	YMvtP+0JXsGJl35e4V3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIUhm-0006FG-II; Thu, 10 Oct 2019 09:25:54 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIUhR-0005y2-3S
 for linux-amlogic@lists.infradead.org; Thu, 10 Oct 2019 09:25:36 +0000
Received: by mail-wm1-x343.google.com with SMTP id b24so5957982wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Oct 2019 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=p60EtojjuWG9pFhtEny9YRYGziaVfs71P9xmJwyyizeaB85ula7MdAXA75MjHulWJs
 FtGeZRDJv3akyybAuI5AqiKoaXOjAxO4rW4NA7VP3sQesreb+8uUuLa4InHSlhxgMeEH
 BzJwLRbjWhgaFKd20sDUfRW2rEafKsP8qNmt234VxGCz8+raUQJhbvqDt+AYHY5rU6Hv
 qZSzojVQHRk86/KhGtwApkAzNV4SimNF5wu76ovOjcSuAzrI+1gkzCA1zEIhkGPxPCET
 VMXyod2dzWP3pH0vP7AYnfj9LNTK9vJaCdPH2heb+gG9bYfdRJZqQkGpcvejgSKExpWE
 e/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=hapnSHcm/VYeNrFYD2OUHJ7OwwANl+qfJ1EzT4n5LsvP1T3kHbB7+glhV4unwjbOf6
 KJjbmVHcK11SUbZTvuPf1aj9T83rD2tgn9XeWs29UsbSBCrX/79MCp9ES8OHtac648cK
 gFiz4WLBqijUq+/wRx4cSFKBlWsedDNDmBmFDAjv2Y//qKuyiUI5e8cfzbIvOJWQxaJz
 Q2czcCNXhQzJiSdAcG9P/8tx1+kRqw+aNgjnSt4jpMoLXQZVajm7S0GspAu+EobFeSEZ
 rC3ytlaj8ojL2wP66pXIR8WnULlXCZLoFJWId34B3bKbwB3whmY46MEkLsbFdNFiw7H7
 h7hg==
X-Gm-Message-State: APjAAAUafU7N0DG8uufSVVdmKqoGl/3883rYmCc7k/BAPycgNT/DPtfD
 rI0WMBe0pz6nvP43kz3TSuCe2g==
X-Google-Smtp-Source: APXvYqzHwe/HUmwgVyORc9vCtFW/hczdKZJuZTvYVgC+S0zxN+gLbAoQayuJvmbM2+BaG5XQM1L3XQ==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr6687667wmi.21.1570699531078;
 Thu, 10 Oct 2019 02:25:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm8373770wmf.48.2019.10.10.02.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 02:25:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/meson: store the framebuffer width for plane commit
Date: Thu, 10 Oct 2019 11:25:21 +0200
Message-Id: <20191010092526.10419-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191010092526.10419-1-narmstrong@baylibre.com>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_022533_144430_D8E08AED 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Also store the framebuffer width in the private common struct
to be used by the AFBC decoder module driver when committing the AFBC
plane.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.h   | 1 +
 drivers/gpu/drm/meson/meson_plane.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 820d07bdd42a..3287282450a9 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -52,6 +52,7 @@ struct meson_drm {
 		uint32_t osd1_addr;
 		uint32_t osd1_stride;
 		uint32_t osd1_height;
+		uint32_t osd1_width;
 		uint32_t osd_sc_ctrl0;
 		uint32_t osd_sc_i_wh_m1;
 		uint32_t osd_sc_o_h_start_end;
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index ed543227b00d..5e798c276037 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -305,6 +305,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	priv->viu.osd1_addr = gem->paddr;
 	priv->viu.osd1_stride = fb->pitches[0];
 	priv->viu.osd1_height = fb->height;
+	priv->viu.osd1_width = fb->width;
 
 	if (!meson_plane->enabled) {
 		/* Reset OSD1 before enabling it on GXL+ SoCs */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
