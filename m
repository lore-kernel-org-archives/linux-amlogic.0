Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA93C43613
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:49:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C24CC20644
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qw/xibYH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="inHqWyGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C24CC20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	References:Date:Subject:To:From:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=yarthso6Xi48fHOfIALxTbjEP/NQ8hyQP5DYx8AkxFo=; b=qw/xibYHr3FcUo
	jf+a0FBG+p0jPJGaPpDehrhoxkgBA4NvxPVZroTGQu7ylBcNfA16vA3FuHDnCMrv2vFidCgFYgCBj
	91w4K2RioqIiOCsorGoUSn68LkuahjTIt2Eph3GIMDXOdCyWHkMQxJtndADNr8vvCCLwwhlw0cr7O
	bnFZlm1x4AjbvLYlG/qVM987iIaz1f9B4cMGbQEOHhaSjUIGLwzMDrfd3yvCIggaSJy17XKRAI+EQ
	FsmVd+Y/gB0GUjop/sMuKpfG6HfjETXisQDv851D1ulv/DNTEkCps2D+tEX9+ZTdAOuvCidMnTo/A
	V0eCA9BS/nbEHiCjMxRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfQHQ-0008Jc-UP; Mon, 24 Jun 2019 14:49:12 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfQGi-0007ie-Lx
 for linux-amlogic@lists.infradead.org; Mon, 24 Jun 2019 14:48:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id f17so13692517wme.2
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2019 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:references:reply-to:message-id:mime-version;
 bh=UMt++cTsArBAGUmiE11DFVbCwedH1LpEG4/Q9DpDY64=;
 b=inHqWyGqlHHjwmM2IYsNCD/MsgyfdYTrLzk+3/14SUcRm7zno7MrYbR3aodsqIjAn3
 IeuF0sDxXIiFH99RSnrhLSJe/NgB8CVlgY7gE8fhn+Sdnc5ZoFpJWgCqEPojyRBHfWH6
 +cu1hhckzF2ixsR/9rpc6ZwofJ8qPmd+EycT4nCJCQjK7uD5oCUtN9+q3vZhmTWNVcTh
 5sb0i1J7SUEPdcGuHnd9hAKpzyeI5Jl1IchELIP3wKdzMnpglQEH/bBIo/WUdiqfZHrU
 CdgVzc940BoUrjYeqZ2hOu+BnMJozAB5zRPpiYZyiLjaoSKeCSsAPKEqqsSPiiiSH+NE
 J9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:references:reply-to
 :message-id:mime-version;
 bh=UMt++cTsArBAGUmiE11DFVbCwedH1LpEG4/Q9DpDY64=;
 b=Ci3Cyy7KZDaBdISk6Yoc1g8C2iZv8GNehF2Um24EJCAK60zXkdyEeKkeLtKqtwszmr
 A4qa/5I/LY67flzvqU41fK+EYXyanE0kGir5w7sGwlTZxMMVGIV+iza+Lnd+oXgai2qI
 eKgql6sFWTLw+b9zSV85PyOMYDjwlKswe7/IJkU7sV7ljwnO0wsPtiGk9PtHXle54MMW
 /LeHIdlz1E6ZaWnca5bfkq+a9Di2lO/h/AAhd7pOIWDM2i6XDxvIIKVacIKmCYgT9xcG
 flWRKFIGY/+EpIcpOiHtkFNu/xOhOUNROJALHKhieRLCrjZXMz5U9xz3c2zTSSWOb8WQ
 2T3Q==
X-Gm-Message-State: APjAAAWMha5+++VYQoURuM0Dil5xjuicn2Foz2AMhQxx42+efA8l+doU
 E1zGcM1IUk7X8yGXnIFgyXsPSg==
X-Google-Smtp-Source: APXvYqx9J4gCSkHAg6MGMhOs0tRsAwYKg+4C5RM0USs3GmYYacCeQw4lM9p7rPy7v6pHwAFHGyek9Q==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr15433655wmk.99.1561387707268; 
 Mon, 24 Jun 2019 07:48:27 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y18sm3311422wmi.23.2019.06.24.07.48.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:48:26 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/9] drm: meson: crtc: use proper macros instead of magic
 constants
Date: Mon, 24 Jun 2019 16:48:12 +0200
References: <86zhm782g5.fsf@baylibre.com>
Message-ID: <86wohb82fa.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_074828_737973_DB5AA4D8 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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
Reply-To: 86zhm782g5.fsf@baylibre.com
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch add new macros which describe couple bits field of the
following registers:
- VD1_BLEND_SRC_CTRL
- VPP_SC_MISC

Signed-off-by: Julien Masson <jmasson@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c      | 17 +++++++++++------
 drivers/gpu/drm/meson/meson_registers.h | 16 ++++++++++++++++
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index aa8ea107524e..6f7d6d258615 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -267,11 +267,11 @@ static void meson_crtc_enable_vd1(struct meson_drm *priv)
 
 static void meson_g12a_crtc_enable_vd1(struct meson_drm *priv)
 {
-	writel_relaxed(((1 << 16) | /* post bld premult*/
-			(1 << 8) | /* post src */
-			(1 << 4) | /* pre bld premult*/
-			(1 << 0)),
-			priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
+	writel_relaxed(VD_BLEND_PREBLD_SRC_VD1 |
+		       VD_BLEND_PREBLD_PREMULT_EN |
+		       VD_BLEND_POSTBLD_SRC_VD1 |
+		       VD_BLEND_POSTBLD_PREMULT_EN,
+		       priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
 }
 
 void meson_crtc_irq(struct meson_drm *priv)
@@ -489,7 +489,12 @@ void meson_crtc_irq(struct meson_drm *priv)
 		writel_relaxed(priv->viu.vd1_range_map_cr,
 				priv->io_base + meson_crtc->viu_offset +
 				_REG(VD1_IF0_RANGE_MAP_CR));
-		writel_relaxed(0x78404,
+		writel_relaxed(VPP_VSC_BANK_LENGTH(4) |
+			       VPP_HSC_BANK_LENGTH(4) |
+			       VPP_SC_VD_EN_ENABLE |
+			       VPP_SC_TOP_EN_ENABLE |
+			       VPP_SC_HSC_EN_ENABLE |
+			       VPP_SC_VSC_EN_ENABLE,
 				priv->io_base + _REG(VPP_SC_MISC));
 		writel_relaxed(priv->viu.vpp_pic_in_height,
 				priv->io_base + _REG(VPP_PIC_IN_HEIGHT));
diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index c7dfbd7454e5..55f5fe21ff5e 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -370,6 +370,12 @@
 #define VPP_HSC_REGION4_PHASE_SLOPE 0x1d17
 #define VPP_HSC_PHASE_CTRL 0x1d18
 #define VPP_SC_MISC 0x1d19
+#define		VPP_SC_VD_EN_ENABLE             BIT(15)
+#define		VPP_SC_TOP_EN_ENABLE            BIT(16)
+#define		VPP_SC_HSC_EN_ENABLE            BIT(17)
+#define		VPP_SC_VSC_EN_ENABLE            BIT(18)
+#define		VPP_VSC_BANK_LENGTH(length)     (length & 0x7)
+#define		VPP_HSC_BANK_LENGTH(length)     ((length & 0x7) << 8)
 #define VPP_PREBLEND_VD1_H_START_END 0x1d1a
 #define VPP_PREBLEND_VD1_V_START_END 0x1d1b
 #define VPP_POSTBLEND_VD1_H_START_END 0x1d1c
@@ -1638,6 +1644,16 @@
 #define VPP_SLEEP_CTRL 0x1dfa
 #define VD1_BLEND_SRC_CTRL 0x1dfb
 #define VD2_BLEND_SRC_CTRL 0x1dfc
+#define		VD_BLEND_PREBLD_SRC_VD1         (1 << 0)
+#define		VD_BLEND_PREBLD_SRC_VD2         (2 << 0)
+#define		VD_BLEND_PREBLD_SRC_OSD1        (3 << 0)
+#define		VD_BLEND_PREBLD_SRC_OSD2        (4 << 0)
+#define		VD_BLEND_PREBLD_PREMULT_EN      BIT(4)
+#define		VD_BLEND_POSTBLD_SRC_VD1        (1 << 8)
+#define		VD_BLEND_POSTBLD_SRC_VD2        (2 << 8)
+#define		VD_BLEND_POSTBLD_SRC_OSD1       (3 << 8)
+#define		VD_BLEND_POSTBLD_SRC_OSD2       (4 << 8)
+#define		VD_BLEND_POSTBLD_PREMULT_EN     BIT(16)
 #define OSD1_BLEND_SRC_CTRL 0x1dfd
 #define OSD2_BLEND_SRC_CTRL 0x1dfe
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
