Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4639FCD6E51
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tlTqLJpsPySffRR4QTfGMIkrA69OcWXqVb79pzhZgA=; b=KCk4mAQDhZTv/9
	tkitJgB3ApZ7X8vLSsiyYppZM+xGgQ+EBJOVaFbHNKhPfre9B5nw8bLe9AO+HqeHBGUzKTf60ZNbn
	MKBYVlmIemkD1VXyXGgcg+C/4iGIYI2MEX9ypQJfOeFKL8ZWfKDzxTVsTYhG/KHbbOxA+4mC4QkUb
	1zxzI49d2GvAaVty1ke0f1ksFUxJmcGsESVqdR5ZyeH9VKC0bdnPCp955NL4X6+/kk8ydL2YvVw24
	5cRXW9Pj79RSk5PbzbqtMyCmOGhUDqOO0wCmaQOOufrGBn+V5Ip+X19uO0I6oMOh41Rk1eqDEe3x2
	c5DJ8HJ4gB7DeemuCIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTask-00000009LB9-3MCG;
	Sun, 31 May 2026 07:46:50 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTash-00000009LAE-3nua
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 07:46:49 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8423f236418so102926b3a.1
        for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213607; x=1780818407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZgZXDapD3/D+twZe7T4nhGsVyTA1P2sNWQ93wpwZx8=;
        b=JJFTjj1QMYBNl2l62YRcNTUJUSEpJQTFXVZR9Vhnj4fqZ2KhkDSD0HWGjC9oCgfgxh
         C0mE7ruG9JXosvk2l0BiPW2G7hPykzLaPrs1pYUoLC8+/WT3dFAbCeny983/UHG9wWGq
         cLcnkmPoBRkzBSSrQJvXuDLjuGRcOphYCWLd9GgC9bAb17b1uBVirve95nZCK3HyEhAf
         TnOrG/hBoCLUSzZuhLKmZJ3tMEZyX18m98fxQNPzclvvrk+FCAnRVi1DZiOXIztW2CmU
         AVxlXhHVX1MvCAV/VjaXHnDQgel3ypvHYiZ/G9NomBLjtm1kcufGE0n8RDP2clPHI9C7
         x5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213607; x=1780818407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pZgZXDapD3/D+twZe7T4nhGsVyTA1P2sNWQ93wpwZx8=;
        b=gtkhK9Om0FlrWLaK8+N8Mvjs3Pps+IM3Z9kXj9Swnn2v6lhpRN5R8suaXDpw1zU1QM
         T6A9IXSPJ9LNKjO/J6mWHtNaF5krf29JPWOt1F/MrG75GUv/OJx1RLV35k4SbjDZSH6T
         LQ+025+USJdRD8YuA8CZWN0GY4DbQTcj90tChD93ABZ/tseKWnLO2b1YhDIC4XX1Q7mD
         uuoEk2rJ0yexX/v7t2t8FNq9vjJnGVRTSEqVo60tDraNgcbcppQeTOuGcVhj3t42nfmI
         k3yU0xXogc/wl6S7y/h1Xexl9q5dJtnTzqbXxiVWXgRXsAwu+rw/HiFTG2vSCCW/tXPj
         QKiA==
X-Forwarded-Encrypted: i=1; AFNElJ92N0uFE6IF258z66Y+wpFSaeG2zXILZk5ReRRV54jVqAJl69/JmBTz7PxaZz8N/bBGflFOx9+/P9dNHu+v@lists.infradead.org
X-Gm-Message-State: AOJu0YwV321SPF5aSaPvV3w0DFuzVvKq22jbLWaEDD6mZojivs2E4lC4
	ZeEqlwuSX2yDhjlozQzZEiMktDx7cxx3BTfbDbg13XluxoXJkyKQlkIQ
X-Gm-Gg: Acq92OFqG8ZJ2wq3mKeE8bomiBeHrC/BGWKLc3fTz+12/+mbOvhfO6nJq7LrbGpM+al
	B6MQD2LLUOAfz+WxOUys/ld4A24LKHIlJcEW2MRm/+dulAxLS+XJOYgeetvnXNx0KE9BS4O1jPN
	XI6U9h+Mql+ZRw75uw2WWg66U+7Ix+Y+EVEejdrLfEBZRnO7tdKmZb4V5rnB2T96WMlgOJh+hdY
	JOSGuqn6TkwgMMhdnLCmIULsignSA13GwkCkqvTgwusJFuYGdziwXn2v/5aVzJA1jLSs6ypRW7f
	n2IdiMX1lsjcZ3GHFoFtawmcvAOfABCuXzXXHDQQ+g8tX9KbBSfzj9ZfowsP+Vlyo9Z2mQToXWR
	HBaitlOqCNw4KjoxYiTDmBaknIIpNLbDAU+40gIRGSWWKGAuxbG6PLkduxvNbqRLz6HI/oLcXK+
	KeuM86PL8YsL62P9GEjc90d5XXlDMgG9PVbQBzdA8cGQ==
X-Received: by 2002:a05:6a00:4f93:b0:842:432e:b802 with SMTP id d2e1a72fcca58-842432ecadfmr1408991b3a.16.1780213606915;
        Sun, 31 May 2026 00:46:46 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84246844780sm933636b3a.30.2026.05.31.00.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:46:46 -0700 (PDT)
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
Subject: [PATCH 4/6] drm/meson: Open-code drm_simple_encoder_init() in encoder_cvbs
Date: Sun, 31 May 2026 13:16:25 +0530
Message-Id: <20260531074627.8936-1-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531073532.8609-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_004647_947007_F7CA8EB5 
X-CRM114-Status: GOOD (  10.73  )
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
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 41071d6e0..496100ba2 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -18,7 +18,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "meson_registers.h"
 #include "meson_vclk.h"
@@ -218,6 +217,10 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
+static const struct drm_encoder_funcs meson_encoder_cvbs_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;
@@ -257,8 +260,9 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	meson_encoder_cvbs->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
-				      DRM_MODE_ENCODER_TVDAC);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
+			       &meson_encoder_cvbs_drm_encoder_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init CVBS encoder\n");
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
