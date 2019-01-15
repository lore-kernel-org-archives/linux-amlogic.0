Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URG_BIZ,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B17C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1767E20657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wk5jPmdj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SSIRxXjw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1767E20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjBltsxyacfLXC5+FLONXGT1QWpZZzKI4nLKjaWmSU0=; b=Wk5jPmdj/S+ENt
	GrvbXwFSy8IafySgMqCstm1MP+lbhR2xdCyUXwZqnt0LNr2ze2vsvd3NAn3MIDskz2qOGaXhh8LvN
	pNb9HmqZl8azMwwyUMdiyiviU2NRW44mTON/0gneHi6wkkIFIUayJJIf1jiwdUjOYBzIbhYe2DaXR
	ahbdXKQQub/7G9l0tykEL3N6/KyEoOzT80EB1B3TLIjrHqvbVO6Qg0jl5JmqFzeR7AWcQwosiAH0p
	HMkD4hs+o4bcBt5+dZN1WH+EtC45X/atYEMF3/d0NygU86am/lNg4eYovk8ZggmIUTuxlkbHsqkv7
	jNpGucLXnmU1o1P9S1pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRQI-0007bF-9W; Tue, 15 Jan 2019 16:18:42 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPn-00074Q-Fg
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id 96so3648967wrb.2
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JCZ+LSvGYE/nQGsV0EkXe3/G4b9YVsFOQj3DByuoDzw=;
 b=SSIRxXjwjX2FgRyhKllRtZrlWKdXVGuDeb96xDPRCe0NAwAA1LYyhZlMZIfYBL92xs
 axN8o+Eih8C3cQTY3EjgCpJ4KNG14n5of1hz/6zPcpzIMVGPeV7GJR1S1r8fCrW/NCIf
 5gWnJi2/FSjcDvRTru3yPF0Jsmuq39C4ITC8UC1g6rKbar8bQPmQCGWDv33JtCVXk2Tk
 f66tUrv4cyTf4zNxe0kcdgbGOLNKp1RVsHeqsUEcwUUHMQ1j6IKiYl22XlJcVHxeLi1a
 RsGA93DH5ud5lexsZ2POIrgPvU6qGV/Uhh2ApGFd77xT83EeWuncZbmaRpVDl2GM/0Cg
 7flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JCZ+LSvGYE/nQGsV0EkXe3/G4b9YVsFOQj3DByuoDzw=;
 b=MUaMtUVkPaMbYXCf9Qlwe9vrUwlmtsO94rDIX9ZRbrLkj+RYfPefhE1FFoQl+/EFoU
 nu+Fr81fZPWi+SmnxByTnoIhhqhw5/chRYAfiV601VH5jRyxgbxpMTlhQQw6G14EoXJT
 c16DihkM2TN5eDEeWsiIZ2K8K/BaMYr7bsUWJJCcfh795T43/OMV2cUt4vtFJlFRl6oF
 Aiar1t8TdCWzjtlGU9VtkcDPsQHXUsYNmxpzPZ7u1Kz/Au1KNsTjKfB2B2Z5Ax4l0VCQ
 +RZ5lq2EKTBHSDA5Ioy36krI6+q0fvYG8zc7Iv4K7XEPLgrH4pODSXrmo5BFqVxXCqh7
 rrPA==
X-Gm-Message-State: AJcUukcsWgE/iikWVO2OJgL7XbTrbbqQbxRZGCOjg2eLWR9RT+7w3IJB
 f6hmrnp90rwbsQSpKL1eP5a+Cw==
X-Google-Smtp-Source: ALg8bN60/Sd5Tf5amJkM4I147tgbTqUlZkL19zbVno9ViHn8CMKMCX0Ci5hrrgM5APZZdrYFuh0iQQ==
X-Received: by 2002:adf:f691:: with SMTP id v17mr3678519wrp.114.1547569088307; 
 Tue, 15 Jan 2019 08:18:08 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:07 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 04/11] video: Add Meson Video Processing Unit Driver
Date: Tue, 15 Jan 2019 17:17:52 +0100
Message-Id: <20190115161759.1657-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: mjourdan@baylibre.com, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, Jorge Ramire-Ortiz <jramirez@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds video output support for Amlogic GXBB/GXL/GXM chips.
The supported ports are CVBS and HDMI (based on DW_HDMI).

When using HDMI, only DMT modes are supported.

There is support for simple-framebuffer (CONFIG_VIDEO_DT_SIMPLEFB)

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jorge Ramire-Ortiz <jramirez@baylibre.com>
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 arch/arm/include/asm/arch-meson/meson-vpu.h |   13 +
 drivers/video/Kconfig                       |    2 +
 drivers/video/Makefile                      |    1 +
 drivers/video/meson/Kconfig                 |   12 +
 drivers/video/meson/Makefile                |    9 +
 drivers/video/meson/meson_canvas.c          |   45 +
 drivers/video/meson/meson_dw_hdmi.c         |  445 ++++++
 drivers/video/meson/meson_dw_hdmi.h         |  134 ++
 drivers/video/meson/meson_plane.c           |  177 +++
 drivers/video/meson/meson_registers.h       | 1393 ++++++++++++++++++
 drivers/video/meson/meson_vclk.c            |  893 +++++++++++
 drivers/video/meson/meson_venc.c            | 1464 +++++++++++++++++++
 drivers/video/meson/meson_vpu.c             |  211 +++
 drivers/video/meson/meson_vpu.h             |   97 ++
 drivers/video/meson/meson_vpu_init.c        |  440 ++++++
 drivers/video/meson/simplefb_common.c       |   29 +
 drivers/video/meson/simplefb_common.h       |   21 +
 17 files changed, 5386 insertions(+)
 create mode 100644 arch/arm/include/asm/arch-meson/meson-vpu.h
 create mode 100644 drivers/video/meson/Kconfig
 create mode 100644 drivers/video/meson/Makefile
 create mode 100644 drivers/video/meson/meson_canvas.c
 create mode 100644 drivers/video/meson/meson_dw_hdmi.c
 create mode 100644 drivers/video/meson/meson_dw_hdmi.h
 create mode 100644 drivers/video/meson/meson_plane.c
 create mode 100644 drivers/video/meson/meson_registers.h
 create mode 100644 drivers/video/meson/meson_vclk.c
 create mode 100644 drivers/video/meson/meson_venc.c
 create mode 100644 drivers/video/meson/meson_vpu.c
 create mode 100644 drivers/video/meson/meson_vpu.h
 create mode 100644 drivers/video/meson/meson_vpu_init.c
 create mode 100644 drivers/video/meson/simplefb_common.c
 create mode 100644 drivers/video/meson/simplefb_common.h

diff --git a/arch/arm/include/asm/arch-meson/meson-vpu.h b/arch/arm/include/asm/arch-meson/meson-vpu.h
new file mode 100644
index 0000000000..f31dfa6ad8
--- /dev/null
+++ b/arch/arm/include/asm/arch-meson/meson-vpu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Maxime Jourdan <mjourdan@baylibre.com>
+ */
+
+#ifndef __MESON_VPU_H__
+#define __MESON_VPU_H__
+
+/* Allow reserving the framebuffer memory region */
+void meson_vpu_rsv_fb(void *fdt);
+
+#endif /* __MESON_VPU_H__ */
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 25c94f4a9e..2eac4b6381 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -401,6 +401,8 @@ config VIDEO_LCD_SPI_MISO
 	option takes a string in the format understood by 'name_to_gpio'
 	function, e.g. PH1 for pin 1 of port H.
 
+source "drivers/video/meson/Kconfig"
+
 config VIDEO_MVEBU
 	bool "Armada XP LCD controller"
 	default n
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index 80e1e82903..671f037c35 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_VIDEO_LCD_ANX9804) += anx9804.o
 obj-$(CONFIG_VIDEO_LCD_HITACHI_TX18D42VM) += hitachi_tx18d42vm_lcd.o
 obj-$(CONFIG_VIDEO_LCD_SSD2828) += ssd2828.o
 obj-$(CONFIG_VIDEO_MB862xx) += mb862xx.o videomodes.o
+obj-${CONFIG_VIDEO_MESON} += meson/
 obj-$(CONFIG_VIDEO_MVEBU) += mvebu_lcd.o
 obj-$(CONFIG_VIDEO_MX3) += mx3fb.o videomodes.o
 obj-$(CONFIG_VIDEO_MXS) += mxsfb.o videomodes.o
diff --git a/drivers/video/meson/Kconfig b/drivers/video/meson/Kconfig
new file mode 100644
index 0000000000..0c9ddeb8b6
--- /dev/null
+++ b/drivers/video/meson/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2018 BayLibre, SAS
+#
+# Author: Neil Armstrong <narmstrong@baylibre.com>
+
+config VIDEO_MESON
+	bool "Enable Amlogic Meson video support"
+	depends on DM_VIDEO
+	select DISPLAY
+	help
+	  Enable Amlogic Meson Video Processing Unit video support.
diff --git a/drivers/video/meson/Makefile b/drivers/video/meson/Makefile
new file mode 100644
index 0000000000..1e929b343e
--- /dev/null
+++ b/drivers/video/meson/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2018 BayLibre, SAS
+#
+# Author: Neil Armstrong <narmstrong@baylibre.com>
+
+obj-$(CONFIG_VIDEO_MESON) = meson_vpu.o meson_vpu_init.o meson_canvas.o
+obj-$(CONFIG_VIDEO_MESON) += meson_plane.o meson_venc.o meson_vclk.o
+obj-$(CONFIG_VIDEO_MESON) += meson_dw_hdmi.o simplefb_common.o ../dw_hdmi.o
diff --git a/drivers/video/meson/meson_canvas.c b/drivers/video/meson/meson_canvas.c
new file mode 100644
index 0000000000..49aa74283c
--- /dev/null
+++ b/drivers/video/meson/meson_canvas.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic Meson Video Processing Unit driver
+ *
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson_vpu.h"
+
+/* DMC Registers */
+#define DMC_CAV_LUT_DATAL	0x48 /* 0x12 offset in data sheet */
+#define CANVAS_WIDTH_LBIT	29
+#define CANVAS_WIDTH_LWID       3
+#define DMC_CAV_LUT_DATAH	0x4c /* 0x13 offset in data sheet */
+#define CANVAS_WIDTH_HBIT       0
+#define CANVAS_HEIGHT_BIT       9
+#define CANVAS_BLKMODE_BIT      24
+#define DMC_CAV_LUT_ADDR	0x50 /* 0x14 offset in data sheet */
+#define CANVAS_LUT_WR_EN        (0x2 << 8)
+#define CANVAS_LUT_RD_EN        (0x1 << 8)
+
+void meson_canvas_setup(struct meson_vpu_priv *priv,
+			u32 canvas_index, u32 addr,
+			u32 stride, u32 height,
+			unsigned int wrap,
+			unsigned int blkmode)
+{
+	dmc_write(DMC_CAV_LUT_DATAL,
+		  (((addr + 7) >> 3)) |
+		  (((stride + 7) >> 3) << CANVAS_WIDTH_LBIT));
+
+	dmc_write(DMC_CAV_LUT_DATAH,
+		  ((((stride + 7) >> 3) >> CANVAS_WIDTH_LWID) <<
+						CANVAS_WIDTH_HBIT) |
+		  (height << CANVAS_HEIGHT_BIT) |
+		  (wrap << 22) |
+		  (blkmode << CANVAS_BLKMODE_BIT));
+
+	dmc_write(DMC_CAV_LUT_ADDR,
+		  CANVAS_LUT_WR_EN | canvas_index);
+
+	/* Force a read-back to make sure everything is flushed. */
+	dmc_read(DMC_CAV_LUT_DATAH);
+}
diff --git a/drivers/video/meson/meson_dw_hdmi.c b/drivers/video/meson/meson_dw_hdmi.c
new file mode 100644
index 0000000000..7a1c060856
--- /dev/null
+++ b/drivers/video/meson/meson_dw_hdmi.c
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 BayLibre, SAS
+ * Author: Jorge Ramirez-Ortiz <jramirez@baylibre.com>
+ */
+
+#include <common.h>
+#include <display.h>
+#include <dm.h>
+#include <edid.h>
+#include <asm/io.h>
+#include <dw_hdmi.h>
+#include <dm/device-internal.h>
+#include <dm/uclass-internal.h>
+#include <power/regulator.h>
+#include <clk.h>
+#include <linux/delay.h>
+#include <reset.h>
+#include <media_bus_format.h>
+#include "meson_dw_hdmi.h"
+#include "meson_vpu.h"
+
+/* TOP Block Communication Channel */
+#define HDMITX_TOP_ADDR_REG	0x0
+#define HDMITX_TOP_DATA_REG	0x4
+#define HDMITX_TOP_CTRL_REG	0x8
+
+/* Controller Communication Channel */
+#define HDMITX_DWC_ADDR_REG	0x10
+#define HDMITX_DWC_DATA_REG	0x14
+#define HDMITX_DWC_CTRL_REG	0x18
+
+/* HHI Registers */
+#define HHI_MEM_PD_REG0		0x100 /* 0x40 */
+#define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
+#define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
+#define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
+#define HHI_HDMI_PHY_CNTL2	0x3a8 /* 0xea */
+#define HHI_HDMI_PHY_CNTL3	0x3ac /* 0xeb */
+
+struct meson_dw_hdmi {
+	struct udevice *dev;
+	struct dw_hdmi hdmi;
+	void __iomem *hhi_base;
+};
+
+enum hdmi_compatible {
+	HDMI_COMPATIBLE_GXBB = 0,
+	HDMI_COMPATIBLE_GXL = 1,
+	HDMI_COMPATIBLE_GXM = 2,
+};
+
+static inline bool meson_hdmi_is_compatible(struct meson_dw_hdmi *priv,
+					    enum hdmi_compatible family)
+{
+	enum hdmi_compatible compat = dev_get_driver_data(priv->dev);
+
+	return compat == family;
+}
+
+static unsigned int dw_hdmi_top_read(struct dw_hdmi *hdmi, unsigned int addr)
+{
+	unsigned int data;
+
+	/* ADDR must be written twice */
+	writel(addr & 0xffff, hdmi->ioaddr + HDMITX_TOP_ADDR_REG);
+	writel(addr & 0xffff, hdmi->ioaddr + HDMITX_TOP_ADDR_REG);
+
+	/* Read needs a second DATA read */
+	data = readl(hdmi->ioaddr + HDMITX_TOP_DATA_REG);
+	data = readl(hdmi->ioaddr + HDMITX_TOP_DATA_REG);
+
+	return data;
+}
+
+static inline void dw_hdmi_top_write(struct dw_hdmi *hdmi,
+				     unsigned int addr, unsigned int data)
+{
+	/* ADDR must be written twice */
+	writel(addr & 0xffff, hdmi->ioaddr + HDMITX_TOP_ADDR_REG);
+	writel(addr & 0xffff, hdmi->ioaddr + HDMITX_TOP_ADDR_REG);
+
+	/* Write needs single DATA write */
+	writel(data, hdmi->ioaddr + HDMITX_TOP_DATA_REG);
+}
+
+static inline void dw_hdmi_top_write_bits(struct dw_hdmi *hdmi,
+					  unsigned int addr,
+					  unsigned int mask,
+					  unsigned int val)
+{
+	unsigned int data = dw_hdmi_top_read(hdmi, addr);
+
+	data &= ~mask;
+	data |= val;
+	dw_hdmi_top_write(hdmi, addr, data);
+}
+
+static u8 dw_hdmi_dwc_read(struct dw_hdmi *hdmi, int addr)
+{
+	unsigned int data;
+
+	/* ADDR must be written twice */
+	writel(addr & 0xffff, hdmi->ioaddr + HDMITX_DWC_ADDR_REG);
+	writel(addr & 0xffff, hdmi->ioaddr + HDMITX_DWC_ADDR_REG);
+
+	/* Read needs a second DATA read */
+	data = readl(hdmi->ioaddr + HDMITX_DWC_DATA_REG);
+	data = readl(hdmi->ioaddr + HDMITX_DWC_DATA_REG);
+
+	return data;
+}
+
+static inline void dw_hdmi_dwc_write(struct dw_hdmi *hdmi, u8 data, int addr)
+{
+	/* ADDR must be written twice */
+	writel(addr & 0xffff, hdmi->ioaddr + HDMITX_DWC_ADDR_REG);
+	writel(addr & 0xffff, hdmi->ioaddr + HDMITX_DWC_ADDR_REG);
+
+	/* Write needs single DATA write */
+	writel(data, hdmi->ioaddr + HDMITX_DWC_DATA_REG);
+}
+
+static inline void dw_hdmi_dwc_write_bits(struct dw_hdmi *hdmi,
+					  unsigned int addr,
+					  unsigned int mask,
+					  unsigned int val)
+{
+	u8 data = dw_hdmi_dwc_read(hdmi, addr);
+
+	data &= ~mask;
+	data |= val;
+
+	dw_hdmi_dwc_write(hdmi, data, addr);
+}
+
+static inline void dw_hdmi_hhi_write(struct meson_dw_hdmi *priv,
+				     unsigned int addr, unsigned int data)
+{
+	hhi_write(addr, data);
+}
+
+__attribute__((unused))
+static unsigned int dw_hdmi_hhi_read(struct meson_dw_hdmi *priv,
+				     unsigned int addr)
+{
+	return hhi_read(addr);
+}
+
+static inline void dw_hdmi_hhi_update_bits(struct meson_dw_hdmi *priv,
+					   unsigned int addr,
+					   unsigned int mask,
+					   unsigned int val)
+{
+	hhi_update_bits(addr, mask, val);
+}
+
+static int meson_dw_hdmi_read_edid(struct udevice *dev, u8 *buf, int buf_size)
+{
+#if defined DEBUG
+	struct display_timing timing;
+	int panel_bits_per_colour;
+#endif
+	struct meson_dw_hdmi *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = dw_hdmi_read_edid(&priv->hdmi, buf, buf_size);
+
+#if defined DEBUG
+	if (!ret)
+		return ret;
+
+	edid_print_info((struct edid1_info *)buf);
+	edid_get_timing(buf, ret, &timing, &panel_bits_per_colour);
+	debug("Display timing:\n");
+	debug(" hactive %04d, hfrontp %04d, hbackp %04d hsync %04d\n"
+	      " vactive %04d, vfrontp %04d, vbackp %04d vsync %04d\n",
+	       timing.hactive.typ, timing.hfront_porch.typ,
+	       timing.hback_porch.typ, timing.hsync_len.typ,
+	       timing.vactive.typ, timing.vfront_porch.typ,
+	       timing.vback_porch.typ, timing.vsync_len.typ);
+	debug(" flags: ");
+	if (timing.flags & DISPLAY_FLAGS_INTERLACED)
+		debug("interlaced ");
+	if (timing.flags & DISPLAY_FLAGS_DOUBLESCAN)
+		debug("doublescan ");
+	if (timing.flags & DISPLAY_FLAGS_DOUBLECLK)
+		debug("doubleclk ");
+	if (timing.flags & DISPLAY_FLAGS_HSYNC_LOW)
+		debug("hsync_low ");
+	if (timing.flags & DISPLAY_FLAGS_HSYNC_HIGH)
+		debug("hsync_high ");
+	if (timing.flags & DISPLAY_FLAGS_VSYNC_LOW)
+		debug("vsync_low ");
+	if (timing.flags & DISPLAY_FLAGS_VSYNC_HIGH)
+		debug("vsync_high ");
+	debug("\n");
+#endif
+
+	return ret;
+}
+
+static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *priv)
+{
+	/* Enable and software reset */
+	dw_hdmi_hhi_update_bits(priv, HHI_HDMI_PHY_CNTL1, 0xf, 0xf);
+
+	mdelay(2);
+
+	/* Enable and unreset */
+	dw_hdmi_hhi_update_bits(priv, HHI_HDMI_PHY_CNTL1, 0xf, 0xe);
+
+	mdelay(2);
+}
+
+static void meson_dw_hdmi_phy_setup_mode(struct meson_dw_hdmi *priv,
+					 uint pixel_clock)
+{
+	pixel_clock = pixel_clock / 1000;
+
+	if (meson_hdmi_is_compatible(priv, HDMI_COMPATIBLE_GXL) ||
+	    meson_hdmi_is_compatible(priv, HDMI_COMPATIBLE_GXM)) {
+		if (pixel_clock >= 371250) {
+			/* 5.94Gbps, 3.7125Gbps */
+			hhi_write(HHI_HDMI_PHY_CNTL0, 0x333d3282);
+			hhi_write(HHI_HDMI_PHY_CNTL3, 0x2136315b);
+		} else if (pixel_clock >= 297000) {
+			/* 2.97Gbps */
+			hhi_write(HHI_HDMI_PHY_CNTL0, 0x33303382);
+			hhi_write(HHI_HDMI_PHY_CNTL3, 0x2036315b);
+		} else if (pixel_clock >= 148500) {
+			/* 1.485Gbps */
+			hhi_write(HHI_HDMI_PHY_CNTL0, 0x33303362);
+			hhi_write(HHI_HDMI_PHY_CNTL3, 0x2016315b);
+		} else {
+			/* 742.5Mbps, and below */
+			hhi_write(HHI_HDMI_PHY_CNTL0, 0x33604142);
+			hhi_write(HHI_HDMI_PHY_CNTL3, 0x0016315b);
+		}
+	} else {
+		if (pixel_clock >= 371250) {
+			/* 5.94Gbps, 3.7125Gbps */
+			hhi_write(HHI_HDMI_PHY_CNTL0, 0x33353245);
+			hhi_write(HHI_HDMI_PHY_CNTL3, 0x2100115b);
+		} else if (pixel_clock >= 297000) {
+			/* 2.97Gbps */
+			hhi_write(HHI_HDMI_PHY_CNTL0, 0x33634283);
+			hhi_write(HHI_HDMI_PHY_CNTL3, 0xb000115b);
+		} else {
+			/* 1.485Gbps, and below */
+			hhi_write(HHI_HDMI_PHY_CNTL0, 0x33632122);
+			hhi_write(HHI_HDMI_PHY_CNTL3, 0x2000115b);
+		}
+	}
+}
+
+static int meson_dw_hdmi_phy_init(struct dw_hdmi *hdmi, uint pixel_clock)
+{
+	struct meson_dw_hdmi *priv = container_of(hdmi, struct meson_dw_hdmi,
+						  hdmi);
+	/* Enable clocks */
+	dw_hdmi_hhi_update_bits(priv, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
+
+	/* Bring HDMITX MEM output of power down */
+	dw_hdmi_hhi_update_bits(priv, HHI_MEM_PD_REG0, 0xff << 8, 0);
+
+	/* Bring out of reset */
+	dw_hdmi_top_write(hdmi, HDMITX_TOP_SW_RESET,  0);
+
+	/* Enable internal pixclk, tmds_clk, spdif_clk, i2s_clk, cecclk */
+	dw_hdmi_top_write_bits(hdmi, HDMITX_TOP_CLK_CNTL, 0x3, 0x3);
+	dw_hdmi_top_write_bits(hdmi, HDMITX_TOP_CLK_CNTL, 0x3 << 4, 0x3 << 4);
+
+	/* Enable normal output to PHY */
+	dw_hdmi_top_write(hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
+
+	/* TMDS pattern setup (TOFIX pattern for 4k2k scrambling) */
+	dw_hdmi_top_write(hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01, 0x001f001f);
+	dw_hdmi_top_write(hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23, 0x001f001f);
+
+	/* Load TMDS pattern */
+	dw_hdmi_top_write(hdmi, HDMITX_TOP_TMDS_CLK_PTTN_CNTL, 0x1);
+	mdelay(20);
+	dw_hdmi_top_write(hdmi, HDMITX_TOP_TMDS_CLK_PTTN_CNTL, 0x2);
+
+	/* Setup PHY parameters */
+	meson_dw_hdmi_phy_setup_mode(priv, pixel_clock);
+
+	/* Setup PHY */
+	dw_hdmi_hhi_update_bits(priv, HHI_HDMI_PHY_CNTL1,
+				0xffff << 16, 0x0390 << 16);
+
+	/* BIT_INVERT */
+	if (meson_hdmi_is_compatible(priv, HDMI_COMPATIBLE_GXL) ||
+	    meson_hdmi_is_compatible(priv, HDMI_COMPATIBLE_GXM))
+		dw_hdmi_hhi_update_bits(priv, HHI_HDMI_PHY_CNTL1, BIT(17), 0);
+	else
+		dw_hdmi_hhi_update_bits(priv, HHI_HDMI_PHY_CNTL1,
+					BIT(17), BIT(17));
+
+	/* Disable clock, fifo, fifo_wr */
+	dw_hdmi_hhi_update_bits(priv, HHI_HDMI_PHY_CNTL1, 0xf, 0);
+
+	mdelay(100);
+
+	/* Reset PHY 3 times in a row */
+	meson_dw_hdmi_phy_reset(priv);
+	meson_dw_hdmi_phy_reset(priv);
+	meson_dw_hdmi_phy_reset(priv);
+
+	return 0;
+}
+
+static int meson_dw_hdmi_enable(struct udevice *dev, int panel_bpp,
+				const struct display_timing *edid)
+{
+	struct meson_dw_hdmi *priv = dev_get_priv(dev);
+
+	/* will back into meson_dw_hdmi_phy_init */
+	return dw_hdmi_enable(&priv->hdmi, edid);
+}
+
+static int meson_dw_hdmi_wait_hpd(struct dw_hdmi *hdmi)
+{
+	int i;
+
+	/* Poll 1 second for HPD signal */
+	for (i = 0; i < 10; ++i) {
+		if (dw_hdmi_top_read(hdmi, HDMITX_TOP_STAT0))
+			return 0;
+
+		mdelay(100);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int meson_dw_hdmi_probe(struct udevice *dev)
+{
+	struct meson_dw_hdmi *priv = dev_get_priv(dev);
+	struct reset_ctl_bulk resets;
+	struct clk_bulk clocks;
+	struct udevice *supply;
+	int ret;
+
+	priv->dev = dev;
+
+	priv->hdmi.ioaddr = (ulong)dev_remap_addr_index(dev, 0);
+	if (!priv->hdmi.ioaddr)
+		return -EINVAL;
+
+	priv->hhi_base = dev_remap_addr_index(dev, 1);
+	if (!priv->hhi_base)
+		return -EINVAL;
+
+	priv->hdmi.hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	priv->hdmi.hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
+	priv->hdmi.phy_set = meson_dw_hdmi_phy_init;
+	priv->hdmi.write_reg = dw_hdmi_dwc_write;
+	priv->hdmi.read_reg = dw_hdmi_dwc_read;
+	priv->hdmi.i2c_clk_high = 0x67;
+	priv->hdmi.i2c_clk_low = 0x78;
+
+	ret = device_get_supply_regulator(dev, "hdmi-supply", &supply);
+	if (ret)
+		return ret;
+
+	ret = regulator_set_enable(supply, true);
+	if (ret)
+		return ret;
+
+	ret = reset_get_bulk(dev, &resets);
+	if (ret)
+		return ret;
+
+	ret = clk_get_bulk(dev, &clocks);
+	if (ret)
+		return ret;
+
+	ret = clk_enable_bulk(&clocks);
+	if (ret)
+		return ret;
+
+	/* Enable clocks */
+	dw_hdmi_hhi_update_bits(priv, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
+
+	/* Bring HDMITX MEM output of power down */
+	dw_hdmi_hhi_update_bits(priv, HHI_MEM_PD_REG0, 0xff << 8, 0);
+
+	/* Reset HDMITX APB & TX & PHY: cycle needed for EDID */
+	ret = reset_deassert_bulk(&resets);
+	if (ret)
+		return ret;
+
+	ret = reset_assert_bulk(&resets);
+	if (ret)
+		return ret;
+
+	ret = reset_deassert_bulk(&resets);
+	if (ret)
+		return ret;
+
+	/* Enable APB3 fail on error */
+	writel_bits(BIT(15), BIT(15), priv->hdmi.ioaddr + HDMITX_TOP_CTRL_REG);
+	writel_bits(BIT(15), BIT(15), priv->hdmi.ioaddr + HDMITX_DWC_CTRL_REG);
+
+	/* Bring out of reset */
+	dw_hdmi_top_write(&priv->hdmi, HDMITX_TOP_SW_RESET,  0);
+	mdelay(20);
+	dw_hdmi_top_write(&priv->hdmi, HDMITX_TOP_CLK_CNTL, 0xff);
+
+	dw_hdmi_init(&priv->hdmi);
+	dw_hdmi_phy_init(&priv->hdmi);
+
+	/* wait for connector */
+	ret = meson_dw_hdmi_wait_hpd(&priv->hdmi);
+	if (ret)
+		debug("hdmi can not get hpd signal\n");
+
+	return ret;
+}
+
+static const struct dm_display_ops meson_dw_hdmi_ops = {
+	.read_edid = meson_dw_hdmi_read_edid,
+	.enable = meson_dw_hdmi_enable,
+};
+
+static const struct udevice_id meson_dw_hdmi_ids[] = {
+	{ .compatible = "amlogic,meson-gxbb-dw-hdmi",
+		.data = HDMI_COMPATIBLE_GXBB },
+	{ .compatible = "amlogic,meson-gxl-dw-hdmi",
+		.data = HDMI_COMPATIBLE_GXL },
+	{ .compatible = "amlogic,meson-gxm-dw-hdmi",
+		.data = HDMI_COMPATIBLE_GXM },
+	{ }
+};
+
+U_BOOT_DRIVER(meson_dw_hdmi) = {
+	.name = "meson_dw_hdmi",
+	.id = UCLASS_DISPLAY,
+	.of_match = meson_dw_hdmi_ids,
+	.ops = &meson_dw_hdmi_ops,
+	.probe = meson_dw_hdmi_probe,
+	.priv_auto_alloc_size = sizeof(struct meson_dw_hdmi),
+};
diff --git a/drivers/video/meson/meson_dw_hdmi.h b/drivers/video/meson/meson_dw_hdmi.h
new file mode 100644
index 0000000000..b13beb1f75
--- /dev/null
+++ b/drivers/video/meson/meson_dw_hdmi.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __MESON_DW_HDMI_H
+#define __MESON_DW_HDMI_H
+
+/*
+ * Bit 7 RW Reserved. Default 1.
+ * Bit 6 RW Reserved. Default 1.
+ * Bit 5 RW Reserved. Default 1.
+ * Bit 4 RW sw_reset_phyif: PHY interface. 1=Apply reset; 0=Release from reset.
+ *     Default 1.
+ * Bit 3 RW sw_reset_intr: interrupt module. 1=Apply reset;
+ *     0=Release from reset.
+ *     Default 1.
+ * Bit 2 RW sw_reset_mem: KSV/REVOC mem. 1=Apply reset; 0=Release from reset.
+ *     Default 1.
+ * Bit 1 RW sw_reset_rnd: random number interface to HDCP. 1=Apply reset;
+ *     0=Release from reset. Default 1.
+ * Bit 0 RW sw_reset_core: connects to IP's ~irstz. 1=Apply reset;
+ *     0=Release from reset. Default 1.
+ */
+#define HDMITX_TOP_SW_RESET                     (0x000)
+
+/*
+ * Bit 12 RW i2s_ws_inv:1=Invert i2s_ws; 0=No invert. Default 0.
+ * Bit 11 RW i2s_clk_inv: 1=Invert i2s_clk; 0=No invert. Default 0.
+ * Bit 10 RW spdif_clk_inv: 1=Invert spdif_clk; 0=No invert. Default 0.
+ * Bit 9 RW tmds_clk_inv: 1=Invert tmds_clk; 0=No invert. Default 0.
+ * Bit 8 RW pixel_clk_inv: 1=Invert pixel_clk; 0=No invert. Default 0.
+ * Bit 4 RW cec_clk_en: 1=enable cec_clk; 0=disable. Default 0.
+ * Bit 3 RW i2s_clk_en: 1=enable i2s_clk; 0=disable. Default 0.
+ * Bit 2 RW spdif_clk_en: 1=enable spdif_clk; 0=disable. Default 0.
+ * Bit 1 RW tmds_clk_en: 1=enable tmds_clk;  0=disable. Default 0.
+ * Bit 0 RW pixel_clk_en: 1=enable pixel_clk; 0=disable. Default 0.
+ */
+#define HDMITX_TOP_CLK_CNTL                     (0x001)
+
+/*
+ * Bit 11: 0 RW hpd_valid_width: filter out width <= M*1024.    Default 0.
+ * Bit 15:12 RW hpd_glitch_width: filter out glitch <= N.       Default 0.
+ */
+#define HDMITX_TOP_HPD_FILTER                   (0x002)
+
+/*
+ * intr_maskn: MASK_N, one bit per interrupt source.
+ *     1=Enable interrupt source; 0=Disable interrupt source. Default 0.
+ * [  4] hdcp22_rndnum_err
+ * [  3] nonce_rfrsh_rise
+ * [  2] hpd_fall_intr
+ * [  1] hpd_rise_intr
+ * [  0] core_intr
+ */
+#define HDMITX_TOP_INTR_MASKN                   (0x003)
+
+/*
+ * Bit 30: 0 RW intr_stat: For each bit, write 1 to manually set the interrupt
+ *     bit, read back the interrupt status.
+ * Bit    31 R  IP interrupt status
+ * Bit     2 RW hpd_fall
+ * Bit     1 RW hpd_rise
+ * Bit     0 RW IP interrupt
+ */
+#define HDMITX_TOP_INTR_STAT                    (0x004)
+
+/*
+ * [4]	  hdcp22_rndnum_err
+ * [3]	  nonce_rfrsh_rise
+ * [2]	  hpd_fall
+ * [1]	  hpd_rise
+ * [0]	  core_intr_rise
+ */
+#define HDMITX_TOP_INTR_STAT_CLR                (0x005)
+
+#define HDMITX_TOP_INTR_CORE		BIT(0)
+#define HDMITX_TOP_INTR_HPD_RISE	BIT(1)
+#define HDMITX_TOP_INTR_HPD_FALL	BIT(2)
+
+/* Bit 14:12 RW tmds_sel: 3'b000=Output zero; 3'b001=Output normal TMDS data;
+ *     3'b010=Output PRBS data; 3'b100=Output shift pattern. Default 0.
+ * Bit 11: 9 RW shift_pttn_repeat: 0=New pattern every clk cycle; 1=New pattern
+ *     every 2 clk cycles; ...; 7=New pattern every 8 clk cycles. Default 0.
+ * Bit 8 RW shift_pttn_en: 1= Enable shift pattern generator; 0=Disable.
+ *     Default 0.
+ * Bit 4: 3 RW prbs_pttn_mode: 0=PRBS11; 1=PRBS15; 2=PRBS7; 3=PRBS31. Default 0.
+ * Bit 2: 1 RW prbs_pttn_width: 0=idle; 1=output 8-bit pattern;
+ *     2=Output 1-bit pattern; 3=output 10-bit pattern. Default 0.
+ * Bit 0 RW prbs_pttn_en: 1=Enable PRBS generator; 0=Disable. Default 0.
+ */
+#define HDMITX_TOP_BIST_CNTL                    (0x006)
+
+/* Bit 29:20 RW shift_pttn_data[59:50]. Default 0. */
+/* Bit 19:10 RW shift_pttn_data[69:60]. Default 0. */
+/* Bit  9: 0 RW shift_pttn_data[79:70]. Default 0. */
+#define HDMITX_TOP_SHIFT_PTTN_012               (0x007)
+
+/* Bit 29:20 RW shift_pttn_data[29:20]. Default 0. */
+/* Bit 19:10 RW shift_pttn_data[39:30]. Default 0. */
+/* Bit  9: 0 RW shift_pttn_data[49:40]. Default 0. */
+#define HDMITX_TOP_SHIFT_PTTN_345               (0x008)
+
+/* Bit 19:10 RW shift_pttn_data[ 9: 0]. Default 0. */
+/* Bit  9: 0 RW shift_pttn_data[19:10]. Default 0. */
+#define HDMITX_TOP_SHIFT_PTTN_67                (0x009)
+
+/* Bit 25:16 RW tmds_clk_pttn[19:10]. Default 0. */
+/* Bit  9: 0 RW tmds_clk_pttn[ 9: 0]. Default 0. */
+#define HDMITX_TOP_TMDS_CLK_PTTN_01             (0x00A)
+
+/* Bit 25:16 RW tmds_clk_pttn[39:30]. Default 0. */
+/* Bit  9: 0 RW tmds_clk_pttn[29:20]. Default 0. */
+#define HDMITX_TOP_TMDS_CLK_PTTN_23             (0x00B)
+
+/* Bit 1 RW shift_tmds_clk_pttn:1=Enable shifting clk pattern,
+ * used when TMDS CLK rate = TMDS character rate /4. Default 0.
+ * Bit 0 R  Reserved. Default 0.
+ * [	1] shift_tmds_clk_pttn
+ * [	0] load_tmds_clk_pttn
+ */
+#define HDMITX_TOP_TMDS_CLK_PTTN_CNTL           (0x00C)
+
+/* Bit 0 RW revocmem_wr_fail: Read back 1 to indicate Host write REVOC MEM
+ * failure, write 1 to clear the failure flag.  Default 0.
+ */
+#define HDMITX_TOP_REVOCMEM_STAT                (0x00D)
+
+/* Bit     0 R  filtered HPD status. */
+#define HDMITX_TOP_STAT0                        (0x00E)
+
+#endif /* __MESON_DW_HDMI_H */
diff --git a/drivers/video/meson/meson_plane.c b/drivers/video/meson/meson_plane.c
new file mode 100644
index 0000000000..63a4bf2d8d
--- /dev/null
+++ b/drivers/video/meson/meson_plane.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic Meson Video Processing Unit driver
+ *
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson_vpu.h"
+
+/* OSDx_BLKx_CFG */
+#define OSD_CANVAS_SEL		16
+
+#define OSD_ENDIANNESS_LE	BIT(15)
+#define OSD_ENDIANNESS_BE	(0)
+
+#define OSD_BLK_MODE_422	(0x03 << 8)
+#define OSD_BLK_MODE_16		(0x04 << 8)
+#define OSD_BLK_MODE_32		(0x05 << 8)
+#define OSD_BLK_MODE_24		(0x07 << 8)
+
+#define OSD_OUTPUT_COLOR_RGB	BIT(7)
+#define OSD_OUTPUT_COLOR_YUV	(0)
+
+#define OSD_COLOR_MATRIX_32_RGBA	(0x00 << 2)
+#define OSD_COLOR_MATRIX_32_ARGB	(0x01 << 2)
+#define OSD_COLOR_MATRIX_32_ABGR	(0x02 << 2)
+#define OSD_COLOR_MATRIX_32_BGRA	(0x03 << 2)
+
+#define OSD_COLOR_MATRIX_24_RGB		(0x00 << 2)
+
+#define OSD_COLOR_MATRIX_16_RGB655	(0x00 << 2)
+#define OSD_COLOR_MATRIX_16_RGB565	(0x04 << 2)
+
+#define OSD_INTERLACE_ENABLED	BIT(1)
+#define OSD_INTERLACE_ODD	BIT(0)
+#define OSD_INTERLACE_EVEN	(0)
+
+/* OSDx_CTRL_STAT */
+#define OSD_ENABLE		BIT(21)
+#define OSD_BLK0_ENABLE		BIT(0)
+
+#define OSD_GLOBAL_ALPHA_SHIFT	12
+
+/* OSDx_CTRL_STAT2 */
+#define OSD_REPLACE_EN		BIT(14)
+#define OSD_REPLACE_SHIFT	6
+
+/*
+ * When the output is interlaced, the OSD must switch between
+ * each field using the INTERLACE_SEL_ODD (0) of VIU_OSD1_BLK0_CFG_W0
+ * at each vsync.
+ * But the vertical scaler can provide such funtionnality if
+ * is configured for 2:1 scaling with interlace options enabled.
+ */
+static void meson_vpp_setup_interlace_vscaler_osd1(struct meson_vpu_priv *priv,
+						   struct video_priv *uc_priv)
+{
+	writel(BIT(3) /* Enable scaler */ |
+	       BIT(2), /* Select OSD1 */
+	       priv->io_base + _REG(VPP_OSD_SC_CTRL0));
+
+	writel(((uc_priv->xsize - 1) << 16) | (uc_priv->ysize - 1),
+	       priv->io_base + _REG(VPP_OSD_SCI_WH_M1));
+	/* 2:1 scaling */
+	writel((0 << 16) | uc_priv->xsize,
+	       priv->io_base + _REG(VPP_OSD_SCO_H_START_END));
+	writel(((0 >> 1) << 16) | (uc_priv->ysize >> 1),
+	       priv->io_base + _REG(VPP_OSD_SCO_V_START_END));
+
+	/* 2:1 scaling values */
+	writel(BIT(16), priv->io_base + _REG(VPP_OSD_VSC_INI_PHASE));
+	writel(BIT(25), priv->io_base + _REG(VPP_OSD_VSC_PHASE_STEP));
+
+	writel(0, priv->io_base + _REG(VPP_OSD_HSC_CTRL0));
+
+	writel((4 << 0)  /* osd_vsc_bank_length */ |
+	       (4 << 3)  /* osd_vsc_top_ini_rcv_num0 */ |
+	       (1 << 8)  /* osd_vsc_top_rpt_p0_num0 */ |
+	       (6 << 11) /* osd_vsc_bot_ini_rcv_num0 */ |
+	       (2 << 16) /* osd_vsc_bot_rpt_p0_num0 */ |
+	       BIT(23)	 /* osd_prog_interlace */ |
+	       BIT(24),  /* Enable vertical scaler */
+	       priv->io_base + _REG(VPP_OSD_VSC_CTRL0));
+}
+
+static void
+meson_vpp_disable_interlace_vscaler_osd1(struct meson_vpu_priv *priv)
+{
+	writel(0, priv->io_base + _REG(VPP_OSD_SC_CTRL0));
+	writel(0, priv->io_base + _REG(VPP_OSD_VSC_CTRL0));
+	writel(0, priv->io_base + _REG(VPP_OSD_HSC_CTRL0));
+}
+
+void meson_vpu_setup_plane(struct udevice *dev, bool is_interlaced)
+{
+	struct video_uc_platdata *uc_plat = dev_get_uclass_platdata(dev);
+	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct meson_vpu_priv *priv = dev_get_priv(dev);
+	u32 osd1_ctrl_stat;
+	u32 osd1_blk0_cfg[5];
+	bool osd1_interlace;
+	unsigned int src_x1, src_x2, src_y1, src_y2;
+	unsigned int dest_x1, dest_x2, dest_y1, dest_y2;
+
+	dest_x1 = src_x1 = 0;
+	dest_x2 = src_x2 = uc_priv->xsize;
+	dest_y1 = src_y1 = 0;
+	dest_y2 = src_y2 = uc_priv->ysize;
+
+	/* Enable VPP Postblend */
+	writel(uc_priv->xsize,
+	       priv->io_base + _REG(VPP_POSTBLEND_H_SIZE));
+
+	writel_bits(VPP_POSTBLEND_ENABLE, VPP_POSTBLEND_ENABLE,
+		    priv->io_base + _REG(VPP_MISC));
+
+	/* uc_plat->base is the framebuffer */
+
+	/* Enable OSD and BLK0, set max global alpha */
+	osd1_ctrl_stat = OSD_ENABLE | (0xFF << OSD_GLOBAL_ALPHA_SHIFT) |
+			 OSD_BLK0_ENABLE;
+
+	/* Set up BLK0 to point to the right canvas */
+	osd1_blk0_cfg[0] = ((MESON_CANVAS_ID_OSD1 << OSD_CANVAS_SEL) |
+			   OSD_ENDIANNESS_LE);
+
+	/* On GXBB, Use the old non-HDR RGB2YUV converter */
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
+		osd1_blk0_cfg[0] |= OSD_OUTPUT_COLOR_RGB;
+
+	/* For XRGB, replace the pixel's alpha by 0xFF */
+	writel_bits(OSD_REPLACE_EN, OSD_REPLACE_EN,
+		    priv->io_base + _REG(VIU_OSD1_CTRL_STAT2));
+	osd1_blk0_cfg[0] |= OSD_BLK_MODE_32 |
+		OSD_COLOR_MATRIX_32_ARGB;
+
+	if (is_interlaced) {
+		osd1_interlace = true;
+		dest_y1 /= 2;
+		dest_y2 /= 2;
+	} else {
+		osd1_interlace = false;
+	}
+
+	/*
+	 * The format of these registers is (x2 << 16 | x1),
+	 * where x2 is exclusive.
+	 * e.g. +30x1920 would be (1919 << 16) | 30
+	 */
+	osd1_blk0_cfg[1] = ((src_x2 - 1) << 16) | src_x1;
+	osd1_blk0_cfg[2] = ((src_y2 - 1) << 16) | src_y1;
+	osd1_blk0_cfg[3] = ((dest_x2 - 1) << 16) | dest_x1;
+	osd1_blk0_cfg[4] = ((dest_y2 - 1) << 16) | dest_y1;
+
+	writel(osd1_ctrl_stat, priv->io_base + _REG(VIU_OSD1_CTRL_STAT));
+	writel(osd1_blk0_cfg[0], priv->io_base + _REG(VIU_OSD1_BLK0_CFG_W0));
+	writel(osd1_blk0_cfg[1], priv->io_base + _REG(VIU_OSD1_BLK0_CFG_W1));
+	writel(osd1_blk0_cfg[2], priv->io_base + _REG(VIU_OSD1_BLK0_CFG_W2));
+	writel(osd1_blk0_cfg[3], priv->io_base + _REG(VIU_OSD1_BLK0_CFG_W3));
+	writel(osd1_blk0_cfg[4], priv->io_base + _REG(VIU_OSD1_BLK0_CFG_W4));
+
+	/* If output is interlace, make use of the Scaler */
+	if (osd1_interlace)
+		meson_vpp_setup_interlace_vscaler_osd1(priv, uc_priv);
+	else
+		meson_vpp_disable_interlace_vscaler_osd1(priv);
+
+	meson_canvas_setup(priv, MESON_CANVAS_ID_OSD1,
+			   uc_plat->base, uc_priv->xsize * 4,
+			   uc_priv->ysize, MESON_CANVAS_WRAP_NONE,
+			   MESON_CANVAS_BLKMODE_LINEAR);
+
+	/* Enable OSD1 */
+	writel_bits(VPP_OSD1_POSTBLEND, VPP_OSD1_POSTBLEND,
+		    priv->io_base + _REG(VPP_MISC));
+}
diff --git a/drivers/video/meson/meson_registers.h b/drivers/video/meson/meson_registers.h
new file mode 100644
index 0000000000..01fe7d2431
--- /dev/null
+++ b/drivers/video/meson/meson_registers.h
@@ -0,0 +1,1393 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __MESON_REGISTERS_H
+#define __MESON_REGISTERS_H
+
+/* Shift all registers by 2 */
+#define _REG(reg)	((reg) << 2)
+
+#define writel_bits(mask, val, addr) \
+	writel((readl(addr) & ~(mask)) | (val), addr)
+
+/* vpp2 */
+#define VPP2_DUMMY_DATA 0x1900
+#define VPP2_LINE_IN_LENGTH 0x1901
+#define VPP2_PIC_IN_HEIGHT 0x1902
+#define VPP2_SCALE_COEF_IDX 0x1903
+#define VPP2_SCALE_COEF 0x1904
+#define VPP2_VSC_REGION12_STARTP 0x1905
+#define VPP2_VSC_REGION34_STARTP 0x1906
+#define VPP2_VSC_REGION4_ENDP 0x1907
+#define VPP2_VSC_START_PHASE_STEP 0x1908
+#define VPP2_VSC_REGION0_PHASE_SLOPE 0x1909
+#define VPP2_VSC_REGION1_PHASE_SLOPE 0x190a
+#define VPP2_VSC_REGION3_PHASE_SLOPE 0x190b
+#define VPP2_VSC_REGION4_PHASE_SLOPE 0x190c
+#define VPP2_VSC_PHASE_CTRL 0x190d
+#define VPP2_VSC_INI_PHASE 0x190e
+#define VPP2_HSC_REGION12_STARTP 0x1910
+#define VPP2_HSC_REGION34_STARTP 0x1911
+#define VPP2_HSC_REGION4_ENDP 0x1912
+#define VPP2_HSC_START_PHASE_STEP 0x1913
+#define VPP2_HSC_REGION0_PHASE_SLOPE 0x1914
+#define VPP2_HSC_REGION1_PHASE_SLOPE 0x1915
+#define VPP2_HSC_REGION3_PHASE_SLOPE 0x1916
+#define VPP2_HSC_REGION4_PHASE_SLOPE 0x1917
+#define VPP2_HSC_PHASE_CTRL 0x1918
+#define VPP2_SC_MISC 0x1919
+#define VPP2_PREBLEND_VD1_H_START_END 0x191a
+#define VPP2_PREBLEND_VD1_V_START_END 0x191b
+#define VPP2_POSTBLEND_VD1_H_START_END 0x191c
+#define VPP2_POSTBLEND_VD1_V_START_END 0x191d
+#define VPP2_PREBLEND_H_SIZE 0x1920
+#define VPP2_POSTBLEND_H_SIZE 0x1921
+#define VPP2_HOLD_LINES 0x1922
+#define VPP2_BLEND_ONECOLOR_CTRL 0x1923
+#define VPP2_PREBLEND_CURRENT_XY 0x1924
+#define VPP2_POSTBLEND_CURRENT_XY 0x1925
+#define VPP2_MISC 0x1926
+#define VPP2_OFIFO_SIZE 0x1927
+#define VPP2_FIFO_STATUS 0x1928
+#define VPP2_SMOKE_CTRL 0x1929
+#define VPP2_SMOKE1_VAL 0x192a
+#define VPP2_SMOKE2_VAL 0x192b
+#define VPP2_SMOKE1_H_START_END 0x192d
+#define VPP2_SMOKE1_V_START_END 0x192e
+#define VPP2_SMOKE2_H_START_END 0x192f
+#define VPP2_SMOKE2_V_START_END 0x1930
+#define VPP2_SCO_FIFO_CTRL 0x1933
+#define VPP2_HSC_PHASE_CTRL1 0x1934
+#define VPP2_HSC_INI_PAT_CTRL 0x1935
+#define VPP2_VADJ_CTRL 0x1940
+#define VPP2_VADJ1_Y 0x1941
+#define VPP2_VADJ1_MA_MB 0x1942
+#define VPP2_VADJ1_MC_MD 0x1943
+#define VPP2_VADJ2_Y 0x1944
+#define VPP2_VADJ2_MA_MB 0x1945
+#define VPP2_VADJ2_MC_MD 0x1946
+#define VPP2_MATRIX_PROBE_COLOR 0x195c
+#define VPP2_MATRIX_HL_COLOR 0x195d
+#define VPP2_MATRIX_PROBE_POS 0x195e
+#define VPP2_MATRIX_CTRL 0x195f
+#define VPP2_MATRIX_COEF00_01 0x1960
+#define VPP2_MATRIX_COEF02_10 0x1961
+#define VPP2_MATRIX_COEF11_12 0x1962
+#define VPP2_MATRIX_COEF20_21 0x1963
+#define VPP2_MATRIX_COEF22 0x1964
+#define VPP2_MATRIX_OFFSET0_1 0x1965
+#define VPP2_MATRIX_OFFSET2 0x1966
+#define VPP2_MATRIX_PRE_OFFSET0_1 0x1967
+#define VPP2_MATRIX_PRE_OFFSET2 0x1968
+#define VPP2_DUMMY_DATA1 0x1969
+#define VPP2_GAINOFF_CTRL0 0x196a
+#define VPP2_GAINOFF_CTRL1 0x196b
+#define VPP2_GAINOFF_CTRL2 0x196c
+#define VPP2_GAINOFF_CTRL3 0x196d
+#define VPP2_GAINOFF_CTRL4 0x196e
+#define VPP2_CHROMA_ADDR_PORT 0x1970
+#define VPP2_CHROMA_DATA_PORT 0x1971
+#define VPP2_GCLK_CTRL0 0x1972
+#define VPP2_GCLK_CTRL1 0x1973
+#define VPP2_SC_GCLK_CTRL 0x1974
+#define VPP2_MISC1 0x1976
+#define VPP2_DNLP_CTRL_00 0x1981
+#define VPP2_DNLP_CTRL_01 0x1982
+#define VPP2_DNLP_CTRL_02 0x1983
+#define VPP2_DNLP_CTRL_03 0x1984
+#define VPP2_DNLP_CTRL_04 0x1985
+#define VPP2_DNLP_CTRL_05 0x1986
+#define VPP2_DNLP_CTRL_06 0x1987
+#define VPP2_DNLP_CTRL_07 0x1988
+#define VPP2_DNLP_CTRL_08 0x1989
+#define VPP2_DNLP_CTRL_09 0x198a
+#define VPP2_DNLP_CTRL_10 0x198b
+#define VPP2_DNLP_CTRL_11 0x198c
+#define VPP2_DNLP_CTRL_12 0x198d
+#define VPP2_DNLP_CTRL_13 0x198e
+#define VPP2_DNLP_CTRL_14 0x198f
+#define VPP2_DNLP_CTRL_15 0x1990
+#define VPP2_VE_ENABLE_CTRL 0x19a1
+#define VPP2_VE_DEMO_LEFT_TOP_SCREEN_WIDTH 0x19a2
+#define VPP2_VE_DEMO_CENTER_BAR 0x19a3
+#define VPP2_VE_H_V_SIZE 0x19a4
+#define VPP2_VDO_MEAS_CTRL 0x19a8
+#define VPP2_VDO_MEAS_VS_COUNT_HI 0x19a9
+#define VPP2_VDO_MEAS_VS_COUNT_LO 0x19aa
+#define VPP2_OSD_VSC_PHASE_STEP 0x19c0
+#define VPP2_OSD_VSC_INI_PHASE 0x19c1
+#define VPP2_OSD_VSC_CTRL0 0x19c2
+#define VPP2_OSD_HSC_PHASE_STEP 0x19c3
+#define VPP2_OSD_HSC_INI_PHASE 0x19c4
+#define VPP2_OSD_HSC_CTRL0 0x19c5
+#define VPP2_OSD_HSC_INI_PAT_CTRL 0x19c6
+#define VPP2_OSD_SC_DUMMY_DATA 0x19c7
+#define VPP2_OSD_SC_CTRL0 0x19c8
+#define VPP2_OSD_SCI_WH_M1 0x19c9
+#define VPP2_OSD_SCO_H_START_END 0x19ca
+#define VPP2_OSD_SCO_V_START_END 0x19cb
+#define VPP2_OSD_SCALE_COEF_IDX 0x19cc
+#define VPP2_OSD_SCALE_COEF 0x19cd
+#define VPP2_INT_LINE_NUM 0x19ce
+
+/* viu */
+#define VIU_ADDR_START 0x1a00
+#define VIU_ADDR_END 0x1aff
+#define VIU_SW_RESET 0x1a01
+#define VIU_MISC_CTRL0 0x1a06
+#define VIU_MISC_CTRL1 0x1a07
+#define D2D3_INTF_LENGTH 0x1a08
+#define D2D3_INTF_CTRL0 0x1a09
+#define VIU_OSD1_CTRL_STAT 0x1a10
+#define VIU_OSD1_CTRL_STAT2 0x1a2d
+#define VIU_OSD1_COLOR_ADDR 0x1a11
+#define VIU_OSD1_COLOR 0x1a12
+#define VIU_OSD1_TCOLOR_AG0 0x1a17
+#define VIU_OSD1_TCOLOR_AG1 0x1a18
+#define VIU_OSD1_TCOLOR_AG2 0x1a19
+#define VIU_OSD1_TCOLOR_AG3 0x1a1a
+#define VIU_OSD1_BLK0_CFG_W0 0x1a1b
+#define VIU_OSD1_BLK1_CFG_W0 0x1a1f
+#define VIU_OSD1_BLK2_CFG_W0 0x1a23
+#define VIU_OSD1_BLK3_CFG_W0 0x1a27
+#define VIU_OSD1_BLK0_CFG_W1 0x1a1c
+#define VIU_OSD1_BLK1_CFG_W1 0x1a20
+#define VIU_OSD1_BLK2_CFG_W1 0x1a24
+#define VIU_OSD1_BLK3_CFG_W1 0x1a28
+#define VIU_OSD1_BLK0_CFG_W2 0x1a1d
+#define VIU_OSD1_BLK1_CFG_W2 0x1a21
+#define VIU_OSD1_BLK2_CFG_W2 0x1a25
+#define VIU_OSD1_BLK3_CFG_W2 0x1a29
+#define VIU_OSD1_BLK0_CFG_W3 0x1a1e
+#define VIU_OSD1_BLK1_CFG_W3 0x1a22
+#define VIU_OSD1_BLK2_CFG_W3 0x1a26
+#define VIU_OSD1_BLK3_CFG_W3 0x1a2a
+#define VIU_OSD1_BLK0_CFG_W4 0x1a13
+#define VIU_OSD1_BLK1_CFG_W4 0x1a14
+#define VIU_OSD1_BLK2_CFG_W4 0x1a15
+#define VIU_OSD1_BLK3_CFG_W4 0x1a16
+#define VIU_OSD1_FIFO_CTRL_STAT 0x1a2b
+#define VIU_OSD1_TEST_RDDATA 0x1a2c
+#define VIU_OSD1_PROT_CTRL 0x1a2e
+#define VIU_OSD2_CTRL_STAT 0x1a30
+#define VIU_OSD2_CTRL_STAT2 0x1a4d
+#define VIU_OSD2_COLOR_ADDR 0x1a31
+#define VIU_OSD2_COLOR 0x1a32
+#define VIU_OSD2_HL1_H_START_END 0x1a33
+#define VIU_OSD2_HL1_V_START_END 0x1a34
+#define VIU_OSD2_HL2_H_START_END 0x1a35
+#define VIU_OSD2_HL2_V_START_END 0x1a36
+#define VIU_OSD2_TCOLOR_AG0 0x1a37
+#define VIU_OSD2_TCOLOR_AG1 0x1a38
+#define VIU_OSD2_TCOLOR_AG2 0x1a39
+#define VIU_OSD2_TCOLOR_AG3 0x1a3a
+#define VIU_OSD2_BLK0_CFG_W0 0x1a3b
+#define VIU_OSD2_BLK1_CFG_W0 0x1a3f
+#define VIU_OSD2_BLK2_CFG_W0 0x1a43
+#define VIU_OSD2_BLK3_CFG_W0 0x1a47
+#define VIU_OSD2_BLK0_CFG_W1 0x1a3c
+#define VIU_OSD2_BLK1_CFG_W1 0x1a40
+#define VIU_OSD2_BLK2_CFG_W1 0x1a44
+#define VIU_OSD2_BLK3_CFG_W1 0x1a48
+#define VIU_OSD2_BLK0_CFG_W2 0x1a3d
+#define VIU_OSD2_BLK1_CFG_W2 0x1a41
+#define VIU_OSD2_BLK2_CFG_W2 0x1a45
+#define VIU_OSD2_BLK3_CFG_W2 0x1a49
+#define VIU_OSD2_BLK0_CFG_W3 0x1a3e
+#define VIU_OSD2_BLK1_CFG_W3 0x1a42
+#define VIU_OSD2_BLK2_CFG_W3 0x1a46
+#define VIU_OSD2_BLK3_CFG_W3 0x1a4a
+#define VIU_OSD2_BLK0_CFG_W4 0x1a64
+#define VIU_OSD2_BLK1_CFG_W4 0x1a65
+#define VIU_OSD2_BLK2_CFG_W4 0x1a66
+#define VIU_OSD2_BLK3_CFG_W4 0x1a67
+#define VIU_OSD2_FIFO_CTRL_STAT 0x1a4b
+#define VIU_OSD2_TEST_RDDATA 0x1a4c
+#define VIU_OSD2_PROT_CTRL 0x1a4e
+
+#define VD1_IF0_GEN_REG 0x1a50
+#define VD1_IF0_CANVAS0 0x1a51
+#define VD1_IF0_CANVAS1 0x1a52
+#define VD1_IF0_LUMA_X0 0x1a53
+#define VD1_IF0_LUMA_Y0 0x1a54
+#define VD1_IF0_CHROMA_X0 0x1a55
+#define VD1_IF0_CHROMA_Y0 0x1a56
+#define VD1_IF0_LUMA_X1 0x1a57
+#define VD1_IF0_LUMA_Y1 0x1a58
+#define VD1_IF0_CHROMA_X1 0x1a59
+#define VD1_IF0_CHROMA_Y1 0x1a5a
+#define VD1_IF0_RPT_LOOP 0x1a5b
+#define VD1_IF0_LUMA0_RPT_PAT 0x1a5c
+#define VD1_IF0_CHROMA0_RPT_PAT 0x1a5d
+#define VD1_IF0_LUMA1_RPT_PAT 0x1a5e
+#define VD1_IF0_CHROMA1_RPT_PAT 0x1a5f
+#define VD1_IF0_LUMA_PSEL 0x1a60
+#define VD1_IF0_CHROMA_PSEL 0x1a61
+#define VD1_IF0_DUMMY_PIXEL 0x1a62
+#define VD1_IF0_LUMA_FIFO_SIZE 0x1a63
+#define VD1_IF0_RANGE_MAP_Y 0x1a6a
+#define VD1_IF0_RANGE_MAP_CB 0x1a6b
+#define VD1_IF0_RANGE_MAP_CR 0x1a6c
+#define VD1_IF0_GEN_REG2 0x1a6d
+#define VD1_IF0_PROT_CNTL 0x1a6e
+#define VIU_VD1_FMT_CTRL 0x1a68
+#define VIU_VD1_FMT_W 0x1a69
+#define VD2_IF0_GEN_REG 0x1a70
+#define VD2_IF0_CANVAS0 0x1a71
+#define VD2_IF0_CANVAS1 0x1a72
+#define VD2_IF0_LUMA_X0 0x1a73
+#define VD2_IF0_LUMA_Y0 0x1a74
+#define VD2_IF0_CHROMA_X0 0x1a75
+#define VD2_IF0_CHROMA_Y0 0x1a76
+#define VD2_IF0_LUMA_X1 0x1a77
+#define VD2_IF0_LUMA_Y1 0x1a78
+#define VD2_IF0_CHROMA_X1 0x1a79
+#define VD2_IF0_CHROMA_Y1 0x1a7a
+#define VD2_IF0_RPT_LOOP 0x1a7b
+#define VD2_IF0_LUMA0_RPT_PAT 0x1a7c
+#define VD2_IF0_CHROMA0_RPT_PAT 0x1a7d
+#define VD2_IF0_LUMA1_RPT_PAT 0x1a7e
+#define VD2_IF0_CHROMA1_RPT_PAT 0x1a7f
+#define VD2_IF0_LUMA_PSEL 0x1a80
+#define VD2_IF0_CHROMA_PSEL 0x1a81
+#define VD2_IF0_DUMMY_PIXEL 0x1a82
+#define VD2_IF0_LUMA_FIFO_SIZE 0x1a83
+#define VD2_IF0_RANGE_MAP_Y 0x1a8a
+#define VD2_IF0_RANGE_MAP_CB 0x1a8b
+#define VD2_IF0_RANGE_MAP_CR 0x1a8c
+#define VD2_IF0_GEN_REG2 0x1a8d
+#define VD2_IF0_PROT_CNTL 0x1a8e
+#define VIU_VD2_FMT_CTRL 0x1a88
+#define VIU_VD2_FMT_W 0x1a89
+
+/* VIU Matrix Registers */
+#define VIU_OSD1_MATRIX_CTRL 0x1a90
+#define VIU_OSD1_MATRIX_COEF00_01 0x1a91
+#define VIU_OSD1_MATRIX_COEF02_10 0x1a92
+#define VIU_OSD1_MATRIX_COEF11_12 0x1a93
+#define VIU_OSD1_MATRIX_COEF20_21 0x1a94
+#define VIU_OSD1_MATRIX_COLMOD_COEF42 0x1a95
+#define VIU_OSD1_MATRIX_OFFSET0_1 0x1a96
+#define VIU_OSD1_MATRIX_OFFSET2 0x1a97
+#define VIU_OSD1_MATRIX_PRE_OFFSET0_1 0x1a98
+#define VIU_OSD1_MATRIX_PRE_OFFSET2 0x1a99
+#define VIU_OSD1_MATRIX_COEF22_30 0x1a9d
+#define VIU_OSD1_MATRIX_COEF31_32 0x1a9e
+#define VIU_OSD1_MATRIX_COEF40_41 0x1a9f
+#define VD1_IF0_GEN_REG3 0x1aa7
+#define VIU_OSD1_EOTF_CTL 0x1ad4
+#define VIU_OSD1_EOTF_COEF00_01 0x1ad5
+#define VIU_OSD1_EOTF_COEF02_10 0x1ad6
+#define VIU_OSD1_EOTF_COEF11_12 0x1ad7
+#define VIU_OSD1_EOTF_COEF20_21 0x1ad8
+#define VIU_OSD1_EOTF_COEF22_RS 0x1ad9
+#define VIU_OSD1_EOTF_LUT_ADDR_PORT 0x1ada
+#define VIU_OSD1_EOTF_LUT_DATA_PORT 0x1adb
+#define VIU_OSD1_OETF_CTL 0x1adc
+#define VIU_OSD1_OETF_LUT_ADDR_PORT 0x1add
+#define VIU_OSD1_OETF_LUT_DATA_PORT 0x1ade
+#define AFBC_ENABLE 0x1ae0
+
+/* vpp */
+#define VPP_DUMMY_DATA 0x1d00
+#define VPP_LINE_IN_LENGTH 0x1d01
+#define VPP_PIC_IN_HEIGHT 0x1d02
+#define VPP_SCALE_COEF_IDX 0x1d03
+#define VPP_SCALE_COEF 0x1d04
+#define VPP_VSC_REGION12_STARTP 0x1d05
+#define VPP_VSC_REGION34_STARTP 0x1d06
+#define VPP_VSC_REGION4_ENDP 0x1d07
+#define VPP_VSC_START_PHASE_STEP 0x1d08
+#define VPP_VSC_REGION0_PHASE_SLOPE 0x1d09
+#define VPP_VSC_REGION1_PHASE_SLOPE 0x1d0a
+#define VPP_VSC_REGION3_PHASE_SLOPE 0x1d0b
+#define VPP_VSC_REGION4_PHASE_SLOPE 0x1d0c
+#define VPP_VSC_PHASE_CTRL 0x1d0d
+#define VPP_VSC_INI_PHASE 0x1d0e
+#define VPP_HSC_REGION12_STARTP 0x1d10
+#define VPP_HSC_REGION34_STARTP 0x1d11
+#define VPP_HSC_REGION4_ENDP 0x1d12
+#define VPP_HSC_START_PHASE_STEP 0x1d13
+#define VPP_HSC_REGION0_PHASE_SLOPE 0x1d14
+#define VPP_HSC_REGION1_PHASE_SLOPE 0x1d15
+#define VPP_HSC_REGION3_PHASE_SLOPE 0x1d16
+#define VPP_HSC_REGION4_PHASE_SLOPE 0x1d17
+#define VPP_HSC_PHASE_CTRL 0x1d18
+#define VPP_SC_MISC 0x1d19
+#define VPP_PREBLEND_VD1_H_START_END 0x1d1a
+#define VPP_PREBLEND_VD1_V_START_END 0x1d1b
+#define VPP_POSTBLEND_VD1_H_START_END 0x1d1c
+#define VPP_POSTBLEND_VD1_V_START_END 0x1d1d
+#define VPP_BLEND_VD2_H_START_END 0x1d1e
+#define VPP_BLEND_VD2_V_START_END 0x1d1f
+#define VPP_PREBLEND_H_SIZE 0x1d20
+#define VPP_POSTBLEND_H_SIZE 0x1d21
+#define VPP_HOLD_LINES 0x1d22
+#define VPP_BLEND_ONECOLOR_CTRL 0x1d23
+#define VPP_PREBLEND_CURRENT_XY 0x1d24
+#define VPP_POSTBLEND_CURRENT_XY 0x1d25
+#define VPP_MISC 0x1d26
+#define		VPP_PREBLEND_ENABLE	BIT(6)
+#define		VPP_POSTBLEND_ENABLE	BIT(7)
+#define		VPP_OSD2_ALPHA_PREMULT	BIT(8)
+#define		VPP_OSD1_ALPHA_PREMULT	BIT(9)
+#define		VPP_VD1_POSTBLEND	BIT(10)
+#define		VPP_VD2_POSTBLEND	BIT(11)
+#define		VPP_OSD1_POSTBLEND	BIT(12)
+#define		VPP_OSD2_POSTBLEND	BIT(13)
+#define		VPP_VD1_PREBLEND	BIT(14)
+#define		VPP_VD2_PREBLEND	BIT(15)
+#define		VPP_OSD1_PREBLEND	BIT(16)
+#define		VPP_OSD2_PREBLEND	BIT(17)
+#define		VPP_COLOR_MNG_ENABLE	BIT(28)
+#define VPP_OFIFO_SIZE 0x1d27
+#define VPP_FIFO_STATUS 0x1d28
+#define VPP_SMOKE_CTRL 0x1d29
+#define VPP_SMOKE1_VAL 0x1d2a
+#define VPP_SMOKE2_VAL 0x1d2b
+#define VPP_SMOKE3_VAL 0x1d2c
+#define VPP_SMOKE1_H_START_END 0x1d2d
+#define VPP_SMOKE1_V_START_END 0x1d2e
+#define VPP_SMOKE2_H_START_END 0x1d2f
+#define VPP_SMOKE2_V_START_END 0x1d30
+#define VPP_SMOKE3_H_START_END 0x1d31
+#define VPP_SMOKE3_V_START_END 0x1d32
+#define VPP_SCO_FIFO_CTRL 0x1d33
+#define VPP_HSC_PHASE_CTRL1 0x1d34
+#define VPP_HSC_INI_PAT_CTRL 0x1d35
+#define VPP_VADJ_CTRL 0x1d40
+#define VPP_VADJ1_Y 0x1d41
+#define VPP_VADJ1_MA_MB 0x1d42
+#define VPP_VADJ1_MC_MD 0x1d43
+#define VPP_VADJ2_Y 0x1d44
+#define VPP_VADJ2_MA_MB 0x1d45
+#define VPP_VADJ2_MC_MD 0x1d46
+#define VPP_HSHARP_CTRL 0x1d50
+#define VPP_HSHARP_LUMA_THRESH01 0x1d51
+#define VPP_HSHARP_LUMA_THRESH23 0x1d52
+#define VPP_HSHARP_CHROMA_THRESH01 0x1d53
+#define VPP_HSHARP_CHROMA_THRESH23 0x1d54
+#define VPP_HSHARP_LUMA_GAIN 0x1d55
+#define VPP_HSHARP_CHROMA_GAIN 0x1d56
+#define VPP_MATRIX_PROBE_COLOR 0x1d5c
+#define VPP_MATRIX_HL_COLOR 0x1d5d
+#define VPP_MATRIX_PROBE_POS 0x1d5e
+#define VPP_MATRIX_CTRL 0x1d5f
+#define VPP_MATRIX_COEF00_01 0x1d60
+#define VPP_MATRIX_COEF02_10 0x1d61
+#define VPP_MATRIX_COEF11_12 0x1d62
+#define VPP_MATRIX_COEF20_21 0x1d63
+#define VPP_MATRIX_COEF22 0x1d64
+#define VPP_MATRIX_OFFSET0_1 0x1d65
+#define VPP_MATRIX_OFFSET2 0x1d66
+#define VPP_MATRIX_PRE_OFFSET0_1 0x1d67
+#define VPP_MATRIX_PRE_OFFSET2 0x1d68
+#define VPP_DUMMY_DATA1 0x1d69
+#define VPP_GAINOFF_CTRL0 0x1d6a
+#define VPP_GAINOFF_CTRL1 0x1d6b
+#define VPP_GAINOFF_CTRL2 0x1d6c
+#define VPP_GAINOFF_CTRL3 0x1d6d
+#define VPP_GAINOFF_CTRL4 0x1d6e
+#define VPP_CHROMA_ADDR_PORT 0x1d70
+#define VPP_CHROMA_DATA_PORT 0x1d71
+#define VPP_GCLK_CTRL0 0x1d72
+#define VPP_GCLK_CTRL1 0x1d73
+#define VPP_SC_GCLK_CTRL 0x1d74
+#define VPP_MISC1 0x1d76
+#define VPP_BLACKEXT_CTRL 0x1d80
+#define VPP_DNLP_CTRL_00 0x1d81
+#define VPP_DNLP_CTRL_01 0x1d82
+#define VPP_DNLP_CTRL_02 0x1d83
+#define VPP_DNLP_CTRL_03 0x1d84
+#define VPP_DNLP_CTRL_04 0x1d85
+#define VPP_DNLP_CTRL_05 0x1d86
+#define VPP_DNLP_CTRL_06 0x1d87
+#define VPP_DNLP_CTRL_07 0x1d88
+#define VPP_DNLP_CTRL_08 0x1d89
+#define VPP_DNLP_CTRL_09 0x1d8a
+#define VPP_DNLP_CTRL_10 0x1d8b
+#define VPP_DNLP_CTRL_11 0x1d8c
+#define VPP_DNLP_CTRL_12 0x1d8d
+#define VPP_DNLP_CTRL_13 0x1d8e
+#define VPP_DNLP_CTRL_14 0x1d8f
+#define VPP_DNLP_CTRL_15 0x1d90
+#define VPP_PEAKING_HGAIN 0x1d91
+#define VPP_PEAKING_VGAIN 0x1d92
+#define VPP_PEAKING_NLP_1 0x1d93
+#define VPP_DOLBY_CTRL 0x1d93
+#define VPP_PEAKING_NLP_2 0x1d94
+#define VPP_PEAKING_NLP_3 0x1d95
+#define VPP_PEAKING_NLP_4 0x1d96
+#define VPP_PEAKING_NLP_5 0x1d97
+#define VPP_SHARP_LIMIT 0x1d98
+#define VPP_VLTI_CTRL 0x1d99
+#define VPP_HLTI_CTRL 0x1d9a
+#define VPP_CTI_CTRL 0x1d9b
+#define VPP_BLUE_STRETCH_1 0x1d9c
+#define VPP_BLUE_STRETCH_2 0x1d9d
+#define VPP_BLUE_STRETCH_3 0x1d9e
+#define VPP_CCORING_CTRL 0x1da0
+#define VPP_VE_ENABLE_CTRL 0x1da1
+#define VPP_VE_DEMO_LEFT_TOP_SCREEN_WIDTH 0x1da2
+#define VPP_VE_DEMO_CENTER_BAR 0x1da3
+#define VPP_VE_H_V_SIZE 0x1da4
+#define VPP_VDO_MEAS_CTRL 0x1da8
+#define VPP_VDO_MEAS_VS_COUNT_HI 0x1da9
+#define VPP_VDO_MEAS_VS_COUNT_LO 0x1daa
+#define VPP_INPUT_CTRL 0x1dab
+#define VPP_CTI_CTRL2 0x1dac
+#define VPP_PEAKING_SAT_THD1 0x1dad
+#define VPP_PEAKING_SAT_THD2 0x1dae
+#define VPP_PEAKING_SAT_THD3 0x1daf
+#define VPP_PEAKING_SAT_THD4 0x1db0
+#define VPP_PEAKING_SAT_THD5 0x1db1
+#define VPP_PEAKING_SAT_THD6 0x1db2
+#define VPP_PEAKING_SAT_THD7 0x1db3
+#define VPP_PEAKING_SAT_THD8 0x1db4
+#define VPP_PEAKING_SAT_THD9 0x1db5
+#define VPP_PEAKING_GAIN_ADD1 0x1db6
+#define VPP_PEAKING_GAIN_ADD2 0x1db7
+#define VPP_PEAKING_DNLP 0x1db8
+#define VPP_SHARP_DEMO_WIN_CTRL1 0x1db9
+#define VPP_SHARP_DEMO_WIN_CTRL2 0x1dba
+#define VPP_FRONT_HLTI_CTRL 0x1dbb
+#define VPP_FRONT_CTI_CTRL 0x1dbc
+#define VPP_FRONT_CTI_CTRL2 0x1dbd
+#define VPP_OSD_VSC_PHASE_STEP 0x1dc0
+#define VPP_OSD_VSC_INI_PHASE 0x1dc1
+#define VPP_OSD_VSC_CTRL0 0x1dc2
+#define VPP_OSD_HSC_PHASE_STEP 0x1dc3
+#define VPP_OSD_HSC_INI_PHASE 0x1dc4
+#define VPP_OSD_HSC_CTRL0 0x1dc5
+#define VPP_OSD_HSC_INI_PAT_CTRL 0x1dc6
+#define VPP_OSD_SC_DUMMY_DATA 0x1dc7
+#define VPP_OSD_SC_CTRL0 0x1dc8
+#define VPP_OSD_SCI_WH_M1 0x1dc9
+#define VPP_OSD_SCO_H_START_END 0x1dca
+#define VPP_OSD_SCO_V_START_END 0x1dcb
+#define VPP_OSD_SCALE_COEF_IDX 0x1dcc
+#define VPP_OSD_SCALE_COEF 0x1dcd
+#define VPP_INT_LINE_NUM 0x1dce
+
+/* viu2 */
+#define VIU2_ADDR_START 0x1e00
+#define VIU2_ADDR_END 0x1eff
+#define VIU2_SW_RESET 0x1e01
+#define VIU2_OSD1_CTRL_STAT 0x1e10
+#define VIU2_OSD1_CTRL_STAT2 0x1e2d
+#define VIU2_OSD1_COLOR_ADDR 0x1e11
+#define VIU2_OSD1_COLOR 0x1e12
+#define VIU2_OSD1_TCOLOR_AG0 0x1e17
+#define VIU2_OSD1_TCOLOR_AG1 0x1e18
+#define VIU2_OSD1_TCOLOR_AG2 0x1e19
+#define VIU2_OSD1_TCOLOR_AG3 0x1e1a
+#define VIU2_OSD1_BLK0_CFG_W0 0x1e1b
+#define VIU2_OSD1_BLK1_CFG_W0 0x1e1f
+#define VIU2_OSD1_BLK2_CFG_W0 0x1e23
+#define VIU2_OSD1_BLK3_CFG_W0 0x1e27
+#define VIU2_OSD1_BLK0_CFG_W1 0x1e1c
+#define VIU2_OSD1_BLK1_CFG_W1 0x1e20
+#define VIU2_OSD1_BLK2_CFG_W1 0x1e24
+#define VIU2_OSD1_BLK3_CFG_W1 0x1e28
+#define VIU2_OSD1_BLK0_CFG_W2 0x1e1d
+#define VIU2_OSD1_BLK1_CFG_W2 0x1e21
+#define VIU2_OSD1_BLK2_CFG_W2 0x1e25
+#define VIU2_OSD1_BLK3_CFG_W2 0x1e29
+#define VIU2_OSD1_BLK0_CFG_W3 0x1e1e
+#define VIU2_OSD1_BLK1_CFG_W3 0x1e22
+#define VIU2_OSD1_BLK2_CFG_W3 0x1e26
+#define VIU2_OSD1_BLK3_CFG_W3 0x1e2a
+#define VIU2_OSD1_BLK0_CFG_W4 0x1e13
+#define VIU2_OSD1_BLK1_CFG_W4 0x1e14
+#define VIU2_OSD1_BLK2_CFG_W4 0x1e15
+#define VIU2_OSD1_BLK3_CFG_W4 0x1e16
+#define VIU2_OSD1_FIFO_CTRL_STAT 0x1e2b
+#define VIU2_OSD1_TEST_RDDATA 0x1e2c
+#define VIU2_OSD1_PROT_CTRL 0x1e2e
+#define VIU2_OSD2_CTRL_STAT 0x1e30
+#define VIU2_OSD2_CTRL_STAT2 0x1e4d
+#define VIU2_OSD2_COLOR_ADDR 0x1e31
+#define VIU2_OSD2_COLOR 0x1e32
+#define VIU2_OSD2_HL1_H_START_END 0x1e33
+#define VIU2_OSD2_HL1_V_START_END 0x1e34
+#define VIU2_OSD2_HL2_H_START_END 0x1e35
+#define VIU2_OSD2_HL2_V_START_END 0x1e36
+#define VIU2_OSD2_TCOLOR_AG0 0x1e37
+#define VIU2_OSD2_TCOLOR_AG1 0x1e38
+#define VIU2_OSD2_TCOLOR_AG2 0x1e39
+#define VIU2_OSD2_TCOLOR_AG3 0x1e3a
+#define VIU2_OSD2_BLK0_CFG_W0 0x1e3b
+#define VIU2_OSD2_BLK1_CFG_W0 0x1e3f
+#define VIU2_OSD2_BLK2_CFG_W0 0x1e43
+#define VIU2_OSD2_BLK3_CFG_W0 0x1e47
+#define VIU2_OSD2_BLK0_CFG_W1 0x1e3c
+#define VIU2_OSD2_BLK1_CFG_W1 0x1e40
+#define VIU2_OSD2_BLK2_CFG_W1 0x1e44
+#define VIU2_OSD2_BLK3_CFG_W1 0x1e48
+#define VIU2_OSD2_BLK0_CFG_W2 0x1e3d
+#define VIU2_OSD2_BLK1_CFG_W2 0x1e41
+#define VIU2_OSD2_BLK2_CFG_W2 0x1e45
+#define VIU2_OSD2_BLK3_CFG_W2 0x1e49
+#define VIU2_OSD2_BLK0_CFG_W3 0x1e3e
+#define VIU2_OSD2_BLK1_CFG_W3 0x1e42
+#define VIU2_OSD2_BLK2_CFG_W3 0x1e46
+#define VIU2_OSD2_BLK3_CFG_W3 0x1e4a
+#define VIU2_OSD2_BLK0_CFG_W4 0x1e64
+#define VIU2_OSD2_BLK1_CFG_W4 0x1e65
+#define VIU2_OSD2_BLK2_CFG_W4 0x1e66
+#define VIU2_OSD2_BLK3_CFG_W4 0x1e67
+#define VIU2_OSD2_FIFO_CTRL_STAT 0x1e4b
+#define VIU2_OSD2_TEST_RDDATA 0x1e4c
+#define VIU2_OSD2_PROT_CTRL 0x1e4e
+#define VIU2_VD1_IF0_GEN_REG 0x1e50
+#define VIU2_VD1_IF0_CANVAS0 0x1e51
+#define VIU2_VD1_IF0_CANVAS1 0x1e52
+#define VIU2_VD1_IF0_LUMA_X0 0x1e53
+#define VIU2_VD1_IF0_LUMA_Y0 0x1e54
+#define VIU2_VD1_IF0_CHROMA_X0 0x1e55
+#define VIU2_VD1_IF0_CHROMA_Y0 0x1e56
+#define VIU2_VD1_IF0_LUMA_X1 0x1e57
+#define VIU2_VD1_IF0_LUMA_Y1 0x1e58
+#define VIU2_VD1_IF0_CHROMA_X1 0x1e59
+#define VIU2_VD1_IF0_CHROMA_Y1 0x1e5a
+#define VIU2_VD1_IF0_RPT_LOOP 0x1e5b
+#define VIU2_VD1_IF0_LUMA0_RPT_PAT 0x1e5c
+#define VIU2_VD1_IF0_CHROMA0_RPT_PAT 0x1e5d
+#define VIU2_VD1_IF0_LUMA1_RPT_PAT 0x1e5e
+#define VIU2_VD1_IF0_CHROMA1_RPT_PAT 0x1e5f
+#define VIU2_VD1_IF0_LUMA_PSEL 0x1e60
+#define VIU2_VD1_IF0_CHROMA_PSEL 0x1e61
+#define VIU2_VD1_IF0_DUMMY_PIXEL 0x1e62
+#define VIU2_VD1_IF0_LUMA_FIFO_SIZE 0x1e63
+#define VIU2_VD1_IF0_RANGE_MAP_Y 0x1e6a
+#define VIU2_VD1_IF0_RANGE_MAP_CB 0x1e6b
+#define VIU2_VD1_IF0_RANGE_MAP_CR 0x1e6c
+#define VIU2_VD1_IF0_GEN_REG2 0x1e6d
+#define VIU2_VD1_IF0_PROT_CNTL 0x1e6e
+#define VIU2_VD1_FMT_CTRL 0x1e68
+#define VIU2_VD1_FMT_W 0x1e69
+
+/* encode */
+#define ENCP_VFIFO2VD_CTL 0x1b58
+#define ENCP_VFIFO2VD_PIXEL_START 0x1b59
+#define ENCP_VFIFO2VD_PIXEL_END 0x1b5a
+#define ENCP_VFIFO2VD_LINE_TOP_START 0x1b5b
+#define ENCP_VFIFO2VD_LINE_TOP_END 0x1b5c
+#define ENCP_VFIFO2VD_LINE_BOT_START 0x1b5d
+#define ENCP_VFIFO2VD_LINE_BOT_END 0x1b5e
+#define VENC_SYNC_ROUTE 0x1b60
+#define VENC_VIDEO_EXSRC 0x1b61
+#define VENC_DVI_SETTING 0x1b62
+#define VENC_C656_CTRL 0x1b63
+#define VENC_UPSAMPLE_CTRL0 0x1b64
+#define VENC_UPSAMPLE_CTRL1 0x1b65
+#define VENC_UPSAMPLE_CTRL2 0x1b66
+#define TCON_INVERT_CTL 0x1b67
+#define VENC_VIDEO_PROG_MODE 0x1b68
+#define VENC_ENCI_LINE 0x1b69
+#define VENC_ENCI_PIXEL 0x1b6a
+#define VENC_ENCP_LINE 0x1b6b
+#define VENC_ENCP_PIXEL 0x1b6c
+#define VENC_STATA 0x1b6d
+#define VENC_INTCTRL 0x1b6e
+#define VENC_INTFLAG 0x1b6f
+#define VENC_VIDEO_TST_EN 0x1b70
+#define VENC_VIDEO_TST_MDSEL 0x1b71
+#define VENC_VIDEO_TST_Y 0x1b72
+#define VENC_VIDEO_TST_CB 0x1b73
+#define VENC_VIDEO_TST_CR 0x1b74
+#define VENC_VIDEO_TST_CLRBAR_STRT 0x1b75
+#define VENC_VIDEO_TST_CLRBAR_WIDTH 0x1b76
+#define VENC_VIDEO_TST_VDCNT_STSET 0x1b77
+#define VENC_VDAC_DACSEL0 0x1b78
+#define VENC_VDAC_DACSEL1 0x1b79
+#define VENC_VDAC_DACSEL2 0x1b7a
+#define VENC_VDAC_DACSEL3 0x1b7b
+#define VENC_VDAC_DACSEL4 0x1b7c
+#define VENC_VDAC_DACSEL5 0x1b7d
+#define VENC_VDAC_SETTING 0x1b7e
+#define VENC_VDAC_TST_VAL 0x1b7f
+#define VENC_VDAC_DAC0_GAINCTRL 0x1bf0
+#define VENC_VDAC_DAC0_OFFSET 0x1bf1
+#define VENC_VDAC_DAC1_GAINCTRL 0x1bf2
+#define VENC_VDAC_DAC1_OFFSET 0x1bf3
+#define VENC_VDAC_DAC2_GAINCTRL 0x1bf4
+#define VENC_VDAC_DAC2_OFFSET 0x1bf5
+#define VENC_VDAC_DAC3_GAINCTRL 0x1bf6
+#define VENC_VDAC_DAC3_OFFSET 0x1bf7
+#define VENC_VDAC_DAC4_GAINCTRL 0x1bf8
+#define VENC_VDAC_DAC4_OFFSET 0x1bf9
+#define VENC_VDAC_DAC5_GAINCTRL 0x1bfa
+#define VENC_VDAC_DAC5_OFFSET 0x1bfb
+#define VENC_VDAC_FIFO_CTRL 0x1bfc
+#define ENCL_TCON_INVERT_CTL 0x1bfd
+#define ENCP_VIDEO_EN 0x1b80
+#define ENCP_VIDEO_SYNC_MODE 0x1b81
+#define ENCP_MACV_EN 0x1b82
+#define ENCP_VIDEO_Y_SCL 0x1b83
+#define ENCP_VIDEO_PB_SCL 0x1b84
+#define ENCP_VIDEO_PR_SCL 0x1b85
+#define ENCP_VIDEO_SYNC_SCL 0x1b86
+#define ENCP_VIDEO_MACV_SCL 0x1b87
+#define ENCP_VIDEO_Y_OFFST 0x1b88
+#define ENCP_VIDEO_PB_OFFST 0x1b89
+#define ENCP_VIDEO_PR_OFFST 0x1b8a
+#define ENCP_VIDEO_SYNC_OFFST 0x1b8b
+#define ENCP_VIDEO_MACV_OFFST 0x1b8c
+#define ENCP_VIDEO_MODE 0x1b8d
+#define ENCP_VIDEO_MODE_ADV 0x1b8e
+#define ENCP_DBG_PX_RST 0x1b90
+#define ENCP_DBG_LN_RST 0x1b91
+#define ENCP_DBG_PX_INT 0x1b92
+#define ENCP_DBG_LN_INT 0x1b93
+#define ENCP_VIDEO_YFP1_HTIME 0x1b94
+#define ENCP_VIDEO_YFP2_HTIME 0x1b95
+#define ENCP_VIDEO_YC_DLY 0x1b96
+#define ENCP_VIDEO_MAX_PXCNT 0x1b97
+#define ENCP_VIDEO_HSPULS_BEGIN 0x1b98
+#define ENCP_VIDEO_HSPULS_END 0x1b99
+#define ENCP_VIDEO_HSPULS_SWITCH 0x1b9a
+#define ENCP_VIDEO_VSPULS_BEGIN 0x1b9b
+#define ENCP_VIDEO_VSPULS_END 0x1b9c
+#define ENCP_VIDEO_VSPULS_BLINE 0x1b9d
+#define ENCP_VIDEO_VSPULS_ELINE 0x1b9e
+#define ENCP_VIDEO_EQPULS_BEGIN 0x1b9f
+#define ENCP_VIDEO_EQPULS_END 0x1ba0
+#define ENCP_VIDEO_EQPULS_BLINE 0x1ba1
+#define ENCP_VIDEO_EQPULS_ELINE 0x1ba2
+#define ENCP_VIDEO_HAVON_END 0x1ba3
+#define ENCP_VIDEO_HAVON_BEGIN 0x1ba4
+#define ENCP_VIDEO_VAVON_ELINE 0x1baf
+#define ENCP_VIDEO_VAVON_BLINE 0x1ba6
+#define ENCP_VIDEO_HSO_BEGIN 0x1ba7
+#define ENCP_VIDEO_HSO_END 0x1ba8
+#define ENCP_VIDEO_VSO_BEGIN 0x1ba9
+#define ENCP_VIDEO_VSO_END 0x1baa
+#define ENCP_VIDEO_VSO_BLINE 0x1bab
+#define ENCP_VIDEO_VSO_ELINE 0x1bac
+#define ENCP_VIDEO_SYNC_WAVE_CURVE 0x1bad
+#define ENCP_VIDEO_MAX_LNCNT 0x1bae
+#define ENCP_VIDEO_SY_VAL 0x1bb0
+#define ENCP_VIDEO_SY2_VAL 0x1bb1
+#define ENCP_VIDEO_BLANKY_VAL 0x1bb2
+#define ENCP_VIDEO_BLANKPB_VAL 0x1bb3
+#define ENCP_VIDEO_BLANKPR_VAL 0x1bb4
+#define ENCP_VIDEO_HOFFST 0x1bb5
+#define ENCP_VIDEO_VOFFST 0x1bb6
+#define ENCP_VIDEO_RGB_CTRL 0x1bb7
+#define ENCP_VIDEO_FILT_CTRL 0x1bb8
+#define ENCP_VIDEO_OFLD_VPEQ_OFST 0x1bb9
+#define ENCP_VIDEO_OFLD_VOAV_OFST 0x1bba
+#define ENCP_VIDEO_MATRIX_CB 0x1bbb
+#define ENCP_VIDEO_MATRIX_CR 0x1bbc
+#define ENCP_VIDEO_RGBIN_CTRL 0x1bbd
+#define ENCP_MACV_BLANKY_VAL 0x1bc0
+#define ENCP_MACV_MAXY_VAL 0x1bc1
+#define ENCP_MACV_1ST_PSSYNC_STRT 0x1bc2
+#define ENCP_MACV_PSSYNC_STRT 0x1bc3
+#define ENCP_MACV_AGC_STRT 0x1bc4
+#define ENCP_MACV_AGC_END 0x1bc5
+#define ENCP_MACV_WAVE_END 0x1bc6
+#define ENCP_MACV_STRTLINE 0x1bc7
+#define ENCP_MACV_ENDLINE 0x1bc8
+#define ENCP_MACV_TS_CNT_MAX_L 0x1bc9
+#define ENCP_MACV_TS_CNT_MAX_H 0x1bca
+#define ENCP_MACV_TIME_DOWN 0x1bcb
+#define ENCP_MACV_TIME_LO 0x1bcc
+#define ENCP_MACV_TIME_UP 0x1bcd
+#define ENCP_MACV_TIME_RST 0x1bce
+#define ENCP_VBI_CTRL 0x1bd0
+#define ENCP_VBI_SETTING 0x1bd1
+#define ENCP_VBI_BEGIN 0x1bd2
+#define ENCP_VBI_WIDTH 0x1bd3
+#define ENCP_VBI_HVAL 0x1bd4
+#define ENCP_VBI_DATA0 0x1bd5
+#define ENCP_VBI_DATA1 0x1bd6
+#define C656_HS_ST 0x1be0
+#define C656_HS_ED 0x1be1
+#define C656_VS_LNST_E 0x1be2
+#define C656_VS_LNST_O 0x1be3
+#define C656_VS_LNED_E 0x1be4
+#define C656_VS_LNED_O 0x1be5
+#define C656_FS_LNST 0x1be6
+#define C656_FS_LNED 0x1be7
+#define ENCI_VIDEO_MODE 0x1b00
+#define ENCI_VIDEO_MODE_ADV 0x1b01
+#define ENCI_VIDEO_FSC_ADJ 0x1b02
+#define ENCI_VIDEO_BRIGHT 0x1b03
+#define ENCI_VIDEO_CONT 0x1b04
+#define ENCI_VIDEO_SAT 0x1b05
+#define ENCI_VIDEO_HUE 0x1b06
+#define ENCI_VIDEO_SCH 0x1b07
+#define ENCI_SYNC_MODE 0x1b08
+#define ENCI_SYNC_CTRL 0x1b09
+#define ENCI_SYNC_HSO_BEGIN 0x1b0a
+#define ENCI_SYNC_HSO_END 0x1b0b
+#define ENCI_SYNC_VSO_EVN 0x1b0c
+#define ENCI_SYNC_VSO_ODD 0x1b0d
+#define ENCI_SYNC_VSO_EVNLN 0x1b0e
+#define ENCI_SYNC_VSO_ODDLN 0x1b0f
+#define ENCI_SYNC_HOFFST 0x1b10
+#define ENCI_SYNC_VOFFST 0x1b11
+#define ENCI_SYNC_ADJ 0x1b12
+#define ENCI_RGB_SETTING 0x1b13
+#define ENCI_DE_H_BEGIN 0x1b16
+#define ENCI_DE_H_END 0x1b17
+#define ENCI_DE_V_BEGIN_EVEN 0x1b18
+#define ENCI_DE_V_END_EVEN 0x1b19
+#define ENCI_DE_V_BEGIN_ODD 0x1b1a
+#define ENCI_DE_V_END_ODD 0x1b1b
+#define ENCI_VBI_SETTING 0x1b20
+#define ENCI_VBI_CCDT_EVN 0x1b21
+#define ENCI_VBI_CCDT_ODD 0x1b22
+#define ENCI_VBI_CC525_LN 0x1b23
+#define ENCI_VBI_CC625_LN 0x1b24
+#define ENCI_VBI_WSSDT 0x1b25
+#define ENCI_VBI_WSS_LN 0x1b26
+#define ENCI_VBI_CGMSDT_L 0x1b27
+#define ENCI_VBI_CGMSDT_H 0x1b28
+#define ENCI_VBI_CGMS_LN 0x1b29
+#define ENCI_VBI_TTX_HTIME 0x1b2a
+#define ENCI_VBI_TTX_LN 0x1b2b
+#define ENCI_VBI_TTXDT0 0x1b2c
+#define ENCI_VBI_TTXDT1 0x1b2d
+#define ENCI_VBI_TTXDT2 0x1b2e
+#define ENCI_VBI_TTXDT3 0x1b2f
+#define ENCI_MACV_N0 0x1b30
+#define ENCI_MACV_N1 0x1b31
+#define ENCI_MACV_N2 0x1b32
+#define ENCI_MACV_N3 0x1b33
+#define ENCI_MACV_N4 0x1b34
+#define ENCI_MACV_N5 0x1b35
+#define ENCI_MACV_N6 0x1b36
+#define ENCI_MACV_N7 0x1b37
+#define ENCI_MACV_N8 0x1b38
+#define ENCI_MACV_N9 0x1b39
+#define ENCI_MACV_N10 0x1b3a
+#define ENCI_MACV_N11 0x1b3b
+#define ENCI_MACV_N12 0x1b3c
+#define ENCI_MACV_N13 0x1b3d
+#define ENCI_MACV_N14 0x1b3e
+#define ENCI_MACV_N15 0x1b3f
+#define ENCI_MACV_N16 0x1b40
+#define ENCI_MACV_N17 0x1b41
+#define ENCI_MACV_N18 0x1b42
+#define ENCI_MACV_N19 0x1b43
+#define ENCI_MACV_N20 0x1b44
+#define ENCI_MACV_N21 0x1b45
+#define ENCI_MACV_N22 0x1b46
+#define ENCI_DBG_PX_RST 0x1b48
+#define ENCI_DBG_FLDLN_RST 0x1b49
+#define ENCI_DBG_PX_INT 0x1b4a
+#define ENCI_DBG_FLDLN_INT 0x1b4b
+#define ENCI_DBG_MAXPX 0x1b4c
+#define ENCI_DBG_MAXLN 0x1b4d
+#define ENCI_MACV_MAX_AMP 0x1b50
+#define ENCI_MACV_PULSE_LO 0x1b51
+#define ENCI_MACV_PULSE_HI 0x1b52
+#define ENCI_MACV_BKP_MAX 0x1b53
+#define ENCI_CFILT_CTRL 0x1b54
+#define ENCI_CFILT7 0x1b55
+#define ENCI_YC_DELAY 0x1b56
+#define ENCI_VIDEO_EN 0x1b57
+#define ENCI_DVI_HSO_BEGIN 0x1c00
+#define ENCI_DVI_HSO_END 0x1c01
+#define ENCI_DVI_VSO_BLINE_EVN 0x1c02
+#define ENCI_DVI_VSO_BLINE_ODD 0x1c03
+#define ENCI_DVI_VSO_ELINE_EVN 0x1c04
+#define ENCI_DVI_VSO_ELINE_ODD 0x1c05
+#define ENCI_DVI_VSO_BEGIN_EVN 0x1c06
+#define ENCI_DVI_VSO_BEGIN_ODD 0x1c07
+#define ENCI_DVI_VSO_END_EVN 0x1c08
+#define ENCI_DVI_VSO_END_ODD 0x1c09
+#define ENCI_CFILT_CTRL2 0x1c0a
+#define ENCI_DACSEL_0 0x1c0b
+#define ENCI_DACSEL_1 0x1c0c
+#define ENCP_DACSEL_0 0x1c0d
+#define ENCP_DACSEL_1 0x1c0e
+#define ENCP_MAX_LINE_SWITCH_POINT 0x1c0f
+#define ENCI_TST_EN 0x1c10
+#define ENCI_TST_MDSEL 0x1c11
+#define ENCI_TST_Y 0x1c12
+#define ENCI_TST_CB 0x1c13
+#define ENCI_TST_CR 0x1c14
+#define ENCI_TST_CLRBAR_STRT 0x1c15
+#define ENCI_TST_CLRBAR_WIDTH 0x1c16
+#define ENCI_TST_VDCNT_STSET 0x1c17
+#define ENCI_VFIFO2VD_CTL 0x1c18
+#define ENCI_VFIFO2VD_PIXEL_START 0x1c19
+#define ENCI_VFIFO2VD_PIXEL_END 0x1c1a
+#define ENCI_VFIFO2VD_LINE_TOP_START 0x1c1b
+#define ENCI_VFIFO2VD_LINE_TOP_END 0x1c1c
+#define ENCI_VFIFO2VD_LINE_BOT_START 0x1c1d
+#define ENCI_VFIFO2VD_LINE_BOT_END 0x1c1e
+#define ENCI_VFIFO2VD_CTL2 0x1c1f
+#define ENCT_VFIFO2VD_CTL 0x1c20
+#define ENCT_VFIFO2VD_PIXEL_START 0x1c21
+#define ENCT_VFIFO2VD_PIXEL_END 0x1c22
+#define ENCT_VFIFO2VD_LINE_TOP_START 0x1c23
+#define ENCT_VFIFO2VD_LINE_TOP_END 0x1c24
+#define ENCT_VFIFO2VD_LINE_BOT_START 0x1c25
+#define ENCT_VFIFO2VD_LINE_BOT_END 0x1c26
+#define ENCT_VFIFO2VD_CTL2 0x1c27
+#define ENCT_TST_EN 0x1c28
+#define ENCT_TST_MDSEL 0x1c29
+#define ENCT_TST_Y 0x1c2a
+#define ENCT_TST_CB 0x1c2b
+#define ENCT_TST_CR 0x1c2c
+#define ENCT_TST_CLRBAR_STRT 0x1c2d
+#define ENCT_TST_CLRBAR_WIDTH 0x1c2e
+#define ENCT_TST_VDCNT_STSET 0x1c2f
+#define ENCP_DVI_HSO_BEGIN 0x1c30
+#define ENCP_DVI_HSO_END 0x1c31
+#define ENCP_DVI_VSO_BLINE_EVN 0x1c32
+#define ENCP_DVI_VSO_BLINE_ODD 0x1c33
+#define ENCP_DVI_VSO_ELINE_EVN 0x1c34
+#define ENCP_DVI_VSO_ELINE_ODD 0x1c35
+#define ENCP_DVI_VSO_BEGIN_EVN 0x1c36
+#define ENCP_DVI_VSO_BEGIN_ODD 0x1c37
+#define ENCP_DVI_VSO_END_EVN 0x1c38
+#define ENCP_DVI_VSO_END_ODD 0x1c39
+#define ENCP_DE_H_BEGIN 0x1c3a
+#define ENCP_DE_H_END 0x1c3b
+#define ENCP_DE_V_BEGIN_EVEN 0x1c3c
+#define ENCP_DE_V_END_EVEN 0x1c3d
+#define ENCP_DE_V_BEGIN_ODD 0x1c3e
+#define ENCP_DE_V_END_ODD 0x1c3f
+#define ENCI_SYNC_LINE_LENGTH 0x1c40
+#define ENCI_SYNC_PIXEL_EN 0x1c41
+#define ENCI_SYNC_TO_LINE_EN 0x1c42
+#define ENCI_SYNC_TO_PIXEL 0x1c43
+#define ENCP_SYNC_LINE_LENGTH 0x1c44
+#define ENCP_SYNC_PIXEL_EN 0x1c45
+#define ENCP_SYNC_TO_LINE_EN 0x1c46
+#define ENCP_SYNC_TO_PIXEL 0x1c47
+#define ENCT_SYNC_LINE_LENGTH 0x1c48
+#define ENCT_SYNC_PIXEL_EN 0x1c49
+#define ENCT_SYNC_TO_LINE_EN 0x1c4a
+#define ENCT_SYNC_TO_PIXEL 0x1c4b
+#define ENCL_SYNC_LINE_LENGTH 0x1c4c
+#define ENCL_SYNC_PIXEL_EN 0x1c4d
+#define ENCL_SYNC_TO_LINE_EN 0x1c4e
+#define ENCL_SYNC_TO_PIXEL 0x1c4f
+#define ENCP_VFIFO2VD_CTL2 0x1c50
+#define VENC_DVI_SETTING_MORE 0x1c51
+#define VENC_VDAC_DAC4_FILT_CTRL0 0x1c54
+#define VENC_VDAC_DAC4_FILT_CTRL1 0x1c55
+#define VENC_VDAC_DAC5_FILT_CTRL0 0x1c56
+#define VENC_VDAC_DAC5_FILT_CTRL1 0x1c57
+#define VENC_VDAC_DAC0_FILT_CTRL0 0x1c58
+#define VENC_VDAC_DAC0_FILT_CTRL1 0x1c59
+#define VENC_VDAC_DAC1_FILT_CTRL0 0x1c5a
+#define VENC_VDAC_DAC1_FILT_CTRL1 0x1c5b
+#define VENC_VDAC_DAC2_FILT_CTRL0 0x1c5c
+#define VENC_VDAC_DAC2_FILT_CTRL1 0x1c5d
+#define VENC_VDAC_DAC3_FILT_CTRL0 0x1c5e
+#define VENC_VDAC_DAC3_FILT_CTRL1 0x1c5f
+#define ENCT_VIDEO_EN 0x1c60
+#define ENCT_VIDEO_Y_SCL 0x1c61
+#define ENCT_VIDEO_PB_SCL 0x1c62
+#define ENCT_VIDEO_PR_SCL 0x1c63
+#define ENCT_VIDEO_Y_OFFST 0x1c64
+#define ENCT_VIDEO_PB_OFFST 0x1c65
+#define ENCT_VIDEO_PR_OFFST 0x1c66
+#define ENCT_VIDEO_MODE 0x1c67
+#define ENCT_VIDEO_MODE_ADV 0x1c68
+#define ENCT_DBG_PX_RST 0x1c69
+#define ENCT_DBG_LN_RST 0x1c6a
+#define ENCT_DBG_PX_INT 0x1c6b
+#define ENCT_DBG_LN_INT 0x1c6c
+#define ENCT_VIDEO_YFP1_HTIME 0x1c6d
+#define ENCT_VIDEO_YFP2_HTIME 0x1c6e
+#define ENCT_VIDEO_YC_DLY 0x1c6f
+#define ENCT_VIDEO_MAX_PXCNT 0x1c70
+#define ENCT_VIDEO_HAVON_END 0x1c71
+#define ENCT_VIDEO_HAVON_BEGIN 0x1c72
+#define ENCT_VIDEO_VAVON_ELINE 0x1c73
+#define ENCT_VIDEO_VAVON_BLINE 0x1c74
+#define ENCT_VIDEO_HSO_BEGIN 0x1c75
+#define ENCT_VIDEO_HSO_END 0x1c76
+#define ENCT_VIDEO_VSO_BEGIN 0x1c77
+#define ENCT_VIDEO_VSO_END 0x1c78
+#define ENCT_VIDEO_VSO_BLINE 0x1c79
+#define ENCT_VIDEO_VSO_ELINE 0x1c7a
+#define ENCT_VIDEO_MAX_LNCNT 0x1c7b
+#define ENCT_VIDEO_BLANKY_VAL 0x1c7c
+#define ENCT_VIDEO_BLANKPB_VAL 0x1c7d
+#define ENCT_VIDEO_BLANKPR_VAL 0x1c7e
+#define ENCT_VIDEO_HOFFST 0x1c7f
+#define ENCT_VIDEO_VOFFST 0x1c80
+#define ENCT_VIDEO_RGB_CTRL 0x1c81
+#define ENCT_VIDEO_FILT_CTRL 0x1c82
+#define ENCT_VIDEO_OFLD_VPEQ_OFST 0x1c83
+#define ENCT_VIDEO_OFLD_VOAV_OFST 0x1c84
+#define ENCT_VIDEO_MATRIX_CB 0x1c85
+#define ENCT_VIDEO_MATRIX_CR 0x1c86
+#define ENCT_VIDEO_RGBIN_CTRL 0x1c87
+#define ENCT_MAX_LINE_SWITCH_POINT 0x1c88
+#define ENCT_DACSEL_0 0x1c89
+#define ENCT_DACSEL_1 0x1c8a
+#define ENCL_VFIFO2VD_CTL 0x1c90
+#define ENCL_VFIFO2VD_PIXEL_START 0x1c91
+#define ENCL_VFIFO2VD_PIXEL_END 0x1c92
+#define ENCL_VFIFO2VD_LINE_TOP_START 0x1c93
+#define ENCL_VFIFO2VD_LINE_TOP_END 0x1c94
+#define ENCL_VFIFO2VD_LINE_BOT_START 0x1c95
+#define ENCL_VFIFO2VD_LINE_BOT_END 0x1c96
+#define ENCL_VFIFO2VD_CTL2 0x1c97
+#define ENCL_TST_EN 0x1c98
+#define ENCL_TST_MDSEL 0x1c99
+#define ENCL_TST_Y 0x1c9a
+#define ENCL_TST_CB 0x1c9b
+#define ENCL_TST_CR 0x1c9c
+#define ENCL_TST_CLRBAR_STRT 0x1c9d
+#define ENCL_TST_CLRBAR_WIDTH 0x1c9e
+#define ENCL_TST_VDCNT_STSET 0x1c9f
+#define ENCL_VIDEO_EN 0x1ca0
+#define ENCL_VIDEO_Y_SCL 0x1ca1
+#define ENCL_VIDEO_PB_SCL 0x1ca2
+#define ENCL_VIDEO_PR_SCL 0x1ca3
+#define ENCL_VIDEO_Y_OFFST 0x1ca4
+#define ENCL_VIDEO_PB_OFFST 0x1ca5
+#define ENCL_VIDEO_PR_OFFST 0x1ca6
+#define ENCL_VIDEO_MODE 0x1ca7
+#define ENCL_VIDEO_MODE_ADV 0x1ca8
+#define ENCL_DBG_PX_RST 0x1ca9
+#define ENCL_DBG_LN_RST 0x1caa
+#define ENCL_DBG_PX_INT 0x1cab
+#define ENCL_DBG_LN_INT 0x1cac
+#define ENCL_VIDEO_YFP1_HTIME 0x1cad
+#define ENCL_VIDEO_YFP2_HTIME 0x1cae
+#define ENCL_VIDEO_YC_DLY 0x1caf
+#define ENCL_VIDEO_MAX_PXCNT 0x1cb0
+#define ENCL_VIDEO_HAVON_END 0x1cb1
+#define ENCL_VIDEO_HAVON_BEGIN 0x1cb2
+#define ENCL_VIDEO_VAVON_ELINE 0x1cb3
+#define ENCL_VIDEO_VAVON_BLINE 0x1cb4
+#define ENCL_VIDEO_HSO_BEGIN 0x1cb5
+#define ENCL_VIDEO_HSO_END 0x1cb6
+#define ENCL_VIDEO_VSO_BEGIN 0x1cb7
+#define ENCL_VIDEO_VSO_END 0x1cb8
+#define ENCL_VIDEO_VSO_BLINE 0x1cb9
+#define ENCL_VIDEO_VSO_ELINE 0x1cba
+#define ENCL_VIDEO_MAX_LNCNT 0x1cbb
+#define ENCL_VIDEO_BLANKY_VAL 0x1cbc
+#define ENCL_VIDEO_BLANKPB_VAL 0x1cbd
+#define ENCL_VIDEO_BLANKPR_VAL 0x1cbe
+#define ENCL_VIDEO_HOFFST 0x1cbf
+#define ENCL_VIDEO_VOFFST 0x1cc0
+#define ENCL_VIDEO_RGB_CTRL 0x1cc1
+#define ENCL_VIDEO_FILT_CTRL 0x1cc2
+#define ENCL_VIDEO_OFLD_VPEQ_OFST 0x1cc3
+#define ENCL_VIDEO_OFLD_VOAV_OFST 0x1cc4
+#define ENCL_VIDEO_MATRIX_CB 0x1cc5
+#define ENCL_VIDEO_MATRIX_CR 0x1cc6
+#define ENCL_VIDEO_RGBIN_CTRL 0x1cc7
+#define ENCL_MAX_LINE_SWITCH_POINT 0x1cc8
+#define ENCL_DACSEL_0 0x1cc9
+#define ENCL_DACSEL_1 0x1cca
+#define RDMA_AHB_START_ADDR_MAN 0x1100
+#define RDMA_AHB_END_ADDR_MAN 0x1101
+#define RDMA_AHB_START_ADDR_1 0x1102
+#define RDMA_AHB_END_ADDR_1 0x1103
+#define RDMA_AHB_START_ADDR_2 0x1104
+#define RDMA_AHB_END_ADDR_2 0x1105
+#define RDMA_AHB_START_ADDR_3 0x1106
+#define RDMA_AHB_END_ADDR_3 0x1107
+#define RDMA_AHB_START_ADDR_4 0x1108
+#define RDMA_AHB_END_ADDR_4 0x1109
+#define RDMA_AHB_START_ADDR_5 0x110a
+#define RDMA_AHB_END_ADDR_5 0x110b
+#define RDMA_AHB_START_ADDR_6 0x110c
+#define RDMA_AHB_END_ADDR_6 0x110d
+#define RDMA_AHB_START_ADDR_7 0x110e
+#define RDMA_AHB_END_ADDR_7 0x110f
+#define RDMA_ACCESS_AUTO 0x1110
+#define RDMA_ACCESS_AUTO2 0x1111
+#define RDMA_ACCESS_AUTO3 0x1112
+#define RDMA_ACCESS_MAN 0x1113
+#define RDMA_CTRL 0x1114
+#define RDMA_STATUS 0x1115
+#define RDMA_STATUS2 0x1116
+#define RDMA_STATUS3 0x1117
+#define L_GAMMA_CNTL_PORT 0x1400
+#define L_GAMMA_DATA_PORT 0x1401
+#define L_GAMMA_ADDR_PORT 0x1402
+#define L_GAMMA_VCOM_HSWITCH_ADDR 0x1403
+#define L_RGB_BASE_ADDR 0x1405
+#define L_RGB_COEFF_ADDR 0x1406
+#define L_POL_CNTL_ADDR 0x1407
+#define L_DITH_CNTL_ADDR 0x1408
+#define L_GAMMA_PROBE_CTRL 0x1409
+#define L_GAMMA_PROBE_COLOR_L 0x140a
+#define L_GAMMA_PROBE_COLOR_H 0x140b
+#define L_GAMMA_PROBE_HL_COLOR 0x140c
+#define L_GAMMA_PROBE_POS_X 0x140d
+#define L_GAMMA_PROBE_POS_Y 0x140e
+#define L_STH1_HS_ADDR 0x1410
+#define L_STH1_HE_ADDR 0x1411
+#define L_STH1_VS_ADDR 0x1412
+#define L_STH1_VE_ADDR 0x1413
+#define L_STH2_HS_ADDR 0x1414
+#define L_STH2_HE_ADDR 0x1415
+#define L_STH2_VS_ADDR 0x1416
+#define L_STH2_VE_ADDR 0x1417
+#define L_OEH_HS_ADDR 0x1418
+#define L_OEH_HE_ADDR 0x1419
+#define L_OEH_VS_ADDR 0x141a
+#define L_OEH_VE_ADDR 0x141b
+#define L_VCOM_HSWITCH_ADDR 0x141c
+#define L_VCOM_VS_ADDR 0x141d
+#define L_VCOM_VE_ADDR 0x141e
+#define L_CPV1_HS_ADDR 0x141f
+#define L_CPV1_HE_ADDR 0x1420
+#define L_CPV1_VS_ADDR 0x1421
+#define L_CPV1_VE_ADDR 0x1422
+#define L_CPV2_HS_ADDR 0x1423
+#define L_CPV2_HE_ADDR 0x1424
+#define L_CPV2_VS_ADDR 0x1425
+#define L_CPV2_VE_ADDR 0x1426
+#define L_STV1_HS_ADDR 0x1427
+#define L_STV1_HE_ADDR 0x1428
+#define L_STV1_VS_ADDR 0x1429
+#define L_STV1_VE_ADDR 0x142a
+#define L_STV2_HS_ADDR 0x142b
+#define L_STV2_HE_ADDR 0x142c
+#define L_STV2_VS_ADDR 0x142d
+#define L_STV2_VE_ADDR 0x142e
+#define L_OEV1_HS_ADDR 0x142f
+#define L_OEV1_HE_ADDR 0x1430
+#define L_OEV1_VS_ADDR 0x1431
+#define L_OEV1_VE_ADDR 0x1432
+#define L_OEV2_HS_ADDR 0x1433
+#define L_OEV2_HE_ADDR 0x1434
+#define L_OEV2_VS_ADDR 0x1435
+#define L_OEV2_VE_ADDR 0x1436
+#define L_OEV3_HS_ADDR 0x1437
+#define L_OEV3_HE_ADDR 0x1438
+#define L_OEV3_VS_ADDR 0x1439
+#define L_OEV3_VE_ADDR 0x143a
+#define L_LCD_PWR_ADDR 0x143b
+#define L_LCD_PWM0_LO_ADDR 0x143c
+#define L_LCD_PWM0_HI_ADDR 0x143d
+#define L_LCD_PWM1_LO_ADDR 0x143e
+#define L_LCD_PWM1_HI_ADDR 0x143f
+#define L_INV_CNT_ADDR 0x1440
+#define L_TCON_MISC_SEL_ADDR 0x1441
+#define L_DUAL_PORT_CNTL_ADDR 0x1442
+#define MLVDS_CLK_CTL1_HI 0x1443
+#define MLVDS_CLK_CTL1_LO 0x1444
+#define L_TCON_DOUBLE_CTL 0x1449
+#define L_TCON_PATTERN_HI 0x144a
+#define L_TCON_PATTERN_LO 0x144b
+#define LDIM_BL_ADDR_PORT 0x144e
+#define LDIM_BL_DATA_PORT 0x144f
+#define L_DE_HS_ADDR 0x1451
+#define L_DE_HE_ADDR 0x1452
+#define L_DE_VS_ADDR 0x1453
+#define L_DE_VE_ADDR 0x1454
+#define L_HSYNC_HS_ADDR 0x1455
+#define L_HSYNC_HE_ADDR 0x1456
+#define L_HSYNC_VS_ADDR 0x1457
+#define L_HSYNC_VE_ADDR 0x1458
+#define L_VSYNC_HS_ADDR 0x1459
+#define L_VSYNC_HE_ADDR 0x145a
+#define L_VSYNC_VS_ADDR 0x145b
+#define L_VSYNC_VE_ADDR 0x145c
+#define L_LCD_MCU_CTL 0x145d
+#define DUAL_MLVDS_CTL 0x1460
+#define DUAL_MLVDS_LINE_START 0x1461
+#define DUAL_MLVDS_LINE_END 0x1462
+#define DUAL_MLVDS_PIXEL_W_START_L 0x1463
+#define DUAL_MLVDS_PIXEL_W_END_L 0x1464
+#define DUAL_MLVDS_PIXEL_W_START_R 0x1465
+#define DUAL_MLVDS_PIXEL_W_END_R 0x1466
+#define DUAL_MLVDS_PIXEL_R_START_L 0x1467
+#define DUAL_MLVDS_PIXEL_R_CNT_L 0x1468
+#define DUAL_MLVDS_PIXEL_R_START_R 0x1469
+#define DUAL_MLVDS_PIXEL_R_CNT_R 0x146a
+#define V_INVERSION_PIXEL 0x1470
+#define V_INVERSION_LINE 0x1471
+#define V_INVERSION_CONTROL 0x1472
+#define MLVDS2_CONTROL 0x1474
+#define MLVDS2_CONFIG_HI 0x1475
+#define MLVDS2_CONFIG_LO 0x1476
+#define MLVDS2_DUAL_GATE_WR_START 0x1477
+#define MLVDS2_DUAL_GATE_WR_END 0x1478
+#define MLVDS2_DUAL_GATE_RD_START 0x1479
+#define MLVDS2_DUAL_GATE_RD_END 0x147a
+#define MLVDS2_SECOND_RESET_CTL 0x147b
+#define MLVDS2_DUAL_GATE_CTL_HI 0x147c
+#define MLVDS2_DUAL_GATE_CTL_LO 0x147d
+#define MLVDS2_RESET_CONFIG_HI 0x147e
+#define MLVDS2_RESET_CONFIG_LO 0x147f
+#define GAMMA_CNTL_PORT 0x1480
+#define GAMMA_DATA_PORT 0x1481
+#define GAMMA_ADDR_PORT 0x1482
+#define GAMMA_VCOM_HSWITCH_ADDR 0x1483
+#define RGB_BASE_ADDR 0x1485
+#define RGB_COEFF_ADDR 0x1486
+#define POL_CNTL_ADDR 0x1487
+#define DITH_CNTL_ADDR 0x1488
+#define GAMMA_PROBE_CTRL 0x1489
+#define GAMMA_PROBE_COLOR_L 0x148a
+#define GAMMA_PROBE_COLOR_H 0x148b
+#define GAMMA_PROBE_HL_COLOR 0x148c
+#define GAMMA_PROBE_POS_X 0x148d
+#define GAMMA_PROBE_POS_Y 0x148e
+#define STH1_HS_ADDR 0x1490
+#define STH1_HE_ADDR 0x1491
+#define STH1_VS_ADDR 0x1492
+#define STH1_VE_ADDR 0x1493
+#define STH2_HS_ADDR 0x1494
+#define STH2_HE_ADDR 0x1495
+#define STH2_VS_ADDR 0x1496
+#define STH2_VE_ADDR 0x1497
+#define OEH_HS_ADDR 0x1498
+#define OEH_HE_ADDR 0x1499
+#define OEH_VS_ADDR 0x149a
+#define OEH_VE_ADDR 0x149b
+#define VCOM_HSWITCH_ADDR 0x149c
+#define VCOM_VS_ADDR 0x149d
+#define VCOM_VE_ADDR 0x149e
+#define CPV1_HS_ADDR 0x149f
+#define CPV1_HE_ADDR 0x14a0
+#define CPV1_VS_ADDR 0x14a1
+#define CPV1_VE_ADDR 0x14a2
+#define CPV2_HS_ADDR 0x14a3
+#define CPV2_HE_ADDR 0x14a4
+#define CPV2_VS_ADDR 0x14a5
+#define CPV2_VE_ADDR 0x14a6
+#define STV1_HS_ADDR 0x14a7
+#define STV1_HE_ADDR 0x14a8
+#define STV1_VS_ADDR 0x14a9
+#define STV1_VE_ADDR 0x14aa
+#define STV2_HS_ADDR 0x14ab
+#define STV2_HE_ADDR 0x14ac
+#define STV2_VS_ADDR 0x14ad
+#define STV2_VE_ADDR 0x14ae
+#define OEV1_HS_ADDR 0x14af
+#define OEV1_HE_ADDR 0x14b0
+#define OEV1_VS_ADDR 0x14b1
+#define OEV1_VE_ADDR 0x14b2
+#define OEV2_HS_ADDR 0x14b3
+#define OEV2_HE_ADDR 0x14b4
+#define OEV2_VS_ADDR 0x14b5
+#define OEV2_VE_ADDR 0x14b6
+#define OEV3_HS_ADDR 0x14b7
+#define OEV3_HE_ADDR 0x14b8
+#define OEV3_VS_ADDR 0x14b9
+#define OEV3_VE_ADDR 0x14ba
+#define LCD_PWR_ADDR 0x14bb
+#define LCD_PWM0_LO_ADDR 0x14bc
+#define LCD_PWM0_HI_ADDR 0x14bd
+#define LCD_PWM1_LO_ADDR 0x14be
+#define LCD_PWM1_HI_ADDR 0x14bf
+#define INV_CNT_ADDR 0x14c0
+#define TCON_MISC_SEL_ADDR 0x14c1
+#define DUAL_PORT_CNTL_ADDR 0x14c2
+#define MLVDS_CONTROL 0x14c3
+#define MLVDS_RESET_PATTERN_HI 0x14c4
+#define MLVDS_RESET_PATTERN_LO 0x14c5
+#define MLVDS_RESET_PATTERN_EXT 0x14c6
+#define MLVDS_CONFIG_HI 0x14c7
+#define MLVDS_CONFIG_LO 0x14c8
+#define TCON_DOUBLE_CTL 0x14c9
+#define TCON_PATTERN_HI 0x14ca
+#define TCON_PATTERN_LO 0x14cb
+#define TCON_CONTROL_HI 0x14cc
+#define TCON_CONTROL_LO 0x14cd
+#define LVDS_BLANK_DATA_HI 0x14ce
+#define LVDS_BLANK_DATA_LO 0x14cf
+#define LVDS_PACK_CNTL_ADDR 0x14d0
+#define DE_HS_ADDR 0x14d1
+#define DE_HE_ADDR 0x14d2
+#define DE_VS_ADDR 0x14d3
+#define DE_VE_ADDR 0x14d4
+#define HSYNC_HS_ADDR 0x14d5
+#define HSYNC_HE_ADDR 0x14d6
+#define HSYNC_VS_ADDR 0x14d7
+#define HSYNC_VE_ADDR 0x14d8
+#define VSYNC_HS_ADDR 0x14d9
+#define VSYNC_HE_ADDR 0x14da
+#define VSYNC_VS_ADDR 0x14db
+#define VSYNC_VE_ADDR 0x14dc
+#define LCD_MCU_CTL 0x14dd
+#define LCD_MCU_DATA_0 0x14de
+#define LCD_MCU_DATA_1 0x14df
+#define LVDS_GEN_CNTL 0x14e0
+#define LVDS_PHY_CNTL0 0x14e1
+#define LVDS_PHY_CNTL1 0x14e2
+#define LVDS_PHY_CNTL2 0x14e3
+#define LVDS_PHY_CNTL3 0x14e4
+#define LVDS_PHY_CNTL4 0x14e5
+#define LVDS_PHY_CNTL5 0x14e6
+#define LVDS_SRG_TEST 0x14e8
+#define LVDS_BIST_MUX0 0x14e9
+#define LVDS_BIST_MUX1 0x14ea
+#define LVDS_BIST_FIXED0 0x14eb
+#define LVDS_BIST_FIXED1 0x14ec
+#define LVDS_BIST_CNTL0 0x14ed
+#define LVDS_CLKB_CLKA 0x14ee
+#define LVDS_PHY_CLK_CNTL 0x14ef
+#define LVDS_SER_EN 0x14f0
+#define LVDS_PHY_CNTL6 0x14f1
+#define LVDS_PHY_CNTL7 0x14f2
+#define LVDS_PHY_CNTL8 0x14f3
+#define MLVDS_CLK_CTL0_HI 0x14f4
+#define MLVDS_CLK_CTL0_LO 0x14f5
+#define MLVDS_DUAL_GATE_WR_START 0x14f6
+#define MLVDS_DUAL_GATE_WR_END 0x14f7
+#define MLVDS_DUAL_GATE_RD_START 0x14f8
+#define MLVDS_DUAL_GATE_RD_END 0x14f9
+#define MLVDS_SECOND_RESET_CTL 0x14fa
+#define MLVDS_DUAL_GATE_CTL_HI 0x14fb
+#define MLVDS_DUAL_GATE_CTL_LO 0x14fc
+#define MLVDS_RESET_CONFIG_HI 0x14fd
+#define MLVDS_RESET_CONFIG_LO 0x14fe
+#define VPU_OSD1_MMC_CTRL 0x2701
+#define VPU_OSD2_MMC_CTRL 0x2702
+#define VPU_VD1_MMC_CTRL 0x2703
+#define VPU_VD2_MMC_CTRL 0x2704
+#define VPU_DI_IF1_MMC_CTRL 0x2705
+#define VPU_DI_MEM_MMC_CTRL 0x2706
+#define VPU_DI_INP_MMC_CTRL 0x2707
+#define VPU_DI_MTNRD_MMC_CTRL 0x2708
+#define VPU_DI_CHAN2_MMC_CTRL 0x2709
+#define VPU_DI_MTNWR_MMC_CTRL 0x270a
+#define VPU_DI_NRWR_MMC_CTRL 0x270b
+#define VPU_DI_DIWR_MMC_CTRL 0x270c
+#define VPU_VDIN0_MMC_CTRL 0x270d
+#define VPU_VDIN1_MMC_CTRL 0x270e
+#define VPU_BT656_MMC_CTRL 0x270f
+#define VPU_TVD3D_MMC_CTRL 0x2710
+#define VPU_TVDVBI_MMC_CTRL 0x2711
+#define VPU_TVDVBI_VSLATCH_ADDR 0x2712
+#define VPU_TVDVBI_WRRSP_ADDR 0x2713
+#define VPU_VDIN_PRE_ARB_CTRL 0x2714
+#define VPU_VDISP_PRE_ARB_CTRL 0x2715
+#define VPU_VPUARB2_PRE_ARB_CTRL 0x2716
+#define VPU_OSD3_MMC_CTRL 0x2717
+#define VPU_OSD4_MMC_CTRL 0x2718
+#define VPU_VD3_MMC_CTRL 0x2719
+#define VPU_VIU_VENC_MUX_CTRL 0x271a
+#define		VIU1_SEL_VENC_MASK	0x3
+#define		VIU1_SEL_VENC_ENCL	0
+#define		VIU1_SEL_VENC_ENCI	1
+#define		VIU1_SEL_VENC_ENCP	2
+#define		VIU1_SEL_VENC_ENCT	3
+#define		VIU2_SEL_VENC_MASK	0xc
+#define		VIU2_SEL_VENC_ENCL	0
+#define		VIU2_SEL_VENC_ENCI	(1 << 2)
+#define		VIU2_SEL_VENC_ENCP	(2 << 2)
+#define		VIU2_SEL_VENC_ENCT	(3 << 2)
+#define VPU_HDMI_SETTING 0x271b
+#define ENCI_INFO_READ 0x271c
+#define ENCP_INFO_READ 0x271d
+#define ENCT_INFO_READ 0x271e
+#define ENCL_INFO_READ 0x271f
+#define VPU_SW_RESET 0x2720
+#define VPU_D2D3_MMC_CTRL 0x2721
+#define VPU_CONT_MMC_CTRL 0x2722
+#define VPU_CLK_GATE 0x2723
+#define VPU_RDMA_MMC_CTRL 0x2724
+#define VPU_MEM_PD_REG0 0x2725
+#define VPU_MEM_PD_REG1 0x2726
+#define VPU_HDMI_DATA_OVR 0x2727
+#define VPU_PROT1_MMC_CTRL 0x2728
+#define VPU_PROT2_MMC_CTRL 0x2729
+#define VPU_PROT3_MMC_CTRL 0x272a
+#define VPU_ARB4_V1_MMC_CTRL 0x272b
+#define VPU_ARB4_V2_MMC_CTRL 0x272c
+#define VPU_VPU_PWM_V0 0x2730
+#define VPU_VPU_PWM_V1 0x2731
+#define VPU_VPU_PWM_V2 0x2732
+#define VPU_VPU_PWM_V3 0x2733
+#define VPU_VPU_PWM_H0 0x2734
+#define VPU_VPU_PWM_H1 0x2735
+#define VPU_VPU_PWM_H2 0x2736
+#define VPU_VPU_PWM_H3 0x2737
+#define VPU_MISC_CTRL 0x2740
+#define VPU_ISP_GCLK_CTRL0 0x2741
+#define VPU_ISP_GCLK_CTRL1 0x2742
+#define VPU_HDMI_FMT_CTRL 0x2743
+#define VPU_VDIN_ASYNC_HOLD_CTRL 0x2743
+#define VPU_VDISP_ASYNC_HOLD_CTRL 0x2744
+#define VPU_VPUARB2_ASYNC_HOLD_CTRL 0x2745
+
+#define VPU_PROT1_CLK_GATE 0x2750
+#define VPU_PROT1_GEN_CNTL 0x2751
+#define VPU_PROT1_X_START_END 0x2752
+#define VPU_PROT1_Y_START_END 0x2753
+#define VPU_PROT1_Y_LEN_STEP 0x2754
+#define VPU_PROT1_RPT_LOOP 0x2755
+#define VPU_PROT1_RPT_PAT 0x2756
+#define VPU_PROT1_DDR 0x2757
+#define VPU_PROT1_RBUF_ROOM 0x2758
+#define VPU_PROT1_STAT_0 0x2759
+#define VPU_PROT1_STAT_1 0x275a
+#define VPU_PROT1_STAT_2 0x275b
+#define VPU_PROT1_REQ_ONOFF 0x275c
+#define VPU_PROT2_CLK_GATE 0x2760
+#define VPU_PROT2_GEN_CNTL 0x2761
+#define VPU_PROT2_X_START_END 0x2762
+#define VPU_PROT2_Y_START_END 0x2763
+#define VPU_PROT2_Y_LEN_STEP 0x2764
+#define VPU_PROT2_RPT_LOOP 0x2765
+#define VPU_PROT2_RPT_PAT 0x2766
+#define VPU_PROT2_DDR 0x2767
+#define VPU_PROT2_RBUF_ROOM 0x2768
+#define VPU_PROT2_STAT_0 0x2769
+#define VPU_PROT2_STAT_1 0x276a
+#define VPU_PROT2_STAT_2 0x276b
+#define VPU_PROT2_REQ_ONOFF 0x276c
+#define VPU_PROT3_CLK_GATE 0x2770
+#define VPU_PROT3_GEN_CNTL 0x2771
+#define VPU_PROT3_X_START_END 0x2772
+#define VPU_PROT3_Y_START_END 0x2773
+#define VPU_PROT3_Y_LEN_STEP 0x2774
+#define VPU_PROT3_RPT_LOOP 0x2775
+#define VPU_PROT3_RPT_PAT 0x2776
+#define VPU_PROT3_DDR 0x2777
+#define VPU_PROT3_RBUF_ROOM 0x2778
+#define VPU_PROT3_STAT_0 0x2779
+#define VPU_PROT3_STAT_1 0x277a
+#define VPU_PROT3_STAT_2 0x277b
+#define VPU_PROT3_REQ_ONOFF 0x277c
+#define VPU_RDARB_MODE_L1C1 0x2790
+#define VPU_RDARB_MODE_L1C2 0x2799
+#define VPU_RDARB_MODE_L2C1 0x279d
+#define VPU_WRARB_MODE_L2C1 0x27a2
+
+/* osd super scale */
+#define OSDSR_HV_SIZEIN 0x3130
+#define OSDSR_CTRL_MODE 0x3131
+#define OSDSR_ABIC_HCOEF 0x3132
+#define OSDSR_YBIC_HCOEF 0x3133
+#define OSDSR_CBIC_HCOEF 0x3134
+#define OSDSR_ABIC_VCOEF 0x3135
+#define OSDSR_YBIC_VCOEF 0x3136
+#define OSDSR_CBIC_VCOEF 0x3137
+#define OSDSR_VAR_PARA 0x3138
+#define OSDSR_CONST_PARA 0x3139
+#define OSDSR_RKE_EXTWIN 0x313a
+#define OSDSR_UK_GRAD2DDIAG_TH_RATE 0x313b
+#define OSDSR_UK_GRAD2DDIAG_LIMIT 0x313c
+#define OSDSR_UK_GRAD2DADJA_TH_RATE 0x313d
+#define OSDSR_UK_GRAD2DADJA_LIMIT 0x313e
+#define OSDSR_UK_BST_GAIN 0x313f
+#define OSDSR_HVBLEND_TH 0x3140
+#define OSDSR_DEMO_WIND_TB 0x3141
+#define OSDSR_DEMO_WIND_LR 0x3142
+#define OSDSR_INT_BLANK_NUM 0x3143
+#define OSDSR_FRM_END_STAT 0x3144
+#define OSDSR_ABIC_HCOEF0 0x3145
+#define OSDSR_YBIC_HCOEF0 0x3146
+#define OSDSR_CBIC_HCOEF0 0x3147
+#define OSDSR_ABIC_VCOEF0 0x3148
+#define OSDSR_YBIC_VCOEF0 0x3149
+#define OSDSR_CBIC_VCOEF0 0x314a
+
+#endif /* __MESON_REGISTERS_H */
diff --git a/drivers/video/meson/meson_vclk.c b/drivers/video/meson/meson_vclk.c
new file mode 100644
index 0000000000..693e0ebe39
--- /dev/null
+++ b/drivers/video/meson/meson_vclk.c
@@ -0,0 +1,893 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic Meson Video Processing Unit driver
+ *
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <edid.h>
+#include "meson_vpu.h"
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+
+#define writel_bits(mask, val, addr) \
+	writel((readl(addr) & ~(mask)) | (val), addr)
+
+enum {
+	MESON_VCLK_TARGET_CVBS = 0,
+	MESON_VCLK_TARGET_HDMI = 1,
+	MESON_VCLK_TARGET_DMT = 2,
+};
+
+/* HHI Registers */
+#define HHI_VID_PLL_CLK_DIV	0x1a0 /* 0x68 offset in data sheet */
+#define VID_PLL_EN		BIT(19)
+#define VID_PLL_BYPASS		BIT(18)
+#define VID_PLL_PRESET		BIT(15)
+#define HHI_VIID_CLK_DIV	0x128 /* 0x4a offset in data sheet */
+#define VCLK2_DIV_MASK		0xff
+#define VCLK2_DIV_EN		BIT(16)
+#define VCLK2_DIV_RESET		BIT(17)
+#define CTS_VDAC_SEL_MASK	(0xf << 28)
+#define CTS_VDAC_SEL_SHIFT	28
+#define HHI_VIID_CLK_CNTL	0x12c /* 0x4b offset in data sheet */
+#define VCLK2_EN		BIT(19)
+#define VCLK2_SEL_MASK		(0x7 << 16)
+#define VCLK2_SEL_SHIFT		16
+#define VCLK2_SOFT_RESET	BIT(15)
+#define VCLK2_DIV1_EN		BIT(0)
+#define HHI_VID_CLK_DIV		0x164 /* 0x59 offset in data sheet */
+#define VCLK_DIV_MASK		0xff
+#define VCLK_DIV_EN		BIT(16)
+#define VCLK_DIV_RESET		BIT(17)
+#define CTS_ENCP_SEL_MASK	(0xf << 24)
+#define CTS_ENCP_SEL_SHIFT	24
+#define CTS_ENCI_SEL_MASK	(0xf << 28)
+#define CTS_ENCI_SEL_SHIFT	28
+#define HHI_VID_CLK_CNTL	0x17c /* 0x5f offset in data sheet */
+#define VCLK_EN			BIT(19)
+#define VCLK_SEL_MASK		(0x7 << 16)
+#define VCLK_SEL_SHIFT		16
+#define VCLK_SOFT_RESET		BIT(15)
+#define VCLK_DIV1_EN		BIT(0)
+#define VCLK_DIV2_EN		BIT(1)
+#define VCLK_DIV4_EN		BIT(2)
+#define VCLK_DIV6_EN		BIT(3)
+#define VCLK_DIV12_EN		BIT(4)
+#define HHI_VID_CLK_CNTL2	0x194 /* 0x65 offset in data sheet */
+#define CTS_ENCI_EN		BIT(0)
+#define CTS_ENCP_EN		BIT(2)
+#define CTS_VDAC_EN		BIT(4)
+#define HDMI_TX_PIXEL_EN	BIT(5)
+#define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 offset in data sheet */
+#define HDMI_TX_PIXEL_SEL_MASK	(0xf << 16)
+#define HDMI_TX_PIXEL_SEL_SHIFT	16
+#define CTS_HDMI_SYS_SEL_MASK	(0x7 << 9)
+#define CTS_HDMI_SYS_DIV_MASK	(0x7f)
+#define CTS_HDMI_SYS_EN		BIT(8)
+
+#define HHI_HDMI_PLL_CNTL	0x320 /* 0xc8 offset in data sheet */
+#define HHI_HDMI_PLL_CNTL2	0x324 /* 0xc9 offset in data sheet */
+#define HHI_HDMI_PLL_CNTL3	0x328 /* 0xca offset in data sheet */
+#define HHI_HDMI_PLL_CNTL4	0x32C /* 0xcb offset in data sheet */
+#define HHI_HDMI_PLL_CNTL5	0x330 /* 0xcc offset in data sheet */
+#define HHI_HDMI_PLL_CNTL6	0x334 /* 0xcd offset in data sheet */
+
+#define HDMI_PLL_RESET		BIT(28)
+#define HDMI_PLL_LOCK		BIT(31)
+
+/* VID PLL Dividers */
+enum {
+	VID_PLL_DIV_1 = 0,
+	VID_PLL_DIV_2,
+	VID_PLL_DIV_2p5,
+	VID_PLL_DIV_3,
+	VID_PLL_DIV_3p5,
+	VID_PLL_DIV_3p75,
+	VID_PLL_DIV_4,
+	VID_PLL_DIV_5,
+	VID_PLL_DIV_6,
+	VID_PLL_DIV_6p25,
+	VID_PLL_DIV_7,
+	VID_PLL_DIV_7p5,
+	VID_PLL_DIV_12,
+	VID_PLL_DIV_14,
+	VID_PLL_DIV_15,
+};
+
+void meson_vid_pll_set(struct meson_vpu_priv *priv, unsigned int div)
+{
+	unsigned int shift_val = 0;
+	unsigned int shift_sel = 0;
+
+	/* Disable vid_pll output clock */
+	hhi_update_bits(HHI_VID_PLL_CLK_DIV, VID_PLL_EN, 0);
+	hhi_update_bits(HHI_VID_PLL_CLK_DIV, VID_PLL_PRESET, 0);
+
+	switch (div) {
+	case VID_PLL_DIV_2:
+		shift_val = 0x0aaa;
+		shift_sel = 0;
+		break;
+	case VID_PLL_DIV_2p5:
+		shift_val = 0x5294;
+		shift_sel = 2;
+		break;
+	case VID_PLL_DIV_3:
+		shift_val = 0x0db6;
+		shift_sel = 0;
+		break;
+	case VID_PLL_DIV_3p5:
+		shift_val = 0x36cc;
+		shift_sel = 1;
+		break;
+	case VID_PLL_DIV_3p75:
+		shift_val = 0x6666;
+		shift_sel = 2;
+		break;
+	case VID_PLL_DIV_4:
+		shift_val = 0x0ccc;
+		shift_sel = 0;
+		break;
+	case VID_PLL_DIV_5:
+		shift_val = 0x739c;
+		shift_sel = 2;
+		break;
+	case VID_PLL_DIV_6:
+		shift_val = 0x0e38;
+		shift_sel = 0;
+		break;
+	case VID_PLL_DIV_6p25:
+		shift_val = 0x0000;
+		shift_sel = 3;
+		break;
+	case VID_PLL_DIV_7:
+		shift_val = 0x3c78;
+		shift_sel = 1;
+		break;
+	case VID_PLL_DIV_7p5:
+		shift_val = 0x78f0;
+		shift_sel = 2;
+		break;
+	case VID_PLL_DIV_12:
+		shift_val = 0x0fc0;
+		shift_sel = 0;
+		break;
+	case VID_PLL_DIV_14:
+		shift_val = 0x3f80;
+		shift_sel = 1;
+		break;
+	case VID_PLL_DIV_15:
+		shift_val = 0x7f80;
+		shift_sel = 2;
+		break;
+	}
+
+	if (div == VID_PLL_DIV_1) {
+		/* Enable vid_pll bypass to HDMI pll */
+		hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+				VID_PLL_BYPASS, VID_PLL_BYPASS);
+	} else {
+		/* Disable Bypass */
+		hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+				VID_PLL_BYPASS, 0);
+		/* Clear sel */
+		hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+				3 << 16, 0);
+		hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+				VID_PLL_PRESET, 0);
+		hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+				0x7fff, 0);
+
+		/* Setup sel and val */
+		hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+				3 << 16, shift_sel << 16);
+		hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+				VID_PLL_PRESET, VID_PLL_PRESET);
+		hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+				0x7fff, shift_val);
+
+		hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+				VID_PLL_PRESET, 0);
+	}
+
+	/* Enable the vid_pll output clock */
+	hhi_update_bits(HHI_VID_PLL_CLK_DIV,
+			VID_PLL_EN, VID_PLL_EN);
+}
+
+/*
+ * Setup VCLK2 for 27MHz, and enable clocks for ENCI and VDAC
+ *
+ * TOFIX: Refactor into table to also handle HDMI frequency and paths
+ */
+static void meson_venci_cvbs_clock_config(struct meson_vpu_priv *priv)
+{
+	unsigned int val;
+
+	debug("%s:%d\n", __func__, __LINE__);
+
+	/* Setup PLL to output 1.485GHz */
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
+		hhi_write(HHI_HDMI_PLL_CNTL, 0x5800023d);
+		hhi_write(HHI_HDMI_PLL_CNTL2, 0x00404e00);
+		hhi_write(HHI_HDMI_PLL_CNTL3, 0x0d5c5091);
+		hhi_write(HHI_HDMI_PLL_CNTL4, 0x801da72c);
+		hhi_write(HHI_HDMI_PLL_CNTL5, 0x71486980);
+		hhi_write(HHI_HDMI_PLL_CNTL6, 0x00000e55);
+		hhi_write(HHI_HDMI_PLL_CNTL, 0x4800023d);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL)) {
+		hhi_write(HHI_HDMI_PLL_CNTL, 0x4000027b);
+		hhi_write(HHI_HDMI_PLL_CNTL2, 0x800cb300);
+		hhi_write(HHI_HDMI_PLL_CNTL3, 0xa6212844);
+		hhi_write(HHI_HDMI_PLL_CNTL4, 0x0c4d000c);
+		hhi_write(HHI_HDMI_PLL_CNTL5, 0x001fa729);
+		hhi_write(HHI_HDMI_PLL_CNTL6, 0x01a31500);
+
+		/* Reset PLL */
+		hhi_update_bits(HHI_HDMI_PLL_CNTL,
+				HDMI_PLL_RESET, HDMI_PLL_RESET);
+		hhi_update_bits(HHI_HDMI_PLL_CNTL,
+				HDMI_PLL_RESET, 0);
+	}
+
+	debug("%s:%d\n", __func__, __LINE__);
+
+	/* Poll for lock bit */
+	readl_poll_timeout(priv->hhi_base + HHI_HDMI_PLL_CNTL, val,
+			   (val & HDMI_PLL_LOCK), 10);
+
+	/* Disable VCLK2 */
+	hhi_update_bits(HHI_VIID_CLK_CNTL, VCLK2_EN, 0);
+
+	/* Setup vid_pll to /1 */
+	meson_vid_pll_set(priv, VID_PLL_DIV_1);
+
+	/* Setup the VCLK2 divider value to achieve 27MHz */
+	hhi_update_bits(HHI_VIID_CLK_DIV,
+			VCLK2_DIV_MASK, (55 - 1));
+
+	/* select vid_pll for vclk2 */
+	hhi_update_bits(HHI_VIID_CLK_CNTL,
+			VCLK2_SEL_MASK, (4 << VCLK2_SEL_SHIFT));
+	/* enable vclk2 gate */
+	hhi_update_bits(HHI_VIID_CLK_CNTL, VCLK2_EN, VCLK2_EN);
+
+	/* select vclk_div1 for enci */
+	hhi_update_bits(HHI_VID_CLK_DIV,
+			CTS_ENCI_SEL_MASK, (8 << CTS_ENCI_SEL_SHIFT));
+	/* select vclk_div1 for vdac */
+	hhi_update_bits(HHI_VIID_CLK_DIV,
+			CTS_VDAC_SEL_MASK, (8 << CTS_VDAC_SEL_SHIFT));
+
+	/* release vclk2_div_reset and enable vclk2_div */
+	hhi_update_bits(HHI_VIID_CLK_DIV,
+			VCLK2_DIV_EN | VCLK2_DIV_RESET, VCLK2_DIV_EN);
+
+	/* enable vclk2_div1 gate */
+	hhi_update_bits(HHI_VIID_CLK_CNTL,
+			VCLK2_DIV1_EN, VCLK2_DIV1_EN);
+
+	/* reset vclk2 */
+	hhi_update_bits(HHI_VIID_CLK_CNTL,
+			VCLK2_SOFT_RESET, VCLK2_SOFT_RESET);
+	hhi_update_bits(HHI_VIID_CLK_CNTL,
+			VCLK2_SOFT_RESET, 0);
+
+	/* enable enci_clk */
+	hhi_update_bits(HHI_VID_CLK_CNTL2,
+			CTS_ENCI_EN, CTS_ENCI_EN);
+	/* enable vdac_clk */
+	hhi_update_bits(HHI_VID_CLK_CNTL2,
+			CTS_VDAC_EN, CTS_VDAC_EN);
+
+	debug("%s:%d\n", __func__, __LINE__);
+}
+
+enum {
+/* PLL	O1 O2 O3 VP DV     EN TX */
+/* 4320 /4 /4 /1 /5 /1  => /2 /2 */
+	MESON_VCLK_HDMI_ENCI_54000 = 1,
+/* 4320 /4 /4 /1 /5 /1  => /1 /2 */
+	MESON_VCLK_HDMI_DDR_54000,
+/* 2970 /4 /1 /1 /5 /1  => /1 /2 */
+	MESON_VCLK_HDMI_DDR_148500,
+/* 2970 /2 /2 /2 /5 /1  => /1 /1 */
+	MESON_VCLK_HDMI_74250,
+/* 2970 /1 /2 /2 /5 /1  => /1 /1 */
+	MESON_VCLK_HDMI_148500,
+/* 2970 /1 /1 /1 /5 /2  => /1 /1 */
+	MESON_VCLK_HDMI_297000,
+/* 5940 /1 /1 /2 /5 /1  => /1 /1 */
+	MESON_VCLK_HDMI_594000
+};
+
+struct meson_vclk_params {
+	unsigned int pll_base_freq;
+	unsigned int pll_od1;
+	unsigned int pll_od2;
+	unsigned int pll_od3;
+	unsigned int vid_pll_div;
+	unsigned int vclk_div;
+} params[] = {
+	[MESON_VCLK_HDMI_ENCI_54000] = {
+		.pll_base_freq = 4320000,
+		.pll_od1 = 4,
+		.pll_od2 = 4,
+		.pll_od3 = 1,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
+	[MESON_VCLK_HDMI_DDR_54000] = {
+		.pll_base_freq = 4320000,
+		.pll_od1 = 4,
+		.pll_od2 = 4,
+		.pll_od3 = 1,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
+	[MESON_VCLK_HDMI_DDR_148500] = {
+		.pll_base_freq = 2970000,
+		.pll_od1 = 4,
+		.pll_od2 = 1,
+		.pll_od3 = 1,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
+	[MESON_VCLK_HDMI_74250] = {
+		.pll_base_freq = 2970000,
+		.pll_od1 = 2,
+		.pll_od2 = 2,
+		.pll_od3 = 2,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
+	[MESON_VCLK_HDMI_148500] = {
+		.pll_base_freq = 2970000,
+		.pll_od1 = 1,
+		.pll_od2 = 2,
+		.pll_od3 = 2,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
+	[MESON_VCLK_HDMI_297000] = {
+		.pll_base_freq = 2970000,
+		.pll_od1 = 1,
+		.pll_od2 = 1,
+		.pll_od3 = 1,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 2,
+	},
+	[MESON_VCLK_HDMI_594000] = {
+		.pll_base_freq = 5940000,
+		.pll_od1 = 1,
+		.pll_od2 = 1,
+		.pll_od3 = 2,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
+};
+
+static inline unsigned int pll_od_to_reg(unsigned int od)
+{
+	switch (od) {
+	case 1:
+		return 0;
+	case 2:
+		return 1;
+	case 4:
+		return 2;
+	case 8:
+		return 3;
+	}
+
+	/* Invalid */
+	return 0;
+}
+
+void meson_hdmi_pll_set_params(struct meson_vpu_priv *priv, unsigned int m,
+			       unsigned int frac, unsigned int od1,
+			       unsigned int od2, unsigned int od3)
+{
+	unsigned int val;
+
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
+		hhi_write(HHI_HDMI_PLL_CNTL, 0x58000200 | m);
+		if (frac)
+			hhi_write(HHI_HDMI_PLL_CNTL2,
+				  0x00004000 | frac);
+		else
+			hhi_write(HHI_HDMI_PLL_CNTL2,
+				  0x00000000);
+		hhi_write(HHI_HDMI_PLL_CNTL3, 0x0d5c5091);
+		hhi_write(HHI_HDMI_PLL_CNTL4, 0x801da72c);
+		hhi_write(HHI_HDMI_PLL_CNTL5, 0x71486980);
+		hhi_write(HHI_HDMI_PLL_CNTL6, 0x00000e55);
+
+		/* Enable and unreset */
+		hhi_update_bits(HHI_HDMI_PLL_CNTL,
+				0x7 << 28, 0x4 << 28);
+
+		/* Poll for lock bit */
+		readl_poll_timeout(priv->hhi_base + HHI_HDMI_PLL_CNTL, val,
+				   (val & HDMI_PLL_LOCK), 10);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL)) {
+		hhi_write(HHI_HDMI_PLL_CNTL, 0x40000200 | m);
+		hhi_write(HHI_HDMI_PLL_CNTL2, 0x800cb000 | frac);
+		hhi_write(HHI_HDMI_PLL_CNTL3, 0x860f30c4);
+		hhi_write(HHI_HDMI_PLL_CNTL4, 0x0c8e0000);
+		hhi_write(HHI_HDMI_PLL_CNTL5, 0x001fa729);
+		hhi_write(HHI_HDMI_PLL_CNTL6, 0x01a31500);
+
+		/* Reset PLL */
+		hhi_update_bits(HHI_HDMI_PLL_CNTL,
+				HDMI_PLL_RESET, HDMI_PLL_RESET);
+		hhi_update_bits(HHI_HDMI_PLL_CNTL,
+				HDMI_PLL_RESET, 0);
+
+		/* Poll for lock bit */
+		readl_poll_timeout(priv->hhi_base + HHI_HDMI_PLL_CNTL, val,
+				   (val & HDMI_PLL_LOCK), 10);
+	}
+
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
+		hhi_update_bits(HHI_HDMI_PLL_CNTL2,
+				3 << 16, pll_od_to_reg(od1) << 16);
+	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+		 meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
+		hhi_update_bits(HHI_HDMI_PLL_CNTL3,
+				3 << 21, pll_od_to_reg(od1) << 21);
+
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
+		hhi_update_bits(HHI_HDMI_PLL_CNTL2,
+				3 << 22, pll_od_to_reg(od2) << 22);
+	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+		 meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
+		hhi_update_bits(HHI_HDMI_PLL_CNTL3,
+				3 << 23, pll_od_to_reg(od2) << 23);
+
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
+		hhi_update_bits(HHI_HDMI_PLL_CNTL2,
+				3 << 18, pll_od_to_reg(od3) << 18);
+	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+		 meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
+		hhi_update_bits(HHI_HDMI_PLL_CNTL3,
+				3 << 19, pll_od_to_reg(od3) << 19);
+}
+
+#define XTAL_FREQ 24000
+
+static unsigned int meson_hdmi_pll_get_m(struct meson_vpu_priv *priv,
+					 unsigned int pll_freq)
+{
+	/* The GXBB PLL has a /2 pre-multiplier */
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
+		pll_freq /= 2;
+
+	return pll_freq / XTAL_FREQ;
+}
+
+#define HDMI_FRAC_MAX_GXBB	4096
+#define HDMI_FRAC_MAX_GXL	1024
+
+static unsigned int meson_hdmi_pll_get_frac(struct meson_vpu_priv *priv,
+					    unsigned int m,
+					    unsigned int pll_freq)
+{
+	unsigned int parent_freq = XTAL_FREQ;
+	unsigned int frac_max = HDMI_FRAC_MAX_GXL;
+	unsigned int frac_m;
+	unsigned int frac;
+
+	/* The GXBB PLL has a /2 pre-multiplier and a larger FRAC width */
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
+		frac_max = HDMI_FRAC_MAX_GXBB;
+		parent_freq *= 2;
+	}
+
+	/* We can have a perfect match !*/
+	if (pll_freq / m == parent_freq &&
+	    pll_freq % m == 0)
+		return 0;
+
+	frac = div_u64((u64)pll_freq * (u64)frac_max, parent_freq);
+	frac_m = m * frac_max;
+	if (frac_m > frac)
+		return frac_max;
+	frac -= frac_m;
+
+	return min((u16)frac, (u16)(frac_max - 1));
+}
+
+static bool meson_hdmi_pll_validate_params(struct meson_vpu_priv *priv,
+					   unsigned int m,
+					   unsigned int frac)
+{
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
+		/* Empiric supported min/max dividers */
+		if (m < 53 || m > 123)
+			return false;
+		if (frac >= HDMI_FRAC_MAX_GXBB)
+			return false;
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL)) {
+		/* Empiric supported min/max dividers */
+		if (m < 106 || m > 247)
+			return false;
+		if (frac >= HDMI_FRAC_MAX_GXL)
+			return false;
+	}
+
+	return true;
+}
+
+static bool meson_hdmi_pll_find_params(struct meson_vpu_priv *priv,
+				       unsigned int freq,
+				       unsigned int *m,
+				       unsigned int *frac,
+				       unsigned int *od)
+{
+	/* Cycle from /16 to /2 */
+	for (*od = 16 ; *od > 1 ; *od >>= 1) {
+		*m = meson_hdmi_pll_get_m(priv, freq * *od);
+		if (!*m)
+			continue;
+		*frac = meson_hdmi_pll_get_frac(priv, *m, freq * *od);
+
+		debug("PLL params for %dkHz: m=%x frac=%x od=%d\n",
+		      freq, *m, *frac, *od);
+
+		if (meson_hdmi_pll_validate_params(priv, *m, *frac))
+			return true;
+	}
+
+	return false;
+}
+
+/* pll_freq is the frequency after the OD dividers */
+bool meson_vclk_dmt_supported_freq(struct meson_vpu_priv *priv,
+				   unsigned int freq)
+{
+	unsigned int od, m, frac;
+
+	/* In DMT mode, path after PLL is always /10 */
+	freq *= 10;
+
+	if (meson_hdmi_pll_find_params(priv, freq, &m, &frac, &od))
+		return true;
+
+	return false;
+}
+
+/* pll_freq is the frequency after the OD dividers */
+static void meson_hdmi_pll_generic_set(struct meson_vpu_priv *priv,
+				       unsigned int pll_freq)
+{
+	unsigned int od, m, frac, od1, od2, od3;
+
+	if (meson_hdmi_pll_find_params(priv, pll_freq, &m, &frac, &od)) {
+		od3 = 1;
+		if (od < 4) {
+			od1 = 2;
+			od2 = 1;
+		} else {
+			od2 = od / 4;
+			od1 = od / od2;
+		}
+
+		debug("PLL params for %dkHz: m=%x frac=%x od=%d/%d/%d\n",
+		      pll_freq, m, frac, od1, od2, od3);
+
+		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
+
+		return;
+	}
+
+	printf("Fatal, unable to find parameters for PLL freq %d\n",
+	       pll_freq);
+}
+
+static void
+meson_vclk_set(struct meson_vpu_priv *priv, unsigned int pll_base_freq,
+	       unsigned int od1, unsigned int od2, unsigned int od3,
+	       unsigned int vid_pll_div, unsigned int vclk_div,
+	       unsigned int hdmi_tx_div, unsigned int venc_div,
+	       bool hdmi_use_enci)
+{
+	/* Set HDMI-TX sys clock */
+	hhi_update_bits(HHI_HDMI_CLK_CNTL,
+			CTS_HDMI_SYS_SEL_MASK, 0);
+	hhi_update_bits(HHI_HDMI_CLK_CNTL,
+			CTS_HDMI_SYS_DIV_MASK, 0);
+	hhi_update_bits(HHI_HDMI_CLK_CNTL,
+			CTS_HDMI_SYS_EN, CTS_HDMI_SYS_EN);
+
+	/* Set HDMI PLL rate */
+	if (!od1 && !od2 && !od3) {
+		meson_hdmi_pll_generic_set(priv, pll_base_freq);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
+		switch (pll_base_freq) {
+		case 2970000:
+			meson_hdmi_pll_set_params(priv, 0x3d, 0xe00,
+						  od1, od2, od3);
+			break;
+		case 4320000:
+			meson_hdmi_pll_set_params(priv, 0x5a, 0,
+						  od1, od2, od3);
+			break;
+		case 5940000:
+			meson_hdmi_pll_set_params(priv, 0x7b, 0xc00,
+						  od1, od2, od3);
+			break;
+		}
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL)) {
+		switch (pll_base_freq) {
+		case 2970000:
+			meson_hdmi_pll_set_params(priv, 0x7b, 0x300,
+						  od1, od2, od3);
+			break;
+		case 4320000:
+			meson_hdmi_pll_set_params(priv, 0xb4, 0,
+						  od1, od2, od3);
+			break;
+		case 5940000:
+			meson_hdmi_pll_set_params(priv, 0xf7, 0x200,
+						  od1, od2, od3);
+			break;
+		}
+	}
+
+	/* Setup vid_pll divider */
+	meson_vid_pll_set(priv, vid_pll_div);
+
+	/* Set VCLK div */
+	hhi_update_bits(HHI_VID_CLK_CNTL,
+			VCLK_SEL_MASK, 0);
+	hhi_update_bits(HHI_VID_CLK_DIV,
+			VCLK_DIV_MASK, vclk_div - 1);
+
+	/* Set HDMI-TX source */
+	switch (hdmi_tx_div) {
+	case 1:
+		/* enable vclk_div1 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV1_EN, VCLK_DIV1_EN);
+
+		/* select vclk_div1 for HDMI-TX */
+		hhi_update_bits(HHI_HDMI_CLK_CNTL,
+				HDMI_TX_PIXEL_SEL_MASK, 0);
+		break;
+	case 2:
+		/* enable vclk_div2 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV2_EN, VCLK_DIV2_EN);
+
+		/* select vclk_div2 for HDMI-TX */
+		hhi_update_bits(HHI_HDMI_CLK_CNTL,
+				HDMI_TX_PIXEL_SEL_MASK,
+				1 << HDMI_TX_PIXEL_SEL_SHIFT);
+		break;
+	case 4:
+		/* enable vclk_div4 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV4_EN, VCLK_DIV4_EN);
+
+		/* select vclk_div4 for HDMI-TX */
+		hhi_update_bits(HHI_HDMI_CLK_CNTL,
+				HDMI_TX_PIXEL_SEL_MASK,
+				2 << HDMI_TX_PIXEL_SEL_SHIFT);
+		break;
+	case 6:
+		/* enable vclk_div6 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV6_EN, VCLK_DIV6_EN);
+
+		/* select vclk_div6 for HDMI-TX */
+		hhi_update_bits(HHI_HDMI_CLK_CNTL,
+				HDMI_TX_PIXEL_SEL_MASK,
+				3 << HDMI_TX_PIXEL_SEL_SHIFT);
+		break;
+	case 12:
+		/* enable vclk_div12 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV12_EN, VCLK_DIV12_EN);
+
+		/* select vclk_div12 for HDMI-TX */
+		hhi_update_bits(HHI_HDMI_CLK_CNTL,
+				HDMI_TX_PIXEL_SEL_MASK,
+				4 << HDMI_TX_PIXEL_SEL_SHIFT);
+		break;
+	}
+	hhi_update_bits(HHI_VID_CLK_CNTL2,
+			HDMI_TX_PIXEL_EN, HDMI_TX_PIXEL_EN);
+
+	/* Set ENCI/ENCP Source */
+	switch (venc_div) {
+	case 1:
+		/* enable vclk_div1 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV1_EN, VCLK_DIV1_EN);
+
+		if (hdmi_use_enci)
+			/* select vclk_div1 for enci */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK, 0);
+		else
+			/* select vclk_div1 for encp */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCP_SEL_MASK, 0);
+		break;
+	case 2:
+		/* enable vclk_div2 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV2_EN, VCLK_DIV2_EN);
+
+		if (hdmi_use_enci)
+			/* select vclk_div2 for enci */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK,
+					1 << CTS_ENCI_SEL_SHIFT);
+		else
+			/* select vclk_div2 for encp */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCP_SEL_MASK,
+					1 << CTS_ENCP_SEL_SHIFT);
+		break;
+	case 4:
+		/* enable vclk_div4 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV4_EN, VCLK_DIV4_EN);
+
+		if (hdmi_use_enci)
+			/* select vclk_div4 for enci */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK,
+					2 << CTS_ENCI_SEL_SHIFT);
+		else
+			/* select vclk_div4 for encp */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCP_SEL_MASK,
+					2 << CTS_ENCP_SEL_SHIFT);
+		break;
+	case 6:
+		/* enable vclk_div6 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV6_EN, VCLK_DIV6_EN);
+
+		if (hdmi_use_enci)
+			/* select vclk_div6 for enci */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK,
+					3 << CTS_ENCI_SEL_SHIFT);
+		else
+			/* select vclk_div6 for encp */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCP_SEL_MASK,
+					3 << CTS_ENCP_SEL_SHIFT);
+		break;
+	case 12:
+		/* enable vclk_div12 gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL,
+				VCLK_DIV12_EN, VCLK_DIV12_EN);
+
+		if (hdmi_use_enci)
+			/* select vclk_div12 for enci */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCI_SEL_MASK,
+					4 << CTS_ENCI_SEL_SHIFT);
+		else
+			/* select vclk_div12 for encp */
+			hhi_update_bits(HHI_VID_CLK_DIV,
+					CTS_ENCP_SEL_MASK,
+					4 << CTS_ENCP_SEL_SHIFT);
+		break;
+	}
+
+	if (hdmi_use_enci)
+		/* Enable ENCI clock gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL2,
+				CTS_ENCI_EN, CTS_ENCI_EN);
+	else
+		/* Enable ENCP clock gate */
+		hhi_update_bits(HHI_VID_CLK_CNTL2,
+				CTS_ENCP_EN, CTS_ENCP_EN);
+
+	hhi_update_bits(HHI_VID_CLK_CNTL, VCLK_EN, VCLK_EN);
+}
+
+static void meson_vclk_setup(struct meson_vpu_priv *priv, unsigned int target,
+			     unsigned int vclk_freq, unsigned int venc_freq,
+			     unsigned int dac_freq, bool hdmi_use_enci)
+{
+	unsigned int freq;
+	unsigned int hdmi_tx_div;
+	unsigned int venc_div;
+
+	if (target == MESON_VCLK_TARGET_CVBS) {
+		meson_venci_cvbs_clock_config(priv);
+		return;
+	} else if (target == MESON_VCLK_TARGET_DMT) {
+		/* The DMT clock path is fixed after the PLL:
+		 * - automatic PLL freq + OD management
+		 * - vid_pll_div = VID_PLL_DIV_5
+		 * - vclk_div = 2
+		 * - hdmi_tx_div = 1
+		 * - venc_div = 1
+		 * - encp encoder
+		 */
+		meson_vclk_set(priv, vclk_freq * 10, 0, 0, 0,
+			       VID_PLL_DIV_5, 2, 1, 1, false);
+
+		return;
+	}
+
+	hdmi_tx_div = vclk_freq / dac_freq;
+
+	if (hdmi_tx_div == 0) {
+		printf("Fatal Error, invalid HDMI-TX freq %d\n",
+		       dac_freq);
+		return;
+	}
+
+	venc_div = vclk_freq / venc_freq;
+
+	if (venc_div == 0) {
+		printf("Fatal Error, invalid HDMI venc freq %d\n",
+		       venc_freq);
+		return;
+	}
+
+	switch (vclk_freq) {
+	case 54000:
+		if (hdmi_use_enci)
+			freq = MESON_VCLK_HDMI_ENCI_54000;
+		else
+			freq = MESON_VCLK_HDMI_DDR_54000;
+		break;
+	case 74250:
+		freq = MESON_VCLK_HDMI_74250;
+		break;
+	case 148500:
+		if (dac_freq != 148500)
+			freq = MESON_VCLK_HDMI_DDR_148500;
+		else
+			freq = MESON_VCLK_HDMI_148500;
+		break;
+	case 297000:
+		freq = MESON_VCLK_HDMI_297000;
+		break;
+	case 594000:
+		freq = MESON_VCLK_HDMI_594000;
+		break;
+	default:
+		printf("Fatal Error, invalid HDMI vclk freq %d\n",
+		       vclk_freq);
+		return;
+	}
+
+	meson_vclk_set(priv, params[freq].pll_base_freq,
+		       params[freq].pll_od1, params[freq].pll_od2,
+		       params[freq].pll_od3, params[freq].vid_pll_div,
+		       params[freq].vclk_div, hdmi_tx_div, venc_div,
+		       hdmi_use_enci);
+}
+
+void meson_vpu_setup_vclk(struct udevice *dev,
+			  const struct display_timing *mode, bool is_cvbs)
+{
+	struct meson_vpu_priv *priv = dev_get_priv(dev);
+	unsigned int vclk_freq;
+
+	if (is_cvbs)
+		return meson_vclk_setup(priv, MESON_VCLK_TARGET_CVBS,
+					0, 0, 0, false);
+
+	vclk_freq = mode->pixelclock.typ / 1000;
+
+	return meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT,
+				vclk_freq, vclk_freq, vclk_freq, false);
+}
diff --git a/drivers/video/meson/meson_venc.c b/drivers/video/meson/meson_venc.c
new file mode 100644
index 0000000000..d137dde8e2
--- /dev/null
+++ b/drivers/video/meson/meson_venc.c
@@ -0,0 +1,1464 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic Meson Video Processing Unit driver
+ *
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <edid.h>
+#include "meson_vpu.h"
+
+enum {
+	MESON_VENC_MODE_NONE = 0,
+	MESON_VENC_MODE_CVBS_PAL,
+	MESON_VENC_MODE_CVBS_NTSC,
+	MESON_VENC_MODE_HDMI,
+};
+
+enum meson_venc_source {
+	MESON_VENC_SOURCE_NONE = 0,
+	MESON_VENC_SOURCE_ENCI = 1,
+	MESON_VENC_SOURCE_ENCP = 2,
+};
+
+#define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
+#define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
+
+struct meson_cvbs_enci_mode {
+	unsigned int mode_tag;
+	unsigned int hso_begin; /* HSO begin position */
+	unsigned int hso_end; /* HSO end position */
+	unsigned int vso_even; /* VSO even line */
+	unsigned int vso_odd; /* VSO odd line */
+	unsigned int macv_max_amp; /* Macrovision max amplitude */
+	unsigned int video_prog_mode;
+	unsigned int video_mode;
+	unsigned int sch_adjust;
+	unsigned int yc_delay;
+	unsigned int pixel_start;
+	unsigned int pixel_end;
+	unsigned int top_field_line_start;
+	unsigned int top_field_line_end;
+	unsigned int bottom_field_line_start;
+	unsigned int bottom_field_line_end;
+	unsigned int video_saturation;
+	unsigned int video_contrast;
+	unsigned int video_brightness;
+	unsigned int video_hue;
+	unsigned int analog_sync_adj;
+};
+
+struct meson_cvbs_enci_mode meson_cvbs_enci_pal = {
+	.mode_tag = MESON_VENC_MODE_CVBS_PAL,
+	.hso_begin = 3,
+	.hso_end = 129,
+	.vso_even = 3,
+	.vso_odd = 260,
+	.macv_max_amp = 7,
+	.video_prog_mode = 0xff,
+	.video_mode = 0x13,
+	.sch_adjust = 0x28,
+	.yc_delay = 0x343,
+	.pixel_start = 251,
+	.pixel_end = 1691,
+	.top_field_line_start = 22,
+	.top_field_line_end = 310,
+	.bottom_field_line_start = 23,
+	.bottom_field_line_end = 311,
+	.video_saturation = 9,
+	.video_contrast = 0,
+	.video_brightness = 0,
+	.video_hue = 0,
+	.analog_sync_adj = 0x8080,
+};
+
+struct meson_cvbs_enci_mode meson_cvbs_enci_ntsc = {
+	.mode_tag = MESON_VENC_MODE_CVBS_NTSC,
+	.hso_begin = 5,
+	.hso_end = 129,
+	.vso_even = 3,
+	.vso_odd = 260,
+	.macv_max_amp = 0xb,
+	.video_prog_mode = 0xf0,
+	.video_mode = 0x8,
+	.sch_adjust = 0x20,
+	.yc_delay = 0x333,
+	.pixel_start = 227,
+	.pixel_end = 1667,
+	.top_field_line_start = 18,
+	.top_field_line_end = 258,
+	.bottom_field_line_start = 19,
+	.bottom_field_line_end = 259,
+	.video_saturation = 18,
+	.video_contrast = 3,
+	.video_brightness = 0,
+	.video_hue = 0,
+	.analog_sync_adj = 0x9c00,
+};
+
+union meson_hdmi_venc_mode {
+	struct {
+		unsigned int mode_tag;
+		unsigned int hso_begin;
+		unsigned int hso_end;
+		unsigned int vso_even;
+		unsigned int vso_odd;
+		unsigned int macv_max_amp;
+		unsigned int video_prog_mode;
+		unsigned int video_mode;
+		unsigned int sch_adjust;
+		unsigned int yc_delay;
+		unsigned int pixel_start;
+		unsigned int pixel_end;
+		unsigned int top_field_line_start;
+		unsigned int top_field_line_end;
+		unsigned int bottom_field_line_start;
+		unsigned int bottom_field_line_end;
+	} enci;
+	struct {
+		unsigned int dvi_settings;
+		unsigned int video_mode;
+		unsigned int video_mode_adv;
+		unsigned int video_prog_mode;
+		bool video_prog_mode_present;
+		unsigned int video_sync_mode;
+		bool video_sync_mode_present;
+		unsigned int video_yc_dly;
+		bool video_yc_dly_present;
+		unsigned int video_rgb_ctrl;
+		bool video_rgb_ctrl_present;
+		unsigned int video_filt_ctrl;
+		bool video_filt_ctrl_present;
+		unsigned int video_ofld_voav_ofst;
+		bool video_ofld_voav_ofst_present;
+		unsigned int yfp1_htime;
+		unsigned int yfp2_htime;
+		unsigned int max_pxcnt;
+		unsigned int hspuls_begin;
+		unsigned int hspuls_end;
+		unsigned int hspuls_switch;
+		unsigned int vspuls_begin;
+		unsigned int vspuls_end;
+		unsigned int vspuls_bline;
+		unsigned int vspuls_eline;
+		unsigned int eqpuls_begin;
+		bool eqpuls_begin_present;
+		unsigned int eqpuls_end;
+		bool eqpuls_end_present;
+		unsigned int eqpuls_bline;
+		bool eqpuls_bline_present;
+		unsigned int eqpuls_eline;
+		bool eqpuls_eline_present;
+		unsigned int havon_begin;
+		unsigned int havon_end;
+		unsigned int vavon_bline;
+		unsigned int vavon_eline;
+		unsigned int hso_begin;
+		unsigned int hso_end;
+		unsigned int vso_begin;
+		unsigned int vso_end;
+		unsigned int vso_bline;
+		unsigned int vso_eline;
+		bool vso_eline_present;
+		unsigned int sy_val;
+		bool sy_val_present;
+		unsigned int sy2_val;
+		bool sy2_val_present;
+		unsigned int max_lncnt;
+	} encp;
+};
+
+union meson_hdmi_venc_mode meson_hdmi_enci_mode_480i = {
+	.enci = {
+		.hso_begin = 5,
+		.hso_end = 129,
+		.vso_even = 3,
+		.vso_odd = 260,
+		.macv_max_amp = 0x810b,
+		.video_prog_mode = 0xf0,
+		.video_mode = 0x8,
+		.sch_adjust = 0x20,
+		.yc_delay = 0,
+		.pixel_start = 227,
+		.pixel_end = 1667,
+		.top_field_line_start = 18,
+		.top_field_line_end = 258,
+		.bottom_field_line_start = 19,
+		.bottom_field_line_end = 259,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_enci_mode_576i = {
+	.enci = {
+		.hso_begin = 3,
+		.hso_end = 129,
+		.vso_even = 3,
+		.vso_odd = 260,
+		.macv_max_amp = 8107,
+		.video_prog_mode = 0xff,
+		.video_mode = 0x13,
+		.sch_adjust = 0x28,
+		.yc_delay = 0x333,
+		.pixel_start = 251,
+		.pixel_end = 1691,
+		.top_field_line_start = 22,
+		.top_field_line_end = 310,
+		.bottom_field_line_start = 23,
+		.bottom_field_line_end = 311,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_480p = {
+	.encp = {
+		.dvi_settings = 0x21,
+		.video_mode = 0x4000,
+		.video_mode_adv = 0x9,
+		.video_prog_mode = 0,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 7,
+		.video_sync_mode_present = true,
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		.video_filt_ctrl = 0x2052,
+		.video_filt_ctrl_present = true,
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 244,
+		.yfp2_htime = 1630,
+		.max_pxcnt = 1715,
+		.hspuls_begin = 0x22,
+		.hspuls_end = 0xa0,
+		.hspuls_switch = 88,
+		.vspuls_begin = 0,
+		.vspuls_end = 1589,
+		.vspuls_bline = 0,
+		.vspuls_eline = 5,
+		.havon_begin = 249,
+		.havon_end = 1689,
+		.vavon_bline = 42,
+		.vavon_eline = 521,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 3,
+		.hso_end = 5,
+		.vso_begin = 3,
+		.vso_end = 5,
+		.vso_bline = 0,
+		/* vso_eline */
+		.sy_val	= 8,
+		.sy_val_present = true,
+		.sy2_val = 0x1d8,
+		.sy2_val_present = true,
+		.max_lncnt = 524,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_576p = {
+	.encp = {
+		.dvi_settings = 0x21,
+		.video_mode = 0x4000,
+		.video_mode_adv = 0x9,
+		.video_prog_mode = 0,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 7,
+		.video_sync_mode_present = true,
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		.video_filt_ctrl = 0x52,
+		.video_filt_ctrl_present = true,
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 235,
+		.yfp2_htime = 1674,
+		.max_pxcnt = 1727,
+		.hspuls_begin = 0,
+		.hspuls_end = 0x80,
+		.hspuls_switch = 88,
+		.vspuls_begin = 0,
+		.vspuls_end = 1599,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 235,
+		.havon_end = 1674,
+		.vavon_bline = 44,
+		.vavon_eline = 619,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 0x80,
+		.hso_end = 0,
+		.vso_begin = 0,
+		.vso_end = 5,
+		.vso_bline = 0,
+		/* vso_eline */
+		.sy_val	= 8,
+		.sy_val_present = true,
+		.sy2_val = 0x1d8,
+		.sy2_val_present = true,
+		.max_lncnt = 624,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p60 = {
+	.encp = {
+		.dvi_settings = 0x2029,
+		.video_mode = 0x4040,
+		.video_mode_adv = 0x19,
+		/* video_prog_mode */
+		/* video_sync_mode */
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		/* video_filt_ctrl */
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 648,
+		.yfp2_htime = 3207,
+		.max_pxcnt = 3299,
+		.hspuls_begin = 80,
+		.hspuls_end = 240,
+		.hspuls_switch = 80,
+		.vspuls_begin = 688,
+		.vspuls_end = 3248,
+		.vspuls_bline = 4,
+		.vspuls_eline = 8,
+		.havon_begin = 648,
+		.havon_end = 3207,
+		.vavon_bline = 29,
+		.vavon_eline = 748,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 256,
+		.hso_end = 168,
+		.vso_begin = 168,
+		.vso_end = 256,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 749,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p50 = {
+	.encp = {
+		.dvi_settings = 0x202d,
+		.video_mode = 0x4040,
+		.video_mode_adv = 0x19,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 0x407,
+		.video_sync_mode_present = true,
+		.video_yc_dly = 0,
+		.video_yc_dly_present = true,
+		/* video_rgb_ctrl */
+		/* video_filt_ctrl */
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 648,
+		.yfp2_htime = 3207,
+		.max_pxcnt = 3959,
+		.hspuls_begin = 80,
+		.hspuls_end = 240,
+		.hspuls_switch = 80,
+		.vspuls_begin = 688,
+		.vspuls_end = 3248,
+		.vspuls_bline = 4,
+		.vspuls_eline = 8,
+		.havon_begin = 648,
+		.havon_end = 3207,
+		.vavon_bline = 29,
+		.vavon_eline = 748,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 128,
+		.hso_end = 208,
+		.vso_begin = 128,
+		.vso_end = 128,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 749,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i60 = {
+	.encp = {
+		.dvi_settings = 0x2029,
+		.video_mode = 0x5ffc,
+		.video_mode_adv = 0x19,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 0x207,
+		.video_sync_mode_present = true,
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		/* video_filt_ctrl */
+		.video_ofld_voav_ofst = 0x11,
+		.video_ofld_voav_ofst_present = true,
+		.yfp1_htime = 516,
+		.yfp2_htime = 4355,
+		.max_pxcnt = 4399,
+		.hspuls_begin = 88,
+		.hspuls_end = 264,
+		.hspuls_switch = 88,
+		.vspuls_begin = 440,
+		.vspuls_end = 2200,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 516,
+		.havon_end = 4355,
+		.vavon_bline = 20,
+		.vavon_eline = 559,
+		.eqpuls_begin = 2288,
+		.eqpuls_begin_present = true,
+		.eqpuls_end = 2464,
+		.eqpuls_end_present = true,
+		.eqpuls_bline = 0,
+		.eqpuls_bline_present = true,
+		.eqpuls_eline = 4,
+		.eqpuls_eline_present = true,
+		.hso_begin = 264,
+		.hso_end = 176,
+		.vso_begin = 88,
+		.vso_end = 88,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 1124,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i50 = {
+	.encp = {
+		.dvi_settings = 0x202d,
+		.video_mode = 0x5ffc,
+		.video_mode_adv = 0x19,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 0x7,
+		.video_sync_mode_present = true,
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		/* video_filt_ctrl */
+		.video_ofld_voav_ofst = 0x11,
+		.video_ofld_voav_ofst_present = true,
+		.yfp1_htime = 526,
+		.yfp2_htime = 4365,
+		.max_pxcnt = 5279,
+		.hspuls_begin = 88,
+		.hspuls_end = 264,
+		.hspuls_switch = 88,
+		.vspuls_begin = 440,
+		.vspuls_end = 2200,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 526,
+		.havon_end = 4365,
+		.vavon_bline = 20,
+		.vavon_eline = 559,
+		.eqpuls_begin = 2288,
+		.eqpuls_begin_present = true,
+		.eqpuls_end = 2464,
+		.eqpuls_end_present = true,
+		.eqpuls_bline = 0,
+		.eqpuls_bline_present = true,
+		.eqpuls_eline = 4,
+		.eqpuls_eline_present = true,
+		.hso_begin = 142,
+		.hso_end = 230,
+		.vso_begin = 142,
+		.vso_end = 142,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 1124,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p24 = {
+	.encp = {
+		.dvi_settings = 0xd,
+		.video_mode = 0x4040,
+		.video_mode_adv = 0x18,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 0x7,
+		.video_sync_mode_present = true,
+		.video_yc_dly = 0,
+		.video_yc_dly_present = true,
+		.video_rgb_ctrl = 2,
+		.video_rgb_ctrl_present = true,
+		.video_filt_ctrl = 0x1052,
+		.video_filt_ctrl_present = true,
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 271,
+		.yfp2_htime = 2190,
+		.max_pxcnt = 2749,
+		.hspuls_begin = 44,
+		.hspuls_end = 132,
+		.hspuls_switch = 44,
+		.vspuls_begin = 220,
+		.vspuls_end = 2140,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 271,
+		.havon_end = 2190,
+		.vavon_bline = 41,
+		.vavon_eline = 1120,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		.eqpuls_bline = 0,
+		.eqpuls_bline_present = true,
+		.eqpuls_eline = 4,
+		.eqpuls_eline_present = true,
+		.hso_begin = 79,
+		.hso_end = 123,
+		.vso_begin = 79,
+		.vso_end = 79,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 1124,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p30 = {
+	.encp = {
+		.dvi_settings = 0x1,
+		.video_mode = 0x4040,
+		.video_mode_adv = 0x18,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		/* video_sync_mode */
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		.video_filt_ctrl = 0x1052,
+		.video_filt_ctrl_present = true,
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 140,
+		.yfp2_htime = 2060,
+		.max_pxcnt = 2199,
+		.hspuls_begin = 2156,
+		.hspuls_end = 44,
+		.hspuls_switch = 44,
+		.vspuls_begin = 140,
+		.vspuls_end = 2059,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 148,
+		.havon_end = 2067,
+		.vavon_bline = 41,
+		.vavon_eline = 1120,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 44,
+		.hso_end = 2156,
+		.vso_begin = 2100,
+		.vso_end = 2164,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 1124,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p50 = {
+	.encp = {
+		.dvi_settings = 0xd,
+		.video_mode = 0x4040,
+		.video_mode_adv = 0x18,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		.video_sync_mode = 0x7,
+		.video_sync_mode_present = true,
+		.video_yc_dly = 0,
+		.video_yc_dly_present = true,
+		.video_rgb_ctrl = 2,
+		.video_rgb_ctrl_present = true,
+		/* video_filt_ctrl */
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 271,
+		.yfp2_htime = 2190,
+		.max_pxcnt = 2639,
+		.hspuls_begin = 44,
+		.hspuls_end = 132,
+		.hspuls_switch = 44,
+		.vspuls_begin = 220,
+		.vspuls_end = 2140,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 271,
+		.havon_end = 2190,
+		.vavon_bline = 41,
+		.vavon_eline = 1120,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		.eqpuls_bline = 0,
+		.eqpuls_bline_present = true,
+		.eqpuls_eline = 4,
+		.eqpuls_eline_present = true,
+		.hso_begin = 79,
+		.hso_end = 123,
+		.vso_begin = 79,
+		.vso_end = 79,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 1124,
+	},
+};
+
+union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p60 = {
+	.encp = {
+		.dvi_settings = 0x1,
+		.video_mode = 0x4040,
+		.video_mode_adv = 0x18,
+		.video_prog_mode = 0x100,
+		.video_prog_mode_present = true,
+		/* video_sync_mode */
+		/* video_yc_dly */
+		/* video_rgb_ctrl */
+		.video_filt_ctrl = 0x1052,
+		.video_filt_ctrl_present = true,
+		/* video_ofld_voav_ofst */
+		.yfp1_htime = 140,
+		.yfp2_htime = 2060,
+		.max_pxcnt = 2199,
+		.hspuls_begin = 2156,
+		.hspuls_end = 44,
+		.hspuls_switch = 44,
+		.vspuls_begin = 140,
+		.vspuls_end = 2059,
+		.vspuls_bline = 0,
+		.vspuls_eline = 4,
+		.havon_begin = 148,
+		.havon_end = 2067,
+		.vavon_bline = 41,
+		.vavon_eline = 1120,
+		/* eqpuls_begin */
+		/* eqpuls_end */
+		/* eqpuls_bline */
+		/* eqpuls_eline */
+		.hso_begin = 44,
+		.hso_end = 2156,
+		.vso_begin = 2100,
+		.vso_end = 2164,
+		.vso_bline = 0,
+		.vso_eline = 5,
+		.vso_eline_present = true,
+		/* sy_val */
+		/* sy2_val */
+		.max_lncnt = 1124,
+	},
+};
+
+static signed int to_signed(unsigned int a)
+{
+	if (a <= 7)
+		return a;
+	else
+		return a - 16;
+}
+
+static unsigned long modulo(unsigned long a, unsigned long b)
+{
+	if (a >= b)
+		return a - b;
+	else
+		return a;
+}
+
+bool meson_venc_hdmi_supported_mode(const struct display_timing *mode)
+{
+	if (mode->flags & ~(DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_HSYNC_HIGH |
+			    DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_VSYNC_HIGH))
+		return false;
+
+	if (mode->hactive.typ < 640 || mode->hactive.typ > 1920)
+		return false;
+
+	if (mode->vactive.typ < 480 || mode->vactive.typ > 1200)
+		return false;
+
+	return true;
+}
+
+static void meson_venc_hdmi_get_dmt_vmode(const struct display_timing *mode,
+					  union meson_hdmi_venc_mode *dmt_mode)
+{
+	memset(dmt_mode, 0, sizeof(*dmt_mode));
+
+	dmt_mode->encp.dvi_settings = 0x21;
+	dmt_mode->encp.video_mode = 0x4040;
+	dmt_mode->encp.video_mode_adv = 0x18;
+
+	dmt_mode->encp.max_pxcnt = mode->hactive.typ +
+				   mode->hfront_porch.typ +
+				   mode->hback_porch.typ +
+				   mode->hsync_len.typ - 1;
+
+	dmt_mode->encp.havon_begin = mode->hback_porch.typ +
+				     mode->hsync_len.typ;
+
+	dmt_mode->encp.havon_end = dmt_mode->encp.havon_begin +
+				   mode->hactive.typ - 1;
+
+	dmt_mode->encp.vavon_bline = mode->vback_porch.typ +
+				     mode->vsync_len.typ;
+	dmt_mode->encp.vavon_eline = dmt_mode->encp.vavon_bline +
+				     mode->vactive.typ - 1;
+
+	/* to investigate */
+	dmt_mode->encp.hso_begin = 0;
+	dmt_mode->encp.hso_end = mode->hsync_len.typ;
+	dmt_mode->encp.vso_begin = 30;
+	dmt_mode->encp.vso_end = 50;
+
+	dmt_mode->encp.vso_bline = 0;
+	dmt_mode->encp.vso_eline = mode->vsync_len.typ;
+	dmt_mode->encp.vso_eline_present = true;
+
+	dmt_mode->encp.max_lncnt = mode->vactive.typ +
+			    mode->vfront_porch.typ +
+			    mode->vback_porch.typ +
+			    mode->vsync_len.typ - 1;
+}
+
+static void meson_venc_hdmi_mode_set(struct meson_vpu_priv *priv,
+				     const struct display_timing *mode)
+{
+	union meson_hdmi_venc_mode *vmode = NULL;
+	union meson_hdmi_venc_mode vmode_dmt;
+	bool use_enci = false;
+	bool venc_repeat = false;
+	bool hdmi_repeat = false;
+	unsigned int venc_hdmi_latency = 2;
+	unsigned long total_pixels_venc = 0;
+	unsigned long active_pixels_venc = 0;
+	unsigned long front_porch_venc = 0;
+	unsigned long hsync_pixels_venc = 0;
+	unsigned long de_h_begin = 0;
+	unsigned long de_h_end = 0;
+	unsigned long de_v_begin_even = 0;
+	unsigned long de_v_end_even = 0;
+	unsigned long de_v_begin_odd = 0;
+	unsigned long de_v_end_odd = 0;
+	unsigned long hs_begin = 0;
+	unsigned long hs_end = 0;
+	unsigned long vs_adjust = 0;
+	unsigned long vs_bline_evn = 0;
+	unsigned long vs_eline_evn = 0;
+	unsigned long vs_bline_odd = 0;
+	unsigned long vs_eline_odd = 0;
+	unsigned long vso_begin_evn = 0;
+	unsigned long vso_begin_odd = 0;
+	unsigned int eof_lines;
+	unsigned int sof_lines;
+	unsigned int vsync_lines;
+
+	/* Use VENCI for 480i and 576i and double HDMI pixels */
+	if (mode->flags & DISPLAY_FLAGS_DOUBLECLK) {
+		venc_hdmi_latency = 1;
+		hdmi_repeat = true;
+		use_enci = true;
+	}
+
+	meson_venc_hdmi_get_dmt_vmode(mode, &vmode_dmt);
+	vmode = &vmode_dmt;
+	use_enci = false;
+
+	debug(" max_pxcnt   %04d, max_lncnt   %04d\n"
+	      " havon_begin %04d, havon_end   %04d\n"
+	      " vavon_bline %04d, vavon_eline %04d\n"
+	      " hso_begin   %04d, hso_end     %04d\n"
+	      " vso_begin   %04d, vso_end     %04d\n"
+	      " vso_bline   %04d, vso_eline   %04d\n",
+		vmode->encp.max_pxcnt,   vmode->encp.max_lncnt,
+		vmode->encp.havon_begin, vmode->encp.havon_end,
+		vmode->encp.vavon_bline, vmode->encp.vavon_eline,
+		vmode->encp.hso_begin,   vmode->encp.hso_end,
+		vmode->encp.vso_begin,   vmode->encp.vso_end,
+		vmode->encp.vso_bline,   vmode->encp.vso_eline);
+
+	eof_lines = mode->vfront_porch.typ;
+	if (mode->flags & DISPLAY_FLAGS_INTERLACED)
+		eof_lines /= 2;
+
+	sof_lines = mode->vback_porch.typ;
+	if (mode->flags & DISPLAY_FLAGS_INTERLACED)
+		sof_lines /= 2;
+
+	vsync_lines = mode->vsync_len.typ;
+	if (mode->flags & DISPLAY_FLAGS_INTERLACED)
+		vsync_lines /= 2;
+
+	total_pixels_venc = mode->hback_porch.typ + mode->hactive.typ +
+			mode->hfront_porch.typ + mode->hsync_len.typ;
+	if (hdmi_repeat)
+		total_pixels_venc /= 2;
+	if (venc_repeat)
+		total_pixels_venc *= 2;
+
+	active_pixels_venc = mode->hactive.typ;
+	if (hdmi_repeat)
+		active_pixels_venc /= 2;
+	if (venc_repeat)
+		active_pixels_venc *= 2;
+
+	front_porch_venc = mode->hfront_porch.typ;
+	if (hdmi_repeat)
+		front_porch_venc /= 2;
+	if (venc_repeat)
+		front_porch_venc *= 2;
+
+	hsync_pixels_venc = mode->hsync_len.typ;
+	if (hdmi_repeat)
+		hsync_pixels_venc /= 2;
+	if (venc_repeat)
+		hsync_pixels_venc *= 2;
+
+	/* Disable VDACs */
+	writel_bits(0xff, 0xff,
+		    priv->io_base + _REG(VENC_VDAC_SETTING));
+
+	writel(0, priv->io_base + _REG(ENCI_VIDEO_EN));
+	writel(0, priv->io_base + _REG(ENCP_VIDEO_EN));
+
+	debug("use_enci: %d, hdmi_repeat: %d\n", use_enci, hdmi_repeat);
+
+	if (use_enci) {
+		unsigned int lines_f0;
+		unsigned int lines_f1;
+
+		/* CVBS Filter settings */
+		writel(0x12, priv->io_base + _REG(ENCI_CFILT_CTRL));
+		writel(0x12, priv->io_base + _REG(ENCI_CFILT_CTRL2));
+
+		/* Digital Video Select : Interlace, clk27 clk, external */
+		writel(0, priv->io_base + _REG(VENC_DVI_SETTING));
+
+		/* Reset Video Mode */
+		writel(0, priv->io_base + _REG(ENCI_VIDEO_MODE));
+		writel(0, priv->io_base + _REG(ENCI_VIDEO_MODE_ADV));
+
+		/* Horizontal sync signal output */
+		writel(vmode->enci.hso_begin,
+		       priv->io_base + _REG(ENCI_SYNC_HSO_BEGIN));
+		writel(vmode->enci.hso_end,
+		       priv->io_base + _REG(ENCI_SYNC_HSO_END));
+
+		/* Vertical Sync lines */
+		writel(vmode->enci.vso_even,
+		       priv->io_base + _REG(ENCI_SYNC_VSO_EVNLN));
+		writel(vmode->enci.vso_odd,
+		       priv->io_base + _REG(ENCI_SYNC_VSO_ODDLN));
+
+		/* Macrovision max amplitude change */
+		writel(vmode->enci.macv_max_amp,
+		       priv->io_base + _REG(ENCI_MACV_MAX_AMP));
+
+		/* Video mode */
+		writel(vmode->enci.video_prog_mode,
+		       priv->io_base + _REG(VENC_VIDEO_PROG_MODE));
+		writel(vmode->enci.video_mode,
+		       priv->io_base + _REG(ENCI_VIDEO_MODE));
+
+		/* Advanced Video Mode :
+		 * Demux shifting 0x2
+		 * Blank line end at line17/22
+		 * High bandwidth Luma Filter
+		 * Low bandwidth Chroma Filter
+		 * Bypass luma low pass filter
+		 * No macrovision on CSYNC
+		 */
+		writel(0x26, priv->io_base + _REG(ENCI_VIDEO_MODE_ADV));
+
+		writel(vmode->enci.sch_adjust,
+		       priv->io_base + _REG(ENCI_VIDEO_SCH));
+
+		/* Sync mode : MASTER Master mode, free run, send HSO/VSO out */
+		writel(0x07, priv->io_base + _REG(ENCI_SYNC_MODE));
+
+		if (vmode->enci.yc_delay)
+			writel(vmode->enci.yc_delay,
+			       priv->io_base + _REG(ENCI_YC_DELAY));
+
+		/* UNreset Interlaced TV Encoder */
+		writel(0, priv->io_base + _REG(ENCI_DBG_PX_RST));
+
+		/* Enable Vfifo2vd, Y_Cb_Y_Cr select */
+		writel(0x4e01, priv->io_base + _REG(ENCI_VFIFO2VD_CTL));
+
+		/* Timings */
+		writel(vmode->enci.pixel_start,
+		       priv->io_base + _REG(ENCI_VFIFO2VD_PIXEL_START));
+		writel(vmode->enci.pixel_end,
+		       priv->io_base + _REG(ENCI_VFIFO2VD_PIXEL_END));
+
+		writel(vmode->enci.top_field_line_start,
+		       priv->io_base + _REG(ENCI_VFIFO2VD_LINE_TOP_START));
+		writel(vmode->enci.top_field_line_end,
+		       priv->io_base + _REG(ENCI_VFIFO2VD_LINE_TOP_END));
+
+		writel(vmode->enci.bottom_field_line_start,
+		       priv->io_base + _REG(ENCI_VFIFO2VD_LINE_BOT_START));
+		writel(vmode->enci.bottom_field_line_end,
+		       priv->io_base + _REG(ENCI_VFIFO2VD_LINE_BOT_END));
+
+		/* Select ENCI for VIU */
+		meson_vpp_setup_mux(priv, MESON_VIU_VPP_MUX_ENCI);
+
+		/* Interlace video enable */
+		writel(1, priv->io_base + _REG(ENCI_VIDEO_EN));
+
+		lines_f0 = mode->vback_porch.typ + mode->vactive.typ +
+			   mode->vback_porch.typ + mode->vsync_len.typ;
+		lines_f0 = lines_f0 >> 1;
+		lines_f1 = lines_f0 + 1;
+
+		de_h_begin = modulo(readl(priv->io_base +
+					_REG(ENCI_VFIFO2VD_PIXEL_START))
+					+ venc_hdmi_latency,
+				    total_pixels_venc);
+		de_h_end  = modulo(de_h_begin + active_pixels_venc,
+				   total_pixels_venc);
+
+		writel(de_h_begin,
+		       priv->io_base + _REG(ENCI_DE_H_BEGIN));
+		writel(de_h_end,
+		       priv->io_base + _REG(ENCI_DE_H_END));
+
+		de_v_begin_even = readl(priv->io_base +
+					_REG(ENCI_VFIFO2VD_LINE_TOP_START));
+		de_v_end_even  = de_v_begin_even + mode->vactive.typ;
+		de_v_begin_odd = readl(priv->io_base +
+					_REG(ENCI_VFIFO2VD_LINE_BOT_START));
+		de_v_end_odd = de_v_begin_odd + mode->vactive.typ;
+
+		writel(de_v_begin_even,
+		       priv->io_base + _REG(ENCI_DE_V_BEGIN_EVEN));
+		writel(de_v_end_even,
+		       priv->io_base + _REG(ENCI_DE_V_END_EVEN));
+		writel(de_v_begin_odd,
+		       priv->io_base + _REG(ENCI_DE_V_BEGIN_ODD));
+		writel(de_v_end_odd,
+		       priv->io_base + _REG(ENCI_DE_V_END_ODD));
+
+		/* Program Hsync timing */
+		hs_begin = de_h_end + front_porch_venc;
+		if (de_h_end + front_porch_venc >= total_pixels_venc) {
+			hs_begin -= total_pixels_venc;
+			vs_adjust  = 1;
+		} else {
+			hs_begin = de_h_end + front_porch_venc;
+			vs_adjust  = 0;
+		}
+
+		hs_end = modulo(hs_begin + hsync_pixels_venc,
+				total_pixels_venc);
+		writel(hs_begin,
+		       priv->io_base + _REG(ENCI_DVI_HSO_BEGIN));
+		writel(hs_end,
+		       priv->io_base + _REG(ENCI_DVI_HSO_END));
+
+		/* Program Vsync timing for even field */
+		if (((de_v_end_odd - 1) + eof_lines + vs_adjust) >= lines_f1) {
+			vs_bline_evn = (de_v_end_odd - 1)
+					+ eof_lines
+					+ vs_adjust
+					- lines_f1;
+			vs_eline_evn = vs_bline_evn + vsync_lines;
+
+			writel(vs_bline_evn,
+			       priv->io_base + _REG(ENCI_DVI_VSO_BLINE_EVN));
+
+			writel(vs_eline_evn,
+			       priv->io_base + _REG(ENCI_DVI_VSO_ELINE_EVN));
+
+			writel(hs_begin,
+			       priv->io_base + _REG(ENCI_DVI_VSO_BEGIN_EVN));
+			writel(hs_begin,
+			       priv->io_base + _REG(ENCI_DVI_VSO_END_EVN));
+		} else {
+			vs_bline_odd = (de_v_end_odd - 1)
+					+ eof_lines
+					+ vs_adjust;
+
+			writel(vs_bline_odd,
+			       priv->io_base + _REG(ENCI_DVI_VSO_BLINE_ODD));
+
+			writel(hs_begin,
+			       priv->io_base + _REG(ENCI_DVI_VSO_BEGIN_ODD));
+
+			if ((vs_bline_odd + vsync_lines) >= lines_f1) {
+				vs_eline_evn = vs_bline_odd
+						+ vsync_lines
+						- lines_f1;
+
+				writel(vs_eline_evn, priv->io_base
+				       + _REG(ENCI_DVI_VSO_ELINE_EVN));
+
+				writel(hs_begin, priv->io_base
+				       + _REG(ENCI_DVI_VSO_END_EVN));
+			} else {
+				vs_eline_odd = vs_bline_odd
+						+ vsync_lines;
+
+				writel(vs_eline_odd, priv->io_base
+				       + _REG(ENCI_DVI_VSO_ELINE_ODD));
+
+				writel(hs_begin, priv->io_base
+				       + _REG(ENCI_DVI_VSO_END_ODD));
+			}
+		}
+
+		/* Program Vsync timing for odd field */
+		if (((de_v_end_even - 1) + (eof_lines + 1)) >= lines_f0) {
+			vs_bline_odd = (de_v_end_even - 1)
+					+ (eof_lines + 1)
+					- lines_f0;
+			vs_eline_odd = vs_bline_odd + vsync_lines;
+
+			writel(vs_bline_odd,
+			       priv->io_base + _REG(ENCI_DVI_VSO_BLINE_ODD));
+
+			writel(vs_eline_odd,
+			       priv->io_base + _REG(ENCI_DVI_VSO_ELINE_ODD));
+
+			vso_begin_odd  = modulo(hs_begin
+						+ (total_pixels_venc >> 1),
+						total_pixels_venc);
+
+			writel(vso_begin_odd,
+			       priv->io_base + _REG(ENCI_DVI_VSO_BEGIN_ODD));
+			writel(vso_begin_odd,
+			       priv->io_base + _REG(ENCI_DVI_VSO_END_ODD));
+		} else {
+			vs_bline_evn = (de_v_end_even - 1)
+					+ (eof_lines + 1);
+
+			writel(vs_bline_evn,
+			       priv->io_base + _REG(ENCI_DVI_VSO_BLINE_EVN));
+
+			vso_begin_evn  = modulo(hs_begin
+						+ (total_pixels_venc >> 1),
+						total_pixels_venc);
+
+			writel(vso_begin_evn, priv->io_base
+					+ _REG(ENCI_DVI_VSO_BEGIN_EVN));
+
+			if (vs_bline_evn + vsync_lines >= lines_f0) {
+				vs_eline_odd = vs_bline_evn
+						+ vsync_lines
+						- lines_f0;
+
+				writel(vs_eline_odd, priv->io_base
+						+ _REG(ENCI_DVI_VSO_ELINE_ODD));
+
+				writel(vso_begin_evn, priv->io_base
+						+ _REG(ENCI_DVI_VSO_END_ODD));
+			} else {
+				vs_eline_evn = vs_bline_evn + vsync_lines;
+
+				writel(vs_eline_evn, priv->io_base
+						+ _REG(ENCI_DVI_VSO_ELINE_EVN));
+
+				writel(vso_begin_evn, priv->io_base
+						+ _REG(ENCI_DVI_VSO_END_EVN));
+			}
+		}
+	} else {
+		writel(vmode->encp.dvi_settings,
+		       priv->io_base + _REG(VENC_DVI_SETTING));
+		writel(vmode->encp.video_mode,
+		       priv->io_base + _REG(ENCP_VIDEO_MODE));
+		writel(vmode->encp.video_mode_adv,
+		       priv->io_base + _REG(ENCP_VIDEO_MODE_ADV));
+		if (vmode->encp.video_prog_mode_present)
+			writel(vmode->encp.video_prog_mode,
+			       priv->io_base + _REG(VENC_VIDEO_PROG_MODE));
+		if (vmode->encp.video_sync_mode_present)
+			writel(vmode->encp.video_sync_mode,
+			       priv->io_base + _REG(ENCP_VIDEO_SYNC_MODE));
+		if (vmode->encp.video_yc_dly_present)
+			writel(vmode->encp.video_yc_dly,
+			       priv->io_base + _REG(ENCP_VIDEO_YC_DLY));
+		if (vmode->encp.video_rgb_ctrl_present)
+			writel(vmode->encp.video_rgb_ctrl,
+			       priv->io_base + _REG(ENCP_VIDEO_RGB_CTRL));
+		if (vmode->encp.video_filt_ctrl_present)
+			writel(vmode->encp.video_filt_ctrl,
+			       priv->io_base + _REG(ENCP_VIDEO_FILT_CTRL));
+		if (vmode->encp.video_ofld_voav_ofst_present)
+			writel(vmode->encp.video_ofld_voav_ofst,
+			       priv->io_base
+			       + _REG(ENCP_VIDEO_OFLD_VOAV_OFST));
+		writel(vmode->encp.yfp1_htime,
+		       priv->io_base + _REG(ENCP_VIDEO_YFP1_HTIME));
+		writel(vmode->encp.yfp2_htime,
+		       priv->io_base + _REG(ENCP_VIDEO_YFP2_HTIME));
+		writel(vmode->encp.max_pxcnt,
+		       priv->io_base + _REG(ENCP_VIDEO_MAX_PXCNT));
+		writel(vmode->encp.hspuls_begin,
+		       priv->io_base + _REG(ENCP_VIDEO_HSPULS_BEGIN));
+		writel(vmode->encp.hspuls_end,
+		       priv->io_base + _REG(ENCP_VIDEO_HSPULS_END));
+		writel(vmode->encp.hspuls_switch,
+		       priv->io_base + _REG(ENCP_VIDEO_HSPULS_SWITCH));
+		writel(vmode->encp.vspuls_begin,
+		       priv->io_base + _REG(ENCP_VIDEO_VSPULS_BEGIN));
+		writel(vmode->encp.vspuls_end,
+		       priv->io_base + _REG(ENCP_VIDEO_VSPULS_END));
+		writel(vmode->encp.vspuls_bline,
+		       priv->io_base + _REG(ENCP_VIDEO_VSPULS_BLINE));
+		writel(vmode->encp.vspuls_eline,
+		       priv->io_base + _REG(ENCP_VIDEO_VSPULS_ELINE));
+		if (vmode->encp.eqpuls_begin_present)
+			writel(vmode->encp.eqpuls_begin,
+			       priv->io_base + _REG(ENCP_VIDEO_EQPULS_BEGIN));
+		if (vmode->encp.eqpuls_end_present)
+			writel(vmode->encp.eqpuls_end,
+			       priv->io_base + _REG(ENCP_VIDEO_EQPULS_END));
+		if (vmode->encp.eqpuls_bline_present)
+			writel(vmode->encp.eqpuls_bline,
+			       priv->io_base + _REG(ENCP_VIDEO_EQPULS_BLINE));
+		if (vmode->encp.eqpuls_eline_present)
+			writel(vmode->encp.eqpuls_eline,
+			       priv->io_base + _REG(ENCP_VIDEO_EQPULS_ELINE));
+		writel(vmode->encp.havon_begin,
+		       priv->io_base + _REG(ENCP_VIDEO_HAVON_BEGIN));
+		writel(vmode->encp.havon_end,
+		       priv->io_base + _REG(ENCP_VIDEO_HAVON_END));
+		writel(vmode->encp.vavon_bline,
+		       priv->io_base + _REG(ENCP_VIDEO_VAVON_BLINE));
+		writel(vmode->encp.vavon_eline,
+		       priv->io_base + _REG(ENCP_VIDEO_VAVON_ELINE));
+		writel(vmode->encp.hso_begin,
+		       priv->io_base + _REG(ENCP_VIDEO_HSO_BEGIN));
+		writel(vmode->encp.hso_end,
+		       priv->io_base + _REG(ENCP_VIDEO_HSO_END));
+		writel(vmode->encp.vso_begin,
+		       priv->io_base + _REG(ENCP_VIDEO_VSO_BEGIN));
+		writel(vmode->encp.vso_end,
+		       priv->io_base + _REG(ENCP_VIDEO_VSO_END));
+		writel(vmode->encp.vso_bline,
+		       priv->io_base + _REG(ENCP_VIDEO_VSO_BLINE));
+		if (vmode->encp.vso_eline_present)
+			writel(vmode->encp.vso_eline,
+			       priv->io_base + _REG(ENCP_VIDEO_VSO_ELINE));
+		if (vmode->encp.sy_val_present)
+			writel(vmode->encp.sy_val,
+			       priv->io_base + _REG(ENCP_VIDEO_SY_VAL));
+		if (vmode->encp.sy2_val_present)
+			writel(vmode->encp.sy2_val,
+			       priv->io_base + _REG(ENCP_VIDEO_SY2_VAL));
+		writel(vmode->encp.max_lncnt,
+		       priv->io_base + _REG(ENCP_VIDEO_MAX_LNCNT));
+
+		writel(1, priv->io_base + _REG(ENCP_VIDEO_EN));
+
+		/* Set DE signal's polarity is active high */
+		writel_bits(BIT(14), BIT(14),
+			    priv->io_base + _REG(ENCP_VIDEO_MODE));
+
+		/* Program DE timing */
+		de_h_begin = modulo(readl(priv->io_base +
+					_REG(ENCP_VIDEO_HAVON_BEGIN))
+					+ venc_hdmi_latency,
+				    total_pixels_venc);
+		de_h_end = modulo(de_h_begin + active_pixels_venc,
+				  total_pixels_venc);
+
+		writel(de_h_begin,
+		       priv->io_base + _REG(ENCP_DE_H_BEGIN));
+		writel(de_h_end,
+		       priv->io_base + _REG(ENCP_DE_H_END));
+
+		/* Program DE timing for even field */
+		de_v_begin_even = readl(priv->io_base
+						+ _REG(ENCP_VIDEO_VAVON_BLINE));
+		if (mode->flags & DISPLAY_FLAGS_INTERLACED)
+			de_v_end_even = de_v_begin_even +
+					(mode->vactive.typ / 2);
+		else
+			de_v_end_even = de_v_begin_even + mode->vactive.typ;
+
+		writel(de_v_begin_even,
+		       priv->io_base + _REG(ENCP_DE_V_BEGIN_EVEN));
+		writel(de_v_end_even,
+		       priv->io_base + _REG(ENCP_DE_V_END_EVEN));
+
+		/* Program DE timing for odd field if needed */
+		if (mode->flags & DISPLAY_FLAGS_INTERLACED) {
+			unsigned int ofld_voav_ofst =
+				readl(priv->io_base +
+					_REG(ENCP_VIDEO_OFLD_VOAV_OFST));
+			de_v_begin_odd = to_signed((ofld_voav_ofst & 0xf0) >> 4)
+					+ de_v_begin_even
+					+ ((mode->vfront_porch.typ +
+					    mode->vactive.typ +
+					    mode->vsync_len.typ - 1) / 2);
+			de_v_end_odd = de_v_begin_odd + (mode->vactive.typ / 2);
+
+			writel(de_v_begin_odd,
+			       priv->io_base + _REG(ENCP_DE_V_BEGIN_ODD));
+			writel(de_v_end_odd,
+			       priv->io_base + _REG(ENCP_DE_V_END_ODD));
+		}
+
+		/* Program Hsync timing */
+		if ((de_h_end + front_porch_venc) >= total_pixels_venc) {
+			hs_begin = de_h_end
+				   + front_porch_venc
+				   - total_pixels_venc;
+			vs_adjust  = 1;
+		} else {
+			hs_begin = de_h_end
+				   + front_porch_venc;
+			vs_adjust  = 0;
+		}
+
+		hs_end = modulo(hs_begin + hsync_pixels_venc,
+				total_pixels_venc);
+
+		writel(hs_begin,
+		       priv->io_base + _REG(ENCP_DVI_HSO_BEGIN));
+		writel(hs_end,
+		       priv->io_base + _REG(ENCP_DVI_HSO_END));
+
+		/* Program Vsync timing for even field */
+		if (de_v_begin_even >=
+				(sof_lines + vsync_lines + (1 - vs_adjust)))
+			vs_bline_evn = de_v_begin_even
+					- sof_lines
+					- vsync_lines
+					- (1 - vs_adjust);
+		else
+			vs_bline_evn = (mode->vfront_porch.typ +
+					mode->vactive.typ +
+					mode->vsync_len.typ) +
+					+ de_v_begin_even
+					- sof_lines
+					- vsync_lines
+					- (1 - vs_adjust);
+
+		vs_eline_evn = modulo(vs_bline_evn + vsync_lines,
+				      mode->hfront_porch.typ +
+				      mode->hactive.typ +
+				      mode->hsync_len.typ);
+
+		writel(vs_bline_evn,
+		       priv->io_base + _REG(ENCP_DVI_VSO_BLINE_EVN));
+		writel(vs_eline_evn,
+		       priv->io_base + _REG(ENCP_DVI_VSO_ELINE_EVN));
+
+		vso_begin_evn = hs_begin;
+		writel(vso_begin_evn,
+		       priv->io_base + _REG(ENCP_DVI_VSO_BEGIN_EVN));
+		writel(vso_begin_evn,
+		       priv->io_base + _REG(ENCP_DVI_VSO_END_EVN));
+
+		/* Program Vsync timing for odd field if needed */
+		if (mode->flags & DISPLAY_FLAGS_INTERLACED) {
+			vs_bline_odd = (de_v_begin_odd - 1)
+					- sof_lines
+					- vsync_lines;
+			vs_eline_odd = (de_v_begin_odd - 1)
+					- vsync_lines;
+			vso_begin_odd  = modulo(hs_begin
+						+ (total_pixels_venc >> 1),
+						total_pixels_venc);
+
+			writel(vs_bline_odd,
+			       priv->io_base + _REG(ENCP_DVI_VSO_BLINE_ODD));
+			writel(vs_eline_odd,
+			       priv->io_base + _REG(ENCP_DVI_VSO_ELINE_ODD));
+			writel(vso_begin_odd,
+			       priv->io_base + _REG(ENCP_DVI_VSO_BEGIN_ODD));
+			writel(vso_begin_odd,
+			       priv->io_base + _REG(ENCP_DVI_VSO_END_ODD));
+		}
+
+		/* Select ENCP for VIU */
+		meson_vpp_setup_mux(priv, MESON_VIU_VPP_MUX_ENCP);
+	}
+
+	writel((use_enci ? 1 : 2) |
+		       (mode->flags & DISPLAY_FLAGS_HSYNC_HIGH ? 1 << 2 : 0) |
+		       (mode->flags & DISPLAY_FLAGS_VSYNC_HIGH ? 1 << 3 : 0) |
+		       4 << 5 |
+		       (venc_repeat ? 1 << 8 : 0) |
+		       (hdmi_repeat ? 1 << 12 : 0),
+		       priv->io_base + _REG(VPU_HDMI_SETTING));
+}
+
+static void meson_venci_cvbs_mode_set(struct meson_vpu_priv *priv,
+				      struct meson_cvbs_enci_mode *mode)
+{
+	/* CVBS Filter settings */
+	writel(0x12, priv->io_base + _REG(ENCI_CFILT_CTRL));
+	writel(0x12, priv->io_base + _REG(ENCI_CFILT_CTRL2));
+
+	/* Digital Video Select : Interlace, clk27 clk, external */
+	writel(0, priv->io_base + _REG(VENC_DVI_SETTING));
+
+	/* Reset Video Mode */
+	writel(0, priv->io_base + _REG(ENCI_VIDEO_MODE));
+	writel(0, priv->io_base + _REG(ENCI_VIDEO_MODE_ADV));
+
+	/* Horizontal sync signal output */
+	writel(mode->hso_begin,
+	       priv->io_base + _REG(ENCI_SYNC_HSO_BEGIN));
+	writel(mode->hso_end,
+	       priv->io_base + _REG(ENCI_SYNC_HSO_END));
+
+	/* Vertical Sync lines */
+	writel(mode->vso_even,
+	       priv->io_base + _REG(ENCI_SYNC_VSO_EVNLN));
+	writel(mode->vso_odd,
+	       priv->io_base + _REG(ENCI_SYNC_VSO_ODDLN));
+
+	/* Macrovision max amplitude change */
+	writel(0x8100 + mode->macv_max_amp,
+	       priv->io_base + _REG(ENCI_MACV_MAX_AMP));
+
+	/* Video mode */
+	writel(mode->video_prog_mode,
+	       priv->io_base + _REG(VENC_VIDEO_PROG_MODE));
+	writel(mode->video_mode,
+	       priv->io_base + _REG(ENCI_VIDEO_MODE));
+
+	/* Advanced Video Mode :
+	 * Demux shifting 0x2
+	 * Blank line end at line17/22
+	 * High bandwidth Luma Filter
+	 * Low bandwidth Chroma Filter
+	 * Bypass luma low pass filter
+	 * No macrovision on CSYNC
+	 */
+	writel(0x26, priv->io_base + _REG(ENCI_VIDEO_MODE_ADV));
+
+	writel(mode->sch_adjust, priv->io_base + _REG(ENCI_VIDEO_SCH));
+
+	/* Sync mode : MASTER Master mode, free run, send HSO/VSO out */
+	writel(0x07, priv->io_base + _REG(ENCI_SYNC_MODE));
+
+	/* 0x3 Y, C, and Component Y delay */
+	writel(mode->yc_delay, priv->io_base + _REG(ENCI_YC_DELAY));
+
+	/* Timings */
+	writel(mode->pixel_start,
+	       priv->io_base + _REG(ENCI_VFIFO2VD_PIXEL_START));
+	writel(mode->pixel_end,
+	       priv->io_base + _REG(ENCI_VFIFO2VD_PIXEL_END));
+
+	writel(mode->top_field_line_start,
+	       priv->io_base + _REG(ENCI_VFIFO2VD_LINE_TOP_START));
+	writel(mode->top_field_line_end,
+	       priv->io_base + _REG(ENCI_VFIFO2VD_LINE_TOP_END));
+
+	writel(mode->bottom_field_line_start,
+	       priv->io_base + _REG(ENCI_VFIFO2VD_LINE_BOT_START));
+	writel(mode->bottom_field_line_end,
+	       priv->io_base + _REG(ENCI_VFIFO2VD_LINE_BOT_END));
+
+	/* Internal Venc, Internal VIU Sync, Internal Vencoder */
+	writel(0, priv->io_base + _REG(VENC_SYNC_ROUTE));
+
+	/* UNreset Interlaced TV Encoder */
+	writel(0, priv->io_base + _REG(ENCI_DBG_PX_RST));
+
+	/* Enable Vfifo2vd, Y_Cb_Y_Cr select */
+	writel(0x4e01, priv->io_base + _REG(ENCI_VFIFO2VD_CTL));
+
+	/* Power UP Dacs */
+	writel(0, priv->io_base + _REG(VENC_VDAC_SETTING));
+
+	/* Video Upsampling */
+	writel(0x0061, priv->io_base + _REG(VENC_UPSAMPLE_CTRL0));
+	writel(0x4061, priv->io_base + _REG(VENC_UPSAMPLE_CTRL1));
+	writel(0x5061, priv->io_base + _REG(VENC_UPSAMPLE_CTRL2));
+
+	/* Select Interlace Y DACs */
+	writel(0, priv->io_base + _REG(VENC_VDAC_DACSEL0));
+	writel(0, priv->io_base + _REG(VENC_VDAC_DACSEL1));
+	writel(0, priv->io_base + _REG(VENC_VDAC_DACSEL2));
+	writel(0, priv->io_base + _REG(VENC_VDAC_DACSEL3));
+	writel(0, priv->io_base + _REG(VENC_VDAC_DACSEL4));
+	writel(0, priv->io_base + _REG(VENC_VDAC_DACSEL5));
+
+	/* Select ENCI for VIU */
+	meson_vpp_setup_mux(priv, MESON_VIU_VPP_MUX_ENCI);
+
+	/* Enable ENCI FIFO */
+	writel(0x2000, priv->io_base + _REG(VENC_VDAC_FIFO_CTRL));
+
+	/* Select ENCI DACs 0, 1, 4, and 5 */
+	writel(0x11, priv->io_base + _REG(ENCI_DACSEL_0));
+	writel(0x11, priv->io_base + _REG(ENCI_DACSEL_1));
+
+	/* Interlace video enable */
+	writel(1, priv->io_base + _REG(ENCI_VIDEO_EN));
+
+	/* Configure Video Saturation / Contrast / Brightness / Hue */
+	writel(mode->video_saturation,
+	       priv->io_base + _REG(ENCI_VIDEO_SAT));
+	writel(mode->video_contrast,
+	       priv->io_base + _REG(ENCI_VIDEO_CONT));
+	writel(mode->video_brightness,
+	       priv->io_base + _REG(ENCI_VIDEO_BRIGHT));
+	writel(mode->video_hue,
+	       priv->io_base + _REG(ENCI_VIDEO_HUE));
+
+	/* Enable DAC0 Filter */
+	writel(0x1, priv->io_base + _REG(VENC_VDAC_DAC0_FILT_CTRL0));
+	writel(0xfc48, priv->io_base + _REG(VENC_VDAC_DAC0_FILT_CTRL1));
+
+	/* 0 in Macrovision register 0 */
+	writel(0, priv->io_base + _REG(ENCI_MACV_N0));
+
+	/* Analog Synchronization and color burst value adjust */
+	writel(mode->analog_sync_adj,
+	       priv->io_base + _REG(ENCI_SYNC_ADJ));
+
+	/* enable VDAC */
+	writel_bits(BIT(5), 0, priv->io_base + _REG(VENC_VDAC_DACSEL0));
+
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
+		hhi_write(HHI_VDAC_CNTL0, 1);
+	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL) ||
+		 meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM))
+		hhi_write(HHI_VDAC_CNTL0, 0xf0001);
+
+	hhi_write(HHI_VDAC_CNTL1, 0);
+}
+
+void meson_vpu_setup_venc(struct udevice *dev,
+			  const struct display_timing *mode, bool is_cvbs)
+{
+	struct meson_vpu_priv *priv = dev_get_priv(dev);
+
+	if (is_cvbs)
+		return meson_venci_cvbs_mode_set(priv, &meson_cvbs_enci_pal);
+
+	meson_venc_hdmi_mode_set(priv, mode);
+}
diff --git a/drivers/video/meson/meson_vpu.c b/drivers/video/meson/meson_vpu.c
new file mode 100644
index 0000000000..279401d597
--- /dev/null
+++ b/drivers/video/meson/meson_vpu.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic Meson Video Processing Unit driver
+ *
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson_vpu.h"
+#include <power-domain.h>
+#include <efi_loader.h>
+#include <dm/device-internal.h>
+#include <dm/uclass-internal.h>
+#include <fdt_support.h>
+#include <linux/sizes.h>
+#include <asm/arch/mem.h>
+#include "meson_registers.h"
+#include "simplefb_common.h"
+
+#define MESON_VPU_OVERSCAN SZ_64K
+
+/* Static variable for use in meson_vpu_rsv_fb() */
+static struct meson_framebuffer {
+	u64 base;
+	u64 fb_size;
+	unsigned int xsize;
+	unsigned int ysize;
+	bool is_cvbs;
+} meson_fb = { 0 };
+
+static int meson_vpu_setup_mode(struct udevice *dev, struct udevice *disp)
+{
+	struct video_uc_platdata *uc_plat = dev_get_uclass_platdata(dev);
+	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct display_timing timing;
+	bool is_cvbs = false;
+	int ret = 0;
+
+	if (disp) {
+		ret = display_read_timing(disp, &timing);
+		if (ret) {
+			debug("%s: Failed to read timings\n", __func__);
+			goto cvbs;
+		}
+
+		uc_priv->xsize = timing.hactive.typ;
+		uc_priv->ysize = timing.vactive.typ;
+
+		ret = display_enable(disp, 0, &timing);
+		if (ret)
+			goto cvbs;
+	} else {
+cvbs:
+		/* CVBS has a fixed 720x480i (NTSC) and 720x576i (PAL) */
+		is_cvbs = true;
+		timing.flags = DISPLAY_FLAGS_INTERLACED;
+		uc_priv->xsize = 720;
+		uc_priv->ysize = 576;
+	}
+
+	uc_priv->bpix = VPU_MAX_LOG2_BPP;
+
+	meson_fb.is_cvbs = is_cvbs;
+	meson_fb.xsize = uc_priv->xsize;
+	meson_fb.ysize = uc_priv->ysize;
+
+	/* Move the framebuffer to the end of addressable ram */
+	meson_fb.fb_size = ALIGN(meson_fb.xsize * meson_fb.ysize *
+				 ((1 << VPU_MAX_LOG2_BPP) / 8) +
+				 MESON_VPU_OVERSCAN, EFI_PAGE_SIZE);
+	meson_fb.base = gd->bd->bi_dram[0].start +
+			gd->bd->bi_dram[0].size - meson_fb.fb_size;
+
+	/* Override the framebuffer address */
+	uc_plat->base = meson_fb.base;
+
+	meson_vpu_setup_plane(dev, timing.flags & DISPLAY_FLAGS_INTERLACED);
+	meson_vpu_setup_venc(dev, &timing, is_cvbs);
+	meson_vpu_setup_vclk(dev, &timing, is_cvbs);
+
+	video_set_flush_dcache(dev, 1);
+
+	return 0;
+}
+
+static const struct udevice_id meson_vpu_ids[] = {
+	{ .compatible = "amlogic,meson-gxbb-vpu", .data = VPU_COMPATIBLE_GXBB },
+	{ .compatible = "amlogic,meson-gxl-vpu", .data = VPU_COMPATIBLE_GXL },
+	{ .compatible = "amlogic,meson-gxm-vpu", .data = VPU_COMPATIBLE_GXM },
+	{ }
+};
+
+static int meson_vpu_probe(struct udevice *dev)
+{
+	struct meson_vpu_priv *priv = dev_get_priv(dev);
+	struct power_domain pd;
+	struct udevice *disp;
+	int ret;
+
+	/* Before relocation we don't need to do anything */
+	if (!(gd->flags & GD_FLG_RELOC))
+		return 0;
+
+	priv->dev = dev;
+
+	priv->io_base = dev_remap_addr_index(dev, 0);
+	if (!priv->io_base)
+		return -EINVAL;
+
+	priv->hhi_base = dev_remap_addr_index(dev, 1);
+	if (!priv->hhi_base)
+		return -EINVAL;
+
+	priv->dmc_base = dev_remap_addr_index(dev, 2);
+	if (!priv->dmc_base)
+		return -EINVAL;
+
+	ret = power_domain_get(dev, &pd);
+	if (ret)
+		return ret;
+
+	ret = power_domain_on(&pd);
+	if (ret)
+		return ret;
+
+	meson_vpu_init(dev);
+
+	/* probe the display */
+	ret = uclass_get_device(UCLASS_DISPLAY, 0, &disp);
+
+	return meson_vpu_setup_mode(dev, ret ? NULL : disp);
+}
+
+static int meson_vpu_bind(struct udevice *dev)
+{
+	struct video_uc_platdata *plat = dev_get_uclass_platdata(dev);
+
+	plat->size = VPU_MAX_WIDTH * VPU_MAX_HEIGHT *
+		(1 << VPU_MAX_LOG2_BPP) / 8;
+
+	return 0;
+}
+
+#if defined(CONFIG_VIDEO_DT_SIMPLEFB)
+static void meson_vpu_setup_simplefb(void *fdt)
+{
+	const char *pipeline = NULL;
+	u64 mem_start, mem_size;
+	int offset, ret;
+
+	if (meson_fb.is_cvbs)
+		pipeline = "vpu-cvbs";
+	else
+		pipeline = "vpu-hdmi";
+
+	offset = meson_simplefb_fdt_match(fdt, pipeline);
+	if (offset < 0) {
+		eprintf("Cannot setup simplefb: node not found\n");
+
+		/* If simplefb is missing, add it as reserved memory */
+		meson_board_add_reserved_memory(fdt, meson_fb.base,
+						meson_fb.fb_size);
+
+		return;
+	}
+
+	/*
+	 * SimpleFB will try to iomap the framebuffer, so we can't use
+	 * fdt_add_mem_rsv on the memory area. Instead, the FB is stored
+	 * at the end of the RAM and we strip this portion from the kernel
+	 * allowed region
+	 */
+	mem_start = gd->bd->bi_dram[0].start;
+	mem_size = gd->bd->bi_dram[0].size - meson_fb.fb_size;
+	ret = fdt_fixup_memory_banks(fdt, &mem_start, &mem_size, 1);
+	if (ret) {
+		eprintf("Cannot setup simplefb: Error reserving memory\n");
+		return;
+	}
+
+	ret = fdt_setup_simplefb_node(fdt, offset, meson_fb.base,
+				      meson_fb.xsize, meson_fb.ysize,
+				      meson_fb.xsize * 4, "x8r8g8b8");
+	if (ret)
+		eprintf("Cannot setup simplefb: Error setting properties\n");
+}
+#endif
+
+void meson_vpu_rsv_fb(void *fdt)
+{
+	if (!meson_fb.base || !meson_fb.xsize || !meson_fb.ysize)
+		return;
+
+#if defined(CONFIG_EFI_LOADER)
+	efi_add_memory_map(meson_fb.base, meson_fb.fb_size >> EFI_PAGE_SHIFT,
+			   EFI_RESERVED_MEMORY_TYPE, false);
+#endif
+#if defined(CONFIG_VIDEO_DT_SIMPLEFB)
+	meson_vpu_setup_simplefb(fdt);
+#endif
+}
+
+U_BOOT_DRIVER(meson_vpu) = {
+	.name = "meson_vpu",
+	.id = UCLASS_VIDEO,
+	.of_match = meson_vpu_ids,
+	.probe = meson_vpu_probe,
+	.bind = meson_vpu_bind,
+	.priv_auto_alloc_size = sizeof(struct meson_vpu_priv),
+	.flags  = DM_FLAG_PRE_RELOC,
+};
diff --git a/drivers/video/meson/meson_vpu.h b/drivers/video/meson/meson_vpu.h
new file mode 100644
index 0000000000..ef5f10eae3
--- /dev/null
+++ b/drivers/video/meson/meson_vpu.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Amlogic Meson Video Processing Unit driver
+ *
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef __MESON_VPU_H__
+#define __MESON_VPU_H__
+
+#include <common.h>
+#include <dm.h>
+#include <video.h>
+#include <display.h>
+#include <linux/io.h>
+#include "meson_registers.h"
+
+enum {
+	/* Maximum size we support */
+	VPU_MAX_WIDTH		= 3840,
+	VPU_MAX_HEIGHT		= 2160,
+	VPU_MAX_LOG2_BPP	= VIDEO_BPP32,
+};
+
+enum vpu_compatible {
+	VPU_COMPATIBLE_GXBB = 0,
+	VPU_COMPATIBLE_GXL = 1,
+	VPU_COMPATIBLE_GXM = 2,
+};
+
+struct meson_vpu_priv {
+	struct udevice *dev;
+	void __iomem *io_base;
+	void __iomem *hhi_base;
+	void __iomem *dmc_base;
+};
+
+static inline bool meson_vpu_is_compatible(struct meson_vpu_priv *priv,
+					   enum vpu_compatible family)
+{
+	enum vpu_compatible compat = dev_get_driver_data(priv->dev);
+
+	return compat == family;
+}
+
+#define hhi_update_bits(offset, mask, value) \
+	writel_bits(mask, value, priv->hhi_base + offset)
+
+#define hhi_write(offset, value) \
+	writel(value, priv->hhi_base + offset)
+
+#define hhi_read(offset) \
+	readl(priv->hhi_base + offset)
+
+#define dmc_update_bits(offset, mask, value) \
+	writel_bits(mask, value, priv->dmc_base + offset)
+
+#define dmc_write(offset, value) \
+	writel(value, priv->dmc_base + offset)
+
+#define dmc_read(offset) \
+	readl(priv->dmc_base + offset)
+
+#define MESON_CANVAS_ID_OSD1	0x4e
+
+/* Canvas configuration. */
+#define MESON_CANVAS_WRAP_NONE	0x00
+#define	MESON_CANVAS_WRAP_X	0x01
+#define	MESON_CANVAS_WRAP_Y	0x02
+
+#define	MESON_CANVAS_BLKMODE_LINEAR	0x00
+#define	MESON_CANVAS_BLKMODE_32x32	0x01
+#define	MESON_CANVAS_BLKMODE_64x64	0x02
+
+void meson_canvas_setup(struct meson_vpu_priv *priv,
+			u32 canvas_index, u32 addr,
+			u32 stride, u32 height,
+			unsigned int wrap,
+			unsigned int blkmode);
+
+/* Mux VIU/VPP to ENCI */
+#define MESON_VIU_VPP_MUX_ENCI	0x5
+/* Mux VIU/VPP to ENCP */
+#define MESON_VIU_VPP_MUX_ENCP	0xA
+
+void meson_vpp_setup_mux(struct meson_vpu_priv *priv, unsigned int mux);
+void meson_vpu_init(struct udevice *dev);
+void meson_vpu_setup_plane(struct udevice *dev, bool is_interlaced);
+bool meson_venc_hdmi_supported_mode(const struct display_timing *mode);
+void meson_vpu_setup_venc(struct udevice *dev,
+			  const struct display_timing *mode, bool is_cvbs);
+bool meson_vclk_dmt_supported_freq(struct meson_vpu_priv *priv,
+				   unsigned int freq);
+void meson_vpu_setup_vclk(struct udevice *dev,
+			  const struct display_timing *mode, bool is_cvbs);
+#endif
diff --git a/drivers/video/meson/meson_vpu_init.c b/drivers/video/meson/meson_vpu_init.c
new file mode 100644
index 0000000000..92228b5ceb
--- /dev/null
+++ b/drivers/video/meson/meson_vpu_init.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic Meson Video Processing Unit driver
+ *
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#define DEBUG
+
+#include "meson_vpu.h"
+
+/* HHI Registers */
+#define HHI_VDAC_CNTL0		0x2F4 /* 0xbd offset in data sheet */
+#define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
+#define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 offset in data sheet */
+
+/* OSDx_CTRL_STAT2 */
+#define OSD_REPLACE_EN		BIT(14)
+#define OSD_REPLACE_SHIFT	6
+
+void meson_vpp_setup_mux(struct meson_vpu_priv *priv, unsigned int mux)
+{
+	writel(mux, priv->io_base + _REG(VPU_VIU_VENC_MUX_CTRL));
+}
+
+static unsigned int vpp_filter_coefs_4point_bspline[] = {
+	0x15561500, 0x14561600, 0x13561700, 0x12561800,
+	0x11551a00, 0x11541b00, 0x10541c00, 0x0f541d00,
+	0x0f531e00, 0x0e531f00, 0x0d522100, 0x0c522200,
+	0x0b522300, 0x0b512400, 0x0a502600, 0x0a4f2700,
+	0x094e2900, 0x084e2a00, 0x084d2b00, 0x074c2c01,
+	0x074b2d01, 0x064a2f01, 0x06493001, 0x05483201,
+	0x05473301, 0x05463401, 0x04453601, 0x04433702,
+	0x04423802, 0x03413a02, 0x03403b02, 0x033f3c02,
+	0x033d3d03
+};
+
+static void meson_vpp_write_scaling_filter_coefs(struct meson_vpu_priv *priv,
+						 const unsigned int *coefs,
+						 bool is_horizontal)
+{
+	int i;
+
+	writel(is_horizontal ? BIT(8) : 0,
+	       priv->io_base + _REG(VPP_OSD_SCALE_COEF_IDX));
+	for (i = 0; i < 33; i++)
+		writel(coefs[i],
+		       priv->io_base + _REG(VPP_OSD_SCALE_COEF));
+}
+
+static const u32 vpp_filter_coefs_bicubic[] = {
+	0x00800000, 0x007f0100, 0xff7f0200, 0xfe7f0300,
+	0xfd7e0500, 0xfc7e0600, 0xfb7d0800, 0xfb7c0900,
+	0xfa7b0b00, 0xfa7a0dff, 0xf9790fff, 0xf97711ff,
+	0xf87613ff, 0xf87416fe, 0xf87218fe, 0xf8701afe,
+	0xf76f1dfd, 0xf76d1ffd, 0xf76b21fd, 0xf76824fd,
+	0xf76627fc, 0xf76429fc, 0xf7612cfc, 0xf75f2ffb,
+	0xf75d31fb, 0xf75a34fb, 0xf75837fa, 0xf7553afa,
+	0xf8523cfa, 0xf8503ff9, 0xf84d42f9, 0xf84a45f9,
+	0xf84848f8
+};
+
+static void meson_vpp_write_vd_scaling_filter_coefs(struct meson_vpu_priv *priv,
+						    const unsigned int *coefs,
+						    bool is_horizontal)
+{
+	int i;
+
+	writel(is_horizontal ? BIT(8) : 0,
+	       priv->io_base + _REG(VPP_SCALE_COEF_IDX));
+	for (i = 0; i < 33; i++)
+		writel(coefs[i],
+		       priv->io_base + _REG(VPP_SCALE_COEF));
+}
+
+/* OSD csc defines */
+
+enum viu_matrix_sel_e {
+	VIU_MATRIX_OSD_EOTF = 0,
+	VIU_MATRIX_OSD,
+};
+
+enum viu_lut_sel_e {
+	VIU_LUT_OSD_EOTF = 0,
+	VIU_LUT_OSD_OETF,
+};
+
+#define COEFF_NORM(a) ((int)((((a) * 2048.0) + 1) / 2))
+#define MATRIX_5X3_COEF_SIZE 24
+
+#define EOTF_COEFF_NORM(a) ((int)((((a) * 4096.0) + 1) / 2))
+#define EOTF_COEFF_SIZE 10
+#define EOTF_COEFF_RIGHTSHIFT 1
+
+static int RGB709_to_YUV709l_coeff[MATRIX_5X3_COEF_SIZE] = {
+	0, 0, 0, /* pre offset */
+	COEFF_NORM(0.181873),	COEFF_NORM(0.611831),	COEFF_NORM(0.061765),
+	COEFF_NORM(-0.100251),	COEFF_NORM(-0.337249),	COEFF_NORM(0.437500),
+	COEFF_NORM(0.437500),	COEFF_NORM(-0.397384),	COEFF_NORM(-0.040116),
+	0, 0, 0, /* 10'/11'/12' */
+	0, 0, 0, /* 20'/21'/22' */
+	64, 512, 512, /* offset */
+	0, 0, 0 /* mode, right_shift, clip_en */
+};
+
+/*  eotf matrix: bypass */
+static int eotf_bypass_coeff[EOTF_COEFF_SIZE] = {
+	EOTF_COEFF_NORM(1.0),	EOTF_COEFF_NORM(0.0),	EOTF_COEFF_NORM(0.0),
+	EOTF_COEFF_NORM(0.0),	EOTF_COEFF_NORM(1.0),	EOTF_COEFF_NORM(0.0),
+	EOTF_COEFF_NORM(0.0),	EOTF_COEFF_NORM(0.0),	EOTF_COEFF_NORM(1.0),
+	EOTF_COEFF_RIGHTSHIFT /* right shift */
+};
+
+static void meson_viu_set_osd_matrix(struct meson_vpu_priv *priv,
+				     enum viu_matrix_sel_e m_select,
+				     int *m, bool csc_on)
+{
+	if (m_select == VIU_MATRIX_OSD) {
+		/* osd matrix, VIU_MATRIX_0 */
+		writel(((m[0] & 0xfff) << 16) | (m[1] & 0xfff),
+		       priv->io_base + _REG(VIU_OSD1_MATRIX_PRE_OFFSET0_1));
+		writel(m[2] & 0xfff,
+		       priv->io_base + _REG(VIU_OSD1_MATRIX_PRE_OFFSET2));
+		writel(((m[3] & 0x1fff) << 16) | (m[4] & 0x1fff),
+		       priv->io_base + _REG(VIU_OSD1_MATRIX_COEF00_01));
+		writel(((m[5] & 0x1fff) << 16) | (m[6] & 0x1fff),
+		       priv->io_base + _REG(VIU_OSD1_MATRIX_COEF02_10));
+		writel(((m[7] & 0x1fff) << 16) | (m[8] & 0x1fff),
+		       priv->io_base + _REG(VIU_OSD1_MATRIX_COEF11_12));
+		writel(((m[9] & 0x1fff) << 16) | (m[10] & 0x1fff),
+		       priv->io_base + _REG(VIU_OSD1_MATRIX_COEF20_21));
+
+		if (m[21]) {
+			writel(((m[11] & 0x1fff) << 16) | (m[12] & 0x1fff),
+			       priv->io_base +
+					_REG(VIU_OSD1_MATRIX_COEF22_30));
+			writel(((m[13] & 0x1fff) << 16) | (m[14] & 0x1fff),
+			       priv->io_base +
+					_REG(VIU_OSD1_MATRIX_COEF31_32));
+			writel(((m[15] & 0x1fff) << 16) | (m[16] & 0x1fff),
+			       priv->io_base +
+					_REG(VIU_OSD1_MATRIX_COEF40_41));
+			writel(m[17] & 0x1fff, priv->io_base +
+			       _REG(VIU_OSD1_MATRIX_COLMOD_COEF42));
+		} else {
+			writel((m[11] & 0x1fff) << 16, priv->io_base +
+			       _REG(VIU_OSD1_MATRIX_COEF22_30));
+		}
+
+		writel(((m[18] & 0xfff) << 16) | (m[19] & 0xfff),
+		       priv->io_base + _REG(VIU_OSD1_MATRIX_OFFSET0_1));
+		writel(m[20] & 0xfff,
+		       priv->io_base + _REG(VIU_OSD1_MATRIX_OFFSET2));
+
+		writel_bits(3 << 30, m[21] << 30,
+			    priv->io_base +
+			    _REG(VIU_OSD1_MATRIX_COLMOD_COEF42));
+		writel_bits(7 << 16, m[22] << 16,
+			    priv->io_base +
+			    _REG(VIU_OSD1_MATRIX_COLMOD_COEF42));
+
+		/* 23 reserved for clipping control */
+		writel_bits(BIT(0), csc_on ? BIT(0) : 0,
+			    priv->io_base + _REG(VIU_OSD1_MATRIX_CTRL));
+		writel_bits(BIT(1), 0,
+			    priv->io_base + _REG(VIU_OSD1_MATRIX_CTRL));
+	} else if (m_select == VIU_MATRIX_OSD_EOTF) {
+		int i;
+
+		/* osd eotf matrix, VIU_MATRIX_OSD_EOTF */
+		for (i = 0; i < 5; i++)
+			writel(((m[i * 2] & 0x1fff) << 16) |
+				(m[i * 2 + 1] & 0x1fff), priv->io_base +
+				_REG(VIU_OSD1_EOTF_CTL + i + 1));
+
+		writel_bits(BIT(30), csc_on ? BIT(30) : 0,
+			    priv->io_base + _REG(VIU_OSD1_EOTF_CTL));
+		writel_bits(BIT(31), csc_on ? BIT(31) : 0,
+			    priv->io_base + _REG(VIU_OSD1_EOTF_CTL));
+	}
+}
+
+#define OSD_EOTF_LUT_SIZE 33
+#define OSD_OETF_LUT_SIZE 41
+
+static void meson_viu_set_osd_lut(struct meson_vpu_priv *priv,
+				  enum viu_lut_sel_e lut_sel,
+				  unsigned int *r_map, unsigned int *g_map,
+				  unsigned int *b_map,
+				  bool csc_on)
+{
+	unsigned int addr_port;
+	unsigned int data_port;
+	unsigned int ctrl_port;
+	int i;
+
+	if (lut_sel == VIU_LUT_OSD_EOTF) {
+		addr_port = VIU_OSD1_EOTF_LUT_ADDR_PORT;
+		data_port = VIU_OSD1_EOTF_LUT_DATA_PORT;
+		ctrl_port = VIU_OSD1_EOTF_CTL;
+	} else if (lut_sel == VIU_LUT_OSD_OETF) {
+		addr_port = VIU_OSD1_OETF_LUT_ADDR_PORT;
+		data_port = VIU_OSD1_OETF_LUT_DATA_PORT;
+		ctrl_port = VIU_OSD1_OETF_CTL;
+	} else {
+		return;
+	}
+
+	if (lut_sel == VIU_LUT_OSD_OETF) {
+		writel(0, priv->io_base + _REG(addr_port));
+
+		for (i = 0; i < 20; i++)
+			writel(r_map[i * 2] | (r_map[i * 2 + 1] << 16),
+			       priv->io_base + _REG(data_port));
+
+		writel(r_map[OSD_OETF_LUT_SIZE - 1] | (g_map[0] << 16),
+		       priv->io_base + _REG(data_port));
+
+		for (i = 0; i < 20; i++)
+			writel(g_map[i * 2 + 1] | (g_map[i * 2 + 2] << 16),
+			       priv->io_base + _REG(data_port));
+
+		for (i = 0; i < 20; i++)
+			writel(b_map[i * 2] | (b_map[i * 2 + 1] << 16),
+			       priv->io_base + _REG(data_port));
+
+		writel(b_map[OSD_OETF_LUT_SIZE - 1],
+		       priv->io_base + _REG(data_port));
+
+		if (csc_on)
+			writel_bits(0x7 << 29, 7 << 29,
+				    priv->io_base + _REG(ctrl_port));
+		else
+			writel_bits(0x7 << 29, 0,
+				    priv->io_base + _REG(ctrl_port));
+	} else if (lut_sel == VIU_LUT_OSD_EOTF) {
+		writel(0, priv->io_base + _REG(addr_port));
+
+		for (i = 0; i < 20; i++)
+			writel(r_map[i * 2] | (r_map[i * 2 + 1] << 16),
+			       priv->io_base + _REG(data_port));
+
+		writel(r_map[OSD_EOTF_LUT_SIZE - 1] | (g_map[0] << 16),
+		       priv->io_base + _REG(data_port));
+
+		for (i = 0; i < 20; i++)
+			writel(g_map[i * 2 + 1] | (g_map[i * 2 + 2] << 16),
+			       priv->io_base + _REG(data_port));
+
+		for (i = 0; i < 20; i++)
+			writel(b_map[i * 2] | (b_map[i * 2 + 1] << 16),
+			       priv->io_base + _REG(data_port));
+
+		writel(b_map[OSD_EOTF_LUT_SIZE - 1],
+		       priv->io_base + _REG(data_port));
+
+		if (csc_on)
+			writel_bits(7 << 27, 7 << 27,
+				    priv->io_base + _REG(ctrl_port));
+		else
+			writel_bits(7 << 27, 0,
+				    priv->io_base + _REG(ctrl_port));
+
+		writel_bits(BIT(31), BIT(31),
+			    priv->io_base + _REG(ctrl_port));
+	}
+}
+
+/* eotf lut: linear */
+static unsigned int eotf_33_linear_mapping[OSD_EOTF_LUT_SIZE] = {
+	0x0000,	0x0200,	0x0400, 0x0600,
+	0x0800, 0x0a00, 0x0c00, 0x0e00,
+	0x1000, 0x1200, 0x1400, 0x1600,
+	0x1800, 0x1a00, 0x1c00, 0x1e00,
+	0x2000, 0x2200, 0x2400, 0x2600,
+	0x2800, 0x2a00, 0x2c00, 0x2e00,
+	0x3000, 0x3200, 0x3400, 0x3600,
+	0x3800, 0x3a00, 0x3c00, 0x3e00,
+	0x4000
+};
+
+/* osd oetf lut: linear */
+static unsigned int oetf_41_linear_mapping[OSD_OETF_LUT_SIZE] = {
+	0, 0, 0, 0,
+	0, 32, 64, 96,
+	128, 160, 196, 224,
+	256, 288, 320, 352,
+	384, 416, 448, 480,
+	512, 544, 576, 608,
+	640, 672, 704, 736,
+	768, 800, 832, 864,
+	896, 928, 960, 992,
+	1023, 1023, 1023, 1023,
+	1023
+};
+
+static void meson_viu_load_matrix(struct meson_vpu_priv *priv)
+{
+	/* eotf lut bypass */
+	meson_viu_set_osd_lut(priv, VIU_LUT_OSD_EOTF,
+			      eotf_33_linear_mapping, /* R */
+			      eotf_33_linear_mapping, /* G */
+			      eotf_33_linear_mapping, /* B */
+			      false);
+
+	/* eotf matrix bypass */
+	meson_viu_set_osd_matrix(priv, VIU_MATRIX_OSD_EOTF,
+				 eotf_bypass_coeff,
+				 false);
+
+	/* oetf lut bypass */
+	meson_viu_set_osd_lut(priv, VIU_LUT_OSD_OETF,
+			      oetf_41_linear_mapping, /* R */
+			      oetf_41_linear_mapping, /* G */
+			      oetf_41_linear_mapping, /* B */
+			      false);
+
+	/* osd matrix RGB709 to YUV709 limit */
+	meson_viu_set_osd_matrix(priv, VIU_MATRIX_OSD,
+				 RGB709_to_YUV709l_coeff,
+				 true);
+}
+
+void meson_vpu_init(struct udevice *dev)
+{
+	struct meson_vpu_priv *priv = dev_get_priv(dev);
+	u32 reg;
+
+	/* vpu initialization */
+	writel(0x210000, priv->io_base + _REG(VPU_RDARB_MODE_L1C1));
+	writel(0x10000, priv->io_base + _REG(VPU_RDARB_MODE_L1C2));
+	writel(0x900000, priv->io_base + _REG(VPU_RDARB_MODE_L2C1));
+	writel(0x20000, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
+
+	/* Disable CVBS VDAC */
+	hhi_write(HHI_VDAC_CNTL0, 0);
+	hhi_write(HHI_VDAC_CNTL1, 8);
+
+	/* Power Down Dacs */
+	writel(0xff, priv->io_base + _REG(VENC_VDAC_SETTING));
+
+	/* Disable HDMI PHY */
+	hhi_write(HHI_HDMI_PHY_CNTL0, 0);
+
+	/* Disable HDMI */
+	writel_bits(0x3, 0, priv->io_base + _REG(VPU_HDMI_SETTING));
+
+	/* Disable all encoders */
+	writel(0, priv->io_base + _REG(ENCI_VIDEO_EN));
+	writel(0, priv->io_base + _REG(ENCP_VIDEO_EN));
+	writel(0, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	/* Disable VSync IRQ */
+	writel(0, priv->io_base + _REG(VENC_INTCTRL));
+
+	/* set dummy data default YUV black */
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL)) {
+		writel(0x108080, priv->io_base + _REG(VPP_DUMMY_DATA1));
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
+		writel_bits(0xff << 16, 0xff << 16,
+			    priv->io_base + _REG(VIU_MISC_CTRL1));
+		writel(0x20000, priv->io_base + _REG(VPP_DOLBY_CTRL));
+		writel(0x1020080,
+		       priv->io_base + _REG(VPP_DUMMY_DATA1));
+	}
+
+	/* Initialize vpu fifo control registers */
+	writel(readl(priv->io_base + _REG(VPP_OFIFO_SIZE)) |
+			0x77f, priv->io_base + _REG(VPP_OFIFO_SIZE));
+	writel(0x08080808, priv->io_base + _REG(VPP_HOLD_LINES));
+
+	/* Turn off preblend */
+	writel_bits(VPP_PREBLEND_ENABLE, 0,
+		    priv->io_base + _REG(VPP_MISC));
+
+	/* Turn off POSTBLEND */
+	writel_bits(VPP_POSTBLEND_ENABLE, 0,
+		    priv->io_base + _REG(VPP_MISC));
+
+	/* Force all planes off */
+	writel_bits(VPP_OSD1_POSTBLEND | VPP_OSD2_POSTBLEND |
+		    VPP_VD1_POSTBLEND | VPP_VD2_POSTBLEND |
+		    VPP_VD1_PREBLEND | VPP_VD2_PREBLEND, 0,
+		    priv->io_base + _REG(VPP_MISC));
+
+	/* Setup default VD settings */
+	writel(4096,
+	       priv->io_base + _REG(VPP_PREBLEND_VD1_H_START_END));
+	writel(4096,
+	       priv->io_base + _REG(VPP_BLEND_VD2_H_START_END));
+
+	/* Disable Scalers */
+	writel(0, priv->io_base + _REG(VPP_OSD_SC_CTRL0));
+	writel(0, priv->io_base + _REG(VPP_OSD_VSC_CTRL0));
+	writel(0, priv->io_base + _REG(VPP_OSD_HSC_CTRL0));
+	writel(4 | (4 << 8) | BIT(15),
+	       priv->io_base + _REG(VPP_SC_MISC));
+
+	/* Write in the proper filter coefficients. */
+	meson_vpp_write_scaling_filter_coefs(priv,
+				vpp_filter_coefs_4point_bspline, false);
+	meson_vpp_write_scaling_filter_coefs(priv,
+				vpp_filter_coefs_4point_bspline, true);
+
+	/* Write the VD proper filter coefficients. */
+	meson_vpp_write_vd_scaling_filter_coefs(priv, vpp_filter_coefs_bicubic,
+						false);
+	meson_vpp_write_vd_scaling_filter_coefs(priv, vpp_filter_coefs_bicubic,
+						true);
+
+	/* Disable OSDs */
+	writel_bits(BIT(0) | BIT(21), 0,
+		    priv->io_base + _REG(VIU_OSD1_CTRL_STAT));
+	writel_bits(BIT(0) | BIT(21), 0,
+		    priv->io_base + _REG(VIU_OSD2_CTRL_STAT));
+
+	/* On GXL/GXM, Use the 10bit HDR conversion matrix */
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
+		meson_viu_load_matrix(priv);
+
+	/* Initialize OSD1 fifo control register */
+	reg = BIT(0) |	/* Urgent DDR request priority */
+	      (4 << 5) | /* hold_fifo_lines */
+	      (3 << 10) | /* burst length 64 */
+	      (32 << 12) | /* fifo_depth_val: 32*8=256 */
+	      (2 << 22) | /* 4 words in 1 burst */
+	      (2 << 24);
+	writel(reg, priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
+	writel(reg, priv->io_base + _REG(VIU_OSD2_FIFO_CTRL_STAT));
+
+	/* Set OSD alpha replace value */
+	writel_bits(0xff << OSD_REPLACE_SHIFT,
+		    0xff << OSD_REPLACE_SHIFT,
+		    priv->io_base + _REG(VIU_OSD1_CTRL_STAT2));
+	writel_bits(0xff << OSD_REPLACE_SHIFT,
+		    0xff << OSD_REPLACE_SHIFT,
+		    priv->io_base + _REG(VIU_OSD2_CTRL_STAT2));
+}
diff --git a/drivers/video/meson/simplefb_common.c b/drivers/video/meson/simplefb_common.c
new file mode 100644
index 0000000000..81782326d4
--- /dev/null
+++ b/drivers/video/meson/simplefb_common.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Common code for Amlogic SimpleFB with pipeline.
+ *
+ * (C) Copyright 2013-2014 Luc Verhaegen <libv@skynet.be>
+ * (C) Copyright 2014-2015 Hans de Goede <hdegoede@redhat.com>
+ * (C) Copyright 2017 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#include <fdtdec.h>
+
+int meson_simplefb_fdt_match(void *blob, const char *pipeline)
+{
+	int offset, ret;
+
+	/* Find a prefilled simpefb node, matching out pipeline config */
+	offset = fdt_node_offset_by_compatible(blob, -1,
+					       "amlogic,simple-framebuffer");
+	while (offset >= 0) {
+		ret = fdt_stringlist_search(blob, offset, "amlogic,pipeline",
+					    pipeline);
+		if (ret == 0)
+			break;
+		offset = fdt_node_offset_by_compatible(blob, offset,
+						"amlogic,simple-framebuffer");
+	}
+
+	return offset;
+}
diff --git a/drivers/video/meson/simplefb_common.h b/drivers/video/meson/simplefb_common.h
new file mode 100644
index 0000000000..9ea7b0486c
--- /dev/null
+++ b/drivers/video/meson/simplefb_common.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * (C) Copyright 2017 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#ifndef __SIMPLEFB_COMMON_H
+#define __SIMPLEFB_COMMON_H
+
+/**
+ * meson_simplefb_fdt_match() - match a meson simplefb node
+ *
+ * Match a meson simplefb device node with a specified pipeline, and
+ * return its offset.
+ *
+ * @blob: device tree blob
+ * @pipeline: display pipeline
+ * @return device node offset in blob, or negative values if failed
+ */
+int meson_simplefb_fdt_match(void *blob, const char *pipeline);
+
+#endif
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
