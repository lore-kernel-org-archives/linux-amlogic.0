Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FEBC636D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mobUVLb8SboudNCZILq+Na1mx9+fqpx7Ss3xyLOZEA=; b=gF0VL99Tb1yPCX
	NKl3hd3e2z27ztjjRNmlpmFi/JZe4njvQd81c2sO+vxT60wNa8pzeqmYFE9p4EwFlAAenxlHJEXUW
	4fzI0nt1vPNTCBcAxMy9iMUVUgIsZQUvfd9bhTXAuvaN+hYrQpGQLqvZvTUFFpz3TzapK0Reki8ie
	NNwkwkxpHukTnzE6bo76W/2aVJKKJE7jbkjuTY15ZloBl+W4Z24RDQ4fQpyb3N+fNo0xgqUdUeYDL
	6vaM4VejOsadiBOnDX0Hko3OqReEks8+mCmpvMcz5w1ARbzJ9cqY4KvwwQ0XfHmZGeWXj4C2kmVHL
	HMKI3032i/CUn0jip1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP41y-009C73-Ln; Mon, 06 Feb 2023 16:07:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3WI-008war-7U
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 15:35:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a2so10485905wrd.6
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 07:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uq9H1tcXk6HETzwlofFPzIzEQPctitFjzIM/SIe7Gs=;
        b=U6oXxdflVh5EjAdAf9l2pohgICfOD56RXCSxtpKDoY6tFpJdY/gtAZOnQMBC1hZLlZ
         ZLJk3wTnMot8h5o9wl6lf4NIlAOmMdFCtXnqHXuQH8kNmOUT4bw5+tiMxfqKgLJD2chS
         bmEPFvzK2/u99cpb97W8PbrplYKtbqSdY0KZxnijuhiKQ6tEdWiQyN9SGpFjaByD9zfI
         zUY1nBPeEbvWWZYEoEDAVWGZkZwj7myD+J+2Zk2KdR3jOBQrbR87rZnbJlEbOZWGN68v
         l+Z16QUCgqmtb8qbVP7N7PrHy36uks9vsqFg7sBqviYhqLu7ytBC96wwEarnGlO2J4M9
         tA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uq9H1tcXk6HETzwlofFPzIzEQPctitFjzIM/SIe7Gs=;
        b=YRfCLlz8QcuGWC/bADmQelz9sq1mGdGWGcEaDUnqsxQNBuk7pNrPzqyNXuiZGS63vy
         YsWoFsb2RFpjA832EXRvyzVvLmze/TZGAk7ggRSpn0LhQOokMiTF0p2fdAuvvN5p2QSo
         j7Q9x0QhDQjcRoxK+bIIYQv4Ocd5lQrs25jWmhlQU5xaHb7h0KKD1mNpESGrKrbjVyVD
         Suo9pwmzkf2npHmnJkWLrAOYwPcPL+NecsjDyoL4V1Xjm/aCU/lBoAj3FheLNJ3OJkuw
         1OZSCluyuUUnrFkpSppg410Uq20/pIkYVSSeclmpwmLX+ik6WByZe3oB3/rl5EUln9uj
         ZUiQ==
X-Gm-Message-State: AO0yUKWqdF34GQq27sA9g/DHGMnOZ0ICEDbd/yz+rIkX9x/DmhIGeWyt
	stjKVAYvwndoz20SNvrd4+aLBw==
X-Google-Smtp-Source: AK7set/3gt+QIgKlnSPPhK6wmHyjE44gaTTK4Jxmfzqi39RNTb6+xUx4RIEYembGamlVtVI4ulVwDg==
X-Received: by 2002:a05:6000:118c:b0:2c3:eaff:aae8 with SMTP id g12-20020a056000118c00b002c3eaffaae8mr3587288wrx.18.1675697700681;
        Mon, 06 Feb 2023 07:35:00 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 07:35:00 -0800 (PST)
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
Subject: [PATCH v2 4/7] ASoC: dt-bindings: meson: convert axg fifo to schema
Date: Mon,  6 Feb 2023 16:34:46 +0100
Message-Id: <20230206153449.596326-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073502_372983_4185E4B8 
X-CRM114-Status: GOOD (  17.90  )
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
 .../bindings/sound/amlogic,axg-fifo.txt       |  34 ------
 .../bindings/sound/amlogic,axg-fifo.yaml      | 112 ++++++++++++++++++
 2 files changed, 112 insertions(+), 34 deletions(-)
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
index 000000000000..b1b48d683101
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
@@ -0,0 +1,112 @@
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
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,axg-toddr
+          - amlogic,axg-frddr
+      - items:
+          - enum:
+              - amlogic,g12a-toddr
+              - amlogic,sm1-toddr
+          - const: amlogic,axg-toddr
+      - items:
+          - enum:
+              - amlogic,g12a-frddr
+              - amlogic,sm1-frddr
+          - const: amlogic,axg-frddr
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
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
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
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-toddr
+              - amlogic,sm1-toddr
+              - amlogic,g12a-frddr
+              - amlogic,sm1-frddr
+
+    then:
+      properties:
+        resets:
+          minItems: 2
+        reset-names:
+          items:
+            - const: arb
+            - const: rst
+      required:
+        - reset-names
+
+    else:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          const: arb
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
+    audio-controller@1c0 {
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
