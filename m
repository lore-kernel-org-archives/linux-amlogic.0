Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E680C74A4B
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJBBV/6CwexTgBwXny4Lss0dIWep94xvy3dtQhQyA7A=; b=eWbEc6H870EtEK
	mq15qlhPVdYQvbmfigGCMf3sEDzMCDLE3zjGiz4qSHouZXCgQEzSWo23rGKK7ynR3w03Lb52fVb7o
	Ek7zTosYkzryxmFWUOZqJTBqceOTTX6vZiSWemc1yyrdEf7X+nNe/5KJsYyaaeY7VGSydxM0tGhGN
	HsygI3en4kcKevu+cDgjUYgSKVAq3XBKSmrrMf2r5u3UciOpF+CoLrcgCIoa0xJ+3bNsYiQ4EW9sT
	L0XAZKXoBQuNKYtiBGsFdWiGuUqY31ppvVvdpAY6fEelgIU/7YrepFu5TtNQdAlVzth9O1Zbou+T4
	M5tVJ9+PLU4jSZby6iYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbkhc-006crl-6Y; Mon, 13 Mar 2023 16:07:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbkT2-006Vgb-Cv; Mon, 13 Mar 2023 15:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gI4OaAtbM26LV2A1893cD8w+HeuYtYS/hY0+uW4tXYM=; b=DXVsUaXIlnkqO5dDtatH0M9Zjd
	Z24WyIw7sZpgw+Ab/FoW5XGLsVq5FFRbeXNIpXU0G8d2Em6cUcg6qygO3aTOCzEHSYs7xn7MnkcCz
	l84GXsLzgBXoAm0gTvqGbbsAc+8jIgJ2Bm2+/UcZaQ+tmCz8itsvKko+DFlJRm/ZAygbAr7go/RhU
	O4/r8w+jFKu1otQmQS35RLuzgxdTP44fBKxuq3BxuQwaFmrw0xO/KeYTq6+RxJCw+QGx5FdRyhbGp
	+kYUINowk8o5x9OlHrZiOhkK3edR1IslP0kQTxaLyg1TbFona9XQyK1ZZTP0GN8W0BUIteh5hwpX+
	ooYcrWyw==;
Received: from smtp-out2.suse.de ([195.135.220.29])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbkSu-001QSz-1S;
	Mon, 13 Mar 2023 15:52:05 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71B921FE1C;
	Mon, 13 Mar 2023 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678722704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gI4OaAtbM26LV2A1893cD8w+HeuYtYS/hY0+uW4tXYM=;
	b=b9L/u308rqWHUJTJzdeLzM0/hV3X7EPsI1ISkNuLtSBBSdYU586gN6v3yzOiuuTbgM5xlC
	xhgefKnQFTcSAVHEaNqjb28KJoVDI7ZghWn2PEU4lp7UyFT0oHEEp+EVvxXjeSGFMNpgwx
	ipcrHRBp80CQPwNgCKSSb+tnCPCwah8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678722704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gI4OaAtbM26LV2A1893cD8w+HeuYtYS/hY0+uW4tXYM=;
	b=+NhRsMbPsn0LPBVxh7zIZg+O/NBHwZ9/mmsZgEtbpdjshImbNdFe+dNk/E2kInUN7lzr9N
	VQCXa/qWJI1gmqBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3645013517;
	Mon, 13 Mar 2023 15:51:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yK1fDJBGD2RhegAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:51:44 +0000
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
Subject: [PATCH v2 16/25] drm/sun4i: Use GEM DMA fbdev emulation
Date: Mon, 13 Mar 2023 16:51:29 +0100
Message-Id: <20230313155138.20584-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
References: <20230313155138.20584-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_155200_678283_DA29A888 
X-CRM114-Status: GOOD (  11.24  )
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index d6c741716167..e49f78a6a8cf 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -17,7 +17,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
@@ -111,7 +111,7 @@ static int sun4i_drv_bind(struct device *dev)
 	if (ret)
 		goto finish_poll;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_dma_setup(drm, 32);
 
 	dev_set_drvdata(dev, drm);
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
