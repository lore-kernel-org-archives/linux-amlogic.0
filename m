Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C00BD69115
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Nov 2024 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sj5BxjbhXHinYNIXyEPv0RwtuMcyCuN3//X/fWPr88k=; b=qqVshL6XuKObw3
	WQbviriL0Ai50ZfAlorXwpwwPVpUK+9w/uO4W82m8JgO2lYoxhPKLc0P8Ep1S6IdPjMgmFzGXpm56
	3lBHxeeRtXFae/mqUjZ4WVvlFFwaU7HB0Y9cbE5pyT86SbN15NQG5dD8JkBUvUbpbZUiF9FJpJG/j
	wSejySGk1gEsQFWPFQYfi5Sdy2OWmJRhtn3rtSGiKiXRNDwxWsQvg2prYlux41zK+KR+S0nh6ekOb
	yeqjq5qqvxC/TFQDxfGlw/DuGJArN0Wh4NRvrxUOc4iZIGvwxZeGjKjk1VF103cDpJduG0TiIz4cJ
	MHb4V4y+6Q/nU6LGJDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgMF-0000000FsLk-1DMq;
	Thu, 28 Nov 2024 15:23:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgGD-0000000Fr6v-2kX3
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Nov 2024 15:16:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434a10588f3so5926355e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Nov 2024 07:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807012; x=1733411812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzpFYlwmRDjUdywRFCwk3EMOwG1W4Bvy7VRMs6AVjzU=;
        b=sd9c1B/Eucb5xLKs1LnltS+cFqWnPdbZ+xNsS+K14ql8uQCMjV/WjJL+kCiIXxViAH
         T3JGeqfTsJD2BqoVfaECSWyFEG2oDc+0Aq2kF0w/y+v6clO/II6BPhjXxoR0S4SK28Jc
         OHGaycYOgdOwz+WoWakNnWS/NUU/wFXCiipZh+qpv4AcqhsXpfyRIeN4s8eEu94qXGjI
         148Mt2M20slgdT6QYKyhoqwRdx68UZrjtuWGw2hiKsiiCwLsqAD9bYPV/6XDGCk4U8eF
         W3xkFhgVhUCtJq78rjDu2t9DBZJFKqEZm4IjeWhfYLtVUZ242ZsdxsTJLMM3XAVqFxQl
         oRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807012; x=1733411812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzpFYlwmRDjUdywRFCwk3EMOwG1W4Bvy7VRMs6AVjzU=;
        b=QwntrVehIEjtlQ2nUqSiQXPHDviPe0OY/fsvYpG5rZIdNAk5vpujuCya4zCz9b5R7q
         74B0hKqCrDolEj+gR4AHI+1csjG02d0NKkuZyRYL8AvzjsyJLicvKocYV7SFRqOwQ8+Y
         B9GpV70VPOnnSytjkxEz72FejBSirs6fiLrvtOZBpIJjTnni5WEwa13fpgTzxpS1yH95
         UZ1/Trbi7qSfmg6DeHPgERQrXTFZjgoB93r0ADzfbpHxUU+4WIh0JiGumEyDiK99+yIC
         UHbFJQQ10zeDbIaXZXdomapx+ywfUr41QOeXMuMY531zYIuhz2FECGEfH3HnEJZHTOeK
         q9Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUDHoG0vRwGBxkTkpbG6zdhau6DBjzK9+iYnj5B0umllZB18Moq6GyHygJpVc2soBujivvYYV5ENmVsT9lr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp/D5xMfgm7rCUbojtBuPocsnzufjYiUN72Dzp9e4lieuXTtg2
	ufvnoyAgjFwiXEfWJDJtX+HWquM9OUetQCQ05iSrThxvLh1GgD4hP+rPmYS7w94=
X-Gm-Gg: ASbGnctSKM3gwKlqGoWp4KbSOuIzpDZViR2PzhbcuxFP0S8QIc2jRjDnNOnjuv5kVCA
	mCOzlS1sFA6XY1vXrtMU6emG3cMx/+n3M2yeUjXRu7Dysz+QJ1jSSMGWDvDQPxe7QI9sBj3FK3Q
	czYjApSWeEtUSU78/82DPY8q/SuAI3AOFER7LqANFrebz9iCf/lpZ7LyHyCasqQL75EwYe4G7TN
	PUecnd0/jkSI7ZQoRUhYiB/qIhhvuClBrxO22wZvr++qCtHOfEv4ajHnm+2oz1g6vnI8E0=
X-Google-Smtp-Source: AGHT+IH4AIKDNQTGuzrRL5OCcaR5+oCwqwuiQGkqb+Yio/Cxxa2N2THu7Mb64eFoUBklqJHWFxGrjw==
X-Received: by 2002:a05:6000:1846:b0:382:4d6e:9f3f with SMTP id ffacd0b85a97d-385c6ec0b9dmr6474374f8f.34.1732807011807;
        Thu, 28 Nov 2024 07:16:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4fe1sm55867025e9.38.2024.11.28.07.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:16:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 16:16:45 +0100
Subject: [PATCH v4 5/5] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt
 to dtschema
MIME-Version: 1.0
Message-Id: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-5-11d9f9200a59@linaro.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5272;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EyHdKYQSzhp6Q5IckerUZg/bcUhVWP1QC3wdvMtdE4Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSIldLzAfDGWjxNDmzJ2/2WMIp1sGGnOvNvp6JCAp
 myNjCKKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0iJXQAKCRB33NvayMhJ0azxEA
 C0McuYqWQAYwfk2xajPs3bcX+BmlzuLuas2bMzBD/me9jZu2mkdUG1VEwoolEX0gCO6JlqxaxQJ4WM
 wL5TOWyl98rq7QvpGteUK8etgNs2ID4qhKX5hsWLrDH4oFKHIg776KlZ16WwFxrM9zotbWNMva+AMr
 PN2wCcOX42276Z2sU+fwg0/lzdd9L6FPWHRy5eEpK0aQHmiDQj+xWmpVF02Rpy5PZfZLrrFk0JKfYn
 kMwv8pGldajb1UUUNMVjgVjW3nCPo6TR2mKVgq07cyTxpi/BpzMzsx7mKZyQRV1wIhs/0vaSqGGoR8
 PtPicnej6Zrj/gBQ0Rx41nTgYe1ymgeHaeu7hTpaGuswR1U4Yst4g4st1a9VRP+Z3+aHaE9G68NBGW
 EFEGhsTm7hiRiOpOm/e4mIwZNv8BHi2KP+D8nWhyGQaMZQNCOoFsYII+g1gTq+O57co/vJIJGoPCS7
 HiFh3roegB3Z1kHpgZfMy+n26Nq6UgphQZK9vM8DIcEtNg+hpAvS+D2SArm9nd7UVMq3GLHcRwABCo
 znU/pLdQSIlPfCbgFBobDgij0o20asawXWTryI8DjRMq5MWYv1IFkyqg1upLB3lmE/KKIGgVc+oyRs
 rKG7qfGo4UICqZfJVFM5ejB7HSDuzO9FBcPhkyYtfPmmG3r90+p5BpLOl+yw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071653_699366_8BC1393D 
X-CRM114-Status: GOOD (  16.23  )
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

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/mmc/amlogic,meson-mx-sdio.txt         | 54 -------------
 .../bindings/mmc/amlogic,meson-mx-sdio.yaml        | 94 ++++++++++++++++++++++
 2 files changed, 94 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt
deleted file mode 100644
index 8765c605e6bc761db2923ad748b5bb70d40ea830..0000000000000000000000000000000000000000
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
index 0000000000000000000000000000000000000000..022682a977c6d347c36279f958dcd6f53d385b71
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
