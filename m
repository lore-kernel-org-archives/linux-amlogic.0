Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E61C5479D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pia8pc5C7wmG2kN6PUnZdE7HQsnLlQhrKNbU87s9nnE=; b=KaYltJevJeMw27
	y+I65LUjh/DLnkweOMznJ2AiKWqjPWF6IPlX8+O87pm6WuCgXlf4/1TbA7QzlffQxIQwtA2vB7qGe
	BIdoXLXHr3C9q0iNpljsgcChg6+kdT5WEbZEv0UOI0e2SgYYg4Yp8KY/5/ULS/ppQyFFS+I/poP4l
	zbgiHxIj+PMElMVQvgNxRUYrqe4xR8q0EEOqkbnMiAdqxx6s6D6giNbqu5PUycGrQLfMzk7kQFyGi
	VucwXx8F0dOtGz8LgOdHx6t8ks5X2C+VtHLAAXHllLX2m/tcbaRFNMLHvN9ZQp8ec3YE4SJQJ5OXq
	p6eNkNveoDE6TOSXcBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEspV-001pRg-47; Mon, 09 Jan 2023 14:08:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErei-001LM0-Dn
	for linux-amlogic@lists.infradead.org; Mon, 09 Jan 2023 12:53:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso2264900wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 04:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbXe2+vnFi2o0+x3zbVNdzht9oC5iTUElnKdAfsufrk=;
        b=DOvxPAXGiNaerq41sXouK4mUViADCtl1292C8CsCHfPiv5MHP8l+bv4o+zhXHlZeg8
         +TOLBBSwXzBJm1HVsjkOiBczYGdPKQp7IwzQcYyg3Y67Eam+CXMHMOJvDvmICQHb3bXd
         aWBVDWPCA0tC/c7M6s5HslAPQ8l+zUU3XxO8iDbfcIorWmCGz9Prc09mRbAx4PAm3L9n
         Tc7L4YXgyU+ot7CO38EL43CwU/1I5dtTEqvCFO/LYgCavf5P+uT7kXv9tBlKs3jK6ZRB
         auzkSdJwVfsPTlD668SFi3GknfOOf2onl7SHMvMuSCehaEXwhBbEySGZN3oSfJ6ABVxV
         h3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbXe2+vnFi2o0+x3zbVNdzht9oC5iTUElnKdAfsufrk=;
        b=cSxhsHq/E/U9nXSMJxol34/k9bCvQ3CtYl+Wa9veR70zIuC233BcPGal0iReDMUeQ+
         DpqNX+++1bxMDuxzHOhNGd65c2Yz3k1s336TWJ71nf+3UKh0E8LNid28S3EgTjOVSb/3
         b/dKQGo7jwBkeyEE8Aq9c9kV/e+hA0ji2nJHwnCRZ5hRZE2XaYBFq+QMuYI1VDrEm4IY
         WZo8VStnruTFqrf4Fyae/2AAZY/cIgNsYab3VD6uVcL83XmSk8rSOd0wypMRscKBvfVZ
         kSPbzTiaCv3/8d3Xo/Z+3mpqEb0Cwe+9SoNJQaIzK34AHlUbuFAvjXEO3aibOLhFCwFH
         2QmQ==
X-Gm-Message-State: AFqh2kqUoTL1oRL2qoZve8O162eZWXv8RPU+0FfVR9nsGxeAx2mZLftO
	ZSPxxKkdwF7Gm5z4QjVdH4j7MA==
X-Google-Smtp-Source: AMrXdXudpqXVFbLwik7jPum30M/juG26ZBSd4Z3aISfa1VLm3maETyuA/mzYk1lep4t/A1RsQFwlcA==
X-Received: by 2002:a05:600c:2318:b0:3c6:e63e:23e9 with SMTP id 24-20020a05600c231800b003c6e63e23e9mr49142536wmo.24.1673268815169;
        Mon, 09 Jan 2023 04:53:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 13:53:27 +0100
Subject: [PATCH v2 03/11] dt-bindings: nvmem: convert
 amlogic-meson-mx-efuse.txt to dt-schema
MIME-Version: 1.0
Message-Id:  <20221117-b4-amlogic-bindings-convert-v2-3-36ad050bb625@linaro.org>
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
X-CRM114-CacheID: sfid-20230109_045336_549530_1E5BB6FE 
X-CRM114-Status: GOOD (  16.06  )
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

Convert the Amlogic Meson6 eFuse bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/nvmem/amlogic,meson6-efuse.yaml       | 60 ++++++++++++++++++++++
 .../bindings/nvmem/amlogic-meson-mx-efuse.txt      | 22 --------
 2 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
new file mode 100644
index 000000000000..11cace95d18c
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/amlogic,meson6-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6 eFuse
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson6-efuse
+      - amlogic,meson8-efuse
+      - amlogic,meson8b-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: core
+
+  secure-monitor:
+    description: phandle to the secure-monitor node
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse: efuse@0 {
+        compatible = "amlogic,meson6-efuse";
+        reg = <0x0 0x2000>;
+        clocks = <&clk_efuse>;
+        clock-names = "core";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ethernet_mac_address: mac@1b4 {
+            reg = <0x1b4 0x6>;
+        };
+
+        temperature_calib: calib@1f4 {
+             reg = <0x1f4 0x4>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-meson-mx-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-meson-mx-efuse.txt
deleted file mode 100644
index a3c63954a1a4..000000000000
--- a/Documentation/devicetree/bindings/nvmem/amlogic-meson-mx-efuse.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Amlogic Meson6/Meson8/Meson8b efuse
-
-Required Properties:
-- compatible: depending on the SoC this should be one of:
-	- "amlogic,meson6-efuse"
-	- "amlogic,meson8-efuse"
-	- "amlogic,meson8b-efuse"
-- reg: base address and size of the efuse registers
-- clocks: a reference to the efuse core gate clock
-- clock-names: must be "core"
-
-All properties and sub-nodes as well as the consumer bindings
-defined in nvmem.txt in this directory are also supported.
-
-
-Example:
-	efuse: nvmem@0 {
-		compatible = "amlogic,meson8-efuse";
-		reg = <0x0 0x2000>;
-		clocks = <&clkc CLKID_EFUSE>;
-		clock-names = "core";
-	};

-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
