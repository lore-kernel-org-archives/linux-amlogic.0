Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B08C54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 21:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nE82fpG6MvPDmiNMVrT+zU7QkFt8PFr5S3HY7PfFstE=; b=W9Qr1LG4eTz6Tx
	SQldqvZWA99htAiN63Gue37aDcL1td9hHBtkfF9TLCd6weDX1bHBx5SAPfKq39C8nnA++WA8X3D3m
	XRH9GDuQsWKrufTTOa5afRLXoEOjRewI5UD7lzFV440zIDPJ/aGG1oDfVW0H/IJRvS6vDYY7K6svJ
	YLOP3v+dWMbeyDJTzpl2wyO6obW5irikNmR2jYMC0/nY70Y/IXNB3/brL/pSxVWdkTGEVYr7W+l5o
	4zirUj7oq22KJWTt/rD1ibOoPXCnzvHXWDNmTQLehtGrvuGNLm/y0ZfetJIsQiUs/Ojuq04C0Zls0
	56pf17jL3OkaUF5O8Jeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLW6O-00GVgT-AL; Fri, 27 Jan 2023 21:17:40 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLW5m-00GVR5-Pw; Fri, 27 Jan 2023 21:17:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id qw12so1161762ejc.2;
        Fri, 27 Jan 2023 13:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h26lxS/rC2l6H34/Yb9jlhl/eiLIQrWyvYolxstx9ZU=;
        b=ZZh9GBEqn54nWJUNtdar2XGzvYDp905CZtKPF/ej70WdbpP7wEG9UwoLXstS3QLAoQ
         lq6GeQYUXwOYv4qNh09efX+kkCenuzhI0pmarnhYFJ74k3IsKEQGdiLUgCVySoEgNujX
         a1HXWcJzR3eALGyGlqHE9XcuNTh6EddCDTzF71hkJxyYcPVLD7/MEtZYGB9TVtojSsQI
         Tte+EQ+7NeE1+CdorD5B0KpMr3h5yJEJTXZP3qaJ2a50y0uilb4kaTK+SJmPBXcyex1u
         GYxDCTzpl6D6FzU6JQyp1Wx/zQRfo2oT2MtoglNnzuL4aobG1TxATPX6r8tiT5wjjLAO
         Ex+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h26lxS/rC2l6H34/Yb9jlhl/eiLIQrWyvYolxstx9ZU=;
        b=qug/eUyWeTwquwI20Ixb06xIVCwk6GXtN6Vgdb1V5cqWF3+pE6ewFUAtfZpScTIiyT
         YQL49x+phUsHXBhwng6lbiuG01fV9bc8tQ34XOfOZQ+o9s52EiaVdddI/QVSVZz0B4n9
         IFM7+g2YRbtV5L6E9PW/NyIp/Uf4QuvBC8qMfwq85sYTfp2BKeOnpF2RpXxm/MxRjGzv
         UKl3oKz0M8syXJZOihBnMF9/rtKNp0cIPjzXjEuGk7Knyn0AM3OmnlYZSbj2dclve1QG
         lMRvjlbi60/4Z+ZLnSVKVrrVkNH65fXhk0po1/aL/BUxLcvbkK4OLTuR9BMhj4G1CW7N
         ZDbQ==
X-Gm-Message-State: AFqh2kpR9mUFCPmROrzJcW5fnLmdtvTEawSmVdJ0GEB1gv2nKqz8mAVO
	jxLGXoTEwVYUP9KiWW+wTmuc+IKnzBg=
X-Google-Smtp-Source: AMrXdXtgitUgK1mde2F6rY4Kjvrr6+RQI6BeXmJS2UGgJna9J+wdXlOGjycXivglIOtjunJhYO9Qrw==
X-Received: by 2002:a17:907:75e7:b0:871:3919:cbea with SMTP id jz7-20020a17090775e700b008713919cbeamr42386843ejc.54.1674854220232;
        Fri, 27 Jan 2023 13:17:00 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e0f:9000:c8f2:6e21:84ed:c3a3? (dynamic-2a01-0c22-6e0f-9000-c8f2-6e21-84ed-c3a3.c22.pool.telefonica.de. [2a01:c22:6e0f:9000:c8f2:6e21:84ed:c3a3])
        by smtp.googlemail.com with ESMTPSA id q18-20020a1709064c9200b0085ff3202ce7sm2869047eju.219.2023.01.27.13.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 13:16:59 -0800 (PST)
Message-ID: <3ffd1889-1966-47a8-9504-d44e452d5a31@gmail.com>
Date: Fri, 27 Jan 2023 22:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Content-Language: en-US
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_131702_922329_AB34C431 
X-CRM114-Status: GOOD (  16.85  )
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

Convert Amlogic Meson pinctrl binding to yaml.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- consider that more than one compatible can be set
- remove bus part from example
---
 .../pinctrl/amlogic,meson-pinctrl.yaml        | 124 ++++++++++++++++++
 .../bindings/pinctrl/meson,pinctrl.txt        |  94 -------------
 2 files changed, 124 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
new file mode 100644
index 000000000..7ab6e2089
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    minItems: 1
+    maxItems: 2
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8-cbus-pinctrl
+              - amlogic,meson8b-cbus-pinctrl
+              - amlogic,meson8m2-cbus-pinctrl
+              - amlogic,meson8-aobus-pinctrl
+              - amlogic,meson8b-aobus-pinctrl
+              - amlogic,meson8m2-aobus-pinctrl
+              - amlogic,meson-gxbb-periphs-pinctrl
+              - amlogic,meson-gxbb-aobus-pinctrl
+              - amlogic,meson-gxl-periphs-pinctrl
+              - amlogic,meson-gxl-aobus-pinctrl
+              - amlogic,meson-axg-periphs-pinctrl
+              - amlogic,meson-axg-aobus-pinctrl
+              - amlogic,meson-g12a-periphs-pinctrl
+              - amlogic,meson-g12a-aobus-pinctrl
+              - amlogic,meson-a1-periphs-pinctrl
+              - amlogic,meson-s4-periphs-pinctrl
+      - items:
+          - const: amlogic,meson8m2-aobus-pinctrl
+          - const: amlogic,meson8-aobus-pinctrl
+      - items:
+          - const: amlogic,meson8m2-cbus-pinctrl
+          - const: amlogic,meson8-cbus-pinctrl
+
+  ranges: true
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+required:
+  - compatible
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+patternProperties:
+  "^bank@[0-9]$":
+    type: object
+    properties:
+      reg:
+        minItems: 5
+        maxItems: 5
+
+      reg-names:
+        items:
+          - const: gpio
+          - const: pull
+          - const: pull-enable
+          - const: mux
+          - const: ds
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+    required:
+      - reg
+      - reg-names
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+
+examples:
+  - |
+    pinctrl {
+      compatible = "amlogic,meson-g12a-periphs-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@40 {
+        reg = <0x0 0x40  0x0 0x4c>,
+              <0x0 0xe8  0x0 0x18>,
+              <0x0 0x120 0x0 0x18>,
+              <0x0 0x2c0 0x0 0x40>,
+              <0x0 0x340 0x0 0x1c>;
+        reg-names = "gpio", "pull", "pull-enable", "mux", "ds";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&periphs_pinctrl 0 0 86>;
+      };
+
+      cec_ao_a_h_pins: cec_ao_a_h {
+        mux {
+          groups = "cec_ao_a_h";
+          function = "cec_ao_a_h";
+          bias-disable;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
deleted file mode 100644
index 8146193bd..000000000
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-== Amlogic Meson pinmux controller ==
-
-Required properties for the root node:
- - compatible: one of "amlogic,meson8-cbus-pinctrl"
-		      "amlogic,meson8b-cbus-pinctrl"
-		      "amlogic,meson8m2-cbus-pinctrl"
-		      "amlogic,meson8-aobus-pinctrl"
-		      "amlogic,meson8b-aobus-pinctrl"
-		      "amlogic,meson8m2-aobus-pinctrl"
-		      "amlogic,meson-gxbb-periphs-pinctrl"
-		      "amlogic,meson-gxbb-aobus-pinctrl"
-		      "amlogic,meson-gxl-periphs-pinctrl"
-		      "amlogic,meson-gxl-aobus-pinctrl"
-		      "amlogic,meson-axg-periphs-pinctrl"
-		      "amlogic,meson-axg-aobus-pinctrl"
-		      "amlogic,meson-g12a-periphs-pinctrl"
-		      "amlogic,meson-g12a-aobus-pinctrl"
-		      "amlogic,meson-a1-periphs-pinctrl"
-		      "amlogic,meson-s4-periphs-pinctrl"
- - reg: address and size of registers controlling irq functionality
-
-=== GPIO sub-nodes ===
-
-The GPIO bank for the controller is represented as a sub-node and it acts as a
-GPIO controller.
-
-Required properties for sub-nodes are:
- - reg: should contain a list of address and size, one tuple for each entry
-   in reg-names.
- - reg-names: an array of strings describing the "reg" entries.
-   Must contain "mux" and "gpio".
-   May contain "pull", "pull-enable" and "ds" when appropriate.
- - gpio-controller: identifies the node as a gpio controller
- - #gpio-cells: must be 2
-
-=== Other sub-nodes ===
-
-Child nodes without the "gpio-controller" represent some desired
-configuration for a pin or a group. Those nodes can be pinmux nodes or
-configuration nodes.
-
-Required properties for pinmux nodes are:
- - groups: a list of pinmux groups. The list of all available groups
-   depends on the SoC and can be found in driver sources.
- - function: the name of a function to activate for the specified set
-   of groups. The list of all available functions depends on the SoC
-   and can be found in driver sources.
-
-Required properties for configuration nodes:
- - pins: a list of pin names
-
-Configuration nodes support the following generic properties, as
-described in file pinctrl-bindings.txt:
- - "bias-disable"
- - "bias-pull-up"
- - "bias-pull-down"
- - "output-enable"
- - "output-disable"
- - "output-low"
- - "output-high"
-
-Optional properties :
- - drive-strength-microamp: Drive strength for the specified pins in uA.
-			    This property is only valid for G12A and newer.
-
-=== Example ===
-
-	pinctrl: pinctrl@c1109880 {
-		compatible = "amlogic,meson8-cbus-pinctrl";
-		reg = <0xc1109880 0x10>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		gpio: banks@c11080b0 {
-			reg = <0xc11080b0 0x28>,
-			      <0xc11080e8 0x18>,
-			      <0xc1108120 0x18>,
-			      <0xc1108030 0x30>;
-			reg-names = "mux", "pull", "pull-enable", "gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-               };
-
-		nand {
-			mux {
-				groups = "nand_io", "nand_io_ce0", "nand_io_ce1",
-					 "nand_io_rb0", "nand_ale", "nand_cle",
-					 "nand_wen_clk", "nand_ren_clk", "nand_dqs",
-					 "nand_ce2", "nand_ce3";
-				function = "nand";
-			};
-		};
-	};
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
