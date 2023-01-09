Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249D3C54EBD
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqIWlizS+5cWB0xpptDs0eG1IL7qD8TzkEW+pEC5MwU=; b=SvmXLXqjrLyvGq
	dM3Ruv9oHP9+ypudRVsVI1Ov6cBrmQ8B17k1hKHAoSzdLd+emAsJ/YVSvMMQeQH29lfZNAmn8BCuN
	ss0vKQ7ILGuqk3xFDx88IPKJTE6hC9r03tOltPjY9dxut2SkKqPpfK66/YfN/yz3XvoOZmuIwURHu
	43iRXBlymcgk/knKjTko3kQU8/XfuzYEC9mHCkUZ6Dc5o7V4IpAm3LC7NvBL8NEPOIXnqftrGiCdw
	iaWFdJL5ciZcIna6uY5XwtSE1iAV6hhu9fxS02/o6NaL2pmMHH3hPgLwfzDiqw8uUp2req+JQo1J1
	lr0WCgCyYpCLhTjIbjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEryu-001UJK-EO; Mon, 09 Jan 2023 13:14:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEryW-001U9d-Uj
	for linux-amlogic@bombadil.infradead.org; Mon, 09 Jan 2023 13:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qRoLsjyY/qf2Mb569g+NlHCALe/agKv6TWaWZecCXbM=; b=hY2S2TulTdp9I/hVUvFxosenfM
	LXrTBxqtdMIbdxCPH2tNy0ESAXZFxypWV9SIxkGk1RPlyVOHf9lR7VJTut08DgpO25u+xUulxYGHk
	9zsus4hQigyqxIUnyGIqzX+LTnpU82oxooNL/hy/UF/vUyCsd3wT09HfndmJ/4b1OfaHrQQEI8N/E
	QdOTCJ4Z/ZdASfQYRqBZxga3nBn6AD0lPUnUH0KpyFmFDuPTgqSgw78H4Gbca3ZOocKg3O9/Dk3WE
	S+BIAVigBQELCX63gHlM9AAfAtS23rG0zrzmAAJVy7Ns7WWgOyl5Q8e2dhAvz8MGQOwt6KpGdrAia
	UbIMmaXg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEreg-002jDk-1f
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Jan 2023 12:53:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id ja17so6180148wmb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 04:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRoLsjyY/qf2Mb569g+NlHCALe/agKv6TWaWZecCXbM=;
        b=PtAZ9sogJ7D4ak5aTWeShdIBpAojseUr1St7O+JcXvW9KypuHN2Tf5W1eVB8HsoPF5
         Qc5AYGcZBGHgvHxrR3P6gpgTinKrkUnuy5LEDPE03vAR78m1vUv3J7o9Zs8EkLiokWFG
         C5+WI1eABYMDkQ5QEoKydR/Me0T2WGlkuMYQfCLahG/XOli4iTy+Rn+agbzFJXwgJjhY
         fQR1MEQz3dhs6YPpglpZflbvBSoAWJOLMZKoVKR9KOP9UnbpyVI8cbcw38XnxxrIevb5
         gAPqB1nL5xVr+w5BIPh5+EWDCP9351eyJjxkEPdFQmPvKJPhGUQwh+0uzz7LAv35bZsI
         uYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRoLsjyY/qf2Mb569g+NlHCALe/agKv6TWaWZecCXbM=;
        b=4ewSgbRSGo8giQhnpfDLLY5HSYTvxMCGs6n0ngcsla6S6fwSIMpOeccmsUN0dm+jpg
         QjV4i5XhI5Pif+MyzYD4fCmDxIMkXrkHI8bzn5jcjK54qO3sSZ7DckoEDhsMlDKsujZV
         fGkHHSFb/BHGiRn1/D47fiwVu+SPOm/gEuZDj1Wwp4eX/oZWB0u64D/OViJgb4rAZ4MJ
         1H1vml2ML4soVyxI1BIxJbg+Ja3MFxi30DQlQJoJUPlbSkf/tbOEMjDT+yuBSQPpVDHy
         2x1f7AlsCc2/1H1T38YsXAEE+Ro6eOVMn/vo/kfkWOBC9QIy0XlpR0vusNROAGheJD74
         gDNQ==
X-Gm-Message-State: AFqh2kp9SVR1D+ZHcGPd5ZHdH32f/LoTKDbcGMiE6ZntfjM2t+CVcOPV
	3Cku7uAa1BlN60G21tBh2Ev1Jw==
X-Google-Smtp-Source: AMrXdXv0Bdf0Epz6SrHpPBay5WK9tEtRPRH405V8jHfx2VRO9KsOFVi+7uQvyzocCrT86ySajHKxRw==
X-Received: by 2002:a05:600c:d2:b0:3d2:2b70:f2fd with SMTP id u18-20020a05600c00d200b003d22b70f2fdmr47240724wmm.21.1673268816880;
        Mon, 09 Jan 2023 04:53:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 13:53:28 +0100
Subject:  [PATCH v2 04/11] dt-bindings: watchdog: convert meson-wdt.txt to dt-schema
MIME-Version: 1.0
Message-Id:  <20221117-b4-amlogic-bindings-convert-v2-4-36ad050bb625@linaro.org>
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
X-CRM114-CacheID: sfid-20230109_125334_669332_90598EB0 
X-CRM114-Status: GOOD (  14.97  )
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

Convert the Amlogic Meson6 SoCs Watchdog timer bindings to dt-schema.

Take in account the used interrupts property.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/watchdog/amlogic,meson6-wdt.yaml      | 50 ++++++++++++++++++++++
 .../devicetree/bindings/watchdog/meson-wdt.txt     | 21 ---------
 2 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson6-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson6-wdt.yaml
new file mode 100644
index 000000000000..84732cb58ec4
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson6-wdt.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/amlogic,meson6-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6 SoCs Watchdog timer
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson6-wdt
+          - amlogic,meson8-wdt
+          - amlogic,meson8b-wdt
+      - items:
+          - const: amlogic,meson8m2-wdt
+          - const: amlogic,meson8b-wdt
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    wdt: watchdog@c1109900 {
+        compatible = "amlogic,meson6-wdt";
+        reg = <0xc1109900 0x8>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+        timeout-sec = <10>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
deleted file mode 100644
index 7588cc3971bf..000000000000
--- a/Documentation/devicetree/bindings/watchdog/meson-wdt.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Meson SoCs Watchdog timer
-
-Required properties:
-
-- compatible : depending on the SoC this should be one of:
-	"amlogic,meson6-wdt" on Meson6 SoCs
-	"amlogic,meson8-wdt" and "amlogic,meson6-wdt" on Meson8 SoCs
-	"amlogic,meson8b-wdt" on Meson8b SoCs
-	"amlogic,meson8m2-wdt" and "amlogic,meson8b-wdt" on Meson8m2 SoCs
-- reg : Specifies base physical address and size of the registers.
-
-Optional properties:
-- timeout-sec: contains the watchdog timeout in seconds.
-
-Example:
-
-wdt: watchdog@c1109900 {
-	compatible = "amlogic,meson6-wdt";
-	reg = <0xc1109900 0x8>;
-	timeout-sec = <10>;
-};

-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
