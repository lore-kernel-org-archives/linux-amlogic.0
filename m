Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438D6C636D3
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiE4obzzseykjX7RAR0GQTFFIGfUSlwCSMXOIxJd3Rc=; b=WzxGxgna8SMuI6
	ZHCASU56/F/z9/yvJ2c2UGX9+giUCyNJbuY4sirQ8GJgfqfmhuwVFJYjjJIB/uudEF+w/Sjdy/B6X
	1KpfzuXiwyvB5jJq0LAkY5a2Q566mW9WEdwLx5YrJMzh9oBGgI/uNm89D3592ZHWWMz4DvYMBT3VT
	BwotKMcTZcV6aflkjEVtbTqSmyHSZjCDL8gGn3ban0L0knJV7cfXT/3HYBj9GvxlVU8vQrVQjLOkA
	jmSrRk5vJQ+toUejGEOeV7lkR4s6FNyJqn+aXtitSpwujI2r6OyDXxsGUaXAVY+EcLMG5kaMU3STO
	u5GanQaTYMbznXbYqB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeT5-00GyEz-V2; Thu, 02 Feb 2023 18:37:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeT3-00Gy1G-Kt
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 18:37:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bk16so2536104wrb.11
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 10:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHcTQ2BAGg+MkacXJwMrR2edvtbJn3+EYrwBcjC/8/I=;
        b=Ol+dWYPUCPY2dBcbd6w6cExLMsMOrobov9S0aUXQoGZ5H47VaMO+UiujxXMtAhNA+F
         IxHEFgfw3nkxmtX5CcE4YxDlelZCEEm7uLRwyEgPQ5uTZZdNAbPXNL6U33T89LJfxQ4O
         ZzPmQV9FaIdMksGzccnlyJs6l+clq9ECrJOcnYm5cRI0W7YVY4bpJKbRfO0xHXO6Wcwb
         YLlcXWsz2N4Bzm6JQnwII4mLiMnU+eCil6OYac7GW//Crrdid3R9mfeG3+Z6n6nuHcQZ
         6WQVO4QASUJMJ+9dcz6TzfGzw2eE9H8xEbaTGDfiQmPevqZeNSHM7JKYq9Hc9c8Vh0Q6
         W0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHcTQ2BAGg+MkacXJwMrR2edvtbJn3+EYrwBcjC/8/I=;
        b=uhQWjgvsqDnlfSGsJKdUDUk/Yip7I2lSdWcWZd4s4VShOfPFYFie8zK3LMtOe5t8cp
         RsStdWVqRc/cl4T7H54wjAJvDuSGeeOdfDGt9wh9WMvCdX/bmgGU8yaGnwEy6S/MziyY
         jpnmqX4+PYWQAPYjwMKA7MBf9QbPTJfMjgaO5U1bNCu0nrojsFgRL0/R/oG4Dv7M6fJk
         xCOyekZq9ue3CUWL13i6Ql08mrCHtilq55zePuAA39MCAKjdMAgteGb3u7LLziBq17OK
         Jv9ugROqo/Eys59iVnl1KX2Oql3hm5y/ypgZOujnV5A+iMDiMgR5BwIpNN/+YjX/kbFv
         SeIw==
X-Gm-Message-State: AO0yUKXRvnuieo2VeuoTvqbFSPS8h17e4X8wbNFMf9S4R3ti8cYVuF3y
	7M/bP5LBT5rbdtnK3ER1KC4e2A==
X-Google-Smtp-Source: AK7set/B53SqoLtzJXsKRY61oKnWcB+meMccnCo4RFMK4i/OPEORfp+Xo0hkgplJDMHVfsx1Vor9iw==
X-Received: by 2002:a5d:4bca:0:b0:242:800:9a7f with SMTP id l10-20020a5d4bca000000b0024208009a7fmr6275648wrt.65.1675363073190;
        Thu, 02 Feb 2023 10:37:53 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:37:52 -0800 (PST)
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
Subject: [PATCH 8/9] ASoC: dt-bindings: meson: convert axg spdif output to schema
Date: Thu,  2 Feb 2023 19:36:52 +0100
Message-Id: <20230202183653.486216-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_103753_702045_7F8A5FAA 
X-CRM114-Status: GOOD (  15.68  )
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

Convert the DT binding documentation for the Amlogic axg spdif output to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-spdifout.txt   | 25 ------
 .../bindings/sound/amlogic,axg-spdifout.yaml  | 83 +++++++++++++++++++
 2 files changed, 83 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
deleted file mode 100644
index 28381dd1f633..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Amlogic Audio SPDIF Output
-
-Required properties:
-- compatible: 'amlogic,axg-spdifout' or
-	      'amlogic,g12a-spdifout' or
-	      'amlogic,sm1-spdifout'
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "pclk" : peripheral clock.
-  * "mclk" : master clock
-- #sound-dai-cells: must be 0.
-
-Optional property:
-- resets: phandle to the dedicated reset line of the spdif output.
-
-Example on the A113 SoC:
-
-spdifout: audio-controller@480 {
-	compatible = "amlogic,axg-spdifout";
-	reg = <0x0 0x480 0x0 0x50>;
-	#sound-dai-cells = <0>;
-	clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
-		 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
-	clock-names = "pclk", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
new file mode 100644
index 000000000000..c661ce7f8b9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-spdifout.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio AXG SPDIF Output
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
+              amlogic,axg-spdifout
+      - items:
+          - enum:
+              - amlogic,g12a-spdifout
+              - amlogic,sm1-spdifout
+          - const:
+              amlogic,axg-spdifout
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
+      - description: SPDIF output master clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: mclk
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
+          - amlogic,g12a-spdifout
+          - amlogic,sm1-spdifout
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
+
+    spdifout: audio-controller@480 {
+    	compatible = "amlogic,axg-spdifout";
+        reg = <0x480 0x50>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
+                 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
+        clock-names = "pclk", "mclk";
+    };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
