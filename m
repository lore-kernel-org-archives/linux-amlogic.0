Return-Path: <SRS0=aiPH=O2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5477AC43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Dec 2018 16:26:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2293120874
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Dec 2018 16:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WlNXM/w/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2293120874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3kwDECU2IvoElSoqoP/89RxEPByVIFRNpbU7N1gmbI=; b=WlNXM/w/fL+EIR
	LBH3pG8XX+GE15u3d2V3eLc+jt/IgUSVrtRkObR4C1/v5S5sjJkrPUVXy8md8cKu7MqEmU3PwTzjP
	c1KgT06oIUCeGCrIRnig+s8l/HWkN25N8GB6iwy6gH5tGM9mF6uXlb4h53s5zqUUd1RF9JucZzU/e
	35xxuca+nemhJCUenjLv+gXObbg+hM7CgTKShKwl0ddxOIM2ph+6ItKZlgt/TNwj6Kked52sGEJ8R
	ute+l76VXoXw7L0a59y5zzgirjbQgZGNtJZZbSVfbI1iCeJ6So+7Zs+fEfXQIGvwnQRewrTlZtfBj
	eXVa9QeRvCbTkR9IXSvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYviY-0005PS-Af; Mon, 17 Dec 2018 16:26:06 +0000
Received: from mail-sh2.amlogic.com ([58.32.228.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYvi7-0004vG-FW; Mon, 17 Dec 2018 16:25:44 +0000
Received: from localhost.localdomain (10.18.11.217) by mail-sh2.amlogic.com
 (10.18.11.6) with Microsoft SMTP Server id 15.0.1320.4; Tue, 18 Dec 2018
 00:24:50 +0800
From: Jianxin Pan <jianxin.pan@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v8 3/4] clk: meson: add DT documentation for emmc clock
 controller
Date: Tue, 18 Dec 2018 00:24:09 +0800
Message-ID: <1545063850-21504-4-git-send-email-jianxin.pan@amlogic.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545063850-21504-1-git-send-email-jianxin.pan@amlogic.com>
References: <1545063850-21504-1-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.217]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_082539_754112_7CBFDA8C 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qiufang Dai <qiufang.dai@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Yixun Lan <yixun.lan@amlogic.com>

Document the MMC sub clock controller driver, the potential consumer
of this driver is MMC or NAND. Also add four clock bindings IDs which
provided by this driver.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
---
 .../devicetree/bindings/clock/amlogic,mmc-clkc.txt | 39 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,mmc-clkc.h       | 17 ++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
 create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
new file mode 100644
index 0000000..0f518e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
@@ -0,0 +1,39 @@
+* Amlogic MMC Sub Clock Controller Driver
+
+The Amlogic MMC clock controller generates and supplies clock to support
+MMC and NAND controller
+
+Required Properties:
+
+- compatible: should be:
+		"amlogic,gx-mmc-clkc"
+		"amlogic,axg-mmc-clkc"
+
+- #clock-cells: should be 1.
+- clocks: phandles to clocks corresponding to the clock-names property
+- clock-names: list of parent clock names
+	- "clkin0", "clkin1"
+
+- reg: address of emmc sub clock register
+
+Example: Clock controller node:
+
+sd_mmc_c_clkc: clock-controller@7000 {
+	compatible = "amlogic,axg-mmc-clkc", "syscon";
+	reg = <0x0 0x7000 0x0 0x4>;
+	#clock-cells = <1>;
+
+	clock-names = "clkin0", "clkin1";
+	clocks = <&clkc CLKID_SD_MMC_C_CLK0>,
+		 <&clkc CLKID_FCLK_DIV2>;
+};
+
+sd_emmc_b_clkc: clock-controller@5000 {
+	compatible = "amlogic,axg-mmc-clkc", "syscon";
+	reg = <0x0 0x5000 0x0 0x4>;
+
+	#clock-cells = <1>;
+	clock-names = "clkin0", "clkin1";
+	clocks = <&clkc CLKID_SD_EMMC_B_CLK0>,
+		 <&clkc CLKID_FCLK_DIV2>;
+};
diff --git a/include/dt-bindings/clock/amlogic,mmc-clkc.h b/include/dt-bindings/clock/amlogic,mmc-clkc.h
new file mode 100644
index 0000000..34a3c56
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,mmc-clkc.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Meson MMC sub clock tree IDs
+ *
+ * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
+ * Author: Yixun Lan <yixun.lan@amlogic.com>
+ */
+
+#ifndef __MMC_CLKC_H
+#define __MMC_CLKC_H
+
+#define CLKID_MMC_DIV		0
+#define CLKID_MMC_PHASE_CORE	1
+#define CLKID_MMC_PHASE_TX	2
+#define CLKID_MMC_PHASE_RX	3
+
+#endif
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
