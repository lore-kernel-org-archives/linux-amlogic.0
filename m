Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC3AC282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 14:14:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF8FA214DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 14:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c7Hi4Hb4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n0ddZV8o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF8FA214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUgoD+iprbMAjb11cag1DZgOPKARHijFYynWOlFL3yE=; b=c7Hi4Hb4DtuNVf
	q7w/9vbXpZR6b3hfuVR8oWKqNW/+juwIrNO10kjK14Zkseel80qFNq3Ly18rG3YrzJJHF0KjqA54P
	xvCxFj1AEySjcy1cYPukPfRJxPtBE49hXOl2ItmjW/fiT3waKQ1X1ojTbEjazdAPEvlLHcf0LrxBh
	UkZuKJHnTVM4ZMQH6bxb1tEe3Fm8QJuVSmgYJR0drz10/kJp7EQJnC0kYq5a+fky+Z4yGtjmy1buO
	Ls0ufrGdSOP6iKkCmn8A1UuiXfLW4p1cLbFdRrumHb+RI2BojSqWAnbAKAYW4I1DQ1WgCiEGWN5S+
	T5Ww3xos57T4sjF8jLnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go7gJ-000133-4N; Mon, 28 Jan 2019 14:14:35 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go7fW-0000Dg-0Z
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 14:13:48 +0000
Received: by mail-wr1-x442.google.com with SMTP id t27so18208644wra.6
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dwc9R5xLsFK5n8wVBFG9DEiSxwMJ/FWSrHEKU/4/qKU=;
 b=n0ddZV8oXHZ8Sjw7O9yi5Ylt37oj6w7v11SrKKNev1LpEg51kZqGQU7SlgEWG2Jl3m
 BizrdLSFMG/PgRI89cPyNi970AdREmbWrhNacLD1dgZiS/OhTh0e05tpMivaO+kbnO4w
 ADWpjVR+62C5oD8Ul1MffEpDEwqc/AYLYC2eF5xCcv3e7KT32aBOPxmf/Zj4zY80kMGx
 M3JUHXKCVeLMnxbJUz79HHdSpZhSzRPlgVTSoENWP5QJOxPYfP2g4T0plCMTPpZOFTe1
 5VgyEMDCWFvhna8QMGiSUygaNC8SMcCzFeaxLa6gpTD/v5IKPeSfV0qMvehv5mpYi8V1
 sdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dwc9R5xLsFK5n8wVBFG9DEiSxwMJ/FWSrHEKU/4/qKU=;
 b=cfeJpjLmhY4ntOS5lU61y1oaLmTM+9IRvyC+4uNgDxeyOp2hdRC6v/pKG7RT0IqF8J
 FtkPdEhMnfynGRllCONIXEZRDx8tS+vBJVh20PQ50lan6cmbt2hqpFTDzA4fKzbcfzRT
 0HrJgHneUdBdmgswBLZusgwPIVtrjSlJcthtT9kanP0DIKMtXHdN41j/chvZ++oahgN4
 DIXLpdwW9DcoS8PayqtSySpWg1l4CBAOUzMizPKbmxzvCeiHPUb+j7IgchfRVy1G+ZHE
 dwSdu+z+f1zHX7vfpIaRpwBh3523ZnKZgH3eWMaQse79FVCIDYrDojaj5j0EPTtFgA7N
 P29g==
X-Gm-Message-State: AJcUukfRY8TqfxkoZpkC73UbAqnLvYGCsfbt4FrIBnnRLdi+LuLypTdJ
 16riBj1Fpt/1NCVTMFrJ5+WBoA==
X-Google-Smtp-Source: ALg8bN54k+d0tfZpPCUwboO7kv4KzZ61qnrmI8bh8B14f6HqOMRh4NGA8MwPUU74+AA3xreaYHohgg==
X-Received: by 2002:adf:81b6:: with SMTP id 51mr23208105wra.240.1548684824209; 
 Mon, 28 Jan 2019 06:13:44 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id o9sm44131913wmh.3.2019.01.28.06.13.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 06:13:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: reset: meson: add g12a bindings
Date: Mon, 28 Jan 2019 15:13:29 +0100
Message-Id: <20190128141330.21927-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128141330.21927-1-jbrunet@baylibre.com>
References: <20190128141330.21927-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_061346_058174_4C38420F 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add device tree bindings for the reset controller of g12a SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/reset/amlogic,meson-reset.txt    |   7 +-
 .../reset/amlogic,meson-g12a-reset.h          | 134 ++++++++++++++++++
 2 files changed, 139 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-reset.h

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
index 28ef6c295c76..053cb1322ee3 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
@@ -5,8 +5,11 @@ Please also refer to reset.txt in this directory for common reset
 controller binding usage.
 
 Required properties:
-- compatible: Should be "amlogic,meson8b-reset", "amlogic,meson-gxbb-reset" or
-	"amlogic,meson-axg-reset".
+- compatible: Should be
+ * "amlogic,meson8b-reset" or
+ * "amlogic,meson-gxbb-reset" or
+ * "amlogic,meson-axg-reset" or
+ * "amlogic,meson-g12a-reset"
 - reg: should contain the register address base
 - #reset-cells: 1, see below
 
diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
new file mode 100644
index 000000000000..8063e8314eef
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_G12A_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_G12A_RESET_H
+
+/*	RESET0					*/
+#define RESET_HIU			0
+/*					1	*/
+#define RESET_DOS			2
+/*					3-4	*/
+#define RESET_VIU			5
+#define RESET_AFIFO			6
+#define RESET_VID_PLL_DIV		7
+/*					8-9	*/
+#define RESET_VENC			10
+#define RESET_ASSIST			11
+#define RESET_PCIE_CTRL_A		12
+#define RESET_VCBUS			13
+#define RESET_PCIE_PHY			14
+#define RESET_PCIE_APB			15
+#define RESET_GIC			16
+#define RESET_CAPB3_DECODE		17
+/*					18	*/
+#define RESET_HDMITX_CAPB3		19
+#define RESET_DVALIN_CAPB3		20
+#define RESET_DOS_CAPB3			21
+/*					22	*/
+#define RESET_CBUS_CAPB3		23
+#define RESET_AHB_CNTL			24
+#define RESET_AHB_DATA			25
+#define RESET_VCBUS_CLK81		26
+/*					27-31	*/
+/*	RESET1					*/
+/*					32	*/
+#define RESET_DEMUX			33
+#define RESET_USB			34
+#define RESET_DDR			35
+/*					36	*/
+#define RESET_BT656			37
+#define RESET_AHB_SRAM			38
+/*					39	*/
+#define RESET_PARSER			40
+/*					41	*/
+#define RESET_ISA			42
+#define RESET_ETHERNET			43
+#define RESET_SD_EMMC_A			44
+#define RESET_SD_EMMC_B			45
+#define RESET_SD_EMMC_C			46
+/*					47-60 */
+#define RESET_AUDIO_CODEC		61
+/*					62-63	*/
+/*	RESET2					*/
+/*					64	*/
+#define RESET_AUDIO			65
+#define RESET_HDMITX_PHY		66
+/*					67	*/
+#define RESET_MIPI_DSI_HOST		68
+#define RESET_ALOCKER			69
+#define RESET_GE2D			70
+#define RESET_PARSER_REG		71
+#define RESET_PARSER_FETCH		72
+#define RESET_CTL			73
+#define RESET_PARSER_TOP		74
+/*					75-77	*/
+#define RESET_DVALIN			78
+#define RESET_HDMITX			79
+/*					80-95	*/
+/*	RESET3					*/
+/*					96-95	*/
+#define RESET_DEMUX_TOP			105
+#define RESET_DEMUX_DES_PL		106
+#define RESET_DEMUX_S2P_0		107
+#define RESET_DEMUX_S2P_1		108
+#define RESET_DEMUX_0			109
+#define RESET_DEMUX_1			110
+#define RESET_DEMUX_2			111
+/*					112-127	*/
+/*	RESET4					*/
+/*					128-129	*/
+#define RESET_MIPI_DSI_PHY		130
+/*					131-132	*/
+#define RESET_RDMA			133
+#define RESET_VENCI			134
+#define RESET_VENCP			135
+/*					136	*/
+#define RESET_VDAC			137
+/*					138-139 */
+#define RESET_VDI6			140
+#define RESET_VENCL			141
+#define RESET_I2C_M1			142
+#define RESET_I2C_M2			143
+/*					144-159	*/
+/*	RESET5					*/
+/*					160-191	*/
+/*	RESET6					*/
+#define RESET_GEN			192
+#define RESET_SPICC0			193
+#define RESET_SC			194
+#define RESET_SANA_3			195
+#define RESET_I2C_M0			196
+#define RESET_TS_PLL			197
+#define RESET_SPICC1			198
+#define RESET_STREAM			199
+#define RESET_TS_CPU			200
+#define RESET_UART0			201
+#define RESET_UART1_2			202
+#define RESET_ASYNC0			203
+#define RESET_ASYNC1			204
+#define RESET_SPIFC0			205
+#define RESET_I2C_M3			206
+/*					207-223	*/
+/*	RESET7					*/
+#define RESET_USB_DDR_0			224
+#define RESET_USB_DDR_1			225
+#define RESET_USB_DDR_2			226
+#define RESET_USB_DDR_3			227
+#define RESET_TS_GPU			228
+#define RESET_DEVICE_MMC_ARB		229
+#define RESET_DVALIN_DMC_PIPL		230
+#define RESET_VID_LOCK			231
+#define RESET_NIC_DMC_PIPL		232
+#define RESET_DMC_VPU_PIPL		233
+#define RESET_GE2D_DMC_PIPL		234
+#define RESET_HCODEC_DMC_PIPL		235
+#define RESET_WAVE420_DMC_PIPL		236
+#define RESET_HEVCF_DMC_PIPL		237
+/*					238-255	*/
+
+#endif
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
