Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F36C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZ5mTDNFpJl9Trk3E0SsBozsJotE97uK2vDrO3Yp30o=; b=dN4M9GcCJatJNv
	6XnNSwDRlCj/Du5zDajSlAyoH4WvxJpkvqR1I4D3E52mWt4BAWZJDKv8/9x+BIg+Nqfnw2TbK7fIy
	Pz3T1x4z+xF/qNqF8ED02+ZktBUnrwBR2vN+WwGxFmddez4rhitAux1lAco/oir831QspbB5JNxZs
	VEJAhUGoelMlpRcWbTS43kSdXhwBlQfZ41kV6yfWFDwS6QNSoXY2jUu7uMsBOaPJHHTvb1jMZF1PN
	2x4sbjlDz+Cc/cF8CE4PGx8PTFZsQyrQWE9MdRAR20ahNYg2Zw9Uz4gAmWAn9/yVmO9HsDYGBIgE/
	8NlML/ZvFc4ULsitsusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbkXC-006Y29-Fv; Mon, 13 Mar 2023 15:56:26 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbkSl-006VSt-NM; Mon, 13 Mar 2023 15:51:56 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 515C922AE0;
	Mon, 13 Mar 2023 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678722706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RrI2Z623laCpkz5xcMwL8KspUXzsIgPKKjaFMh8wl0U=;
	b=wi8QMsI5aDOplZY/NoEJsVAlSpGSZ7Xb354KfzRV7zXDfr0ZfFfWIl+SF6BRm4XmDo1N2C
	OjA66cNc+VqYhm6p4vLkQO7UiOt9wit/9CNvMhP7tkG55kA/PsqGCHD55zcOylLF6a70Qr
	zXUSfuA1vw4330xlp5Zx5FG0yQFCUwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678722706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RrI2Z623laCpkz5xcMwL8KspUXzsIgPKKjaFMh8wl0U=;
	b=VN6Lcutmcpynay5pIsmC9uuTNoJNS5ExZKUPLPJXIvpdYJInd+iB9OD3R6RMoTScynQ7d/
	XnKdYjSpTRp6nLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12BCB139F9;
	Mon, 13 Mar 2023 15:51:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KCCqA5JGD2RhegAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:51:46 +0000
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
Subject: [PATCH v2 23/25] drm/mcde: Do not use dirty GEM FB handling
Date: Mon, 13 Mar 2023 16:51:36 +0100
Message-Id: <20230313155138.20584-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
References: <20230313155138.20584-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_085152_020169_599F065A 
X-CRM114-Status: GOOD (  14.74  )
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

From: Linus Walleij <linus.walleij@linaro.org>

This driver has no way to handle damage, the reason the
drm_gem_fb_create_with_dirty() was used was because I had the
ambition that the driver would only send out updates to DSI
command displays whenever something changed, so as to
minimize traffic.

It turns out this ambition with command mode isn't working
in practice because all the MCDE does is to create a
continuous stream of DSI commands and while it is possible to
send single frame updates with it, it's not been worthwhile.
So we are just setting up continuous updates.

Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 4aedb050d2a5..a592ad0d7886 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -94,7 +94,7 @@
 #define MCDE_PID_MAJOR_VERSION_MASK 0xFF000000
 
 static const struct drm_mode_config_funcs mcde_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create_with_dirty,
+	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
