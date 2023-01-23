Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F42C25B50
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 21:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYg7wjs1ZLRBDaaXGvX6z5HtN2RhV6Ect59oAEbQCZA=; b=OM0kdPBwaVK/RY
	WlBw0v0FMn0Q/gp6NEHqQoDSiRwRsu6McWWrvDUDihc2g2im74gybSsDn5me6Z+Q+c5SJzhHDU7fk
	CsnJesca+QHdvaaMbLcIuJiEH064saxbAG3EyfL4PNpRYNRNrvVRjTqJuO0j3sdIEcuQTQjtcepmP
	v8MfSqN8tstQolp4LwuHz7GePoOY+TAueVtfJp1h5V5ctv8A/4PIyhazhFNvKjJmnwDYkVg2XiKyE
	CzU2dlxnm/cxoCRr1WSmnlyYUBuqMnWYtZmCImieB+6dZK2olAWtG1Cxd4kn40kvmNujLXlTfHQNH
	892ufZjnb1gQEe5jCDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4R9-001X4O-Qy; Mon, 23 Jan 2023 21:33:07 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4PN-001WFq-89; Mon, 23 Jan 2023 21:31:19 +0000
Received: by mail-ej1-x636.google.com with SMTP id bk15so34021347ejb.9;
        Mon, 23 Jan 2023 13:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYvlmmfxDA4UUYf/OiK9s+1lN1pQhhBjaQvJA7GeHrY=;
        b=gUEI6zRAj/toXCWg15SMXa4U6wjilHQGxEWtelW9DRLXhdKeD1724qo8iMhxjKi3fq
         BPNhhJrV4zVSt3XnVJmyBPqR6G2FNkqphGcPhsz4K61f/hH7aw26VsXACAaAKtexdxKY
         r59oAeGEQklpjS5OACquZ0FzW4KHI+NQq9U2ASZ8Fa2xTWdCE0a6RgrrwB7vYtd43aRD
         Zhz9EJTrRw6MOM0FccFYKH+7BiuvVr+Fogp94gnYESPwXxsFUTPcdGcIk/GHKlcwgYVk
         owXL0QLbp5rUdKZFH4f0iJ3+GGI8izzpZR86lcbGc1Qhm4WRvmgvKABob1xni5bhNDAf
         icJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYvlmmfxDA4UUYf/OiK9s+1lN1pQhhBjaQvJA7GeHrY=;
        b=g5n1z7pInQa9p+xhFQrXhhZ2Wo57M3vL8E2VifTV+LT/Qbk8lQwhHxZjljsSQFOuyE
         x91cN4mmZm5SUP100nxUfeA23BkEzgvSNoS6X7bX9pUg0kwU3x4lqBt8xil6YJXKCQa2
         /Nd4ZROMHldqsoo8+f5PjVtiX0H4HIL8qlGvj/lWCI1PkaGQERyq++ium/a6dFKbJ1XJ
         LiAqgrD2iUKy/y9IniVtaMZah2ORck/v4prNgDCg38tGAijTk1nZfE+kK5Q33jq12j7R
         2rbKy3WyER374W92dOtaSLSms+0tbJjaxf+/0/bs1Iltmzp5yVyN+rtJBUAgdTaC6+vr
         IntA==
X-Gm-Message-State: AFqh2kobMrmWm3qrJ7pP0p9hbtRkXEyAK/wHF+LlPiOviNncZF3KEXVi
	X5HzVsmsmvUaEGxhzI/YSnU=
X-Google-Smtp-Source: AMrXdXsU1QYt+uhl4UILU762+HzA5I95FGeqPAQLsQZxB51622KAxepCuLeZpk1RQgJ7ETOrF6VrrQ==
X-Received: by 2002:a17:907:2b1f:b0:870:1550:82bc with SMTP id gc31-20020a1709072b1f00b00870155082bcmr23028933ejc.55.1674509474852;
        Mon, 23 Jan 2023 13:31:14 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7? (dynamic-2a01-0c23-bc5b-9400-dc4c-6fb7-47b2-beb7.c23.pool.telefonica.de. [2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7])
        by smtp.googlemail.com with ESMTPSA id ky25-20020a170907779900b00877596d4eadsm8809611ejc.101.2023.01.23.13.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 13:31:14 -0800 (PST)
Message-ID: <06289641-18b1-320d-6162-7ae176452f31@gmail.com>
Date: Mon, 23 Jan 2023 22:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 7/8] dt-bindings: interrupt-controller: Add Amlogic Meson GPIO
 interrupt controller binding
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_133117_336594_AD6E0AF0 
X-CRM114-Status: GOOD (  18.81  )
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

Add Amlogic Meson GPIO interrupt controller binding.
Tested with make targets dt_binding_check and dtbs_check.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../amlogic,meson-gpio-intc.txt               | 38 ----------
 .../amlogic,meson-gpio-intc.yaml              | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
deleted file mode 100644
index bde63f8f0..000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Amlogic meson GPIO interrupt controller
-
-Meson SoCs contains an interrupt controller which is able to watch the SoC
-pads and generate an interrupt on edge or level. The controller is essentially
-a 256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
-or level and polarity. It does not expose all 256 mux inputs because the
-documentation shows that the upper part is not mapped to any pad. The actual
-number of interrupt exposed depends on the SoC.
-
-Required properties:
-
-- compatible : must have "amlogic,meson8-gpio-intc" and either
-    "amlogic,meson8-gpio-intc" for meson8 SoCs (S802) or
-    "amlogic,meson8b-gpio-intc" for meson8b SoCs (S805) or
-    "amlogic,meson-gxbb-gpio-intc" for GXBB SoCs (S905) or
-    "amlogic,meson-gxl-gpio-intc" for GXL SoCs (S905X, S912)
-    "amlogic,meson-axg-gpio-intc" for AXG SoCs (A113D, A113X)
-    "amlogic,meson-g12a-gpio-intc" for G12A SoCs (S905D2, S905X2, S905Y2)
-    "amlogic,meson-sm1-gpio-intc" for SM1 SoCs (S905D3, S905X3, S905Y3)
-    "amlogic,meson-a1-gpio-intc" for A1 SoCs (A113L)
-    "amlogic,meson-s4-gpio-intc" for S4 SoCs (S802X2, S905Y4, S805X2G, S905W2)
-- reg : Specifies base physical address and size of the registers.
-- interrupt-controller : Identifies the node as an interrupt controller.
-- #interrupt-cells : Specifies the number of cells needed to encode an
-   interrupt source. The value must be 2.
-- meson,channel-interrupts: Array with the 8 upstream hwirq numbers. These
-   are the hwirqs used on the parent interrupt controller.
-
-Example:
-
-gpio_interrupt: interrupt-controller@9880 {
-	compatible = "amlogic,meson-gxbb-gpio-intc",
-		     "amlogic,meson-gpio-intc";
-	reg = <0x0 0x9880 0x0 0x10>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	meson,channel-interrupts = <64 65 66 67 68 69 70 71>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
new file mode 100644
index 000000000..2f6261b9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/amlogic,meson-gpio-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson GPIO interrupt controller
+
+maintainers:
+  - Heiner Kallweit <hkallweit1@gmail.com>
+
+description: |
+  Meson SoCs contains an interrupt controller which is able to watch the SoC
+  pads and generate an interrupt on edge or level. The controller is essentially
+  a 256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
+  or level and polarity. It does not expose all 256 mux inputs because the
+  documentation shows that the upper part is not mapped to any pad. The actual
+  number of interrupt exposed depends on the SoC.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson8-gpio-intc
+      - amlogic,meson8b-gpio-intc
+      - amlogic,meson-gxbb-gpio-intc
+      - amlogic,meson-gxl-gpio-intc
+      - amlogic,meson-axg-gpio-intc
+      - amlogic,meson-g12a-gpio-intc
+      - amlogic,meson-sm1-gpio-intc
+      - amlogic,meson-a1-gpio-intc
+      - amlogic,meson-s4-gpio-intc
+      - amlogic,meson-sc2-gpio-intc
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  amlogic,channel-interrupts:
+    description: Array with the upstream hwirq numbers
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - amlogic,channel-interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    bus@c1100000 {
+      reg = <0x0 0xc1100000 0x0 0x100000>;
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      interrupt-controller@9880 {
+        compatible = "amlogic,meson-gxbb-gpio-intc";
+        reg = <0x0 0x9880 0x0 0x10>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
+      };
+    };
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
