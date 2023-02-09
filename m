Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A09C05027
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkmiXTdp3Mw0VoaWyaJSRLW2kwn7zmd4eKFY3fcJwio=; b=RtFsCNAK4/Taty
	pQhQ4Y5hBouY5ZJfLPUyU6hvrnhZn8OrYzpSK9NIEOV2uYmbKEWmw49+3gAYmVHb8G0dT4YJjLbhN
	q0v0W52unABnraOB6JcTfOUP8MQhF6nQGYYNdmthFsqZx1YXQ1W06ua41U/aEn7Fp8QoYigXpMRGk
	Boau3IUi0Fs2M5zgtIL7CSS2cIWb3EQSEiuh2L0cvk848DE0ru0AlyA3o14y6t2Y2yMf7PW+BJ8Iz
	V9oDTBaAdlcGTTFwZ6z8CrdbYD/RqFFs+LGVsHSg0VPd5uaORzr6FO5wplJ0i6AXvPADP2bLsXFyw
	LU0lUE7+3ZaSCDNyu8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7Ec-001o34-Lj; Thu, 09 Feb 2023 13:45:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7BH-001mK7-Jw
	for linux-amlogic@lists.infradead.org; Thu, 09 Feb 2023 13:41:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so1585370wms.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Feb 2023 05:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGW2oT94HK6ngpZmBKHolnNTHtBBlnG2dCVlzG6CWeE=;
        b=Qledw9xPLq/PvO+4IvdhHggxZshP/QGS+twZn4DOnVjLBXRpws8wY3UzjQhwfiMu79
         JWq3NT4amqXdro2bvg24B6Cf+b6Iijvzbmdy61S/HZdaYpP/89NIBjQ3bX3A0t0P71Bs
         MJ2R49zCyJBkDiASjvFg7g4WVnjFqH3VBZ92ljgajD5R4dLyMCL/IfAzBgYD+ycYRxm6
         exNEAZVJiFPPoylgypSxcFv6sZY2pp+xVqoIFD4G2NFwy9py+nbEaCv6M+YcH0TAAwGF
         WLRviEUCziru4V1XyMKO13ycJ6cRFj1nyzRlIN/PBD5QGmtofk2kmwIS8PGyJIsebDOr
         q9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGW2oT94HK6ngpZmBKHolnNTHtBBlnG2dCVlzG6CWeE=;
        b=KOvwIq2b3Q2lGWMLQVmY9rbqiAKsSIBF2uUDdFphSWH7dPkoJ5kI/9L0sE3ITcG6Ep
         ebEsbPZMZ+1kdwL882az6hEeHBmUgiztvMa6TmVe/8iceCA3TPcttESZaFJp++v505n/
         4oineNhwpJbVar0AcTcqEaGMca1ay6WEpbYTpoV9DxWcJw4H917z4sa1K0i0L/LpbEYU
         LYe4Ph3S3YZRIzPrfjj4tnWsekH6VHHBE9qoQmLOsD0lkxin19UqakodhZP2JFfTMFr6
         BEFkl4OrvNMuerSKeC66rI6YQdzMV2h3pjoO4xPi+3grLcheA35xFhDh/1vgYHOWmUSC
         urmw==
X-Gm-Message-State: AO0yUKVGlX8hxfyeCiAVOl65+8R4IV4aLQ5R2PfD4APuxa16OuVgB4Lr
	IXltpBeKMBtvn+M6NZ52ImiVjA==
X-Google-Smtp-Source: AK7set8tF+m+2BDy4Jqj9n4mBkHnqUS7RpYgJU7ApYsJuiqWKroRaqouDy7YBCcw28uEE1HvKDcWAQ==
X-Received: by 2002:a05:600c:3416:b0:3df:50eb:7ca6 with SMTP id y22-20020a05600c341600b003df50eb7ca6mr10258428wmp.15.1675950101385;
        Thu, 09 Feb 2023 05:41:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003dfe549da4fsm4946991wmi.18.2023.02.09.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:41:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Feb 2023 14:41:38 +0100
Subject: [PATCH 2/6] dt-bindings: soc: amlogic: convert clk-measure.txt to
 dt-schema
MIME-Version: 1.0
Message-Id: <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_054143_696983_094655BF 
X-CRM114-Status: GOOD (  12.71  )
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

Convert the Amlogic Internal Clock Measurer bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  | 40 ++++++++++++++++++++++
 .../bindings/soc/amlogic/clk-measure.txt           | 21 ------------
 2 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
new file mode 100644
index 000000000000..77c281153010
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-clk-measure.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Internal Clock Measurer
+
+description:
+  The Amlogic SoCs contains an IP to measure the internal clocks.
+  The precision is multiple of MHz, useful to debug the clock states.
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gx-clk-measure
+      - amlogic,meson8-clk-measure
+      - amlogic,meson8b-clk-measure
+      - amlogic,meson-axg-clk-measure
+      - amlogic,meson-g12a-clk-measure
+      - amlogic,meson-sm1-clk-measure
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-measure@8758 {
+        compatible = "amlogic,meson-gx-clk-measure";
+        reg = <0x8758 0x10>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
deleted file mode 100644
index 3dd563cec794..000000000000
--- a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Amlogic Internal Clock Measurer
-===============================
-
-The Amlogic SoCs contains an IP to measure the internal clocks.
-The precision is multiple of MHz, useful to debug the clock states.
-
-Required properties:
-- compatible: Shall contain one of the following :
-			"amlogic,meson-gx-clk-measure" for GX SoCs
-			"amlogic,meson8-clk-measure" for Meson8 SoCs
-			"amlogic,meson8b-clk-measure" for Meson8b SoCs
-			"amlogic,meson-axg-clk-measure" for AXG SoCs
-			"amlogic,meson-g12a-clk-measure" for G12a SoCs
-			"amlogic,meson-sm1-clk-measure" for SM1 SoCs
-- reg: base address and size of the Clock Measurer register space.
-
-Example:
-	clock-measure@8758 {
-		compatible = "amlogic,meson-gx-clk-measure";
-		reg = <0x0 0x8758 0x0 0x10>;
-	};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
