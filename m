Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C609C07E97
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S1HXCoVsSnVTZuxwXALNHG1W6eXrgpji/zdmVMBdqXE=; b=zljjmDUNi5zyp1
	JAmB44rTazT966roHLCR1EcP8092VII3SzrrkaPePP7MMOLOaary+LRCYTJje566MX3iXHpzHuXX/
	83UF6rglaZ7pWT8gCrWn9f1cGuUED6p/oNFgLLIb6pfSgTHuXt3odtSR+j1zrinLbB+rLUd/5cZTN
	JwhaIgqDTOHjRaAlfaepmehacM+4uDAEmuUS7w6W+FJF8p7Ov9urchBU16ZmHUZmzvIbPOMaA+Bpp
	prfTVIHEM8GMMpcTZU3Q6SXWcwHlxZx05N7zHGWHP3SSmcj8941a1Vz8Rkswn2tddC01BjQaeQcCI
	cF4zy6noN2/7qRX1fjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8GmT-007cW1-3D;
	Wed, 29 Nov 2023 09:22:53 +0000
Received: from m15.mail.163.com ([45.254.50.220])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8GmQ-007cUh-2c;
	Wed, 29 Nov 2023 09:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=RYl3c6WXzDrRpbjIfV
	dIreOF56KOfXk0Od7xbr0Mo5Y=; b=pLbcSYTqLdumG+FJD/65/z0maKYMqRzJSY
	/FpnmpMZlTxnZzDQLOKDusWc6Gtt4KQcKj3V6rmC+x7V/sl8mMjRuIihX8kGEA5q
	HgTtrw82wtg/OG6NvIg/zZo4SnSZxwSTp3z1I6BrFRuQFJsaJYy+3n0jSjrq1WPH
	kb6lGdgRg=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g0-2 (Coremail) with SMTP id _____wA3X+CMAmdlXBT+CQ--.41354S2;
	Wed, 29 Nov 2023 17:21:17 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: maarten.lankhorst@linux.intel.com
Cc: neil.armstrong@linaro.org,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [drm/meson] meson_plane: Add error handling
Date: Wed, 29 Nov 2023 01:21:13 -0800
Message-Id: <20231129092113.32630-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wA3X+CMAmdlXBT+CQ--.41354S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWfWryftry3Gr48Kr4DJwb_yoW8Wr1xpF
	4UCF1Y9r17Aa15t347AF4YyFZxWw4fGFyUuFy8twnYkwnxKFy7CFy3KFZrCF4UXFW5u3Z3
	Kr13Cr4DCF17AF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi5EfUUUUUU=
X-Originating-IP: [39.144.190.126]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/xtbBchI3gletj5ACogAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_012251_229898_96A2A4DF 
X-CRM114-Status: UNSURE (   8.97  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds robust error handling to the meson_plane_create
function in drivers/gpu/drm/meson/meson_plane.c. The function
previously lacked proper handling for potential failure scenarios
of the drm_universal_plane_init call.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/gpu/drm/meson/meson_plane.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 815dfe30492b..67b36398f146 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -534,6 +534,7 @@ int meson_plane_create(struct meson_drm *priv)
 	struct meson_plane *meson_plane;
 	struct drm_plane *plane;
 	const uint64_t *format_modifiers = format_modifiers_default;
+	int ret;
 
 	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
 				   GFP_KERNEL);
@@ -548,12 +549,16 @@ int meson_plane_create(struct meson_drm *priv)
 	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		format_modifiers = format_modifiers_afbc_g12a;
 
-	drm_universal_plane_init(priv->drm, plane, 0xFF,
+	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
 				 &meson_plane_funcs,
 				 supported_drm_formats,
 				 ARRAY_SIZE(supported_drm_formats),
 				 format_modifiers,
 				 DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
+	if (ret) {
+		devm_kfree(priv->drm->dev, meson_plane);
+		return ret;
+	}
 
 	drm_plane_helper_add(plane, &meson_plane_helper_funcs);
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
