Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE1DC04EB8
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 09:29:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A347520821
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 09:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ossp0Fce";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xJIdGNeK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A347520821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WDAHZS/fMvuAwg3v7ej6V0qY4MmtSSd9rk/PUp4BYtQ=; b=ossp0Fce3HMXCl
	Q2KUhsm9hG/rBS76Sar3KmLsoP/9eO0F9IXwEoQ8Q9HT2wmM48T8he1JXBrgQHCU8rtbNNsBClIdB
	JAQBWMo1LcWwFgZHzX4FhbxjzCccN3S6T1lalDjh+TqADVqgKycve0YkeAmCAlTEXhni+z7coaZNI
	Jz6md8mIUwkwFGeWfUf/pXxt6e5qdHnsh9xpRY/dGZ/HTnr6hf0/r91etrHHKuzX03NDKPGkOxNQO
	lQTtHKddL5NUbyQDgszIgykfJj/BD5JYhiiVeqMrxcIWqK9nE2npAfw1HUpwP31QcJov78AIOCOUX
	3GHd9pNHOqqeia9A8Ysw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWHsO-0001EL-CB; Mon, 10 Dec 2018 09:29:20 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWHsK-0001Ch-UF
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 09:29:18 +0000
Received: by mail-wm1-x341.google.com with SMTP id m22so10428802wml.3
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 01:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DLy0SwLSlaGwBkl+R1noWL7/C+Z5I/Uca6dIaJcbB2c=;
 b=xJIdGNeKegPSOtQ+PEIf8lJnRNSP/2by2POqN0ozS4xMRjCrs94QlI6MkjbzxGo7/D
 6e5CdfuwmScOkQF6kKxVmeSJ4vz1n3rWiWiq9CYIZ0vUsuxp4PKEwfEOuK6AyQBlFYab
 0ccIrshx8NSYw7fgS0ncO1jXA7LZWkzHgbIpt9UqHvRPll+ObfbJB26dZB5nvstK2QRs
 xH0wPQLL9QWMirhhn0UoiMDBGRzmjxdZ54ab+H9zsvG9Dj1MoM/mFIpe6JgViqCctD6S
 YhDFtzARuwDxlTlOovCqYR40J/qyd+xWOCaPM61nwYAoIInyOq/2oGpz9623gTzcL2ry
 4QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DLy0SwLSlaGwBkl+R1noWL7/C+Z5I/Uca6dIaJcbB2c=;
 b=mrfrXB+9O/IyPpTrhzgk4AlSivBM1640+RT9UwDLbS3iSoo9qcX3cIXRGTpmKbvecA
 fuW/1KhOG5Ai87ICCh3mEtZwObRaNfC7tVQ2vLfdEkJ2lZEctIR35+cOMPEOsnyfG62S
 PUPZL2fgwF8wp7sNFgXmQrZAk2JV9O7nyQMvGx5dgQAZ2MC56C3YKFn10d9T5HxTWCDx
 DbjEQ8kLnjElhph3Dec7geeDLtT/blFmvB7HZHIjrtmqZuuUlNERW9JDfkPcBmtXLruJ
 ob0yF/kfUmqPKJYnLRtUykqO/N8UNx0UyEZ8IrVXkkQ5h6B82pIjCU3gynIdNkiWysOs
 VrcA==
X-Gm-Message-State: AA+aEWajnXUtJxMy3YbSCKKbXc5jTKk/w6alkezBN/WqVuIKc18takFG
 la7/AuOCQWprk1+SF7axzF3sxg==
X-Google-Smtp-Source: AFSGD/W8siubOMUy4gGFt2YEE32b0gn4hrwCzt6L4ZRUZsajc4Ozf6EFG5giz6Qhitltb66SY/EepA==
X-Received: by 2002:a1c:91d1:: with SMTP id t200mr9737373wmd.111.1544434145308; 
 Mon, 10 Dec 2018 01:29:05 -0800 (PST)
Received: from localhost.localdomain (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id k128sm16348976wmd.37.2018.12.10.01.29.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Dec 2018 01:29:04 -0800 (PST)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH RESEND] drm/meson: remove firmware framebuffers
Date: Mon, 10 Dec 2018 10:28:53 +0100
Message-Id: <20181210092853.13050-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_012916_979889_6A9D038A 
X-CRM114-Status: GOOD (  10.86  )
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
 drivers/gpu/drm/meson/meson_drv.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index d3443125e661..afbb3d707d15 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -159,6 +159,23 @@ static void meson_vpu_init(struct meson_drm *priv)
 	writel_relaxed(0x20000, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
 }
 
+static void meson_remove_framebuffers(void)
+{
+	struct apertures_struct *ap;
+
+	ap = alloc_apertures(1);
+	if (!ap)
+		return;
+
+	/* The framebuffer can be located anywhere in RAM */
+	ap->ranges[0].base = 0;
+	ap->ranges[0].size = ~0;
+
+	drm_fb_helper_remove_conflicting_framebuffers(ap, "meson-drm-fb",
+						      false);
+	kfree(ap);
+}
+
 static int meson_drv_bind_master(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -242,6 +259,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
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
