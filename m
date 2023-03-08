Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FABC64EC4
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OQRRh2aLgWbrkf1+Amlpr87ATqzk8yxErnWEblvtHc=; b=D1NubWMGJMLMna
	J42rd9Vke/YUTXn8aMbDAE49KD7OcieUrkw167dI3zdqVlo6t5lgCGvVvVASm2KJTBkTBywNeVmBQ
	IleMAtP0eev33aIw2JHPf1A5EXk1QHNT8U2RINP7yRyf/yeuZTknDtfLC3tfKx8Zxsi7RL93olk1H
	oCCI8lvmaxi3n4/BXc1DmJhVOJ5LMgfYrIzQPQilW4y2hh8moG853tTsNnRLLWslwPVrApcgl2dJU
	WiTpODpJKTgG4zeEHIJtq6RgfuVOaAae3pGdMh1HZyS7P8e19qptZcDm1jcAFqrtORiHmKAHO0RU3
	y9jM29xwaPqknQjubz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZup5-005SjY-LG; Wed, 08 Mar 2023 14:31:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtpT-005CCY-Pw
	for linux-amlogic@lists.infradead.org; Wed, 08 Mar 2023 13:27:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id az36so9815391wmb.1
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Mar 2023 05:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678282058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRiMwFjCYTBiVehS5Zjzxk4QhzySk5Q8XvQ2DTwvGYo=;
        b=M13CIKtbt6NdnMF3xUVK+U+fIwa5lvxX7UMTgBXkq9LltkKeHAyVwTCDF/go/LFD8U
         6bug2hBb9pxq16K9n/VVCT/PKd3mY+caJksEYqlWyTlUA6l55FmWHpX/nfPNAXGjeIFB
         Fhd7eUiXeSdq+HfeAFF36WX7dEdR3NydVV3LDdKmukSbQGKapP3NVvfhwnh3i/Opkt/x
         hqmL+tZiIIdW8tA1EzdlHziQ/coCtLM13Lbe4DVPZH0f6gZNWXZzmuAaZyxDJ6ebtngS
         cENJUlpWFd85+3HKL7nLdnxp8GvpH3CJtA++mRQHthCLRUQEO7jFPMraW+1V2rkZU9l3
         x8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678282058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRiMwFjCYTBiVehS5Zjzxk4QhzySk5Q8XvQ2DTwvGYo=;
        b=TWhrjgaIX5zHVk2n62Uazz++k+Qs4UDKsD+DFdLBC3DSnN3nd2rcikxFT6cAs7D/ir
         skTQc62S8TFZupwvDOFYyU1uZ0Q/jDPITyDBDNup6zLMgKZpqaYviYVoXRNrostoLKn8
         8n6pRHQUYGebsirbslW2VoSl/lEwj2cKXtIt1rcxRJktwtni0afxVEl/AGGoOolV+R3V
         /uA+nUa0sIsqOLaeoFYYOZURgcfIeaffDippQ11CZIyd55vOJ07NNVziTOJBmE0mrMyu
         VAOfcbYX356UIMafUqZFQes1MCsZyqlOTUwBoDxn7CgDnS+u+hpONczmwdIx3Tj+OIyl
         krGQ==
X-Gm-Message-State: AO0yUKXb1wg6mdFMgjcCGZmbuk1J//0RWZwIO0FBamYf1+v3fa4RqfPL
	9lSMDvzem2ION5eU/UkHqbu6Iw==
X-Google-Smtp-Source: AK7set951sS/BhgEGaC8nI1yOV82Lm95r8nqh+ea9T47x6/Z1PG+rb2KYuae4aHocOJmhElbdw+z8w==
X-Received: by 2002:a05:600c:a09:b0:3ea:c100:e974 with SMTP id z9-20020a05600c0a0900b003eac100e974mr17176799wmp.26.1678282058156;
        Wed, 08 Mar 2023 05:27:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003daffc2ecdesm20631491wmo.13.2023.03.08.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 05:27:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Mar 2023 14:27:32 +0100
Subject: [PATCH v4 4/5] dt-bindings: timer: convert
 timer/amlogic,meson6-timer.txt to dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v4-4-34e623dbf789@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_052739_885352_59986222 
X-CRM114-Status: GOOD (  12.48  )
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

Convert the Amlogic Meson6 SoCs Timer Controller bindings to dt-schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/timer/amlogic,meson6-timer.txt        | 22 ---------
 .../bindings/timer/amlogic,meson6-timer.yaml       | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
deleted file mode 100644
index a9da22bda912..000000000000
--- a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Amlogic Meson6 SoCs Timer Controller
-
-Required properties:
-
-- compatible : should be "amlogic,meson6-timer"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : The four interrupts, one for each timer event
-- clocks : phandles to the pclk (system clock) and XTAL clocks
-- clock-names : must contain "pclk" and "xtal"
-
-Example:
-
-timer@c1109940 {
-	compatible = "amlogic,meson6-timer";
-	reg = <0xc1109940 0x14>;
-	interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&xtal>, <&clk81>;
-	clock-names = "xtal", "pclk";
-};
diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml
new file mode 100644
index 000000000000..8381a5404ef7
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/amlogic,meson6-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6 SoCs Timer Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  compatible:
+    const: amlogic,meson6-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+    description: per-timer event interrupts
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: xtal
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    timer@c1109940 {
+        compatible = "amlogic,meson6-timer";
+        reg = <0xc1109940 0x14>;
+        interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&xtal>, <&clk81>;
+        clock-names = "xtal", "pclk";
+    };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
