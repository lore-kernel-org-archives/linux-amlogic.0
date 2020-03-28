Return-Path: <SRS0=s8Yl=5N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846D7C2D0E7
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Mar 2020 00:34:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F9A2071B
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Mar 2020 00:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EtQSSxTa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="s+GHEby7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43F9A2071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MOp2GZYzR21phmhtNnlJpDp4OMSHBBOtPyysFCIwJU=; b=EtQSSxTaZnLhE0
	mGlQKESny64k6a4zF4CRRYreCStdDrKw5jmHn1XYjHb5YkzjlSe4mNvq5krUbYCo0Md2WnuTeKcht
	Pmfl3UV30KrzAWSOwJ8eWNlZ+69z6K8iPgHlfdGPeibzkb4VEwQBkMnMlky17SF1li0RBFXXZB/30
	ic2iEVM4FWe4lL1dQJFGhomt6jhhoMpK6D+7GkxNzPb+Nr8v1WHh5EUMgmvclDet9tlUHU3LC5JMd
	tUVedjIonopj5CE7R0IqWRq7PhdjfMyr4y7b1/+gb3deWZeOwm08UJ7Sr5D0rT/02Xdw7WTz1PbR/
	qX7VeDnxaqxbtVrZZebQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHzQF-0005xW-RZ; Sat, 28 Mar 2020 00:33:59 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHzPa-0005NY-7o; Sat, 28 Mar 2020 00:33:21 +0000
Received: by mail-wr1-x443.google.com with SMTP id u10so13904500wro.7;
 Fri, 27 Mar 2020 17:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C7EQctRThIFFyXRH4Fh32z2WVvIN3mPncKYCt9/X2y8=;
 b=s+GHEby7LTqLS7380ErUmduhWu9d3Ou1gV1MSANVspwan3FfNlzG7Ehd3UWxdWcItM
 TI1/A1/jE5N3zycpdl8i7e43obV9oQUNafBp9s7tXUiIEdsxfIScJw4x2/L50vpXSsNz
 t68t4nEhKn/FpshDzMcshHwYC7F8PakwOr/uCK27fA6El3R8OvRwyRatNCy4Jcg1OZHa
 Onl0oSmdLQFrnaBUf2QK6s/iibK4+9iY4ikGDBhusZf6z8mULuHGG3L0JZ3LOmG2R3qM
 kjwNC5JkBy74PvyPstEekHkiLpQnZH6Y0zsFwoGGJuDFVrPikZ+fd9G8CTkztq1tD4/a
 EVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C7EQctRThIFFyXRH4Fh32z2WVvIN3mPncKYCt9/X2y8=;
 b=qs024rFj43F2pQc9fsyBGQU2WQjn3sB1L486iK4NUdKzZVDhWtvVxDMl/9pbBt29k2
 gIPauISMCaJ1ReVrN+OU64iDoPbXE13nBi/nVgCeHOoJMbx/vp6q3pIav9kl276Nzt6z
 0tPcGPAzA/cUntFQCn1Ab0dzuoZLfWMRQCPLFauUPNmNBH52GecjMxvp5aNHcIYowchp
 T2W7GV9s1cgVHjd17yr//9tvRId5U0BoCSygpLbtNiBLMENAEn3ZvYxFw4jPS7JNK7fY
 eK0tF5AFYTMXEHXEm8tWKe4t7qqeaLo7jqJ2jO5XYwarCCXcC3HpeV7TtLnlSmdWpUVH
 OEhw==
X-Gm-Message-State: ANhLgQ3fYV4/KKCuysVrVGnBQ4GQz3ZMBTpD+YX6Ate603p9O9ebngn4
 Xwe+X+kt5iucFJMnX394rWUQIKDs
X-Google-Smtp-Source: ADFU+vvGwtVg9LdcwXl/svwVW06W01mMmomxWIjwY17qb0A4KFPjAr1AgaLg18PhEjpY9F9A7q3Sng==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr2235480wrc.139.1585355596658; 
 Fri, 27 Mar 2020 17:33:16 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f1sm10346246wrv.37.2020.03.27.17.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 17:33:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, ulf.hansson@linaro.org, robh+dt@kernel.org
Subject: [PATCH v5 2/3] clk: meson: add a driver for the Meson8/8b/8m2 SDHC
 clock controller
Date: Sat, 28 Mar 2020 01:32:48 +0100
Message-Id: <20200328003249.1248978-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_173318_276902_8AA70D8B 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: mark.rutland@arm.com, jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com,
 linux-arm-kernel@lists.infradead.org, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SDHC (MMC) controller embeds a clock controller inside one of the
SDHC registers. The outputs of thisclock controller are dedicated to the
SDHC controller.

Implement a dedicated clock controller driver so we can keep all the
clock specific logic outside of the MMC controller driver. There is no
dedicated clock controller OF node because the hardware is a big SDHC IP
block with an embedded clock controller (so the .dts doesn't need a
separate clock controller node). Instead this driver re-uses the regmap
as registered by the (platform_device) parent.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/Kconfig         |   9 ++
 drivers/clk/meson/Makefile        |   1 +
 drivers/clk/meson/meson-mx-sdhc.c | 212 ++++++++++++++++++++++++++++++
 3 files changed, 222 insertions(+)
 create mode 100644 drivers/clk/meson/meson-mx-sdhc.c

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index dabeb435d067..8769335d2d46 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -53,6 +53,15 @@ config COMMON_CLK_MESON8B
 	  S805 (Meson8b) and S812 (Meson8m2) devices. Say Y if you
 	  want peripherals and CPU frequency scaling to work.
 
+config COMMON_CLK_MESON_MX_SDHC
+	tristate "Meson MX SDHC MMC Clock Controller Driver"
+	depends on ARCH_MESON
+	select COMMON_CLK_MESON_REGMAP
+	help
+	  Support for the SDHC clock controller on Amlogic Meson8/8b/8m2 SoCs
+	  devices. Say Y or M if you want to use the SDHC MMC controller.
+	  Otherwise say N.
+
 config COMMON_CLK_GXBB
 	bool
 	depends on ARCH_MESON
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 6eca2a406ee3..b71c7ae78dbd 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
 obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
 obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
+obj-$(CONFIG_COMMON_CLK_MESON_MX_SDHC) += meson-mx-sdhc.o
diff --git a/drivers/clk/meson/meson-mx-sdhc.c b/drivers/clk/meson/meson-mx-sdhc.c
new file mode 100644
index 000000000000..b98a35d99f65
--- /dev/null
+++ b/drivers/clk/meson/meson-mx-sdhc.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Amlogic Meson SDHC clock controller
+ *
+ * Copyright (C) 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+#include <dt-bindings/clock/meson-mx-sdhc-clkc.h>
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "clk-regmap.h"
+#include "clk-pll.h"
+
+#define MESON_SDHC_CLKC			0x10
+
+static const struct clk_regmap meson_mx_sdhc_src_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = MESON_SDHC_CLKC,
+		.mask = 0x3,
+		.shift = 16,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sdhc_src_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .fw_name = "clkin0", .index = -1, },
+			{ .fw_name = "clkin1", .index = -1, },
+			{ .fw_name = "clkin2", .index = -1, },
+			{ .fw_name = "clkin3", .index = -1, },
+		},
+		.num_parents = 4,
+	},
+};
+
+static const struct clk_div_table meson_mx_sdhc_div_table[] = {
+	{ .div = 6, .val = 5, },
+	{ .div = 8, .val = 7, },
+	{ .div = 9, .val = 8, },
+	{ .div = 10, .val = 9, },
+	{ .div = 12, .val = 11, },
+	{ .div = 16, .val = 15, },
+	{ .div = 18, .val = 17, },
+	{ .div = 34, .val = 33, },
+	{ .div = 142, .val = 141, },
+	{ .div = 850, .val = 849, },
+	{ .div = 2126, .val = 2125, },
+	{ .div = 4096, .val = 4095, },
+	{ /* sentinel */ }
+};
+
+static const struct clk_regmap meson_mx_sdhc_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = MESON_SDHC_CLKC,
+		.shift = 0,
+		.width = 12,
+		.table = meson_mx_sdhc_div_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sdhc_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .name = "sdhc_src_sel", .index = -1, },
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_regmap meson_mx_sdhc_mod_clk_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = MESON_SDHC_CLKC,
+		.bit_idx = 15,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sdhc_mod_clk_on",
+		.ops = &clk_regmap_gate_ops,
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .name = "sdhc_div", .index = -1, },
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_GATE,
+	},
+};
+
+static const struct clk_regmap meson_mx_sdhc_tx_clk_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = MESON_SDHC_CLKC,
+		.bit_idx = 14,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sdhc_tx_clk_on",
+		.ops = &clk_regmap_gate_ops,
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .name = "sdhc_div", .index = -1, },
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_GATE,
+	},
+};
+
+static const struct clk_regmap meson_mx_sdhc_rx_clk_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = MESON_SDHC_CLKC,
+		.bit_idx = 13,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sdhc_rx_clk_on",
+		.ops = &clk_regmap_gate_ops,
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .name = "sdhc_div", .index = -1, },
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
+	},
+};
+
+static const struct clk_regmap meson_mx_sdhc_sd_clk_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = MESON_SDHC_CLKC,
+		.bit_idx = 12,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sdhc_sd_clk_on",
+		.ops = &clk_regmap_gate_ops,
+		.parent_data = (const struct clk_parent_data[]) {
+			{ .name = "sdhc_div", .index = -1, },
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
+	},
+};
+
+static const struct clk_regmap *meson_mx_sdhc_clk_regmaps[] = {
+	[SDHC_CLKID_SRC_SEL]	= &meson_mx_sdhc_src_sel,
+	[SDHC_CLKID_DIV]	= &meson_mx_sdhc_div,
+	[SDHC_CLKID_MOD_CLK]	= &meson_mx_sdhc_mod_clk_en,
+	[SDHC_CLKID_SD_CLK]	= &meson_mx_sdhc_sd_clk_en,
+	[SDHC_CLKID_TX_CLK]	= &meson_mx_sdhc_tx_clk_en,
+	[SDHC_CLKID_RX_CLK]	= &meson_mx_sdhc_rx_clk_en,
+};
+
+#define MESON_MX_SDHC_NUM_CLKS ARRAY_SIZE(meson_mx_sdhc_clk_regmaps)
+
+static int meson_mx_sdhc_clkc_probe(struct platform_device *pdev)
+{
+	struct device *parent = pdev->dev.parent;
+	struct clk_hw_onecell_data *onecell_data;
+	struct clk_regmap *clk_regmap;
+	struct regmap *regmap;
+	int i, ret;
+
+	regmap = dev_get_regmap(parent, NULL);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_regmap = devm_kcalloc(parent, sizeof(*clk_regmap),
+				  MESON_MX_SDHC_NUM_CLKS, GFP_KERNEL);
+	if (!clk_regmap)
+		return -ENOMEM;
+
+	onecell_data = devm_kzalloc(parent,
+				    struct_size(onecell_data, hws,
+						MESON_MX_SDHC_NUM_CLKS),
+				    GFP_KERNEL);
+	if (!onecell_data)
+		return -ENOMEM;
+
+	for (i = 0; i < MESON_MX_SDHC_NUM_CLKS; i++) {
+		memcpy(&clk_regmap[i], meson_mx_sdhc_clk_regmaps[i],
+		       sizeof(*clk_regmap));
+
+		clk_regmap[i].map = regmap;
+		onecell_data->hws[i] = &clk_regmap[i].hw;
+
+		ret = devm_clk_hw_register(parent, onecell_data->hws[i]);
+		if (ret) {
+			dev_err(parent,
+				"Registration of SDHC clock %d failed\n", i);
+			return ret;
+		}
+	}
+
+	onecell_data->num = MESON_MX_SDHC_NUM_CLKS;
+
+	return devm_of_clk_add_hw_provider(parent, of_clk_hw_onecell_get,
+					   onecell_data);
+}
+
+static const struct platform_device_id meson_mx_sdhc_clkc_ids[] = {
+	{ "meson8-sdhc-clkc" },
+	{ "meson8b-sdhc-clkc" },
+	{ "meson8m2-sdhc-clkc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, meson_mx_sdhc_clkc_ids);
+
+static struct platform_driver meson_mx_sdhc_clkc_driver = {
+	.id_table	= meson_mx_sdhc_clkc_ids,
+	.probe		= meson_mx_sdhc_clkc_probe,
+	.driver		= {
+		.name	= "meson-mx-sdhc-clkc",
+	},
+};
+module_platform_driver(meson_mx_sdhc_clkc_driver);
+
+MODULE_DESCRIPTION("Amlogic Meson8/8b/8m2 SDHC clock controller driver");
+MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
