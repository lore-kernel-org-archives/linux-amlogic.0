Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BA4C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Nov 2022 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FStXshxS3lxRfXxnUFu+sRfPac6G4ce87HVX9o6vHCU=; b=qtMw27pcqhljc3
	fZSmywDmZHj87UDQ+3QYxSmqVZl6RCYgWNzh/4e819U+bp0Gjq5eKNrCXGzR6ZeERhrHHtychKAtM
	k7YsoMb3WdJ/I/s85WCuRchOtwTIHnU9opNmqPIlD0UeV0hBg23+t7oji5H+FmC10VPFkTziFpNxA
	dMOdJ6qiYemunxjTJ9K3AYxSKP6KOpvgb9MBpU6C8iBuL+oMj0gaUI/Dt4zOcEPaTGVGSJ2iBTlFQ
	LA9y23fC6VFCKIVlyve0LwE4W6f75wm8xvm+eUY3FTsLMFyJp8GPM3nWPkar6A376GRp8d+dEUNrX
	AF04cCjhYL9YUdgSfXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93R-006Yzt-3T; Thu, 10 Nov 2022 15:01:21 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93N-006Yvw-TE; Thu, 10 Nov 2022 15:01:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41848123166;
	Thu, 10 Nov 2022 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1668092467; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZftRKqAeH5kEZiPRpVJLIZ6Af/f8rleyvcwfQTNcp7I=;
	b=iBqP2MLxyMk8eCbFAdaeuExuIOALRKLLZSDpRtsRyVV6+urGSwF4pvBL4sqhn2FKo5pIcG
	9RukbBC9aFvVOD0PBymrIR8Yl5tG0APoGBPTtAZqYX0llwiGPdtkso+w3R5S5vx36iaKTd
	G1Oib53dVrYaq5ywCwggn5htG64J3Ifgku9cs9CZMYzXxYCfx2hbCdkfS9/Ne9qjRnm3jH
	KdJlzMNyepdljw4YnL0PXZjRxXWWscIGgIRPSVpCt0bIdzVhi1UsGE4yQbBKD9IMwzGBAL
	IcWrMtnp4/4GuFYrvG4QUS5q693UmEdH1f4hFdV4N3nk0etdMhYv0dF8Ku3hOw==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: amlogic: mmc: meson-gx: Add core, tx, rx eMMC/SD/SDIO phase clock settings from devicetree data
Date: Thu, 10 Nov 2022 18:00:32 +0300
Message-Id: <20221110150035.2824580-2-adeep@lexina.in>
In-Reply-To: <20221110150035.2824580-1-adeep@lexina.in>
References: <20221110150035.2824580-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_070118_516554_7042DC77 
X-CRM114-Status: UNSURE (   8.67  )
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

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index df05e60bed9a..c0f32054e472 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -27,6 +27,7 @@
 #include <linux/interrupt.h>
 #include <linux/bitfield.h>
 #include <linux/pinctrl/consumer.h>
+#include <dt-bindings/mmc/meson-gx-mmc.h>
 
 #define DRIVER_NAME "meson-gx-mmc"
 
@@ -36,8 +37,6 @@
 #define   CLK_CORE_PHASE_MASK GENMASK(9, 8)
 #define   CLK_TX_PHASE_MASK GENMASK(11, 10)
 #define   CLK_RX_PHASE_MASK GENMASK(13, 12)
-#define   CLK_PHASE_0 0
-#define   CLK_PHASE_180 2
 #define   CLK_V2_TX_DELAY_MASK GENMASK(19, 16)
 #define   CLK_V2_RX_DELAY_MASK GENMASK(23, 20)
 #define   CLK_V2_ALWAYS_ON BIT(24)
@@ -428,13 +427,22 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	const char *mux_parent_names[MUX_CLK_NUM_PARENTS];
 	const char *clk_parent[1];
 	u32 clk_reg;
+	u32 phase[3]; // <core_phase, tx_phase, rx_phase>
+
+	if (!(host->dev && host->dev->of_node) || (device_property_read_u32_array(host->dev,
+	    "amlogic,mmc-phase", phase, 3) < 0)) {
+		dev_dbg(host->dev, "get amlogic,mmc-phase failed, use default phase settings\n");
+		phase[0] = CLK_PHASE_180;
+		phase[1] = CLK_PHASE_0;
+		phase[2] = CLK_PHASE_0;
+	}
 
 	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
 	clk_reg = CLK_ALWAYS_ON(host);
 	clk_reg |= CLK_DIV_MASK;
-	clk_reg |= FIELD_PREP(CLK_CORE_PHASE_MASK, CLK_PHASE_180);
-	clk_reg |= FIELD_PREP(CLK_TX_PHASE_MASK, CLK_PHASE_0);
-	clk_reg |= FIELD_PREP(CLK_RX_PHASE_MASK, CLK_PHASE_0);
+	clk_reg |= FIELD_PREP(CLK_CORE_PHASE_MASK, phase[0]);
+	clk_reg |= FIELD_PREP(CLK_TX_PHASE_MASK, phase[1]);
+	clk_reg |= FIELD_PREP(CLK_RX_PHASE_MASK, phase[2]);
 	clk_reg |= CLK_IRQ_SDIO_SLEEP(host);
 	writel(clk_reg, host->regs + SD_EMMC_CLOCK);
 
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
