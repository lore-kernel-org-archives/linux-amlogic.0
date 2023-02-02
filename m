Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A780C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bL/3gyMr87x43Ffn62OpkWFVKn9hOgJKmYYeVXtx48k=; b=SR9GfLcIbkbLCw
	j9iFbzv1h6UckRHHGH1lVSadKxL/RJuVSJ/M2YwaRSGDQKQRa5RbVZJ+XvTsB9aikzOutf94xVnlA
	Ls4abrAK57cSa8IBQBFY4LMRHd3FyUWh8ykpdEGGeaKY+zH7oySrl0+e//CCD/FwMg9oQ0hTKrPNu
	XhUUvrNZk9y8hN0LARCZ96wSj+Jt8//30AU3Kdrf8qqmmMHdPWFyW40wvB18Ok0dtdsiNamKcZkNL
	dBNbdaoVSV2j1ZHNsXzSMGWiISbWTddN6J8KgiTsm26eIiLUYj/lQzD//sEMv0Xz4GQKHmU+z7taQ
	6Mfp1sOa+2SdQqWD4cEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeT2-00GyBq-5Y; Thu, 02 Feb 2023 18:37:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSy-00Gy7P-Nm
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 18:37:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q10so2564377wrm.4
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 10:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qzWJ+PJWjjXt1zQX9IH2K8XJiUf6DeC3wzgQPgc4GE=;
        b=FOpoHF3f8QzmBlP4tl0/Yl5Eb99/+m1gDJTugenbzY8kup1MBbDbxZmTLbURQXOMeS
         Gx4qKZJIhYyjaGRlQk3ceTo2nSf+ALBZD0JZy8Ced9QTim/z7DSctzKjORaTmeMaq8He
         iWP7XRNFWI8I7n2V5jc/AGauFGnQy2rTKzaU+f/ZoPNbm+Gy0PfB+qR5S8kKRWxDaEra
         Bv8IR6aN5kFwjGQao/5nSDDu5YrHO1i7bxcRs2FGdsGt3MQpxPYhrRTxsry8t/gpw3LN
         pfJFNywFnH6ieUuSToVTsMyeT3QXaa58Nj7pi45zDbH07DifystOpcm7wOfCfE6NUx2o
         WKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qzWJ+PJWjjXt1zQX9IH2K8XJiUf6DeC3wzgQPgc4GE=;
        b=r0PDvQt5Q+rVbQd4XzTlQXLiCQkxgqa0QmNAXvPaA+ajY3jpQ7/l2NU6/bPT0jn81/
         n30JirWV+Unifo1bqGT47wCIGGqrjfQ2+4GCLGMNDCH/diS2uwmuubQRBjdrtGwQtsRn
         8lAr4CwEGwVbfLch7fyEn5WwMICjbzUIxn2ZJ1Wf1kA7CLTAvxA7EZqzsMS9JH7LMUWT
         EHlyBVRHRY8y3MgE1gQWL2sqPV69DBD7wEBQR3uituj9dajsZ35SkF+KxNVcDSths1FW
         lQbXGVAUBjNRq1mx4yB4L0e/tIiKFrqwqudH4sQJu5jIEAtUxNpU9PSRKI1vJkWrb/Vp
         eUsA==
X-Gm-Message-State: AO0yUKXAjsqF46VBqy9RpuimbCsAO8r3IXS+xZeiO+tk/qnN0Ln09dWb
	1f+ONLa4jWfrWKYUR4KMxv++IQ==
X-Google-Smtp-Source: AK7set8onuVp4cHeXmcTC8LpsEEAQcnGWYTri6tZ8J2QzpQkkVkE/HiDhb+ly+kJ1rLPravbxzeOUQ==
X-Received: by 2002:a05:6000:15cd:b0:2bf:d8ed:ba46 with SMTP id y13-20020a05600015cd00b002bfd8edba46mr8007620wry.47.1675363065020;
        Thu, 02 Feb 2023 10:37:45 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:37:44 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] ASoC: dt-bindings: meson: convert axg fifo to schema
Date: Thu,  2 Feb 2023 19:36:50 +0100
Message-Id: <20230202183653.486216-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_103748_797256_EBDA1755 
X-CRM114-Status: GOOD (  17.95  )
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

Convert the DT binding documentation for the Amlogic axg audio FIFOs to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-fifo.txt       |  34 -----
 .../bindings/sound/amlogic,axg-fifo.yaml      | 116 ++++++++++++++++++
 2 files changed, 116 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
deleted file mode 100644
index fa4545ed81ca..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-* Amlogic Audio FIFO controllers
-
-Required properties:
-- compatible: 'amlogic,axg-toddr' or
-	      'amlogic,axg-toddr' or
-	      'amlogic,g12a-frddr' or
-	      'amlogic,g12a-toddr' or
-	      'amlogic,sm1-frddr' or
-	      'amlogic,sm1-toddr'
-- reg: physical base address of the controller and length of memory
-       mapped region.
-- interrupts: interrupt specifier for the fifo.
-- clocks: phandle to the fifo peripheral clock provided by the audio
-	  clock controller.
-- resets: list of reset phandle, one for each entry reset-names.
-- reset-names: should contain the following:
-  * "arb" : memory ARB line (required)
-  * "rst" : dedicated device reset line (optional)
-- #sound-dai-cells: must be 0.
-- amlogic,fifo-depth: The size of the controller's fifo in bytes. This
-  		      is useful for determining certain configuration such
-		      as the flush threshold of the fifo
-
-Example of FRDDR A on the A113 SoC:
-
-frddr_a: audio-controller@1c0 {
-	compatible = "amlogic,axg-frddr";
-	reg = <0x0 0x1c0 0x0 0x1c>;
-	#sound-dai-cells = <0>;
-	interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
-	resets = <&arb AXG_ARB_FRDDR_A>;
-	fifo-depth = <512>;
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
new file mode 100644
index 000000000000..f6222ad08880
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-fifo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic AXG Audio FIFO controllers
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,axg-toddr
+              - amlogic,axg-frddr
+      - items:
+          - enum:
+              - amlogic,g12a-toddr
+              - amlogic,sm1-toddr
+          - const:
+              amlogic,axg-toddr
+      - items:
+          - enum:
+              - amlogic,g12a-frddr
+              - amlogic,sm1-frddr
+          - const:
+              amlogic,axg-frddr
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: Peripheral clock
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Memory ARB line
+      - description: Dedicated device reset line
+
+  reset-names: true
+
+  amlogic,fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Size of the controller's fifo in bytes
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - clocks
+  - interrupts
+  - resets
+  - amlogic,fifo-depth
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,g12a-toddr
+          - amlogic,sm1-toddr
+          - amlogic,g12a-frddr
+          - amlogic,sm1-frddr
+then:
+  properties:
+    resets:
+      minItems: 2
+    reset-names:
+      items:
+        - const: arb
+        - const: rst
+  required:
+    - reset-names
+else:
+  properties:
+    resets:
+      maxItems: 1
+    reset-names:
+      const: arb
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    frddr_a: audio-controller@1c0 {
+        compatible = "amlogic,g12a-frddr", "amlogic,axg-frddr";
+        reg = <0x1c0 0x1c>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
+        interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
+        resets = <&arb>, <&clkc_audio AUD_RESET_FRDDR_A>;
+        reset-names = "arb", "rst";
+        amlogic,fifo-depth = <512>;
+    };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
