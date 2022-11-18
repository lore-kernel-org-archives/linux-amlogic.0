Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153D0C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=321e3IBKA3DJ2SkGpd5fbT2WlhddtyQ0rMbLPpkUZU8=; b=pEPSo6OuCTHeLJ
	4dJ6XYTXPLNKzWlw05sjs2eHsHlxmWwEXCwufnTlHJCCLgfprePfmtzIBSBJESmGOEYOcMR758ieM
	CM53LaxpTvaaa/h9niVXGnmoTOlp0hm+0x41nKgEtbSc5lXzSB6pALShFUwyHXZRGDG02s6OCCZdw
	zFcoAUcUvxdd1X/viC1hV2aedMNumfB+nBcWKjgOXL4m+yeb8XihMfMEdpyXjlKAPQ2JxDh9v+PMO
	gvnOlKkF1f2y7cyF58phKK6CMDrpRHeAv6B1zqjatobKtTJy8GGeXfoh5fX/UB0bqvFrFrE/gXLqz
	LWtVJwBndqax7057wZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3I0-004uLE-6I; Fri, 18 Nov 2022 15:28:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3Ha-004u09-Bn
	for linux-amlogic@bombadil.infradead.org; Fri, 18 Nov 2022 15:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=09aY4u5C18C95IeW01R0+92XJvP4bpZqONCKdfc3+Xw=; b=UtZJR6VjlLleMFCSdDZg5jmQZY
	H150ndN02bvky873+LeONmh4LQ0iRsdlWjgojWsmizfkj3ToZGiLf7AlfOOeGHwbmObcz/5ErcexJ
	wZJVp4ZsTzwlKN78MW8PFEoiXEwlNHg1PacmPTzDQIzwdhXu1aMHozNk7EiRVGelG9IpEw8/pntzQ
	Hh8D2htakIYSrJK8gMPPNGu0rVLUh5etqokxHYk5FSeux2vdCAO4RIpQHCRz8iL/G8yObPrDYqL/Y
	CfuXZ88NOmN8iuKtlweVKwb4ei9unAWs2tt6MPG56MN3xdHMV49dU1VlOJS8m7qpbV2iuQBNrACXK
	6mpo+/7w==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2R3-0020y4-AH
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:33:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id r126-20020a1c4484000000b003cffd336e24so2956314wma.4
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09aY4u5C18C95IeW01R0+92XJvP4bpZqONCKdfc3+Xw=;
        b=Hz6QAFCl6u3Xg9aZpvQtddO3JKE/IgN/I5pDQoSPQf5cdZwtlhLKb8TgdVwLTtOq9C
         UOycTp7N8Shc+QeRli8chI3ys0R3LIkynrk+6dbqocreNS22aR+fYFeMU5tnWDSnmlpM
         NpWRroujyOa4rO1bPwEKyUy59P0eLFtFVqP0ESM63wHz/aZ3t64uAA7JhkOPKdGqgRvs
         /IxKVbSoYISyxh72nb1/0zz0IIZJffX3c4bVbl4V3BZna6wHmeYqmvvOk1Iqil0d7y0J
         ObPOjfJPfHyw0AJBcg3VjRPMRT4BHp9sagQl/tyfZjyy1ZtJIjw2Dgx89wRI7YoZ/4i4
         jn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09aY4u5C18C95IeW01R0+92XJvP4bpZqONCKdfc3+Xw=;
        b=fOBOD5jSn3Ck4Q2IGNZa8KTAATaRUl9TSNccVOXPNzlKqph8xNP5XUcG/bibIpnIM5
         khN0PG1XToBaEahYgj09DTik5JemEYo5rXVG3AWtQlNEuRfbZjZ/QNolZK7eCbi2+fxT
         G6CYzWt/RJYClB0OBUW2UikXVfH+LGgLEMe6/7LNSFBtMRGq8i3uW1yRZ/b+AZFSAlMf
         o/AtMGnrDJ3qnMH5c8uDUsQg3qLmG+m4mlaLbsV0XQGpGKjlfqpJbbEOJ/pXFr2dyjQj
         cq6J1+BvsXK9eij6IEhbZDMbHVTzliwfysk5AIC++gt+q4l5c5+yH4ZPKS25qSAdVJ2v
         1qlw==
X-Gm-Message-State: ANoB5pm8WQWSV+P0Z9EV38S9soXSB896Xb9GF/u2KLCTyzoJvYFIp5UC
	dgDY73kBnYHE9izq/g5jZKwfYg==
X-Google-Smtp-Source: AA0mqf5j6wl5M3NRdgUjqO/lUfZMPosplhrqhTWjq9z76lGsnjGSOV4qyvFEj22qrrANUGlEr+SIfg==
X-Received: by 2002:a05:600c:3109:b0:3cf:5731:53db with SMTP id g9-20020a05600c310900b003cf573153dbmr8846282wmo.85.1668782019560;
        Fri, 18 Nov 2022 06:33:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j21-20020a05600c1c1500b003cfb7c02542sm5436726wms.11.2022.11.18.06.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 06:33:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Nov 2022 15:33:32 +0100
Subject: [PATCH 06/12] dt-bindings: rtc: convert rtc-meson.txt to dt-schema
MIME-Version: 1.0
Message-Id: <20221117-b4-amlogic-bindings-convert-v1-6-3f025599b968@linaro.org>
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
X-CRM114-CacheID: sfid-20221118_143341_473791_41BED588 
X-CRM114-Status: GOOD (  14.96  )
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

Convert the Amlogic Meson6 RTC bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/rtc/amlogic,meson6-rtc.yaml           | 62 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-meson.txt          | 35 ------------
 2 files changed, 62 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
new file mode 100644
index 000000000000..8bf7d3a9be98
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/amlogic,meson6-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6, Meson8, Meson8b and Meson8m2 RTC
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+  - $ref: /schemas/nvmem/nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson6-rtc
+      - amlogic,meson8-rtc
+      - amlogic,meson8b-rtc
+      - amlogic,meson8m2-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    rtc: rtc@740 {
+        compatible = "amlogic,meson6-rtc";
+        reg = <0x740 0x14>;
+        interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&rtc32k_xtal>;
+        vdd-supply = <&rtc_vdd>;
+        resets = <&reset_rtc>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        mac@0 {
+            reg = <0 6>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson.txt b/Documentation/devicetree/bindings/rtc/rtc-meson.txt
deleted file mode 100644
index e921fe66a362..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-meson.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* Amlogic Meson6, Meson8, Meson8b and Meson8m2 RTC
-
-Required properties:
-- compatible: should be one of the following describing the hardware:
-	* "amlogic,meson6-rtc"
-	* "amlogic,meson8-rtc"
-	* "amlogic,meson8b-rtc"
-	* "amlogic,meson8m2-rtc"
-
-- reg: physical register space for the controller's memory mapped registers.
-- interrupts: the interrupt line of the RTC block.
-- clocks: reference to the external 32.768kHz crystal oscillator.
-- vdd-supply: reference to the power supply of the RTC block.
-- resets: reset controller reference to allow reset of the controller
-
-Optional properties for the battery-backed non-volatile memory:
-- #address-cells: should be 1 to address the battery-backed non-volatile memory
-- #size-cells: should be 1 to reference the battery-backed non-volatile memory
-
-Optional child nodes:
-- see ../nvmem/nvmem.txt
-
-Example:
-
-	rtc: rtc@740 {
-		compatible = "amlogic,meson6-rtc";
-		reg = <0x740 0x14>;
-		interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&rtc32k_xtal>;
-		vdd-supply = <&rtc_vdd>;
-		resets = <&reset RESET_RTC>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
