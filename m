Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9700CA9EB5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A9520659
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="leMrSngY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nz7/d+cT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9A9520659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2ywDva1blmx9HShvBSMis0REb+0KVEO49bxzRGRxqE=; b=leMrSngY5yEAfx
	9ZbkJZopizNBtCHYvEEBIMdX5hFk/kYnlfewtGXG/iz4RX1nx1HYtuNX4RZ+qVHu4ChPZvKwel5l4
	gZTGdw3oCKw5a40GDR0eWpZ4v/TjJsHFynoLyudeIoJUqH2XeywZggUaMCg8NWKmYJpXvCNnUejHl
	31rMYTRt/YEHHN7CTSSPNJ7+7es9VdykcLf02fN1LoiGXjHXtOZNb5twQeEgciCSR5b9z8BWl961I
	qGPb3k6cOw6njNmiiuvJmOS6WcS6CUCvnWLv1cTKYv7xz6uxRi2rtJXJzrQj1RoeBgoqJx4CnDnI6
	ED9aKGGuqff2Z/0V+scg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMTos-0004Lz-Lj; Mon, 21 Oct 2019 09:17:42 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMTmW-0002h0-DT
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 09:15:23 +0000
Received: by mail-wm1-x341.google.com with SMTP id 3so11947064wmi.3
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkNYdr+YWaZ68tiJqlH0k2FfWy1xrNFUf+SNb2DV6/8=;
 b=nz7/d+cThNZTlPHLNwncdfWND4q1gHqmKBRATcMcN4PcDQe9B8Aw66zdm2b0NTTxy4
 S8f0MLaIszmktg5Vv2lFuv9K/D7xYZ17UCxSvqLEpT5AFezChYMUo51nRtWb4gT4bbHc
 2Qybn0x13tNzPHYaI6JH/bAOt3DUQtGTKKBAgZ65tdyfO5/J4LGlxiZxwOfaV11jqS2X
 an3LHXmZ4N2cP2llfbHDu5d1lSe2ZmVdNgxAItp5HAQ3671GYY4Zsa5jypNSmVIoE5U5
 WyRiH5p2IB0lA0j4FUioEIS7PFmg/Hv04+YP3quG/uQg5WN7xe96RouWM1J7bsmfMQU4
 mPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dkNYdr+YWaZ68tiJqlH0k2FfWy1xrNFUf+SNb2DV6/8=;
 b=TbjososHRUbhsCAq96brvMcFdP3R51jrcD4CCmzkG+sFyht8NDg+yhet/78t8CtW4h
 AljkNFYNpXAoYrBLiW0DJGoaiqC2RBPyeq7TT8s16Hl+Z+P++4ZgQ70rN2a5CtFnwdZG
 hOl8Q01LUztyjs/gUyK4JNL7qh9wI9dSdbwbYmtZnfvsVNXdanHvnas8mVUf6XbpM++n
 qeH/xfAoNjZiSFCEJRh7RXCoBhWGRPHbHyfiFnm45Si21z1OpJ6ScG0xdNaySeSAAJP2
 Ea0rCMIx2lrBaBfTiz7YOJytuHKc6n//NOandbqsezUjjaP3rHFrrIH2YkoJo90y+bWS
 CAdw==
X-Gm-Message-State: APjAAAW+sHNZbxyv4WbJcTLHnYEG9ZT8fTVv+JbhfjO21/Ujb1x0QAy9
 1siTOXDCk/csARKHoRYBYjLG6g==
X-Google-Smtp-Source: APXvYqz3Ot+RP0k/4dkoxQcdssTlej3T7nN/cio6RzUHZvo9xeojf/kyChyNEDRoR4+LvkHX7SRCDg==
X-Received: by 2002:a7b:caea:: with SMTP id t10mr19183378wml.38.1571649314875; 
 Mon, 21 Oct 2019 02:15:14 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t13sm20281595wra.70.2019.10.21.02.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 02:15:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/9] drm/meson: add RDMA module driver
Date: Mon, 21 Oct 2019 11:15:04 +0200
Message-Id: <20191021091509.3864-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021091509.3864-1-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_021516_508714_6193F585 
X-CRM114-Status: GOOD (  17.95  )
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
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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
be masked for a log period of time, producing display glitches.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/Makefile     |   1 +
 drivers/gpu/drm/meson/meson_drv.h  |   6 ++
 drivers/gpu/drm/meson/meson_rdma.c | 135 +++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_rdma.h |  21 +++++
 4 files changed, 163 insertions(+)
 create mode 100644 drivers/gpu/drm/meson/meson_rdma.c
 create mode 100644 drivers/gpu/drm/meson/meson_rdma.h

diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
index c389e2399133..fb7f5440fe57 100644
--- a/drivers/gpu/drm/meson/Makefile
+++ b/drivers/gpu/drm/meson/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_venc_cvbs.o
 meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
+meson-drm-y += meson_rdma.o
 
 obj-$(CONFIG_DRM_MESON) += meson-drm.o
 obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 3287282450a9..ea39be913c0f 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -123,6 +123,12 @@ struct meson_drm {
 		bool venc_repeat;
 		bool hdmi_use_enci;
 	} venc;
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
index 000000000000..25b34b1e72a7
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_rdma.c
@@ -0,0 +1,135 @@
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
+#define RDMA_DESC_SIZE	(sizeof(uint32_t) * 2)
+
+int meson_rdma_init(struct meson_drm *priv)
+{
+	if (!priv->rdma.addr) {
+		/* Allocate a PAGE buffer */
+		priv->rdma.addr =
+			dma_alloc_coherent(priv->dev, SZ_4K,
+					   &priv->rdma.addr_phys,
+					   GFP_KERNEL);
+		if (!priv->rdma.addr)
+			return -ENOMEM;
+	}
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
+void meson_rdma_reset(struct meson_drm *priv)
+{
+	meson_rdma_stop(priv);
+
+	priv->rdma.offset = 0;
+}
+
+static void meson_rdma_writel(struct meson_drm *priv, uint32_t val,
+			      uint32_t reg)
+{
+	if (priv->rdma.offset >= (SZ_4K / RDMA_DESC_SIZE)) {
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
+	writel(priv->rdma.addr_phys + (priv->rdma.offset * RDMA_DESC_SIZE) - 1,
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
index 000000000000..3870bff7b47f
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_rdma.h
@@ -0,0 +1,21 @@
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
+void meson_rdma_reset(struct meson_drm *priv);
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
