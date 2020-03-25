Return-Path: <SRS0=FVXd=5K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1B6C2D0E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 22:06:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1889B20719
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 22:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rmqsitqB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1889B20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uctd8yfogPa4u+8wK/ae92Cavh5k+lw3dEVG+g4cmGg=; b=rmqsitqBwMo/WM
	yB4+xSoHZPWBR/QLC1TYY3XQUZp9CKJpaXuRWBuky8+2Yb2TUzzAxf4YyB4fUKs0QTuYmaJr6tF72
	lYvVz748+1ggGKjY2aoj+PUi1A6ZOTgNsz7bmpAWCid6FbdFJ0HXuo1UGA5t6SdTaewKULR89x8J/
	IqPfMcQVNpHZM8lPaJl/eUZbBD5LOBOXquMwvWQewobISNSZjC6e+Pm5F23g1nBjrTh3aNaLi6fbF
	bOToakNt2UnWCZY6DN1X1prNEqBCSSXIPumLoYgeYHZCcCwbZnsJwQNNJyKHY3xkYl81gzqi/cEO4
	wMTQohyWN8xI8D2AwnOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHEAb-0002L1-9I; Wed, 25 Mar 2020 22:06:41 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHE9o-0001UO-BQ; Wed, 25 Mar 2020 22:05:54 +0000
Received: by mail-il1-f194.google.com with SMTP id j9so3493925ilr.7;
 Wed, 25 Mar 2020 15:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUFauvpsyN0wDc6FIbpH1NvGqy12JzvZbT1B+yDLuQI=;
 b=nOuU8MkHkAl1CNkbJeEcXKjtiX+H08CyEir341vPlebuF+o6wpAqfo9fy77Oz6PrDr
 XCHEDLSl4Ykk5yowgCzKZfsJ6uJCdv/7u/vQtSq1iVZyJ1DnYHt4hgVWyD0eL3gAAeGZ
 SJV8IhssUeGQwMIMvgjAhmGG5AWfGt9RGz98d3ITukGGC3x/MV+huktakmNttfeaSYP1
 j2GxXXHRvY2cWkdp4xBSo3gN0a+6LroU1UzqOpSrkBJY5FqpxKJRW2239gNIgGmzGZkb
 XSd/XvTkasj0aRF1aZHAHnBEhZ9BsLB27lY8ZIcjGhEuySZaVBFkCkl3EKlLv/j0FeW0
 +Y7Q==
X-Gm-Message-State: ANhLgQ3sjEhL/DaXQDJZyDNWQ4h+6HYt11SBO2gYQzWdi4NTTbh/byBh
 3D55H82g6gl47LmcpF6H0g==
X-Google-Smtp-Source: ADFU+vssmBXsIT3JdHtdLKotopbcfeb+QDj5cScX9fD9XgNVL0xOjQ24bSxhYnrUSkMR5zA0b7VhAQ==
X-Received: by 2002:a92:91d6:: with SMTP id e83mr5896271ill.165.1585173950835; 
 Wed, 25 Mar 2020 15:05:50 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.250])
 by smtp.googlemail.com with ESMTPSA id v8sm102390ioh.40.2020.03.25.15.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 15:05:50 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
Date: Wed, 25 Mar 2020 16:05:40 -0600
Message-Id: <20200325220542.19189-4-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325220542.19189-1-robh@kernel.org>
References: <20200325220542.19189-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_150552_413501_0C245B03 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Numerous schemas are missing 'additionalProperties: false' statements which
ensures a binding doesn't have any extra undocumented properties or child
nodes. Fixing this reveals various missing properties, so let's fix all
those occurrences.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-clk@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-iio@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: netdev@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/fsl,plldig.yaml |  3 +++
 .../gpio/socionext,uniphier-gpio.yaml         |  2 ++
 .../bindings/gpu/arm,mali-bifrost.yaml        |  6 ++---
 .../bindings/gpu/arm,mali-midgard.yaml        |  3 +++
 .../bindings/iio/adc/adi,ad7192.yaml          |  1 -
 .../bindings/iio/pressure/bmp085.yaml         |  3 +++
 .../media/amlogic,meson-gx-ao-cec.yaml        |  9 +++++---
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |  3 +++
 .../bindings/net/ti,cpsw-switch.yaml          | 23 ++++++++++++-------
 .../regulator/max77650-regulator.yaml         |  2 +-
 .../bindings/thermal/amlogic,thermal.yaml     |  2 ++
 .../bindings/timer/arm,arch_timer_mmio.yaml   |  2 ++
 12 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/fsl,plldig.yaml b/Documentation/devicetree/bindings/clock/fsl,plldig.yaml
index c8350030b374..d1c040228cf7 100644
--- a/Documentation/devicetree/bindings/clock/fsl,plldig.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,plldig.yaml
@@ -21,6 +21,9 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
   '#clock-cells':
     const: 0
 
diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
index 580a39e09d39..c58ff9a94f45 100644
--- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -41,6 +41,8 @@ properties:
     minimum: 0
     maximum: 512
 
+  gpio-ranges: true
+
   gpio-ranges-group-names:
     $ref: /schemas/types.yaml#/definitions/string-array
 
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index e8b99adcb1bd..05fd9a404ff7 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -43,6 +43,9 @@ properties:
 
   operating-points-v2: true
 
+  resets:
+    maxItems: 2
+
 required:
   - compatible
   - reg
@@ -57,9 +60,6 @@ allOf:
           contains:
             const: amlogic,meson-g12a-mali
     then:
-      properties:
-        resets:
-          minItems: 2
       required:
         - resets
 
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 8d966f3ff3db..6819cde050df 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -75,6 +75,9 @@ properties:
 
   mali-supply: true
 
+  power-domains:
+    maxItems: 1
+
   resets:
     minItems: 1
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
index 84d25bd39488..d0913034b1d8 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
@@ -106,7 +106,6 @@ examples:
         spi-cpha;
         clocks = <&ad7192_mclk>;
         clock-names = "mclk";
-        #interrupt-cells = <2>;
         interrupts = <25 0x2>;
         interrupt-parent = <&gpio>;
         dvdd-supply = <&dvdd>;
diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
index 519137e5c170..5d4aec0e0d24 100644
--- a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
@@ -25,6 +25,9 @@ properties:
       - bosch,bmp280
       - bosch,bme280
 
+  reg:
+    maxItems: 1
+
   vddd-supply:
     description:
       digital voltage regulator (see regulator/regulator.txt)
diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
index 41197578f19a..e8ce37fcbfec 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
@@ -24,6 +24,12 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
@@ -47,7 +53,6 @@ allOf:
             - description: AO-CEC clock
 
         clock-names:
-          maxItems: 1
           items:
             - const: core
 
@@ -66,7 +71,6 @@ allOf:
             - description: AO-CEC clock generator source
 
         clock-names:
-          maxItems: 1
           items:
             - const: oscin
 
@@ -88,4 +92,3 @@ examples:
         clock-names = "core";
         hdmi-phandle = <&hdmi_tx>;
     };
-
diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
index 4fbb9e734284..38dc4f8b0ceb 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
@@ -41,6 +41,9 @@ properties:
   "#clock-cells":
     const: 0
 
+  clock-output-names:
+    const: bd71828-32k-out
+
   rohm,charger-sense-resistor-ohms:
     minimum: 10000000
     maximum: 50000000
diff --git a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
index ac8c76369a86..b9e9696da5be 100644
--- a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
+++ b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
@@ -37,6 +37,12 @@ properties:
     description:
        The physical base address and size of full the CPSW module IO range
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   ranges: true
 
   clocks:
@@ -111,13 +117,6 @@ properties:
             - reg
             - phys
 
-  mdio:
-    type: object
-    allOf:
-      - $ref: "ti,davinci-mdio.yaml#"
-    description:
-      CPSW MDIO bus.
-
   cpts:
     type: object
     description:
@@ -148,6 +147,15 @@ properties:
       - clocks
       - clock-names
 
+patternProperties:
+  "^mdio@":
+    type: object
+    allOf:
+      - $ref: "ti,davinci-mdio.yaml#"
+    description:
+      CPSW MDIO bus.
+
+
 required:
   - compatible
   - reg
@@ -174,7 +182,6 @@ examples:
         #address-cells = <1>;
         #size-cells = <1>;
         syscon = <&scm_conf>;
-        inctrl-names = "default", "sleep";
 
         interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml b/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml
index 7d724159f890..50690487edc8 100644
--- a/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml
@@ -24,7 +24,7 @@ properties:
     const: maxim,max77650-regulator
 
 patternProperties:
-  "^regulator@[0-3]$":
+  "^regulator-(ldo|sbb[0-2])$":
     $ref: "regulator.yaml#"
 
 required:
diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index f761681e4c0d..93fe7b10a82e 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -32,6 +32,8 @@ properties:
     description: phandle to the ao-secure syscon
     $ref: '/schemas/types.yaml#/definitions/phandle'
 
+  '#thermal-sensor-cells':
+    const: 0
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
index 102f319833d9..f7ef6646bade 100644
--- a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
+++ b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
@@ -32,6 +32,8 @@ properties:
   '#size-cells':
     const: 1
 
+  ranges: true
+
   clock-frequency:
     description: The frequency of the main counter, in Hz. Should be present
       only where necessary to work around broken firmware which does not configure
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
