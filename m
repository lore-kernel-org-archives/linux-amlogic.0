Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2867BC10F06
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:19:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 595952084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uBH1jcjB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ND+Gvnaq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 595952084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXo17IsGEM18DKbKruB7hlo9Yvmp55LDphyL2w3Gmik=; b=uBH1jcjBbmQyql
	M1hae0cSt9zmRZ2g6I2WMxp3rAOUjcLxEK4oJ3GfgH5L1cDFPB6Ltsw0qoU/ZT9PHuGcYvby6+JIh
	7bhjUBLaDTJqBZEclLoOE77CtMqIlgriN1jWAy5NGGFvLQ2K/uJj5JhWTieKSwHJmq7kgXiaLYKOE
	qdPPF+rNnDaL2+DeZvbsCPyUZMWZFGkG0r1/5AAgK7bhN9vk4jsZnIcrVITZegxs70o6GmwN874M1
	DsrU5/RP8y3zODqwFeHhiyYqv7El9s/mDuTrWqJTb+Ah/2dx6med0zO5UGpvFuhADXtYfOwU12jjf
	0727kaJUU+6tGx5wocxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8QRB-0007vN-B0; Mon, 25 Mar 2019 14:18:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8QQx-0007gx-84
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:18:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id h18so9304343wml.1
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mq/UIbvc1VH7PugMYnYCEBeubA/5Z+FgxVasF/ac/OU=;
 b=ND+GvnaqVVGlVr0XaByEEGP6PJvVtB9/A70ah1Rmg8gqdoNtvw/DvF0tUPIiLX11Ey
 /YGgmN8dUSpBGNtNY1M1sZZtzbv5SFaT5ENjKgi8H60rc5tcvYsq96i9JbfAJk6MFV3h
 P2gqQEmJ1y87kW4B98Ryf+eC4xJU/KilukOFVNOzDNgvST5Rm+2p5yrBaGwStmSnQGll
 pRvGH3V06GxfR21rju0CB2mg67pF9T6dPNTGl8Z8e/z1BkgsaHZp+BueuxW1bDQReBvA
 +oXrPAylPxnW+ZnHtnTE0AsFtL0KoZV1D3goUbThGir8nS/u8uL5NPntYqOFl10ly2Wj
 JCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mq/UIbvc1VH7PugMYnYCEBeubA/5Z+FgxVasF/ac/OU=;
 b=Lyn7/CkqPFNHiPvJhhBNyMKez44+MH4mxh57+daRpj5ZL9vwzN82xp3qG1DhxrFS8Q
 uTIZ6aMFg56M9UgmTtZ+iE1M2mD2SpJ+AlM8osSGPnblrdwP8WA7Ib7aDq6cUq72DSdn
 TRxa9ZIi3zm4SC9HIGFLM4VFeFjtQ6HL4q4sP2ZOPyhyuChgiMIf/BzGvo5HdZwmrn1M
 x5QtLEGIqb7WorLcbM2ab4oOmwj31ZiN27y67iwFq8NMTzi7ARnUCy2jP5sv0eFt3rcW
 /3T8oSVrVfe7uIE+Fen7yui+Aw5NttdVdcE1EyVA0ixrWxmhoP86qNG9uIHe/rKvshoL
 IDQw==
X-Gm-Message-State: APjAAAU5aCAS0gG8BeS938mRCPgi/9tg9rk9/pIdjvizFOp+aohgk58b
 5hkStLDFikNVzOvXRtJfQTMtnQ==
X-Google-Smtp-Source: APXvYqzCAegsJLzwZTFBlTsOhiLLdBsaUVSPYOKUkSGj6Z5TjxTPmk2wc7VuF19lL/gpqI0cM7qeMw==
X-Received: by 2002:a1c:415:: with SMTP id 21mr12357938wme.109.1553523517400; 
 Mon, 25 Mar 2019 07:18:37 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 132sm26976794wmd.30.2019.03.25.07.18.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:18:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm/meson: Add G12A support for CVBS Encoer
Date: Mon, 25 Mar 2019 15:18:21 +0100
Message-Id: <20190325141824.21259-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325141824.21259-1-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_071839_304957_01960E37 
X-CRM114-Status: GOOD (  12.41  )
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

The Meson G12A SoCs uses the exact same CVBS encoder except a simple
CVBS DAC register offset and settings delta.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_venc.c      | 11 +++++++++--
 drivers/gpu/drm/meson/meson_venc_cvbs.c | 25 ++++++++++++++++++-------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 66d73a932d19..6faca7313339 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -73,7 +73,9 @@
 /* HHI Registers */
 #define HHI_GCLK_MPEG2		0x148 /* 0x52 offset in data sheet */
 #define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
+#define HHI_VDAC_CNTL0_G12A	0x2EC /* 0xbd offset in data sheet */
 #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
+#define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbe offset in data sheet */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 offset in data sheet */
 
 struct meson_cvbs_enci_mode meson_cvbs_enci_pal = {
@@ -1675,8 +1677,13 @@ void meson_venc_disable_vsync(struct meson_drm *priv)
 void meson_venc_init(struct meson_drm *priv)
 {
 	/* Disable CVBS VDAC */
-	regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
-	regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
+	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
+		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
+		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 8);
+	} else {
+		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
+		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
+	}
 
 	/* Power Down Dacs */
 	writel_relaxed(0xff, priv->io_base + _REG(VENC_VDAC_SETTING));
diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
index d622d817b6df..2c5341c881c4 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
@@ -37,7 +37,9 @@
 
 /* HHI VDAC Registers */
 #define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
+#define HHI_VDAC_CNTL0_G12A	0x2EC /* 0xbd offset in data sheet */
 #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
+#define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbe offset in data sheet */
 
 struct meson_venc_cvbs {
 	struct drm_encoder	encoder;
@@ -166,8 +168,13 @@ static void meson_venc_cvbs_encoder_disable(struct drm_encoder *encoder)
 	struct meson_drm *priv = meson_venc_cvbs->priv;
 
 	/* Disable CVBS VDAC */
-	regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
-	regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
+	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
+		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
+		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
+	} else {
+		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
+		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);
+	}
 }
 
 static void meson_venc_cvbs_encoder_enable(struct drm_encoder *encoder)
@@ -179,13 +186,17 @@ static void meson_venc_cvbs_encoder_enable(struct drm_encoder *encoder)
 	/* VDAC0 source is not from ATV */
 	writel_bits_relaxed(BIT(5), 0, priv->io_base + _REG(VENC_VDAC_DACSEL0));
 
-	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu"))
+	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu")) {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 1);
-	else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
-		 meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu"))
+		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 0);
+	} else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
+		 meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu")) {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0xf0001);
-
-	regmap_write(priv->hhi, HHI_VDAC_CNTL1, 0);
+		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 0);
+	} else if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
+		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0x906001);
+		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
+	}
 }
 
 static void meson_venc_cvbs_encoder_mode_set(struct drm_encoder *encoder,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
