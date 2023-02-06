Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C6C636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IQ+uv6+vPgAVXJjNZJxKGU+b3buZd3FogJZWy+F/F4=; b=2TEGxv/yeyCfzs
	7SXPzYZxJPfj//NYhdpwbT0C98tkxXslqsHNdoozhreQNj23d6ykodHuc1IfO4IEK3xXT5lFV0vqv
	ez2RP/MZ+rowiDHzsKFUbn2o9n12SrJrH5Cg2nGF7t2J+Uw89qlStS59mvGEysb6muL3gy1ZqQBrI
	pAuzoPbmS4cNNm6sILjnw3wFXpbPE2ZWxwEydtCaszlkjP4pY516itXWNRufJ/u+E4oElOq1rJfHR
	hD1YqoYryKoCU1ab+7IFSIQK2q8LPMXKlBCwrdcl6Z7UADcq3bJCUg1CifgR91+JvQIC3mdtGgWyB
	JzyORoUWB+C+btCPEoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP41v-009C5M-UJ; Mon, 06 Feb 2023 16:07:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3WG-008wT7-Cb
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 15:35:03 +0000
Received: by mail-wr1-x434.google.com with SMTP id i5so3590486wrc.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfu3jmputrK/og1fqi3qU6ALj7vxKy6rZ0t8pc/sq40=;
        b=ZHnYuiRL3ENEjIwA8CHehxzcMS0zC4kw5Iza3g804QEPASmtOWIjX26AeoJOl8d6ik
         CQ4vNjYSK1/ctcPjXRAW3ajeN84Je2bt9qKHOgAPXcD2fkD+xFr3Krn+KJS46jS4m5NZ
         VuttM8+gNd3D4ZkBdhY3HpEAfvY3W35RB0p3m3Y9tOp3+61Yr9PBdwnnlc0I4P8IPgc8
         DsJseBI1jG8lZo1gAJm4TOzqFzlag06ATAsw6I6dYJM1Zzl6wf2eJSqWwVltMou7RPBz
         TbCbBtRmkUL0NbCVsTDmO8siTV+CQch7/CzrbYhrJsXgwS2Sk9s/0wcC4uabLVKEwsIt
         kigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfu3jmputrK/og1fqi3qU6ALj7vxKy6rZ0t8pc/sq40=;
        b=yqArJSPFdxconPWbTwdkp0HsE0B64Yt8JY+hpeaoLO5DbsilbMJoqKM08idCbFA6L9
         QZ84w47JYuFQWNcl3zxCS/4Vs3xIXmMpOa8TBMXocze9sXsfuJwPOSHvtSzUsV+vtFA5
         2ZYYRI/Mj3SHrnh/UJUbaG2+FH4o/9P/RF7QvAMf0Yhs0OUHhsZ4QLHpIezG7xRg1LTe
         OibS/qzbJPk9wE7Y/3ln/9F3yU2NZbkvxlYf3dN42ohvzJMuHOmyc/5pK2WB5ijG2QKY
         2m1pDC9UqIKhNVUzvIifcp+s8KsCdKfk7Pssi0UxWT/jjMZiheG2Y+ljnCuvy2mYlliQ
         A9qA==
X-Gm-Message-State: AO0yUKXRZDi29u30JFizO808VcaGCXUNUpE1u16NxeQyEUMf6W+5EkDX
	0WmHdF8sj9boE/uXJjZ8i8myyQ==
X-Google-Smtp-Source: AK7set+OlO3PH8z3y6S9935BmxKTNBfxjdGzm8eW/ChncLIOvUsblIiZQx0RpAzxtxa7Feew7HlELw==
X-Received: by 2002:adf:9c8e:0:b0:2c1:2a15:9dd3 with SMTP id d14-20020adf9c8e000000b002c12a159dd3mr18450773wre.48.1675697699902;
        Mon, 06 Feb 2023 07:34:59 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 07:34:59 -0800 (PST)
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
Subject: [PATCH v2 3/7] ASoC: dt-bindings: meson: convert axg pdm to schema
Date: Mon,  6 Feb 2023 16:34:45 +0100
Message-Id: <20230206153449.596326-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073500_472030_C18A4EAE 
X-CRM114-Status: GOOD (  15.58  )
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
 .../bindings/sound/amlogic,axg-pdm.yaml       | 82 +++++++++++++++++++
 2 files changed, 82 insertions(+), 29 deletions(-)
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
index 000000000000..df21dd72fc65
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
@@ -0,0 +1,82 @@
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
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,g12a-pdm
+              - amlogic,sm1-pdm
+          - const: amlogic,axg-pdm
+      - const: amlogic,axg-pdm
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
+              - amlogic,g12a-pdm
+              - amlogic,sm1-pdm
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
+    audio-controller@ff632000 {
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
