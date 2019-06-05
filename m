Return-Path: <SRS0=wdVM=UE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F149C28CC5
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 14:13:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C918820866
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 14:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Aqj6PL0s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TVdJqRZF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C918820866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uC3l0B47cTao3RhIII0DbIsJPNUTuubJnNx3KjbJXYY=; b=Aqj6PL0sVnp6B3
	ribV64VWdqXGdXcqjvgkoChK2W9E0ymKnnPf4JyB9udrWQ+Ic638F49to+tksjEegvyJFy04xrm9Q
	3OhjMYFtUIC43vVfmCM8whX38NyyMDQOhI+eaFegXcPUVIYI79VYMQon+SrZt7kbOdh36RtaazLcr
	G6G0kXIaOZfAuxGvygMHlxorJRYPW/yneq7L9sHpBm2P2PyYdzpt0Vg71LUBnJd7UyNViE2tuAoRW
	nrlsaTTOFpU78Sop9ieESaZjsmaREUfwomAOs1QMbVXRebycXqlj4c0NKf/jz8IEHHccyWqCbXS5u
	hkJBPUVXdOfKeYIR0zcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYWfO-0008C1-26; Wed, 05 Jun 2019 14:13:26 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYWf0-0007cE-R8
 for linux-amlogic@lists.infradead.org; Wed, 05 Jun 2019 14:13:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id n9so7203038wru.0
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2019 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJV2EelmzwU1/yznyPFkc/fxpPopz48+1zy1DsarmDE=;
 b=TVdJqRZFfU5s0FX3DJNaUJBa2wh3dlpycCNSUJUcDpNztvmmX7eFg6a+jgjhjp3qbp
 gQHVEwCL4w4ZnmBCCNQOzLmQ0xRkyb0gjzO6PQfC1KWeuZVPLOTTJfFXgbJfkEgqNm0L
 WMPL2OgOFvdi39tuwXV61CrYn9Fl1MBkA6pFoEdnUXyk/pPydlqd/rJ+lc8ByEjTKuY3
 u2dE2rGaX0W+8/+nrwyyqMzgBV2jkkmvxPC6u82FSHu8rvUtIBZnlJDfCYmtP3A9B2H+
 FfqafncdaU4zneDGniLi5/V3HygLwRsR2wVPzsZBfwlD/LS/QOi259lfN7GnIZt5I0fq
 KxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJV2EelmzwU1/yznyPFkc/fxpPopz48+1zy1DsarmDE=;
 b=JyXjHrn/Tl222wLwTp5aPE6qhjflCXoIFFEQvKwG2ADkr7SNCmpmCnmEM/F+l4gRwR
 msP8kycDwlHYf+qk0aPxnM5+NloSAYJt/rd0PRYPQiVbYtW63B7aWQpdpyUmga1WA+YL
 /atuXOvz/JQUJHj327qVD5UCJ3sDFWfREljvgYtJTxZqrWS6V9+8gguVY0ZwUKxJ6vJI
 CzRxdogfc0t2hpwRSIaIDN2IKIcq1des+0D6O/HaYFosHQthkGGDcX/Bld3IsS3CNfg9
 vq22lcduEc93hgLwKWwwZLVvJAkmljP5yfUO2g/ejaY3AESJ6u+6RionvTdiTIxNi3uf
 0ZsA==
X-Gm-Message-State: APjAAAWub+UtIQCm1h+bHJAQFetJwUYXn1HX5c4VGHHkM924IYmIKhf8
 LSqtl3HJb/bOeXl6UMOE8IUtGA==
X-Google-Smtp-Source: APXvYqyfg6omR+ZPIC7qJMVZoiXxGQOWD9YskUpPvpHHMZWtFQOlsNcFXDkrbb+rAuRH69aSGBrBgA==
X-Received: by 2002:adf:a38d:: with SMTP id l13mr19424196wrb.187.1559743977659; 
 Wed, 05 Jun 2019 07:12:57 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s8sm36292546wra.55.2019.06.05.07.12.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 07:12:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/meson: fix G12A primary plane disabling
Date: Wed,  5 Jun 2019 16:12:53 +0200
Message-Id: <20190605141253.24165-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605141253.24165-1-narmstrong@baylibre.com>
References: <20190605141253.24165-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190605_071303_079594_C3206AE9 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The G12A Primary plane was disabled by writing in the OSD1 configuration
registers, but this caused the plane blender to stall instead of continuing
blended only the overlay plane.

Fix this by disabling the OSD1 plane in the blender registers, and also
enabling it back using the same register.

Fixes: 490f50c109d1 ("drm/meson: Add G12A support for OSD1 Plane")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c  | 2 ++
 drivers/gpu/drm/meson/meson_plane.c | 4 ++--
 drivers/gpu/drm/meson/meson_viu.c   | 3 +--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index 50a9a96720b9..aa8ea107524e 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -252,6 +252,8 @@ static void meson_g12a_crtc_enable_osd1(struct meson_drm *priv)
 	writel_relaxed(priv->viu.osb_blend1_size,
 		       priv->io_base +
 		       _REG(VIU_OSD_BLEND_BLEND1_SIZE));
+	writel_bits_relaxed(3 << 8, 3 << 8,
+			    priv->io_base + _REG(OSD1_BLEND_SRC_CTRL));
 }
 
 static void meson_crtc_enable_vd1(struct meson_drm *priv)
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b788280895c6..d90427b93a51 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -318,8 +318,8 @@ static void meson_plane_atomic_disable(struct drm_plane *plane,
 
 	/* Disable OSD1 */
 	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu"))
-		writel_bits_relaxed(BIT(0) | BIT(21), 0,
-			priv->io_base + _REG(VIU_OSD1_CTRL_STAT));
+		writel_bits_relaxed(3 << 8, 0,
+				    priv->io_base + _REG(OSD1_BLEND_SRC_CTRL));
 	else
 		writel_bits_relaxed(VPP_OSD1_POSTBLEND, 0,
 				    priv->io_base + _REG(VPP_MISC));
diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 462c7cb3e1bd..4b2b3024d371 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -405,8 +405,7 @@ void meson_viu_init(struct meson_drm *priv)
 				0 << 16 |
 				1,
 				priv->io_base + _REG(VIU_OSD_BLEND_CTRL));
-		writel_relaxed(3 << 8 |
-				1 << 20,
+		writel_relaxed(1 << 20,
 				priv->io_base + _REG(OSD1_BLEND_SRC_CTRL));
 		writel_relaxed(1 << 20,
 				priv->io_base + _REG(OSD2_BLEND_SRC_CTRL));
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
