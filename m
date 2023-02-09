Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1574AC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9Be4p6T3Koco2G5wLua/ouyUsV3fA/I2urI8iU2/CQ=; b=b3/Pg+hPCAWwqI
	EtoLZxj06a0D8chndQcFeQdklL4/Z4IqC8qupcWdysCcEKUhXvjIyXDzG4GmPI09bULYzrhNnCeMT
	CBFQlzJR4eqydEqfYwz4llTzJSjsv2e+T0vIZzrLAAT6NUGYFnsa76zbBof3aJ+m9uw+Q/WlWtiTb
	d/eoN/LGmj9Jjm7MTKS3uT5amJQH8N9wrdY6Kkp02wJebyIKn2T6dNPZcAFq9Aj+YIuPdNtesRXHv
	HD2h957/y6uM/HqWhMKihF4qx0qwzw4fX652OijVvzcQYpXCjVbhN2W2lJv958bTZ8EwWJd1Ag2cK
	1W5XigS5oggqu9K74D0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7Ed-001o3o-Tt; Thu, 09 Feb 2023 13:45:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7BK-001mNQ-Ut
	for linux-amlogic@lists.infradead.org; Thu, 09 Feb 2023 13:41:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id o36so1467729wms.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Feb 2023 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hc8Gzc5w2WaVZNG5CkDqwlYoHGw+jL6hi6qtKT52GZk=;
        b=kvVm1OmXqPGnpJI5TopR9DfcldzUxQMX1516obRL2PJo0DaXqK4jSN/lcGMxQjCcEy
         3L5Vl1H6LPyzp61HgyDIHTXwWD4YcukZckOBPdhpBP+q5+dHc2burS1uP149Pla1w54Z
         +oBRxx2N+fW1jWKvhUenKAVTjQ550bCAuWpuBqFPj2SoPQM9xJ2lTQZY+9IoRYVVKOBs
         CyfO1JNHXsNj9TsxYP9fTehIdGqtQwL/acysOAI9Vn6Yibzk1AMwVN/1C7CBtd6SGl4u
         dVXaZMOQJPfMS4ALVkyOYP304wwbHKcjvBvmr80R5ZrfeSwfW2TXUzeJYwjoLm9mbpWh
         mkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hc8Gzc5w2WaVZNG5CkDqwlYoHGw+jL6hi6qtKT52GZk=;
        b=1uCcsleGwH3Hly+F4/hD3Egv6x6l2zgIt5YlVS+qXyacVj5RrmSDVpapI1svr8eglW
         ucOwijGTFrNnGuiswb0Z8rQGaQIucbtbt+ih3R1ohGi83LYYfLDqiB71C2FuU8q43uvj
         4uqNblVuaNe1vpURHFL1/1E37u7QMJbIxyGh0FyVbxi2fcn/5YNITBNW9cgnwclZU87s
         D6DpaGnJvpzdYUYBUefJkEVNoQo8nzPeD6D/0W6CO2QGZrP4Oq4ukdao57LxJ8OOQmnn
         lErLITdBAIApLGs8Fvdhg4NnotpCa00Bt7kC3Oyo+iuju+kvCXG8jnd7epTgMdp4PfBn
         YqNg==
X-Gm-Message-State: AO0yUKXRAYtlb/wck2RQxViJFHCj8A/TDpcM8LlI3bUaaz+S6sjDFl0P
	5skwW96L6AVC9qDGZMLbiorj5g==
X-Google-Smtp-Source: AK7set+eB8XgdP1CgHE058m1fm6s4izsSPTgG8itWB1RojjvsAe0bKo/TCNVD+hUraIJ7UKQBD/krw==
X-Received: by 2002:a05:600c:18a6:b0:3e0:e77:3056 with SMTP id x38-20020a05600c18a600b003e00e773056mr9924752wmp.30.1675950104519;
        Thu, 09 Feb 2023 05:41:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003dfe549da4fsm4946991wmi.18.2023.02.09.05.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:41:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Feb 2023 14:41:41 +0100
Subject: [PATCH 5/6] dt-bindings: soc: amlogic: convert
 amlogic,gxbb-aoclkc.txt to dt-schema
MIME-Version: 1.0
Message-Id: <20230209-b4-amlogic-bindings-convert-take2-v1-5-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_054147_049601_FDFBDA06 
X-CRM114-Status: GOOD (  15.79  )
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

Convert the Amlogic Always-On Clock Controller bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |  64 -----------
 .../bindings/clock/amlogic,gxbb-aoclkc.yaml        | 120 +++++++++++++++++++++
 2 files changed, 120 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
deleted file mode 100644
index c41f0be5d438..000000000000
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-* Amlogic GXBB AO Clock and Reset Unit
-
-The Amlogic GXBB AO clock controller generates and supplies clock to various
-controllers within the Always-On part of the SoC.
-
-Required Properties:
-
-- compatible: value should be different for each SoC family as :
-	- GXBB (S905) : "amlogic,meson-gxbb-aoclkc"
-	- GXL (S905X, S905D) : "amlogic,meson-gxl-aoclkc"
-	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
-	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
-	- G12A (S905X2, S905D2, S905Y2) : "amlogic,meson-g12a-aoclkc"
-	followed by the common "amlogic,meson-gx-aoclkc"
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "xtal"     : the platform xtal
-  * "mpeg-clk" : the main clock controller mother clock (aka clk81)
-  * "ext-32k-0"  : external 32kHz reference #0 if any (optional)
-  * "ext-32k-1"  : external 32kHz reference #1 if any (optional - gx only)
-  * "ext-32k-2"  : external 32kHz reference #2 if any (optional - gx only)
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. All available clocks are defined as
-preprocessor macros in the dt-bindings/clock/gxbb-aoclkc.h header and can be
-used in device tree sources.
-
-- #reset-cells: should be 1.
-
-Each reset is assigned an identifier and client nodes can use this identifier
-to specify the reset which they consume. All available resets are defined as
-preprocessor macros in the dt-bindings/reset/gxbb-aoclkc.h header and can be
-used in device tree sources.
-
-Parent node should have the following properties :
-- compatible: "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd"
-- reg: base address and size of the AO system control register space.
-
-Example: AO Clock controller node:
-
-ao_sysctrl: sys-ctrl@0 {
-	compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
-	reg =  <0x0 0x0 0x0 0x100>;
-
-	clkc_AO: clock-controller {
-		compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		clocks = <&xtal>, <&clkc CLKID_CLK81>;
-		clock-names = "xtal", "mpeg-clk";
-	};
-
-Example: UART controller node that consumes the clock and reset generated
-  by the clock controller:
-
-	uart_AO: serial@4c0 {
-		compatible = "amlogic,meson-uart";
-		reg = <0x4c0 0x14>;
-		interrupts = <0 90 1>;
-		clocks = <&clkc_AO CLKID_AO_UART1>;
-		resets = <&clkc_AO RESET_AO_UART1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.yaml
new file mode 100644
index 000000000000..3ac432a112ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,gxbb-aoclkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Always-On Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson-gxbb-aoclkc
+              - amlogic,meson-gxl-aoclkc
+              - amlogic,meson-gxm-aoclkc
+              - amlogic,meson-axg-aoclkc
+          - const: amlogic,meson-gx-aoclkc
+      - items:
+          - enum:
+              - amlogic,meson-axg-aoclkc
+              - amlogic,meson-g12a-aoclkc
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    minItems: 2
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gxbb-clkc
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 5
+
+        clock-names:
+          minItems: 2
+          items:
+            - const: xtal 
+            - const: mpeg-clk
+            - const: ext-32k-0
+            - const: ext-32k-1
+            - const: ext-32k-2
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-g12a-aoclkc
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 3
+
+        clock-names:
+          minItems: 2
+          items:
+            - const: xtal 
+            - const: mpeg-clk
+            - const: ext-32k-0
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gxl-clkc
+            - amlogic,meson-gxm-clkc
+            - amlogic,meson-axg-clkc
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: xtal 
+            - const: mpeg-clk
+
+additionalProperties: false
+
+examples:
+  - |
+    sysctrl: system-controller@0 {
+        compatible = "amlogic,meson-gx-ao-sysctrl", "simple-mfd", "syscon";
+        reg = <0 0x100>;
+ 
+        clkc: clock-controller {
+            compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            clocks = <&xtal>, <&clk81>;
+            clock-names = "xtal", "mpeg-clk";
+        };
+    };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
