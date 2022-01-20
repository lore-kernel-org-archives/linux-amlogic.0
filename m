Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0AAC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 08:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHGlb74euQKoQfxjhZQ0iQ6TfDdocVFl4oMOUMWB4Es=; b=yQ1PMjr1hQpIW2
	SAWKZzygyy9eR1vuN5eEexTWBHgJsul1B+6Q0vgsZYVMWTq2zPuwVieu28hBOPC8dejz+mJASmaCj
	GhUK/R+CPzoLNa1Z6OFtEjb/e4htFzX9Hk3jhNUmFVoZVcxSekM31THmGbvwl9PIndjMdimg7PdwJ
	AU5WWpz4x2Y5PwzEW3BZSPd73hmTgV+USbUlvj9FlXib513yLiQF4PPdrdiewEyEn4c8kb+cRDJoS
	twGez4yzvX72hRa1jLrVquoPQazDSVBemEwkpQg56MvLBqdaYL97IVmeqTeTUbP2B8GG3lMrTHhwr
	jnZcjS+aaZq1g9LS8nDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nASvl-009ofq-UI; Thu, 20 Jan 2022 08:36:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAStu-009nTU-BJ
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 08:34:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso8583718wmf.1
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 00:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uDGld15p2TTjs4XPGab1BCnqHGsEhhus/cMzzZMkInY=;
 b=SL0NXkOtmiLDZgmfcOQ1k4sqyoZ2PWhLtsx8xuO4mHQwcAT8IOoUFe2F6Wz3nJZIHd
 ULyqr5w2NKuv4zpNmzr6fBvLPJkK/pWoJdJk4MhgSAaS4S77THHyMFVBwXXQVWNjoPZp
 CSXd65NJVSE01bKGK76hut0eNCmNebxMtcTEFJl9upZFQQlLOPDBOUXXvdGrQf3eRA+d
 0xfViF7HhUbvEIud9oTIwko0XfLngmkIDBkDh1Jqc0vOy3xSWIB/tBqONbQmcB3W2EJS
 4/mStv29nyW6tj/GkXh8BCZsTcCqAix5grcW5PvUFpDB6IjUTxnIwTpD4nhNYjR+s7ed
 daGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uDGld15p2TTjs4XPGab1BCnqHGsEhhus/cMzzZMkInY=;
 b=ehO6/QInMqRLTrjLLeQ9NSRN2gC2WGCf59VWQ4IhyJTbXdB3ne8+X77CqShCVrZhOa
 lY6epAY6zNJBtYlT10GXg8mZKhgSGG9f5bPZ5w41cZSCAqxY4LG47EUn57tatUMiUoEr
 /AfQm64eeI8bXxF/lxRUiAn0Kv6KipwwWdrLNfJjfruFWMjbskj2wfmMxmaVKoNS5VQx
 Kn2c8Qi/wssbmLlhuUB9AWyINcGCvhOpYIMFvpjnXDsVariByiu+8XHfC4xhCczEHsxr
 HNkHP9Vj/Shm5MIWufSI6exk6p/c0IJk98YuRUKRpvGHZfJxznsEbEE05qR7a+KRdrPg
 DBAA==
X-Gm-Message-State: AOAM530q+PSO/GOMsuCnbNVwyDQYt/9r3hxkab4BMX50zzBAt89DvMZB
 t2aTjiQ8fZU9zqercJR2TIrCRA==
X-Google-Smtp-Source: ABdhPJxu4mlKCY5/ND28SdBP/83UgXQK3eFU/va4HhpW73D4XZ7Pkrdau2oSmCMTFbVPXymjc8zmvQ==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr7535184wmj.77.1642667672998; 
 Thu, 20 Jan 2022 00:34:32 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id u16sm1821975wmq.24.2022.01.20.00.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 00:34:29 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 5/6] drm/meson: add DSI encoder
Date: Thu, 20 Jan 2022 09:33:56 +0100
Message-Id: <20220120083357.1541262-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120083357.1541262-1-narmstrong@baylibre.com>
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8148; h=from:subject;
 bh=kgUag+31Afui204SJc16nTpAp4cPt104QXDJPypR4bE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBh6R2IhBkhu32Z+0TgRGMCHEcSEScAyWYOMcWvyz5N
 5N+cFe6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYekdiAAKCRB33NvayMhJ0RkvD/
 9f8+8Lpi+7vX8LhmKHWR+WBJnAya2CElWELQ6rtYGcXC713e+esx1Y/yOyLkw/woZhh+ETIzT5SN5Y
 gpqtJMvqWWjxHeqpq32MuI0PgTb8R+uCxWSsmXHXby5FgZ+4wl401HGxPUK+u9HXr2KW5lZxeBk6YV
 Y4nz1R+wxmMnADPQ4GAuf2Bc4bTlH+ZrzbhWAFKy9jDS1NoHbVFXXoqQY7uE4ZXNShC36LdewwKsYT
 7zHdW6wj8eZRDhvcA9OtQ86RD/paDQJSDZbZwTPLUmbtXF3Hp0YqOImkRLp42wjiBjzF+p8WrtmWlp
 J7TSLRYG+61OwEmll7iugNw6GEioit7FyQlFF/LUlSTCMPt+iWVEAQCNvA7Z+HlGSoJmgHNwmj2uhI
 3z0PFL8bDDTLKhSgGNYmA0Ucd0FFE0lCDHTUVmboP3dnmLgM3ViIylpFPwK2XWMgbznheilpWj1u9x
 tQ0d/wm3kGHsszg4FkOjVfcZFcarHoevA72OT3UG+0seakmKNCFZ6fO76gL742egBt27eJIvs3pHBr
 4hymGmbiutQxPgpIkXPQ7YQ0n5V5/HFNsmP8KQn2uaYpWRFV0M+wzHxYlq4mpmzWq5f6PmCttdRRDp
 ajNPmK1/ISYTgExyewx2etpJfQg3/v6mWoTLvRfCW1R38ajrZ4oi4Rzd9sKg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_003434_431153_A369530C 
X-CRM114-Status: GOOD (  22.82  )
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

This adds an encoder bridge designed to drive a MIPI-DSI display
by using the ENCL encoder through the internal MIPI DSI transceiver
connected to the output of the ENCL pixel encoder.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/Makefile            |   2 +-
 drivers/gpu/drm/meson/meson_drv.c         |   7 +
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 160 ++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h |  12 ++
 4 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h

diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
index 3afa31bdc950..833e18c20603 100644
--- a/drivers/gpu/drm/meson/Makefile
+++ b/drivers/gpu/drm/meson/Makefile
@@ -2,7 +2,7 @@
 meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_encoder_cvbs.o
 meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
 meson-drm-y += meson_rdma.o meson_osd_afbcd.o
-meson-drm-y += meson_encoder_hdmi.o
+meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
 
 obj-$(CONFIG_DRM_MESON) += meson-drm.o
 obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 26aeaf0ab86e..15344cf9f913 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -33,6 +33,7 @@
 #include "meson_registers.h"
 #include "meson_encoder_cvbs.h"
 #include "meson_encoder_hdmi.h"
+#include "meson_encoder_dsi.h"
 #include "meson_viu.h"
 #include "meson_vpp.h"
 #include "meson_rdma.h"
@@ -323,6 +324,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (ret)
 		goto exit_afbcd;
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+		ret = meson_encoder_dsi_init(priv);
+		if (ret)
+			goto free_drm;
+	}
+
 	ret = meson_plane_create(priv);
 	if (ret)
 		goto exit_afbcd;
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
new file mode 100644
index 000000000000..12a586316183
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_device.h>
+#include <drm/drm_probe_helper.h>
+
+#include "meson_drv.h"
+#include "meson_encoder_dsi.h"
+#include "meson_registers.h"
+#include "meson_venc.h"
+#include "meson_vclk.h"
+
+struct meson_encoder_dsi {
+	struct drm_encoder encoder;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct meson_drm *priv;
+};
+
+#define bridge_to_meson_encoder_dsi(x) \
+	container_of(x, struct meson_encoder_dsi, bridge)
+
+static int meson_encoder_dsi_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, encoder_dsi->next_bridge,
+				 &encoder_dsi->bridge, flags);
+}
+
+static void meson_encoder_dsi_mode_set(struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       const struct drm_display_mode *adjusted_mode)
+{
+	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
+	struct meson_drm *priv = encoder_dsi->priv;
+
+	meson_vclk_setup(priv, MESON_VCLK_TARGET_DSI, mode->clock, 0, 0, 0, false);
+
+	meson_venc_mipi_dsi_mode_set(priv, mode);
+	meson_encl_load_gamma(priv);
+
+	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
+			    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
+}
+
+static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state)
+{
+	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
+	struct meson_drm *priv = encoder_dsi->priv;
+
+	writel_bits_relaxed(BIT(0), 0, priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
+
+	writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
+}
+
+static void meson_encoder_dsi_atomic_disable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state)
+{
+	struct meson_encoder_dsi *meson_encoder_dsi =
+					bridge_to_meson_encoder_dsi(bridge);
+	struct meson_drm *priv = meson_encoder_dsi->priv;
+
+	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_bits_relaxed(BIT(0), BIT(0), priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
+}
+
+static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
+	.attach	= meson_encoder_dsi_attach,
+	/*
+	 * TOFIX: remove when dw-mipi-dsi moves out of mode_set
+	 * We should get rid of mode_set, but until dw-mipi-dsi uses it
+	 * we need to setup the pixel clock before the following
+	 * bridge tries to setup the HW.
+	 */
+	.mode_set = meson_encoder_dsi_mode_set,
+	.atomic_enable = meson_encoder_dsi_atomic_enable,
+	.atomic_disable	= meson_encoder_dsi_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
+int meson_encoder_dsi_init(struct meson_drm *priv)
+{
+	struct meson_encoder_dsi *meson_encoder_dsi;
+	struct device_node *remote;
+	int ret;
+
+	meson_encoder_dsi = devm_kzalloc(priv->dev, sizeof(*meson_encoder_dsi), GFP_KERNEL);
+	if (!meson_encoder_dsi)
+		return -ENOMEM;
+
+	/* DSI Transceiver Bridge */
+	remote = of_graph_get_remote_node(priv->dev->of_node, 2, 0);
+	if (!remote) {
+		dev_err(priv->dev, "DSI transceiver device is disabled");
+		return 0;
+	}
+
+	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
+	if (!meson_encoder_dsi->next_bridge) {
+		dev_dbg(priv->dev, "Failed to find DSI transceiver bridge: %d\n", ret);
+		return -EPROBE_DEFER;
+	}
+
+	/* DSI Encoder Bridge */
+	meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
+	meson_encoder_dsi->bridge.of_node = priv->dev->of_node;
+	meson_encoder_dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+
+	drm_bridge_add(&meson_encoder_dsi->bridge);
+
+	meson_encoder_dsi->priv = priv;
+
+	/* Encoder */
+	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
+				      DRM_MODE_ENCODER_DSI);
+	if (ret) {
+		dev_err(priv->dev, "Failed to init DSI encoder: %d\n", ret);
+		return ret;
+	}
+
+	meson_encoder_dsi->encoder.possible_crtcs = BIT(0);
+
+	/* Attach DSI Encoder Bridge to Encoder */
+	ret = drm_bridge_attach(&meson_encoder_dsi->encoder, &meson_encoder_dsi->bridge, NULL, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * We should have now in place:
+	 * encoder->[dsi encoder bridge]->[dw-mipi-dsi bridge]->[panel bridge]->[panel]
+	 */
+
+	dev_dbg(priv->dev, "DSI encoder initialized\n");
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.h b/drivers/gpu/drm/meson/meson_encoder_dsi.h
new file mode 100644
index 000000000000..0f4b641eb633
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef __MESON_ENCODER_DSI_H
+#define __MESON_ENCODER_DSI_H
+
+int meson_encoder_dsi_init(struct meson_drm *priv);
+
+#endif /* __MESON_ENCODER_DSI_H */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
