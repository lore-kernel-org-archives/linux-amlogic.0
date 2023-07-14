Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A983C001DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WaSqerM9YFF+l7d+Fdw7OqEkHCPs/CSzlU28qJPapA=; b=UgSofkaKHVlL6N
	h/FV7B4k7ipSuTMm/QVoHfArkImVjqdL4hXXSFZRHDKBjsU8UQLmNKCfhO80Ez2xnXQLDUzG9ToTr
	xcKB4GyDG9NkjVyWqZ6wRgqn0oBg0chnMsZFrrvJR5EQOU9dtp6wrdbwmx9vG8w50CTA6DnyRiGmy
	YpC4SFe8p2ilmzlHjK4qUxotsrDlQ4cpFekmJhZzs1F9/5fwHNgK38j0mpUAXKSC/sYq6bNrR/iYN
	7q6xi0Lzgf33ZADjhRhSYQlixoduccMexxz9MGz3AtJCay/DK/dvYmoBCUlff3TQrrszukDWE307M
	zgx0t6W9kofXXEiWyAQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMuv-006pwE-1P;
	Fri, 14 Jul 2023 17:49:21 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMuq-006psG-3B;
	Fri, 14 Jul 2023 17:49:19 +0000
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-34611de0ee4so9354135ab.0;
        Fri, 14 Jul 2023 10:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356956; x=1691948956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv6mglAVvH2vWt/oL/OorStmbFmB+aPDGFPGYKqJNFM=;
        b=Ee5KgbECQf7J1HOViiSo3EFVKS/iw/DmXjTU12jBPOpY+ywtiEVnh3h0BLAEHeHiWL
         Ce3+ubi/7CHrso+yWBK3UjQJMGmnKI7SP4OPtWrt5SzhI86XNfle4vAAylDUjZmH9XLA
         hoOxQrGvQGvMpTjrsbBhRW1IyaWT7wxb+fNNqJnvK+Py0ob4RVE/tZsw+tray6sGDidJ
         fUesHCDoiSraUTl0ORUWbvdeKkci8zGl2bVZw1W4YSri8xRpUABLJczwpDwqzR6QS+Qd
         J1FJ9Tsx53AdTBszJQ5B4rxQg2x+GvmHm7hU9aYL2q/H86gtk2eHzSUeJGx9I/H3Ho/B
         aluw==
X-Gm-Message-State: ABy/qLbncq+1Dn5pj45iaegjkgFv1jaF4SM6uXkR7gGB0U4MCX3hTbpP
	XEsUzSXgDnsMGh0j/cxHcg==
X-Google-Smtp-Source: APBJJlF9IMlurlu4MO+SsiwcNYAJ+lt6SWyHecRouMhZaN1LAiASF/mqoJTsdZnMn0yFvjphxZ9lrQ==
X-Received: by 2002:a92:c081:0:b0:347:6d5f:ab2f with SMTP id h1-20020a92c081000000b003476d5fab2fmr4792743ile.6.1689356956095;
        Fri, 14 Jul 2023 10:49:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o17-20020a92c691000000b00345d00dc3fdsm2850838ilg.78.2023.07.14.10.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:49:15 -0700 (PDT)
Received: (nullmailer pid 4061876 invoked by uid 1000);
	Fri, 14 Jul 2023 17:48:35 -0000
From: Rob Herring <robh@kernel.org>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/perf: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:48:31 -0600
Message-Id: <20230714174832.4061752-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_104917_044467_8D44C590 
X-CRM114-Status: GOOD (  12.90  )
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
 drivers/perf/amlogic/meson_ddr_pmu_core.c | 2 --
 drivers/perf/arm-cci.c                    | 5 +----
 drivers/perf/arm_dsu_pmu.c                | 2 +-
 drivers/perf/arm_pmu_platform.c           | 1 -
 drivers/perf/arm_spe_pmu.c                | 3 +--
 drivers/perf/fsl_imx8_ddr_perf.c          | 3 +--
 drivers/perf/fsl_imx9_ddr_perf.c          | 4 +---
 drivers/perf/marvell_cn10k_ddr_pmu.c      | 3 +--
 drivers/perf/marvell_cn10k_tad_pmu.c      | 3 +--
 9 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/perf/amlogic/meson_ddr_pmu_core.c b/drivers/perf/amlogic/meson_ddr_pmu_core.c
index 0b24dee1ed3c..bbc7285fd934 100644
--- a/drivers/perf/amlogic/meson_ddr_pmu_core.c
+++ b/drivers/perf/amlogic/meson_ddr_pmu_core.c
@@ -9,8 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 998259f1d973..61de861eaf91 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -7,10 +7,7 @@
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index fe2abb412c00..8223c49bd082 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -20,7 +20,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
diff --git a/drivers/perf/arm_pmu_platform.c b/drivers/perf/arm_pmu_platform.c
index 933b96e243b8..3596db36cbff 100644
--- a/drivers/perf/arm_pmu_platform.c
+++ b/drivers/perf/arm_pmu_platform.c
@@ -16,7 +16,6 @@
 #include <linux/irqdesc.h>
 #include <linux/kconfig.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/percpu.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index b9ba4c4fe5a2..d2b0cbf0e0c4 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -25,8 +25,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index 5222ba1e79d0..1cb3861ab0e0 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -10,10 +10,9 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/perf_event.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #define COUNTER_CNTL		0x0
diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 71d5b07e3aff..5cf770a1bc31 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -7,9 +7,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/perf_event.h>
 
 /* Performance monitor configuration */
diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn10k_ddr_pmu.c
index b94a5f6cc22b..524ba82bfce2 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -8,11 +8,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/perf_event.h>
 #include <linux/hrtimer.h>
 #include <linux/acpi.h>
+#include <linux/platform_device.h>
 
 /* Performance Counters Operating Mode Control Registers */
 #define DDRC_PERF_CNT_OP_MODE_CTRL	0x8020
diff --git a/drivers/perf/marvell_cn10k_tad_pmu.c b/drivers/perf/marvell_cn10k_tad_pmu.c
index 3972197e2210..fec8e82edb95 100644
--- a/drivers/perf/marvell_cn10k_tad_pmu.c
+++ b/drivers/perf/marvell_cn10k_tad_pmu.c
@@ -6,10 +6,9 @@
 
 #define pr_fmt(fmt) "tad_pmu: " fmt
 
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/cpuhotplug.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
