Return-Path: <SRS0=NVL0=D2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8366EC433E7
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 23:09:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37052240C
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 23:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mxndT1uB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C9jAVBXy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37052240C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4K2BtrZBFJ08czo7HpiZ4xnrtJvveXJmv1XmtajlXF8=; b=mxndT1uBc4vLOEay2feiaLblHl
	+0i2vnPZ6D7hJC8Nif7KbrKNDnCN+/qfZ4uHftVxKGhk474DJCsvOn5qo8eV4Cfc/k1PAOFJOafPe
	aMPFtYHaveR1ut4tW9KKHBCEidU4TlwiKsf5xjl/+S6mLb4nHZ6vi/GNeWgNAM5U67lgzgyJxUEuF
	aqrQzSQZxOHa3IwYvGiFsE3CawiqNS9RK4DZ3gq9exE+Jl21NpFYKmjcoum8D4/OuyILNOG+BoVVl
	Z05cwrjdNmB5HgBbIQ7V4sdIXvZVcJIOtnY2rxg0nhnvyMtY71tJkufatnmLc49pbPjzvhjWeCWTv
	GrWMkD/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUeHI-0001En-OZ; Mon, 19 Oct 2020 23:09:20 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUeHF-0001E2-E6
 for linux-amlogic@lists.infradead.org; Mon, 19 Oct 2020 23:09:18 +0000
Received: by mail-pl1-x643.google.com with SMTP id h2so582145pll.11
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Oct 2020 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyNmfGQFf3bxEHi8kW0AHVEHFuswZsTTNu57ctBt6Lk=;
 b=C9jAVBXyEwx+Ow2PamyCtcxtUGaSveVxsYP375BVjTYDJWG7P096C2RTXGsBk7Gxlz
 v97eg0JSejU6RidEZozwsEKFkIvxSFiYhGMy81CdVJVODB/bguD0WFWjrgY79iIISfe4
 edpyIGFdxxE5g+1Y2oD3xwtV93SE/cJEyGu7RH0zqu/Nc6pqJK3y5tnP+rQIzt2Dxc3F
 JBpXpmYZVqsDv4TfRqRswvpAoG7nciaePu09HGCo3oJ9qVqzLGrrQHaeUOlLuE15qF2z
 Oe5OtdJXLg/8fUADhP6V4sOBsYFkwhO/IzuEQQLCuCXu/gHy5cDq8Sh83WscJgqIANPj
 Fr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyNmfGQFf3bxEHi8kW0AHVEHFuswZsTTNu57ctBt6Lk=;
 b=jprM30DmwZhQaexzETsbZ56QpB6kE0rub64XgGStf9LI3f+NKZUKRXBlaHCVuMWQlA
 u2/gwcMeF8oWmBmv4ZDCNNHovECvTCTR1HyC6vCLNzR/5wYCxFxWR2C3/qs5E/oaQiid
 Rg1eCVxQ85ENEFnzqRb9kWSlCGVX6digc5BQTpFLJNRDB67svajP7sETojjO5lh3Imtk
 yyq14kr/6qtVtQpBUbV5BsMU7PWZ6nYyQ9e+DH9KQ4gFPnBTPZePdZaH2MAaSfbzVDWP
 mhmgRKrXoTUvyszhuUGAfOTM+Qe/V9LXXQxnlyWLWNK9vS8/YAgN0Fawe7RKq/40N5Fq
 ti2Q==
X-Gm-Message-State: AOAM530hUamUSu7yV5eG+XWwAyJrRg+1RcYvpcZK8CBtksCxEbNHq+pV
 NcChSzbql/z2H4Q3ZSkYjP6JAAaIHQHsN1vI
X-Google-Smtp-Source: ABdhPJz4cuds7GxAMaYTjmeySZx6SFXUDuZkuizMt860/Jjx6Q2TWx1mzPS2RPRuCIcU2lzhCtpkqw==
X-Received: by 2002:a17:90a:c28f:: with SMTP id
 f15mr69429pjt.143.1603148954987; 
 Mon, 19 Oct 2020 16:09:14 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 3sm47340pfv.92.2020.10.19.16.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 16:09:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] pinctrl/meson: enable building as modules
Date: Mon, 19 Oct 2020 16:09:14 -0700
Message-Id: <20201019230914.26300-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_190917_484951_ACB57549 
X-CRM114-Status: GOOD (  15.65  )
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

Enable pinctrl drivers for 64-bit Amlogic SoCs to be built as modules.

The default is still built-in, this only adds the option of building
as module.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Tested on meson-sm1-khadas-vim3.

 drivers/pinctrl/meson/Kconfig                 | 17 +++++++++--------
 drivers/pinctrl/meson/pinctrl-meson-a1.c      |  4 +++-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c |  3 +++
 drivers/pinctrl/meson/pinctrl-meson-axg.c     |  4 +++-
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  4 +++-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c    |  4 +++-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c     |  4 +++-
 drivers/pinctrl/meson/pinctrl-meson.c         |  9 +++++++++
 drivers/pinctrl/meson/pinctrl-meson.h         |  1 +
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c    |  2 ++
 10 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 3cb119105ddb..b2855e341a75 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig PINCTRL_MESON
-	bool "Amlogic SoC pinctrl drivers"
+	tristate "Amlogic SoC pinctrl drivers"
 	depends on ARCH_MESON
 	depends on OF
+	default y
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -25,37 +26,37 @@ config PINCTRL_MESON8B
 	default y
 
 config PINCTRL_MESON_GXBB
-	bool "Meson gxbb SoC pinctrl driver"
+	tristate "Meson gxbb SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
 	default y
 
 config PINCTRL_MESON_GXL
-	bool "Meson gxl SoC pinctrl driver"
+	tristate "Meson gxl SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
 	default y
 
 config PINCTRL_MESON8_PMX
-	bool
+	tristate
 
 config PINCTRL_MESON_AXG
-	bool "Meson axg Soc pinctrl driver"
+	tristate "Meson axg Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
 	default y
 
 config PINCTRL_MESON_AXG_PMX
-	bool
+	tristate
 
 config PINCTRL_MESON_G12A
-	bool "Meson g12a Soc pinctrl driver"
+	tristate "Meson g12a Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
 	default y
 
 config PINCTRL_MESON_A1
-	bool "Meson a1 Soc pinctrl driver"
+	tristate "Meson a1 Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
 	default y
diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
index 8abf750eac7e..79f5d753d7e1 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-a1.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-a1.c
@@ -925,6 +925,7 @@ static const struct of_device_id meson_a1_pinctrl_dt_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, meson_a1_pinctrl_dt_match);
 
 static struct platform_driver meson_a1_pinctrl_driver = {
 	.probe  = meson_pinctrl_probe,
@@ -934,4 +935,5 @@ static struct platform_driver meson_a1_pinctrl_driver = {
 	},
 };
 
-builtin_platform_driver(meson_a1_pinctrl_driver);
+module_platform_driver(meson_a1_pinctrl_driver);
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
index e8931d9cf863..80c43683c789 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
@@ -116,3 +116,6 @@ const struct pinmux_ops meson_axg_pmx_ops = {
 	.get_function_groups = meson_pmx_get_groups,
 	.gpio_request_enable = meson_axg_pmx_request_gpio,
 };
+EXPORT_SYMBOL_GPL(meson_axg_pmx_ops);
+
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index 072765db93d7..7bfecdfba177 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -1080,6 +1080,7 @@ static const struct of_device_id meson_axg_pinctrl_dt_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, meson_axg_pinctrl_dt_match);
 
 static struct platform_driver meson_axg_pinctrl_driver = {
 	.probe		= meson_pinctrl_probe,
@@ -1089,4 +1090,5 @@ static struct platform_driver meson_axg_pinctrl_driver = {
 	},
 };
 
-builtin_platform_driver(meson_axg_pinctrl_driver);
+module_platform_driver(meson_axg_pinctrl_driver);
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 41850e3c0091..cd9656b13836 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -1410,6 +1410,7 @@ static const struct of_device_id meson_g12a_pinctrl_dt_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, meson_g12a_pinctrl_dt_match);
 
 static struct platform_driver meson_g12a_pinctrl_driver = {
 	.probe  = meson_pinctrl_probe,
@@ -1419,4 +1420,5 @@ static struct platform_driver meson_g12a_pinctrl_driver = {
 	},
 };
 
-builtin_platform_driver(meson_g12a_pinctrl_driver);
+module_platform_driver(meson_g12a_pinctrl_driver);
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index d130c635f74b..d9f5c4caf78d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -900,6 +900,7 @@ static const struct of_device_id meson_gxbb_pinctrl_dt_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, meson_gxbb_pinctrl_dt_match);
 
 static struct platform_driver meson_gxbb_pinctrl_driver = {
 	.probe		= meson_pinctrl_probe,
@@ -908,4 +909,5 @@ static struct platform_driver meson_gxbb_pinctrl_driver = {
 		.of_match_table = meson_gxbb_pinctrl_dt_match,
 	},
 };
-builtin_platform_driver(meson_gxbb_pinctrl_driver);
+module_platform_driver(meson_gxbb_pinctrl_driver);
+MODULE_AUTHOR("Beniamino Galvani <b.galvani@gmail.com>");
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 32552d795bb2..51408996255b 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -861,6 +861,7 @@ static const struct of_device_id meson_gxl_pinctrl_dt_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, meson_gxl_pinctrl_dt_match);
 
 static struct platform_driver meson_gxl_pinctrl_driver = {
 	.probe		= meson_pinctrl_probe,
@@ -869,4 +870,5 @@ static struct platform_driver meson_gxl_pinctrl_driver = {
 		.of_match_table = meson_gxl_pinctrl_dt_match,
 	},
 };
-builtin_platform_driver(meson_gxl_pinctrl_driver);
+module_platform_driver(meson_gxl_pinctrl_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 20683cd072bb..b467ab49539a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -152,6 +152,7 @@ int meson_pmx_get_funcs_count(struct pinctrl_dev *pcdev)
 
 	return pc->data->num_funcs;
 }
+EXPORT_SYMBOL_GPL(meson_pmx_get_funcs_count);
 
 const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
 				    unsigned selector)
@@ -160,6 +161,7 @@ const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
 
 	return pc->data->funcs[selector].name;
 }
+EXPORT_SYMBOL_GPL(meson_pmx_get_func_name);
 
 int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 			 const char * const **groups,
@@ -172,6 +174,7 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(meson_pmx_get_groups);
 
 static int meson_pinconf_set_gpio_bit(struct meson_pinctrl *pc,
 				      unsigned int pin,
@@ -723,6 +726,7 @@ int meson8_aobus_parse_dt_extra(struct meson_pinctrl *pc)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(meson8_aobus_parse_dt_extra);
 
 int meson_a1_parse_dt_extra(struct meson_pinctrl *pc)
 {
@@ -732,6 +736,7 @@ int meson_a1_parse_dt_extra(struct meson_pinctrl *pc)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(meson_a1_parse_dt_extra);
 
 int meson_pinctrl_probe(struct platform_device *pdev)
 {
@@ -766,3 +771,7 @@ int meson_pinctrl_probe(struct platform_device *pdev)
 
 	return meson_gpiolib_register(pc);
 }
+EXPORT_SYMBOL_GPL(meson_pinctrl_probe);
+
+MODULE_LICENSE("GPL v2");
+
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index f8b0ff9d419a..ff5372e0a475 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
+#include <linux/module.h>
 
 struct meson_pinctrl;
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
index 66a908f9f13d..f767b6923f9f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
@@ -100,3 +100,5 @@ const struct pinmux_ops meson8_pmx_ops = {
 	.get_function_groups = meson_pmx_get_groups,
 	.gpio_request_enable = meson8_pmx_request_gpio,
 };
+EXPORT_SYMBOL_GPL(meson8_pmx_ops);
+MODULE_LICENSE("GPL v2");
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
