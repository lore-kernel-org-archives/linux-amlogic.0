Return-Path: <SRS0=oWvG=AO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626E9C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 17:53:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0264520782
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 17:53:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lDVRawZ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0264520782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=al2klimov.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L1KbZNWOUdbRILVkgwuF4c9hGZP8qkz5XDBJNfFqYPM=; b=lDVRawZ0NCsX3hkLYvh/0WYC3k
	AWb9dufW1XDAGmSJkJGuRaA6BCiBjonI1R1dTe+6uevZp/1oaPCWOF+Cr8iru4C9W08lHj1xI564b
	eGttzWtbyGqNWD8rAmyHiWsR3ULdq55Fn0Y8MaUbcU80lMbpNQyMI61u1+7UiGuRcmxzzSCSUlD17
	/GRn7faVRv7I7YeQQyrwnC3qcBcJiATVr7MyvzivBaRGSvAeYBnvsCB0L+LCD1L7rmAQHxtdm/X5R
	YLekP6/EbAAdZ7cy+bV3yNqlnu2c07a6nCZ6CFUPs5AQpBneXt6rbFm7lyDeIyXRep6mr0urS0DfK
	GwTEqF/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrPsS-0008P4-01; Fri, 03 Jul 2020 17:53:32 +0000
Received: from smtp.al2klimov.de ([2a01:4f8:c0c:1465::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrPqY-0007P0-L8; Fri, 03 Jul 2020 17:51:58 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 917C5BC142;
 Fri,  3 Jul 2020 17:51:25 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 jcmvbkbc@gmail.com, nm@ti.com, t-kristo@ti.com, ssantosh@kernel.org,
 narmstrong@baylibre.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH] Replace HTTP links with HTTPS ones: Common CLK framework
Date: Fri,  3 Jul 2020 19:51:14 +0200
Message-Id: <20200703175114.15027-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_135135_018406_7C896FF5 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
          If both the HTTP and HTTPS versions
          return 200 OK and serve the same content:
            Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See https://lkml.org/lkml/2020/6/26/837

 .../devicetree/bindings/clock/clock-bindings.txt          | 2 +-
 Documentation/devicetree/bindings/clock/silabs,si514.txt  | 2 +-
 Documentation/devicetree/bindings/clock/silabs,si5351.txt | 2 +-
 Documentation/devicetree/bindings/clock/silabs,si570.txt  | 4 ++--
 Documentation/devicetree/bindings/clock/ti,cdce706.txt    | 2 +-
 Documentation/devicetree/bindings/clock/ti,cdce925.txt    | 8 ++++----
 drivers/clk/clk-cdce706.c                                 | 2 +-
 drivers/clk/clk-gpio.c                                    | 2 +-
 drivers/clk/clk-si5351.c                                  | 4 ++--
 drivers/clk/keystone/sci-clk.c                            | 2 +-
 drivers/clk/keystone/syscon-clk.c                         | 2 +-
 drivers/clk/meson/meson8b.h                               | 2 +-
 drivers/clk/versatile/icst.c                              | 2 +-
 drivers/clk/versatile/icst.h                              | 2 +-
 14 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index 8a55fdcf96ee..f2ea53832ac6 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -9,7 +9,7 @@ specifier is an array of zero, one or more cells identifying the clock
 output on a device.  The length of a clock specifier is defined by the
 value of a #clock-cells property in the clock provider node.
 
-[1] http://patchwork.ozlabs.org/patch/31551/
+[1] https://patchwork.ozlabs.org/patch/31551/
 
 ==Clock providers==
 
diff --git a/Documentation/devicetree/bindings/clock/silabs,si514.txt b/Documentation/devicetree/bindings/clock/silabs,si514.txt
index ea1a9dbc63b6..a4f28ec86f35 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si514.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si514.txt
@@ -6,7 +6,7 @@ found in the datasheet[2].
 
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
 [2] Si514 datasheet
-    http://www.silabs.com/Support%20Documents/TechnicalDocs/si514.pdf
+    https://www.silabs.com/Support%20Documents/TechnicalDocs/si514.pdf
 
 Required properties:
  - compatible: Shall be "silabs,si514"
diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.txt b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
index f00191cad8cd..8fe6f80afade 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5351.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
@@ -2,7 +2,7 @@ Binding for Silicon Labs Si5351a/b/c programmable i2c clock generator.
 
 Reference
 [1] Si5351A/B/C Data Sheet
-    http://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351.pdf
+    https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351.pdf
 
 The Si5351a/b/c are programmable i2c clock generators with up to 8 output
 clocks. Si5351a also has a reduced pin-count package (MSOP10) where only
diff --git a/Documentation/devicetree/bindings/clock/silabs,si570.txt b/Documentation/devicetree/bindings/clock/silabs,si570.txt
index c09f21e1d98f..901935e929d2 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si570.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si570.txt
@@ -7,9 +7,9 @@ found in the data sheets[2][3].
 
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
 [2] Si570/571 Data Sheet
-    http://www.silabs.com/Support%20Documents/TechnicalDocs/si570.pdf
+    https://www.silabs.com/Support%20Documents/TechnicalDocs/si570.pdf
 [3] Si598/599 Data Sheet
-    http://www.silabs.com/Support%20Documents/TechnicalDocs/si598-99.pdf
+    https://www.silabs.com/Support%20Documents/TechnicalDocs/si598-99.pdf
 
 Required properties:
  - compatible: Shall be one of "silabs,si570", "silabs,si571",
diff --git a/Documentation/devicetree/bindings/clock/ti,cdce706.txt b/Documentation/devicetree/bindings/clock/ti,cdce706.txt
index 959d96632f5d..21c3ff764788 100644
--- a/Documentation/devicetree/bindings/clock/ti,cdce706.txt
+++ b/Documentation/devicetree/bindings/clock/ti,cdce706.txt
@@ -1,7 +1,7 @@
 Bindings for Texas Instruments CDCE706 programmable 3-PLL clock
 synthesizer/multiplier/divider.
 
-Reference: http://www.ti.com/lit/ds/symlink/cdce706.pdf
+Reference: https://www.ti.com/lit/ds/symlink/cdce706.pdf
 
 I2C device node required properties:
 - compatible: shall be "ti,cdce706".
diff --git a/Documentation/devicetree/bindings/clock/ti,cdce925.txt b/Documentation/devicetree/bindings/clock/ti,cdce925.txt
index 26544c85202a..df42ab72718f 100644
--- a/Documentation/devicetree/bindings/clock/ti,cdce925.txt
+++ b/Documentation/devicetree/bindings/clock/ti,cdce925.txt
@@ -4,10 +4,10 @@ Reference
 This binding uses the common clock binding[1].
 
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] http://www.ti.com/product/cdce913
-[3] http://www.ti.com/product/cdce925
-[4] http://www.ti.com/product/cdce937
-[5] http://www.ti.com/product/cdce949
+[2] https://www.ti.com/product/cdce913
+[3] https://www.ti.com/product/cdce925
+[4] https://www.ti.com/product/cdce937
+[5] https://www.ti.com/product/cdce949
 
 The driver provides clock sources for each output Y1 through Y5.
 
diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index 239102e37e2f..c91e9096b070 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -4,7 +4,7 @@
  *
  * Copyright (c) 2014 Cadence Design Systems Inc.
  *
- * Reference: http://www.ti.com/lit/ds/symlink/cdce706.pdf
+ * Reference: https://www.ti.com/lit/ds/symlink/cdce706.pdf
  */
 
 #include <linux/clk.h>
diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 70397b4b5ffe..38755a241ab7 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2013 - 2014 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 - 2014 Texas Instruments Incorporated - https://www.ti.com
  *
  * Authors:
  *    Jyri Sarha <jsarha@ti.com>
diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 71de3618e508..1e1702e609cb 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -7,9 +7,9 @@
  *
  * References:
  * [1] "Si5351A/B/C Data Sheet"
- *     http://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351.pdf
+ *     https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351.pdf
  * [2] "Manually Generating an Si5351 Register Map"
- *     http://www.silabs.com/Support%20Documents/TechnicalDocs/AN619.pdf
+ *     https://www.silabs.com/Support%20Documents/TechnicalDocs/AN619.pdf
  */
 
 #include <linux/module.h>
diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 7edf8c8432b6..2ad26cb927fd 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -1,7 +1,7 @@
 /*
  * SCI Clock driver for keystone based devices
  *
- * Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015-2016 Texas Instruments Incorporated - https://www.ti.com/
  *	Tero Kristo <t-kristo@ti.com>
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
index 8d7dbea3bd30..5b3d36462174 100644
--- a/drivers/clk/keystone/syscon-clk.c
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2020 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index cd38ae2a9cb5..3958b580d942 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -17,7 +17,7 @@
  * blocks below. Those offsets must be multiplied by 4 before adding them to
  * the base address to get the right value
  *
- * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
+ * [0] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
  */
 #define HHI_GP_PLL_CNTL			0x40  /* 0x10 offset in data sheet */
 #define HHI_GP_PLL_CNTL2		0x44  /* 0x11 offset in data sheet */
diff --git a/drivers/clk/versatile/icst.c b/drivers/clk/versatile/icst.c
index ba4b2d22ec97..307cb3774f87 100644
--- a/drivers/clk/versatile/icst.c
+++ b/drivers/clk/versatile/icst.c
@@ -5,7 +5,7 @@
  *  Copyright (C) 2003 Deep Blue Solutions, Ltd, All Rights Reserved.
  *
  *  Support functions for calculating clocks/divisors for the ICST307
- *  clock generators.  See http://www.idt.com/ for more information
+ *  clock generators.  See https://www.idt.com/ for more information
  *  on these devices.
  *
  *  This is an almost identical implementation to the ICST525 clock generator.
diff --git a/drivers/clk/versatile/icst.h b/drivers/clk/versatile/icst.h
index 73a3062b4535..29622768b02a 100644
--- a/drivers/clk/versatile/icst.h
+++ b/drivers/clk/versatile/icst.h
@@ -3,7 +3,7 @@
  *  Copyright (C) 2003 Deep Blue Solutions, Ltd, All Rights Reserved.
  *
  *  Support functions for calculating clocks/divisors for the ICST
- *  clock generators.  See http://www.idt.com/ for more information
+ *  clock generators.  See https://www.idt.com/ for more information
  *  on these devices.
  */
 #ifndef ICST_H
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
