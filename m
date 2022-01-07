Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FD1C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 02:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjxvr/Q8Xoqn/3OPG18ONn6qZ8o2ZpK5lprU1RR2g68=; b=CD/gP8xPP61098
	pQaeuq0bXGB9wl4oTZUNxMgJ6EHOlGx60GhAL37fkaVxzzWjYUcrqxaFn96D1P14WTNfLBUhemm4d
	kFwCOidcjyagspdKmjMJqpXT5MYJ/XmowLdU9aTohu9tVxsjBMcqpvpOOCT5I9Iv0pA/pf+ykGaHY
	wIsTYYj7JRirCJChFObMoanOTxKKtbVFaOqTvB4Qr9u6GNiRRj8tms+7uRPbH2T28xg8LtlFBSsXl
	0lgDDFgTP6axbvMZ1rUNsH2v90txPmBwjMBRKKcJ/GDu56DAcxuIm0Xv4GSAEFHx0F6LjNCFJwhPT
	+26Ls1g5uKCx0cb6/qdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fBD-0020xy-KH; Fri, 07 Jan 2022 02:40:35 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fB0-0020oo-47; Fri, 07 Jan 2022 02:40:23 +0000
Received: from droid10-sz.amlogic.com (10.28.8.20) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 7 Jan 2022
 10:40:19 +0800
From: Zelong Dong <zelong.dong@amlogic.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <khilman@baylibre.com>,
 <narmstrong@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <jbrunet@baylibre.com>,
 <devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 2/3] dt-bindings: reset: add bindings for the Meson-S4 SoC
 Reset Controller
Date: Fri, 7 Jan 2022 10:39:30 +0800
Message-ID: <20220107023931.13251-3-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107023931.13251-1-zelong.dong@amlogic.com>
References: <20220107023931.13251-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.20]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_184022_190475_C9F396FE 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Add DT bindings for the Meson-S4 SoC Reset Controller include file.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 .../reset/amlogic,meson-s4-reset.h            | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-s4-reset.h

diff --git a/include/dt-bindings/reset/amlogic,meson-s4-reset.h b/include/dt-bindings/reset/amlogic,meson-s4-reset.h
new file mode 100644
index 000000000000..eab428eb8ad6
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-s4-reset.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
+ * Author: Zelong Dong <zelong.dong@amlogic.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_S4_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_S4_RESET_H
+
+/*	RESET0					*/
+#define RESET_USB_DDR0			0
+#define RESET_USB_DDR1			1
+#define RESET_USB_DDR2			2
+#define RESET_USB_DDR3			3
+#define RESET_USBCTRL			4
+/*					5-7	*/
+#define RESET_USBPHY20			8
+#define RESET_USBPHY21			9
+/*					10-15	*/
+#define RESET_HDMITX_APB		16
+#define RESET_BRG_VCBUS_DEC		17
+#define RESET_VCBUS			18
+#define RESET_VID_PLL_DIV		19
+#define RESET_VDI6			20
+#define RESET_GE2D			21
+#define RESET_HDMITXPHY			22
+#define RESET_VID_LOCK			23
+#define RESET_VENCL			24
+#define RESET_VDAC			25
+#define RESET_VENCP			26
+#define RESET_VENCI			27
+#define RESET_RDMA			28
+#define RESET_HDMI_TX			29
+#define RESET_VIU			30
+#define RESET_VENC			31
+
+/*	RESET1					*/
+#define RESET_AUDIO			32
+#define RESET_MALI_APB			33
+#define RESET_MALI			34
+#define RESET_DDR_APB			35
+#define RESET_DDR			36
+#define RESET_DOS_APB			37
+#define RESET_DOS			38
+/*					39-47	*/
+#define RESET_ETH			48
+/*					49-51	*/
+#define RESET_DEMOD			52
+/*					53-63	*/
+
+/*	RESET2					*/
+#define RESET_ABUS_ARB			64
+#define RESET_IR_CTRL			65
+#define RESET_TEMPSENSOR_DDR		66
+#define RESET_TEMPSENSOR_PLL		67
+/*					68-71	*/
+#define RESET_SMART_CARD		72
+#define RESET_SPICC0			73
+/*					74	*/
+#define RESET_RSA			75
+/*					76-79	*/
+#define RESET_MSR_CLK			80
+#define RESET_SPIFC			81
+#define RESET_SARADC			82
+/*					83-87	*/
+#define RESET_ACODEC			88
+#define RESET_CEC			89
+#define RESET_AFIFO			90
+#define RESET_WATCHDOG			91
+/*					92-95	*/
+
+/*	RESET3					*/
+/*					96-127	*/
+
+/*	RESET4					*/
+/*					128-131	*/
+#define RESET_PWM_AB			132
+#define RESET_PWM_CD			133
+#define RESET_PWM_EF			134
+#define RESET_PWM_GH			135
+#define RESET_PWM_IJ			136
+/*					137	*/
+#define RESET_UART_A			138
+#define RESET_UART_B			139
+#define RESET_UART_C			140
+#define RESET_UART_D			141
+#define RESET_UART_E			142
+/*					143	*/
+#define RESET_I2C_S_A			144
+#define RESET_I2C_M_A			145
+#define RESET_I2C_M_B			146
+#define RESET_I2C_M_C			147
+#define RESET_I2C_M_D			148
+#define RESET_I2C_M_E			149
+/*					150-151	*/
+#define RESET_SD_EMMC_A			152
+#define RESET_SD_EMMC_B			153
+#define RESET_NAND_EMMC			154
+/*					155-159	*/
+
+/* RESET5 */
+#define RESET_BRG_VDEC_PIPL0		160
+#define RESET_BRG_HEVCF_PIPL0		161
+/*					162	*/
+#define RESET_BRG_HCODEC_PIPL0		163
+#define RESET_BRG_GE2D_PIPL0		164
+#define RESET_BRG_VPU_PIPL0		165
+#define RESET_BRG_CPU_PIPL0		166
+#define RESET_BRG_MALI_PIPL0		167
+/*					168	*/
+#define RESET_BRG_MALI_PIPL1		169
+/*					170-171	*/
+#define RESET_BRG_HEVCF_PIPL1		172
+#define RESET_BRG_HEVCB_PIPL1		173
+/*					174-183	*/
+#define RESET_RAMA			184
+/*					185-186	*/
+#define RESET_BRG_NIC_VAPB		187
+#define RESET_BRG_NIC_DSU		188
+#define RESET_BRG_NIC_SYSCLK		189
+#define RESET_BRG_NIC_MAIN		190
+#define RESET_BRG_NIC_ALL		191
+
+#endif
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
