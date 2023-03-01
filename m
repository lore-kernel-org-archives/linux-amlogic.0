Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF94C64ED6
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Mar 2023 15:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyex+bklYDmT0pzJZhaOpyibDAiZ6Ue4jnWnOTRDC1c=; b=x7pTCQUDfTl81j
	dvQwcY0Wavs3yzRPAtWWa8nXPboaqq6pMgWdL8xWnVZLhnshKIyoXOP4W8g9hG0HDTai47k+Nqasy
	LMvdkwn4s2imJfm9N1l5OoR2PR5EozLUofnROKT3tRlfMUsE2VlToqxwPqH0IGiPFr/SWRTQbERYU
	oCw9GfQ8Lttk5nX9NNoVrKe4Phm3Y4sM54UyAUu18l3ynMEVm5q8YHs8srGdAGN3U3z3c4Ggs4s3r
	K1tZLZjeU1WCMsfU82Pnnet64EOtBCDpB53EWti0Z4gqVk0+gbr5Xpg0EXI4RSxt/4eYXAw3YYdiW
	JFZRpsZMveevy2yt1r+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOdS-00Gfr3-TA; Wed, 01 Mar 2023 15:44:54 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOQL-00GZEe-CM; Wed, 01 Mar 2023 15:31:22 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 222CD21AC5;
	Wed,  1 Mar 2023 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677684680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfRkmKwrhJW1OPOTHv2t9WhWninofMCeQe5Cd5zgHRQ=;
	b=VosYFyc4Oa07xcOdHMa9NmhOOPyC8oVCThk1aqyGP2ZVEHt13uzFhuzuZw556DBJsrcIXe
	hDdWB2yHHnnijiKqjEQmi0sGxMcQlTGVdRv587RNSdeC3snOa8/IQi3fkHsBjmEVl4EYtn
	XMIoweYsaMjA7xY4kJeI4N6PMJwHA0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677684680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfRkmKwrhJW1OPOTHv2t9WhWninofMCeQe5Cd5zgHRQ=;
	b=JcoqCqaMpInpoY9wVdFe7d0LYuX1X8aGnYwTCbKf/sFSi6z+V7shomkT0eI6BSHTOLOCxs
	qTImtOCyYwo1mSDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DD1613A3E;
	Wed,  1 Mar 2023 15:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MOziGcdv/2OAXgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 01 Mar 2023 15:31:19 +0000
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
Subject: [PATCH 22/22] drm/xlnx: Use GEM DMA fbdev emulation
Date: Wed,  1 Mar 2023 16:31:01 +0100
Message-Id: <20230301153101.4282-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301153101.4282-1-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_073121_610413_DEBA4C57 
X-CRM114-Status: GOOD (  11.41  )
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
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 776ef5480206..a7f8611be6f4 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -19,7 +19,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -515,7 +515,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 		goto err_poll_fini;
 
 	/* Initialize fbdev generic emulation. */
-	drm_fbdev_generic_setup(drm, 24);
+	drm_fbdev_dma_setup(drm, 24);
 
 	return 0;
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
