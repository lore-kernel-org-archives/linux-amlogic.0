Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EB8EB64DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 17:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uWS1ODG9E3ERoIrNZFB1eKDIUjrnv9gQl6EdlRrBLIA=; b=lp52x1rKJHorEV
	pIspnJ3W/hRHOoeWkDSJJBLx8PEvtVHqtA0nnt+top/P5xol4TkhBD629JPGdXb3lsa9GmP0rgDZl
	cqxt8yBlI/LbExIwDEx5CH9RD4OrWrjJB5tDnjcBm/536dDM77L3/x+ACXGRq8ZcjE9DcsmIG8vag
	7grSZHAiDZ5K+6cCY7syG0pp9B1GMPgYEKqKzv2sF6l3537o8VN5QOmNO1FwfgTm82qmwdHXsUYfd
	Gb2xxy+VGFbO0+WQiHOqerChJL0QX3PFdfyiee70U1XauDl15E9RHBhxFHkRTHS9/UeLvd0yqlTal
	7E2PdY9bm8qhcSu0r0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMxN-006rwj-0s;
	Fri, 14 Jul 2023 17:51:53 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMxA-006rhd-09;
	Fri, 14 Jul 2023 17:51:45 +0000
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-345df4e68afso9820625ab.0;
        Fri, 14 Jul 2023 10:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357099; x=1691949099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44RGqmRByB++x0pZyV4QqL+0qOBYQ4NNQZsvR4a019o=;
        b=TlGtbmvOmwYESpyQxjkiX9vQrAhJlSpho7R5a30glXDRjc+cS6o+W9LBqQDeJ5wd8v
         KxlH7tmdXV2KGZAfDDMpbO9v6p6cKJ1klJDCMEqVhwIAKHEvVOna3HbXo8SQp4vj0AkG
         vlcdHDYHQ1JKDc8RUz5HotNnPIdAJBdgCyMNUGhcZXzfkze6keTIYZk4dO36+NP29HcT
         EHj12EcAgxKjcaliSffejL3lq1IyTyvRv9QJq0o7SGItxLH9gIC9ZSRcfAqQCj2w64iz
         QwsQua7nSSmlbjoZjl1Ig9ef+UeX1OJlGOYp5lhtyuw8MrlODClTfG8owJfCXRq4zVT6
         nxHw==
X-Gm-Message-State: ABy/qLZ30m3Sczm9JD06gZ89ZOtx6EO8wPkUTM++98pOaC9eYB1IdLwR
	v/z8i0+DOI3HjG8sbzvnNg==
X-Google-Smtp-Source: APBJJlFe8SbQNbUlRMjsEqT0wEurF1xR5zSupzRA6oiQW5V/ooxSS6/xkhT3s1UdMoYitGoipqxc+w==
X-Received: by 2002:a92:d181:0:b0:346:3920:5df2 with SMTP id z1-20020a92d181000000b0034639205df2mr4817458ilz.21.1689357098955;
        Fri, 14 Jul 2023 10:51:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id q16-20020a056e02079000b00345d5a3748csm2855615ils.63.2023.07.14.10.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:51:38 -0700 (PDT)
Received: (nullmailer pid 4067080 invoked by uid 1000);
	Fri, 14 Jul 2023 17:51:28 -0000
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: amlogic: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:51:23 -0600
Message-Id: <20230714175124.4066972-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_105140_106062_67171148 
X-CRM114-Status: GOOD (  11.92  )
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
 drivers/soc/amlogic/meson-canvas.c      | 1 +
 drivers/soc/amlogic/meson-ee-pwrc.c     | 3 +--
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 3 +--
 drivers/soc/amlogic/meson-secure-pwrc.c | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index 383b0cfc584e..b6e06c4d2117 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/soc/amlogic/meson-canvas.h>
 #include <linux/of_address.h>
diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index f54acffc83f9..cfb796d40d9d 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -4,13 +4,12 @@
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  */
 
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/bitfield.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/reset-controller.h>
 #include <linux/reset.h>
 #include <linux/clk.h>
diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 5d4f12800d93..33df520eab95 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -5,13 +5,12 @@
  * SPDX-License-Identifier: GPL-2.0+
  */
 
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/bitfield.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/reset.h>
 #include <linux/clk.h>
 #include <linux/module.h>
diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
index 25b4b71df9b8..b994f03380b0 100644
--- a/drivers/soc/amlogic/meson-secure-pwrc.c
+++ b/drivers/soc/amlogic/meson-secure-pwrc.c
@@ -7,7 +7,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/io.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <dt-bindings/power/meson-a1-power.h>
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
