Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306AEC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Nov 2022 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsfoObwdwH/ene34FV0Y4c07OpVu0+qlNEW56iHly/A=; b=Mj/IXwpfuq0Vrm
	hkEeYoHZCpqaEMeDnuXrZOhsR66fXnENiwH1GBf3QrkyOsnNavpanvYDM0PdeKemBj71oTd1UR2QU
	WSyfhfaCI1VCIXUB74hDkaC6KEVxEocKcz5P/Uf7V+NcAQw5JbUbjYU6HLRHoW0y7ODQ7cTsK83wo
	W4qZUtsuZ17d7DexzmBK7WcYWaM0K9j+wulI3+Fwpkp4DPlLJ9TZP186pNXD67O2lBiC5xcp0jZNQ
	Lt35pfOWAX9/LzoVeHZgH3YnjaVzEFu6rWTB81CqqHB1YRwCTDCHdnnTxAp1KmzVwRyQdC1dHAVkd
	rsvP06dP30QVS1knExKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93l-006Z82-6o; Thu, 10 Nov 2022 15:01:41 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot93O-006Yw7-WA; Thu, 10 Nov 2022 15:01:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F14AD123169;
	Thu, 10 Nov 2022 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1668092469; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dONz83S/sl0lvYKGXEj7vcvWK71sD2+ztpm57yFpufg=;
	b=OTavFoQLMbkEqY41c8FhiUtigQYo9tCEen8cj5clEkrfIdSs/a2eaDQC69VZY0uoB2otoN
	++qyL00LAa2ymvVaLaAGYwr8PD0HNk97Qd40oz/Wl1PGUx/mTFQYYzZNFsM+UkwvhUlrPU
	b59Au0227AfMxPCq0qq0vaLAwxlBWdoCxPooBnfsCwmAIjkZdp0SmUoosZ8e3TL2eAIvEx
	ScisEvn3ghRTbEUg/EeAHFm1B9EHSvfiMT2mvvWYbLnEUc4EJitW3mJ6kCZPjRdFiVyV5x
	lZmA9Y/zZoI+PQDDl0JNUuLKyemTzhFLZe/AfNsqGhBY8ukXMVPAJBg3rvGmPQ==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: docs: Update mmc meson-gx documentation for new config option amlogic,mmc-phase
Date: Thu, 10 Nov 2022 18:00:35 +0300
Message-Id: <20221110150035.2824580-5-adeep@lexina.in>
In-Reply-To: <20221110150035.2824580-1-adeep@lexina.in>
References: <20221110150035.2824580-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_070119_258047_DE9B8FEB 
X-CRM114-Status: UNSURE (   5.51  )
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

- amlogic,mmc-phases: 3-element array of clock phases for core, tx, rx
clock with values:
	0: CLK_PHASE_0 - 0 phase
	1: CLK_PHASE_90 - 90 phase
	2: CLK_PHASE_180 - 180 phase
	3: CLK_PHASE_270 - 270 phase
By default driver use <CLK_PHASE_180 CLK_PHASE_0 CLK_PHASE_0> value.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
index ccc5358db131..98c89c5b3455 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
@@ -25,6 +25,12 @@ Required properties:
 Optional properties:
 - amlogic,dram-access-quirk: set when controller's internal DMA engine cannot access the
   DRAM memory, like on the G12A dedicated SDIO controller.
+- amlogic,mmc-phases: 3-element array of clock phases for core, tx, rx clock with values:
+	0: CLK_PHASE_0 - 0 phase
+	1: CLK_PHASE_90 - 90 phase
+	2: CLK_PHASE_180 - 180 phase
+	3: CLK_PHASE_270 - 270 phase
+  By default driver use <CLK_PHASE_180 CLK_PHASE_0 CLK_PHASE_0> value.
 
 Example:
 
@@ -36,4 +42,5 @@ Example:
 		clock-names = "core", "clkin0", "clkin1";
 		pinctrl-0 = <&emmc_pins>;
 		resets = <&reset RESET_SD_EMMC_A>;
+		amlogic,mmc-phases = <CLK_PHASE_180 CLK_PHASE_0 CLK_PHASE_0>;
 	};
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
