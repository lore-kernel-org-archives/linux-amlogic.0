Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037F9C5479D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+qUrzPvkHuusIroBBuWmsJGSlbULGVXNUX2lZZxWbM=; b=H+Sqx/KvB8iAxY
	eYL/MyuhyZQyLZf8SyU+X/ClDxkzawajpop3tAa1eUavEKRqyRBtBKE3CWNtb7KiB0G/fAc4nXYGT
	ERs7XmatY+iMot4lefK3lp8lHh6ZSnTuD4b9AfghPy4XEOHfaXw9sAT+kje5XMkd+tmsRGog2ZiKa
	9Szj0j7EjONIiPiT3BQwDIePYEMEULA5qhu9x6zCek/+shW7TfwpMdsEt6Ug6AXCHMEICqbUMTWao
	AMB3DHGEz5mg+Xm84ZUFbtJAxGpRiMExhNAE+uInvB3GtaYh9eMxVqIBlJmv3wE3fr9YnmRtrdSUS
	iABr/6Q/Aawscd0+3a/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEs05-001UyE-Hx; Mon, 09 Jan 2023 13:15:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEryo-001UFd-Ky
	for linux-amlogic@bombadil.infradead.org; Mon, 09 Jan 2023 13:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RRiMwFjCYTBiVehS5Zjzxk4QhzySk5Q8XvQ2DTwvGYo=; b=f3S7r7mMd0sYX4X1sGuSA3jy+x
	AKyfSQQlathhCSEta3xDBlIaGCQ6+ZMID6iLK739UWlDlpD2fjNV95WSBzlLiJFq6byxuPD0bz+GX
	zocNcxKhL5TA+cLzEcuLwJoLZl3URXbsq7gztNmOqfgwXWdnDEkO3nVPW4iKHvNvZqQQLhH20wBLd
	vA47jLNxysze+as3+TNZCgRn0ikarMKGYoTkbkBf3BvTDGIYRxNHzCUKovaFUXdTwsK74Brb6bgli
	TC2J9/zJE6/LXbIYKtlhkacjBlzdjy4rkuBd/l64FSsBG1KRnioGoEFEG0VU74jN+nSX5SXUyttd4
	Hf4NKjGQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pErei-002jGA-0x
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Jan 2023 12:53:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso2265167wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 04:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRiMwFjCYTBiVehS5Zjzxk4QhzySk5Q8XvQ2DTwvGYo=;
        b=aBiQ+I7Ke69g721Le6fWX/mYxuRyANWFBhR/OB6Pj9x0oGFKiFkeQxWoaRW2zRXN8T
         GiSqyZf/lBsocyTcQ8cKypiZB6S7w9k+ycDis+ziOLhi593lbYcmCcnC3iGE6KWBwoVq
         ZlZ0B8wF/umJSXsNhSDIZ6a5qBl/2K0bxFxngoIuwq/4Atx/jWBo0boxlSG7Yu6zku3U
         pRPUARNjpFyclLHHls0eqOxejeZFNeF2pDldXfwhVGeYzVfnwX5sTR5UarOh8h1Hnpso
         Lvf3+Gm2vUxJWwRWLLu1UKdVYW87GUe68F47H6D+SoDiSpMKvun5TQi6L8NeRLrTPi8e
         +O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRiMwFjCYTBiVehS5Zjzxk4QhzySk5Q8XvQ2DTwvGYo=;
        b=rsEAsaaAMFKqEluUGv46WtNjpUtQ03lkM+egJ+ZLDiSr+nYb+p2wcpEt2jOCXyo7im
         xM6DEBB3JugtUOBR3eKEy7VJW/4a1FyCNC0ej8LELkx+wU/Y64Pv/mmD1dv4rOShumJc
         oQbj+9kCOHEdxk0d9qoz27l+hv2/iN3R+0AxkGnb9sTaWbTV8b/Y8lEtpxOTrWbwrReq
         v65cUtBjpiLu0VHbWz7bllta3EA+2nQGAQY4TNdJcvogXhnd0ObcT7KJkgO7eACn92Fz
         hvwGgbf0XHn+l1SVdLMPpoUZEKZCb+c3ygLXrr+lHH0PZ4fonTClM5B4Mdd2pJHCaH5z
         HbGQ==
X-Gm-Message-State: AFqh2kryAh8x1tESZWisr870XGVckN0Kvb6vNFYkgxovOS7+OPBDZsxl
	ZrS0Xu8XS5jYq4wsmQyP35MY4Q==
X-Google-Smtp-Source: AMrXdXtpKrsAALSFga1fVeXlI0ytYl//rwO3a35WtI8uvdrDSrdT/sQXGg+OYuR+ehktTHxFhJFxjw==
X-Received: by 2002:a05:600c:34ca:b0:3d6:80b5:f948 with SMTP id d10-20020a05600c34ca00b003d680b5f948mr46711984wmq.39.1673268821634;
        Mon, 09 Jan 2023 04:53:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 13:53:31 +0100
Subject: [PATCH v2 07/11] dt-bindings: timer: convert
 timer/amlogic,meson6-timer.txt to dt-schema
MIME-Version: 1.0
Message-Id:  <20221117-b4-amlogic-bindings-convert-v2-7-36ad050bb625@linaro.org>
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
X-CRM114-CacheID: sfid-20230109_125336_445998_733858E4 
X-CRM114-Status: GOOD (  14.27  )
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
