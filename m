Return-Path: <SRS0=NsVS=4P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2035C35E15
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Feb 2020 18:16:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE0EA246B2
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Feb 2020 18:16:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S2EYfoBf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="j1urywz2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE0EA246B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1ewhtQ3RWB6msGCsGxJLmqzrUA/FaxGIG1awvNL7Ys=; b=S2EYfoBfXREa3u
	eWw9Wg4by+rEFQNWB9isHqXkQT7Ud7BBKRUzkUrJZzcLs6wRbSBwDqja//RQdOyIlQW+z4PQRhvK/
	FlhdT5AakQlK5OSu5dRfM62t4Gdvizpe2zCueMJvSTgxrWY7onVKujzBWTXcGefKT8t5lstAbrtsc
	xh1k+oEPprwGTU9Xj7HcLKINFsRF1AHaCFTMGLYYq3YkF19cmgKVgVv9JJ1LB211fdf5DiBJnfoM7
	sPA8GxbMqtcbA1p3jQ6YL6Fn//pNqO9I9z7vGWrE9IrGn+0poF2Ynp4q6PyHpW5ON98zup1S1AR/Q
	KfhEUxzEbTIz/npTEx+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Ni8-0003Xt-DC; Thu, 27 Feb 2020 18:16:36 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Nhn-0003Ej-9u
 for linux-amlogic@lists.infradead.org; Thu, 27 Feb 2020 18:16:16 +0000
Received: by mail-wr1-x441.google.com with SMTP id m16so4591107wrx.11
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Feb 2020 10:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jT8UWtmCEe7v58pjwlPCLN4e+N26kni/TNK34oplFDI=;
 b=j1urywz28vACwh8HeXCI0pWn82lWe/B/YSJs06vF1xxUNVwLwrWhvEcZUCt+X61S5B
 B4EFdH6XlxywuP9aOi6Byn4Bmz1vczC+Gp9d7e5XmInWuFB2es3F+OYp1ZA68V5cLlLG
 1rgm/RSRSw/Vw7nRvs2pGGUg/ufCKGhRrtrz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jT8UWtmCEe7v58pjwlPCLN4e+N26kni/TNK34oplFDI=;
 b=WjwdgO/uB8u2EQ3Ln3hw1f3ethGEzpWx9lWbKAkLJ2ypnddNN7DnFeY/DlNGOfvuCO
 Ln/q43tGT2BKf1tX4wcqC54LKUfeWnYXbM59jweQFU8Rd8j2DfG7jQQOG/0XEMUOblIj
 7qiIYLZeruB9jamO+PVxK8p1TylQ3Q4jJmIvXNK09sJW/u4TGSGIGY+HQZeqOluH8AW+
 8LY/mrMiCeov9xUq5ET2Bw4XJdiu0+ysQepcGOcWb9ovmfLmEhLaNz0iGifZTX743bkq
 8J9bA5HiFVq30BIkuPUt9n5oehWaaimq9/5wRrjGeGg8wTg9TxqfvD3K3IVMMMhy5yuZ
 +q+A==
X-Gm-Message-State: APjAAAVhOoVRtWGPXICixrjCQbkBhhRW1rAGuDpmFkghJyr1i59VSRPq
 NfU1rPZqJ6i0eaOYLrzbM2pU7Q==
X-Google-Smtp-Source: APXvYqwp8W10k7C5K+ykKuRFLORaJou4Cd5K/QJEEhZlzQs0FVvABfEDei7QmchEa6j8YPIsywTXaQ==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr153646wrr.104.1582827372723;
 Thu, 27 Feb 2020 10:16:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:16:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 34/51] drm/meson: Drop explicit drm_mode_config_cleanup call
Date: Thu, 27 Feb 2020 19:15:05 +0100
Message-Id: <20200227181522.2711142-35-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_101615_353376_8377D533 
X-CRM114-Status: GOOD (  13.16  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: This driver gets its devm_ stuff all wrong wrt drm_device and
anything hanging off that. Not the only one unfortunately.

v2: Explain why this cleanup is possible (Laurent).

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index b5f5eb7b4bb9..ae94d14ab7bc 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -284,7 +284,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	/* Remove early framebuffers (ie. simplefb) */
 	meson_remove_framebuffers();
 
-	drm_mode_config_init(drm);
+	ret = drm_mode_config_init(drm);
+	if (ret)
+		goto free_drm;
 	drm->mode_config.max_width = 3840;
 	drm->mode_config.max_height = 2160;
 	drm->mode_config.funcs = &meson_mode_config_funcs;
@@ -379,7 +381,6 @@ static void meson_drv_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 	drm_irq_uninstall(drm);
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 	drm_dev_put(drm);
 }
 
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
