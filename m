Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BF4CD6E51
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wk2dvUiRda11RQCTTHycn+XKyspmHEMXAVCKO4KrTaA=; b=MsNHfOrDjZn7+Q
	MTvhryO6Y2JC1A3a75uGPdtCqAu70DZWXZZho1NojJEerFFbDyIglqJud3mCtV38EwG1jKoQQeyn/
	LC2vux1CuYddQWsneIp5+XchXH2wRXlfFYb9fIzfrebqwoaxN/Si8fBvOr5ICZisZowahWc2fWL5q
	RsGEHT0dbwaWy3cuq9dsQ1zya56eb2tXualWcwWArbQL/HrbOIt/FJoVtiAxkVnwvbAu79qMT/ddL
	hS+wd8U3wFW+7PFvKe/T8fRqAwgC8E6H21IrQ60Rub+UY2hGvOea9w1DEmdZRgojifbFaVoAuoHc5
	YcdL6h2oGectiKFHMkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTass-00000009LDo-0Fnc;
	Sun, 31 May 2026 07:46:58 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTasq-00000009LCO-0iK7
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 07:46:57 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so366389b3a.1
        for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 00:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213615; x=1780818415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl7/bz2Wt6XngU1VBihi/m8AgI7wZRM8055uUzVh3Uc=;
        b=JHl81HBh3y8X2OwtfnuqIjM0Pslk5sMppdIB70QQVY9kqvMLdHJ4NSsRWuwvxb8kno
         fx9UKjfNfOiPbVUiBW/QlTf73umBiFOHZSOb/zWnr3kbT7STjqdQNNZkxTOeLdr7WhwN
         klHYHeHjM+0EapGxAH8dzqscNyt8guYse4TBVM+6eRsSJujH/PlzX8mTCarjaaw9vJ7d
         LxPwHL95O+E1gQinBUC1KLwYXJWU3wLOOHJDE1C+UjQqrPvJnTLuC/a4LaJ0IPb+fP2W
         ZMAVHBDR9lrx0PDnw7nI8mjLF1n+6UO8W0HzzUycURlPpz8yaqnNzqrnyvxb+iMVz+g6
         4KXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213615; x=1780818415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hl7/bz2Wt6XngU1VBihi/m8AgI7wZRM8055uUzVh3Uc=;
        b=Kyeo3Fk7Zv2NJyOo9cx1nwHy+L7/t3DNEpJ8PFo2bjUnTsKrS9kalU4JNrpMlq8vnJ
         9TZMZIVpuKO7OsqplAaMcKAbur6QV89l1McAPmhdYF/4G4+fO+wu2qVvmxs7i6w8EvIS
         f1suHKuWtasdNjlUlraT2LOYwEm6S8fIUXWX80ETgTN1A7PsiKaOwE4MUoOkqwnjBQQy
         tIi6LLc7OpMLOFKF4Jz4IXy52rZkoGcUm1FxnanyNrII+WlSNftDI7ZFxaqhKhQkloKP
         mVn+gqBix9teEeRo149qkms1HnOuuALZWsaGJsFzZx8AZy9+ecbgVFZLOPsDpue6UBaQ
         g4Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/tCSgaJU0Xvnq6mE0ULXsms+bojRDRJLpW/q/uQ8fm0LtkqwFIXPXV9P0Lic77OAYsFYWR0vIJ2HcXw6DX@lists.infradead.org
X-Gm-Message-State: AOJu0YwBgmoUy5KGkdTzhQizQ3opdFnEOLapIMwPqq/fh3uVQfm/Hsa4
	/TH0sHVIgcJN5tGVKsl6Xrrt8pmkcULSaIKlMGqbpqo7DVAd8wxzDwk1
X-Gm-Gg: Acq92OFbkpwvppMBONxV3T6LKG5hhL7xEW+8Zv7nxl/uLg8tVva7bbNxUzXglRiecdt
	lwnNCw1xmgcZCMh6t+HEDx4YIJpBSVvLZ28QPJ15xNyaDTyNmpqdr8UBEDX9TPekP2QoadX3esH
	MpGJuOcunT4Ui7TpTKUTO6pRNHTPREBdQb8sRukTfCI2K2M/ru7ENBmySIpwL8geJDkDGWII+bV
	ZAurV/lGaVHqD+R/xBg9HSKjeIm8eKsC38ZrNdrKFkV8RyUQxTlHgdiYUyUgy/TStQZY2+kJYXb
	HX+dxq+wmA+W9ot4cLPBRbofFVh6ccdX2rhGRFG00sOj410sNmTCZJ/rNuQubSwvXtfrFnK4cy4
	etLRgA8J5N8AEvCvBxEiJFdwymZMlqnjNQb5+zS0ZVcTxH+cmXk3OqNMXI96GtOdnCpcIUulww+
	k4gDsp/WezQr27CNo8uS+XWP3zhktyY3h7Mcvy4z/saA==
X-Received: by 2002:a05:6a00:1d06:b0:82f:684a:84ea with SMTP id d2e1a72fcca58-842258ccae9mr4697323b3a.13.1780213615399;
        Sun, 31 May 2026 00:46:55 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84246844780sm933636b3a.30.2026.05.31.00.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:46:54 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 5/6] drm/meson: Open-code drm_simple_encoder_init() in encoder_hdmi
Date: Sun, 31 May 2026 13:16:26 +0530
Message-Id: <20260531074627.8936-2-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531074627.8936-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
 <20260531074627.8936-1-namanarora029@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_004656_205092_6405300F 
X-CRM114-Status: GOOD (  10.65  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The helper drm_simple_encoder_init() is a thin wrapper around
drm_encoder_init() with a simple destroy-only encoder funcs struct.
Remove the dependency on drm_simple_kms_helper by open-coding the
encoder initialization directly in the driver.

Signed-off-by: Naman Arora <namanarora029@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 1abb0572b..0a0ec34e3 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -24,7 +24,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <linux/media-bus-format.h>
 #include <linux/videodev2.h>
@@ -369,6 +368,10 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
+static const struct drm_encoder_funcs meson_encoder_hdmi_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_hdmi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_hdmi *meson_encoder_hdmi;
@@ -407,8 +410,9 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
+			       &meson_encoder_hdmi_drm_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
 		goto err_put_node;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
