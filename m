Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA46EC5479D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7huPQttG7fFYzkoxscp5K/pnvVzfeVPA8v3APix9P/A=; b=5EvTDtMYthla1+
	Kn1LwMuvy0vodvN3zRP0JmmLziwDwH0uh3BnwkSgjgqWMUkUnch5mq5Y57w06LRY+rAo8vLdJQhE+
	dEW1NDlDvgjLzDfTH0516ioXzDK7nARfiYQlYg/k9JI6A6R+fg9EkysQBjK5Kdaf2Neetj0h2WfOs
	hDYrr+PK4bRI9kgTiAYICvRt1vIzZyYBoWyMtCT8Q5p6zrj5St26+jQqxUKjhngVAS/j2K0GtMFlL
	MsysBlM2XTcJnOuKEYwBbhTjilx1V7OJ0NpGw/2BVxhFURaAhXzt5jixr34r6MndFVFNkxYZwFPjt
	x0xesnY3kPyiXM7afP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsoo-001pCl-7Q; Mon, 09 Jan 2023 14:08:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEreh-001LJ4-2N
	for linux-amlogic@lists.infradead.org; Mon, 09 Jan 2023 12:53:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso3662103wmq.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 04:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oUr8w/fBVkJnE59k2x6LjFTgvfWlu1602Zu3esq0gQ=;
        b=yw7651Zfiaa/ETLY1KrF3sA59Qt0nq2p9DYlfctPDk3lmFGFgxggxE1j9xeV4bWlz6
         EJHzBbK5iAv2IEEosCynJKk6OzKB0omA/4odpZkIoCPLMKsu09p2zyYkXourRrSw2VL5
         1GQsPjAHf3eyuc7yKnvLrLCl+mX7SXR7+KO1yANTVXg5DR0PloCvslrjAt/jq3umiql4
         OeWyumIvb5oNn+k2blGF+uHuGRPrNWvdjSXXeWQlwFHNpan8JJYwMYBBmMpfGcDb2vOX
         2L27BJCG4Obp0QFgf9f16SycA4f63/y5LQ0Yvay6aZRKLGheyCsfyBM7hX9y+IOzEB4z
         BHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oUr8w/fBVkJnE59k2x6LjFTgvfWlu1602Zu3esq0gQ=;
        b=f8ulQyTgULPnRqLL+EmjQgzblAt7DZba4VuAS0Byggbn4N3aABiCxH5+tPGkVdiguS
         4Uug9Lab9POSq/kFoJCWyvKrNV0l/FcoSLtaFkCyJZVceKWBbVjMXXN9M9+U69a/oXOX
         bYB/BvkflpSjSaAc+f37eXBXwCdMua3hqSEd+3f8u0cHULPOkVVKMnaKjgSV81APFXrM
         zl2y2jOLsDYEXjkGu6DUqUEk450QUwCLVMK3uq23oOy1JLYqUAjcCePswHu1IxqPRPlx
         drxTqrgphBX4yTyjse0lopLx2e/2EVj3tylyYOvDieaVfKgOkJ13wEwhiZk2Rtsyiw0T
         PX8w==
X-Gm-Message-State: AFqh2kqpgDksfEc4Io/FESNi08hbsoU5L8ovRypiMRHcrkx9ztBhJsAr
	kax2J1bTokUyjiCSZSoS2vB33g==
X-Google-Smtp-Source: AMrXdXvGChqLrkdOYMIrvP3oiZBLJmzLXN7wzV4hvUgkqWIZvi4SN9pHUanVnXVyf/b8Nfwm+x5bRQ==
X-Received: by 2002:a05:600c:8507:b0:3d9:6c7d:c9ee with SMTP id gw7-20020a05600c850700b003d96c7dc9eemr41487743wmb.25.1673268811818;
        Mon, 09 Jan 2023 04:53:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 13:53:25 +0100
Subject:  [PATCH v2 01/11] dt-bindings: firmware: convert meson_sm.txt to dt-schema
MIME-Version: 1.0
Message-Id:  <20221117-b4-amlogic-bindings-convert-v2-1-36ad050bb625@linaro.org>
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
X-CRM114-CacheID: sfid-20230109_045335_211437_00B868E7 
X-CRM114-Status: GOOD (  14.38  )
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

Convert the Amlogic Secure Monitor bindings to dt-schema.

Take in account usage the used variant with amlogic,meson-gx-sm.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/firmware/amlogic,meson-gxbb-sm.yaml   | 39 ++++++++++++++++++++++
 .../bindings/firmware/meson/meson_sm.txt           | 15 ---------
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml b/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
new file mode 100644
index 000000000000..8f50e698760e
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/amlogic,meson-gxbb-sm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Secure Monitor (SM)
+
+description:
+  In the Amlogic SoCs the Secure Monitor code is used to provide access to the
+  NVMEM, enable JTAG, set USB boot, etc...
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,meson-gxbb-sm
+      - items:
+          - const: amlogic,meson-gx-sm
+          - const: amlogic,meson-gxbb-sm
+
+  power-controller:
+    type: object
+    $ref: /schemas/power/amlogic,meson-sec-pwrc.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+        secure-monitor {
+            compatible = "amlogic,meson-gxbb-sm";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
deleted file mode 100644
index c248cd44f727..000000000000
--- a/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* Amlogic Secure Monitor
-
-In the Amlogic SoCs the Secure Monitor code is used to provide access to the
-NVMEM, enable JTAG, set USB boot, etc...
-
-Required properties for the secure monitor node:
-- compatible: Should be "amlogic,meson-gxbb-sm"
-
-Example:
-
-	firmware {
-		sm: secure-monitor {
-			compatible = "amlogic,meson-gxbb-sm";
-		};
-	};

-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
