Return-Path: <SRS0=PfKa=NX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4716C432BE
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 17:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE31D61090
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 17:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE31D61090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rosenzweig.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sumqFa1yhkp/qw+a4AexrczB/Npjjrludkpi8qIYH08=; b=ax8t0KC8dJKMHW
	AVVdogfsmUXKbyTSIxAHPFk+ZwxKw/lR0MPTFSdCTsYxY0ZhOdVudUBCA4ZsMzF5JTcauLL4SxTdc
	EOW6QDiab6346Jil09uODgGYlInnJraZMoQDPnymQups9YHrHB+aH2F/T2TejibG9rUgZjOSpCsRb
	gOKHA3DpxstJ45nFeVuo/d7IIB/UGf3xNy5b4/ZKe2+5ct+ubG3yORy0APvGASfe3sHAkZRdYLB8U
	OV1A218g5m4Wh64yaBG+UKWppIZhLRPXh9aBIMeV0XLT4XW2ThsPRhe2nisPqxlewb3xIq96aGdZe
	hR89bJj5ilG0pfwZJXqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLUS6-006sTF-BD; Wed, 01 Sep 2021 17:55:10 +0000
Received: from rosenzweig.io ([138.197.143.207])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLUS0-006sRd-Bh; Wed, 01 Sep 2021 17:55:05 +0000
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-amlogic@lists.infradead.org
Subject: [PATCH 2/5] drm/meson: Use common drm_fixed_16_16 helper
Date: Wed,  1 Sep 2021 13:54:28 -0400
Message-Id: <20210901175431.14060-2-alyssa@rosenzweig.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901175431.14060-1-alyssa@rosenzweig.io>
References: <20210901175431.14060-1-alyssa@rosenzweig.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_105504_492115_2879DD54 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

Replace our open-coded FRAC_16_16 with the common drm_fixed_16_16
helper to reduce code duplication between drivers.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-amlogic@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_overlay.c | 7 +++----
 drivers/gpu/drm/meson/meson_plane.c   | 5 ++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index dfef8afcc245..d8fc6bbb332f 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -15,6 +15,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_fixed.h>
 
 #include "meson_overlay.h"
 #include "meson_registers.h"
@@ -162,8 +163,6 @@ struct meson_overlay {
 };
 #define to_meson_overlay(x) container_of(x, struct meson_overlay, base)
 
-#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
-
 static int meson_overlay_atomic_check(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
@@ -181,8 +180,8 @@ static int meson_overlay_atomic_check(struct drm_plane *plane,
 
 	return drm_atomic_helper_check_plane_state(new_plane_state,
 						   crtc_state,
-						   FRAC_16_16(1, 5),
-						   FRAC_16_16(5, 1),
+						   drm_fixed_16_16(1, 5),
+						   drm_fixed_16_16(5, 1),
 						   true, true);
 }
 
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 8640a8a8a469..4fae9ebbf178 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -19,6 +19,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_fixed.h>
 
 #include "meson_plane.h"
 #include "meson_registers.h"
@@ -68,8 +69,6 @@ struct meson_plane {
 };
 #define to_meson_plane(x) container_of(x, struct meson_plane, base)
 
-#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
-
 static int meson_plane_atomic_check(struct drm_plane *plane,
 				    struct drm_atomic_state *state)
 {
@@ -92,7 +91,7 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
 	 */
 	return drm_atomic_helper_check_plane_state(new_plane_state,
 						   crtc_state,
-						   FRAC_16_16(1, 5),
+						   drm_fixed_16_16(1, 5),
 						   DRM_PLANE_HELPER_NO_SCALING,
 						   false, true);
 }
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
