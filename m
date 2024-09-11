Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E072BEE57C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ml4XR/Bqe8gk80SpRN/ZU2T0H1O1gKqx4wX5bEEmfY=; b=p+ys3UBQb6UuUS
	Kt1yT0L3KEDVPdf1BCY8MASw/ZEKYgvrRpJhAhYFWzB//7woJQYHPaa9FaQW9NiF3NjIiPNy82Jeb
	ebIDtB2ReRrjJeu1O89l/lD7Xrylhc71n5LZd4XfU7urIGaz0lqUl2C3kg5GN+86xN+klo7WplFHk
	oyTWWYKO0owLeWt1F1Bq655wfN2JIJPHDChtxbPMCHuGdRbcWZBelwwCds1wWCTjv5C8SYoxRu1CW
	WUMtAtWQ/7KIT9MjetZTlAOTEj0UkWwg+Hgzrl9ESafO1sOUHN/6+E8orv/H4hrvTjAhvl7cp89OP
	MQkeMcjFeXBGhQXTAerg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPBo-0000000A8Rt-0PvY;
	Wed, 11 Sep 2024 15:23:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soP9H-0000000A759-346p
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 15:20:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cba8340beso6513105e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 08:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726068050; x=1726672850; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fpwVKYxub2BR6rBdSQr/mUsVWo46XLcAlWmWzYZ00ME=;
        b=QgYkK6Iyf0gj2UcGmVSnbjJy7AypXD2e+M+yQ8/EWynZVsVgTfL64gsslFCADuIiU/
         bfxOMqAZR8+RKrYAW1buer4LDe6p2h5ckdCrPU2aNL/wS4Y7jQGH7ncZ+ut71YI0kIkB
         yX8DGhXtU5FdAT4EWMJaxC7GeQkVu/Dyh5kftg1eXm5wlUs/iq8ljplfbNPnCx1/95Ed
         XuXvI52oNb/k/rqDzLC1MiCj3/ycdG6uC1PuYAnP71uuYngdP1rSfnashajGEtHxm6XU
         7M8WMlyPJXY884YDFj5cJFxaiMVLOWaAVEHhS33O8a933QLlVxR7TwlAI4bybD6HLDM2
         CXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726068050; x=1726672850;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpwVKYxub2BR6rBdSQr/mUsVWo46XLcAlWmWzYZ00ME=;
        b=oluFTCkPL6vD6emryUlfuDVhDIMPZghndMXMEH4wPem3DtoMxpAHPmRYTuCt8kS51p
         j7q/aMm8jW8vCGDs9WaJ0OsRMKPL8R3Dc7Dg33TCWrb9NjvGf+pzFtEvLoMkGz3a6Na5
         BmB3PXTt4A085OfYiD6a2E0JJli2W74RQjwYVIhVZd7/URFCId+u01fxAKajwk7R8rm2
         TehaJnlTBugmmk7w8wu5lK+co97BnErjq7ddu6BYlzOzDLDDdJ1xCHqEbh+GFTgGun52
         cjy+2diZ24M36WNasNgfFE24g3OSJfhbvYWT/e8DfVgSjGK1gZ0bJtzaioTEjUm3+b6T
         b9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUV9nlotvd+X7YpSg09ZCg8/Jptatlo56Tt17N9fT+Px53VpFCWADLpnHicnnvX4/y2g3lS8Gb2AIjAI6gq@lists.infradead.org
X-Gm-Message-State: AOJu0YzRg58YQGiKalcHcdkkQ/01cESoAgI7pvQdpf4xEjnReycKw903
	5MTdOFUsCzw+VHbEfisuvmbaM6f+Dnx7TEr8MO3mI+R3mVJxRhGsTBK44DPfrlw=
X-Google-Smtp-Source: AGHT+IGGHpq+zYMTZocGCaMvv+5XJ+vHhPUzGJxZgnG3MkplItlhUXqG56ppM3UlODyWrOknNfFn6A==
X-Received: by 2002:a05:600c:1ca7:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-42cbddb8169mr41928635e9.4.1726068049344;
        Wed, 11 Sep 2024 08:20:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb45c81sm146751395e9.28.2024.09.11.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:20:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 17:20:47 +0200
Subject: [PATCH] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to
 dtschema
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org>
X-B4-Tracking: v=1; b=H4sIAE614WYC/x2NywrCMBAAf6Xk7EISa338SvGQxzYumAfZWAql/
 270NAwMzC4YKyGLx7CLiisx5dRFnQbhXiYFBPLdhZZ6lHeloOVCDkx85/BjjWcNn8KtoolgKXl
 KgWGhDRlcTivWBhE5J4gbsKcM02Ku8jJOaO1N9E+p+M/7Zn4exxc2NRjlkwAAAA==
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5413;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vIrwLFn0Lj1NqOwB9QQ9/zFKyKXRywCPsQ36/qGl6Zo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4bVQ6s636OA1QDaFeqg/34xI/mWJKr6MuE3M7Zhi
 v87vz1qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuG1UAAKCRB33NvayMhJ0UAlD/
 wLOjPu8CVqo/B/qHbOv2nTEdvk/O9OJpRlcXMqjxlX2GXOHUCSUwNl63rFacIetDsizjCcQBzQut/B
 u7KheQKIuLlwDf1NP3x43crtnKg4OK/yfLZZWkcIBzWKU5NCszYo0BVPGLidw2fvac1TkcqdWiEZrg
 LN9urOmmo3l6cfrpoIjDLcdMocfWoDeita3l+YvCeGsLRnye7kYTxvoWpx58V+PukMLWlKtnRSrqVn
 z1TShFUGbFE9UGfJK+Qle3B9zVrcdAdQaCyIg3qzERfn9lDfo5XAnfil1H0rUmTUtseOx0e9E5Vt2Q
 FmBFOWlA/EvTuzvYwYk8X9i6mvjrX7DO6D3bdM+cQfsJ7kU3Y+fupdmLegcqw1bKwXZWNbLYqWix4I
 NdYogZY+vZFRVb/kruoCRVYRbXFGlFXolQBVoWcYPH229+GOZjZ4mXsrlVJeLhJVwmT5kMGbkv63Cw
 uFWL9IwGMkoE3OzVGxjgdI/Rls3YR7SluHXdsI/I7aCY6Km1mfwvpF0EpKXeQ8etXWAuQXX1V0FA9p
 Anq7FfQb7ZPEJ4SUKkuftTfMBGN5020hwyvI7xeKloLS5V6wxtfG85ClzKcLC5ubFoISLxCd22wWPo
 dbRzJpSNqVcsgwS/BwdOwYC2w6hIJ8n+inJOaYe3pxVosaadIdeocSrJXiEw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_082051_819025_69F2465A 
X-CRM114-Status: GOOD (  16.59  )
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

Convert the Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/mmc/amlogic,meson-mx-sdio.txt         |  54 -----------
 .../bindings/mmc/amlogic,meson-mx-sdio.yaml        | 101 +++++++++++++++++++++
 2 files changed, 101 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt
deleted file mode 100644
index 8765c605e6bc..000000000000
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-* Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
-
-The highspeed MMC host controller on Amlogic SoCs provides an interface
-for MMC, SD, SDIO and SDHC types of memory cards.
-
-Supported maximum speeds are the ones of the eMMC standard 4.41 as well
-as the speed of SD standard 2.0.
-
-The hardware provides an internal "mux" which allows up to three slots
-to be controlled. Only one slot can be accessed at a time.
-
-Required properties:
- - compatible : must be one of
-	- "amlogic,meson8-sdio"
-	- "amlogic,meson8b-sdio"
-	along with the generic "amlogic,meson-mx-sdio"
- - reg : mmc controller base registers
- - interrupts : mmc controller interrupt
- - #address-cells : must be 1
- - size-cells : must be 0
- - clocks : phandle to clock providers
- - clock-names : must contain "core" and "clkin"
-
-Required child nodes:
-A node for each slot provided by the MMC controller is required.
-NOTE: due to a driver limitation currently only one slot (= child node)
-      is supported!
-
-Required properties on each child node (= slot):
- - compatible : must be "mmc-slot" (see mmc.txt within this directory)
- - reg : the slot (or "port") ID
-
-Optional properties on each child node (= slot):
- - bus-width : must be 1 or 4 (8-bit bus is not supported)
- - for cd and all other additional generic mmc parameters
-   please refer to mmc.txt within this directory
-
-Examples:
-	mmc@c1108c20 {
-		compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
-		reg = <0xc1108c20 0x20>;
-		interrupts = <0 28 1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
-		clock-names = "core", "clkin";
-
-		slot@1 {
-			compatible = "mmc-slot";
-			reg = <1>;
-
-			bus-width = <4>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
new file mode 100644
index 000000000000..4d1142d2ff02
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/amlogic,meson-mx-sdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
+
+description:
+  The highspeed MMC host controller on Amlogic SoCs provides an interface
+  for MMC, SD, SDIO and SDHC types of memory cards.
+  Supported maximum speeds are the ones of the eMMC standard 4.41 as well
+  as the speed of SD standard 2.0.
+  The hardware provides an internal "mux" which allows up to three slots
+  to be controlled. Only one slot can be accessed at a time.
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson8-sdio
+          - amlogic,meson8b-sdio
+      - const: amlogic,meson-mx-sdio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: clkin
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+
+patternProperties:
+  "slot@[a-f0-9]+$":
+    $ref: mmc-controller.yaml#
+    description:
+      A node for each slot provided by the MMC controller
+    properties:
+      compatible:
+        const: mmc-slot
+
+      reg:
+        description:
+          the slot (or "port") ID
+        maxItems: 1
+
+      bus-width:
+        enum: [1, 4]
+
+    required:
+      - compatible
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mmc@c1108c20 {
+        compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
+        reg = <0xc1108c20 0x20>;
+        interrupts = <GIC_SPI 28 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clk_core>, <&clk_in>;
+        clock-names = "core", "clkin";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        slot@1 {
+            compatible = "mmc-slot";
+            reg = <1>;
+            bus-width = <4>;
+        };
+    };

---
base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-6fa70546ebb8

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
