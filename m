Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68850C25B50
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXn6QkBCcfMFtmjixKXh5sugjhPKqLIFIfEyw5xxYfA=; b=xdwtUPyVt/8NK+
	WoIj3Ro238TfzrYLbtKmI5OD9w2g9YC3JfRD/WiTxaIo7x/BnXuwxBwXBdrj6goRssAlxnBEPTJFU
	63KiCG4cVHjT7Vc92i9lTIWUu4zVta5IpybNqp5BA3kfy01+VxRaWNnkGKTw0zVJuNRSJQaRp8mpa
	C6cn1uLk5AycSRYcwqpG/YeR0c6o87VDSaak9jzyMYSvhlhApSJv7IB11PxUbR2u5HIJ+vrSxTnfj
	7WZSOmIi2nMY+2OjklwTzc7m2zTk9uOleIySWO6bIYJPTt8ZIlUqf3Z/2s8ATaKkj4OwcoFWvJH2I
	Bp/Mu9spq+/XaqgLLzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtvx-00Glcu-D9; Mon, 23 Jan 2023 10:20:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtm8-00GhP0-PV
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 10:10:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id z5so10255625wrt.6
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 02:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmEi8wNJscjPO+bec5z+80AcbDQKdl+RtO68ZSQp6ss=;
        b=ndSG6YwuKGUm1NBBI5B2jrBEPmsadx3GhgXVtdQLFuTTIKzv3a+092eRqnmoizygnu
         6K2WY8xrHmMdhe1zjHYD5rxceTGCddHjU0Uutwbumopsv2JgOzB+sftmjkobCnwRGKNS
         yOUEaWRKRbcpFUh1Kp57/juCnhSaxbjSjYdoeasNcT16mGwH14TDfXipkSPrZcjiQCdP
         7mklc2riDlU3X+rN5zPycg2zIZ4+k5+Ss5EnCYwyZq3AGZaN56GtxGg0/z71+dFOLAhB
         fRYExkqmJuM63t2yQxToWbBPMz6lTGD3lZEFd+F7oO2FV0baGA6f44+gmDl4TSjB7Jsy
         Hjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmEi8wNJscjPO+bec5z+80AcbDQKdl+RtO68ZSQp6ss=;
        b=Nfa8WdNtld+Cv5L57x1w0Mz8yjRFQdoPgiScWrEnqCHbXkdmVph7Pdhl2n9Dzrb2S6
         /yCFObUKMQhs7bR7NSm73No4/PV0o7rh3grGusPIKBNwVg9tzOhc9LCUTnuth8anpgPY
         0ZLtNWG6zxULAdW4HqU4gWnkO9JxXz8J6jTAMFEnABhtPGLi47Z1YUPQRC9ynVIWqOph
         6XN7xLw1xK9xTxMNDMvlIxq27e9F2RfgD1KaJuf0MXdeKdL/6/Acrc+VVRWrq2Fwmfno
         CbdgYLLsCIg3PBspuwHmKOvl2mYULo0pPtAkLhWQAP7or638iD/4ZTD92YU8GzST64Zq
         Mg7g==
X-Gm-Message-State: AFqh2krGAEWW1RAERVKGcBzNHdCXzwO9O9kcY5c5xKVqMdzSoJW67ErT
	NNWVPw0Uu8uMN5/2kmuACvup4w==
X-Google-Smtp-Source: AMrXdXvD0HP5hamztDDRdNXHMoglhMKY7c9LQN2DMC1tyUK9QXhaL4t4ntooZHJ90+r2HEQwbTQcdg==
X-Received: by 2002:a5d:4e04:0:b0:2bb:31dc:2d62 with SMTP id p4-20020a5d4e04000000b002bb31dc2d62mr19830641wrt.67.1674468601723;
        Mon, 23 Jan 2023 02:10:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m9-20020a056000024900b002bdec340a1csm22670403wrz.110.2023.01.23.02.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:10:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 23 Jan 2023 11:09:58 +0100
Subject: [PATCH v3 1/7] dt-bindings: nvmem: convert amlogic-efuse.txt to
 dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v3-1-e28dd31e3bed@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_021004_964845_77DC6F5C 
X-CRM114-Status: GOOD (  13.25  )
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

Convert the  Amlogic Meson GX eFuse bindings to dt-schema.

Take in account the used variant with amlogic,meson-gx-efuse.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/nvmem/amlogic,meson-gxbb-efuse.yaml   | 57 ++++++++++++++++++++++
 .../devicetree/bindings/nvmem/amlogic-efuse.txt    | 48 ------------------
 2 files changed, 57 insertions(+), 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
new file mode 100644
index 000000000000..e49c2754ff55
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/amlogic,meson-gxbb-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson GX eFuse
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,meson-gxbb-efuse
+      - items:
+          - const: amlogic,meson-gx-efuse
+          - const: amlogic,meson-gxbb-efuse
+
+  clocks:
+    maxItems: 1
+
+  secure-monitor:
+    description: phandle to the secure-monitor node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - clocks
+  - secure-monitor
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse: efuse {
+        compatible = "amlogic,meson-gxbb-efuse";
+        clocks = <&clk_efuse>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        secure-monitor = <&sm>;
+
+        sn: sn@14 {
+            reg = <0x14 0x10>;
+        };
+
+        eth_mac: mac@34 {
+            reg = <0x34 0x10>;
+        };
+
+        bid: bid@46 {
+            reg = <0x46 0x30>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
deleted file mode 100644
index f7b3ed74db54..000000000000
--- a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-= Amlogic Meson GX eFuse device tree bindings =
-
-Required properties:
-- compatible: should be "amlogic,meson-gxbb-efuse"
-- clocks: phandle to the efuse peripheral clock provided by the
-	  clock controller.
-- secure-monitor: phandle to the secure-monitor node
-
-= Data cells =
-Are child nodes of eFuse, bindings of which as described in
-bindings/nvmem/nvmem.txt
-
-Example:
-
-	efuse: efuse {
-		compatible = "amlogic,meson-gxbb-efuse";
-		clocks = <&clkc CLKID_EFUSE>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		secure-monitor = <&sm>;
-
-		sn: sn@14 {
-			reg = <0x14 0x10>;
-		};
-
-		eth_mac: eth_mac@34 {
-			reg = <0x34 0x10>;
-		};
-
-		bid: bid@46 {
-			reg = <0x46 0x30>;
-		};
-	};
-
-	sm: secure-monitor {
-		compatible = "amlogic,meson-gxbb-sm";
-	};
-
-= Data consumers =
-Are device nodes which consume nvmem data cells.
-
-For example:
-
-	eth_mac {
-		...
-		nvmem-cells = <&eth_mac>;
-		nvmem-cell-names = "eth_mac";
-	};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
