Return-Path: <SRS0=NVL0=D2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B140C433E7
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 22:47:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A7322403
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 22:47:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cyUBXbXY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ffEQFuEa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25A7322403
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xz+r8vL1djSWm6hkPhSzJ9Xsi81lCX2ZCIDdPjUvrlY=; b=cyUBXbXYe4qIFwLf+FK8wMayl
	RfaAORQGuNq+H2D+O9gxY78ZlwGJ7RP0cffZ+hyqMIfjprzg2PVW5ArvXNPnLWKAItt03jVf1GYR8
	EoRPjJ2IHk3+mvFDeVvKqMD7dWnoF6zjMHl1H4VCeM3ZQ9URoz4gON5XRgRhg4Va30j+TiPBH6mRc
	v4KTuZ35TBJ8CkVuLVuZGeGdChzyF9P0ag+OuS7VPNh5Ar1I1yMJkAqUa3us16WY8i7DIQBzSZSXP
	pJHSFj7QI029K6LKLcQ3vIMQIkuLfLkfHqiQcu9fkCr/zFYtB6YUS3ryV0/cTwNkvNkPvlc5JnVWt
	wLpQlg+jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUdvk-0007js-51; Mon, 19 Oct 2020 22:47:04 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUdvd-0007hg-Ky
 for linux-amlogic@lists.infradead.org; Mon, 19 Oct 2020 22:46:59 +0000
Received: by mail-pl1-x644.google.com with SMTP id h2so557327pll.11
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Oct 2020 15:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TgA5Hp4Ug6aLiWA1ZPBty6/K2gDNGzFFHefUHISY9Co=;
 b=ffEQFuEacViM9Abhe09IoOumqbZcSNdIpq+vg0/DCnsXZq1bwC8wxAXIqTbOCxNW0b
 JvwlMv9ZM5OpWsJJ6V2Bphv0sNRj2ANNoREk8WMZXc4sPNTE4c2H1yOOLyau8OG8o2C+
 Z5JzFhlNm9KTCaeeuLOKvlpzJhwTmUhPZYjgf3AHWe4UB2Nzm09hk/psljrYBoHBm3/M
 BzXs6FbdhZEwDzp6shGWLePwCzGqaLCZJ7Py2cfeGujl4rWZM3xn8vhi8ld/IibzcKut
 DIFZWpXqwCMIFLTZwiPeaoYQhtc8XI+U0S6NvBWRN6t8E/rXLgFBWZbq8/VLfQ4IMA21
 5aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TgA5Hp4Ug6aLiWA1ZPBty6/K2gDNGzFFHefUHISY9Co=;
 b=lXR+M6q4x+AJc/bQnfr9rnMpx7CN8xULPfGjxgYJhdSpRLLahCXqMBFlBNC9IRjD20
 OqWynz+UADsEQrZeMbi9cpQobC3hwNBLKyAou+soBYDfzw8j4ELegxTBYvI0iuYW29Kr
 p0gf1KzzIi5jEW1XURnvIHiJjLYcKj3IUOlPFmfLyA5CwMyroBvWMJxsM6ENiTBl2P++
 ucMCDQYZ8Ual0dNEqLFEDZhn7FgprUhGP72CgLltkeAItltt06C9uEEpbV6Rp3C/49BH
 BrmYDKhN+D6HT0dajoAhvgGp8Y1qVrMdH3vFhxOzNILSA9Mq/u6bOV6Wec+NHh39NCft
 KF5Q==
X-Gm-Message-State: AOAM530tXxN/w3CWCPZAqkCCK2njJS1+S5noI+//wUnGcsuJRZPTMoMH
 iXWFOZC2kpH3XSSuvH1XRw1rgAFKor+7US4w
X-Google-Smtp-Source: ABdhPJwizPSTEaTkS34w1xuGyj1TrvSPtraa6popNEDwVphlrTgqQJloAqq0QddqHEmqih+XFV6UMA==
X-Received: by 2002:a17:90a:d80b:: with SMTP id
 a11mr58663pjv.205.1603147615365; 
 Mon, 19 Oct 2020 15:46:55 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id m13sm29993pfd.65.2020.10.19.15.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 15:46:54 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH 2/2] soc: meson: enable building drivers as modules
Date: Mon, 19 Oct 2020 15:46:49 -0700
Message-Id: <20201019224649.14302-2-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019224649.14302-1-khilman@baylibre.com>
References: <20201019224649.14302-1-khilman@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_184657_702172_AC1AAACD 
X-CRM114-Status: GOOD (  14.93  )
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
index 2d7ee1397d59..d0d67b1d192d 100644
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
index 5fb29a475879..2dfcb7b6e664 100644
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
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
