Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F242CC7618A
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Mar 2023 21:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S4xzFacaPA0etp/w6TUOeawpfsUO+uJkhykmznx5XyI=; b=aXBcCJstHStZJW
	XrvKFq+XZSuwuKTNIqFOgGR2at7ZhXS8u3BVcJhSxOs7M+PDGMV5Gga8jpSdMtjDQZ97wqjaWREio
	AhKHMg9QrOZ+u60KxwEyqIMjMqItjnSu/V7mLsoEXCTM9+0nu0U71Tn6NdCNWotdY+O0jvcn1MLCX
	RLj0RcbNqvN+jGspUVSw826Z4PfOlMGBE8FJEr+f2Jap2TyS6XcErkAY451gI+mmvSultRo3F7u3m
	idqDdEDlu7C2Mw7uwQ/xhrLns6GY5BRVv2hFYGYKb2XomFQ5zZS+aI5IWIZKnA6Rn1K6ZrlKViUer
	JK2gHx2Xrch0iLUlWFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcYbe-00ESUh-2I;
	Wed, 15 Mar 2023 21:24:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcYbZ-00ESTm-1t;
	Wed, 15 Mar 2023 21:24:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso2169585wms.5;
        Wed, 15 Mar 2023 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678915453;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oukVM9wzPaSEz21U5gUTJLfJ+25TwrakiaDjN1W4Oic=;
        b=MKOUgraq5Q6U0K4DJ2FkzFNDpSKgvkeLITWjfEtmSD8JR70JtDtcpm3p/sjQv0J/bg
         4FA2zQHuFG3j+Kt4voSryxsNELCUGYVUeSUEkyvfZSK1w+6ekF2csfF91pblJe1sB4Fi
         irPft2bMKldPoViWZ3tFtqDa/LRIb4OV8le7oxPDOCqtUiN9F2kYitJZZ2AyiIc7pIOg
         WOhwgY0KfygSvgHSa8Eryhy+pUOai7DaLCjmnHkbjAnQF3PapsHxqPDr0eWke1ZZ6mgY
         e5zJHbcM6iLu84h5G+8MoPFWvX/BUutfB8lGp65vWydNu1s+ai4sQOv+1CNZkOhVlS1c
         Dz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678915453;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oukVM9wzPaSEz21U5gUTJLfJ+25TwrakiaDjN1W4Oic=;
        b=SoH9mhKodamiq3b4hp8GJD1kJlDEPiIuMH5FwaXmbuJJXzotApwzJt94ChMilnw1yL
         MIM9LNTaZ6L70KH5cn0sGSpbXvDSWi/xEDAlH21X7It8SxeIsDBJ1GZRTEliXehOvXoa
         BHTn5mbxy38TJmx33vVqMULoTotAlkQcwAaByXvvG1ehpqwoSGs96m6sjMlGjlkEktWL
         cihx1Efz1hPeR1Pudro3k5suEiyUhudSe04GH3tICSPOLzsynxRdelIdsndL3+8G5aKC
         6mmKfBrkw8cNJ9HzoJHEzuFDOMoou2KyDRUFTscvSzKMv7m1jRm6srWxydrPC3XnHBUi
         eoEw==
X-Gm-Message-State: AO0yUKXJQUOF7nWg6PUqpfEFOWMlc8GGh9gYGI/Ow+txXFYp0MSk7/UP
	wCb3EhV+hysEN/w7tCpb3tc=
X-Google-Smtp-Source: AK7set+6MYhd2Nc/tzLSwAGMotYkmK57b70rblnRaCkPwf7tSSw7W5qiLiXYlb60cOw/3t1q/3JBiA==
X-Received: by 2002:a05:600c:470e:b0:3eb:29fe:734a with SMTP id v14-20020a05600c470e00b003eb29fe734amr19313367wmo.39.1678915453327;
        Wed, 15 Mar 2023 14:24:13 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bcc4:9b00:c423:87da:b23:892a? (dynamic-2a01-0c23-bcc4-9b00-c423-87da-0b23-892a.c23.pool.telefonica.de. [2a01:c23:bcc4:9b00:c423:87da:b23:892a])
        by smtp.googlemail.com with ESMTPSA id l4-20020a1c7904000000b003ed1ff06faasm2930087wme.19.2023.03.15.14.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 14:24:12 -0700 (PDT)
Message-ID: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
Date: Wed, 15 Mar 2023 22:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v5] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_142417_659639_F4F4E944 
X-CRM114-Status: GOOD (  13.40  )
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

Convert Amlogic Meson pin controller binding to yaml.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- consider that more than one compatible can be set
- remove bus part from example
v3:
- remove minItem/maxItem properties for compatible
v4:
- split patch to be able to deal with the different reg/reg-names
v5:
- remove compatible definition from common yaml
- move pincfg-node and pinmux-node definition to meson-gpio object definition
---
 .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 63 +++++++++++++
 .../pinctrl/amlogic,meson-pinctrl-common.yaml | 52 ++++++++++
 .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 64 +++++++++++++
 .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 68 ++++++++++++++
 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 72 ++++++++++++++
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 74 +++++++++++++++
 .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
 7 files changed, 393 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
new file mode 100644
index 000000000..05074df12
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-a1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson A1 pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-a1-periphs-pinctrl
+      - amlogic,meson-s4-periphs-pinctrl
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    properties:
+      reg:
+        maxItems: 2
+
+      reg-names:
+        items:
+          - const: mux
+          - const: gpio
+
+examples:
+  - |
+    periphs_pinctrl: pinctrl {
+      compatible = "amlogic,meson-a1-periphs-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@400 {
+        reg = <0x0400 0x003c>,
+              <0x0480 0x0118>;
+        reg-names = "mux", "gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&periphs_pinctrl 0 0 62>;
+
+        cec_ao_a_h_pins: cec_ao_a_h {
+          mux {
+            groups = "cec_ao_a_h";
+            function = "cec_ao_a_h";
+            bias-disable;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
new file mode 100644
index 000000000..9620f2853
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-common.yaml#
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
+  ranges: true
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+required:
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: true
+
+$defs:
+  meson-gpio:
+    type: object
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+    properties:
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+    required:
+      - reg
+      - reg-names
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
new file mode 100644
index 000000000..8baaec81c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson G12 AOBUS pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-aobus-pinctrl
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    properties:
+      reg:
+        maxItems: 3
+
+      reg-names:
+        items:
+          - const: mux
+          - const: ds
+          - const: gpio
+
+examples:
+  - |
+    ao_pinctrl: pinctrl {
+      compatible = "amlogic,meson-g12a-aobus-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@14 {
+        reg = <0x14 0x8>,
+              <0x1c 0x8>,
+              <0x24 0x14>;
+        reg-names = "mux", "ds", "gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&ao_pinctrl 0 0 15>;
+
+        cec_ao_a_h_pins: cec_ao_a_h {
+          mux {
+            groups = "cec_ao_a_h";
+            function = "cec_ao_a_h";
+            bias-disable;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
new file mode 100644
index 000000000..7216cd8e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson G12 PERIPHS pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-periphs-pinctrl
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    properties:
+      reg:
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
+examples:
+  - |
+    periphs_pinctrl: pinctrl {
+      compatible = "amlogic,meson-g12a-periphs-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@40 {
+        reg = <0x40  0x4c>,
+              <0xe8  0x18>,
+              <0x120 0x18>,
+              <0x2c0 0x40>,
+              <0x340 0x1c>;
+        reg-names = "gpio", "pull", "pull-enable", "mux", "ds";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&periphs_pinctrl 0 0 86>;
+
+        cec_ao_a_h_pins: cec_ao_a_h {
+          mux {
+            groups = "cec_ao_a_h";
+            function = "cec_ao_a_h";
+            bias-disable;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
new file mode 100644
index 000000000..2ad79d754
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson8 AOBUS pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson8-aobus-pinctrl
+          - amlogic,meson8b-aobus-pinctrl
+          - amlogic,meson-gxbb-aobus-pinctrl
+          - amlogic,meson-gxl-aobus-pinctrl
+          - amlogic,meson-axg-aobus-pinctrl
+      - items:
+          - const: amlogic,meson8m2-aobus-pinctrl
+          - const: amlogic,meson8-aobus-pinctrl
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    properties:
+      reg:
+        maxItems: 3
+
+      reg-names:
+        items:
+          - const: mux
+          - const: pull
+          - const: gpio
+
+examples:
+  - |
+    pinctrl_aobus: pinctrl {
+      compatible = "amlogic,meson8-aobus-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@14 {
+        reg = <0x14 0x4>,
+              <0x2c 0x4>,
+              <0x24 0x8>;
+        reg-names = "mux", "pull", "gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl_aobus 0 0 16>;
+
+        cec_ao_a_h_pins: cec_ao_a_h {
+          mux {
+            groups = "cec_ao_a_h";
+            function = "cec_ao_a_h";
+            bias-disable;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
new file mode 100644
index 000000000..a04fbcb1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson8 CBUS pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson8-cbus-pinctrl
+          - amlogic,meson8b-cbus-pinctrl
+          - amlogic,meson-gxbb-periphs-pinctrl
+          - amlogic,meson-gxl-periphs-pinctrl
+          - amlogic,meson-axg-periphs-pinctrl
+      - items:
+          - const: amlogic,meson8m2-cbus-pinctrl
+          - const: amlogic,meson8-cbus-pinctrl
+
+unevaluedProperties: false
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    properties:
+      reg:
+        maxItems: 4
+
+      reg-names:
+        items:
+          - const: mux
+          - const: pull
+          - const: pull-enable
+          - const: gpio
+
+examples:
+  - |
+    pinctrl_cbus: pinctrl {
+      compatible = "amlogic,meson8-cbus-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@80b0 {
+        reg = <0x80b0 0x28>,
+              <0x80e8 0x18>,
+              <0x8120 0x18>,
+              <0x8030 0x30>;
+        reg-names = "mux", "pull", "pull-enable", "gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl_cbus 0 0 120>;
+
+        cec_ao_a_h_pins: cec_ao_a_h {
+          mux {
+            groups = "cec_ao_a_h";
+            function = "cec_ao_a_h";
+            bias-disable;
+          };
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
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
