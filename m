Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE2DC433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Nov 2022 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4W8vRRqzffUKber3l+cYPmEM6t4GvZIRh/BopN60uA=; b=2ZLfM/R1SinWbC
	uQmtkPo4CnYPBvarW7TSoPkJZWv8lnuBqh3KCOeaAALOqQkUGBMYyJW2uGnf71H5Trw3o32ev4YSs
	pw2YzhW/+BpbR61Bi9A9FKofl0FJfaayd7qMw9IxBjx2/75KW+hhF40vF+b1Jj7gPzAQWp5P2XmpG
	sWH+CTLNhwSJSQDVUgjK6B4KCMErno1WhvMMyEgm8euzdCQD7Ho5zpov775LBRRhSuHoKQsNyfNd5
	gR/uVJXLtO73W2vBbH4Z5NfhDRNf2JgvWb8cFRMIwNL4woGwEb9Ad7oBMg5WzvE2ndtFjmqpVw4X1
	maK9OHgUBPOgVOLmc7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93k-006Z7P-PJ; Thu, 10 Nov 2022 15:01:40 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93O-006Yw2-W9; Thu, 10 Nov 2022 15:01:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E961B1231BF;
	Thu, 10 Nov 2022 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1668092468; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1SsZIFbb2kZbNj0UZIQdbQ3Ryb9RW7TBdyeqOwWDSP8=;
	b=Kcgutp29e8mIhN54VxuwUvbroBo4WK8m4eNhrhlJzw/isHYXIGIy0+z/Mn9Uxu5pG/p8MG
	RoVPKrWlmAcR4eC7fA/qprLwh8TCN7p9NKqYUhF25AqUxKjm7HkjdKS4LAdtyHlMw2UNGH
	eCrbkPSpeoVdGvezxtTQ4OWg3ChMIuwZakR7YGF+ZroxS66W5tzV+9QBEnLJf1Kmk8W4dh
	LlUOtnkfzcKn3y4TQOz0OAQs/C4na6tkr9lW5Jw65ZFE10L6wwZPCvmDg4lYwIu8I8Gvqn
	7lvG++NWulRBJygF1QRUbZu+RvG4koI+zpW1D9r4WaXqbr9W8mHJphHtCDqK5A==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: amlogic: mmc: meson-gx: Add dts binding include for core, tx, rx eMMC/SD/SDIO phase clock settings from devicetree data
Date: Thu, 10 Nov 2022 18:00:33 +0300
Message-Id: <20221110150035.2824580-3-adeep@lexina.in>
In-Reply-To: <20221110150035.2824580-1-adeep@lexina.in>
References: <20221110150035.2824580-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_070119_251262_1EE67FFC 
X-CRM114-Status: UNSURE (   8.72  )
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

The mmc driver has the same phase values for all meson platforms. However,
some platforms (and even some boards) require different values. This patch
transfers the values from the set in the code to the variables in the
device-tree file.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>

 create mode 100644 include/dt-bindings/mmc/meson-gx-mmc.h

diff --git a/include/dt-bindings/mmc/meson-gx-mmc.h b/include/dt-bindings/mmc/meson-gx-mmc.h
new file mode 100644
index 000000000000..cfc4a9d75b2b
--- /dev/null
+++ b/include/dt-bindings/mmc/meson-gx-mmc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2022 JetHome, Vyacheslav Bocharov
+ * Author: Vyacheslav Bocharov <adeep@lexina.in>
+ */
+
+#ifndef _DT_BINDINGS_MESON_GX_MMC_H
+#define _DT_BINDINGS_MESON_GX_MMC_H
+
+/*
+ * Cfg_rx_phase: RX clock phase
+ * bits: 9:8 R/W
+ * default: 0
+ * Recommended value: 0
+ *
+ * Cfg_tx_phase: TX clock phase
+ * bits: 9:8 R/W
+ * default: 0
+ * Recommended value: 2
+ *
+ * Cfg_co_phase: Core clock phase
+ * bits: 9:8 R/W
+ * default: 0
+ * Recommended value: 2
+ *
+ * values: 0: 0 phase, 1: 90 phase, 2: 180 phase, 3: 270 phase.
+ */
+
+#define   CLK_PHASE_0 0
+#define   CLK_PHASE_90 1
+#define   CLK_PHASE_180 2
+#define   CLK_PHASE_270 3
+
+
+#endif
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
