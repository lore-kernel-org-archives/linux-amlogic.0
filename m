Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8A4C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 21:05:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEFFD2225F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 21:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n4fvZkNI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="krqgZs6S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEFFD2225F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+HjCht3vaznTNZbD0wJ7rzxuH7bppTiaP/2ERd3rWqs=; b=n4fvZkNIutrGcH9jSrPH1zBDS
	dtOxNUGb194f1dgtFsSYWCfxnPEvx9ebDY5MpKRK+h9rTBEkjnXyCOF5h9HkmRMOmLVxm4JZmEHDQ
	gvbDNB2JX/0AEoZpn/3eD59y6uyHewwdM0XUjO9N8Ll+qbDvvYrA//ikREN8DERRFVUk3CkjGLxDz
	7Lc+48Rzji9SjjJHY/24A/ue+scubMDJIfBr0603+Ja7KJSHxxdIGN7f4AgNnZNQHsn4eVNsITYXS
	ZvfrxIqb4f6qf/0KIOV8TtgnbYim/Gr5FKiItjM8SP5E7LzUeUS7mxLULUTbzIau7eUyJGdn39dYV
	MSqtdKesA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUyoy-0000M8-4K; Tue, 20 Oct 2020 21:05:28 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUyom-0000IA-3m
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 21:05:17 +0000
Received: by mail-pl1-x641.google.com with SMTP id r10so45903plx.3
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lG0doM2xKDlS9CL9eIQhGhhVEvgRv8sVLWPG9BPQTzY=;
 b=krqgZs6SItweDkvof+cJREyp08gwBuFXaMmC44ZjEu8V0vIHWmO62p7pddDaRLyhd1
 6L7TraCSdlOoCFBjU/BPf8Awky8uXzwLgt7FCiOqzDioqIlmYC8alo8bCSEQYf9vU059
 105WvEz+RNeDh7oXPje2OdnM/B+uFztgO5WJ/Yw+7tJ4GMxcJlPE1XGbyuk2MJ7iX3vc
 T0PKdLWhcwXhiKjlrmUWPpFTEKEGC+JdeH8QKJXe/HdvVzUaH+Lk6rijRN7zFd37zq6W
 igg+2TYc4cd3j/fAZj3UfWZeOgfWROdv4QD/zamcSYLO/U4eNDyLd0B5XzYpAVT7ieeZ
 Cw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lG0doM2xKDlS9CL9eIQhGhhVEvgRv8sVLWPG9BPQTzY=;
 b=sqX+wNH3E0VemRxrE2AQ1f+BkJ9eFoX/blZxYdf/GIE1uCxwAY7Ij7nLyqETbEsZzy
 TVdlaA5gVH2I5Lfnn9rYXzjLredTNyQPPKl0PNcqLGbQKxTvQq+1SV+av0TGRVu1nUM4
 2X2KM4D7BIUdS63zhp8eVmhJI4sT14bIVnZosFIzDDtqZ/147DjWOHLDRMUW5H0LScbr
 sItytbkURST69sDZGycPbzHGDqid03nXKuKgY5DsvUCtD6W6U26K6OKGBsJd6LNhhBvs
 v5dhqU+xXRDuMvHxS3bG1bX8j2fn2FR8wXByBo3RDQYiNo9Kn0FDt7pMVlxG+riGPSDK
 WFEA==
X-Gm-Message-State: AOAM532xtIi09Arr5EP1BJSYdl+u0LE5j60nIILw9QEBZSoFTrT2MQjD
 7id9FWvQMsxt778Eipl90cWCXoI+cpy9LYfA
X-Google-Smtp-Source: ABdhPJxr/aAH51YVxVss3vVMz9n8kY0Tn0Qb6S8RxyCkspu6tp8FpHhO1n81Fpla19dxPdYZDuJIMg==
X-Received: by 2002:a17:902:d90d:b029:d5:ee36:3438 with SMTP id
 c13-20020a170902d90db02900d5ee363438mr39217plz.77.1603227913674; 
 Tue, 20 Oct 2020 14:05:13 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v6sm82666pjh.10.2020.10.20.14.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 14:05:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/2] soc: meson: enable building drivers as modules
Date: Tue, 20 Oct 2020 14:05:11 -0700
Message-Id: <20201020210511.20184-2-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020210511.20184-1-khilman@baylibre.com>
References: <20201020210511.20184-1-khilman@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_170516_187535_F4BC0DFE 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable SoC drivers for 64-bit Amlogic SoCs to be built as modules.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/soc/amlogic/Kconfig             | 8 ++++----
 drivers/soc/amlogic/meson-clk-measure.c | 5 ++++-
 drivers/soc/amlogic/meson-ee-pwrc.c     | 5 ++++-
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 5 ++++-
 drivers/soc/amlogic/meson-secure-pwrc.c | 5 ++++-
 5 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
index 08a27d9cbc7f..174a9b011461 100644
--- a/drivers/soc/amlogic/Kconfig
+++ b/drivers/soc/amlogic/Kconfig
@@ -9,7 +9,7 @@ config MESON_CANVAS
 	  Say yes to support the canvas IP for Amlogic SoCs.
 
 config MESON_CLK_MEASURE
-	bool "Amlogic Meson SoC Clock Measure driver"
+	tristate "Amlogic Meson SoC Clock Measure driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	default ARCH_MESON
 	select REGMAP_MMIO
@@ -27,7 +27,7 @@ config MESON_GX_SOCINFO
 	  information about the type, package and version.
 
 config MESON_GX_PM_DOMAINS
-	bool "Amlogic Meson GX Power Domains driver"
+	tristate "Amlogic Meson GX Power Domains driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	depends on PM && OF
 	default ARCH_MESON
@@ -38,7 +38,7 @@ config MESON_GX_PM_DOMAINS
 	  Generic Power Domains.
 
 config MESON_EE_PM_DOMAINS
-	bool "Amlogic Meson Everything-Else Power Domains driver"
+	tristate "Amlogic Meson Everything-Else Power Domains driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	depends on PM && OF
 	default ARCH_MESON
@@ -49,7 +49,7 @@ config MESON_EE_PM_DOMAINS
 	  Generic Power Domains.
 
 config MESON_SECURE_PM_DOMAINS
-	bool "Amlogic Meson Secure Power Domains driver"
+	tristate "Amlogic Meson Secure Power Domains driver"
 	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
 	depends on PM && OF
 	depends on HAVE_ARM_SMCCC
diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 0fa47d77577d..e1957476a006 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -10,6 +10,7 @@
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
 #include <linux/regmap.h>
+#include <linux/module.h>
 
 static DEFINE_MUTEX(measure_lock);
 
@@ -681,6 +682,7 @@ static const struct of_device_id meson_msr_match_table[] = {
 	},
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, meson_msr_match_table);
 
 static struct platform_driver meson_msr_driver = {
 	.probe	= meson_msr_probe,
@@ -689,4 +691,5 @@ static struct platform_driver meson_msr_driver = {
 		.of_match_table	= meson_msr_match_table,
 	},
 };
-builtin_platform_driver(meson_msr_driver);
+module_platform_driver(meson_msr_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 5164a4dc2352..ed7d2fbb47f2 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -14,6 +14,7 @@
 #include <linux/reset-controller.h>
 #include <linux/reset.h>
 #include <linux/clk.h>
+#include <linux/module.h>
 #include <dt-bindings/power/meson8-power.h>
 #include <dt-bindings/power/meson-axg-power.h>
 #include <dt-bindings/power/meson-g12a-power.h>
@@ -602,6 +603,7 @@ static const struct of_device_id meson_ee_pwrc_match_table[] = {
 	},
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, meson_ee_pwrc_match_table);
 
 static struct platform_driver meson_ee_pwrc_driver = {
 	.probe = meson_ee_pwrc_probe,
@@ -611,4 +613,5 @@ static struct platform_driver meson_ee_pwrc_driver = {
 		.of_match_table	= meson_ee_pwrc_match_table,
 	},
 };
-builtin_platform_driver(meson_ee_pwrc_driver);
+module_platform_driver(meson_ee_pwrc_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 21b4bc811c00..8790627e3098 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -14,6 +14,7 @@
 #include <linux/of_device.h>
 #include <linux/reset.h>
 #include <linux/clk.h>
+#include <linux/module.h>
 
 /* AO Offsets */
 
@@ -364,6 +365,7 @@ static const struct of_device_id meson_gx_pwrc_vpu_match_table[] = {
 	},
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, meson_gx_pwrc_vpu_match_table);
 
 static struct platform_driver meson_gx_pwrc_vpu_driver = {
 	.probe	= meson_gx_pwrc_vpu_probe,
@@ -373,4 +375,5 @@ static struct platform_driver meson_gx_pwrc_vpu_driver = {
 		.of_match_table	= meson_gx_pwrc_vpu_match_table,
 	},
 };
-builtin_platform_driver(meson_gx_pwrc_vpu_driver);
+module_platform_driver(meson_gx_pwrc_vpu_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
index 5fb29a475879..59bd195fa9c9 100644
--- a/drivers/soc/amlogic/meson-secure-pwrc.c
+++ b/drivers/soc/amlogic/meson-secure-pwrc.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/power/meson-a1-power.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/meson/meson_sm.h>
+#include <linux/module.h>
 
 #define PWRC_ON		1
 #define PWRC_OFF	0
@@ -193,6 +194,7 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
 	},
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, meson_secure_pwrc_match_table);
 
 static struct platform_driver meson_secure_pwrc_driver = {
 	.probe = meson_secure_pwrc_probe,
@@ -201,4 +203,5 @@ static struct platform_driver meson_secure_pwrc_driver = {
 		.of_match_table	= meson_secure_pwrc_match_table,
 	},
 };
-builtin_platform_driver(meson_secure_pwrc_driver);
+module_platform_driver(meson_secure_pwrc_driver);
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
