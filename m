Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F7FC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6Aba1sdJy+OGSHW9dB2b4ikndiWH4XubLn4Bv2VVxw=; b=b28NeazbOMNDWV
	yudgd6caTYoueuXfvu5zSM6IIKHtWrYYvgn6Mrc2JkBUaM6AUhOcMpAKWTN7Lr29HHiDpKFrLdENi
	TQHeYbxp9msN/KW7R/jXUjvntcYaaT8HrJXb7L5sfIEWuLPTfCbhs3Y7SqCcmUXmOlTQ8D7f86k7E
	6miGbFtwVaTH/ZqlSeMVjf1PeD8OyCOlayBLH9StGx7ww2AgNvuRCAMwPS9mmnwpNty778MqtM8o5
	J85oXuiGA+upNQaOhrWZBtwXVx1BP7aCcNcQ21jODPU4wueaWkg1geZdip1cwdEeHo++vPHo4PEvp
	BeWy6bJQpZcrYTEv/CpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3Hn-004uEt-MP; Fri, 18 Nov 2022 15:28:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3HZ-004u09-D6
	for linux-amlogic@bombadil.infradead.org; Fri, 18 Nov 2022 15:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7Qzjak48onvnCHIqi2kskjNQJa4cnhoeUBqFHQSfxrw=; b=ozTvi1vBQj2lyVRBIFIj1i+Hrs
	orBuLlOiNNBCr2u3f8B6L64pnacMAN/2K7YUGNW/pt5jkh1gMZMuFwKW/Jo4Q3pmKROimaw1gcYWe
	30EjTISWd53g1G4F44OZMZA6X0qcfjmb3DyIdGEkT1bIjj76qF71Idnucuc9kgaHyHkgFtZ0EOE4U
	q+8ouYOC3CWOJ1y92LmER4R/UyCUMEugNro9/1v/Ow8ruO8xlNcdnsgXLvCJ+oCOS15JT2R5JDlMN
	krscDG/eJTX4zZlLdmVE03To3flpbjFcWOIyWHMialDF7AiZybFUqSLsrjhbdt1cQtNSYoEXmBDa0
	77nvp87g==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2R1-0020x6-Ql
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:33:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id t1so3741327wmi.4
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Qzjak48onvnCHIqi2kskjNQJa4cnhoeUBqFHQSfxrw=;
        b=WoIxPZXaV2xmPmlsdcYMuy75e8wj7YxygEJDeyFJuRYvaSZuCo+BM+ZgIS6lptguED
         6Q4DI+vXicHVpSH0ys0k0C+8ywXptFOovUmUq/F9p+OBHPJfLPJEpKCDtaz8TXQpANyn
         Jh/6vwM+KlLzoOcyXuEzeCK4kOskJdb6cbXgmMhGA118MXTFvffnn9J1BLQwJWPESm8z
         Oe/tZAVxiqB0gjMnr9DtoO4qxeMg1onsVy2xIqY7+hqxnrjoCr5DOJvn/8gd33vL+J0O
         szb/LpAQHIKrF8BUAvLpJyd/DufPcGycjXI4MO4LvzlY41RAOXUCYU8E4vUYC8Q4VppJ
         WKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Qzjak48onvnCHIqi2kskjNQJa4cnhoeUBqFHQSfxrw=;
        b=v/6tk0GQvw6QA/gvnk5dZMVGhU237Je+hHVb1rdaCQXp/k1oX4wPm2yPi9Vd2n38ha
         LWgcgm9uSI3LRWxUBtsOnZ33FsQ9evGOW3/xcgD7hRqQlrMjokQlxmCXegJikoV3U2ny
         gpy61kY/h0OcAE4smSL3B4BcNwpnsefrtYuqPWDdWBEyiJiLe/H9ZxM5DujvTzxKWqCy
         +V0MHCrxS7V331QU1JfFoH6ugUCOEt5D+0lWPt7pAgNkzkTQsxiCEJtQRbhkeyi95J0j
         0AtbFoz0g8YS/MaAM09r41CIhepvhVfdsmvVrja+uW9hlM3KhTQxDxy9rvMxMSf0ZzbE
         1mpQ==
X-Gm-Message-State: ANoB5pmKYPmPlr+8J47vBM/UkuUY97+91L6mjJsXHJS9H5Qn4ZYiXgC5
	hiVh6af81Z4JGhVoQbJ49jmPeTkISnwvBA==
X-Google-Smtp-Source: AA0mqf46pPv9j4tyn8Fg8etmwa/V9/hkHhhWrioukLTOudxO/l4ku0XMrj2N6O1HBZfXkOSSl4IeXQ==
X-Received: by 2002:a1c:7208:0:b0:3cf:6198:dd2f with SMTP id n8-20020a1c7208000000b003cf6198dd2fmr5142239wmc.119.1668782018095;
        Fri, 18 Nov 2022 06:33:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j21-20020a05600c1c1500b003cfb7c02542sm5436726wms.11.2022.11.18.06.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 06:33:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Nov 2022 15:33:31 +0100
Subject: [PATCH 05/12] dt-bindings: media: convert meson-ir.txt to dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v1-5-3f025599b968@linaro.org>
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
X-CRM114-CacheID: sfid-20221118_143339_985765_C0484445 
X-CRM114-Status: GOOD (  13.89  )
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

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/amlogic,meson6-ir.yaml          | 43 ++++++++++++++++++++++
 .../devicetree/bindings/media/meson-ir.txt         | 20 ----------
 2 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
new file mode 100644
index 000000000000..f8bc445b1f25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -0,0 +1,43 @@
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
+    enum:
+      - amlogic,meson6-ir
+      - amlogic,meson8b-ir
+      - amlogic,meson-gxbb-ir
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
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
