Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152CDC6379F
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXX803WvZSLW7NLNALq153+0MSDbPs/w7JiMwJwILK0=; b=jui4f5Td3/tDX4
	KWIvMPpj/25qM8/vBgCNnyBc7zmhR9NhaUJVjV4e2cKjZ71NcBhGLHcWWMVuaf4Wmui0RUXX1twI0
	+d8uKYBIQc0O6wQz7vAXWwVDFcnDbpVaoDx4qqPfUjHhmzmRYGrUPaWrOoFYuZ0lTcnyp6oltwS10
	UD9I4Jb5Hp8+0rTHv/QmzYAO9AkKXLVp/phsvaF4GIwK+1WHr6c4l3HZUiDlrq6yHp2W+M5kwEvR2
	arHgSEPAcJkbmmgfyhUkogvtAtxD7k7a2AwgnNmKIZ5S51lTzp/eV8X4rngIToja0xcGZkkdM0lnR
	XUso/B6pfhNhL1x4vTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP422-009CAl-Vj; Mon, 06 Feb 2023 16:07:51 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3WJ-008wcO-F7
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 15:35:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id h3so2924266wrp.10
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8FN4EvykAI4IHl4CftNphEVB0wNAxrQh05VKdmQXhI=;
        b=uITFYSqUqgTIidcd8LPSMOTw2ZmKXAI7KBgKeOsy2BerfLW0io7swQkw+HoDvo6eq5
         Dw8M9NeSttjleVMYaHHFzDuWQozgyw/dW3zVGer/ABF7wwLFgZVKR61ZXnlN+qlRG6Zy
         pI8CpKEhgrHmzF9n354GduIygtpF+6064V20DuNIntgczh9xPtOP55HGJY4tEYWrMLtT
         gqKkN8mdGu/uldfgydcvg24BqU4MIJ433HNUH+ghKJSCi71d+5sTfIQzuwynE6YPq5MD
         cVSrF7er8jx5U9QUkE9+Ssf6lSaFsc79zSAoyCT4ycIBBDqFmVH028QrXI+bfCFl/Q8o
         rVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8FN4EvykAI4IHl4CftNphEVB0wNAxrQh05VKdmQXhI=;
        b=j3lon7jYvBVXYa4goUqV2TAZ+G5UJbscD+caaGRbhbDkDuDC/1hOqZqubfAK72UG7C
         36hJVGIaXZkbdbBrVJZYlts6+ocCu6ij2NWradIZ0eaxD1d/TeaUYHoABNi06agQB8SD
         ETvg9azo/jlrFeQS/cZgUetAcge6YZ2DyWWKmPJnmmNIlu5m/ofrgFfw3qIJhmrSkJHR
         4U2Faj7hUBFL3tiD4Y5yR+dbyh2x+OWylNzudRNwUGk0S0mGkApX/xx8LGlWxznqHC4s
         Oh/fPeQWR2OWGTUUl218cHU1hQtT1l+jcKZ7xelDzxJ71TCP/sdewFVfobdQ4lH8qn54
         uSkA==
X-Gm-Message-State: AO0yUKU7iKQCcBr4LpAjG0fPQw1ip+kTYzQeu1HKqIfL83KgDc5OKszk
	+zrBoLJqQtu5fAyCBMjoaMZYMw==
X-Google-Smtp-Source: AK7set9OiM48xEewyoAZU7y5zm+UkbyRMEhymrKbpEYSJglqGuv4o0288BnponDYegoB13uBs+DSJA==
X-Received: by 2002:adf:e0c3:0:b0:2c3:d808:e82f with SMTP id m3-20020adfe0c3000000b002c3d808e82fmr11851675wri.17.1675697702228;
        Mon, 06 Feb 2023 07:35:02 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.35.01
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
Subject: [PATCH v2 6/7] ASoC: dt-bindings: meson: convert axg spdif output to schema
Date: Mon,  6 Feb 2023 16:34:48 +0100
Message-Id: <20230206153449.596326-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073503_576752_F4826BA4 
X-CRM114-Status: GOOD (  15.20  )
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
 .../bindings/sound/amlogic,axg-spdifout.yaml  | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 25 deletions(-)
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
index 000000000000..15be8dae9398
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
@@ -0,0 +1,79 @@
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
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,axg-spdifout
+      - items:
+          - enum:
+              - amlogic,g12a-spdifout
+              - amlogic,sm1-spdifout
+          - const: amlogic,axg-spdifout
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
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: dai-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,g12a-spdifout
+              - amlogic,sm1-spdifout
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
+
+    audio-controller@480 {
+        compatible = "amlogic,axg-spdifout";
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
