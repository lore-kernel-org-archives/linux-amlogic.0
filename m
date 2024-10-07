Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EABCFB43F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 14:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0XDKvzz5RWcN5V9wRKT07IFo4/KkMpbFyYMahn3sNo=; b=G/m17LA02Gxl+Y
	dLxZZfo5lXVzXQqP+8r9ORJ/y7994GRsA6ysN8ad/Dg5SSSUYUQiB0M82G8gNaar/mXi59A3OpuAe
	JVPXVbdt4mBTAQf6MUWLhh4scJnHkTiespWWhogLZy9kJ9eA51IU2Uoc+2CsCOidM+G8UVLnUksCq
	QNLdTbRB6CARhI3SYWD/Jzrx64OPGLnFQVUEudNwdQ6k2lpJ8VesqZXCYYpugidPlxwsuTKfimM8Z
	pB99NRDuavppa07pOZqwN29ZMgEoG2lohQluHEtBrMKhwlE8JY5huR54oqRdK4bYgPJ7mEwGmSi9a
	kmujrGLcv5JQTUaGtM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoNZ-00000002cx3-3ang;
	Mon, 07 Oct 2024 14:06:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoKv-00000002cA8-1dJH
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 14:03:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37ccfada422so2733114f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728309824; x=1728914624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqABym3N3rBidA9dDKKWzjU42l0qaxCQ6CjnRAVLGoM=;
        b=iegh54yk5oQjJL6JYIrsMxgQv1XXoBW49EV6OeqUxZFPDXcn93yGpO7Pb1wsuioNe2
         h8DQovEt/5c9bvcJuChahWr5Bd7v0EIR6mdDeerFVuvqKDSdzSj23LgVhu5DaPN97NQw
         yxPec4lEyvtsrl2KuN2fAqkjuyRi7zekDeUpKw3+mVEvO14QXtXSaLO1IqLkUYevW2Vg
         F+kePbtoCn3AVdnWjHB4r2aPJS2pYZJCBOe4EzIbIhPOZQx0boL0Y65+KHLQRebt+P2H
         QMfKHgoPHvHI3YHBAZb8i70dsqUiiPCzP5kql6BoYaTOFJfRXMxWBZ/wmfT6Zqcov2oq
         qKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309824; x=1728914624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqABym3N3rBidA9dDKKWzjU42l0qaxCQ6CjnRAVLGoM=;
        b=enYiX5aTKwnZO0eYqXO7O/sK4V980FHs6s6xqmZml9Ws2QeG6kCTpaW25V+4Kuj2Si
         n/StfzgzdAY6MfSs0H/8eGW22GdR4aozLUUNRLLRPE3Rm4kcrxI2J0wfSpyi+xVbogor
         g8TejyS/xPhNU1UmeR47YofmK3UxIV+rYvQfSQM08s3UVoLVkKFgxGj24aYymCQ9HOBx
         cO4y7QiSBxMm3amQpZif9ZKK1ixoM1GdnTgk8KuSH1HaadRwyxK0u5ncPren81c0Bjqo
         0hFZDKH4cDXFC+/EhPu1fZTlXCdoPUDKeZYGLDF1FyO9tP8zpjK9dD4o5zfkKnCxiLLl
         RsEw==
X-Forwarded-Encrypted: i=1; AJvYcCWAwhO0SOMlI1ov7K29b7frKm2T7dBDbhhQdH4kLEd6L1Vj7UNvtIu/+yvFPIHAUb7dCSClic3KeWgGjor1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2lEftTbCGMmyjRWD+ehvX9c9cagzoj+Ycy3J31UaKtZFLAxAe
	qTYyakicTb34KpareTQYcMHMUvvhT9cMnY1N+POsPia3wQSbNTSGMmErGvIKh1k=
X-Google-Smtp-Source: AGHT+IHUHRpULUeBxcXkwvM8LR1jSSl1bp1pOZe6scJTPsgFDYLeY9NgkvfL5Vg1zahAH8zAEK+EWA==
X-Received: by 2002:adf:db4b:0:b0:37c:d2ac:dd80 with SMTP id ffacd0b85a97d-37d0e8de804mr6955020f8f.42.1728309823813;
        Mon, 07 Oct 2024 07:03:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1688a486sm5857022f8f.0.2024.10.07.07.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:03:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Oct 2024 16:03:39 +0200
Subject: [PATCH v3 3/3] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt
 to dtschema
MIME-Version: 1.0
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-3-ad4eb22c2a8d@linaro.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5039;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=U5jvjVp+9NqhoxfdPMoJpOF+GmAk4YFvDw1QIqVWpzs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+o7jyWQFwcKbX6jGGlK1eSg5/uay9urgG7y+OT8
 lBaH9uSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPqOwAKCRB33NvayMhJ0bjlD/
 46mUauTgNR2B0KXc9D1+fJyrddo/ACZ3/QgOLjNFzowcRWudYA6fL7KdelC57/sTqaQ0BfUQolEowy
 xrhlz4D70YkWdzVc8dkem1vasMWNWvjoXqVbByhaQfufAh7aHOWhD713prKa87kKmU8sU4xK5qgDzf
 TU3oQMzDsEigKCc0B7h7jBT/sDbt8twunEmzps485mTlmW8VIozhAo/CxMGTkF0/3imOkv2ThRyEe3
 5v4aNUtiuh/vZSO72YawsWLPwqoly4IUBmY2laISJgRNIRyYJYUmVp34vcGgiUrnDNlMA1kadYfJ2m
 JvM68ERipXiY7FxkklCQUNrBUEYSgcaCif0knSN09bFID7Itq3mHMFib0c3chTF4jhtBXyBjLHrUZK
 N0Y6ThZaNDd17WI4L2yuNM39VmBaQ5Th9YWXqcu1s7wdoTPGgka73eSNOw/D7ARw+sFQbTfZuI5feY
 rNo5fB042sCg0BhTMKb+ZzjyZpnk2fGP0psUEwm6bOHMVeTDjZeld+mS1lHsF0uA8VC+A0HhtsGnRm
 3dSsC5CzX1MesSjZNUzKDh77TP9p2XEyt6ChTi0pSY5NM8SNb/rlK+ks12f0bLtze8H2Ob+Rl4WNGN
 wEgJXr+A3A8856KGaB4++nG96r6Lu0sG9U+twLHda23cNWtslVEQTsHbqx2A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_070345_605819_3B8FCE57 
X-CRM114-Status: GOOD (  16.87  )
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
 .../bindings/mmc/amlogic,meson-mx-sdio.txt         | 54 -------------
 .../bindings/mmc/amlogic,meson-mx-sdio.yaml        | 94 ++++++++++++++++++++++
 2 files changed, 94 insertions(+), 54 deletions(-)

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
index 000000000000..022682a977c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
@@ -0,0 +1,94 @@
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
+  "slot@[0-2]$":
+    $ref: mmc-slot.yaml#
+    description:
+      A node for each slot provided by the MMC controller
+
+    properties:
+      reg:
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
