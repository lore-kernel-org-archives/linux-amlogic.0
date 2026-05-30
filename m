Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48E5CD6E52
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 14:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrEoLXsyMFDmmhYz4z9VoiNzYKChGMfbyLkJT3BtqII=; b=qMsEVZ3msbVO97
	x9FTnrXPgfyp+vm2tdATP93Rvab/M7Bm9q/4sDzN8IvMXEZDoTWHl2L7qmKOwMNWbp2i/8TbVPvHp
	w6s4dhBQt5vRyJSpRkVbqKIj7ONB3bIh3+R3o1bgbUPPeCCZS58VbscCjvXwcJVhaP9zYSGfP2nwJ
	qq2MHxcj3d3k3RiXzM/9QzC5Jys4wYOuL/q/hgUJhkpuXDvGyEKp42gu/DWkvjnVsNag9rdP/K/va
	RzpY3S2PJlgSHgpq1T3TVHeAnUILvgdeGFH9k1/O2nQeqq3hjPVX8L5AchXN2j5PkYAq4s2g/YaiC
	lgZ58u+uyensBQJqLhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGk-00000008nV9-3vIR;
	Sat, 30 May 2026 14:02:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGV-00000008nKV-1Jqb;
	Sat, 30 May 2026 14:02:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0173D417AE;
	Sat, 30 May 2026 14:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650981F0089A;
	Sat, 30 May 2026 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149734;
	bh=TBTVHCOGMn+PdYzmZh8Yzod8OmkafQ2WnwcJRkpSLgA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CnfKtAXXqDX9csAibGk+dbt50KePO8f5jpYisT0RXNiaH1hMZqru3SI3gzSkOF6xx
	 ftICNwkkUwUzBxAgWnqNf2A/OxStJGfTh1jpk1EGYQYkthaBSG3HIQdFJUCjH5XONr
	 ROmNEu/t2Mk3bUuTN+y3Rb0lRBq61nK1SPg1jaGFQ942c2XNeyAfGa4IoLDZ+GuQ5d
	 r+bj2CQ2fAnIfxTWMW8sYVJz5Oq7y0VXPCoZ8dUWjLhSclf4WxGRvseET5It/CA5JP
	 QHXkltyYLw7ZZrFPc2+eTsDyJOpp6b+/IAZtn3rmETcg5OgP66lYYkUHhk4kSBrxvt
	 MnGPk9bUXksew==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:57 +0200
Subject: [PATCH 52/76] drm/meson: encoder_cvbs: Switch to
 atomic_create_state
MIME-Version: 1.0
Message-Id: <20260530-drm-no-more-bridge-reset-v1-52-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=mripard@kernel.org;
 h=from:subject:message-id; bh=e9jY1L6ze1B4JUzpYRTyMKC2Sa8ATfTs3mxb35dKcDM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb33yKg6sEMs68WtBX987h8exxRODxPyqr9VzP2Mvy
 9T4KhTQMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYy/xNjnZqf3aotWwoq3J49
 3cwjd4NhU0Hisu3WB2f61Vln/Tn2lFFpQfff1FKT+TsXaDMxfUs9wlgfff3h6jXcsl5779TK/df
 TOzVhNv9Ebe64iqspm7lW/niW1X99CxfPIfFNb/sOrLmZMOsPAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070215_399274_6B86A1D8 
X-CRM114-Status: GOOD (  10.96  )
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 8b26a0031cde..22cacb1660c4 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -213,11 +213,11 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 	.atomic_enable = meson_encoder_cvbs_atomic_enable,
 	.atomic_disable = meson_encoder_cvbs_atomic_disable,
 	.atomic_check = meson_encoder_cvbs_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
