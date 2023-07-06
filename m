Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62978C001DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQ2ZCne6wrOmO0DwwmDBcZwZKPlm1jBn1dtqpPv5e+8=; b=k88fjMUuhGC1rD
	Ex17w5Ja9pN6rYFLWFCImCTDIF8RrnljTdiDvXkI1+sU9f4B+yXutXH/O3L0powVbt0zoUWxVpFZu
	LkSHKzpmTbz3vmIjTgsdUc9p3wnXL0VDSMDAUIibA2sqU76zA7Tyj4irHY/hUEJeUWgR3p5ubRDc9
	qlrJhHEztqgGGuMKoxmq//7H3dHJi2JHf9mSNwbKdo50/XgYQXXn4lHaXKsXHEuRtVXJa72/K/Co9
	CeOBpIB38XOaDdn/e0/2n1p9MNhlISWr+9sffKltLARC7gihuoXNT2FysXmaVhSv7w7PdC8ueqiH7
	aZzyJfTQTvi+DyJSiXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHQLi-001vLO-2Q;
	Thu, 06 Jul 2023 14:52:50 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHQLc-001vFo-2M
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 14:52:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3141c8a6f30so753838f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688655159; x=1691247159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCxpHr7ST1gyjjiHsf0Ym9vUzb7jDX0bdoH7ToQxooQ=;
        b=ctHBu4D4eWOvY1vhlhWWRi1JY9y199mXvS+xifBt00LHrzgTD5agOcRLMMEXCRn1ri
         N2gQhaYLkMP5NYD5tyKC60TuMfC77O0ToeTguO2Q1vNbmo9YLgVJ4VGnAO33k5794Tot
         /JhYkEfY7ESIk20EbEhNq90bya7pkuTSxajDj1tckPgIOXSHNaRPJ9smCEwsCjQbvGe1
         Pe8Qb/svXCWC5mGGpJCO5KYL+zznaZ1K4C997/fk9dEi0qfTFoX9RUG9C/6fWXkt0w4t
         GCwDagVMpnlUPo1VzU6/Jj5UTg71l9xxvfpj8058N52pU64sbLiKspyJRLQDvrbGTHRs
         +Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688655159; x=1691247159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCxpHr7ST1gyjjiHsf0Ym9vUzb7jDX0bdoH7ToQxooQ=;
        b=CIIfLDu8wUewB7fW+qy3ZV8IHN9VMaYxo92jM3CTuZYJ1jFQRNeUHGyAzFBk4dNCAP
         VqGU39ECCvdqSgah1ZcQix9e3acC0Xl3K9d4sTaxekJR9/Bu5rmGyv3NXp11kJ3lswLh
         02jRlj1/0SG8w34tGQv7bD1DJ5IK04Pdf/ynMnNpZYZ+/mPXpOLDGPZDKAMmUGm8RxKT
         ymTEERU0ACEJ5mRGRKKO199AZqZ2UuqMjbsESH8bmWvdfxEImJ9fULMmmrvAXhQchJd8
         i8SAcIsAUeoO8eE4Urseed3s2Rqo3cnyeIvTdW1xEt8SjyGf3MPZoO+HhEgj81jnj8q/
         1rUw==
X-Gm-Message-State: ABy/qLadydZkRV19Y2ilMhDr1lNQOXSIi3kl9WuRe4VyMvivXnEmd4iE
	zvm4wN/6SOGukn6NVfsWZLAQgw==
X-Google-Smtp-Source: APBJJlFvpVcWpUh3M0t+NPz1LvgTADtSmNoMTs3YLkhnDqxLZ6gA649UQtWL0x8NZIvvbrDzWu1hfA==
X-Received: by 2002:a5d:6649:0:b0:314:1443:7fbe with SMTP id f9-20020a5d6649000000b0031414437fbemr1696888wrw.36.1688655159364;
        Thu, 06 Jul 2023 07:52:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k15-20020a7bc40f000000b003fbaf9abf2fsm5371070wmi.23.2023.07.06.07.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 07:52:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jul 2023 16:52:34 +0200
Subject: [PATCH v3 3/3] dt-bindings: soc: amlogic: document System Control
 registers
MIME-Version: 1.0
Message-Id: <20230706-b4-amlogic-bindings-convert-take2-v3-3-f63de6f12dcc@linaro.org>
References: <20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org>
In-Reply-To: <20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5307;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=NbfTsYHnZmtHpY+kfS7TXdskEZKGyXWSvlrM9BNnNL8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkptUzceAn1e4iK/a42JUr3mAZCOG/FHs+rLZyyrrX
 9IO1UY6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKbVMwAKCRB33NvayMhJ0StSD/
 9udp9aUQ0hXE9YU/qEgdiuzbtMKbY+YMhqHdN0ZoOc4FqsGF1Ut1oguv4uuFNFHTC/VGckvDHJrQdM
 dLryp4rHX1ugq6mlBjPjsCuOg40Dgdr77uA5/iRDD+useqcRwBdpJcEgS/LhilRy4nXpZCxSP7nDRb
 7nBC+mZceU552xriesLQHmqR8dVUl8PYUxF1Zn1VOvuBJ+Rncos1fTAKPqE7xtuQv7DFhXPGF6lD6M
 rOFrYk64hCTAirh5rumcNgTyUzd+WqMVfdFCmW6fq79DI5hEdAN8667d2L+RjGM95gSm4nrf11tZ2n
 QM1NAa7UpbvLjvRJ8p7BGFnv+SwVHtiPEBBr3fprZYIpSqqWiax48g5qJ0Z9BPnLVhbNGi4z3suAAD
 UJnQymKhNIkmGghSbyQWIj2kYq/XAL+40ezR/4PVy4MQLHw5fWzZO6Q94VChMcUGxLoqXQT1l+0ybD
 3JJral19a0UWDK8e+9mfATq3BXtBuctOy1yFLvlooDX4Q7c+ixVcH7U3+jxAIVwlmbmwpk2460MRXc
 Np7d64UmCd1YyuYqePPmPrJr/xEBdbpQVnyxYQMegdim6JaPI0F6GFjta4zWaNXLtn8SIMxv5rjFaM
 K3ip0gNXZh4zAZ9xjFVs4HzGwc6DdlpsYKX/sI+z8A9W71u8aSuKk+EYOzVw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_075244_794246_EBE79EBB 
X-CRM114-Status: GOOD (  10.89  )
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

Document the System Control registers regions found on all Amlogic
SoC families and it's clock, power, pinctrl and phy subnodes.

The regions has various independent registers tied to other
hardware devices, thus the syscon compatible.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 160 +++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
new file mode 100644
index 000000000000..16977e4e4357
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson System Control registers
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gx-hhi-sysctrl
+          - amlogic,meson-gx-ao-sysctrl
+          - amlogic,meson-axg-hhi-sysctrl
+          - amlogic,meson-axg-ao-sysctrl
+      - const: simple-mfd
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    type: object
+
+  power-controller:
+    $ref: /schemas/power/amlogic,meson-ee-pwrc.yaml
+
+  pinctrl:
+    type: object
+
+  phy:
+    type: object
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gx-hhi-sysctrl
+            - amlogic,meson-axg-hhi-sysctrl
+    then:
+      properties:
+        clock-controller:
+          $ref: /schemas/clock/amlogic,gxbb-clkc.yaml#
+
+      required:
+        - power-controller
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gx-ao-sysctrl
+            - amlogic,meson-axg-ao-sysctrl
+    then:
+      properties:
+        clock-controller:
+          $ref: /schemas/clock/amlogic,gxbb-aoclkc.yaml#
+
+        power-controller: false
+        phy: false
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gx-hhi-sysctrl
+    then:
+      properties:
+        phy: false
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-axg-hhi-sysctrl
+    then:
+      properties:
+        phy:
+          oneOf:
+            - $ref: /schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml
+            - $ref: /schemas/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+
+required:
+  - compatible
+  - reg
+  - clock-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    bus@c883c000 {
+        compatible = "simple-bus";
+        reg = <0xc883c000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0xc883c000 0x2000>;
+
+        sysctrl: system-controller@0 {
+            compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
+            reg = <0 0x400>;
+
+            clock-controller {
+                compatible = "amlogic,gxbb-clkc";
+                #clock-cells = <1>;
+                clocks = <&xtal>;
+                clock-names = "xtal";
+            };
+
+            power-controller {
+                compatible = "amlogic,meson-gxbb-pwrc";
+                #power-domain-cells = <1>;
+                amlogic,ao-sysctrl = <&sysctrl_AO>;
+
+                resets = <&reset_viu>,
+                         <&reset_venc>,
+                         <&reset_vcbus>,
+                         <&reset_bt656>,
+                         <&reset_dvin>,
+                         <&reset_rdma>,
+                         <&reset_venci>,
+                         <&reset_vencp>,
+                         <&reset_vdac>,
+                         <&reset_vdi6>,
+                         <&reset_vencl>,
+                         <&reset_vid_lock>;
+                reset-names = "viu", "venc", "vcbus", "bt656", "dvin",
+                              "rdma", "venci", "vencp", "vdac", "vdi6",
+                              "vencl", "vid_lock";
+                clocks = <&clk_vpu>, <&clk_vapb>;
+                clock-names = "vpu", "vapb";
+            };
+        };
+    };
+
+    bus@c8100000 {
+        compatible = "simple-bus";
+        reg = <0xc8100000 0x100000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0xc8100000 0x100000>;
+
+        sysctrl_AO: system-controller@0 {
+            compatible = "amlogic,meson-gx-ao-sysctrl", "simple-mfd", "syscon";
+            reg = <0 0x100>;
+
+            clock-controller {
+                compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
+                #clock-cells = <1>;
+                #reset-cells = <1>;
+                clocks = <&xtal>, <&clk81>;
+                clock-names = "xtal", "mpeg-clk";
+            };
+        };
+    };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
