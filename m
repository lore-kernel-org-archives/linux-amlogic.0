Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5376FC61D9D
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nW647S2DHCVsrSxoTR+07e4czWoxYqAf9CC+NcOVBok=; b=mkHVpLN0dazDsi
	zIxhoiWAo9nTOyNTVJxQT2aio3hE9pqgI4tuxi22YvOlw6fKqKSOC65SyCxt/2TRILpZ2s7rXxxBH
	1YlDUU0dwpYckWpi0J5hMAvgZ7OrC4gKeQxSvdiIpUGpd0BQucP/fSfistOO+78VyBV0T06AvByIu
	GXSTiPd9ZhVF9iSPYFJJqaR59+4yQ3rxsVEacBwcFiOvf2HNl4/n5ZD7LrAkYBfYr2lJf78xXqq4W
	7HXM1z3wkXAZqgeLIRJxBgq4tszG2FhsxCCsHHXaj/+d2WLGN3x6hjiPouCix2ZU7OtJHBj9mGpeX
	SA0GdBl5JcNFoWuyspSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mmy-001swH-20;
	Wed, 22 Nov 2023 12:57:08 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mmr-001sqe-0g;
	Wed, 22 Nov 2023 12:57:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0047A53EDA;
	Wed, 22 Nov 2023 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1700657815; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9FM903o2pn21k51UZjXAT7x1wyN7v04RutSMU2fbua0=;
	b=FtRsMvL+MGmcCxNEMbpc9Mov5zIfR/IZC+0XQKaH+0coLTkPfleeqBEp7delkJD/YmYbic
	MwmMR5WCIi2Snr9QUmz3U/b7jc+QqBPOabXv8rXcNmTaJ7tdug+KycOa56s/izHKhJ0vFs
	0UBd7mMlzuuJek645V0EDtpLnwBKlVAJCtfXxwZvaQVPK2prlQwYcCQC2bM9GnDLzYc8It
	ikrlnGjun0H8qPC3Jh+DnqpLYAOAA3EksKzybeDevvqjmouTdD2iRqVjXp6r10Yxo/wTnb
	wOZavUYZQTI2qgWQvvCRdqOgc7JKthyJXdcUvKQSl6PRFiI+tHCwqpJxfiW6rQ==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] soc: amlogic: Add Amlogic secure-monitor SoC Information driver
Date: Wed, 22 Nov 2023 15:56:42 +0300
Message-Id: <20231122125643.1717160-5-adeep@lexina.in>
In-Reply-To: <20231122125643.1717160-1-adeep@lexina.in>
References: <20231122125643.1717160-1-adeep@lexina.in>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7167; h=from:subject; bh=Ts6D5zneNK9fsa5Hu2MDyTR0sZxwo+G3SlCocMKM3Xk=; b=owGbwMvMwCHmnhFhrJcZuJTxtFoSQ2rst6OFk/eIhL8o3vqGde4k1lCRb663fsgkvn2wc4aJ6v57 WxQEOkpZGMQ4GGTFFFnCOoKm7vNYfXHiAqMDMHNYmUCGMHBxCsBE7G8y/M+XuHJ0Pccm1oDfAiFPp5 1n4g6UFjLVLfWQ2nFotdK1o2wM/2t3hOms3erEteKpG9cf9mezxNsVK5e+Oa6w9P3XM4mZpxkA
X-Developer-Key: i=adeep@lexina.in; a=openpgp; fpr=E2FA1A767ACB0716E02E3E7AEE36B110025A8DFA
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_045701_968044_BB054E91 
X-CRM114-Status: GOOD (  21.81  )
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
 drivers/soc/amlogic/meson-gx-socinfo-sm.c | 178 ++++++++++++++++++++++
 3 files changed, 189 insertions(+)
 create mode 100644 drivers/soc/amlogic/meson-gx-socinfo-sm.c

diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
index d08e398bdad4..5634ecb60478 100644
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
+	  information about the type, package and version from secure
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
index 000000000000..52bf3bce09e2
--- /dev/null
+++ b/drivers/soc/amlogic/meson-gx-socinfo-sm.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2023 JetHome
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
+#include <linux/bitfield.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#include <linux/firmware/meson/meson_sm.h>
+
+#include "meson-gx-socinfo-internal.h"
+
+static char *socinfo_get_cpuid(struct device *dev, struct meson_sm_firmware *fw,
+			       unsigned int *socinfo)
+{
+	char *buf;
+	uint8_t *id_buf;
+	int chip_id_version;
+	int ret;
+
+	id_buf = devm_kzalloc(dev, SM_CHIP_ID_LENGTH, GFP_KERNEL);
+	if (!id_buf)
+		return NULL;
+
+	ret = meson_sm_call_read(fw, id_buf, SM_CHIP_ID_LENGTH, SM_GET_CHIP_ID,
+				 2, 0, 0, 0, 0);
+	if (ret < 0) {
+		kfree(id_buf);
+		return NULL;
+	}
+
+	chip_id_version = *((unsigned int *)id_buf);
+
+	if (chip_id_version != 2) {
+		uint8_t tmp;
+		/**
+		 * Legacy 12-byte chip ID read out, transform data
+		 * to expected order format
+		 */
+
+		memmove(&id_buf[SM_CHIP_ID_OFFSET + 4], &id_buf[SM_CHIP_ID_OFFSET], 12);
+		for (int i = 0; i < 6; i++) {
+			tmp = id_buf[i + SM_CHIP_ID_OFFSET + 4];
+			id_buf[i + SM_CHIP_ID_OFFSET + 4] = id_buf[15 - i + SM_CHIP_ID_OFFSET];
+			id_buf[15 - i + SM_CHIP_ID_OFFSET] = tmp;
+		}
+		*(uint32_t *)(id_buf + SM_CHIP_ID_OFFSET) =
+					((*socinfo & 0xff000000)	|	// Family ID
+					((*socinfo << 8) & 0xff0000)	|	// Chip Revision
+					((*socinfo >> 8) & 0xff00))	|	// Package ID
+					((*socinfo) & 0xff);			// Misc
+	} else {
+		*socinfo = id_buf[SM_CHIP_ID_OFFSET] << 24 |	// Family ID
+		   id_buf[SM_CHIP_ID_OFFSET + 2] << 16 |	// Chip revision
+		   id_buf[SM_CHIP_ID_OFFSET + 1] << 8 |		// Package ID
+		   id_buf[SM_CHIP_ID_OFFSET + 3];		// Misc
+	}
+
+	buf = kasprintf(GFP_KERNEL, "%16phN\n", &id_buf[SM_CHIP_ID_OFFSET]);
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
+	unsigned int socinfo;
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
+	if (!fw)
+		return -EPROBE_DEFER;
+
+	dev_err(&pdev->dev, "secure-monitor node found\n");
+
+	ret = regmap_read(regmap, AO_SEC_SOCINFO_OFFSET, &socinfo);
+	if (ret < 0)
+		return ret;
+
+	if (!socinfo) {
+		dev_err(&pdev->dev, "invalid regmap chipid value\n");
+		return -EINVAL;
+	}
+
+	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
+				    GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	soc_dev_attr->serial_number = socinfo_get_cpuid(&pdev->dev, fw, &socinfo);
+
+	meson_gx_socinfo_prepare_soc_driver_attr(soc_dev_attr, socinfo);
+
+	soc_dev = soc_device_register(soc_dev_attr);
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
+	dev_info(dev, "Amlogic Meson %s Revision %x:%x (%x:%x) Detected at SM driver %x\n",
+			soc_dev_attr->soc_id,
+			socinfo_to_major(socinfo),
+			socinfo_to_minor(socinfo),
+			socinfo_to_pack(socinfo),
+			socinfo_to_misc(socinfo), socinfo);
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
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
