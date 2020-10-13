Return-Path: <SRS0=MZ2k=DU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21EFC433E7
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 13:39:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 223FF2473A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 13:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FRuyEFeN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C6o1y4t+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 223FF2473A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rRLMzIQsJPGXL1n7IIdXmESo+851+NePshZTEXQxlhY=; b=FRuyEFeNcOa9sg7RMk3rGnhO1/
	oNgft5Ql5w3o2tm9MzIwPrqvdcRNUoOQia+1TFy7red3K4wJYqY5LnK7TpTnUGdEDvB01khXQfi1M
	wk2K8R5Qpn3jvwfYs6K4G+tlgwAP7FWt7RJd3YAB42Z5IUHm0z79joq6qQy5870q0cgkc1PahbjRd
	IvRYRUUuhcXrkUHe1YpalbCW5/ZCSRX2FriibtHMTuw7UXTjPcwMLv82K/ymdjobcWiNbnS5d3NCX
	GHdpVOh3CrrX26V94+vEHMGrWdA9G5T6l3plri4bo7pB/wqAZmNAp16MX9iv6ucMC3uE77TwF3eSv
	mj94hn7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSKWv-0007et-Ov; Tue, 13 Oct 2020 13:39:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSKWs-0007c5-GT
 for linux-amlogic@lists.infradead.org; Tue, 13 Oct 2020 13:39:52 +0000
Received: by mail-wr1-x441.google.com with SMTP id s9so12001330wro.8
 for <linux-amlogic@lists.infradead.org>; Tue, 13 Oct 2020 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jXRjLc7/VTEbu9Wec7fe96yx2W0L+RJ0lJ0eWgO4l8k=;
 b=C6o1y4t+MuEjWBFxxfMHkiKE9hKTunN1ZAxXs7BX+1bkNrdkVoE+4zaHPwDHmtRsPx
 +3QNThqorMTFNot7GJWTBjH5hVUAZlGmrHliHv4dLeMpWYjwojz+jrKWHMjymc4tDbQG
 txNGcm1PDd/CShcBMp5w2bA72yMKwJ3gJjQFUZrO1FHXdmiKr1GliE2gPe7ttv47iImF
 qivhlzeHhFNa2y+cfh5f87l2euYkJrZQGeVPmZshj7P1jLWR+7SojEzsegtVV7fyEySq
 3WaooC4Ly0yJN6FNT1ZDnUO+PRyThM6IEtSSpg1vApUKDGVIVffSQgxnaNoG6aRV9krN
 wJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jXRjLc7/VTEbu9Wec7fe96yx2W0L+RJ0lJ0eWgO4l8k=;
 b=h8dZT2AaIqTLtf/a6dtpiF0dihgFalDwFPSk3zQ2MfAP5PW8dA9kvV7Fx8oJiOq9vs
 Vn1WPXo5Y1MKx052JufZzehrP7bdex9IwXIMH6KF9M/VHwmDAqwIG+qIl3vvJEqgdhkg
 T8I3Cak/hrrkviGO4YftoeupBOzTUtzYULrvEIfKTU+uuOvMbFk0+O/tlBdkeCK+xi+C
 xP3DiQab15/8GguvLSWT6WGAJmpgIK9/7UH8gFKXYVbvaZunAM3gieiZnHYQC/Uc/Vjq
 st7WDsnPWeTbCKOP945OEci0+BWgOETky+PxwDjc2gzZp1fHaGNCgrjcCdp/gxNsHt7F
 N0+g==
X-Gm-Message-State: AOAM532stLo3kf5NBnSq9MP2xJBCUO5or9rmuGA09QANEXBkP0ek2rpc
 bpLxNHoDlBZe5J3CNiRLpOKH8w==
X-Google-Smtp-Source: ABdhPJzy4dVRESkN3Bx5r5311HsleVWTAcXGJiqtKKLkhwTtL3zXyGUYK0ZRUJYDJImBG2gvXk1GlA==
X-Received: by 2002:adf:9793:: with SMTP id s19mr14206935wrb.139.1602596387316; 
 Tue, 13 Oct 2020 06:39:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:f4da:39ea:5653:71fc])
 by smtp.gmail.com with ESMTPSA id t7sm6803949wrx.42.2020.10.13.06.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 06:39:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de
Subject: [PATCH] reset: meson: make it possible to build as a module
Date: Tue, 13 Oct 2020 15:39:43 +0200
Message-Id: <20201013133943.412119-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_093950_871650_79FF1CE5 
X-CRM114-Status: GOOD (  15.72  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In order to reduce the kernel Image size on multi-platform distributions,
make it possible to build the reset controller driver as a module.

This partially reverts 8290924e ("reset: meson: make it explicitly non-modular")

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/reset/Kconfig       | 4 ++--
 drivers/reset/reset-meson.c | 7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d9efbfd29646..ab315617565f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -94,8 +94,8 @@ config RESET_LPC18XX
 	  This enables the reset controller driver for NXP LPC18xx/43xx SoCs.
 
 config RESET_MESON
-	bool "Meson Reset Driver" if COMPILE_TEST
-	default ARCH_MESON
+	tristate "Meson Reset Driver"
+	default ARCH_MESON || COMPILE_TEST
 	help
 	  This enables the reset driver for Amlogic Meson SoCs.
 
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 94d7ba88d7d2..434d5c0f877e 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -142,4 +143,8 @@ static struct platform_driver meson_reset_driver = {
 		.of_match_table	= meson_reset_dt_ids,
 	},
 };
-builtin_platform_driver(meson_reset_driver);
+module_platform_driver(meson_reset_driver);
+
+MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
