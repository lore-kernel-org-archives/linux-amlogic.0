Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83F9C4321E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51+/NwPdSzhqogOu+ned/D149eMiBUQllrlNKDITjKk=; b=1J+/PgqwxdEiNg
	u5BGX1hJp465r5IVfhbPZ2L7wqnFWdj/FtRhHiG7d/EtyPNbu3FwQam0Af5NUFIaJZWj4H4mAhmhY
	WPBqoIOSs9Yvt3VGK0HU81x13lXV3J4/d+40XwfYnYK0Ecl2GxpR0O8DnVLC7OyeLTKeHrmLRxSMN
	3P4SKvcSHJ/8IB4PiuJ7Cc7M6HY31rdV3Ge5CeI65q/z4+gUugWAJOm8Qo4pr/3Mh0FtRYFBA2HtV
	FnMSQz70m/1YBE18nUXjxbhDeVNegYVgBrm2s9Yvrc04e1mUXEmt/pDzQgLvTbyKO2+NIgzeBnoNE
	c3mOE8xC/9iw0huFLJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DGJ-004h0c-Ti; Mon, 05 Dec 2022 15:20:07 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DFG-004fpt-4r
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 15:19:03 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bp15so19031708lfb.13
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aazsYiCUK+hhkaN7DSb9BXLEifN4Vj66BPeUPEEPTM=;
        b=ckoG7YLE4dTbKyEPRu6WUdAh9sc6sQyo5v4/rMvhZOfAIgvcJ5/MVrGBrf/DiDf8x4
         XHYc5us7TZZOzmFOtgLsqPXSqWfxoE6zcD1artGeDOn81+0Jq8a689uNAvPey+6H7HLq
         w6h/zkl/RjjKWAOa17u7skBBEoJrnXn2wkeA3766gnNbR6kaxqMxWqR21ZN7LsYOxdWL
         k6JrlVLjcZZF41LwGnOXc2nKZjOSbPVgxRutjviPUIJaqB3kt4FMkHZAwIYKtENCwFc7
         FOaJPmARm0f6wHeHMj4aj0Z0QQgIlBAF+xFgSaQA7TSFS9vAScvCXifGNieQ4oP0ASxm
         yOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aazsYiCUK+hhkaN7DSb9BXLEifN4Vj66BPeUPEEPTM=;
        b=DEQXYpJrogCkSkjqF70X0mUi1Y4kdIIQl/b7uYh0XBBu21ADByJYXnXTR5QcYfCYWy
         5zl8+oHXa3O6AP2JS0AM76S/kZg+1HYFFkpg/6ofUhmGW8dScQRCNQE5eR0MSE4cMpH1
         9SUFUj/u9VQ661zw6qiIQnZtFDWIDnE78CpvtMGQYaLs20xpgPC8J7kzGdSzEeVCBEmf
         bn74JighKoPPywKHiiLJ8zwFpHHsZNKPLQZfSv9oVUDFZTpi6wO6qsq/DH5S+IDSBjeA
         Kzkhlih02hUDo4w7beeL1fo6SpKcJHARX7x3RCarVpdiO98MKYISrRSSgbRb/Yqib0h7
         +1sQ==
X-Gm-Message-State: ANoB5plAvP7usApwkUq2+ZTlkEeQzeaGwqAeJVUtLLGgtxlRlBanpMyN
	DXsLTkJQ1LFCXR0T+Ml44BLBnA==
X-Google-Smtp-Source: AA0mqf5etfZUUwBnmi2OzAxBRb101NGrpAQYXEdDklkcv44ujx+sqOk4y4+zled7jnxr64dMaIx3NA==
X-Received: by 2002:ac2:5fcc:0:b0:4b0:2675:110d with SMTP id q12-20020ac25fcc000000b004b02675110dmr24041887lfg.295.1670253541635;
        Mon, 05 Dec 2022 07:19:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:19:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 9/9] media: dt-bindings: st,stih-cec: convert to DT schema
Date: Mon,  5 Dec 2022 16:18:45 +0100
Message-Id: <20221205151845.21618-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_071902_242449_BD31407E 
X-CRM114-Status: GOOD (  17.18  )
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

Convert ST STIH4xx HDMI CEC bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/cec/st,stih-cec.yaml       | 66 +++++++++++++++++++
 .../devicetree/bindings/media/stih-cec.txt    | 27 --------
 MAINTAINERS                                   |  2 +-
 3 files changed, 67 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/stih-cec.txt

diff --git a/Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
new file mode 100644
index 000000000000..aeddf16ed339
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/st,stih-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STIH4xx HDMI CEC
+
+maintainers:
+  - Alain Volmat <alain.volmat@foss.st.com>
+
+allOf:
+  - $ref: cec-common.yaml#
+
+properties:
+  compatible:
+    const: st,stih-cec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: cec-clk
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: cec-irq
+
+  resets:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - hdmi-phandle
+  - interrupts
+  - resets
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/stih407-resets.h>
+
+    cec@94a087c {
+        compatible = "st,stih-cec";
+        reg = <0x94a087c 0x64>;
+
+        clocks = <&clk_sysin>;
+        clock-names = "cec-clk";
+        hdmi-phandle = <&sti_hdmi>;
+        interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "cec-irq";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_cec0_default>;
+        resets = <&softreset STIH407_LPM_SOFTRESET>;
+    };
diff --git a/Documentation/devicetree/bindings/media/stih-cec.txt b/Documentation/devicetree/bindings/media/stih-cec.txt
deleted file mode 100644
index ece0832fdeaf..000000000000
--- a/Documentation/devicetree/bindings/media/stih-cec.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-STMicroelectronics STIH4xx HDMI CEC driver
-
-Required properties:
- - compatible : value should be "st,stih-cec"
- - reg : Physical base address of the IP registers and length of memory
-	 mapped region.
- - clocks : from common clock binding: handle to HDMI CEC clock
- - interrupts : HDMI CEC interrupt number to the CPU.
- - pinctrl-names: Contains only one value - "default"
- - pinctrl-0: Specifies the pin control groups used for CEC hardware.
- - resets: Reference to a reset controller
- - hdmi-phandle: Phandle to the HDMI controller, see also cec.txt.
-
-Example for STIH407:
-
-sti-cec@94a087c {
-	compatible = "st,stih-cec";
-	reg = <0x94a087c 0x64>;
-	clocks = <&clk_sysin>;
-	clock-names = "cec-clk";
-	interrupts = <GIC_SPI 140 IRQ_TYPE_NONE>;
-	interrupt-names = "cec-irq";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_cec0_default>;
-	resets = <&softreset STIH407_LPM_SOFTRESET>;
-	hdmi-phandle = <&hdmi>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index dee3f776be32..5bf8879b4a59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19924,7 +19924,7 @@ F:	sound/soc/sti/
 STI CEC DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/stih-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
 F:	drivers/media/cec/platform/sti/
 
 STK1160 USB VIDEO CAPTURE DRIVER
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
