Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ABFC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6cybNNQ0+Xgxt1bgjFGbzW5hytrbkYcnfBlyhU4K+M=; b=GVaIn36wVTNtvy
	fScpmintBG6Yvna6fO7KXgJKdwEgMU+IZhp5d2sDTfy+ILJwcShE1CGZz2UWsNIdPou4QWTeYweDX
	oJR+MB8qxbT8p1dHZvYJ39cDhHPw2ssadnL8FwNBhwPhEIVB3W6Uu/vkhADnWRXqMAsxjPTTARHUI
	JzAMLojPQ2k3NOJFAtU3f7kRfz+usVFm9Q3RzorJmzeW0VOYAU9u3C/bCkQ/zcmTHB7hqeaQ6oVQd
	vGHas42lCrHMV+gvO42U9b7MnughyDiwguPOYq2s4s5t4yr6/xbJyRya6Jz/pCQwHklzMvnEKIJWk
	er2eY6XMokvGyA6wkKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols82-007zbg-5B; Fri, 21 Oct 2022 13:32:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols7f-007z7X-IZ
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 13:31:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id bk15so4788539wrb.13
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 06:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoI1kmxKiCSvzrZsjQ9wHdmyYSYZCsE9cQztwvc2mq4=;
        b=QUdSggw5HJ3x/21fCA3VdACtz+Zu9LZs/XA6elyv5wXmHRAZeOvrqBz0Uznlx9pjbk
         Mb3zQOPwzpHpLqIFstvXZqXO+hGxwApE6qzu7m4zVOz8XuewHllKIjsV/Y31V08gpZO6
         zj6Ek3OfXF6oHDMuhEgtjD1inlrUsO0bM8hmX9w/bFAOFKdWb6WGvB5X88lK6CshMjUy
         0ircy1XXcquXrwhOzYIA7pg9l692xBxj6lZ4DQrPwMoOj988POwjvUyXZX+j9OTOw3lu
         JGJRn3dxEJvT5SzY1TZ/h8Mc7d3BUqsD2vD49mtd9/jzs9YVCja3yPximUNryWjNrOK/
         qSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoI1kmxKiCSvzrZsjQ9wHdmyYSYZCsE9cQztwvc2mq4=;
        b=1qgGbSWbnwA+HMF/+G5+6SbvXOTzo6a+Xt/QndA0HLxhlFhQhHL9AUUVnJ4hZYT+FL
         lBiMK4bD83s4YF3pHSYe/KYsQHG+AkKl5RpSqibk5TljVDEEGJFHBZkTBCUs4wbPkXQG
         Ji/WqXOLNU/m4QrcSwz7pdHAbkKWaP8oOOwynzhyyENDNBy/A4q6xbEPnNHbFUYQur6h
         QDtH874KssLWPrOHp5Ytk35/PCYXRO1OZNdeOJebIjKix1M+2QIg5Js9O9I0Ho1yXvmU
         tKaPV06qS/N9kSgbUNDGtBfX0pn3aJAGSpYsJF2XnswZldQbhUbCWUCAhGqZ4NFiChUb
         QZYQ==
X-Gm-Message-State: ACrzQf00YWMAKpTXL7Am3oWRixG2+gBvn2vc1UUXLApy+6ujkcdrpy5g
	WmAH/9vvdCsBKzmSpjmkzWUYrw==
X-Google-Smtp-Source: AMsMyM4IOU41jEZl1kaH25EzaO3Tl6/9Oba6qNk5NEBn3vVq/JVKjVSFxwxiDCNcpjB4w0X919Wejg==
X-Received: by 2002:a5d:58ca:0:b0:236:2324:3f0f with SMTP id o10-20020a5d58ca000000b0023623243f0fmr5464669wrf.325.1666359097401;
        Fri, 21 Oct 2022 06:31:37 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id j8-20020a05600c1c0800b003c6b7f5567csm10325280wms.0.2022.10.21.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:31:37 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 21 Oct 2022 15:31:25 +0200
Subject: [PATCH v4 1/4] spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names
 for SPI signal states
MIME-Version: 1.0
Message-Id: <20221004-up-aml-fix-spi-v4-1-0342d8e10c49@baylibre.com>
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, Da Xue <da@libre.computer>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666359095; l=2772;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=YwA+sHh1oNU0ILalfPfygNyaqm+7p3kzynT8plbgjZM=;
 b=BGhgpQ4vXKhBYPR0FF4G20VfKU5D9cT5w4SDni58JwcnXH6N8b1jaWuf4JYT7enm+p4gwNRkiAwA
 fSJpzhrjDBdl8xybmq0EbFia14LmXlQqgMte20+x0ClV0q2aHZsR
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_063139_636236_1F978AB6 
X-CRM114-Status: UNSURE (   8.36  )
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
 .../bindings/spi/amlogic,meson-gx-spicc.yaml       | 75 ++++++++++++++--------
 1 file changed, 47 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index 0c10f7678178..53eb6562b979 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -10,9 +10,6 @@ title: Amlogic Meson SPI Communication Controller
 maintainers:
   - Neil Armstrong <neil.armstrong@linaro.org>
 
-allOf:
-  - $ref: "spi-controller.yaml#"
-
 description: |
   The Meson SPICC is a generic SPI controller for general purpose Full-Duplex
   communications with dedicated 16 words RX/TX PIO FIFOs.
@@ -43,31 +40,53 @@ properties:
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
+  - $ref: "spi-controller.yaml#"
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
+        pinctrl-0: true
+        pinctrl-1: true
+        pinctrl-2: true
+
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
