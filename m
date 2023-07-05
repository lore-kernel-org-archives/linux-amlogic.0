Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0016EC001DF
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ew4ITUMhugenOYJ/8na/iMC16SA8xLvjRwRB0Ehc1+w=; b=IKw9Qjj56NDgJA
	S4KUJaC/5gnYNOtzhe5sZO9k4ATQQlNXFqY7zK43oLUfifDUH2G9V3e89A1VyrynRuvKuutpbr6/Z
	uf7Iw0GNecGcls+6IFkFk+03ImtlWfpufSmwATEsJQVyaP8GNMq6+eyn1nw+r+eTu+qHt3i4lA1Wr
	pNq+SnMXrKkAwo0h+rHPylJk7jsvAiViDBHRfLfh+E5HNsIQDjT9czZTyaKSQ2xN5Y+0KzW9RavaU
	b7jhdx42K6HB9YE7w0whFUmZQCmFCpQ0yHpgXPVZ4luCdgfWay0EkK8SVgVGnQKyP1dWwLFjKbse/
	84JNr/OO6GwbmLIm7Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0tj-00FkTo-0L;
	Wed, 05 Jul 2023 11:42:15 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0td-00FkNF-0Y
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jul 2023 11:42:12 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so10245331e87.2
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jul 2023 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688557321; x=1691149321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztBlDQIHDZqo7V/c8oOFDJdI7xBDmCnELF9YeTbIz60=;
        b=Q8tXp0mhYJzKf5i1KzTXxvIFYOyLggu5Fu4qg2b33Mimz5fUhOkQ7l6dvMoMDLrn4x
         mEfiOAI5Hnt0u2KQ2TJFFII2NLMDZp4Ph3qUq6ixyhZ4d17WAwOniuHAEF16AbG9eF7z
         WkMXWhI68Lt87wd5/MYHFN7S4oltrqjUeKGQvBsfTXdFMh2hMYktd5xqpmYiQTdAvpnn
         K0R5a8UVR39qGemYegwzZitbIDMAl+75kn6CKzZlUMzL5n5sbhTRHcex2/E661vaIP3i
         UlfcC9++L16sPmU6PTCYIHau8VHj5FarUEu2CcaiScbOgYbBsKFEIUqF0uaSP3qcglYr
         1+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688557321; x=1691149321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztBlDQIHDZqo7V/c8oOFDJdI7xBDmCnELF9YeTbIz60=;
        b=NuLapK0fRVOC3HXUiGbihwI1So69Cw+CfWCJCDjvFAz68iwq/xzfhW01RZ6EpwqJlU
         xvQcj8xpbl3b643VNszicdbvTtpHDgTE86Buvo+4va0cDJW1j3Z/J91kJLlK3Aqb5P/N
         FLaQ82/j28XB8T2wOA3HLzKB2RB0IGfL+pLwYggoTBmLYUwafrHG6fCcTq5cOzUxnmb9
         2THAQsNOe9hPIGGctk0IGC13RchlPmxlYtFlu1C5CrNC5wid3RPpVtOKqii10XrxR82g
         CqHS9TNGuHnz4jxsGXe7+aDVxaY0GRHeCpvBKauLukr34uV+DJcqv0gbRi7JRoBRdEob
         beyg==
X-Gm-Message-State: ABy/qLYLtxgsj1wrN1SIsWk8/GkS9QLI7UTvkMknX+auP3qv4Ck2vXTP
	z68vdQEudsR9AhfFFpUHQIKZTQ==
X-Google-Smtp-Source: APBJJlFfHWocgLHVuVZbV3+nPaMumekJ4wwZv2jTSVYFQ2xEyMcAxxdjissZ09VM/5ZLW2XbfWQlbg==
X-Received: by 2002:ac2:4f14:0:b0:4f8:442c:de25 with SMTP id k20-20020ac24f14000000b004f8442cde25mr13134816lfr.5.1688557321290;
        Wed, 05 Jul 2023 04:42:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c028800b003fb416d732csm1916808wmk.6.2023.07.05.04.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 04:42:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jul 2023 13:41:53 +0200
Subject: [PATCH v2 3/3] dt-bindings: soc: amlogic: document System Control
 registers
MIME-Version: 1.0
Message-Id: <20230705-b4-amlogic-bindings-convert-take2-v2-3-22be915ddc3b@linaro.org>
References: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
In-Reply-To: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5263;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lo56oO+Etmog3EY8Ab68Gwiv0DuAkQD0UTqVY8iJak8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkpVcEzTgg38yYhlrcvBrJImMVYRN+3f/3J0kcgWuW
 ZPWGsaSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKVXBAAKCRB33NvayMhJ0btUD/
 oDjPeA6DC4ldn8SQo55OJ4RbzqijHA8iJBqsNsf5BF/6fExPobnO3MpbGmbMnhygBi7vQkMqT+ORZ4
 9FNXdys90CyDsjHIOSpqciM7zmQCgt3TnStENGygchJZQpanFGQBIL2SVVcCxC5ebbccP7P11vq5NK
 6WC9jxQY7b579pwBUAdObAML7Y6dP0aC3yhlYmdTcEs6mkacmK4iZuGgXfm/IC62pztQSS6upoC/rn
 CJP+xqlF7pfIX4g/FbUuiKHgKmZLGwFq/bUCCMbJLJ3/e6xQXzg9tHk+i+1RKTSfHqonIgZjnPreYV
 +GJzrmBvQek8LE/gcQT3amCl/zgUMCBrvMyb68pfiSEsyeDhT/Sgr8psL5aOxLZ7EkzDVA60iyAt+n
 IMW4W2tnyqpWEZ2PItTRV9U/Hs2Q6tWSv/jg5LC+y4jIR0AhHE57ItVcI3zuK7FdEnfTnLhaC8AH/d
 Ou95md7fxstFAkksCXlXfJ2/jY9lMGchie+ZFZT/voRrQXEI4XUom9vbGDPlwWiLtdGWRcUeKPJUuv
 NWNk70fqkeZ8ekbziosrAn8PeRNRwVXlJ/ylbOEWXdh8KU9O53+8H/vVPWJT1PhoF24EaAoQWAd5Bx
 cwtktKCJBJCnHHZKkcBcfwqjYdvnwZRZ3oeLlOBh5si/5ULMxDbQflgIq0iA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_044209_239601_3083698A 
X-CRM114-Status: GOOD (  10.86  )
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
