Return-Path: <SRS0=So4j=32=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909F4C352A4
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:19:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67230217F4
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQ0iCUIc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bmdEfnPn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67230217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkT3wOdMEDSqG18uV8g20RSjOCXldPYftllXyCL4CNw=; b=rQ0iCUIcKmnUz+
	gE9QjFWbtMFLM+voTDid6OftoUOEqsPWEYWmpfoBbrpVCzRs2loqMC65TfZjs4e3vsDnSKEl3ogda
	zvv2RnUkVjfSy16gvunIryhA0Emp9impyQeoCgKbZMqXDW8d0laWbbMTgEYqcLeeTFvmjQOpLSrlv
	0RpQySvNbX+LvDU7ix9nq3vIBLrV81eB9tdUDRvNJdbSbhlcROBIrh6ePs1APwJd/ji4ZZrixRFrG
	0UB9zF1GXX6ka2FwQkhGEMELFuS8wKYkb3RNgzp1XUnAXPW6q5RdotgJGjife8EzBi/StzbZLo1uj
	ID3lNEyyPf3ciZ6XFHLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izmfw-0008VH-IR; Thu, 06 Feb 2020 19:18:56 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izmfm-0008Il-O9
 for linux-amlogic@lists.infradead.org; Thu, 06 Feb 2020 19:18:48 +0000
Received: by mail-wr1-x444.google.com with SMTP id a6so8534567wrx.12
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Feb 2020 11:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HYTni/YaBkgYSQUn7nXBaoqEYGtf4zrlvskOsHha/TE=;
 b=bmdEfnPnck6nyJBX1ADt368GsRzqd4CbXNpRlPtBo14FVVOOROz0eUc6IapgJNTBwM
 xcfeQxcyE+uODfH2zu2aCS3Uo0jcRZ+YAH94rhk45tk0+ATLvcma94RKPGRE3hEQ9J9p
 /j6iWX/esvHtxwJy7Y5G3lJMGt9dGPGPHb0yRj6n62bS/OAF9Vjy6W8bTrK2uX+G6tN+
 ailRf0TH67OMFrt7Q0SKGEzZUGDQGs6RtOIELCL/Nn53VIhlgVbjc93mTQb2R5PcXo3e
 Am5rL0zAnodwNstQ4AA8fNadUMjwbI/qojOC2lJYz3BnUJXAdFKS/klFxMpXdlORMdVe
 Fzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYTni/YaBkgYSQUn7nXBaoqEYGtf4zrlvskOsHha/TE=;
 b=KZrRTR3mFp6+yKu0CGMPtEN0ERTLlhN8z3ounjne5JYunRJihHWW74iiaFo6KqCiMU
 x4ozf8MtqrYmHAz04fogCPmSF3ZjrX8tkX9PmZz2wbmTozjKMSWKBsIvrA/CFrI8SCOX
 1DIx9yysDCUHQrPYTRi5YSE5YIUAFtS0lPuH8sA2zvxkic2CFETmTjE8t42ez5TkZKLM
 uNAj1Q/rgoVjbwZlyLicYmGXOIzI5yniPaDZXJV1IjGIl3tJkGIFISrhORSgO+EPX1ax
 X4qbE8u14zBd/VcknOrB3WyjmiW5OmsoU5xhg0wFI2CMxK6K0ToKpXQ5G9sfenRnttOA
 NWuw==
X-Gm-Message-State: APjAAAXCkQSFO5AbJo0RWub6PyLHMixWzC3L2HOYTGhlZpf+M5WCM7SU
 tDFw4JFwxr33onRIdYlTtsNF8Q==
X-Google-Smtp-Source: APXvYqwQ2YaIscLYLTZlPv5SR3uwVCyWbeNrLfCxatvYPEfxDKBWb2zLGGXHVocZnr1kFsNujoV31w==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr5253101wrv.196.1581016725325; 
 Thu, 06 Feb 2020 11:18:45 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:44 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 06/11] drm/meson: venc: make drm_display_mode const
Date: Thu,  6 Feb 2020 20:18:29 +0100
Message-Id: <20200206191834.6125-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_111846_831690_FE9ABE2A 
X-CRM114-Status: UNSURE (   9.09  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Before switching to bridge funcs, make sure drm_display_mode is passed
as const to the venc functions.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 2 +-
 drivers/gpu/drm/meson/meson_venc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 4efd7864d5bf..a9ab78970bfe 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -946,7 +946,7 @@ bool meson_venc_hdmi_venc_repeat(int vic)
 EXPORT_SYMBOL_GPL(meson_venc_hdmi_venc_repeat);
 
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
-			      struct drm_display_mode *mode)
+			      const struct drm_display_mode *mode)
 {
 	union meson_hdmi_venc_mode *vmode = NULL;
 	union meson_hdmi_venc_mode vmode_dmt;
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 576768bdd08d..1abdcbdf51c0 100644
--- a/drivers/gpu/drm/meson/meson_venc.h
+++ b/drivers/gpu/drm/meson/meson_venc.h
@@ -60,7 +60,7 @@ extern struct meson_cvbs_enci_mode meson_cvbs_enci_ntsc;
 void meson_venci_cvbs_mode_set(struct meson_drm *priv,
 			       struct meson_cvbs_enci_mode *mode);
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
-			      struct drm_display_mode *mode);
+			      const struct drm_display_mode *mode);
 unsigned int meson_venci_get_field(struct meson_drm *priv);
 
 void meson_venc_enable_vsync(struct meson_drm *priv);
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
