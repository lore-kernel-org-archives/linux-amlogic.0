Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F95FC0015E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 17:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=URbDY9JL9DDJPzvmmhi7UpzgDZ1rLrwb/ob7DKMh1nQ=; b=dD+Uylt6/VbVWQ
	K2maNw0BW+hkLJJcM2mE/pL9ozOVhQQvEG3fqCW6fvIM4hLMLUqn5D5eakwqYIq+OUE6XUZiDpZup
	EACVWhQFYN568XXucpRJRsVlvJPieiTjm6XWIm7neQ6F2IJD/kZ/ng1PxtUcl7Woyg1lYOsnJYIWR
	i2wOtT91CF/sdc6c58ihI+UOxUx1WhcQOhRNdv/RoAKtQmWyIRfkbI7hJ89vubHpf1c3p3iP/vmLq
	rpvZjz5u4SkmGPpK3k7ELYgAha+IZuK98N6XwmBbO4g/5u10Xt9xlefLOEZRkGo1v5X2eMfKAlLw2
	1VZ9kiNWYys5t9ncnUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMwi-006rKo-2N;
	Fri, 14 Jul 2023 17:51:12 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMwY-006rBo-35;
	Fri, 14 Jul 2023 17:51:06 +0000
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3459baa237bso10153125ab.3;
        Fri, 14 Jul 2023 10:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357062; x=1691949062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfZt0Y26M5pBCstI8AhRHneftpCtl5efvu3OXJ2yZ/o=;
        b=LHqmgsaEBFFunNz+k9sfFtNAyGrxKuNY5Pn19+XD+5O13fNOCAZsIGowlj39Q5dPoD
         Ta5ezkbpupAHSB6iqO7bzX+fXi0qdWEehQo5IiPqnFE0+De3OmcQPP7k2TtIeXbc3sWH
         JGaQpQBWQzH6HnRel56RperLn1O5Gu1de1XwjYVd0nXqMcvUychUOa8PYXXpwH+o3O/1
         LEtubvcNq6ohXLDCtpHCw0yXzApcGCwaAX4biLchN7LZ+zXijAG4acOSlVuecsEk3Rlm
         YqwGmlquikJtaGcQ3flDrmPGw0wJ8wMqely7jYqw5WMuU9ux44SrUt4WdXija3j+p+R6
         LEFA==
X-Gm-Message-State: ABy/qLYwmAhj8kyUFzoonedjTIWgI2QTfDcUz9tmMLvk0BF0uko3n3iz
	YuQdzeFwn8xrUkQdw9NUBg==
X-Google-Smtp-Source: APBJJlG4GBp9dJrKCr9W02IYXrOkhCe1wTDrg4ydVMkkkfirpBpwQ5ks/kK/kiwd4gjtEHeHFggP/Q==
X-Received: by 2002:a92:d181:0:b0:341:e2aa:3552 with SMTP id z1-20020a92d181000000b00341e2aa3552mr4865990ilz.4.1689357062084;
        Fri, 14 Jul 2023 10:51:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ee13-20020a056638292d00b0042b1354452csm2789728jab.83.2023.07.14.10.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:51:01 -0700 (PDT)
Received: (nullmailer pid 4064549 invoked by uid 1000);
	Fri, 14 Jul 2023 17:50:06 -0000
From: Rob Herring <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Ripard <mripard@kernel.org>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
	Christian Gromm <christian.gromm@microchip.com>
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: [PATCH] staging: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:50:01 -0600
Message-Id: <20230714175002.4064428-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_105103_018154_D0BDD1AC 
X-CRM114-Status: GOOD (  14.40  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/staging/axis-fifo/axis-fifo.c             | 6 ++----
 drivers/staging/greybus/arche-platform.c          | 1 +
 drivers/staging/media/imx/imx-media-capture.c     | 1 -
 drivers/staging/media/imx/imx-media-dev-common.c  | 2 --
 drivers/staging/media/imx/imx8mq-mipi-csi2.c      | 1 -
 drivers/staging/media/meson/vdec/esparser.c       | 1 -
 drivers/staging/media/meson/vdec/vdec.c           | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c    | 2 +-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
 drivers/staging/media/tegra-video/csi.c           | 1 -
 drivers/staging/media/tegra-video/vi.c            | 2 +-
 drivers/staging/media/tegra-video/vip.c           | 1 -
 drivers/staging/most/dim2/dim2.c                  | 2 +-
 drivers/staging/pi433/pi433_if.c                  | 1 -
 14 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 98db47cb4fa4..5910fada7075 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -15,6 +15,8 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/wait.h>
 #include <linux/mutex.h>
 #include <linux/device.h>
@@ -32,10 +34,6 @@
 #include <linux/jiffies.h>
 #include <linux/miscdevice.h>
 
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
-
 /* ----------------------------
  *       driver parameters
  * ----------------------------
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index ebe835f25d13..891b75327d7f 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -20,6 +20,7 @@
 #include <linux/suspend.h>
 #include <linux/time.h>
 #include <linux/greybus.h>
+#include <linux/of.h>
 #include "arche_platform.h"
 
 #if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 4364df27c6d2..4846078315ff 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -7,7 +7,6 @@
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 991820a8500f..7b7cbec08326 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -6,8 +6,6 @@
  * Copyright (c) 2016 Mentor Graphics Inc.
  */
 
-#include <linux/of_graph.h>
-#include <linux/of_platform.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index ca2efcc21efe..c84b6dceece2 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -17,7 +17,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 7b15fc54efe4..4632346f04a9 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -11,7 +11,6 @@
 #include <linux/ioctl.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/interrupt.h>
 #include <media/videobuf2-dma-contig.h>
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5ca4b1200831..219185aaa588 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -4,7 +4,7 @@
  * Author: Maxime Jourdan <mjourdan@baylibre.com>
  */
 
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index fa86a658fdc6..b696bf884cbd 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -14,8 +14,8 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/of_reserved_mem.h>
-#include <linux/of_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/clk.h>
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 0dc75adbd9d8..8337dc487047 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -10,7 +10,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 052172017b3b..e79657920dc8 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 79284c3b6cae..4add037537a2 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -11,8 +11,8 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index a1ab886acc18..4cf3fde7e034 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 44d3252d4612..ed6a9cc88541 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -8,7 +8,6 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/printk.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -21,6 +20,7 @@
 #include <linux/sched.h>
 #include <linux/kthread.h>
 #include <linux/most.h>
+#include <linux/of.h>
 #include "hal.h"
 #include "errors.h"
 #include "sysfs.h"
diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 220e157d4a5e..58887619b83f 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -31,7 +31,6 @@
 #include <linux/errno.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/gpio/consumer.h>
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
