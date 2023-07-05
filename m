Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1150EB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 11:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8GmTUSGfpC8Kr0alVpNzU4I5aVq/B4Gh1swfs+R/qI=; b=mGjZRE4+oyiVOU
	eoYGpg8WtnCjNeqVbNKg0Og7XwqrH3UUsqlf+9rlk4h6blgpksE0l5JvT/mVEPkX/WKliw7BcbWvw
	V8/GkWg8FwszPCR/ij5ZA4teu0olD1iAeNpRvM349xSk/YaWGamS9UDnQuFLs41RuD5wx/Bc4kZCU
	jJDQyD8TFHZfch+2Q0doUP4Hmvo453+ZEHapzFjCyIUyrtkpvdHR7HOP25HZMzlDxZTxtuXw6aqHM
	0RQQ9/EO5ViqdxJRQCE4ude3OhC1RgcY9rzi9JRyPFVaHQqDDeVwGRzbYD0pbymUNugzd68imRgEJ
	uX569GKHL0OEdhU25jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0tf-00FkR3-11;
	Wed, 05 Jul 2023 11:42:11 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0tc-00FkMq-27
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jul 2023 11:42:10 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f96d680399so10018385e87.0
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jul 2023 04:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688557319; x=1691149319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CaNHukNnVjDsPaAH2UItJR4RWTnzSz8CQM5za4d01xc=;
        b=eoGCbKtPXzvda15F0EFg+vTluEi6TZEBd+7pMT4pGkWtwQrRjqNWhEKo/FVA3KMbG0
         dkaVNTuimNtL4VUMmRIOTCirIG6TfXDlU/o28TFeU4WvdK5p55xIsA/p6BnptPWtPQp2
         FfxGBhI301mJkHqaLL++z2vQVn+47JZ4hrnH+eax+PTHgL9a7hVl2d54/kx/K5hVSeOc
         SbYoAhKEydcYnE5/x3oLPJ+xDYfu47dlEOJBB++GKvxnLjYfPXKX4E6lnaYCSzj40mzK
         6ocdqZTXkGQHfsws1AfbSQPr02sGs4lEIacNxoq2+mvtjasMQnfDfmEijIHi9qpCM/Yg
         jRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688557319; x=1691149319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaNHukNnVjDsPaAH2UItJR4RWTnzSz8CQM5za4d01xc=;
        b=LMOCAmzusez4Ahq8KbaaD96j5lDEbHFvFpA8k5kbK+blhvz/DMQeJoxE5fVJjfH6yH
         GKezGyeP/gDiuKRNQXhxJNCWN10y8/v+YQKiYOsGLurCpiRaVn/lOkoDjauaeZ6SeDnz
         I7z7I85ZjE3Jo814VlJX53vxACAYnFoOLCRd5vIXV4kd3jBX6/23PUy1YiCX1Kz3I+nM
         g5p+AcJls88EmIUC7oCEDATz9JwYXcTxjvaL4lTuWR++LmEn9efOCBmNzKgyrDu/nrGY
         8TuslNQLeYO9gYvfvLkkw8LXLuWFvdnW5t77O890FlFrr7k2u0OFcFJoikla0/2K2yqn
         4WPA==
X-Gm-Message-State: ABy/qLamjocCgKrRRNnF+xqNutDK0PuLSlRpsCagxVzou10HfMXdJrsi
	HeWWpwmzrgDoywz54cTt7e5JRw==
X-Google-Smtp-Source: APBJJlFvQ35NSEFVi2NIkEQ1WNt56GRkE1nTH8Ny1kcUH3mWK3BNQT6Ii7cKXFgw3UkumO+kXtU5eg==
X-Received: by 2002:a05:6512:3256:b0:4fb:9f93:365f with SMTP id c22-20020a056512325600b004fb9f93365fmr11125377lfr.38.1688557319123;
        Wed, 05 Jul 2023 04:41:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c028800b003fb416d732csm1916808wmk.6.2023.07.05.04.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 04:41:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jul 2023 13:41:51 +0200
Subject: [PATCH v2 1/3] dt-bindings: clock: amlogic: convert
 amlogic,gxbb-clkc.txt to dt-schema
MIME-Version: 1.0
Message-Id: <20230705-b4-amlogic-bindings-convert-take2-v2-1-22be915ddc3b@linaro.org>
References: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
In-Reply-To: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3423;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6blIrzyVDZas5IcZi9A41vegPBQeeY36EiPBXllpWCM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkpVcDIG9EJRq/VdZ54P4MlMspaLByJsDrCw/YRGwx
 4SNHHPOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKVXAwAKCRB33NvayMhJ0c2fEA
 DAnzgI58asWhl7TlJS6OIvn/cirsOIIi/YaI5uM2uvix525ka7MBOSs7U4ASlxEnSPzlntuVNZ4Zib
 UtIfG5fKqlc6ru4wDUX9Yog9yegd7m3Smqatdw7fdxyNvWX+Z7j8j9roPCF3WRG46TryfAVcpA4rwy
 x2nShrNgHcJg6j7h+SlJQqpfYKqz5n4+kNgfUjHMt5/KKvMn+XoTS2Mrae3zlgRq0v0shKH959T0QA
 9QcAPMwcsPrrF8gqYOzTFUJbgPlHIxRupUCXZqdiWFhmQW/k4kBxF3DVIbXSJ4gFMupbzpfUrlSm08
 GbmHrhpzeWn7eUrt5ghPigCVVQdCqF8bu2BSqKcJq/KalvC8vN0aW7Yvo2+ic9L6IO6rerg6P2BPHN
 xZernKG7WIgYFL/BqdaewH/9CMXfqPCtXh77LL096DBhuZo0RZbH1NDEreaN21tf8Lt39ofM1hliSq
 Okrm9OCUCmnoFFiYqXd82KkJu3DH87zzJxBlVqVC6RFZEEO5ZmsLpZyBg6XNc+P9VHuI6G2UjNqVQU
 9CdBnQMTLYoPzcoNJDciiyKOx0x/mVwjzA5iT/FUiH2ay/AuKqJ6JmiofC+L4gBtZ8w2zAr1Qyioul
 mj+E+h9jjFxXd6uWKyGp+r3sLEOcmvSis7LdqN2EimfU1wWOl3y+erBpB8Ew==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_044208_694613_B7C7BFCE 
X-CRM114-Status: GOOD (  14.46  )
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

Convert the Amlogic Clock Controller bindings to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/clock/amlogic,gxbb-clkc.txt           | 53 ----------------------
 .../bindings/clock/amlogic,gxbb-clkc.yaml          | 37 +++++++++++++++
 2 files changed, 37 insertions(+), 53 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
deleted file mode 100644
index 7ccecd5c02c1..000000000000
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Amlogic GXBB Clock and Reset Unit
-
-The Amlogic GXBB clock controller generates and supplies clock to various
-controllers within the SoC.
-
-Required Properties:
-
-- compatible: should be:
-		"amlogic,gxbb-clkc" for GXBB SoC,
-		"amlogic,gxl-clkc" for GXL and GXM SoC,
-		"amlogic,axg-clkc" for AXG SoC.
-		"amlogic,g12a-clkc" for G12A SoC.
-		"amlogic,g12b-clkc" for G12B SoC.
-		"amlogic,sm1-clkc" for SM1 SoC.
-- clocks : list of clock phandle, one for each entry clock-names.
-- clock-names : should contain the following:
-  * "xtal": the platform xtal
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. All available clocks are defined as
-preprocessor macros in the dt-bindings/clock/gxbb-clkc.h header and can be
-used in device tree sources.
-
-Parent node should have the following properties :
-- compatible: "syscon", "simple-mfd, and "amlogic,meson-gx-hhi-sysctrl" or
-              "amlogic,meson-axg-hhi-sysctrl"
-- reg: base address and size of the HHI system control register space.
-
-Example: Clock controller node:
-
-sysctrl: system-controller@0 {
-	compatible = "amlogic,meson-gx-hhi-sysctrl", "syscon", "simple-mfd";
-	reg = <0 0 0 0x400>;
-
-	clkc: clock-controller {
-		#clock-cells = <1>;
-		compatible = "amlogic,gxbb-clkc";
-		clocks = <&xtal>;
-		clock-names = "xtal";
-	};
-};
-
-Example: UART controller node that consumes the clock generated by the clock
-  controller:
-
-	uart_AO: serial@c81004c0 {
-		compatible = "amlogic,meson-uart";
-		reg = <0xc81004c0 0x14>;
-		interrupts = <0 90 1>;
-		clocks = <&clkc CLKID_CLK81>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.yaml
new file mode 100644
index 000000000000..63246f1cb539
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,gxbb-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,gxbb-clkc
+      - amlogic,gxl-clkc
+      - amlogic,axg-clkc
+      - amlogic,g12a-clkc
+      - amlogic,g12b-clkc
+      - amlogic,sm1-clkc
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xtal
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
