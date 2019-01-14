Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98097C43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 15:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68EC420657
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 15:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V6qsSzm7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="N8rrlIwD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68EC420657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iuycONxJAgMdJZFvZ526N+Hpaik/+35uXvzvbJbY7ic=; b=V6qsSzm7/cJlsv
	oB9yVceWmOXOKSAN59exfluRyUdfCwdor4lnAckQhanLZhWRT1CPCy75oiNpJb4suvMvuRUJJwAdm
	yu3Any+9JiVSSZ/jdI8Vap84CK8FeZWDmPg6IKkinRQKNUL44HNw4Mfs+lFW3FUPQPTnyN0IDhDMm
	Zxm52E0Bo1sw9Z22P7TSbPeC0kX8w3uo0e72kw85AXOeg0yRYF1ivPrQgLcuWU+RFT7TJLOh/i4eU
	b3JllxSRFcdZsVMDUtTh3+tbT6s+RAvams96KwLZd/oL+YZrfbijWSVYoX4WhD8lsrbWFXxwq1sPK
	t+kdGeCj2bPx3raA5kXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj4D0-0005AW-U1; Mon, 14 Jan 2019 15:31:26 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj4Cx-00059x-FB
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 15:31:25 +0000
Received: by mail-wr1-x441.google.com with SMTP id u4so23377469wrp.3
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 07:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUIvlmAEcY+BZX4hQKddl2mhdBesFefUIZcyGleRk5A=;
 b=N8rrlIwDdZa3XZ2aOcK0Pzlukp46q4rosZsiSPvmVjCUcN3qsMhkLETRpxWQBOzZm+
 U5vBxWcde47yqquw/J5SdAz3vwdp23ogWKjluA5pAXXj+8JsCs1y3PwaYaM0xQ0frfPd
 aIMvu8atMsVhocSz/KeDI5rPYNVYACPyP4U4QGigj5aoTpZKTk4Ok+5q0VEjszHOJbRK
 3Sx4LpQ+gXuQ5kfpj66amwvpO8Kkr7HwyUjZ1Zj8wtgP8BFtg4cJ0bdZve+zGPvY/u/6
 uHkVUn7odIAVeMh5egf75z0ggW9lIP/YeePMeBFVXiXCG3sCCgaJHzFrW6A4Ofbewqhn
 nfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUIvlmAEcY+BZX4hQKddl2mhdBesFefUIZcyGleRk5A=;
 b=EFG5DbGvKVCcFQ57P1jo8xikiUajHh59swl+VoUhrKZfeqVAAIk9ewe2rlAY0p/0EU
 LD4ocMAnZrbDt5oucqX8LkclDy/Rr+OZid2/LOvSbeG2G1UrY7XL7VOcxTugvQjsMZbv
 hJ+gGqQjT+N8zs+aazPMDGOiAFRUpfWE7sY/mJJ41I/dt2UguOnHj4H9zmpUoAecsCfu
 TeR0SfECpeHPNmYneMhIXYJqqMmcQkRbUBV1Fc7XerHItqsH0kswz8ZhxnS4isyyGkew
 K9HwwsZII93zg0QFaDxLY1G9D3ZWDMEzGr5+9n5y4ho/oDN30cPFfFdlsESVIuUt9L44
 sapw==
X-Gm-Message-State: AJcUukfis3lShPg0Se4RKFpD6PjyI1rz4ic/vsM9kn6aqXKh1SYIktg8
 0Uw6/syBjuW1RE9P3KXMp1w8wcc1+wYmiw==
X-Google-Smtp-Source: ALg8bN6PEReudH+rmbahgzbAGTEDX8SWxzJrBkM3b/CGVjiA8uuFlvoM3xK3VTgQPGUUfEDoyywLlA==
X-Received: by 2002:adf:e488:: with SMTP id i8mr25576717wrm.10.1547479881445; 
 Mon, 14 Jan 2019 07:31:21 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z12sm63089470wrh.35.2019.01.14.07.31.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 14 Jan 2019 07:31:20 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH v2] drm/meson: Fix atomic mode switching regression
Date: Mon, 14 Jan 2019 16:31:18 +0100
Message-Id: <20190114153118.8024-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_073123_511217_F535ADE8 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: linux-amlogic@lists.infradead.org, Tony McKahan <tonymckahan@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Since commit 2bcd3ecab773 when switching mode from X11 (ubuntu mate for
example) the display gets blurry, looking like an invalid framebuffer width.

This commit fixed atomic crtc modesetting in a totally wrong way and
introduced a local unnecessary ->enabled crtc state.

This commit reverts the crctc _begin() and _enable() changes and simply
adds drm_atomic_helper_commit_tail_rpm as helper.

Reported-by: Tony McKahan <tonymckahan@gmail.com>
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Fixes: 2bcd3ecab773 ("drm/meson: Fixes for drm_crtc_vblank_on/off support")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c | 23 ++---------------------
 drivers/gpu/drm/meson/meson_drv.c  |  6 ++++++
 2 files changed, 8 insertions(+), 21 deletions(-)

Changes since v1:
- drop the unecessary local ->enabled logic
- use drm_atomic_helper_commit_tail_rpm as atomic_commit_tail helper

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index 75d97f1b2e8f..4f5c67f70c4d 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -46,7 +46,6 @@ struct meson_crtc {
 	struct drm_crtc base;
 	struct drm_pending_vblank_event *event;
 	struct meson_drm *priv;
-	bool enabled;
 };
 #define to_meson_crtc(x) container_of(x, struct meson_crtc, base)
 
@@ -82,7 +81,8 @@ static const struct drm_crtc_funcs meson_crtc_funcs = {
 
 };
 
-static void meson_crtc_enable(struct drm_crtc *crtc)
+static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
+				     struct drm_crtc_state *old_state)
 {
 	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
 	struct drm_crtc_state *crtc_state = crtc->state;
@@ -108,20 +108,6 @@ static void meson_crtc_enable(struct drm_crtc *crtc)
 
 	drm_crtc_vblank_on(crtc);
 
-	meson_crtc->enabled = true;
-}
-
-static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
-				     struct drm_crtc_state *old_state)
-{
-	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
-	struct meson_drm *priv = meson_crtc->priv;
-
-	DRM_DEBUG_DRIVER("\n");
-
-	if (!meson_crtc->enabled)
-		meson_crtc_enable(crtc);
-
 	priv->viu.osd1_enabled = true;
 }
 
@@ -153,8 +139,6 @@ static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
 
 		crtc->state->event = NULL;
 	}
-
-	meson_crtc->enabled = false;
 }
 
 static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
@@ -163,9 +147,6 @@ static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
 	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
 	unsigned long flags;
 
-	if (crtc->state->enable && !meson_crtc->enabled)
-		meson_crtc_enable(crtc);
-
 	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 3ee4d4a4ecba..a74d861ddceb 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -75,6 +75,11 @@ static const struct drm_mode_config_funcs meson_mode_config_funcs = {
 	.fb_create           = drm_gem_fb_create,
 };
 
+
+static const struct drm_mode_config_helper_funcs meson_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
 static irqreturn_t meson_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
@@ -266,6 +271,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	drm->mode_config.max_width = 3840;
 	drm->mode_config.max_height = 2160;
 	drm->mode_config.funcs = &meson_mode_config_funcs;
+	drm->mode_config.helper_private	= &meson_mode_config_helpers;
 
 	/* Hardware Initialization */
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
