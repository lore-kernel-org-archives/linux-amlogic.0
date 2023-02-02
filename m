Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AF8C05027
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 18:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuzNlSRbNglkBrF095gL/WffXBcxyHpA6SSlFWb8Cd4=; b=ZOMWm2JK4yXiO2
	PYRwzSn1Rf6jplAi8JYwMO8zmaHAo4xZh/0+YhQ5XjNdxoFmn/t98slQ0vrfUAPHZE/hFLreNX/mm
	DYUliTSKJb3IYqSEtCZtc0CtYA+IAPYmlQI32AfqVQ6TZixXEYJZsNtMyHzo+0udK3goD7TDJ+1ql
	YQ8zLBzqbyJISwiZN8lwT9snEEEau/3MA1sYdDPbDnol2+jFEi7yylJUR+4RpFfY6L4WHUVcPBczy
	7No7ygV1aMEOKq0eGbVWhqNzYE/VOAIUmkUdRyDD6f7xY+d8q5a7fyb7UOa4SOLMhHgL0sESbUEpu
	u4+k2thz+DGDphY3Y5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeT4-00GyDr-ID; Thu, 02 Feb 2023 18:37:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSz-00Gy1O-O8
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 18:37:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t18so2578845wro.1
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 10:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/DpEQ3WT95j3ahVb/iuTFbCoKMlDfa2nVQ/If2Wf7k=;
        b=XFC0aibouZzGFjMHLXWdXmvocR41v3JmQLwFe6dfxGMv2H0B3HTHKK8LuoR2YSJ1Sz
         EKV3TA8m38zbc0Qza1c38ZQDYA78BnvyVqYaUXILvjDe4p+dHqK8IJjxsOX4vbcPk7BT
         1PptwKV3Gv+uO6/JX0mqv5TlH7/dEP4P0vEc4Mm8qil+8v/40SdWGgXJlnBgi15twE0g
         Rxgsb2FqRedulHGjr/d6SliPgQ2g1LI2FySqufXW51c5llTSV8MgPNl7UebicvKdyJaF
         hB0HE4rLz1n79kv8+HXZMfGdmQTt6I6vceCpJA2q6p0FhSTNDQAjZgqq0RiP3D904ABh
         eP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/DpEQ3WT95j3ahVb/iuTFbCoKMlDfa2nVQ/If2Wf7k=;
        b=omm28wSeMikTFGU2yaVQhE/JQjL1rRcu7uMiFfV+WPkHJXu4+QOkzx51qyJGDpkFZJ
         /SlLStHsOuxcTGo80ffq9U7hQyk/mCEHvkPM9Em9chk4Q19V/vPZ5vyiF4DFoMCk3Yc6
         w/NfVYMysxa0RmYRiiaLBCfmmzCH5e9C98SCtPWXNkLgI3FKOJob4ETyvd9JWNctdAJR
         Wm55KqzdwaG6vRqW2AF9CYpAu5k1D6ZigN7vYVqjpyZxFAC4WLjjEnHwMB82nGtDl9H2
         gC5ZT5q2Z22fGY/Wf47Nir6U6F+ukK/L9YhSFHwGzSBEvxIyKGsO59CvhsDRCBlpnen+
         zb1w==
X-Gm-Message-State: AO0yUKVZ5TJHRM487goKLXbtnXSmre2BTHbP16q6xbv9ve2/bb9q3S6n
	dJxxeu4Gti7Zl1lk74E6SndH6A==
X-Google-Smtp-Source: AK7set/mu/M0m0ZjgRhQ0UpFb3NmI4SGF/qka+7qsN5S+fwfyRnOR3+Qw6MHJWSEFfzIeB2bM2SR+g==
X-Received: by 2002:a05:6000:982:b0:2bf:b199:c7eb with SMTP id by2-20020a056000098200b002bfb199c7ebmr6137905wrb.54.1675363069295;
        Thu, 02 Feb 2023 10:37:49 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:37:48 -0800 (PST)
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
Subject: [PATCH 7/9] ASoC: dt-bindings: meson: convert axg spdif input to schema
Date: Thu,  2 Feb 2023 19:36:51 +0100
Message-Id: <20230202183653.486216-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_103749_803054_16E7AD0C 
X-CRM114-Status: GOOD (  15.35  )
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

Convert the DT binding documentation for the Amlogic axg spdif input to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-spdifin.txt    | 27 ------
 .../bindings/sound/amlogic,axg-spdifin.yaml   | 90 +++++++++++++++++++
 2 files changed, 90 insertions(+), 27 deletions(-)
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
index 000000000000..4f7e4c21acc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+          - const:
+              amlogic,axg-spdifin
+      - items:
+          - enum:
+              - amlogic,g12a-spdifin
+              - amlogic,sm1-spdifin
+          - const:
+              amlogic,axg-spdifin
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
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - clocks
+  - clock-names
+  - interrupts
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,g12a-spdifin
+          - amlogic,sm1-spdifin
+then:
+  properties:
+    resets:
+      items:
+        - description: dedicated device reset line
+
+  required:
+    - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spdifin: audio-controller@400 {
+    	compatible = "amlogic,axg-spdifin";
+        reg = <0x400 0x30>;
+        #sound-dai-cells = <0>;
+        interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+                 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+        clock-names = "pclk", "refclk";
+    };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
