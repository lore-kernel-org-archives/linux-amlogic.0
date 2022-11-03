Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9FCC433FE
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Nov 2022 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/xnt9yY9Lre0TCJAm+GjgULFnMUIFNhUru0CB/KAPs=; b=hKpyUVPiGwWi++
	l6t0DOuYzSyGlwBEQ67hWa5rO9y76GpcJpmSxpHFtPNkLiXcRMXLfW/PMr4s/qA+FZaJNpEzCXVqL
	kD2weYw2ZF2ygwxL9OmKLmfSQSlx6lAP+9XUxtmYQg3OG+uJqmeOPbtdPmtYhw/ZX/+aRGoH7c1/i
	X5OBLpmYajLea3f0cYonvsxZrSO1RmL2U+4KkgyRiStrvRDVMtlo8Je4kzgrX3Pa/AUrpqFG6DkJN
	uHDhdE/tv2P0UvabjhqPOsM6lbOEOXKlh3WJuRnb6F5IptU8fLkQoQGwB6q/DBT2uP+qidUVLMhAM
	yLyX+ekEW0fi2Zrs3dpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbyS-000HjK-GY; Thu, 03 Nov 2022 15:17:44 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbvt-000G9O-IL; Thu, 03 Nov 2022 15:15:11 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 382061F8C7;
	Thu,  3 Nov 2022 15:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1667488493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjxS/GfnitqpIX/oT1VDr+4iEgFe/+oN1n1IofhuZsY=;
	b=utvMig1eoj479eEriWrJ0nVTCL5Lk9KTSWVVHrqrowWjVIG9DcwMkAyKHQsokhUAZ/vfMH
	CbiE82hRJwGqH4DJZO+M+ZfnFfFE15gZZZvFO9Kjd3zgY9PKFOebOIJ3YCpvT2mUTjYImS
	GVI9v08EO77cHzHLlYtnySmWx3JwW84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1667488493;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjxS/GfnitqpIX/oT1VDr+4iEgFe/+oN1n1IofhuZsY=;
	b=+fI4CarHR9yIQjwk6lIjBSv0KJzOZE4PnC+U4vE+56gARj3H/onb+TrQGL6o0rt+MuGYBt
	9zhCVmzjlb45cQDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B24C413ADB;
	Thu,  3 Nov 2022 15:14:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gJTAKuzaY2PBGgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 03 Nov 2022 15:14:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: "linux-hyperv@vger.kernel.orglinux-hyperv"@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 07/23] drm/logicvc: Don't set struct drm_driver.output_poll_changed
Date: Thu,  3 Nov 2022 16:14:30 +0100
Message-Id: <20221103151446.2638-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221103151446.2638-1-tzimmermann@suse.de>
References: <20221103151446.2638-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_081505_923643_47B9E8BD 
X-CRM114-Status: GOOD (  10.63  )
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

Don't set struct drm_driver.output_poll_changed. It's used to restore
the fbdev console. But as logicvc uses generic fbdev emulation, the
console is being restored by the DRM client helpers already. See the
functions drm_kms_helper_hotplug_event() and
drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.

v2:
	* fix commit description (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/logicvc/logicvc_mode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.c b/drivers/gpu/drm/logicvc/logicvc_mode.c
index d8207ffda1af9..9971950ebd4ee 100644
--- a/drivers/gpu/drm/logicvc/logicvc_mode.c
+++ b/drivers/gpu/drm/logicvc/logicvc_mode.c
@@ -10,7 +10,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mode_config.h>
@@ -26,7 +25,6 @@
 
 static const struct drm_mode_config_funcs logicvc_mode_config_funcs = {
 	.fb_create		= drm_gem_fb_create,
-	.output_poll_changed	= drm_fb_helper_output_poll_changed,
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
 };
-- 
2.38.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
