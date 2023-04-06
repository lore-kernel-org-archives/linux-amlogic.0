Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AB7C761A6
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ov9In1tkXKbqgBlbZE0cxSv22astJPa4J4oT6MmRNU=; b=sIDzg+AbvTL8DE
	hjjww8ggba1Vy1rAoB7c0iM34m0anuOCW0IgKbK2aVyzbsvMDzQfpUYU7p9c9k5QskbrE63xa/tIt
	sqacxnfB9UWLyRutUiZvW2lfchyHflfKHm3mXDZcroIQhY7Mlg8R4hpgN2O3ehx53z7nxmQ4nyfu3
	lz8Vv3rz02oRjRr58nB0bFQ5VpCEz3qWLQJ9q6+d9aEgeHyMykxiWuDDkp4QbFNajqBdABtsfPGjk
	zIoY0IHXCL9kO8BP1f2qBO5qb9wed7brjAuFk1CysvYeQJwEUr+eYst7fvrBXFX2j2vLrRxBHdeqa
	VaXE7uKFehngtbzTQEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPYG-007OGS-13;
	Thu, 06 Apr 2023 13:21:20 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPYC-007ODw-2x;
	Thu, 06 Apr 2023 13:21:19 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C4C791FD90;
	Thu,  6 Apr 2023 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680787271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xIGJnt5QSwKB43F9uP1VqMB3iD5JjjLHplTDaG7Av8s=;
	b=AhLxeW6ZF3ybtEfQukgquDPR8/Mfe6ESeFT0v5iVEJov/NJZ8+LeGcd4EI7R5FyBX1J94w
	OIMNf4HuFsGxTW23NJbV15ILq6opRyUMfO5sTZaxgUsfyVOTdKt7OMFD/HZYdXDY6sNmgC
	dZIqGlc6jmxFR5WIvrMzVkJms1pF9fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680787271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xIGJnt5QSwKB43F9uP1VqMB3iD5JjjLHplTDaG7Av8s=;
	b=3bWX3eeqgk766FDUH7AJRfbnwg/UrqazBIZLohOvie2z1mU/HeQckNZWyjCzxFdxFcE0a7
	lhI+RiQOWMr6U5Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52CD9133E5;
	Thu,  6 Apr 2023 13:21:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GKprE0fHLmSqBwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 13:21:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	daniel.vetter@ffwll.ch,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Deepak Rawat <drawat.floss@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Emma Anholt <emma@anholt.net>,
	Helge Deller <deller@gmx.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-hyperv@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH v5 3/9] drm/aperture: Remove primary argument
Date: Thu,  6 Apr 2023 15:21:03 +0200
Message-Id: <20230406132109.32050-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406132109.32050-1-tzimmermann@suse.de>
References: <20230406132109.32050-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_062117_245153_A7E75965 
X-CRM114-Status: GOOD (  20.01  )
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

From: Daniel Vetter <daniel.vetter@ffwll.ch>

Only really pci devices have a business setting this - it's for
figuring out whether the legacy vga stuff should be nuked too. And
with the preceding two patches those are all using the pci version of
this.

Which means for all other callers primary == false and we can remove
it now.

v2:
- Reorder to avoid compile fail (Thomas)
- Include gma500, which retained it's called to the non-pci version.

v4:
- fix Daniel's S-o-b address

v5:
- add back an S-o-b tag with Daniel's Intel address

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Deepak Rawat <drawat.floss@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: Helge Deller <deller@gmx.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-hyperv@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c             |  2 +-
 drivers/gpu/drm/armada/armada_drv.c         |  2 +-
 drivers/gpu/drm/drm_aperture.c              | 11 +++--------
 drivers/gpu/drm/gma500/psb_drv.c            |  2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c     |  1 -
 drivers/gpu/drm/meson/meson_drv.c           |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c             |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  2 +-
 drivers/gpu/drm/stm/drv.c                   |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c           |  2 +-
 drivers/gpu/drm/tegra/drm.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c               |  2 +-
 include/drm/drm_aperture.h                  |  7 +++----
 13 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 9020bf820bc8..12f5a2c7f03d 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -285,7 +285,7 @@ static int hdlcd_drm_bind(struct device *dev)
 	 */
 	if (hdlcd_read(hdlcd, HDLCD_REG_COMMAND)) {
 		hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 0);
-		drm_aperture_remove_framebuffers(false, &hdlcd_driver);
+		drm_aperture_remove_framebuffers(&hdlcd_driver);
 	}
 
 	drm_mode_config_reset(drm);
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 0643887800b4..c99ec7078301 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -95,7 +95,7 @@ static int armada_drm_bind(struct device *dev)
 	}
 
 	/* Remove early framebuffers */
-	ret = drm_aperture_remove_framebuffers(false, &armada_drm_driver);
+	ret = drm_aperture_remove_framebuffers(&armada_drm_driver);
 	if (ret) {
 		dev_err(dev, "[" DRM_NAME ":%s] can't kick out simple-fb: %d\n",
 			__func__, ret);
diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 3b8fdeeafd53..697cffbfd603 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -32,17 +32,13 @@
  *
  *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
  *	{
- *		bool primary = false;
  *		resource_size_t base, size;
  *		int ret;
  *
  *		base = pci_resource_start(pdev, 0);
  *		size = pci_resource_len(pdev, 0);
- *	#ifdef CONFIG_X86
- *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
- *	#endif
  *
- *		return drm_aperture_remove_conflicting_framebuffers(base, size, primary,
+ *		return drm_aperture_remove_conflicting_framebuffers(base, size,
  *		                                                    &example_driver);
  *	}
  *
@@ -161,7 +157,6 @@ EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
  * drm_aperture_remove_conflicting_framebuffers - remove existing framebuffers in the given range
  * @base: the aperture's base address in physical memory
  * @size: aperture size in bytes
- * @primary: also kick vga16fb if present
  * @req_driver: requesting DRM driver
  *
  * This function removes graphics device drivers which use the memory range described by
@@ -171,9 +166,9 @@ EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
  * 0 on success, or a negative errno code otherwise
  */
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
-						 bool primary, const struct drm_driver *req_driver)
+						 const struct drm_driver *req_driver)
 {
-	return aperture_remove_conflicting_devices(base, size, primary, req_driver->name);
+	return aperture_remove_conflicting_devices(base, size, false, req_driver->name);
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index f1e0eed8fea4..4bb06a89e48d 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -428,7 +428,7 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
 	 *       might be able to read the framebuffer range from the device.
 	 */
-	ret = drm_aperture_remove_framebuffers(false, &driver);
+	ret = drm_aperture_remove_framebuffers(&driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index f830d62a5ce6..a7d2c92d6c6a 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -74,7 +74,6 @@ static int hyperv_setup_vram(struct hyperv_drm_device *hv,
 
 	drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
 						     screen_info.lfb_size,
-						     false,
 						     &hyperv_driver);
 
 	hv->fb_size = (unsigned long)hv->mmio_megabytes * 1024 * 1024;
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index bb72fda9106d..ca6d1e59e5d9 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -285,7 +285,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
 	 * located anywhere in RAM
 	 */
-	ret = drm_aperture_remove_framebuffers(false, &meson_driver);
+	ret = drm_aperture_remove_framebuffers(&meson_driver);
 	if (ret)
 		goto free_drm;
 
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index d26aa52217ce..16652a5a7018 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -155,7 +155,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	}
 
 	/* the fw fb could be anywhere in memory */
-	ret = drm_aperture_remove_framebuffers(false, dev->driver);
+	ret = drm_aperture_remove_framebuffers(dev->driver);
 	if (ret)
 		goto fini;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 6e0788d14c10..d97f2edc646b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -140,7 +140,7 @@ static int rockchip_drm_bind(struct device *dev)
 	int ret;
 
 	/* Remove existing drivers that may own the framebuffer memory. */
-	ret = drm_aperture_remove_framebuffers(false, &rockchip_drm_driver);
+	ret = drm_aperture_remove_framebuffers(&rockchip_drm_driver);
 	if (ret) {
 		DRM_DEV_ERROR(dev,
 			      "Failed to remove existing framebuffers - %d.\n",
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 422220df7d8c..cb4404b3ce62 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -185,7 +185,7 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 
 	DRM_DEBUG("%s\n", __func__);
 
-	ret = drm_aperture_remove_framebuffers(false, &drv_driver);
+	ret = drm_aperture_remove_framebuffers(&drv_driver);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index e49f78a6a8cf..daa7faf72a4b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -98,7 +98,7 @@ static int sun4i_drv_bind(struct device *dev)
 		goto unbind_all;
 
 	/* Remove early framebuffers (ie. simplefb) */
-	ret = drm_aperture_remove_framebuffers(false, &sun4i_drv_driver);
+	ret = drm_aperture_remove_framebuffers(&sun4i_drv_driver);
 	if (ret)
 		goto unbind_all;
 
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6ca9f396e55b..d11d259f9399 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1252,7 +1252,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm_mode_config_reset(drm);
 
-	err = drm_aperture_remove_framebuffers(false, &tegra_drm_driver);
+	err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
 	if (err < 0)
 		goto hub;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c8bf954042e0..823395c23cc3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -350,7 +350,7 @@ static int vc4_drm_bind(struct device *dev)
 			return -EPROBE_DEFER;
 	}
 
-	ret = drm_aperture_remove_framebuffers(false, driver);
+	ret = drm_aperture_remove_framebuffers(driver);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
index 7096703c3949..cbe33b49fd5d 100644
--- a/include/drm/drm_aperture.h
+++ b/include/drm/drm_aperture.h
@@ -13,14 +13,13 @@ int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t
 					resource_size_t size);
 
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
-						 bool primary, const struct drm_driver *req_driver);
+						 const struct drm_driver *req_driver);
 
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 						     const struct drm_driver *req_driver);
 
 /**
  * drm_aperture_remove_framebuffers - remove all existing framebuffers
- * @primary: also kick vga16fb if present
  * @req_driver: requesting DRM driver
  *
  * This function removes all graphics device drivers. Use this function on systems
@@ -30,9 +29,9 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
  * 0 on success, or a negative errno code otherwise
  */
 static inline int
-drm_aperture_remove_framebuffers(bool primary, const struct drm_driver *req_driver)
+drm_aperture_remove_framebuffers(const struct drm_driver *req_driver)
 {
-	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1, primary,
+	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1,
 							    req_driver);
 }
 
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
