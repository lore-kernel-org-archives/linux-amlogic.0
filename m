Return-Path: <SRS0=re6n=PR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37433C43387
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 13:37:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E79B7206B6
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 13:37:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTbajV7w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YGb1FjjI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E79B7206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kR45exDLZcuDj3egj+hlGU8eF/sMMgjG4bvZWDybDkw=; b=jTbajV7w+QOESM
	oXwop4cI5SasfOwagY5VUwFLqiKr80oFMA7DYX7nHnEPVtwUIKsSmRxE3hTJb7MuD+Z0nApjF3ZfI
	avIStr8pb176bOnDZU2E/hyWFwAZPxXf6i2ep82l8qnjgAXm0QZD8hHk7ldA/EZVu3f25fTTUIN4B
	5PMnlgKaGPLp7XVV/IiFNYn2lvYHNdv/lZvqCRBapJWVMSnRW7MLeP6t5+1iVEMSmtooMRl57P5oi
	z7nNKgUjYz//2c9qv7IidOAV5iTAf02fHId19UBWYXj7Ts3iga5A9zw7E+uI6ZbUEm9vz9BmecsSl
	N74QNrrF1cxRWuwDRK9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghE2Q-0004NG-MC; Wed, 09 Jan 2019 13:36:54 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghE2M-0004MS-Ju
 for linux-amlogic@lists.infradead.org; Wed, 09 Jan 2019 13:36:52 +0000
Received: by mail-ed1-x544.google.com with SMTP id f23so7334468edb.3
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jan 2019 05:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JnLgVrJVpbIyePwV3TfK2FR4As9YTA7Q8/JEe8171WQ=;
 b=YGb1FjjIxdsQJiHQLY5+Najak26OJm8/l0CGSofVvUEOpFgiUn7GK9yb0vUejON7uX
 Mnq5UrVvPmczHxtzIy1OBym9P4j8G9HeR7F+6bG2vHYY4iiqdhzPYgAdiRlupNPP7uQY
 KpGvFtJ7IRnchYC5b6CyfbEMn6gR/i3qoFsc/okhcZBb20Gozn2TnEBslfQFKB69e8FR
 ScsP3TccmT92L5CoEhqRzwhTUWJmT/at1H/nyYJsOC4UFYo8t9sTqgpUq/30dWm91htb
 vyKWmWbHTD6q1lAF3ARdMEXZMfhZ9NKCWBtntJY7UKrCZUve03anHQOFkg4nK+2N5b/7
 UYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JnLgVrJVpbIyePwV3TfK2FR4As9YTA7Q8/JEe8171WQ=;
 b=pbWOCMqlbdme6FiyysP0+ra0Cdkxh438VV0EfIsnUWEY76Z1vRO8Jvjm65EE4jMAUh
 bLF1dJzvIkMuk5fXsL1Wy5iLIdDiyERlQJybBm3qEiHZ2XsL83oY7ojf24ULEq6S9l9I
 2q+BQlYVdHCPID6TRGEkDEhSsw7TdOd9ogTelvgNiSYszzrFWaAfci44A3FWJHZ/gjjK
 satAJxrnOKNJhhU907Ak18MadbFWD6YQDJyrwNJYYZ2EhcLPhfQN7vCkZOTAtcfDGVBq
 ndhbJWM3SfZTcHSqsAULeUhkBVC4ReREO0kGDaBD9rJX0sb+5YwlCIWOCrXUolSYWU03
 yBWw==
X-Gm-Message-State: AJcUukcinC13MDwXLa0Rwg6BnGokBMQIiCBfuTDHZSL5ItmIS8aGhJAf
 Go24FalQzpc2USNILD2bfNNsng==
X-Google-Smtp-Source: ALg8bN4HYlDh4yDZ4sQMTutowgKGpGI1HJ4YYFkzY7WW/4Utj1ZzHPxVqlbE7kF+37CiCt+QxANg8A==
X-Received: by 2002:a50:90c6:: with SMTP id d6mr6213815eda.15.1547041007775;
 Wed, 09 Jan 2019 05:36:47 -0800 (PST)
Received: from localhost.localdomain
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id c53sm1623999ede.26.2019.01.09.05.36.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 09 Jan 2019 05:36:46 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/meson: Fix atomic mode switching regression
Date: Wed,  9 Jan 2019 14:36:43 +0100
Message-Id: <20190109133644.27459-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_053650_794641_9BF6D4C2 
X-CRM114-Status: GOOD (  10.32  )
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Since commit 2bcd3ecab773 when switching mode from X11 (ubuntu mate for
example) the display gets blurry, looking like an invalid framebuffer width.

This commit fixed atomic crtc modesetting but didn't update the display
parameters when changing mode, but only when starting a mode setting after
a crtc disable.

This commit setups the crctc parameter in _begin() and _enable() to
take in account the current ctrc parameters.

Reported-by: Tony McKahan <tonymckahan@gmail.com>
Fixes: 2bcd3ecab773 ("drm/meson: Fixes for drm_crtc_vblank_on/off support")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index 75d97f1b2e8f..5bb432021caf 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -82,14 +82,12 @@ static const struct drm_crtc_funcs meson_crtc_funcs = {
 
 };
 
-static void meson_crtc_enable(struct drm_crtc *crtc)
+static void meson_crtc_setup(struct drm_crtc *crtc)
 {
 	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct meson_drm *priv = meson_crtc->priv;
 
-	DRM_DEBUG_DRIVER("\n");
-
 	if (!crtc_state) {
 		DRM_ERROR("Invalid crtc_state\n");
 		return;
@@ -98,6 +96,16 @@ static void meson_crtc_enable(struct drm_crtc *crtc)
 	/* Enable VPP Postblend */
 	writel(crtc_state->mode.hdisplay,
 	       priv->io_base + _REG(VPP_POSTBLEND_H_SIZE));
+}
+
+static void meson_crtc_enable(struct drm_crtc *crtc)
+{
+	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
+	struct meson_drm *priv = meson_crtc->priv;
+
+	DRM_DEBUG_DRIVER("\n");
+
+	meson_crtc_setup(crtc);
 
 	/* VD1 Preblend vertical start/end */
 	writel(FIELD_PREP(GENMASK(11, 0), 2303),
@@ -121,6 +129,8 @@ static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	if (!meson_crtc->enabled)
 		meson_crtc_enable(crtc);
+	else
+		meson_crtc_setup(crtc);
 
 	priv->viu.osd1_enabled = true;
 }
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
