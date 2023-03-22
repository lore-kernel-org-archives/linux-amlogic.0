Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A5DC76196
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 17:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cISiNA98hlSvCzRERBlcvEGn6J8kXziWkyp9edobgec=; b=e30fiRX7IF566g
	mCRVm/qCLa4Woa3cBp+ADs/X9/rfCamdkbcpvdcrfbqhgG/mvNbyn9r0gE0qef2eAhCooUTXOqlZf
	OKzcnvpxbmpRHa1NZJlyjcQJF2EjJWygSRInGU6JW5EBEf64tRFb1q1CUQHyjclw6ClFWGf4GErxH
	C5JxNfdde0jzMzCSkYO1FJdG/U7igCkHGvFwFq1icd54k2GIHolaINzJB5tuHL5zhKkf3d+o17uF0
	yCLMy/uGcvuozHJfPPq/6H2fiNMPo3MJg1UWAl93KJzkyLKslQ9Q4hvljfZG8oFnbQb83Yl5YEn/V
	CSeJmND8bMVOBTMPCXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2NO-00GrUs-34;
	Wed, 22 Mar 2023 17:35:54 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2NJ-00GrRe-0Q;
	Wed, 22 Mar 2023 17:35:51 +0000
Received: by mail-oo1-f50.google.com with SMTP id f5-20020a4ad805000000b005399cfd276bso2437530oov.6;
        Wed, 22 Mar 2023 10:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP1sW3nJE9MVZhrW5r4ts+qmYu6aKy1OmzkcJUxDVNQ=;
        b=DVqp2a4lZUbZjjGMhdhCPClMUbOJWXbepDAhPE0Sl+EyXgwJQPXblL5D7oTfv3frTV
         HZdfVPnUcacoIJrJRJFFHcdy3g/OPfg5lxtXU4SBOVclL6Vj9q7LOGSuOTdsbhA1uUqY
         cdyiB6RfZxX2DmS66dJEXYfd/Ytfoha9x8U1ss9dhVZNr4/yLEBLgHsA7rQsMj4/6PMJ
         5od3zu13jyA/5ma6Z30NXekPnihllntGps/lRl+oQqm4VSL7/MMS3/vNp+9X4sD33Z7l
         rlI++0nFhCF+ciOinocV/j3Oy0weFFfxU6AfdPMJd0cWj2skthZUU3uheatU9MIvknYD
         pcdA==
X-Gm-Message-State: AO0yUKViKjYaJxsGPGMkq9rZS3Nrn/9XV1/EdT/k5LddiA0RoIGrn1YP
	a5VGfjFjx/y9Bw1m+kunFg==
X-Google-Smtp-Source: AK7set/jXbBcjuyv1m10lynYpyrfOghoXTVkbpUws5+s70kRjos9BtEeTkTxF9xl5t/gOkuwVLUEOw==
X-Received: by 2002:a4a:41ca:0:b0:53b:4b21:2345 with SMTP id x193-20020a4a41ca000000b0053b4b212345mr1650879ooa.2.1679506545888;
        Wed, 22 Mar 2023 10:35:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d18-20020a9d5e12000000b006994465665asm6524891oti.80.2023.03.22.10.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:35:45 -0700 (PDT)
Received: (nullmailer pid 3972017 invoked by uid 1000);
	Wed, 22 Mar 2023 17:35:44 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michal Simek <michal.simek@xilinx.com>, Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: i2c: Drop unneeded quotes
Date: Wed, 22 Mar 2023 12:35:29 -0500
Message-Id: <20230322173530.3971676-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_103549_229084_9A0C41A8 
X-CRM114-Status: GOOD (  10.79  )
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
index 199a354ccb97..26bed558c6b8 100644
--- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson I2C Controller
 
diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 4ac61fec90e2..243da7003cec 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/apple,i2c.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Apple/PASemi I2C controller
 
diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index ea2303c0e143..6adedd3ec399 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -75,7 +75,7 @@ required:
   - clocks
 
 allOf:
-  - $ref: "i2c-controller.yaml"
+  - $ref: i2c-controller.yaml
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index 2e95cda7262a..7a675aa08c44 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Cadence I2C controller
 
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
index 6e0a5686af04..f34cc7ad5a00 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
@@ -45,7 +45,7 @@ properties:
 
   i2c-parent:
     description: phandle of the I2C bus that this multiplexer's master-side port is connected to
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
 
   mux-gpios:
     description: list of GPIOs used to control the muxer
@@ -55,7 +55,7 @@ properties:
   idle-state:
     description: Value to set the muxer to when idle. When no value is given, it defaults to the
       last value used.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
 
 allOf:
   - $ref: i2c-mux.yaml
diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 0e88c85985b5..9f66a3bb1f80 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Geni based QUP I2C Controller
 
diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index bf396e9466aa..94b75d9f66cd 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -90,7 +90,7 @@ properties:
   st,syscfg-fmp:
     description: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
       Plus speed is selected by slave.
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
           - description: phandle to syscfg
diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 1b598638d457..658ae92fa86d 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Xilinx IIC controller
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
