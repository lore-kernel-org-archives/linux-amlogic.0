Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6573FC5479D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 13:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjwWMsNunjErb7ixLsBgb3jHFfajOvnim4edRhqTMR4=; b=fb4hJwKypjn01c
	NTAGl3LvVRMFq8//3CmYMWVAjynbYJffgen482rJp/dLU8pyyN+K1bqk/fu0TwegmfHskS296tB2L
	/Fjj7WZx7QivohD+yzxOPr6P9xIvQiAR+4xM0c1X06ml6Fuy0m4LBjWqbYDI3czrjNdTiqPe8ac8f
	4fVi0bSZsK6rBXreV7B9vCXnpILjnZ5tfq0C/qonSSBFSKSjQDgcUamzz+AD2C0KGQegvubF04AmZ
	HBuYGrK9/WywqFGg42HrGL/oOPYjo3YEksjjp+mNAEzYu3BznSAEgb8tlvlejFjyQXzXy48ECJ8ZU
	/kZCppEd6z3f3Iuk0m4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErzk-001UkD-0t; Mon, 09 Jan 2023 13:15:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEryY-001U9d-Ug
	for linux-amlogic@bombadil.infradead.org; Mon, 09 Jan 2023 13:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GGsfIAFzoH7ggFb2voxRa7ZKIwz9PZMg5nKhBB1/kDo=; b=KApakorou64LXcBaSpVNHhzn8w
	t11oWXfqDnjy0PuGNRzZ/3T+7VlIjmnaCRIHxaEnziFu+YRmjxturP8x83livpkfqfQE6CVImPg1q
	pWA8bmcNR4R0BZicUXN7KgSL5ee3FJ25HsMw+4wE6Z8WiNXsITKAuWdN6OeXFzy/WyevshZV8j20l
	ZA9NGb5/P5aIlGps1U1OQvHsncb89lrGXwwUEKzrz9hVJ61DTWQkWqzh3CPfGag2T4PPoZgXtRnsG
	9hPuov2uE7c5WSdFxtSbgXF8P5AKngodIEnXHx5wtE/zMjvAn8dSp8m7EXADknKujbiN/IrPHvSso
	jDv3NGQw==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEreg-002jDs-1F
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Jan 2023 12:53:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l26so6178926wme.5
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 04:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGsfIAFzoH7ggFb2voxRa7ZKIwz9PZMg5nKhBB1/kDo=;
        b=z5gNcqLJBYobEGNLqbeCjCAoRvI6N0EkNGB7H6G1yD1PxLGCRCMLm4Gz4V/FT3amV1
         q9EUbcnvEt9hP4RrjbiTOVAEnxtKfBOvaecmIDRaAIXlDFQRh19h/cHXbyZ2afMEScqP
         oKknYvdvQVzjfVxOiHVO/YOGsDGKTMeE3NZ2X5W1QjixQWr8tB1hHsI9XN6CHZe7NLDA
         t8KHchtoA4WwY3HJHXRLpCDhSTwu3DQQXqCDsgOASjyEz7KWxIyiU8NwLvL5oHBgRQT1
         HwK+ONcxqvC7BNRHCTC5o+J55xpWYHpSMmmbMufee+LcKHs89mmysgfObw+DfeC1aBB3
         oZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGsfIAFzoH7ggFb2voxRa7ZKIwz9PZMg5nKhBB1/kDo=;
        b=lt159kCwCFlxv3YygwTuph3E2zrRzp2mCeupXVJeR1PA1qi0qc9aJzXGmCXoFWptqT
         MbN8MoFw6bjiss0vvHZFYhNEcNQmkmQqqqd90xqLBjZxRgvLcSqx9COBw9W6FT4XKFmd
         jS0l+DnX+gNZ/9r/9MWPQuUuujcxUqvIXDHdkIo0dfs7EGO58jy8rAjjcK+lQd+uOoXv
         4Q7gvrJY0+dIZBnUnLhS/upHC3YxnUxUKG17GD3tAUStUu9515R6h2p4/pqQMjvgHYcQ
         F0DPQxTtdaGP7SUUemMF6e7YcxZT+niiSCrE5APneT/MbcVHgo1Q0H/dzHeCKbHTf2tE
         ryzw==
X-Gm-Message-State: AFqh2koYk8I8+uDbrmigVGFwrfOdeeVjeHdJpjv7HrlhO6GLL/w+z02n
	z/BkErV4IPov+3lpCfM3JzKmag==
X-Google-Smtp-Source: AMrXdXtdPYhHUaCl+iEvPcgDarKLArcUin1VypOwrhRsxqtGFwclSBHHlL5WVmJxrAa2H2QuyV3s6A==
X-Received: by 2002:a05:600c:354b:b0:3d0:4993:d45b with SMTP id i11-20020a05600c354b00b003d04993d45bmr47720065wmq.4.1673268818448;
        Mon, 09 Jan 2023 04:53:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 13:53:29 +0100
Subject:  [PATCH v2 05/11] dt-bindings: media: convert meson-ir.txt to dt-schema
MIME-Version: 1.0
Message-Id:  <20221117-b4-amlogic-bindings-convert-v2-5-36ad050bb625@linaro.org>
References:  <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
In-Reply-To:  <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_125334_515144_940DB978 
X-CRM114-Status: GOOD (  15.53  )
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

Convert the Amlogic Meson IR remote control receiver bindings to
dt-schema.

Take in account the used variant with amlogic,meson-gx-ir.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/amlogic,meson6-ir.yaml          | 47 ++++++++++++++++++++++
 .../devicetree/bindings/media/meson-ir.txt         | 20 ---------
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
new file mode 100644
index 000000000000..3f9fa92703bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,meson6-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson IR remote control receiver
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: rc.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson6-ir
+          - amlogic,meson8b-ir
+          - amlogic,meson-gxbb-ir
+      - items:
+          - const: amlogic,meson-gx-ir
+          - const: amlogic,meson-gxbb-ir
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    ir-receiver@c8100480 {
+        compatible = "amlogic,meson6-ir";
+        reg = <0xc8100480 0x20>;
+        interrupts = <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>;
+    };
diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
deleted file mode 100644
index efd9d29a8f10..000000000000
--- a/Documentation/devicetree/bindings/media/meson-ir.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Amlogic Meson IR remote control receiver
-
-Required properties:
- - compatible	: depending on the platform this should be one of:
-		  - "amlogic,meson6-ir"
-		  - "amlogic,meson8b-ir"
-		  - "amlogic,meson-gxbb-ir"
- - reg		: physical base address and length of the device registers
- - interrupts	: a single specifier for the interrupt from the device
-
-Optional properties:
- - linux,rc-map-name:	see rc.txt file in the same directory.
-
-Example:
-
-	ir-receiver@c8100480 {
-		compatible= "amlogic,meson6-ir";
-		reg = <0xc8100480 0x20>;
-		interrupts = <0 15 1>;
-	};

-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
