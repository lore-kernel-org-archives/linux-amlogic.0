Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06C1C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z4gZ4TFDqYplRqGipDl0oTKmB/O9J94xvQzYrm2L4Oc=; b=HlQMz/23qXuyXw
	P/O3C1aoKiPZ1+kSyZMbTFU5BuXIZ6zTAxPPsiUy9URS2DDGUzbY/DFJSD09wjY1nhmvEG9F8fjFJ
	ejlH3VPeEJ4GtdnHhXQm6Bf0UZPQGmc7dV+j/2BeS5BCSuSI2GVddBae3/ERAa2K7cF7LWaXo5paT
	S9/7cmUNeHXQieS39RNecMztJ6OQAPZ86pEYvqS5ZSGXlhTmMdZKtAYXCH2YxVI4XGEXNGdi+7hnf
	0uxTJSVMa6nW+8raC6c2t8ysrIAV88rp7cc96Fe1Kohth4Pbew1KUcK7yiPu0xnJqp8IuOnWQjqmS
	IB8pfqdj1WkGvGfZFTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Iq5-0088gR-2R;
	Wed, 29 Nov 2023 11:34:45 +0000
Received: from m12.mail.163.com ([220.181.12.214])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Iq3-0088fL-1x;
	Wed, 29 Nov 2023 11:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ZAsQiqQtYrl7dfrofE
	u3bEncXTW4ARayG+BTXJ6pdqE=; b=JVUaCztkrUfhYVpftCkPcJzISA6ReUW6G6
	Lb0ic9gSx8IjfkhQmG53TqHphSEzXyQTlzT72ZtfKWK6iIw3u/W4hIBAqoxcgmIT
	S2xZL9+j/r0ND6gJP+5I46qfi31vroS9LDV3ENPPIPW4izkH9X5PnVLiG8wTPOd6
	4uouplpE8=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g5-3 (Coremail) with SMTP id _____wDXXmKvIWdl8CEBEQ--.41793S2;
	Wed, 29 Nov 2023 19:34:09 +0800 (CST)
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
Subject: [PATCH v2] [drm/meson] meson_plane: Add error handling v2(re-aligned)
Date: Wed, 29 Nov 2023 03:34:05 -0800
Message-Id: <20231129113405.33057-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXXmKvIWdl8CEBEQ--.41793S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWfWryftry3Gr48KFy8Zrb_yoW8AFy3pF
	47CFyY9ry7Aa1Ut347Ar4YyFW3Ww4rGFyUur18trnYkwnxKFy7Cry3KFZFkFyUXFW5u3Z3
	KrnxCr4DCr1ayFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRb4SrUUUUU=
X-Originating-IP: [39.144.190.126]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiwh83glc661p0cgABsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_033444_035956_A56E870C 
X-CRM114-Status: UNSURE (   9.36  )
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
 drivers/gpu/drm/meson/meson_plane.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 815dfe30492b..b43ac61201f3 100644
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
-				 &meson_plane_funcs,
-				 supported_drm_formats,
-				 ARRAY_SIZE(supported_drm_formats),
-				 format_modifiers,
-				 DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
+	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
+					&meson_plane_funcs,
+					supported_drm_formats,
+					ARRAY_SIZE(supported_drm_formats),
+					format_modifiers,
+					DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
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
