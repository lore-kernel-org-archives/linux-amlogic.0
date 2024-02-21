Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D40C48BF6
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Hv24POJpYRIUR7R+sa5Pl2+j6VT461Gk2HNj8MyK88=; b=bYuBNOQHcSektw
	k12AAg3FqiNLgqDsK1x+bqfPcn9xr+vZkFovYty6ANuq8QLp0RZIIX5EiN8zf/ZGxgWfb7L5C7CDD
	9/uTo4n1KNZ3Jb8cQJAOLr6NQbjh99DAuOZb4JO2goTlhQrtSgk5k5R+ikaLgAu7ixRIR9lj9aNZf
	v0LZ6e6TPE0bEDk4hyjCuLVMt4HcuE3BlDsZJayBH3doj5Gi79hyTfHZr6NQ2iMmEl+fyGkdh5t3S
	s13C6w6k/ndBFb1QHQFh21G4yIFr0Caa+k6IDcXkrYSqjTOnL+/WR+hTnwwwuFf0ecrb0dPalimTU
	ruun6yzHCWscublWHj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcniq-00000001J59-1gA1;
	Wed, 21 Feb 2024 14:37:20 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnij-00000001J0C-1egH;
	Wed, 21 Feb 2024 14:37:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 216E510D6F2;
	Wed, 21 Feb 2024 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1708526226; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=i0Y68y9QYfs+ZNLFMH9hJGuFHOG8YfS2qWD0cNE1Ctk=;
	b=tqC+zxYwCxS4jA4eJsGD2YjsBFC4lHwLuij/GMNdc2JbOuc0/NrpiOJQrW0l8zATtNoEOV
	a7T14c/NOjCxPN+LVTxXjAakGszfn+6pHOXFS2dJ75kAC0bKPIFOvCzWF65NcB/3naVFrk
	zIxaV879hZ4QIJ0kQ3r264wAaQ6EIL4F5ehYL2wEuYipboFk2L4G4MkT2Yrxb8pO4Gj0rf
	ioNP2InMMBSBV2tNMm2mBy8k93pL1735pqvlgcfvQsqou4HKtxaNWOSOSQnc4pmQRFZJwi
	6nDMihkevezxY9qCabqQZDLHDM1XUrgFyqICPtvJFnhPeRF7jDn9u0pWrspPPg==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/3] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic secure-monitor SoC Information driver
Date: Wed, 21 Feb 2024 17:36:15 +0300
Message-ID: <20240221143654.544444-3-adeep@lexina.in>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240221143654.544444-1-adeep@lexina.in>
References: <20240221143654.544444-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_063713_817650_6A9AABDA 
X-CRM114-Status: GOOD (  21.76  )
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

Amlogic SoCs have a SoC information secure-monitor call for SoC type,
package type, revision information and chipid.
This patchs adds support for secure-monitor call decoding and exposing
with the SoC bus infrastructure in addition to the previous SoC
Information driver.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 drivers/soc/amlogic/Kconfig               |  10 ++
 drivers/soc/amlogic/Makefile              |   1 +
 drivers/soc/amlogic/meson-gx-socinfo-sm.c | 192 ++++++++++++++++++++++
 3 files changed, 203 insertions(+)
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-sm.c

diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
index d08e398bdad4..edb724e67968 100644
--- a/drivers/soc/amlogic/Kconfig
+++ b/drivers/soc/amlogic/Kconfig
@@ -26,6 +26,16 @@ config MESON_GX_SOCINFO
 	  Say yes to support decoding of Amlogic Meson GX SoC family
 	  information about the type, package and version.
 
+config MESON_GX_SOCINFO_SM
+	bool "Amlogic Meson GX SoC Information driver via Secure Monitor"
+	depends on (ARM64 && ARCH_MESON && MESON_GX_SOCINFO && MESON_SM) || COMPILE_TEST
+	default MESON_GX_SOCINFO && MESON_SM
+	select SOC_BUS
+	help
+	  Say yes to support decoding of Amlogic Meson GX SoC family
+	  information about the type, package and version via secure
+	  monitor call.
+
 config MESON_MX_SOCINFO
 	bool "Amlogic Meson MX SoC Information driver"
 	depends on (ARM && ARCH_MESON) || COMPILE_TEST
diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
index c25f835e6a26..45d9d6f5904c 100644
--- a/drivers/soc/amlogic/Makefile
+++ b/drivers/soc/amlogic/Makefile
@@ -2,4 +2,5 @@
 obj-$(CONFIG_MESON_CANVAS) += meson-canvas.o
 obj-$(CONFIG_MESON_CLK_MEASURE) += meson-clk-measure.o
 obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
+obj-$(CONFIG_MESON_GX_SOCINFO_SM) += meson-gx-socinfo-sm.o
 obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
diff --git a/drivers/soc/amlogic/meson-gx-socinfo-sm.c b/drivers/soc/amlogic/meson-gx-socinfo-sm.c
new file mode 100644
index 000000000000..e30e1d2feb61
--- /dev/null
+++ b/drivers/soc/amlogic/meson-gx-socinfo-sm.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2017 BayLibre, SAS
+ * Copyright (c) 2024 JetHome
+ * Author: Neil Armstrong <neil.armstrong@linaro.org>
+ * Author: Viacheslav Bocharov <adeep@lexina.in>
+ *
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#include <linux/firmware/meson/meson_sm.h>
+
+#include "meson-gx-socinfo-internal.h"
+
+static char *socinfo_get_chipid(struct device *dev, struct meson_sm_firmware *fw,
+			       union meson_cpu_id *socinfo)
+{
+	char *buf;
+	struct meson_sm_chip_id *id_buf;
+	int ret;
+
+	id_buf = devm_kzalloc(dev, sizeof(struct meson_sm_chip_id)+1, GFP_KERNEL);
+	if (!id_buf)
+		return NULL;
+
+	ret = meson_sm_call_read(fw, id_buf, sizeof(struct meson_sm_chip_id), SM_GET_CHIP_ID,
+				 2, 0, 0, 0, 0);
+	if (ret < 0) {
+		kfree(id_buf);
+		return NULL;
+	}
+	dev_info(dev, "got sm version call %i\n", id_buf->version);
+
+	if (id_buf->version != 2) {
+
+		u8 tmp;
+		/**
+		 * Legacy 12-byte chip ID read out, transform data
+		 * to expected order format
+		 */
+		memmove((void *)&id_buf->serial, (void *)&id_buf->cpu_id, 12);
+		for (int i = 0; i < 6; i++) {
+			tmp = id_buf->serial[i];
+			id_buf->serial[i] = id_buf->serial[11 - i];
+			id_buf->serial[11 - i] = tmp;
+		}
+		id_buf->cpu_id.v2.major_id = socinfo->v1.major_id;
+		id_buf->cpu_id.v2.pack_id = socinfo->v1.pack_id;
+		id_buf->cpu_id.v2.chip_rev = socinfo->v1.chip_rev;
+		id_buf->cpu_id.v2.reserved = socinfo->v1.reserved;
+		id_buf->cpu_id.v2.layout_ver = socinfo->v1.layout_ver;
+	} else {
+		/**
+		 * rewrite socinfo from regmap with value from secure monitor call
+		 */
+		socinfo->v1.major_id = id_buf->cpu_id.v2.major_id;
+		socinfo->v1.pack_id = id_buf->cpu_id.v2.pack_id;
+		socinfo->v1.chip_rev = id_buf->cpu_id.v2.chip_rev;
+		socinfo->v1.reserved = id_buf->cpu_id.v2.reserved;
+		socinfo->v1.layout_ver = id_buf->cpu_id.v2.layout_ver;
+	}
+
+	buf = kasprintf(GFP_KERNEL, "%4phN%12phN", &(id_buf->cpu_id), &(id_buf->serial));
+
+	kfree(id_buf);
+
+	return buf;
+}
+
+static int meson_gx_socinfo_sm_probe(struct platform_device *pdev)
+{
+	struct soc_device_attribute *soc_dev_attr;
+	struct soc_device *soc_dev;
+	struct device_node *sm_np;
+	struct meson_sm_firmware *fw;
+	struct regmap *regmap;
+	union meson_cpu_id socinfo;
+	struct device *dev;
+	int ret;
+
+	/* check if chip-id is available */
+	if (!of_property_read_bool(pdev->dev.of_node, "amlogic,has-chip-id"))
+		return -ENODEV;
+
+	/* node should be a syscon */
+	regmap = syscon_node_to_regmap(pdev->dev.of_node);
+	if (IS_ERR(regmap)) {
+		dev_err(&pdev->dev, "failed to get regmap\n");
+		return -ENODEV;
+	}
+
+	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
+	if (!sm_np) {
+		dev_err(&pdev->dev, "no secure-monitor node found\n");
+		return -ENODEV;
+	}
+
+	fw = meson_sm_get(sm_np);
+	of_node_put(sm_np);
+	if (!fw) {
+		dev_info(&pdev->dev, "secure-monitor device not ready, probe later\n");
+		return -EPROBE_DEFER;
+	}
+
+	ret = regmap_read(regmap, AO_SEC_SOCINFO_OFFSET, &socinfo.raw);
+	if (ret < 0)
+		return ret;
+
+	if (!socinfo.raw) {
+		dev_err(&pdev->dev, "invalid regmap chipid value\n");
+		return -EINVAL;
+	}
+
+	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
+				    GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	soc_dev_attr->serial_number = socinfo_get_chipid(&pdev->dev, fw, &socinfo);
+
+	soc_dev_attr->family = "Amlogic Meson";
+	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x:%x - %x:%x",
+					   socinfo.v1.major_id,
+					   socinfo.v1.chip_rev,
+					   socinfo.v1.pack_id,
+					   (socinfo.v1.reserved<<4) + socinfo.v1.layout_ver);
+	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "%s (%s)",
+					 socinfo_v1_to_soc_id(socinfo),
+					 socinfo_v1_to_package_id(socinfo));
+
+	soc_dev = soc_device_register(soc_dev_attr);
+
+
+	if (IS_ERR(soc_dev)) {
+		kfree(soc_dev_attr->revision);
+		kfree_const(soc_dev_attr->soc_id);
+		kfree(soc_dev_attr);
+		return PTR_ERR(soc_dev);
+	}
+
+	dev = soc_device_to_device(soc_dev);
+	platform_set_drvdata(pdev, soc_dev);
+
+	dev_info(dev, "Amlogic Meson %s Revision %x:%x (%x:%x) Detected (SM)\n",
+			soc_dev_attr->soc_id,
+			socinfo.v1.major_id,
+			socinfo.v1.chip_rev,
+			socinfo.v1.pack_id,
+			(socinfo.v1.reserved<<4) + socinfo.v1.layout_ver);
+
+	return PTR_ERR_OR_ZERO(dev);
+}
+
+
+static int meson_gx_socinfo_sm_remove(struct platform_device *pdev)
+{
+	struct soc_device *soc_dev = platform_get_drvdata(pdev);
+
+	soc_device_unregister(soc_dev);
+	return 0;
+}
+
+static const struct of_device_id meson_gx_socinfo_match[] = {
+	{ .compatible = "amlogic,meson-gx-ao-secure", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, meson_gx_socinfo_match);
+
+static struct platform_driver meson_gx_socinfo_driver = {
+	.probe = meson_gx_socinfo_sm_probe,
+	.remove	= meson_gx_socinfo_sm_remove,
+	.driver = {
+		.name = "meson-gx-socinfo-sm",
+		.of_match_table = meson_gx_socinfo_match,
+	},
+};
+
+
+module_platform_driver(meson_gx_socinfo_driver);
+
+MODULE_AUTHOR("Viacheslav Bocharov <adeep@lexina.in>");
+MODULE_DESCRIPTION("Amlogic Meson GX SOC SM driver");
+MODULE_LICENSE("GPL");
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
