Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9A1C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 14:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsKbrPs3S81dOW21Esq4ls3vpuC50b4gRNAt11MfBQE=; b=G1kwyWsmFrPxPd
	BOiw+DMGN4L/Lv8dvvohiGr1NiFasI+qXbDt95aoPDe5mrXlRSGgJR+c3uGAnULCTjhxuUaUw25Ni
	4aHQCKHgIdqOvRo/NYD5i5vPpHuHiPWvLYSAHm+5u6j5tftFtFLSOtZ99o/PILf0giZ7Ja1bYTknl
	kg9GUC+SP4HLz+MR17OtTR7tLLOGeC76rG7jWtMGHJRWnBd/GsaNm4gLQWJZxF8/V4ChJADdY5fmq
	A8yW5tqLmXwra83xxhiPZCVIShgego16t5JMZ0colQFiylFG4kiVIkNvgwI5kn19Vm42lkZd4iI5D
	K76Ayl8qkZSLEycFLGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2SU-004UUj-7L; Fri, 18 Nov 2022 14:35:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2R6-004Tbd-HZ
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:33:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id y16so9491403wrt.12
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+959Y5+XNaVCC9GiYukZyKg53qWkxIcg2rooGUoYxs=;
        b=YSNhB9fk95FVP8eq+MinfzITNvsGPTw7J/BfOAnCA6MRKMZfnjmjw9p0/GKJYPgLgu
         9Uf3MLZ6MeHhpyDqphm8PgmMbOmI9M/f+OzOpVjM43Nv9m86WVCmGrOj3l0tGB+1v4t9
         E55zg742HdjX3I8Xez3VNhN0tPDng4BOl+fLOTvBMcL27QGtZ2ILefS8PazePVfQle8N
         y5zWv0VxBqSYKmxV91YmcyduS6mo33+3c1BFDlnM3XuEmnbuSXpdI+vZHZN2DMvAYLH/
         DOifHgLjWiXg9pIpOeFLg9R+b1hj6UykJ86b/75uNd67UTOdRulhaB7c80oFGVdcUp/y
         +K2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+959Y5+XNaVCC9GiYukZyKg53qWkxIcg2rooGUoYxs=;
        b=YfsmDb7CR/NeV+RQrOqniqZaFdpqxkXAOkDCCSofBvZKZA/h0psgM76ejhFP9D10HA
         Adjr6/gWoLQYJAbdWo8FOXaaXMCUcSrDqrhZsELcD8EqgpUCzQNdYJUiQ6mK055A31hC
         02yxuCYmQQwIfhsywBFCy0ti3GQn4rPpmjHrUhbF5bYLjqIvBlkJvGlHJJkOpa0jvEuh
         RBDBR8Ix87bq48uxKHo6iEQTgjidRglHztZts50b8g5J2X9o7sHPSUg4EIlw3eybq7X9
         uxo+4tVXoPhrJnSOc7d41t0b1cOTyiZ7MMdQ5LaGpjzsYx+OBfCZAO00a2Muz/+S9aGA
         L/eA==
X-Gm-Message-State: ANoB5pnacOLYJFVhuqEHZ8cfMJLumpupn4hFPfyWp4LAtk1ZbKmYIjKH
	pnpqGN6SRMx44Yf1TbsxKv8m3g==
X-Google-Smtp-Source: AA0mqf6kIg/NB07SkdVixNMP4pENqPKYVFH1VHQ4hmTwJX0k5brwWTGOjQC+G8oF6LOfXK+X71xZ2w==
X-Received: by 2002:a05:6000:884:b0:241:b92c:6d73 with SMTP id ca4-20020a056000088400b00241b92c6d73mr3938192wrb.242.1668782024045;
        Fri, 18 Nov 2022 06:33:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j21-20020a05600c1c1500b003cfb7c02542sm5436726wms.11.2022.11.18.06.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 06:33:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Nov 2022 15:33:35 +0100
Subject: [PATCH 09/12] dt-bindings: phy: convert meson-gxl-usb2-phy.txt to dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v1-9-3f025599b968@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Alessandro Zummo <a.zummo@towertech.it>, Eric Dumazet <edumazet@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Cc: linux-media@vger.kernel.org, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_063344_679182_A7428DCC 
X-CRM114-Status: GOOD (  13.87  )
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

Convert the Amlogic Meson GXL USB2 PHY bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/phy/amlogic,meson-gxl-usb2-phy.yaml   | 56 ++++++++++++++++++++++
 .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt | 21 --------
 2 files changed, 56 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-gxl-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-gxl-usb2-phy.yaml
new file mode 100644
index 000000000000..4dd287f1f400
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-gxl-usb2-phy.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/amlogic,meson-gxl-usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson GXL USB2 PHY
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    const: amlogic,meson-gxl-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: phy
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: phy
+
+  "#phy-cells":
+    const: 0
+
+  phy-supply: true
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@78000 {
+          compatible = "amlogic,meson-gxl-usb2-phy";
+          reg = <0x78000 0x20>;
+          clocks = <&xtal>;
+          clock-names = "phy";
+          resets = <&phy_reset>;
+          reset-names = "phy";
+          #phy-cells = <0>;
+          phy-supply = <&usb2_supply>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
deleted file mode 100644
index b84a02ebffdf..000000000000
--- a/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-* Amlogic Meson GXL and GXM USB2 PHY binding
-
-Required properties:
-- compatible:	Should be "amlogic,meson-gxl-usb2-phy"
-- reg:		The base address and length of the registers
-- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
-
-Optional properties:
-- clocks:	a phandle to the clock of this PHY
-- clock-names:	must be "phy"
-- resets:	a phandle to the reset line of this PHY
-- reset-names:	must be "phy"
-- phy-supply:	see phy-bindings.txt in this directory
-
-
-Example:
-	usb2_phy0: phy@78000 {
-		compatible = "amlogic,meson-gxl-usb2-phy";
-		#phy-cells = <0>;
-		reg = <0x0 0x78000 0x0 0x20>;
-	};

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
