Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD5C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 23:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YG9Pf6OoyLpvExJmjVaN0mEwCmneIrT8RMXXSktY8ZY=; b=NvBJ4SNT9K8eDf
	mDPs03+8KX+EPETrYv3bU63ZmB1S409h20PjWwm/fFoLdgJsma7mu4HZ3FyzB4EMrT8AnX2VrXvMm
	6zIJ2V7/9LnClLh3QEGcRdcYH9wi+hEOpQCnIdc7kQYvt2uzeymYmHVjZclDpWmVaqUP96nMNbhgf
	bsrx4+636s49i13cL3pip0YkQOeTmAqqr2vEo7QGXqwoou8bDTFdVCsiZunVRuSZVmHwQ77Gr/vS3
	vtAwpP+fQ7pq+19FYZRCuWE0M7/4nBu90zF5LPjl6cK0yBXfn0QhKh1x3HJX0nCpfIZxhT4OOXues
	5OkRxY6Xo+e4+hH4TxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb8Tg-001SHg-MW; Sat, 11 Mar 2023 23:18:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb8Td-001SH2-FT; Sat, 11 Mar 2023 23:18:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so8498250wmb.5;
        Sat, 11 Mar 2023 15:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678576692;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UnKenye0MlRfUzVaMfEjleTW/ipSCceVIYweRD/BNs=;
        b=VlqRl/eUVTqX4bTKSUEBr00LvElRkgLVwGs6+BE4YZ0nGbkePNc2QKrWfnYO5xkGx0
         eMhYEynRzQcKIIRzZLzGe8wMloB/Bq8gm9OW8OX449aA9978+XHGo/oM2j+M/HpU+dUi
         ZQyGm148bgDRVfWGaWj7m/X/0JnI6xZAUJhs9LpyZ+nfhfQsANlu7YaGTMN2iRPruhfi
         CO+wZ356WGEtxipBXcXpeIRMusTk02UkqIZ5+8dSNIzXGPnf7Ji1mFOK+ZNBgx/y9Cls
         yPht04UWX7xFZtBCyRczh/ava3Q34jX3/WADj4rl2hLHXfXxKq5yLfUVP6zXZ2Z+VI6Y
         8Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678576692;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3UnKenye0MlRfUzVaMfEjleTW/ipSCceVIYweRD/BNs=;
        b=Xq/vOPb5kGGSr9EtZ0LP+KSBc7zz+c0LU7PPcwiDApEpIpDtwOlBhtxt5y3il9Br0g
         Q/UgwXEVQXKGKawwYECItu9MXxJax3bsq8LFIPhKhu20hLbK7OKqBIIFD1hkSvKzmkN7
         PGODuUQZq2cYxWRWLHq1QvPN0bD0fhgIm2iXfBetRbEluuoak0iBcl/p9Fsm1O8xQUH4
         24rliUqcYnyE0IX7D6eJJbsNV14YJsdr20xhHwHRipyI/EzKWd0QnCaxlkNt0iO9gP2+
         K5LqAtWxXYFO40bm9p9OOVYp5mD/rT/z6Em+QPkPMz9BNOEbLEfBqFdOFVz4Yuwab7s8
         4LWw==
X-Gm-Message-State: AO0yUKWzVYxF2gY9y6yP9LGZHGip4GEW+CIIovQQCxArXs8Wrq+dX0sW
	KIFxvZ3REi/PR3J7te6R7v0=
X-Google-Smtp-Source: AK7set8J22Ohd1kzA/9PUi6CQlJKOm3h157iJQsM+34GBmv3lb6AzaWcBS9T2hzcUJX8x3rC5P1+OA==
X-Received: by 2002:a05:600c:3b99:b0:3dc:5c86:12f3 with SMTP id n25-20020a05600c3b9900b003dc5c8612f3mr6752205wms.1.1678576691745;
        Sat, 11 Mar 2023 15:18:11 -0800 (PST)
Received: from ?IPV6:2a01:c22:7697:7600:79dc:4e28:a7d7:a00c? (dynamic-2a01-0c22-7697-7600-79dc-4e28-a7d7-a00c.c22.pool.telefonica.de. [2a01:c22:7697:7600:79dc:4e28:a7d7:a00c])
        by smtp.googlemail.com with ESMTPSA id 4-20020a05600c024400b003e91b9a92c9sm4013225wmj.24.2023.03.11.15.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 15:18:11 -0800 (PST)
Message-ID: <fe7f06ed-4e74-529c-3cf5-45d635cefcc8@gmail.com>
Date: Sun, 12 Mar 2023 00:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RESEND] dt-bindings: interrupt-controller: Convert Amlogic
 Meson GPIO interrupt controller binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_151813_593414_546645CF 
X-CRM114-Status: GOOD (  17.12  )
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

Convert Amlogic Meson GPIO interrupt controller binding to yaml.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
- consider that more than one compatible may be set
- remove bus part from example
- remove minItem/maxItem properties for compatible
- reduce compatible fallback complexity
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
index 000000000..fe7ef1916
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
+    oneOf:
+      - const: amlogic,meson-gpio-intc
+      - items:
+          - enum:
+              - amlogic,meson8-gpio-intc
+              - amlogic,meson8b-gpio-intc
+              - amlogic,meson-gxbb-gpio-intc
+              - amlogic,meson-gxl-gpio-intc
+              - amlogic,meson-axg-gpio-intc
+              - amlogic,meson-g12a-gpio-intc
+              - amlogic,meson-sm1-gpio-intc
+              - amlogic,meson-a1-gpio-intc
+              - amlogic,meson-s4-gpio-intc
+          - const: amlogic,meson-gpio-intc
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
+    minItems: 8
+    maxItems: 12
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
+    interrupt-controller@9880 {
+      compatible = "amlogic,meson-gxbb-gpio-intc",
+                   "amlogic,meson-gpio-intc";
+      reg = <0x9880 0x10>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
+    };
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
