Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66DDC636D7
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mq5BhMjFW47wKDOui38tsscEC+hrQVtXlB4vuzYaJss=; b=rACyje+4ekMWrh
	ptnA8kxu9zqBd8nOI+lo5qsWnjKpYSwis5R1psH+KjEfhw+x6n0rF6YhSJyO2VS+5WBe+HuA7b8Np
	4tqPqCshglPET/gIL2nQYsNve0bH3jj4uYc858kKQBgatptb9ZvSgRr6s+OjcQDM1/DON4U0YOgcr
	COEHJ3KBsWe3IAjH6KwSFAvp21AhRJf/X1BDXTBbryDXBJopHgaOgFmVoxi+ZixFDhLhnc7jxXGTX
	SmY97ikRXRt3tsPZlN8+H3S63DWl0TM/yyZQ/3BCC7GIhyoNocXOEY2xycjKt6omiKXwxlLykOu3/
	t79rDAZTKL5zdEdi7Y9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSy-00Gy9O-ML; Thu, 02 Feb 2023 18:37:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSw-00Gy5X-37
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 18:37:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t7so2566012wrp.5
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 10:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C7ku/hdu5/TzCYZjswOMzLUyQCwBVMzHPFGN9cKzy0=;
        b=K6j+XbgiXMKA4me6MPCQUDOi7uYQTQpYaO+uCV6lbFgsRH3NnCqmx/HSMYzBbP0FlP
         1AX9OXdTocgEAi76fVpp4BCazKbE2kI5j8A9zZtINn7iOm1Wr92dIs0/JqCWUObBn5sv
         bP6wzmFdk6YVVQrNM7TkU2WBJHqrrL1tnaIzriIckujVTXHqidrL3x7Rn8iBX60PMHRj
         wSLX5jlAefjq8ul/YUxbNBo4htf15B6FmN0qBCKFK8Map+JQX7NXB1YP/OY0fHb/xwSh
         fSog8uAtx8A0RL5EPgPudL90JFs0XWQb+xQrc960qoLDq6frjJutDeJAmNXLbv8ft0Zm
         PZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C7ku/hdu5/TzCYZjswOMzLUyQCwBVMzHPFGN9cKzy0=;
        b=jQKXCAhUrDeLwj36xJksYKseASNNKiA7nRDX8nZmveR/71sSgZWgeyqEQ0CB/yQlPU
         +MQdmzKQOHiq7a330gJ6lGk3d4Mlxl4kfPjvRnUwBDPScEF8ztb+UYKDHcKiMVaQrifY
         kF9yYcCuODEPfVuZ1oOqcTHQmzPx3Prw05nkHhi36O1WvTNlGnFRU3XVrL7e7yhaUQHm
         Ebc060AMXjFz5Bx+4fonf2HCtc/mtzlXo7gqcp9bUMimqp5FwXMubm84Jl2CYqmX/dXW
         nE/jnnmD1zgj8v6OI+0a4I1QqJy599X895HFPIRGxhknuYlkgiLyJorJFDUxOYA7Mc8S
         ptWQ==
X-Gm-Message-State: AO0yUKUz3zRLazV+ztlAK8Qhjb1M3RCI5BQ6nV8JY7YfqEXY8MN9WjJG
	LbYj49UHDCysEfY0s87d/7LRew==
X-Google-Smtp-Source: AK7set9GEst5k0yE0VCUCrw/5WgzY3bbUupi4GHxUPPVXRNzsllK9jWdJzCeKvEvJc434Ov6GNCQUQ==
X-Received: by 2002:adf:c70b:0:b0:2bf:9478:a91d with SMTP id k11-20020adfc70b000000b002bf9478a91dmr6840276wrg.39.1675363061634;
        Thu, 02 Feb 2023 10:37:41 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:37:41 -0800 (PST)
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
Subject: [PATCH 5/9] ASoC: dt-bindings: meson: convert axg pdm to schema
Date: Thu,  2 Feb 2023 19:36:49 +0100
Message-Id: <20230202183653.486216-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_103746_152001_E0AB86AA 
X-CRM114-Status: GOOD (  16.15  )
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

Convert the DT binding documentation for the Amlogic axg PDM device to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-pdm.txt        | 29 -------
 .../bindings/sound/amlogic,axg-pdm.yaml       | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
deleted file mode 100644
index 716878107a24..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* Amlogic Audio PDM input
-
-Required properties:
-- compatible: 'amlogic,axg-pdm' or
-	      'amlogic,g12a-pdm' or
-	      'amlogic,sm1-pdm'
-- reg: physical base address of the controller and length of memory
-       mapped region.
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "pclk"   : peripheral clock.
-  * "dclk"   : pdm digital clock
-  * "sysclk" : dsp system clock
-- #sound-dai-cells: must be 0.
-
-Optional property:
-- resets: phandle to the dedicated reset line of the pdm input.
-
-Example of PDM on the A113 SoC:
-
-pdm: audio-controller@ff632000 {
-	compatible = "amlogic,axg-pdm";
-	reg = <0x0 0xff632000 0x0 0x34>;
-	#sound-dai-cells = <0>;
-	clocks = <&clkc_audio AUD_CLKID_PDM>,
-		 <&clkc_audio AUD_CLKID_PDM_DCLK>,
-		 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
-	clock-names = "pclk", "dclk", "sysclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
new file mode 100644
index 000000000000..d3da2f8ba7b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-pdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio AXG PDM input
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
+              - amlogic,g12a-pdm
+              - amlogic,sm1-pdm
+          - const:
+              amlogic,axg-pdm
+      - items:
+          - const:
+              amlogic,axg-pdm
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
+      - description: PDM digital clock
+      - description: DSP system clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: dclk
+      - const: sysclk
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - clocks
+  - clock-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,g12a-pdm
+          - amlogic,sm1-pdm
+then:
+  properties:
+    resets:
+      items:
+        - description: Dedicated device reset line
+
+  required:
+    - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+
+    pdm: audio-controller@ff632000 {
+        compatible = "amlogic,axg-pdm";
+        reg = <0xff632000 0x34>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_PDM>,
+                 <&clkc_audio AUD_CLKID_PDM_DCLK>,
+                 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
+        clock-names = "pclk", "dclk", "sysclk";
+    };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
