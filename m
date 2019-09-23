Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA956C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 08:35:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA2AD2064A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 08:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DFOKvZnc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA2AD2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKh7TpJ8g3PK0sDggnKVXrxx2h6O7kl6mbvh+4Ht9q8=; b=DFOKvZnc1tPMm/
	9BPoSfrPEiUNC8H9bWQnwvSplmjdhaL5vF8ruln3PShPuQ9d3Nb3BZ+Q8QBr3RvKMh5xoIctN5P05
	s2BKxmxclpWKEHcR843H/d5R3jl1iXMQ03hdOpFecz1tIrsqwZ7z7Hwl4JFLBcCsEShp/nfLEkaQn
	uflBXPkv5kPGMleJT0uNCKYA9ikXZRtjCcnxf7NyZpz+FRsHSlwyC+dnCMydI+lid7pi8utFz8j9E
	MYAPPdrrSHAANL0c7BJGRSjuYV3Plb+pbHp+6LOYF+DIHNcN6pb9Ko4h0lejwfKuDZ9n3EjyP4x73
	V7eLaRVE8QvTwRLU37bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCJoL-0008GQ-8x; Mon, 23 Sep 2019 08:35:09 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJnj-0006xN-Rj; Mon, 23 Sep 2019 08:34:33 +0000
Received: from droid12-sz.software.amlogic (10.28.8.22) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10;
 Mon, 23 Sep 2019 16:35:23 +0800
From: Xingyu Chen <xingyu.chen@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/3] dt-bindings: reset: add bindings for the Meson-A1 SoC
 Reset Controller
Date: Mon, 23 Sep 2019 16:34:20 +0800
Message-ID: <1569227661-4261-3-git-send-email-xingyu.chen@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569227661-4261-1-git-send-email-xingyu.chen@amlogic.com>
References: <1569227661-4261-1-git-send-email-xingyu.chen@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.22]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_013431_970507_EA7200E4 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add DT bindings for the Meson-A1 SoC Reset Controller include file,
and also slightly update documentation.

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
---
 .../bindings/reset/amlogic,meson-reset.yaml        |  1 +
 include/dt-bindings/reset/amlogic,meson-a1-reset.h | 59 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 00917d8..b3f57d8 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -16,6 +16,7 @@ properties:
       - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
       - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
       - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
+      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/reset/amlogic,meson-a1-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
new file mode 100644
index 00000000..8d76a47
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ *
+ * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
+ * Author: Xingyu Chen <xingyu.chen@amlogic.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
+
+/* RESET0 */
+#define RESET_AM2AXI_VAD		1
+#define RESET_PSRAM			4
+#define RESET_PAD_CTRL			5
+#define RESET_TEMP_SENSOR		7
+#define RESET_AM2AXI_DEV		8
+#define RESET_SPICC_A			10
+#define RESET_MSR_CLK			11
+#define RESET_AUDIO			12
+#define RESET_ANALOG_CTRL		13
+#define RESET_SAR_ADC			14
+#define RESET_AUDIO_VAD			15
+#define RESET_CEC			16
+#define RESET_PWM_EF			17
+#define RESET_PWM_CD			18
+#define RESET_PWM_AB			19
+#define RESET_IR_CTRL			21
+#define RESET_I2C_S_A			22
+#define RESET_I2C_M_D			24
+#define RESET_I2C_M_C			25
+#define RESET_I2C_M_B			26
+#define RESET_I2C_M_A			27
+#define RESET_I2C_PROD_AHB		28
+#define RESET_I2C_PROD			29
+
+/* RESET1 */
+#define RESET_ACODEC			32
+#define RESET_DMA			33
+#define RESET_SD_EMMC_A			34
+#define RESET_USBCTRL			36
+#define RESET_USBPHY			38
+#define RESET_RSA			42
+#define RESET_DMC			43
+#define RESET_IRQ_CTRL			45
+#define RESET_NIC_VAD			47
+#define RESET_NIC_AXI			48
+#define RESET_RAMA			49
+#define RESET_RAMB			50
+#define RESET_ROM			53
+#define RESET_SPIFC			54
+#define RESET_GIC			55
+#define RESET_UART_C			56
+#define RESET_UART_B			57
+#define RESET_UART_A			58
+#define RESET_OSC_RING			59
+
+/* RESET2 Reserved */
+
+#endif
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
