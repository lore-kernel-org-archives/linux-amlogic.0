Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E8BC6FA9D
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Mar 2023 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m++4of+NNr8YAFLItOx59f+BuckEe+lPpNORUym746E=; b=p7Q2fzKC4AfmBR
	H0XJ1+SNvvcdSvC1ENbtjV7EOlDI8iEjEOXqBUtt39H3FVgDy2DYChcqNiwqysSCHTenQ62fkieX1
	CHfKBt0CfUznJh1k3baqlI99nzEuUWWBX4p4WbK9TRNkbIimVvhJJdCbC77Wog16ZX5gTyi0rb6co
	3D/u3JbZKf1ONlPy/J/mjKN4ND8RFs5/B4A5aUeaPFZlWqDxwvFI/RAqcvTI7o8HGAa4ozFiztb44
	YbueVvcMmtVWAMIDpavUWANPNFEoV1setudWg5OSxBSpXasXr83jnD2RP75zpB9QU2LnkBE+NSsSf
	mUZRmg1MsqTOa6+qL4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOQl-00GZUZ-UC; Wed, 01 Mar 2023 15:31:47 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOQC-00GZ5S-OM; Wed, 01 Mar 2023 15:31:14 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C3D071FE1D;
	Wed,  1 Mar 2023 15:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677684669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IAvT+3jk1v2984n9xMC3K0atfkDhGLIg4BcmTjxSKDg=;
	b=Bf/VyM34sD1+6BzUk1Uvw1nAi09RXt4rXZzHMsfSE5uRjYBeaKfDDrAtnOkqwrxwHBZ1WA
	NDQM52P1a+G51RsnoIwUevpyYi8c3RH+w1aXeZZUlazu3NqCVV0TGe+rv836R/rUiQeocf
	L+wWoFZwRGVjz/E/zy911V3xD5gxi7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677684669;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IAvT+3jk1v2984n9xMC3K0atfkDhGLIg4BcmTjxSKDg=;
	b=vwRD7VpE6aQB5hfc4rTQCciN+3Oj6QhUWh03H8Fh1mWRB8+jlkWUnud0qbVL/5hjln+IAm
	GkmUAqyugV9sAYDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2172F13A64;
	Wed,  1 Mar 2023 15:31:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GFzGBr1v/2OAXgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 01 Mar 2023 15:31:09 +0000
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
Subject: [PATCH 07/22] drm/imx/dcss: Use GEM DMA fbdev emulation
Date: Wed,  1 Mar 2023 16:30:46 +0100
Message-Id: <20230301153101.4282-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301153101.4282-1-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_073112_971477_7F342CD6 
X-CRM114-Status: GOOD (  11.52  )
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
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index dab5e664920d..896de946f8df 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -7,7 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
@@ -145,7 +145,7 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	if (ret)
 		goto cleanup_crtc;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_dma_setup(drm, 32);
 
 	return kms;
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
