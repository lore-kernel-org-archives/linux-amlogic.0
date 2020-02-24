Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F94BC11D2F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5452920836
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 14:58:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lReDBPlN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iYSdXnfZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5452920836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StTwdjAHx66K6YzTHrQ9Uid83UboMDqpypABFTvYWMQ=; b=lReDBPlNvrZ3QV
	foW3Ya/RXhTaWnZWouA3Pt8wsfO2p6FTDOL/BBnDjshyNqJzzd6UOnqbKghvK4zIByNXb2Mpd202/
	fWryQaxqsXIG8Njrjejeyfzk4HFfgZtkdSQ1om1BFu9qGmevGakO0Ekry2gEY/PWwsheph54KnRu0
	TNXCY+uECkNi0p+YEVEqcq9gnwQXnjq1Fzws+mE83m9XuIs8rZJujYXijcHpaasY3zXKPhtxAdEvA
	DqE3FmX87m6hxSqA6qYGPHroJcK4gj/+jAZ+6lezXZ3zab1RkOSfH1fzq/yQ2sqm3oKvlQ48LoBjE
	5MlcTc7ESy3E0GQgwXYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6FBz-00047M-4R; Mon, 24 Feb 2020 14:58:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6FBp-0003vl-6m
 for linux-amlogic@lists.infradead.org; Mon, 24 Feb 2020 14:58:35 +0000
Received: by mail-wr1-x442.google.com with SMTP id p18so7095859wre.9
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2020 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GUC3r+7+XLZ1MnTHNeVxioo8UtC8ynUGXhqoFIr38o=;
 b=iYSdXnfZfenDrSM3NrHSdFp0SkkGQ0EccB/BQ6ZL6qmgu1dkYPK+tOaU2sT339KqsG
 AklFU6MyF1IJfG3DYEn9+EsQePg0FixjiwvyXbJVsxGvadzoaewawwkcNOdKV9Htmq01
 TnyNvXNFEyH4WnFmR7tKa/ERovodprH84TOZ/iyUhSFb7drHqh6xxDjxZPQ+SQhW33sQ
 b5il+GsUvtIgc5pnDtpvac6aKM+VTUdylOgaxtY5fRdymhmEZAheP/2PVKJgCJeyEHj2
 64IQUvwcer7G9rwk0n3uKlFdDT22B2wXpTl37fVmOMT+/5Y+itZDiUkdNVDbEocEIE9e
 MWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GUC3r+7+XLZ1MnTHNeVxioo8UtC8ynUGXhqoFIr38o=;
 b=pmJj10wW+zuojFXuOuJwodBcJEh5lAh2Lj/NZU3NDUPRtDtcSusc2ZuG71eOXHpCX3
 8fHlGkXOqzm8pGIC/VoZW4X+NRKMT6P9UxTvaUEWYbwjivccL7hzykzK1mYbHFBamyZJ
 scAsaFnwibMclhFYwLa93OvJjVZ+niik+7p1KdQFGCEz2rUXZpDeylf3tLDr1KQmgSLQ
 IN2tIGUH5Oyw6RjIQTFRBKAshNxCaPkgBJYfOxhISfS3R7+1w8o/NpOJbePv57NfyB5M
 m/1WYxeeDal1/W9YSyTuQF6G1jgjHCv4XK0bJPyCtuYKjPw+XWdAsiMXqt5yV0SYeM1h
 e4uA==
X-Gm-Message-State: APjAAAU6ulQJo7r4UtzDAAqeLDQZT0x7xt/yLUDduR0zFQGOYKDRbeB5
 lffz1DZ54pX5/z4miwzKJZ37Jw==
X-Google-Smtp-Source: APXvYqzvG6wN9QHqbYKHMBdBwFlan6RiQm6wsilDz1UiJ8oMW9F8w7g4WBpGnn3CxfgONsTL+fNtLQ==
X-Received: by 2002:a05:6000:1206:: with SMTP id
 e6mr41194382wrx.410.1582556311811; 
 Mon, 24 Feb 2020 06:58:31 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 6/9] ASoC: meson: convert axg spdif input to schema
Date: Mon, 24 Feb 2020 15:58:18 +0100
Message-Id: <20200224145821.262873-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224145821.262873-1-jbrunet@baylibre.com>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_065833_395034_A6FE727E 
X-CRM114-Status: GOOD (  10.70  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert the DT binding documentation for the Amlogic axg spdif input to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-spdifin.txt    | 27 ------
 .../bindings/sound/amlogic,axg-spdifin.yaml   | 84 +++++++++++++++++++
 2 files changed, 84 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
deleted file mode 100644
index df92a4ecf288..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Amlogic Audio SPDIF Input
-
-Required properties:
-- compatible: 'amlogic,axg-spdifin' or
-	      'amlogic,g12a-spdifin' or
-	      'amlogic,sm1-spdifin'
-- interrupts: interrupt specifier for the spdif input.
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "pclk" : peripheral clock.
-  * "refclk" : spdif input reference clock
-- #sound-dai-cells: must be 0.
-
-Optional property:
-- resets: phandle to the dedicated reset line of the spdif input.
-
-Example on the A113 SoC:
-
-spdifin: audio-controller@400 {
-	compatible = "amlogic,axg-spdifin";
-	reg = <0x0 0x400 0x0 0x30>;
-	#sound-dai-cells = <0>;
-	interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
-		 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
-	clock-names = "pclk", "refclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
new file mode 100644
index 000000000000..b9b0863c5723
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-spdifin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio AXG SPDIF Input
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    oneOf:
+      - items:
+        - const:
+            amlogic,axg-spdifin
+      - items:
+        - enum:
+          - amlogic,g12a-spdifin
+          - amlogic,sm1-spdifin
+        - const:
+            amlogic,axg-spdifin
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: SPDIF input reference clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: refclk
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,g12a-spdifin
+          - amlogic,sm1-spdifin
+then:
+  required:
+    - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spdifin: audio-controller@400 {
+    	compatible = "amlogic,axg-spdifin";
+        reg = <0x0 0x400 0x0 0x30>;
+        #sound-dai-cells = <0>;
+        interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+                 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+        clock-names = "pclk", "refclk";
+    };
+
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
