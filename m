Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7760CC71153
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Aug 2023 02:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHaNBfC0yC0bI9qPIYjn9zCkRVbPYBdzdwB6+GaP/xE=; b=G4MD2yDyyMiR4I
	kOk/MbP5e/rVVnqWazhQGcqlXWpXAAY1OTh0CwVB0GtW/AH47aBqTEXHA4TcK7aGbcpMznHA9SI/m
	ZydzciL2bZIi6QW4Qkrs34s8zJJGHAQNHViXsKFjB09N3s6IKysYWBeyU/CJMAUCNgYGAq1/ZFw+/
	OvJvZdVEyqUv+hvmK191OXcOr0XwYurRi88zUSGjZTQUH4tV8xg3caTLXtHIG2j3WMKDWRql5vI3A
	6EBtK3RrLm2mQ7FKUUwT4QecmZMwAwAhM4g8srhPYP+l6bAncrQ7vIq0rpQpIOKAtMMI4Ws1ICplv
	2NLDGSpgxtdSJJc7+LJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qao60-00AaaD-0V;
	Tue, 29 Aug 2023 02:04:44 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qao5k-00AaSh-2S;
	Tue, 29 Aug 2023 02:04:30 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 29 Aug 2023
 10:04:14 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, xianwei.zhao <xianwei.zhao@amlogic.com>, Conor Dooley
	<conor.dooley@microchip.com>, Lucas Tanure <tanure@linux.com>
Subject: [PATCH V3 4/6] dt-bindings: power: add Amlogic T7 power domains
Date: Tue, 29 Aug 2023 10:04:02 +0800
Message-ID: <20230829020404.4058677-5-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
References: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_190428_798951_353E210B 
X-CRM114-Status: GOOD (  11.16  )
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

From: "xianwei.zhao" <xianwei.zhao@amlogic.com>

Add devicetree binding document and related header file for
Amlogic T7 secure power domains.

Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Lucas Tanure <tanure@linux.com>
---
V2 -> V3: None
V1 -> V2: Fix license from "GPL-2.0-only OR .*" to "GPL-2.0-only OR MIT"
---
 .../power/amlogic,meson-sec-pwrc.yaml         |  3 +-
 include/dt-bindings/power/amlogic,t7-pwrc.h   | 63 +++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/power/amlogic,t7-pwrc.h

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index d80bbedfe3aa..dab3d92bc273 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -12,7 +12,7 @@ maintainers:
   - Jianxin Pan <jianxin.pan@amlogic.com>
 
 description: |+
-  Secure Power Domains used in Meson A1/C1/S4 & C3 SoCs, and should be the child node
+  Secure Power Domains used in Meson A1/C1/S4 & C3/T7 SoCs, and should be the child node
   of secure-monitor.
 
 properties:
@@ -21,6 +21,7 @@ properties:
       - amlogic,meson-a1-pwrc
       - amlogic,meson-s4-pwrc
       - amlogic,c3-pwrc
+      - amlogic,t7-pwrc
 
   "#power-domain-cells":
     const: 1
diff --git a/include/dt-bindings/power/amlogic,t7-pwrc.h b/include/dt-bindings/power/amlogic,t7-pwrc.h
new file mode 100644
index 000000000000..1f1f2739cc26
--- /dev/null
+++ b/include/dt-bindings/power/amlogic,t7-pwrc.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2023 Amlogic, Inc.
+ * Author: Hongyu Chen <hongyu.chen1@amlogic.com>
+ */
+#ifndef _DT_BINDINGS_AMLOGIC_T7_POWER_H
+#define _DT_BINDINGS_AMLOGIC_T7_POWER_H
+
+#define PWRC_T7_DSPA_ID			0
+#define PWRC_T7_DSPB_ID			1
+#define PWRC_T7_DOS_HCODEC_ID		2
+#define PWRC_T7_DOS_HEVC_ID		3
+#define PWRC_T7_DOS_VDEC_ID		4
+#define PWRC_T7_DOS_WAVE_ID		5
+#define PWRC_T7_VPU_HDMI_ID		6
+#define PWRC_T7_USB_COMB_ID		7
+#define PWRC_T7_PCIE_ID			8
+#define PWRC_T7_GE2D_ID			9
+#define PWRC_T7_SRAMA_ID		10
+#define PWRC_T7_SRAMB_ID		11
+#define PWRC_T7_HDMIRX_ID		12
+#define PWRC_T7_VI_CLK1_ID		13
+#define PWRC_T7_VI_CLK2_ID		14
+#define PWRC_T7_ETH_ID			15
+#define PWRC_T7_ISP_ID			16
+#define PWRC_T7_MIPI_ISP_ID		17
+#define PWRC_T7_GDC_ID			18
+#define PWRC_T7_CVE_ID			18
+#define PWRC_T7_DEWARP_ID		19
+#define PWRC_T7_SDIO_A_ID		20
+#define PWRC_T7_SDIO_B_ID		21
+#define PWRC_T7_EMMC_ID			22
+#define PWRC_T7_MALI_SC0_ID		23
+#define PWRC_T7_MALI_SC1_ID		24
+#define PWRC_T7_MALI_SC2_ID		25
+#define PWRC_T7_MALI_SC3_ID		26
+#define PWRC_T7_MALI_TOP_ID		27
+#define PWRC_T7_NNA_CORE0_ID		28
+#define PWRC_T7_NNA_CORE1_ID		29
+#define PWRC_T7_NNA_CORE2_ID		30
+#define PWRC_T7_NNA_CORE3_ID		31
+#define PWRC_T7_NNA_TOP_ID		32
+#define PWRC_T7_DDR0_ID			33
+#define PWRC_T7_DDR1_ID			34
+#define PWRC_T7_DMC0_ID			35
+#define PWRC_T7_DMC1_ID			36
+#define PWRC_T7_NOC_ID			37
+#define PWRC_T7_NIC2_ID			38
+#define PWRC_T7_NIC3_ID			39
+#define PWRC_T7_CCI_ID			40
+#define PWRC_T7_MIPI_DSI0_ID		41
+#define PWRC_T7_SPICC0_ID		42
+#define PWRC_T7_SPICC1_ID		43
+#define PWRC_T7_SPICC2_ID		44
+#define PWRC_T7_SPICC3_ID		45
+#define PWRC_T7_SPICC4_ID		46
+#define PWRC_T7_SPICC5_ID		47
+#define PWRC_T7_EDP0_ID			48
+#define PWRC_T7_EDP1_ID			49
+#define PWRC_T7_MIPI_DSI1_ID		50
+#define PWRC_T7_AUDIO_ID		51
+
+#endif
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
