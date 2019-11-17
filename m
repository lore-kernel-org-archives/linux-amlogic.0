Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FA8C432C3
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:08:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66DBF2075C
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NCzpWSJ1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Puy6cZj+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66DBF2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S29ypfsWeESY82SGm7oBjhZ1yB0Ul6/GbmWoy7IG0ro=; b=NCzpWSJ10oHg8y
	rlq/KJvL1S6q7FmMRVgv3ud5ksJ7Z7oFQZefSrqwfFYkmZcJqAha9jJ+tSLzqgBPBNa2AmNSoArSO
	HYVSRGP7TUt3a59rxCDow2fAtnQqmbTyPDrKpS+FKEOz/LznoJ0OzM4rvbBzGlukC+HAvI+g8q0Yn
	dkoEsPn1VtqGtLl66ZMqFZkohfPIw0DyONoTZ0cT+MrROvHK0dL2wjCPaSfaCwM0cFQAzNUdO96vy
	nRHHA07PZWoKBsb745XzonaLCvvGOqNqnTmh8lxW+KLUh88zlIYSqznYNHVuSezW9S0QquIHWWhOw
	ulD8O9Wv/TBgkPxO3oCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWLDt-0005qY-BV; Sun, 17 Nov 2019 14:08:17 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWLDL-0005F9-Lq; Sun, 17 Nov 2019 14:07:45 +0000
Received: by mail-wm1-x342.google.com with SMTP id a17so13907113wmb.0;
 Sun, 17 Nov 2019 06:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rUS5IGpkaPi+dGpzM4Vf2xl/ff80v7YNdleQ2dpR1UA=;
 b=Puy6cZj+QzezYj/UZ9GHaqRR7K0lgC91UdC59TjF/uHRPqpJq0DbZPWZ/SYDn+ccEU
 YunqDqp4gTh7iTFhFX30iwA7IY5UcZ1hvRCdlFsv44r4vM0/35xctLsnFSppx2l0RuCZ
 3qLG2cumXE97mA9ln052vHxW2zXL4TRlXeZImCIfA6TasApGLmvZ4XRAESdHFpAVOexX
 4A5YGMHRR7e/+73kpU7xeveS87qtBrxXsAQ57Quai77Z3VqN9pwsBdtnjXfoG6BANyT2
 c+68owKC573nV5j9nYjBGNHrQxFqwNC2oIA7dskMmP/VLFkVdbQSpXsf9WHfrbKVSnVo
 hdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rUS5IGpkaPi+dGpzM4Vf2xl/ff80v7YNdleQ2dpR1UA=;
 b=ksHGlmOyI5tIRgmpzVV5jvKEVPjXavwyhGmfFkPiWPgKEohu7faJiX6UJzKUzkKXPJ
 smzLY0erA2bOcu8SVVQP3YgLhi24Ya47abBmzlPJf0KbdAfd8djKGsgBGimc4ir0X2rB
 sQEdCx31yoO0GaX/XC95RVTv7jGP2DrzuPcPr66/RSYgR742brPVItOYUck448LBeyp5
 QzDowDsGDiZ2IDn5xemQqBc06HtkJ02t3HkV45etj8ea6SaeYMgzlqXVTk5DIYvKqi4Y
 LkEx7mBxN8nm8eFNKBEk+BhpwB5+g/3JlOx19eb4blsFxV8sEk0Avi5B/R7Ja4Vm4dRs
 5b9Q==
X-Gm-Message-State: APjAAAX+efP7GK1Z2FquyD4B4aJ9bg5KSNN+xF/0XnqaEaKlSW4tWeqJ
 aJrqNAN3Riz3mQC6IgqzaTQ=
X-Google-Smtp-Source: APXvYqyr0QEnccVZAjzuk6go6SoJxKQv25UhH0zdyvgJurN2iaqv8W3Qbh12jxLUu4HK4MJQOf6N6g==
X-Received: by 2002:a1c:6144:: with SMTP id v65mr25353746wmb.53.1573999662210; 
 Sun, 17 Nov 2019 06:07:42 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id n23sm16632977wmc.18.2019.11.17.06.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 06:07:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v3 2/2] clk: meson: add a driver for the Meson8/8b/8m2 DDR
 clock controller
Date: Sun, 17 Nov 2019 15:07:31 +0100
Message-Id: <20191117140731.137378-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117140731.137378-1-martin.blumenstingl@googlemail.com>
References: <20191117140731.137378-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_060743_728244_B670DB77 
X-CRM114-Status: GOOD (  18.08  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Meson8/Meson8b/Meson8m2 SoCs embed a DDR clock controller in the
MMCBUS registers. There is no public documentation, but the u-boot GPL
sources from the Amlogic BSP show that the DDR clock controller is
identical on all three SoCs:
  #define CFG_DDR_CLK 792
  #define CFG_PLL_M (((CFG_DDR_CLK/12)*12)/24)
  #define CFG_PLL_N 1
  #define CFG_PLL_OD 1

  // from set_ddr_clock:
  t_ddr_pll_cntl= (CFG_PLL_OD << 16)|(CFG_PLL_N<<9)|(CFG_PLL_M<<0)
  writel(timing_reg->t_ddr_pll_cntl|(1<<29),AM_DDR_PLL_CNTL);
  writel(readl(AM_DDR_PLL_CNTL) & (~(1<<29)),AM_DDR_PLL_CNTL);

  // from hx_ddr_power_down_enter: shut down DDR PLL
  writel(readl(AM_DDR_PLL_CNTL)|(1<<30),AM_DDR_PLL_CNTL);

  do { ... } while((readl(AM_DDR_PLL_CNTL)&(1<<31))==0)

This translates to:
- AM_DDR_PLL_CNTL[29] is the reset bit
- AM_DDR_PLL_CNTL[30] is the enable bit
- AM_DDR_PLL_CNTL[31] is the lock bit
- AM_DDR_PLL_CNTL[8:0] is the m value (assuming the width is 9 bits
  based on the start of the n value)
- AM_DDR_PLL_CNTL[13:9] is the n value (assuming the width is 5 bits
  based on the start of the od)
- AM_DDR_PLL_CNTL[17:16] is the od (assuming the width is 2 bits based
  on other PLLs on this SoC)

Add a driver for this PLL setup because it's used as one of the inputs
of the audio clocks. There may be more clocks inside that clock
controller - those can be added in subsequent patches.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/Makefile     |   2 +-
 drivers/clk/meson/meson8-ddr.c | 149 +++++++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/meson/meson8-ddr.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 3939f218587a..6eca2a406ee3 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -18,4 +18,4 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
 obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
 obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
 obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
-obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
+obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
diff --git a/drivers/clk/meson/meson8-ddr.c b/drivers/clk/meson/meson8-ddr.c
new file mode 100644
index 000000000000..4b73ea244b63
--- /dev/null
+++ b/drivers/clk/meson/meson8-ddr.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Amlogic Meson8 DDR clock controller
+ *
+ * Copyright (C) 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+#include <dt-bindings/clock/meson8-ddr-clkc.h>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-regmap.h"
+#include "clk-pll.h"
+
+#define AM_DDR_PLL_CNTL			0x00
+#define AM_DDR_PLL_CNTL1		0x04
+#define AM_DDR_PLL_CNTL2		0x08
+#define AM_DDR_PLL_CNTL3		0x0c
+#define AM_DDR_PLL_CNTL4		0x10
+#define AM_DDR_PLL_STS			0x14
+#define DDR_CLK_CNTL			0x18
+#define DDR_CLK_STS			0x1c
+
+static struct clk_regmap meson8_ddr_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.n = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 9,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = AM_DDR_PLL_CNTL,
+			.shift   = 29,
+			.width   = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ddr_pll_dco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap meson8_ddr_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = AM_DDR_PLL_CNTL,
+		.shift = 16,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ddr_pll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&meson8_ddr_pll_dco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_hw_onecell_data meson8_ddr_clk_hw_onecell_data = {
+	.hws = {
+		[DDR_CLKID_DDR_PLL_DCO]		= &meson8_ddr_pll_dco.hw,
+		[DDR_CLKID_DDR_PLL]		= &meson8_ddr_pll.hw,
+	},
+	.num = 2,
+};
+
+static struct clk_regmap *const meson8_ddr_clk_regmaps[] = {
+	&meson8_ddr_pll_dco,
+	&meson8_ddr_pll,
+};
+
+static const struct regmap_config meson8_ddr_clkc_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = DDR_CLK_STS,
+};
+
+static int meson8_ddr_clkc_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	void __iomem *base;
+	struct clk_hw *hw;
+	int ret, i;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base,
+				       &meson8_ddr_clkc_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Populate regmap */
+	for (i = 0; i < ARRAY_SIZE(meson8_ddr_clk_regmaps); i++)
+		meson8_ddr_clk_regmaps[i]->map = regmap;
+
+	/* Register all clks */
+	for (i = 0; i < meson8_ddr_clk_hw_onecell_data.num; i++) {
+		hw = meson8_ddr_clk_hw_onecell_data.hws[i];
+
+		ret = devm_clk_hw_register(&pdev->dev, hw);
+		if (ret) {
+			dev_err(&pdev->dev, "Clock registration failed\n");
+			return ret;
+		}
+	}
+
+	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+					   &meson8_ddr_clk_hw_onecell_data);
+}
+
+static const struct of_device_id meson8_ddr_clkc_match_table[] = {
+	{ .compatible = "amlogic,meson8-ddr-clkc" },
+	{ .compatible = "amlogic,meson8b-ddr-clkc" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver meson8_ddr_clkc_driver = {
+	.probe		= meson8_ddr_clkc_probe,
+	.driver		= {
+		.name	= "meson8-ddr-clkc",
+		.of_match_table = meson8_ddr_clkc_match_table,
+	},
+};
+
+builtin_platform_driver(meson8_ddr_clkc_driver);
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
