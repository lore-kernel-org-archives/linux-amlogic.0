Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84207CF58F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3doBiSsIhPQksr8eer1cxGHI0D20rtK4PzWW4O7K/8=; b=MJLNslrAUDC5Hd
	AQQlab/1T/+WrVxXTRA4rtOBcFXP6qdPtDx8suHmDCDrj5NJPzgCKv0Maff+AojZkt/zOYLTwqN1c
	Z+NP79ld5s5trHoaPZD0CztT3q55fwbSrxapKJ0Al5ef4wJoJyQMOlVjBaoGelh8A6bjOjsslU9H0
	mCrGelbXurLkWyXosAVvaGFjlTFlDZvvtDmhFr3IQUQjnKXsQZqV6JPADWNSBGpFvq0hcIZWjzUuB
	mhFx1inukJPbq+fa6r47fraMJ2tRvEow6qHqMvZ79ggkfkwtBG01rr24wXwcUjJSVHOaQSAxSNBkl
	3aUXob9Sm5DZy6rhC0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZOa-0000000Bq1Y-0OjB;
	Fri, 20 Sep 2024 08:53:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZ9Z-0000000BnMe-0EG5
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Sep 2024 08:38:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso21336705e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Sep 2024 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726821491; x=1727426291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M26p8HJUGVrSTve7LtSl4MnedM6VlYwh3DdAdGmuv7c=;
        b=XrS++gbdB/WuFmN1q1ckOsIGB1nIERtNKYctk1KFyh73pgdk1c3fmV7ZvPh2AvUbzc
         H/yDxj2GcVIjN6a4VMAjpZ75d5IlioibdaTqiWtNq4qgoBo05JqZiB4sGgdXxikiaRZl
         H/vrJhaCLHFBmfkXocjf5R7WUfrpCDr8Y9VG6xRlqUsDvfmSd6SR0LHsEdZEDjiJ7a5k
         Zun0RBWzBDEYtxqgXc9ouJEcNIQtwQK2yGk/nis3SmukqdBb5ZERI35pHEtXJir7YTG1
         gTywHuDOP4xPonacBquFnofUIM/tNPqt35OooGAXM8ky7guILrXpP+/U305Lfn4QGioF
         O70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726821491; x=1727426291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M26p8HJUGVrSTve7LtSl4MnedM6VlYwh3DdAdGmuv7c=;
        b=fiAzWz+Q3ZpAUWwlDobaOR7zpK1ayz8bXbRrb0cWleKM2cAUClDVkI4Lo6C4G8oHz6
         lQMK0J9sgAwG6JwVJuKiK3cidLgsNqMtPZNs0jSSvoIM+3bU5LIctXE6yEf9Vc8359CK
         9HtWft93fUZEUvgBBf/cx0bh681bBSAuWrlYu3AAor1TXSszWm1ZvlVaeBDvBwOE7I5E
         yIbkvck743jwr4GysI1V3iqDTNWf36etYd4mitMYiEeieV7+q711RBl7oCrZYSiROHf3
         kSaIZNhGS66n7DfDqrhmAYxKkmpLZgPg+EsPiAWFyuIV9MYLhMg+qArKZ2VWoE8sBDla
         E66Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpBn178NZESgDR1aKn4/pEIlREidnZTD0Lp8qyXkyQHEntPO8/TrYDcgSC7jRK5O1/eEQvTsrTHtphzWO/@lists.infradead.org
X-Gm-Message-State: AOJu0YzaZez7/kqbNN8GU4yHoFDc4qLlSaBybQ6GqIusBFfBjJQKVpjn
	QNElDsZj4aMrRX21oF5XbXTVlTKzy+/hPeXgyArnA85QtXBZmRQpeu6ScgSyuNLpI3nkhdLv1Zq
	j
X-Google-Smtp-Source: AGHT+IGu0mJn0TEAtjrxCTFxsE8k5t1vGcbdWZEZvHC/A/1yKOwaWCwpTcH4rvcoPgrQPnL4UVJgQw==
X-Received: by 2002:a05:600c:314c:b0:42c:bb58:a077 with SMTP id 5b1f17b1804b1-42e7ac30863mr19117735e9.14.1726821491058;
        Fri, 20 Sep 2024 01:38:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e2c1sm43099165e9.2.2024.09.20.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:38:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Sep 2024 10:38:05 +0200
Subject: [PATCH v2 3/3] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt
 to dtschema
MIME-Version: 1.0
Message-Id: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-3-5aa8bdfe01af@linaro.org>
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
In-Reply-To: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5098;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7CJFNsK+RYsiPatWJUwXv7bSU3rHGoSDbNBW/V45qdo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm7TRuyUKbSWggrLcYL3U67aC98p+hgvoXseunmRTZ
 QSonzOGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZu00bgAKCRB33NvayMhJ0SxZEA
 DD/tHmAUJB6hYWVHojaA5NrWqA/Nhi/mZY7G4EnGnwGWzTLVeD3recvdof38Itt1vty9fYc9qrP3na
 gsszZfV0hOSwZcvJA5SERhRfc4yljd7GjhRuSRBh2C0wzumWXqJm7xcZLxkR+4f/jXGcPaem46tfc0
 CSNZ9meAoaRHWFSzCTnQx3F2NPI1SXnyfLkRNJHZMtli0FNwoXbtd4sfW/IUG47YrfjaWvUcG1+yws
 IqE+8jNZx72J1mCfktuUNB3jC3e9mf2tMAvvGt3AFH5DogngSiZSN6oL3Lh+GNNYmmjENyvota1ryH
 kOZlHb2J+deIdbL3YbmTmMKpnzVw+FmT1wt81kB1avqCMxEFs1XtpSc+wDyEi5vTrrXSD/GXnMtaFt
 9Vc1aFOcxRfQCQl70a98MiR3j/rkFW2+4teKte7lEQ7339p0N4Gz1WkVNiVmK6elb2RqwJ7cfd/tIO
 mnzJ72REGtGtAhgOSZvUc3pJAIKerQ1U+bFABnqUtu1geaTzNw8zTXg0E+l2PGGRRip1plVIQrrdJt
 I7QIT2ikwZwuqGYOC3Gu4rVcdmugVx28ghj+5VjM8Cs6EnIfglsavmD3vZdal4C4bem+M6VTpU7+I2
 HAo+g5zS5Be191z30RM9QCH/mjcBEvG7BptWhtHO3tJnCumJY1VQuSMNZtjg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_013813_130938_107E8C4F 
X-CRM114-Status: GOOD (  17.55  )
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
 .../bindings/mmc/amlogic,meson-mx-sdio.txt         | 54 ------------
 .../bindings/mmc/amlogic,meson-mx-sdio.yaml        | 96 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 54 deletions(-)

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
index 000000000000..3b665396169d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/amlogic,meson-mx-sdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
+
+description: |
+  The highspeed MMC host controller on Amlogic SoCs provides an interface
+  for MMC, SD, SDIO and SDHC types of memory cards.
+
+  Supported maximum speeds are the ones of the eMMC standard 4.41 as well
+  as the speed of SD standard 2.0.
+
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
+patternProperties:
+  "slot@[0-2]+$":
+    $ref: mmc-slot.yaml#
+    description:
+      A node for each slot provided by the MMC controller
+
+    properties:
+      reg:
+        description:
+          the slot (or "port") ID
+        enum: [0, 1, 2]
+
+      bus-width:
+        enum: [1, 4]
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

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
