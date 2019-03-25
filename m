Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URG_BIZ,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4022DC10F03
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:19:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1157420896
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NuKc4W6r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i32RcdTZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1157420896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crH51Fl8DuEQAokzLU9Em/EBLOlOeTOYx6wetEDoZrI=; b=NuKc4W6rqAlBNv
	7fJUZ/ZeYTa/5IJ5ef3Fz+qgu0kuEe33Zcy12K9WIlwMkw2rThpPOH8MGeRzvTYEMu/UsUOynkpGD
	GQIzQP5bTdscGbv9i/sGysJCwgDPYJygoZGeHg4VswBzHw17AzAF5Q8EWTUwAd4R5QmMysCgopkpF
	FgdiV1UOMY2QI6FVLXFKGMuzO0IYcvE29uac8F1Pu2XSL5yr/5NK9J/JGe+97PLEVa5/9VmUD3NbA
	g2Htb5/p2/xD34P3bmsE2+tJR7TsawNl6lD2Ptj4hzXNcs5tdbnEjIrJb3mRIQY040chCHmEWFxrA
	SytPFqWsfDIELYRssfFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8QR9-0007sr-Jl; Mon, 25 Mar 2019 14:18:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8QQu-0007fP-5b
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:18:44 +0000
Received: by mail-wr1-x444.google.com with SMTP id w1so10399230wrp.2
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yDypC/UmPJRFhJ57yj/6XU+1KJP8RA/zbaAQcFQyVBM=;
 b=i32RcdTZnAalHl7i9L6wGPhJgWMYWzvj9DXGJZ3VqlJi63NOPhYGGUGpJiVfb97qbi
 5+E8+mp+mZSxZ309r/pjVj3Tn54j48cSpUsENCGz9kaKLeD7XOQwIfubkx2Xl3cTqzmy
 95FUw++QLNvIuw24w1P7KpD3CKC1CTjiA0pvNcMzc05qg8jZYmpWsjdvX11z/y8q9M/v
 OsmTdWCVH/okHkQQNuBjm5cUv/R+XuQ4A7d6rLfkhHcoU0yfTRbz6qN+JbJ+WChrkZfW
 B3bFyLEluoRIfQmuHub0/NS9X7/PV6q0RxIKEiu1927EK2TSG0071FzUNT/9j8G7LpW6
 stdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yDypC/UmPJRFhJ57yj/6XU+1KJP8RA/zbaAQcFQyVBM=;
 b=me51Udkzv5RmDzlq4XU/0RRs2UW+GEhDCQWIiVJj8c2A/8SjEd0f5npBjeMsznv3tP
 Q6ttNI+F82ykgjn7+z9wDb4JyIsbfaDdjssFmfxR/osff1Zj/ng8Op7hpQlkMvCrfBCt
 p8iUaaX4hYdnp32UK53ZdKMuLbZOIqa7Ud2tmZwFVHsurkPqXqSOorIpMhqqXF5xk/eG
 hvDKM92kcVvAUbXm2bUMwhzSugQ+heP/cbT89CKdKLdmyo6dOsbNEGPAww03Ofb7ta6n
 w9aDXklwJrKpOuZcsS4LwPfsE9OeiV4f/ynEk3qXN2471Xu5p2afmjTNLKLMMdliQo94
 67Sg==
X-Gm-Message-State: APjAAAUKdr1jo2Zv2cX4jIRfu1RlI4/aaLFC+YytVtiEJUIxmPU7nnXI
 taJ9MmoYnMDQx9K4wrKpXUVFWg==
X-Google-Smtp-Source: APXvYqycs+b9ISq2q/G1mMDsaLRRaZJaAEqJQ5OANgwPueOIt8hUR8mlYcjUboSz25ZC4A7uRHAM/g==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr12181262wrw.301.1553523512498; 
 Mon, 25 Mar 2019 07:18:32 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 132sm26976794wmd.30.2019.03.25.07.18.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:18:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/11] drm/meson: Add G12A Support for VIU setup
Date: Mon, 25 Mar 2019 15:18:17 +0100
Message-Id: <20190325141824.21259-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325141824.21259-1-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_071836_205678_1992570F 
X-CRM114-Status: GOOD (  11.80  )
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
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic G12A SoC needs a different VIU setup code,
handle it.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_viu.c | 72 ++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index ac0f3687e09a..0169c98b01c9 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -90,6 +90,34 @@ static int eotf_bypass_coeff[EOTF_COEFF_SIZE] = {
 	EOTF_COEFF_RIGHTSHIFT /* right shift */
 };
 
+void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv, int *m,
+				   bool csc_on)
+{
+	/* VPP WRAP OSD1 matrix */
+	writel(((m[0] & 0xfff) << 16) | (m[1] & 0xfff),
+		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_PRE_OFFSET0_1));
+	writel(m[2] & 0xfff,
+		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_PRE_OFFSET2));
+	writel(((m[3] & 0x1fff) << 16) | (m[4] & 0x1fff),
+		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF00_01));
+	writel(((m[5] & 0x1fff) << 16) | (m[6] & 0x1fff),
+		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF02_10));
+	writel(((m[7] & 0x1fff) << 16) | (m[8] & 0x1fff),
+		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF11_12));
+	writel(((m[9] & 0x1fff) << 16) | (m[10] & 0x1fff),
+		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF20_21));
+	writel((m[11] & 0x1fff) << 16,
+		priv->io_base +	_REG(VPP_WRAP_OSD1_MATRIX_COEF22));
+
+	writel(((m[18] & 0xfff) << 16) | (m[19] & 0xfff),
+		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_OFFSET0_1));
+	writel(m[20] & 0xfff,
+		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_OFFSET2));
+
+	writel_bits_relaxed(BIT(0), csc_on ? BIT(0) : 0,
+		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
+}
+
 void meson_viu_set_osd_matrix(struct meson_drm *priv,
 			      enum viu_matrix_sel_e m_select,
 			      int *m, bool csc_on)
@@ -336,14 +364,24 @@ void meson_viu_init(struct meson_drm *priv)
 	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
 	    meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu"))
 		meson_viu_load_matrix(priv);
+	else if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu"))
+		meson_viu_set_g12a_osd1_matrix(priv, RGB709_to_YUV709l_coeff,
+					       true);
 
 	/* Initialize OSD1 fifo control register */
 	reg = BIT(0) |	/* Urgent DDR request priority */
-	      (4 << 5) | /* hold_fifo_lines */
-	      (3 << 10) | /* burst length 64 */
-	      (32 << 12) | /* fifo_depth_val: 32*8=256 */
-	      (2 << 22) | /* 4 words in 1 burst */
-	      (2 << 24);
+	      (4 << 5); /* hold_fifo_lines */
+	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu"))
+		reg |= (1 << 10) | /* burst length 32 */
+		       (32 << 12) | /* fifo_depth_val: 32*8=256 */
+		       (2 << 22) | /* 4 words in 1 burst */
+		       (2 << 24) |
+		       (1 << 31);
+	else
+		reg |= (3 << 10) | /* burst length 64 */
+		       (32 << 12) | /* fifo_depth_val: 32*8=256 */
+		       (2 << 22) | /* 4 words in 1 burst */
+		       (2 << 24);
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD2_FIFO_CTRL_STAT));
 
@@ -369,6 +407,30 @@ void meson_viu_init(struct meson_drm *priv)
 	writel_relaxed(0x00FF00C0,
 			priv->io_base + _REG(VD2_IF0_LUMA_FIFO_SIZE));
 
+	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
+		writel_relaxed(4 << 29 |
+				1 << 27 |
+				1 << 26 | /* blend_din0 input to blend0 */
+				1 << 25 | /* blend1_dout to blend2 */
+				1 << 24 | /* blend1_din3 input to blend1 */
+				1 << 20 |
+				0 << 16 |
+				1,
+				priv->io_base + _REG(VIU_OSD_BLEND_CTRL));
+		writel_relaxed(3 << 8 |
+				1 << 20,
+				priv->io_base + _REG(OSD1_BLEND_SRC_CTRL));
+		writel_relaxed(1 << 20,
+				priv->io_base + _REG(OSD2_BLEND_SRC_CTRL));
+		writel_relaxed(0, priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
+		writel_relaxed(0, priv->io_base + _REG(VD2_BLEND_SRC_CTRL));
+		writel_relaxed(0,
+				priv->io_base + _REG(VIU_OSD_BLEND_DUMMY_DATA0));
+		writel_relaxed(0,
+				priv->io_base + _REG(VIU_OSD_BLEND_DUMMY_ALPHA));
+		writel_bits_relaxed(0x3 << 2, 0x3 << 2,
+				priv->io_base + _REG(DOLBY_PATH_CTRL));
+	}
 
 	priv->viu.osd1_enabled = false;
 	priv->viu.osd1_commit = false;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
