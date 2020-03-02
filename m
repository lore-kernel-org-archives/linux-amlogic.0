Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99047C3F2D1
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 22:27:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5B520866
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 22:27:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FtTXWopa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="MrPcnxfb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5B520866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuvSS82eqSqfp0Xn0OFTjsIghYCYv+1Vp09fmW5tfyU=; b=FtTXWopagckUUC
	DHWnUSMVbyIyb0LoT0NeRKvVwzMOX8jW8PBuOPscf2jaDvB55otkcik2lEVxVodqOs1gF3QnsJmnp
	E4oIREk4oB/xg/7k8Kw/kE2PoeFM3PiTh+F1tTw430+uYXYx+qNm137EFUZkmo2451b7qxktxqplg
	99qJZpN74K+gA8noNAls+Fh08LoK1gMrNc5T6CVGs5nzLVS66TxlrHZYSerA41xMI26bNI+szl1rt
	lXeK7mEyyDrP3tueOej4xdyhwa9YBOyyvjxZW6OM8hGuMlJNTWgEChf7bwpifGept1qvQ7UGUVpiA
	3GCAnVlvIBRRoZzZMk0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8tXA-0003XE-6P; Mon, 02 Mar 2020 22:27:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8tX2-0003P2-Ow
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 22:27:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id q8so1876977wrm.4
 for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2020 14:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pw5QqrfG2RgLwLYrDhVp80l9fnGnOfrvey/8drqHpHM=;
 b=MrPcnxfbao07IGiixrPJTSeiauRZ8LZ1xF4DnuO3LKoMbZSliTkgsyK1ISWn3+ATg/
 hqtxg9jIMaJJuUeKgr/cvqPHeEx91V9x8m5nswQCxmKrksE+uxavszHdfkZAIMDw9prJ
 jeVXdjMlCSK/9uaPsaRICjfdND3cREQg7v/Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pw5QqrfG2RgLwLYrDhVp80l9fnGnOfrvey/8drqHpHM=;
 b=U/9a5LNiprDZECOZyjXhFpDX/6MeeWfm/vilfGashi+6OJvHG98XL8v6sE0jtBwzl4
 +TYuEGIvbTKrYuIKD/RxF/4mkT3F3OBp+j0sb9p7FdTM3lKwAvITtY9Y3ckqHJPZ6ZrO
 XXRM1eNCZ7Hag6QdwdJ7NYtkpFMqbaTs4N2c+JzyDN8vwKRN3JTB+NRbBU3G2/pmRSwV
 0TWOwMril5sUbwS3CpSvzi6Y0UYEJ6wEG43R9ei03SHwZNZLNddADMh704kx3jbjNDyh
 uLI+zoU+My1VccCguX6rT2am0M9TgPeDWkvGDvZ/XT0tRGQFzFe+IBzG18Kjm3f3bkIZ
 pxDQ==
X-Gm-Message-State: ANhLgQ3UQ6awA3iQY52Wio8jRSRM7VhQtaJQfqt4xtB3x7cUFNIUX1mZ
 0S66sbQ1IYku2KyoGgsPdTF+sg==
X-Google-Smtp-Source: ADFU+vsTFOKD20gzbzZfkTT8QuXbSOhK0ILlysvVCCIQ/Jhu4BysiOPZ5axKJP8OA5+1qd/7gZ3zxw==
X-Received: by 2002:adf:df8f:: with SMTP id z15mr1599343wrl.184.1583188042987; 
 Mon, 02 Mar 2020 14:27:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:22 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 34/51] drm/meson: Drop explicit drm_mode_config_cleanup call
Date: Mon,  2 Mar 2020 23:26:14 +0100
Message-Id: <20200302222631.3861340-35-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_142724_813157_DAB75C02 
X-CRM114-Status: GOOD (  13.04  )
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-amlogic@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
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

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> (v2)
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
index b5f5eb7b4bb9..6f29fab79952 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -284,7 +284,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	/* Remove early framebuffers (ie. simplefb) */
 	meson_remove_framebuffers();
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
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
