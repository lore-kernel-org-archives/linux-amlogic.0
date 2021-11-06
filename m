Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C22C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Nov 2021 19:35:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2CB861051
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Nov 2021 19:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2CB861051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pP/IMPYMxo6JYHgVPaIyTBvfEW7AvCHP3ON0Q6KtyP0=; b=VW86NXaudYmez4
	fOlXjmNqtHZeS9cRQTyK3ionBokHtXuDcmeH6nzFjgfnsRgGcRHvpqYZGK0o3H1xSO9v9omjqZWF5
	qKLKZfGQ+/rdhDnHGltsRrj8zCmU7CmVqgpqE/2q9xQQdoYn/lpeIp6u8DR0h2cXhEvGbwFHPcF52
	0at0eKazFKRQ8hGT3asb5nNtCg9qnYGxsBgrGaCO2qF8xkXg9MJClYf5cnUujXwQKQwzrJfhrEIcD
	yrFrDkzTcf2YT9OAs1OCL5zJ61m5E3FwRGwyRMGrxqUUnIG15/PpFMMVvLwe34bPjpZlVHeG8j8G6
	ZSUUJpDy9SuQxaBi91rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjRTP-00DeBT-Fe; Sat, 06 Nov 2021 19:35:31 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjRTA-00De5x-UQ; Sat, 06 Nov 2021 19:35:18 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D8901FD3B;
 Sat,  6 Nov 2021 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636227313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Le3S5FuS/r3ShvlYuH/h+zmTUnqCtKR9aBIKzZ1VOM=;
 b=gppSl1s0z8CLwwJ7sMSIykrB+v5Gm5TLtJuurStykHUdRh1m4A0szWZV3Jo2Opv5Xa8NIH
 6nhwPgyFYTprk617hXha6EB39PISxJ7qRsbw8vozngRQN5itWrwCBOeujrrh++9IJFsFIc
 yO9JmRM0vDZMoPICyqIjNUXt5gmpmhE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636227313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Le3S5FuS/r3ShvlYuH/h+zmTUnqCtKR9aBIKzZ1VOM=;
 b=pdBgZZ1xsDokg4lAa9kVsWc2MTbST1zDUroBcQ3CgX8HyR9Oh8yHwnOCQNxG1nKk/6ykOX
 KZNM1WUAWjukyNAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BA3113ABD;
 Sat,  6 Nov 2021 19:35:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YCd2EfHYhmEdLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 06 Nov 2021 19:35:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, marcel@ziswiler.com,
 naresh.kamboju@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 1/2] drm/mipi-dbi: Remove dependency on GEM CMA helper
 library
Date: Sat,  6 Nov 2021 20:35:08 +0100
Message-Id: <20211106193509.17472-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211106193509.17472-1-tzimmermann@suse.de>
References: <20211106193509.17472-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_123517_174541_22C78112 
X-CRM114-Status: GOOD (  18.33  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The MIPI DBI helpers access struct drm_gem_cma_object.vaddr in a
few places. Replace all instances with the correct generic GEM
functions. Use drm_gem_fb_vmap() for mapping a framebuffer's GEM
objects and drm_gem_fb_vunmap() for unmapping them. This removes
the dependency on CMA helpers within MIPI DBI.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 71b646c4131f..f80fd6c0ccf8 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -15,9 +15,10 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_file.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modes.h>
@@ -200,13 +201,19 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		      struct drm_rect *clip, bool swap)
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
-	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
-	void *src = cma_obj->vaddr;
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
+	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
+	void *src;
 	int ret;
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return ret;
+	src = data[0].vaddr; /* TODO: Use mapping abstraction properly */
+
+	ret = drm_gem_fb_vmap(fb, map, data);
+	if (ret)
+		goto out_drm_gem_fb_end_cpu_access;
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
@@ -221,9 +228,11 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	default:
 		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
 			     &fb->format->format);
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
+	drm_gem_fb_vunmap(fb, map);
+out_drm_gem_fb_end_cpu_access:
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
 	return ret;
@@ -249,8 +258,8 @@ static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
 
 static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 {
-	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
-	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
+	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	unsigned int height = rect->y2 - rect->y1;
 	unsigned int width = rect->x2 - rect->x1;
@@ -266,6 +275,10 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 	if (!drm_dev_enter(fb->dev, &idx))
 		return;
 
+	ret = drm_gem_fb_vmap(fb, map, data);
+	if (ret)
+		goto err_drm_dev_exit;
+
 	full = width == fb->width && height == fb->height;
 
 	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
@@ -277,7 +290,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 		if (ret)
 			goto err_msg;
 	} else {
-		tr = cma_obj->vaddr;
+		tr = data[0].vaddr; /* TODO: Use mapping abstraction properly */
 	}
 
 	mipi_dbi_set_window_address(dbidev, rect->x1, rect->x2 - 1, rect->y1,
@@ -289,6 +302,9 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 	if (ret)
 		drm_err_once(fb->dev, "Failed to update display %d\n", ret);
 
+	drm_gem_fb_vunmap(fb, map);
+
+err_drm_dev_exit:
 	drm_dev_exit(idx);
 }
 
@@ -1117,8 +1133,8 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
 
 	/*
 	 * Even though it's not the SPI device that does DMA (the master does),
-	 * the dma mask is necessary for the dma_alloc_wc() in
-	 * drm_gem_cma_create(). The dma_addr returned will be a physical
+	 * the dma mask is necessary for the dma_alloc_wc() in the GEM code
+	 * (e.g., drm_gem_cma_create()). The dma_addr returned will be a physical
 	 * address which might be different from the bus address, but this is
 	 * not a problem since the address will not be used.
 	 * The virtual address is used in the transfer and the SPI core
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
