Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EB0C64ED6
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Mar 2023 15:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3tiHupWuw9DNjzjzT7aCyfkL+R/UETAkh6kJomYUwGU=; b=IK7dv0VJn6qXF1
	XO3LU/9FnC4nZIPhVdMXcB9TxfO54hKDxr+9Kfw4SSPr9ZDzOW1jNPvAF4RAe6fCqmoqPf79OvTOq
	SGAhpxb9C8MJH924nkni/LkzXGbh+MIlDii3XHAGLK584jWPtrn2f0n78W9Mwv+RBzMkwBjqhRKkU
	O9Ocdble3AzTVY6J5uvdWXZx8fnR20BpZmfoell4TR/bkbnEXfJDapixkqD5WhuprKRttEA9OQYfB
	WQZzqblB+q7kLYr5DOskpCcZJro/bnZsUyUrY9oYRUVhgg5KIAL6yNCufF1vBoqOMu1GOGvOz6S56
	WSncVfQVZnaunVZZzcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOQT-00GZIa-Ru; Wed, 01 Mar 2023 15:31:29 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOQB-00GZ4m-Pv; Wed, 01 Mar 2023 15:31:13 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C0FA21AA3;
	Wed,  1 Mar 2023 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677684665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zw4dcdCN/ycasTQJ0C3H8gsaU2IXHFez421oPjJCncY=;
	b=wA3/W1cC4TC8BHEH3IiE0+apZ6kp2bRmn+v7SGYBVDc5X9b9f1IZItdN1Y/suoHKXAGw5m
	U+XpoHiN0bEuKvIWKTTAMDYlYxTOLmvDx5Urjo1JcL1oiVw407nOmMfB9jihtNifgB3QoZ
	FRoJOkP5v1Fs1h6BwC7mmYCiQc7MeZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677684665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zw4dcdCN/ycasTQJ0C3H8gsaU2IXHFez421oPjJCncY=;
	b=yG+7wxlQKAG+OR3mc0NmwBLhhBwcvf62OjpzwT4LsCYJyvJLtk6VTeWVQA9kkWL+VXPux3
	qGYvo5KXltbSWQCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A731613A3E;
	Wed,  1 Mar 2023 15:31:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id p777J7hv/2OAXgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 01 Mar 2023 15:31:04 +0000
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
Subject: [PATCH 00/22] drm/dma-helper: Add dedicated fbdev emulation
Date: Wed,  1 Mar 2023 16:30:39 +0100
Message-Id: <20230301153101.4282-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_073112_026087_607A42B8 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Add fbdev emulation that is optimized for DMA helpers, as used by most
drivers. It operates directly on GEM DMA buffers in system memory.
Memory pages are mmap'ed directly to userspace. No implicit shadow
buffers need to be allocated; as can happen with the generic fbdev
emulation. Convert drivers that fulfil the requirements.

Tested with fbcon and IGT on vc4.

Future direction: providing a dedicated fbdev emulation for GEM DMA
helpers will allow us to remove this case from the generic fbdev code.
The latter can then be simplified.

Thomas Zimmermann (22):
  drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers
  arm/hdlcd: Use GEM DMA fbdev emulation
  arm/malidp: Use GEM DMA fbdev emulation
  drm/aspeed: Use GEM DMA fbdev emulation
  drm/atmel-hlcdc: Use GEM DMA fbdev emulation
  drm/fsl-dcu: Use GEM DMA fbdev emulation
  drm/imx/dcss: Use GEM DMA fbdev emulation
  drm/imx: Use GEM DMA fbdev emulation
  drm/kmb: Use GEM DMA fbdev emulation
  drm/logicvc: Use GEM DMA fbdev emulation
  drm/meson: Use GEM DMA fbdev emulation
  drm/mxsfb/lcdif: Use GEM DMA fbdev emulation
  drm/mxsfb: Use GEM DMA fbdev emulation
  drm/sti: Use GEM DMA fbdev emulation
  drm/stm: Use GEM DMA fbdev emulation
  drm/sun4i: Use GEM DMA fbdev emulation
  drm/tidss: Use GEM DMA fbdev emulation
  drm/tilcdc: Use GEM DMA fbdev emulation
  drm/arcpgu: Use GEM DMA fbdev emulation
  drm/tve200: Use GEM DMA fbdev emulation
  drm/vc4: Use GEM DMA fbdev emulation
  drm/xlnx: Use GEM DMA fbdev emulation

 drivers/gpu/drm/Makefile                     |   1 +
 drivers/gpu/drm/arm/hdlcd_drv.c              |   4 +-
 drivers/gpu/drm/arm/malidp_drv.c             |   4 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c      |   4 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c |   4 +-
 drivers/gpu/drm/drm_fbdev_dma.c              | 275 +++++++++++++++++++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c    |   4 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c          |   4 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c     |   4 +-
 drivers/gpu/drm/kmb/kmb_drv.c                |   4 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c        |   4 +-
 drivers/gpu/drm/meson/meson_drv.c            |   4 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c            |   4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c            |   4 +-
 drivers/gpu/drm/sti/sti_drv.c                |   4 +-
 drivers/gpu/drm/stm/drv.c                    |   4 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c            |   4 +-
 drivers/gpu/drm/tidss/tidss_drv.c            |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c          |   4 +-
 drivers/gpu/drm/tiny/arcpgu.c                |   4 +-
 drivers/gpu/drm/tve200/tve200_drv.c          |   4 +-
 drivers/gpu/drm/vc4/vc4_drv.c                |   4 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c            |   4 +-
 include/drm/drm_fbdev_dma.h                  |  15 +
 24 files changed, 333 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fbdev_dma.c
 create mode 100644 include/drm/drm_fbdev_dma.h


base-commit: 734cd918122f6ec06e4c9366fb3283b29b1c7ea5
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
