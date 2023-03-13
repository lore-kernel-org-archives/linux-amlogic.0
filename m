Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C317C6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jH87FjikXVavRj++z63hGUJth+7aKdMzqEt9FgRH5DA=; b=Km2irWsw632+YU
	n5GVu9U7BWJQJyd6JON7tI1K0VrhhV7k+lIpKKiF5NKXLCsaPi0PuuN9WR04rEbY4qANN2Neyz8j1
	EgCBORPvtn2cJ6ckgStl2PuknRrrZ/Kai2+Z9oBTs1OdfwQbAXS1Eif2qXqzVNUOD6BSeYY0sJ9Ia
	Y/oogrdc5vsRE20wnwxmJd7DXIujfyEPnni3WwfwLjfUQcVIX2qpynJUsOj+So7TvHRugOG4qr5Kh
	NyKiZMCE5NgeMORbTIMYiZpB0NDlIWGY8nXli0zl3hz4cwlu+UKVA3w5csKmI+Hg4BQWtMHqPNX2S
	H9UIkaqhpYQNHpXLoWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbkTj-006W6E-Ru; Mon, 13 Mar 2023 15:52:51 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbkSg-006VN8-FD; Mon, 13 Mar 2023 15:51:50 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A1A61FE0E;
	Mon, 13 Mar 2023 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678722700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=47A4YXQ11MpeBJn1Uq9igqUu87CbauQsH7PzCpVKLYs=;
	b=mDP/gC9Cpoqys6XsSv0Z2byMXySgxxZUj5gPc+bAOyHdJVSxBDB5W4gAcwBejKoqJ+WKR1
	+tlFS3kAigGODyc2xc8Qpf4SStsbhrQL3K37dVpmNq4WFpQuskoSWYTNk8slm2tzB2INm4
	T0tKZegDMYzadP1WsEr3KxyWWWnTe+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678722700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=47A4YXQ11MpeBJn1Uq9igqUu87CbauQsH7PzCpVKLYs=;
	b=uAOnQ4AYZqwVx/tSGur4PPPV0yjkl7p1dZ1luN8QZS/LCWRpfNkbBSJAqxnkiv0qdDzo7W
	IZGy8YGc69SYoACQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DED4713517;
	Mon, 13 Mar 2023 15:51:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9Wp9NYtGD2RhegAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:51:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	linus.walleij@linaro.org
Cc: linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/25] drm/dma-helper: Add dedicated fbdev emulation
Date: Mon, 13 Mar 2023 16:51:13 +0100
Message-Id: <20230313155138.20584-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_085147_063234_9D6898EA 
X-CRM114-Status: UNSURE (   9.26  )
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

v2:
	* update mcde and pl111 as well (Linus)

Linus Walleij (1):
  drm/mcde: Do not use dirty GEM FB handling

Thomas Zimmermann (24):
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
  drm/mcde: Use GEM DMA fbdev emulation
  drm/pl111: Use GEM DMA fbdev emulation

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
 drivers/gpu/drm/mcde/mcde_drv.c              |   6 +-
 drivers/gpu/drm/meson/meson_drv.c            |   4 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c            |   4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c            |   4 +-
 drivers/gpu/drm/pl111/pl111_drv.c            |   4 +-
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
 26 files changed, 338 insertions(+), 47 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fbdev_dma.c
 create mode 100644 include/drm/drm_fbdev_dma.h


base-commit: b21ced77ae1dbc3d8b01d3aef3c99bba7377a69b
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
prerequisite-patch-id: 75f2ebf12693f23508f00d574b2b57488723e474
prerequisite-patch-id: 718531bf5cf15716834cfaf3008ea0e2366ec927
prerequisite-patch-id: a793aa283cf41f290d970404881f24bffc48caff
prerequisite-patch-id: e74f259d1923247a74d5bf7d996afb0e6ca01883
prerequisite-patch-id: a1d12b9548110b1f5e9aa3803b21e2a7f9f8c19d
prerequisite-patch-id: 033f10da72f10d82f113a5066a3b3a7ff91d13aa
prerequisite-patch-id: 976264fafbd69d0996209a90a3d546d9be3f3779
prerequisite-patch-id: 617c74af5e16717898a23ced9c8badfff1e0ade7
prerequisite-patch-id: 5e0cfa9c81aa7ceb2cc48c5cbc9934496251fac4
prerequisite-patch-id: 13594c3cc8102960bb195bc7f572fefba8eb19d7
prerequisite-patch-id: 99d9da7e08369050d135c23d32dead811bb9cf97
prerequisite-patch-id: 833f9d8341a287961ee653b04730da57ce987b06
prerequisite-patch-id: 5d5c9caaf9489a6c2f688d632a57a0fb65fcb5f7
prerequisite-patch-id: b64758ecd64ec0c0acd96d0766ba891378c5c539
prerequisite-patch-id: 37a7d3e9fb3e4e2b7ebeac3f77da6610f12beea3
prerequisite-patch-id: 99073429dafdc98cdd31464ce28e795696a149f9
prerequisite-patch-id: c2247eca44927569cd2b6d9f370195965346adb4
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
