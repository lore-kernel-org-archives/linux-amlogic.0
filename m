Return-Path: <SRS0=EyFj=YI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E97FECE588
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 11:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62E4B21848
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 11:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HjZ63RbM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sTOUlTSq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62E4B21848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lMQtD9CwbeS56lepv0sNLKVE/3SOvFx95jFYNiNOvI=; b=HjZ63RbM11ZCqY
	AxJR8lGrF7Pv/j3GfG/Kxiky2hp5weIML43hWz/LV+/NdgGZq5CCmeRfKyTfCrMECSI36UeyMck0b
	Pw2arZGD3rKtfASJld7bVlMxhX6eXGOA1orArPjMwd7rtAO5Di9sDaFAYcJdTDQlLVLjxsZ38bLur
	XhLzOaUbcXUEkB3/bfXMQYBQtsLtd3+PzelxqQz073CcVYCYWBJp2RcyKGkIJ3wAQ5IIMe9ge7T2E
	AN6a7a2GzTTWf9B+GIsDAtK5NMphTPNvLa3evv71RTf++55TBWhevee+cmlfoYNL2n6yowex+eBTq
	PyCW6W4eSlKT6qT8jcnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKL5a-0004LH-B3; Tue, 15 Oct 2019 11:34:06 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKL4s-0003de-Me
 for linux-amlogic@lists.infradead.org; Tue, 15 Oct 2019 11:33:24 +0000
Received: by mail-wr1-x442.google.com with SMTP id y19so23434360wrd.3
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Oct 2019 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XD8DbPS/ne8UaQDhNONqYd7ghmzPvUyX1U8dT7qrutE=;
 b=sTOUlTSqbfOR8WzwLDXV6yG6Z9aZKsrcpdiNzhvasyfpICO2KPmjYjQnkWJomOYXzq
 7dqF8grMJWWWcJrG/5DxoUy0RBqLVuzfaXcS1BQOIiWiKJjiCg0/rchM5UENSbKvn52K
 AVnz3oInfGvkKF9AKiy8Qn62DNx2SalFP6Cb+WDHqYVJU3AibtkJdlgXdpn/AshicxLG
 dygpvlVEXSReT/2G2u+gQvzBRMbGq2t2LD0vtHCTz5R6HNU3zuGNV7GO2M7MtzPU0pL5
 UOL7GghYHRrt/JxjWWy4xTsuRmWWbaWByAFX/m1HnzAZID2aeYKCPdDh++kyFNrijqmD
 7x3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XD8DbPS/ne8UaQDhNONqYd7ghmzPvUyX1U8dT7qrutE=;
 b=Wk0Wz3BWD6gonPLKcrF2ggjLO62ZFUByP+vZGwrEgdr0OtDYWxrz+vezjcsbxP9wk+
 l4WU1fbpDlWt46tcMt1yH/sMmSxF9JxJksCXSy1vKFWyn/bihEeBCgaW/XwxMNxcbY9p
 7Cw0XfIwrj+hNpHOnlmnxQ1TcqOBvB5J/oNwJXKAVxCQZL8ico7019e3HM8Ocygb0OzT
 o4FE+DFHVRFyKGifwaYXU9D3CPEHsanWyN3gNtJgn+DBOsocRB5QnJgeyLB+zP3sCjrc
 TipxFKmXrFumYGuHm9IDjmqfiw3xks91JGVVg9tcheXWNoP2dEjDTWkDQAQc23RR09gk
 jjbA==
X-Gm-Message-State: APjAAAUfQsqseZMiD3YiNrLY00oNvEHvYfuTiUcW5y910eszFrH1ifjx
 4y76sdEinpaE7Ldz2oscbumCsA==
X-Google-Smtp-Source: APXvYqz3/ywYvl/yxSTgmzwEzMwNVIMbEibD2CeaLA2BdzUCSeyNo38qIG9VG3Gn1s8EEwD5aZnjkQ==
X-Received: by 2002:adf:cc8e:: with SMTP id p14mr32243806wrj.301.1571139200760; 
 Tue, 15 Oct 2019 04:33:20 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 63sm32395096wri.25.2019.10.15.04.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 04:33:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/meson: add RDMA module driver
Date: Tue, 15 Oct 2019 13:33:16 +0200
Message-Id: <20191015113317.8870-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191015113317.8870-1-narmstrong@baylibre.com>
References: <20191015113317.8870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_043322_756085_52A1EA2F 
X-CRM114-Status: GOOD (  21.67  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The VPU embeds a "Register DMA" that can write a sequence of registers
on the VPU AHB bus, either manually or triggered by an internal IRQ
event like VSYNC or a line input counter.

The initial implementation handles a single channel (over 8), triggered
by the VSYNC irq and does not handle the RDMA irq.

The RDMA will be usefull to reset and program the AFBC decoder unit
on each vsync without involving the interrupt handler that can
be masked for a long period of time, producing display glitches.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/Makefile     |   2 +-
 drivers/gpu/drm/meson/meson_drv.c  |  14 +++-
 drivers/gpu/drm/meson/meson_drv.h  |   6 ++
 drivers/gpu/drm/meson/meson_rdma.c | 123 +++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_rdma.h |  20 +++++
 5 files changed, 161 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_rdma.c
 create mode 100644 drivers/gpu/drm/meson/meson_rdma.h

diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
index b1fa055aaed3..9e36f0c7b816 100644
--- a/drivers/gpu/drm/meson/Makefile
+++ b/drivers/gpu/drm/meson/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_venc_cvbs.o
 meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
-meson-drm-y += meson_osd_afbcd.o
+meson-drm-y += meson_osd_afbcd.o meson_rdma.o
 
 obj-$(CONFIG_DRM_MESON) += meson-drm.o
 obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 0f31e70bb94f..2200d8b5252e 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -33,6 +33,7 @@
 #include "meson_venc_cvbs.h"
 #include "meson_viu.h"
 #include "meson_vpp.h"
+#include "meson_rdma.h"
 
 #define DRIVER_NAME "meson"
 #define DRIVER_DESC "Amlogic Meson DRM driver"
@@ -295,8 +296,11 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	meson_venc_init(priv);
 	meson_vpp_init(priv);
 	meson_viu_init(priv);
-	if (priv->afbcd.ops)
-		priv->afbcd.ops->init(priv);
+	if (priv->afbcd.ops) {
+		ret = priv->afbcd.ops->init(priv);
+		if (ret)
+			return ret;
+	}
 
 	/* Encoder Initialization */
 
@@ -367,12 +371,16 @@ static void meson_drv_unbind(struct device *dev)
 		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_2);
 	}
 
+	if (priv->afbcd.ops) {
+		priv->afbcd.ops->reset(priv);
+		meson_rdma_free(priv);
+	}
+
 	drm_dev_unregister(drm);
 	drm_irq_uninstall(drm);
 	drm_kms_helper_poll_fini(drm);
 	drm_mode_config_cleanup(drm);
 	drm_dev_put(drm);
-
 }
 
 static const struct component_master_ops meson_drv_master_ops = {
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index de25349be8aa..9995d74c5ded 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -139,6 +139,12 @@ struct meson_drm {
 		u64 modifier;
 		u32 format;
 	} afbcd;
+
+	struct {
+		dma_addr_t addr_phys;
+		uint32_t *addr;
+		unsigned int offset;
+	} rdma;
 };
 
 static inline int meson_vpu_is_compatible(struct meson_drm *priv,
diff --git a/drivers/gpu/drm/meson/meson_rdma.c b/drivers/gpu/drm/meson/meson_rdma.c
new file mode 100644
index 000000000000..13fd9b173439
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_rdma.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/dma-mapping.h>
+
+#include "meson_drv.h"
+#include "meson_registers.h"
+#include "meson_rdma.h"
+
+/*
+ * The VPU embeds a "Register DMA" that can write a sequence of registers
+ * on the VPU AHB bus, either manually or triggered by an internal IRQ
+ * event like VSYNC or a line input counter.
+ * The initial implementation handles a single channel (over 8), triggered
+ * by the VSYNC irq and does not handle the RDMA irq.
+ */
+
+int meson_rdma_init(struct meson_drm *priv)
+{
+	/* Allocate a PAGE buffer */
+	priv->rdma.addr = dma_alloc_coherent(priv->dev, SZ_4K,
+					     &priv->rdma.addr_phys,
+					     GFP_KERNEL);
+	if (!priv->rdma.addr)
+		return -ENOMEM;
+
+	priv->rdma.offset = 0;
+
+	writel_relaxed(RDMA_CTRL_SW_RESET,
+		       priv->io_base + _REG(RDMA_CTRL));
+	writel_relaxed(RDMA_DEFAULT_CONFIG |
+		       FIELD_PREP(RDMA_CTRL_AHB_WR_BURST, 3) |
+		       FIELD_PREP(RDMA_CTRL_AHB_RD_BURST, 0),
+		       priv->io_base + _REG(RDMA_CTRL));
+
+	return 0;
+}
+
+void meson_rdma_free(struct meson_drm *priv)
+{
+	if (!priv->rdma.addr && !priv->rdma.addr_phys)
+		return;
+
+	meson_rdma_stop(priv);
+
+	dma_free_coherent(priv->dev, SZ_4K,
+			  priv->rdma.addr, priv->rdma.addr_phys);
+
+	priv->rdma.addr = NULL;
+	priv->rdma.addr_phys = (dma_addr_t)NULL;
+}
+
+void meson_rdma_setup(struct meson_drm *priv)
+{
+	/* Channel 1: Write Flag, No Address Increment */
+	writel_bits_relaxed(RDMA_ACCESS_RW_FLAG_CHAN1 |
+			    RDMA_ACCESS_ADDR_INC_CHAN1,
+			    RDMA_ACCESS_RW_FLAG_CHAN1,
+			    priv->io_base + _REG(RDMA_ACCESS_AUTO));
+}
+
+void meson_rdma_stop(struct meson_drm *priv)
+{
+	writel_bits_relaxed(RDMA_IRQ_CLEAR_CHAN1,
+			    RDMA_IRQ_CLEAR_CHAN1,
+			    priv->io_base + _REG(RDMA_CTRL));
+
+	/* Stop Channel 1 */
+	writel_bits_relaxed(RDMA_ACCESS_TRIGGER_CHAN1,
+			    FIELD_PREP(RDMA_ACCESS_ADDR_INC_CHAN1,
+				       RDMA_ACCESS_TRIGGER_STOP),
+			    priv->io_base + _REG(RDMA_ACCESS_AUTO));
+}
+
+static void meson_rdma_writel(struct meson_drm *priv, uint32_t val,
+			      uint32_t reg)
+{
+	if (priv->rdma.offset == SZ_4K) {
+		dev_warn_once(priv->dev, "%s: overflow\n", __func__);
+		return;
+	}
+
+	priv->rdma.addr[priv->rdma.offset++] = reg;
+	priv->rdma.addr[priv->rdma.offset++] = val;
+}
+
+/*
+ * This will add the register to the RDMA buffer and write it to the
+ * hardware at the same time.
+ * When meson_rdma_flush is called, the RDMA will replay the register
+ * writes in order.
+ */
+void meson_rdma_writel_sync(struct meson_drm *priv, uint32_t val, uint32_t reg)
+{
+	meson_rdma_writel(priv, val, reg);
+
+	writel_relaxed(val, priv->io_base + _REG(reg));
+}
+
+void meson_rdma_flush(struct meson_drm *priv)
+{
+	meson_rdma_stop(priv);
+
+	/* Start of Channel 1 register writes buffer */
+	writel(priv->rdma.addr_phys,
+	       priv->io_base + _REG(RDMA_AHB_START_ADDR_1));
+
+	/* Last byte on Channel 1 register writes buffer */
+	writel(priv->rdma.addr_phys + (priv->rdma.offset * 8) - 1,
+	       priv->io_base + _REG(RDMA_AHB_END_ADDR_1));
+
+	/* Trigger Channel 1 on VSYNC event */
+	writel_bits_relaxed(RDMA_ACCESS_TRIGGER_CHAN1,
+			    FIELD_PREP(RDMA_ACCESS_TRIGGER_CHAN1,
+				       RDMA_ACCESS_TRIGGER_VSYNC),
+			    priv->io_base + _REG(RDMA_ACCESS_AUTO));
+
+	priv->rdma.offset = 0;
+}
diff --git a/drivers/gpu/drm/meson/meson_rdma.h b/drivers/gpu/drm/meson/meson_rdma.h
new file mode 100644
index 000000000000..84c882f97d28
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_rdma.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef __MESON_RDMA_H
+#define __MESON_RDMA_H
+
+#include "meson_drv.h"
+
+int meson_rdma_init(struct meson_drm *priv);
+void meson_rdma_free(struct meson_drm *priv);
+void meson_rdma_setup(struct meson_drm *priv);
+void meson_rdma_stop(struct meson_drm *priv);
+
+void meson_rdma_writel_sync(struct meson_drm *priv, uint32_t val, uint32_t reg);
+void meson_rdma_flush(struct meson_drm *priv);
+
+#endif /* __MESON_RDMA_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
