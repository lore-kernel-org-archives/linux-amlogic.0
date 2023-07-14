Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D1FC001DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 17:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R/hHJ3XBmLyz2ua42ur+cItZhfYv8GM9/U0Bo8F63cc=; b=1tUs0YgZVF0w1H
	HsC5fUve08peTb7/8yuaxExX6EuqeNQHK++5d52gEh0EyErDR8cifEy6NdrqPlI10VzsFtb/ZJhtN
	Yd+rYft/zQkPlC8mecr7iwWwRI2Esmp8qJ26FywHvYZLdhg41Y28a3gH0qs0MtGOlzW7q9Rbcadzp
	sfxi5Fa0hZprxr57Xe9iqA2UfaxUqmBl1OupdKFle5P7oQcLxFLD9uzanPMejKt+Q04PD8a7cRoGE
	A9sIkSDSWdwY9thMhowpU+WDOfdrmL0ZWTGlBStMBGBFsKP7KXJg/nOBUC6CG5bA3KYv8B7TVbrNO
	nyiYYokvDAXLUFwacmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMuh-006pmg-1x;
	Fri, 14 Jul 2023 17:49:07 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMuU-006pfE-1k;
	Fri, 14 Jul 2023 17:48:58 +0000
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-78362f57500so89139439f.3;
        Fri, 14 Jul 2023 10:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356934; x=1691948934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEDFXJd+HyeNGJNHuEH7D6MtkxF59/d6sJQFVKlHh5c=;
        b=WrMRGLRBrlDM9cd0GJjGlz53zJ+fKDwv2S/Xd5ALsJL9UCqR5m9+rC1stc5LegKn3J
         NLoIU9ZhhC61DjOZf3r8ECp/UwDZiGJ9SX5RVO8/jsssioblvUOCpgx0cOwXwY2Fyu4e
         gu3q16Rfd+ZREHLqxZNDtd2J9kCM3mgYKKUtF6pUVshaCHOPvmX++IDdvqKLhcj99Bpo
         Q6tTNJqqa+GPwdZ3p88g/anLwJrM6hiQgVaIZtpCjPrGcHo301HkmNr6ga0RRfmXbzez
         4aVL6ZxqqoYVX6mGv1b2y7oz3KattOEcxo1kN6hPMnJAeqNvgXMUtzhuE+xA+T1JJyLx
         39bQ==
X-Gm-Message-State: ABy/qLZClIUnZmio8TqvI2ER1bb2/IYQAXkGCFC4ggFeTbPOvVedEfaF
	0aqg/NY4x/Y9Xm9Nd38PZQ==
X-Google-Smtp-Source: APBJJlEjthmoOidP8epR7rmEF7FbVHzu9+xj4wtIduz2jJrPeEmqxx2cmbszrPFZy8H5AUkScJ9vBg==
X-Received: by 2002:a92:4b0f:0:b0:345:b40e:43b3 with SMTP id m15-20020a924b0f000000b00345b40e43b3mr4980194ilg.12.1689356933744;
        Fri, 14 Jul 2023 10:48:53 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id a16-20020a02ac10000000b0042916ad15bcsm2641166jao.31.2023.07.14.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:48:53 -0700 (PDT)
Received: (nullmailer pid 4061529 invoked by uid 1000);
	Fri, 14 Jul 2023 17:48:25 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [PATCH] nvmem: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:48:19 -0600
Message-Id: <20230714174820.4061387-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_104854_585872_A52FAC33 
X-CRM114-Status: GOOD (  11.83  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/nvmem/bcm-ocotp.c      | 1 -
 drivers/nvmem/core.c           | 1 -
 drivers/nvmem/imx-iim.c        | 1 -
 drivers/nvmem/imx-ocotp-ele.c  | 2 +-
 drivers/nvmem/imx-ocotp-scu.c  | 2 +-
 drivers/nvmem/imx-ocotp.c      | 1 -
 drivers/nvmem/lpc18xx_otp.c    | 1 -
 drivers/nvmem/meson-mx-efuse.c | 1 -
 drivers/nvmem/qcom-spmi-sdam.c | 2 +-
 drivers/nvmem/rave-sp-eeprom.c | 2 +-
 drivers/nvmem/sc27xx-efuse.c   | 1 -
 drivers/nvmem/snvs_lpgpr.c     | 3 ++-
 drivers/nvmem/sprd-efuse.c     | 2 +-
 drivers/nvmem/sunplus-ocotp.c  | 2 +-
 drivers/nvmem/sunxi_sid.c      | 1 -
 drivers/nvmem/u-boot-env.c     | 2 +-
 16 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/nvmem/bcm-ocotp.c b/drivers/nvmem/bcm-ocotp.c
index 0c1fa0c4feb2..2490f44caa40 100644
--- a/drivers/nvmem/bcm-ocotp.c
+++ b/drivers/nvmem/bcm-ocotp.c
@@ -8,7 +8,6 @@
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 /*
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 3f8c7718412b..2251103b2c5f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -17,7 +17,6 @@
 #include <linux/nvmem-provider.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 
 struct nvmem_device {
diff --git a/drivers/nvmem/imx-iim.c b/drivers/nvmem/imx-iim.c
index c86339a7f583..f13bbd164086 100644
--- a/drivers/nvmem/imx-iim.c
+++ b/drivers/nvmem/imx-iim.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index f1cbbc9afeb8..cf920542f939 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -9,7 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
index 399e1eb8b4c1..c38d9c1c3f48 100644
--- a/drivers/nvmem/imx-ocotp-scu.c
+++ b/drivers/nvmem/imx-ocotp-scu.c
@@ -11,7 +11,7 @@
 #include <linux/firmware/imx/sci.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index ab556c011f3e..a223d9537f22 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -20,7 +20,6 @@
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
diff --git a/drivers/nvmem/lpc18xx_otp.c b/drivers/nvmem/lpc18xx_otp.c
index 16c92ea85d49..6898c852ce43 100644
--- a/drivers/nvmem/lpc18xx_otp.c
+++ b/drivers/nvmem/lpc18xx_otp.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 13eb14316f46..2007f7b1bd22 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index f822790db49e..70f2d4f2efbf 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -6,8 +6,8 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #define SDAM_MEM_START			0x40
diff --git a/drivers/nvmem/rave-sp-eeprom.c b/drivers/nvmem/rave-sp-eeprom.c
index c456011b75e8..df6a1c594b78 100644
--- a/drivers/nvmem/rave-sp-eeprom.c
+++ b/drivers/nvmem/rave-sp-eeprom.c
@@ -10,7 +10,7 @@
 #include <linux/mfd/rave-sp.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 
diff --git a/drivers/nvmem/sc27xx-efuse.c b/drivers/nvmem/sc27xx-efuse.c
index c825fc902d10..2210da40dfbd 100644
--- a/drivers/nvmem/sc27xx-efuse.c
+++ b/drivers/nvmem/sc27xx-efuse.c
@@ -4,7 +4,6 @@
 #include <linux/hwspinlock.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/nvmem-provider.h>
diff --git a/drivers/nvmem/snvs_lpgpr.c b/drivers/nvmem/snvs_lpgpr.c
index 4692aa985bd6..89c27112320f 100644
--- a/drivers/nvmem/snvs_lpgpr.c
+++ b/drivers/nvmem/snvs_lpgpr.c
@@ -7,7 +7,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #define IMX6Q_SNVS_HPLR		0x00
diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
index 4f1fcbfec394..7e6e31db4baa 100644
--- a/drivers/nvmem/sprd-efuse.c
+++ b/drivers/nvmem/sprd-efuse.c
@@ -7,7 +7,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 #define SPRD_EFUSE_ENABLE		0x20
diff --git a/drivers/nvmem/sunplus-ocotp.c b/drivers/nvmem/sunplus-ocotp.c
index f85350b17d67..f3a18aa0a6c7 100644
--- a/drivers/nvmem/sunplus-ocotp.c
+++ b/drivers/nvmem/sunplus-ocotp.c
@@ -13,8 +13,8 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/nvmem-provider.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 /*
diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index a970f1741cc6..829e24eb59f2 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/random.h>
diff --git a/drivers/nvmem/u-boot-env.c b/drivers/nvmem/u-boot-env.c
index ee9fd9989b6e..80c5382b361c 100644
--- a/drivers/nvmem/u-boot-env.c
+++ b/drivers/nvmem/u-boot-env.c
@@ -11,7 +11,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
