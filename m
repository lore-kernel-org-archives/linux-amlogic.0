Return-Path: <SRS0=wdVM=UE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507E7C28CC5
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 14:13:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26C9A20866
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 14:13:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p2DfcN5L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Asrc1pFr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26C9A20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxfRHhWCraCktE19h2eUhKY7jDpwTC1G9St0uJ3T/Gc=; b=p2DfcN5L+GjKXL
	7K9Lgn9AKd+WuWuQK4PeedcEWsfa/9ltNLpR3SJR6ZxuxjlbwoWPRfn48YFYLaTxHO0nQAfdsImhG
	z4EZo1aF46RjKMR8MlCAcHAeqJldwLNMgnRvFUsE7HLyUcUNwWDbW2l9NrvW2PYlUevGzpiDYtWJg
	diX5nIIWqj45UU9XWyZai+G858Ph8Oln/MI00bD3hD/OnPoMkQxTFMJlFY0qeJfcFLMuUPIyr7/qp
	kXAIFSotow4u31lwrEst4r8T56VQNqprNG6koQlhkavwomNriVI4JNpMhthfa+v2D4xBEJumlu6lU
	f9zPFXg0+efKLj3+znBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYWfL-00088F-Co; Wed, 05 Jun 2019 14:13:23 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYWew-0007c5-Vr
 for linux-amlogic@lists.infradead.org; Wed, 05 Jun 2019 14:13:01 +0000
Received: by mail-wm1-x342.google.com with SMTP id g135so2430566wme.4
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2019 07:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CiicJKseqdKOg5DHKMcjVCBzkcBVtZ2N776bahkz4d8=;
 b=Asrc1pFrwP/vms/HaF6ahudawkZj7r6MSdAFZiQNwE+2rIPqYk39LYibggrg3PpASb
 Lxs45FxLnqC1K6Z/+7Qt29IjRcH8V0USApXqVIJh4XCCSi2Z/V/mSNnpJyrDyuj0XZz4
 qEF5f/ioRukigieqF0HWRUSDmdzxjPElHcPTn9y/2MPWUrxqfLK2lPsPJf0QpQjgrQ/V
 ZDzG5+XmDVDVT/CVqrOlrt0/1cB3v8Hp6w19zCN0YcksRErl4ZCUJcJaoMFkrkvOlwji
 SfSmivfvh6n+9o7pF6OSRL9rtTFVHzKJ3hcycaKKwx/ELndMtA0+ufNTmh2jnAMtY6RL
 UbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CiicJKseqdKOg5DHKMcjVCBzkcBVtZ2N776bahkz4d8=;
 b=eCIbsdST0cQwSCneTJSJTJEsHt9zbtBN9ttjuG2dA5aMFKx0jTLhtBdXZpMk9kRGK8
 k1Sa9SJKfshh7QNth7FPprLIsoL87WYr0yva+GLgbdKhiBZjIhnKF3Jie5bFPgpo9P3p
 iPWslZyWk2kcsv+xCa9GJbPm/XaZFkM2w/vSNYnhx44NrShNVwfXReWN5D8A2YvsaxTr
 Sqets65wTNYFie6Py44/9JKfk090da7/UKyOTgF2sBGPNRv4t7WqzpbXgy41CUmK7Eo2
 PGwbweYhF19WQBRm6Ps8So0bsojuPRFvid6SiAlkLdKJom80dDpGMqphPqz91vi4i5Wt
 5Dcg==
X-Gm-Message-State: APjAAAWOOfEgrf88pxRbS9OKGZz8lGIcdeuZ44tNoWnaOWmyXXLbekzk
 Wnkl0r43Ov8jAIQgfCl4O2QjCA==
X-Google-Smtp-Source: APXvYqzI3IVVjrCS/CpME4PJLgA844fWjiI4G6tQsgpnScJPfDZYOVtvDPHviInkIWlgQ7OFwSUOYQ==
X-Received: by 2002:a1c:48c5:: with SMTP id
 v188mr21902049wma.175.1559743976973; 
 Wed, 05 Jun 2019 07:12:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s8sm36292546wra.55.2019.06.05.07.12.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 07:12:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/meson: fix primary plane disabling
Date: Wed,  5 Jun 2019 16:12:52 +0200
Message-Id: <20190605141253.24165-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605141253.24165-1-narmstrong@baylibre.com>
References: <20190605141253.24165-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190605_071259_027264_276783ED 
X-CRM114-Status: GOOD (  12.26  )
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

The primary plane disable logic is flawed, when the primary plane is
disabled, it is re-enabled in the vsync irq when another plane is updated.

Handle the plane disabling correctly by handling the primary plane
enable flag in the primary plane update & disable callbacks.

Fixes: 490f50c109d1 ("drm/meson: Add G12A support for OSD1 Plane")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c  | 4 ----
 drivers/gpu/drm/meson/meson_plane.c | 4 +++-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index 685715144156..50a9a96720b9 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -107,8 +107,6 @@ static void meson_g12a_crtc_atomic_enable(struct drm_crtc *crtc,
 			priv->io_base + _REG(VPP_OUT_H_V_SIZE));
 
 	drm_crtc_vblank_on(crtc);
-
-	priv->viu.osd1_enabled = true;
 }
 
 static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -137,8 +135,6 @@ static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
 			    priv->io_base + _REG(VPP_MISC));
 
 	drm_crtc_vblank_on(crtc);
-
-	priv->viu.osd1_enabled = true;
 }
 
 static void meson_g12a_crtc_atomic_disable(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 22490047932e..b788280895c6 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -305,6 +305,8 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		meson_plane->enabled = true;
 	}
 
+	priv->viu.osd1_enabled = true;
+
 	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
 }
 
@@ -323,7 +325,7 @@ static void meson_plane_atomic_disable(struct drm_plane *plane,
 				    priv->io_base + _REG(VPP_MISC));
 
 	meson_plane->enabled = false;
-
+	priv->viu.osd1_enabled = false;
 }
 
 static const struct drm_plane_helper_funcs meson_plane_helper_funcs = {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
