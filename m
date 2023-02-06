Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83651C05027
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vg3EoA0yUEcu8V/Hh7IlP/3/FOrU09DPwX0OZtUq1X0=; b=2ktmG5gcGS4AIm
	7w5xwOdGtdrqaTvsTN/K6ygzFRI3TJFG5FMp3r5LPKNIvruhkm2+WtaIkOaD2yhCGSiF2d5nbyr5R
	gpBRlCUIbjHRafGuvYFWgBVcfKP4WmT8Hxmdbj9O8cfe/4j+cGLKtT04Ofm5BFDPQTsdXxM/R5kMg
	kf+KA2mNgnnrDEtJDVmzxW27ujpDbqq5ViGYX7wgtP6Fkzdlme/DVbZSVrGvrPp4EkkKgpjkwwkCg
	6zJV40z17KpO6Wa2NphuAKmHLiGqsCWzZKl7xo8JyC/Xpi0irew4DeKg8C6ph79us4zJSvTy+EbDx
	N9HAbhNZMMqd172gxL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP41w-009C5f-UC; Mon, 06 Feb 2023 16:07:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3WI-008wbZ-NI
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 15:35:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id i5so3590555wrc.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 07:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lBSrvjf3cyT4RRbBVK5enJ7REZCr1oSf4WB5Ql0EWc=;
        b=YHvM+plLw381A2A2MT7QOvNVDR0HQtu8RETa2oQ7H8qE4X5SYfWUsxIfeXOHA1SRqq
         cC8yUyxnxWXOidoy3NlBMk4umQobfq6DVuwwpme1AzMnToLU7Xd/jScj4TMaPEklhG+6
         Pux1PK+aFU3FsF5r5Q8j0LE32477kwTGDUTJVHB8eKX2jaiB6IqZG5mUiWXbxbxAfPbz
         7F4ozXCCf9wkyda2wtXAzYS8NiTSfCiT8wYi/gLCbPwAaaCmEZvaEOHrEwgZYcNBpZTY
         asRqhVRd5dp+6uuis/eFdTVAHU1qDmoTAwzmbYVj9bwWCy8otdl55Kzv7IQs9xlqhNj0
         Q9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lBSrvjf3cyT4RRbBVK5enJ7REZCr1oSf4WB5Ql0EWc=;
        b=pABkWq7m8qIKb7FmbKwW3lcEKDkTumdHH3QBiU0xe56F8i9JlvrdSAQezPn2wmXQ/8
         2DicerT3Ra1mD/Q3mVzKKX+XU7phpJFTU8GIagdJ503ijR6719MSVqC48FZKEqeHUABY
         tr8BhUtUWrD4sTIHewXUgtama4HSRjlSQECueAHJUk8uWQY6hyGK6lXADfyhAtN0RBGi
         HBhWNssb4KBuzSTVhwD/nAJoblJjm4IgTS5m+3MUd19axNeHW9NVeKBg+Hx6J/qWwojJ
         HzbHxRFpEN4lm1jnDLSn3zzlrhpIVXxJTh8kxLXw9yltWoF/S5ecL1NRSA+os7SWoqmk
         Rqww==
X-Gm-Message-State: AO0yUKVThOR6Uj4GrE3dM12EJJlNu53YydrAFwAO4gPiZ9FwqSof8zKp
	T5NQUYHo06gs1RQW/m1/Zbn3NQ==
X-Google-Smtp-Source: AK7set8csyy3uREeZXYPe0M9EgeJi6ngyhaJnYH6JVUyFj4TDjHqUq0uvG+o1JoR/ri7NlPhSAfqlQ==
X-Received: by 2002:adf:f1cc:0:b0:2c3:ea64:425c with SMTP id z12-20020adff1cc000000b002c3ea64425cmr3475028wro.17.1675697701479;
        Mon, 06 Feb 2023 07:35:01 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 07:35:01 -0800 (PST)
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
Subject: [PATCH v2 5/7] ASoC: dt-bindings: meson: convert axg spdif input to schema
Date: Mon,  6 Feb 2023 16:34:47 +0100
Message-Id: <20230206153449.596326-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073502_802143_08C6C17D 
X-CRM114-Status: GOOD (  15.05  )
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
 .../bindings/sound/amlogic,axg-spdifin.yaml   | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 27 deletions(-)
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
index 000000000000..a0bd7a5fb9b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
@@ -0,0 +1,86 @@
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
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,axg-spdifin
+      - items:
+          - enum:
+              - amlogic,g12a-spdifin
+              - amlogic,sm1-spdifin
+          - const: amlogic,axg-spdifin
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
+  resets:
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
+allOf:
+  - $ref: dai-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-spdifin
+              - amlogic,sm1-spdifin
+    then:
+      required:
+        - resets
+
+    else:
+      properties:
+        resets: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    audio-controller@400 {
+        compatible = "amlogic,axg-spdifin";
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
