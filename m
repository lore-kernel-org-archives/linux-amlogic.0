Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9633C636D7
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZY1F722LpGfv2/jqqBK4L1GDNWjGw5M9AiFjcaVeQI=; b=myxudrv6ozDC4F
	5xj5jLOExNCzHMC7cYLCqiK+GQMr+1HyPaGaOQ9vSCn50WjM+A3luiGCf4PtfdZUea/3sO8MB/Skc
	VS8Ou5nA9VEgi9LJuhz/HlC6t9CFL4EGiwq5yBnUEjr11++7NrWoKgTknZ3qK/TRsimtcBaYA60fQ
	0kS/lSjdj6vdqv5CmYoSBnAdA5gniDXYC4vLZ+c2K/KnoZwAeQWNvo4wqWoXc0PnGx60ZQtRTjdEv
	XT1H26dv3u3XK403950nJ+1wqcmvsal7yXcFLsEON7kiD5xeF1043J/Qkj0cw+ugF8dPFShJ0YoA4
	cMTSOvUeqS/q/pBRrmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7Ef-001o4s-GO; Thu, 09 Feb 2023 13:45:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7BJ-001mM2-QC
	for linux-amlogic@lists.infradead.org; Thu, 09 Feb 2023 13:41:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so1559600wms.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Feb 2023 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtExAhyASjCaoXqGCyD4SFP8HX8WU84xqgiQDTtv4mE=;
        b=DZ4iuTh3FtikDJN19LSa9P+ch6kwH06TXcGr9O5HsoP3GNbzqz6d3zOWkobQxkNfUu
         0cC8pZRAUn/bMNiaFwNSIkrTSmGU4WYQAJ3RbxSupAdJm9hMBEyjmsIUNJkhxFXKpY6J
         gounMRJc4gd7VaL14Se5D5QxNkW54DZvWDkws+pZthuPynORhmggp5Wi8x29AYV6BciX
         DgNgLCI8hSuU+tbc28CYbe8joB60yi0BmKiSUH+TfJfH/HIjd1b8Hye/nWtGlVDR1aEH
         2An59fO1i3LypUeM/iOTlWN89K26GPchHe4ptteYzlqjjQtl0YiH99+99vNMaQbMKtxN
         Xbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtExAhyASjCaoXqGCyD4SFP8HX8WU84xqgiQDTtv4mE=;
        b=BjAPAb58wxCcWPHGHqqn/85LxF4SRWncleMxjJbJHxdfRi7ZgghbCfdYSLhI+4LWyP
         6KsZIi+p+XHGYwhlqYAxRtRLqecE+JeuysB1JTTYWy6jpLf8LCkWZqPVHZzZpsgRZLLb
         AY52AB/35DJS244f/9z4r3madYuiZl2T2egE7xuq45tjlQZdqyYQicujU5ZIptvPAiJE
         hT0Ioqgc74c3gsNuSOp2KKp2BAIJqY3vvN9Z131nksAvQ/tqwYjW/FcAYrM+afwmq/Ug
         X0Zq8w3/Aes04aI+IGA2dC9h9AwDCKhUJAZgpN2O+101Lq3fUpNRsDG4mU+RoVvUOT6k
         OZKQ==
X-Gm-Message-State: AO0yUKWG8D7+d6dodBJ/ZQpS6CP/QEZML48YKbQ+UJtTcBQXd0TBsk0o
	D+chQTlZoiLhYyavBUteHq0cGA==
X-Google-Smtp-Source: AK7set8OFp887uOX9Ujf+dz1+EFOgo9XzvM2Bd1CPJzipfjT2n3QdC2yiT6YQ+Mf8MBKOgqIE4ewUQ==
X-Received: by 2002:a05:600c:13d4:b0:3df:e1e9:200e with SMTP id e20-20020a05600c13d400b003dfe1e9200emr10046874wmg.39.1675950103457;
        Thu, 09 Feb 2023 05:41:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003dfe549da4fsm4946991wmi.18.2023.02.09.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:41:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Feb 2023 14:41:40 +0100
Subject: [PATCH 4/6] dt-bindings: soc: amlogic: convert
 amlogic,gxbb-clkc.txt to dt-schema
MIME-Version: 1.0
Message-Id: <20230209-b4-amlogic-bindings-convert-take2-v1-4-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_054145_919612_54165776 
X-CRM114-Status: GOOD (  15.94  )
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

Convert the Amlogic Clock Controller bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/clock/amlogic,gxbb-clkc.txt           | 53 ----------------------
 .../bindings/clock/amlogic,gxbb-clkc.yaml          | 51 +++++++++++++++++++++
 2 files changed, 51 insertions(+), 53 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
deleted file mode 100644
index 7ccecd5c02c1..000000000000
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Amlogic GXBB Clock and Reset Unit
-
-The Amlogic GXBB clock controller generates and supplies clock to various
-controllers within the SoC.
-
-Required Properties:
-
-- compatible: should be:
-		"amlogic,gxbb-clkc" for GXBB SoC,
-		"amlogic,gxl-clkc" for GXL and GXM SoC,
-		"amlogic,axg-clkc" for AXG SoC.
-		"amlogic,g12a-clkc" for G12A SoC.
-		"amlogic,g12b-clkc" for G12B SoC.
-		"amlogic,sm1-clkc" for SM1 SoC.
-- clocks : list of clock phandle, one for each entry clock-names.
-- clock-names : should contain the following:
-  * "xtal": the platform xtal
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. All available clocks are defined as
-preprocessor macros in the dt-bindings/clock/gxbb-clkc.h header and can be
-used in device tree sources.
-
-Parent node should have the following properties :
-- compatible: "syscon", "simple-mfd, and "amlogic,meson-gx-hhi-sysctrl" or
-              "amlogic,meson-axg-hhi-sysctrl"
-- reg: base address and size of the HHI system control register space.
-
-Example: Clock controller node:
-
-sysctrl: system-controller@0 {
-	compatible = "amlogic,meson-gx-hhi-sysctrl", "syscon", "simple-mfd";
-	reg = <0 0 0 0x400>;
-
-	clkc: clock-controller {
-		#clock-cells = <1>;
-		compatible = "amlogic,gxbb-clkc";
-		clocks = <&xtal>;
-		clock-names = "xtal";
-	};
-};
-
-Example: UART controller node that consumes the clock generated by the clock
-  controller:
-
-	uart_AO: serial@c81004c0 {
-		compatible = "amlogic,meson-uart";
-		reg = <0xc81004c0 0x14>;
-		interrupts = <0 90 1>;
-		clocks = <&clkc CLKID_CLK81>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.yaml
new file mode 100644
index 000000000000..412453fc75e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,gxbb-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,gxbb-clkc
+      - amlogic,gxl-clkc
+      - amlogic,axg-clkc
+      - amlogic,g12a-clkc
+      - amlogic,g12b-clkc
+      - amlogic,sm1-clkc
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xtal
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sysctrl: system-controller@0 {
+        compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
+        reg = <0 0x400>;
+ 
+        clkc: clock-controller {
+            compatible = "amlogic,gxbb-clkc";
+            #clock-cells = <1>;
+            clocks = <&xtal>;
+            clock-names = "xtal";
+        };
+    };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
