Return-Path: <SRS0=R+dC=Z6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD45EC2D0BF
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 17:19:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E7920409
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 17:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HWCelgY9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RRaXPEPB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E7920409
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raEykL3N56L+umHcEqACT0ZOyHvMjEWvwLED+iRGpak=; b=HWCelgY9erqpx5
	5OSgXKS0t4GPlwBZ1Bw8wIahKs9XeQeC+s48zwPB7J1+hxbjvOGZTnZNq9r9oAqPQ6BhLIqAAmtv7
	dT1TDk7S309GRBli6XND2oCGMHGKycSuxmSYnfV9BunxK0F26JfFzYBcaFL7cmB+81InzLYWai6Dm
	izA8zWSAQuU93tsXvftAPw6j6sNOnQNK7iTJHZNroqJObg4DTcdLRU8TqClnWrEvsWQFzdbyv88LD
	nhfM7oAcrjT/5izmaK/k+W7gPALhxUkzhCz20bg56LX8LM0tsBtI9KzZ2Q5D0Nq4pBhx+1fqFMK5d
	FLF5hFW3/WWVue1LnuwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie0D7-0002uu-D8; Sun, 08 Dec 2019 17:19:09 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie0D3-0002sc-Nz; Sun, 08 Dec 2019 17:19:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id f129so12390019wmf.2;
 Sun, 08 Dec 2019 09:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/08gW13TofccXenPvhotNWPtw70ZwPRo+rtrcdU/+VA=;
 b=RRaXPEPB4QQdctB7WfH81TtTfrknUORtdviB7JWOyEw4ddrTwxWAKUr3grmdAiKVw7
 GWjQ6C7MkW8YZYcXN39l2E1cWuLIQnoJkYmORRJp7eWCBwkJKcoXzs+PmgeTyE+pXBLU
 aG1d51PbsZEKMUB3H/e7dLI2xSgV8bgmB1jvLVLbIhn9qaJl8QEbHwVACTBejtCdtM0v
 6xqXG2FnHAAgE671NQJx2ElfdheX1Gzh0NT67meKI/W6X9Z9TytDRj/MNCfcwmzSABdc
 PPiH01A88ITC3kjCyiLrtDI0xVDprYxkRJanqvoVHjconPk8EK/bEBUh2HKW/TgW5q0e
 o7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/08gW13TofccXenPvhotNWPtw70ZwPRo+rtrcdU/+VA=;
 b=EkdNrN+TW2xLzn/6xPxgvqbuuuYV/82rJsDwa9QcyjV3/gy5wt/P4RO/MPpbKFL9V5
 KJJVVLcNtU22b2ELWY76NzUPCYdQAJO6+q2iajXnWtMOEMY0V43VAGT3iuUeRlbIDQ/6
 ar7YY7NCEnmsB6ZHQTU6saEqZpIyR2wM7MXg/WZwU+cr4aX0ygUxNzPI3XaPIjNzxjhS
 iXfirWhELh/t/tKvqFkEt8sTzVKOTTncCxestTVLUrxB96DINIZ/t89JZEAISFLJw2y7
 ryr1C+CzuZ94kUL6JhiV0Q4yDdMm3LxViiPhgzgV/M1QnOWMQ0CgPvu+OK4xgL4ZaXme
 SqRw==
X-Gm-Message-State: APjAAAWIYLzOKAtpxrMJ/ctx374Yiu1i0gZD9+W3IXf796qMHHMbIDO8
 j0wfMid0CfXLn724SirFj7Uv56Xw
X-Google-Smtp-Source: APXvYqzl065F05Yt2j+aTRbWAW7DyJzxv18Zx1ZqmxuQS7SJlPzVCkEImtiMCQ5YaYB9e0PK14tHWg==
X-Received: by 2002:a1c:9e49:: with SMTP id h70mr22066604wme.79.1575825540738; 
 Sun, 08 Dec 2019 09:19:00 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g25sm11791383wmh.3.2019.12.08.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 09:18:59 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	narmstrong@baylibre.com
Subject: [PATCH v2 1/2] drm: meson: venc: cvbs: deduplicate the
 meson_cvbs_mode lookup code
Date: Sun,  8 Dec 2019 18:18:31 +0100
Message-Id: <20191208171832.1064772-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
References: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_091905_784790_A68505A2 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use a utility function to remove a bit of code duplication between
meson_venc_cvbs_encoder_atomic_check() and
meson_venc_cvbs_encoder_mode_set(). Both need to look up the struct
meson_venc_cvbs based on a drm_display_mode.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_venc_cvbs.c | 44 +++++++++++++------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
index 9ab27aecfcf3..6b8a074e4ff4 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
@@ -64,6 +64,21 @@ struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT] = {
 	},
 };
 
+static const struct meson_cvbs_mode *
+meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
+{
+	int i;
+
+	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
+		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
+
+		if (drm_mode_equal(req_mode, &meson_mode->mode))
+			return meson_mode;
+	}
+
+	return NULL;
+}
+
 /* Connector */
 
 static void meson_cvbs_connector_destroy(struct drm_connector *connector)
@@ -136,14 +151,8 @@ static int meson_venc_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
-	int i;
-
-	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
-		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
-
-		if (drm_mode_equal(&crtc_state->mode, &meson_mode->mode))
-			return 0;
-	}
+	if (meson_cvbs_get_mode(&crtc_state->mode))
+		return 0;
 
 	return -EINVAL;
 }
@@ -191,24 +200,17 @@ static void meson_venc_cvbs_encoder_mode_set(struct drm_encoder *encoder,
 				   struct drm_display_mode *mode,
 				   struct drm_display_mode *adjusted_mode)
 {
+	const struct meson_cvbs_mode *meson_mode = meson_cvbs_get_mode(mode);
 	struct meson_venc_cvbs *meson_venc_cvbs =
 					encoder_to_meson_venc_cvbs(encoder);
 	struct meson_drm *priv = meson_venc_cvbs->priv;
-	int i;
 
-	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
-		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
+	if (meson_mode) {
+		meson_venci_cvbs_mode_set(priv, meson_mode->enci);
 
-		if (drm_mode_equal(mode, &meson_mode->mode)) {
-			meson_venci_cvbs_mode_set(priv,
-						  meson_mode->enci);
-
-			/* Setup 27MHz vclk2 for ENCI and VDAC */
-			meson_vclk_setup(priv, MESON_VCLK_TARGET_CVBS,
-					 MESON_VCLK_CVBS, MESON_VCLK_CVBS,
-					 MESON_VCLK_CVBS, true);
-			break;
-		}
+		/* Setup 27MHz vclk2 for ENCI and VDAC */
+		meson_vclk_setup(priv, MESON_VCLK_TARGET_CVBS, MESON_VCLK_CVBS,
+				 MESON_VCLK_CVBS, MESON_VCLK_CVBS, true);
 	}
 }
 
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
