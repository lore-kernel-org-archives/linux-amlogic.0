Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC0CC7EE2F
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Mar 2023 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsFDKvvrtiozmIZh0+NkGzbEEfKn2PNc7svQdo9dcaI=; b=XkJxYUVZxC+Pa1
	mTw5MUtEKbkybnSEx6/t0IldmVS+G5NmBxK+EY9bCRjT65EZY/IiztBeRnPaROYFl/IK4AakpD5Dm
	sFNnkMRawJSS4UwRGwZeaL6bNf13UgHeTW3IieiyX0CjnRlDZrjB4UqryZsKhCuz9/5dDbpE3xQ4R
	9aXuEukpa7i0jTDYCWogAAql+uFMgVKNG2D2DQKXn1W/sYmdvw61stPRWhIRPZqmMaku5tnXc6TcA
	eMYvoDhd0FkmzE4i8yCpP8XV+hFnCr8tufEUMq4fSqObtqH2yZRTqvR02axdaND6jnnvFbw56VAJL
	Ck/ICAEd8bVAVSkXjwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOQy-00GZfY-VB; Wed, 01 Mar 2023 15:32:00 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOQD-00GZ58-07; Wed, 01 Mar 2023 15:31:15 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BFCAC21AA7;
	Wed,  1 Mar 2023 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677684667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjcAFWFsJPWZxHpm56Eqdq0obX8Q8rSquRwhTTp3QMU=;
	b=mIDAt43dDs+To91ecv8bucsPtGSt9wKaNNY2Q6XXTuDkDtla1ZTzP2CGMxy6kjJTOzZrSS
	dRMQ0Hd3tlv1PDlq9X96tC9MPjwikGBGBxQFLRXpEkNPAnbzzmtaDbcPWwKAlHEp0DOzrv
	+MCPo3GMLoY63qU/juad0H2probiIU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677684667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjcAFWFsJPWZxHpm56Eqdq0obX8Q8rSquRwhTTp3QMU=;
	b=TwOCKDAmEAB+p0pYkVz6QqUF3ZnUtIGoQ2JbQqjb1NYITQRSexTAeS5PNg9Pz6d6BTTAcy
	fi9N5mFoIvcqzZBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E42913A3E;
	Wed,  1 Mar 2023 15:31:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gEF/Crtv/2OAXgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 01 Mar 2023 15:31:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	andrew@aj.id.au,
	laurentiu.palcu@oss.nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	p.zabel@pengutronix.de,
	anitha.chrisanthus@intel.com,
	edmund.j.dea@intel.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	alain.volmat@foss.st.com,
	yannick.fertre@foss.st.com,
	raphael.gallais-pou@foss.st.com,
	philippe.cornu@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	jyri.sarha@iki.fi,
	tomba@kernel.org,
	linus.walleij@linaro.org,
	hyun.kwon@xilinx.com,
	laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/22] drm/aspeed: Use GEM DMA fbdev emulation
Date: Wed,  1 Mar 2023 16:30:43 +0100
Message-Id: <20230301153101.4282-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301153101.4282-1-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_073113_224107_CB748B23 
X-CRM114-Status: GOOD (  12.50  )
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

Use the fbdev emulation that is optimized for DMA helpers. Avoids
possible shadow buffering and makes the code simpler.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index ecfb060d2557..c8c7f8215155 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -15,7 +15,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
@@ -341,7 +341,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_generic_setup(&priv->drm, 32);
+	drm_fbdev_dma_setup(&priv->drm, 32);
 	return 0;
 
 err_unload:
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
