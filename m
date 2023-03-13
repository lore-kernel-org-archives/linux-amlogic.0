Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04EFC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2x9+frnbFvA0/iwqk7MozGAcPPrd/0V1dBRih3UPzRg=; b=1blMA0+NLmmgvo
	lVbWNEy2jJyTt+DbnPXxiUakMlU6ldlU3VovHjkZn4ZhqkfTEhFie4EFSdpxiSnOByNzLU2yIK/CJ
	3J317H/SM080NEATj0XMbMXAZRjlPeJgSJaDABiHHb7256npQ7ZLzmTOj4hSfpMtGWHPUhpbOrgTu
	ysqo42J9uZCCZbrIvS8HtIxrdauZ8bK2zf7p5PhSw+/tBrNTPpiKnBIZArItz0Gf/mlcVazxVN49B
	6Q/eUXTwErhcFWa5i1s/MO249IKPoXGFqtw3MSVvDvVmqUAvlrlTzVZWX/Rp2hq6NrcBH+X7vEVeg
	UcAu752V6/UhtVjTFJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbkhZ-006cqH-QU; Mon, 13 Mar 2023 16:07:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbkT2-006Vgd-Cg; Mon, 13 Mar 2023 15:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KKEYUxZu+JYHv+sdwTweA2t6Q6UTV9pLk2mYvTgn+cE=; b=KwpWekMkY1wFmMs/V7SuigNrsA
	HwleyLSZBPv2U+Y/MxbtZhgY3kdsvLxbj+Mqj4mTMk3674iVt3v9AhC+2NNlbCJ/BhOEW14wlctYy
	tvfbxpVyl1rOgB6RSLwBGYzGPKZfia7q+0c0g1J4bdQoowA3Z6q4sj+l6yNAGDVtXIl9R+1ntQ2tq
	1ycyr5AwyD15K5bmPonHJApjOSYDhZuUvEVfSG5m8VLXOx/XUKOeGllF5+V6xjYgQFX++GAVitf0Q
	GWylD9Rx7M39rhw6Rzz9jyvTO4uan2Oaowr5rSm4BczRSgP5fGONAidjMC1HSuGd+kMvLBMiwjFGM
	3gqkWUQg==;
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbkSu-001QSw-0B;
	Mon, 13 Mar 2023 15:52:05 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E33B91FE1B;
	Mon, 13 Mar 2023 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678722703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KKEYUxZu+JYHv+sdwTweA2t6Q6UTV9pLk2mYvTgn+cE=;
	b=giRjr8+QEjl6DFY6HM4RdeF2JGatrPCkRDd0sXJ6W/plQZEOZ102MTHtnlrqwZP1xJ6hvu
	xY7tkG00MzhOWiCxdl6A1F7UvhTSGOy3rZbPOVoODWQJlvuW0bZr+KL7ZI3tbf2/xeLcBu
	uvWVqMzEo4yfIWn173CV+ju6GvjuhLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678722703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KKEYUxZu+JYHv+sdwTweA2t6Q6UTV9pLk2mYvTgn+cE=;
	b=qV0ZRxTj2xKTz/9EPBI3fX8zva/Pvp7vklNCGJcDQSMyTQATsoet32cjHfufLWAUDPA/r7
	rHYJT8gh/JLZk3Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A713D13517;
	Mon, 13 Mar 2023 15:51:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WLjbJ49GD2RhegAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:51:43 +0000
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
Subject: [PATCH v2 14/25] drm/sti: Use GEM DMA fbdev emulation
Date: Mon, 13 Mar 2023 16:51:27 +0100
Message-Id: <20230313155138.20584-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
References: <20230313155138.20584-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_155200_587613_ED856B33 
X-CRM114-Status: GOOD (  11.15  )
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
 drivers/gpu/drm/sti/sti_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index ef6a4e63198f..1b87b5899f9e 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -14,7 +14,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
@@ -199,7 +199,7 @@ static int sti_bind(struct device *dev)
 
 	drm_mode_config_reset(ddev);
 
-	drm_fbdev_generic_setup(ddev, 32);
+	drm_fbdev_dma_setup(ddev, 32);
 
 	return 0;
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
