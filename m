Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1717C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OafjA7l0j1zc0QxZPIkVCMA7B5h4S58qqa0YsHZ5pyg=; b=o39QeqVBWKzqNg
	fYLSXVKvmQEyDsyfKxcSRWZXNKDCjd+GI8N/oqvWoBipapfW6BI8Vq6wqXxlbXI2Do1qsd5gc9F3V
	KHbFLJnRy4FitCvJdzY6fJkPlJ9szBGSP32YQMlF36cRsydUkd16FxKqvCYwoapMR9SRJaVUnjO4/
	v0q/evaqBuBQ5g2QRZz32VGTxIo1BqY05XFI64dp8h0sAYB0a6ZJeb1jAtNSNIFwYw2pqUY4YE2Fg
	/69NSOGNO76V0CoMdRaWn6mu0H5S/Tl6bYiVLrq07wumCdat2VKuX1JtzFT9MX+EFAz8wX7Ph3wDD
	vpE3k2mt2adxGyHo3JVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9fs-002VKQ-50; Wed, 19 Oct 2022 14:04:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9fH-002Ult-5O
	for linux-amlogic@lists.infradead.org; Wed, 19 Oct 2022 14:03:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id f11so29299319wrm.6
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Oct 2022 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtbDoRjweNPW4Ln3XA0uH8TZxjs8M3GoYCD7q6OX0gg=;
        b=pFzXbv7iB5TKy65HTPwKNi8Oya6dNVjlMeKCEG7UrRmcI/W8WpO0ouDDkOdT8BW7Fg
         HKwGZRZTy5zd2embkHjvTncf7YFv2OzUHfzw7wz6O92GFHaPyWhWyhRwMZ6BBGuZjHD6
         1t1VV8ZvdTPHDfcObLjZauweQL/2aig1HZ/KpSUYeMjb/8ZKdJ1Wnm1mq9/umctrrj0X
         dDEfpAUSB6IOT6lVgCuzpHTKdaszY6zoM0LHGXPMeVLboMNGe6I2d2vaBEBSYnSO1fXq
         V6D3K/kq57dW1QsaXmiozYGmZWeeNi57wPKnd25DgeDG8KVBRz8+ZPzwD8XiKh2eWxxs
         blXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtbDoRjweNPW4Ln3XA0uH8TZxjs8M3GoYCD7q6OX0gg=;
        b=cimzVuzN604qb8C2R6n4Pzm7FSMyKHf122yMXivbSWGphQoS7qYsKYDa02Jk24yUMp
         wsWFykA6de9pmYZiApmfE9BbrvI5y+xlnmRq6VzvmNP9hT3tdVtQZOeagflg0rqp6p+O
         cqKLinjH5ebpDqNZhuSfsypbOZ+4GI9HXa7R2aB5NPi71pgAeqQEoC/lG5to2hLI+1QN
         DqXV4p+HsCgr5gqDOQAydcvcPorHHWXDOPHJSbl41kprxBeHv42lmZYLMn0CEY0LMUW9
         3snUMJbd9zo/jRN18MMjeklPefS+U8bA/VsjW8RxlkAGeTgjsnPJhQopf6OTWrfb/yd1
         YQBQ==
X-Gm-Message-State: ACrzQf1QkwWMg+L97aX54rRCHBzUue3V/yS6leEr56MmCmEQidxy8sq1
	z7oyE32S3Xpo2LbDIkx3Op5IXQ==
X-Google-Smtp-Source: AMsMyM4PoFChrXbfrLxZbzq92mgQzakedpnzjlyjEb5hURpT7zijiVTXcJ/Kboaxwj3vyHDTY5FAXA==
X-Received: by 2002:adf:f001:0:b0:22e:4f85:3abc with SMTP id j1-20020adff001000000b0022e4f853abcmr4942257wro.107.1666188198769;
        Wed, 19 Oct 2022 07:03:18 -0700 (PDT)
Received: from [127.0.1.1] (rtr.23.90.200.126.unyc.it. [23.90.200.126])
        by smtp.googlemail.com with ESMTPSA id o5-20020a5d62c5000000b00228cbac7a25sm13998628wrv.64.2022.10.19.07.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:03:18 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 19 Oct 2022 16:01:03 +0200
Subject: [PATCH v3 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names
 for SPI signal states
MIME-Version: 1.0
Message-Id: <20221004-up-aml-fix-spi-v3-1-89de126fd163@baylibre.com>
References: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666188196; l=2316;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=GT6aksNJPuRsH4QN0MrP1Ih2mkD83njM/kpnUgJ63XA=;
 b=ixcAkOk+adBdqxmgoxXlgXIVeDQnfg8RbvllBQ1SFspcrcB6O+ZI0+0K4uwlL2TcFbxZu3FcKeOF
 H7ly++vKDGHx+MCSN/UhYp09gxpJlU9dBFr2Z+0tt8yyV6TycVaP
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_070323_294286_9A7B4A0A 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
pin biais when idle. Therefore define three pinctrl names:
- default: SPI pins are controlled by spi function.
- idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
by spi function.
- idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
by spi function.

Reported-by: Da Xue <da@libre.computer>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 .../bindings/spi/amlogic,meson-gx-spicc.yaml       | 67 ++++++++++++++--------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index 0c10f7678178..3e47fe7760a8 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -43,31 +43,48 @@ properties:
     minItems: 1
     maxItems: 2
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - amlogic,meson-g12a-spicc
-
-then:
-  properties:
-    clocks:
-      minItems: 2
-
-    clock-names:
-      items:
-        - const: core
-        - const: pclk
-
-else:
-  properties:
-    clocks:
-      maxItems: 1
-
-    clock-names:
-      items:
-        - const: core
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson-g12a-spicc
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          items:
+            - const: core
+            - const: pclk
+
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          items:
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson-gx-spicc
+
+    then:
+      properties:
+        pinctrl-names:
+          minItems: 1
+          items:
+            - const: default
+            - const: idle-high
+            - const: idle-low
 
 required:
   - compatible

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
