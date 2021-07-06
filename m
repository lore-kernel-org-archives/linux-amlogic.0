Return-Path: <SRS0=Mf/G=L6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F6BC07E96
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jul 2021 07:46:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF675613AA
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jul 2021 07:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF675613AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NlMa0rbQYVSsFlSEgLTe2Cy1URt9xswfDvYBRm8z4yE=; b=lQ9S1x2B5BMMka
	7Y0I5Mh/Efsl80/0R+YZn+AvbkQJgoUeXehw3Qra020NI9gkmZ+b8HJMAA+a+m1GhwAQZjJE420qR
	1kQho/w9m+Y9aHXK+FOePEyjlcZ+AIW1qLLznZ5YaOdew2yp95/R7bqYiIMs9hwJ4Uon8slxo5mz7
	O75htBwp0V+x5foC+4Y57lRefbyR/KW9hfRfJiPF38LcIi3dMdWstZivW7/PHs7MeDLCMqGNhS+Aa
	Lw95Zwjb+CpzDUMeyuudsD3sgo3+qz6AttOkCO/nwBsXOP5fAy9GmZI1bKWFBkJ9YfelI9hcszh5Z
	SFWk1BhwiWrIjCWd6sQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0fmC-00Aisk-UT; Tue, 06 Jul 2021 07:45:52 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0fmA-00Aiqa-6i; Tue, 06 Jul 2021 07:45:51 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B665E2267D;
 Tue,  6 Jul 2021 07:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625557546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pCqMVKA356077QUwAXe3E4qvn7wgqSHiy8HMHzQz0T0=;
 b=q+Lxpt/SxL8MFfF1KYOwBtoRDOIFgYjczMym86b026UvEuApB5AFP2Gwn9kHa0JWn6Ss8F
 Sh0rY22NDAjJfPqG4d7lMA4Wu6usism+zC9BZOt3G2p/IBjsUt7ILgnanL0ug+IBlVfJdj
 P5fWzJK33p0h+xbp0Nn1LLMgbF0NuxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625557546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pCqMVKA356077QUwAXe3E4qvn7wgqSHiy8HMHzQz0T0=;
 b=7XqPZYt+DWmuEPxiye3mfCE0fx7A5MJhwv3JEEkHy1VdzKZsaGBEZD9WG7W2CVMiNujO/I
 6Q6KpiHy1Pa2SyDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7129E13A42;
 Tue,  6 Jul 2021 07:45:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +P+fGioK5GCnbQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 07:45:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/meson: Convert to Linux IRQ interfaces
Date: Tue,  6 Jul 2021 09:45:45 +0200
Message-Id: <20210706074545.8763-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_004550_436443_22EB943E 
X-CRM114-Status: GOOD (  11.92  )
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

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/meson/meson_drv.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 3d0ccc7eef1b..bc0d60df04ae 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -21,7 +21,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -94,9 +93,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 static const struct drm_driver meson_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 
-	/* IRQ */
-	.irq_handler		= meson_irq,
-
 	/* CMA Ops */
 	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(meson_dumb_create),
 
@@ -335,7 +331,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (ret)
 		goto free_drm;
 
-	ret = drm_irq_install(drm, priv->vsync_irq);
+	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
 		goto free_drm;
 
@@ -354,7 +350,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	return 0;
 
 uninstall_irq:
-	drm_irq_uninstall(drm);
+	free_irq(priv->vsync_irq, drm);
 free_drm:
 	drm_dev_put(drm);
 
@@ -382,7 +378,7 @@ static void meson_drv_unbind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	component_unbind_all(dev, drm);
-	drm_irq_uninstall(drm);
+	free_irq(priv->vsync_irq, drm);
 	drm_dev_put(drm);
 
 	if (priv->afbcd.ops) {
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
