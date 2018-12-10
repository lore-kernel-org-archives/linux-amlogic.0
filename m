Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC40C04EB8
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 09:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C5FA2081F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 09:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCSlPj3Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jt1J7aQy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C5FA2081F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UXBiOLRXdZeQ9RXk1gdM4bi+DyoB6/S8hS0FB+QLGOU=; b=gCSlPj3ZgB/gX+
	oSBPqEqYZNELZYT0TG6Qzu8fScNHZyMKULSM5LEtBR8yhD+GYvfNvxY6gUrT+YM6ThztSthayIHK0
	rM2JpkgczxMvsig4egJBMPOGWpHJikaCd2qqGuMN6YlUi0b1JJmwoskkhWOO8BxnVFTPs6Nen2dg4
	4Zx7yuIow67XWq9gNjiDhkooTuZK8drnTZitg1I3TReTqces+GQNpOOUqM+uV+uQyvaR8zxh9K3eV
	VTV+2aQLVXJs18RIITSCDuFSTFuo0eq1I05Ohp+ysJ6OHP/qopW3GvmgOEnOR4tkASljvOwwwwUen
	LG0fztOqzfdfYMbvwZHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWHVF-00083A-8T; Mon, 10 Dec 2018 09:05:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWHVB-0007jH-78
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 09:05:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id q26so10269058wmf.5
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 01:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acAAxuC8xw1vTrdEMgWFf+3ymowNGDjPcrhaXEGaw/k=;
 b=jt1J7aQyGQlJI3EAKqTBItpaPYQr688BavuyAc1+va5mHIYQwqWazQN6De0z89j3+s
 yVGuuXZF791gkZG9rMGo966zlZF0sy25P5URvAf5V77O9lTV+tdH20U45zoEC5pJ7db/
 mML7K3qJ9sw4qMK+09+oOp6k5MQM3RK2hPfp0qVGbkBFVY80aX8iK62ccYm9M8ANtXsV
 5AOstZOIeVtqw9MQuZp7yOGIOMrmgFCCbdrVHgfdbKhAAhJLzb8H59xh5iaVYw5k5rpG
 8JFSSP+pdhT8FK2l1c99UeyY9yrTXmf7TmWSyCwd3U03ZmPcoIu7fyZZSMDcn2p5otP+
 TMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acAAxuC8xw1vTrdEMgWFf+3ymowNGDjPcrhaXEGaw/k=;
 b=Fkmcb4A/quvtcRssVrNves/2zND+n2pGvnuUgomX2uNDi8E1fquhlmi1yi9dyixIMr
 odtwgfkaQuiIoOuHFS95sf3iNusUHKB0lMC6BGTjry/Revux9FmOZ4++Ue0wycW02ESh
 9bGXExf9l+lo3NmLt4ow9dAfCYsFXzIPb6lOzlu7LF/h+xG6dS4MhuMNuzKtpZGA6IuP
 gpdYj86rRPpSgTxS357EUJAN1pzoloxpEn8wDJk1d6t+mY3CibW13edy0XaUe4mmtx7p
 DziJhwfEKNOSlkF7K7I3bwZXNU5B3HFDRxxgyrpAkN2ve0KmSPGCNzUrsrzXOAHSoHWy
 oDhA==
X-Gm-Message-State: AA+aEWa1eVLOfTpxPLqmdoByHhx+oCwfnG0yZPFkZqSSeyPamwjHapZB
 eQXBh7Aj4FInWLPzb7oUt8fyPg==
X-Google-Smtp-Source: AFSGD/WwDn7wNpxnXfrYlXOznRcRKD+iMC5hbzSFdAA/4q2QjwKIvN0sVQqBy4Pu5KcJY4BK5C9y8Q==
X-Received: by 2002:a1c:cbc7:: with SMTP id b190mr10597829wmg.13.1544432709087; 
 Mon, 10 Dec 2018 01:05:09 -0800 (PST)
Received: from localhost.localdomain (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id s202sm11066031wme.40.2018.12.10.01.05.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Dec 2018 01:05:08 -0800 (PST)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] drm/meson: remove firmware framebuffers
Date: Mon, 10 Dec 2018 10:04:48 +0100
Message-Id: <20181210090448.4301-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_010521_405029_71B4B9EC 
X-CRM114-Status: GOOD (  10.77  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In case we are using simplefb or another conflicting framebuffer, make
the call to drm_fb_helper_remove_conflicting_framebuffers()

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index d3443125e661..82fbd7ae80e4 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -159,6 +159,22 @@ static void meson_vpu_init(struct meson_drm *priv)
 	writel_relaxed(0x20000, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
 }
 
+static void meson_remove_framebuffers(void)
+{
+        struct apertures_struct *ap;
+
+        ap = alloc_apertures(1);
+        if (!ap)
+                return;
+
+        /* The framebuffer can be located anywhere in RAM */
+        ap->ranges[0].base = 0;
+        ap->ranges[0].size = ~0;
+
+        drm_fb_helper_remove_conflicting_framebuffers(ap, "meson-drm-fb", false);
+        kfree(ap);
+}
+
 static int meson_drv_bind_master(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -242,6 +258,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (ret)
 		goto free_drm;
 
+	/* Remove early framebuffers (ie. simplefb) */
+	meson_remove_framebuffers();
+
 	drm_mode_config_init(drm);
 	drm->mode_config.max_width = 3840;
 	drm->mode_config.max_height = 2160;
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
