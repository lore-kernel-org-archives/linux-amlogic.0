Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2650BEE57C1
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 15:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BIt/kTOMaDOTHz37+f6w+pbzLHfIZhoy/9aL45hZOKI=; b=Gq3DvYOHu/+kSD
	PUu8KB2y3FSFGo3aMFms3pSXwq2fbvM6dvJqI7+rCNc7yJMbWU3wahOdAGxCUhg7qjo406OZwingZ
	ikHIvxUH8FzbGbF7+OPAEasUEPyliOKNHobxViW258oU8b/Ie9tO+JrvKk1RvxCVQRP72zq00YlcP
	eyhPcLzMxwGmqKzi34c6lnUsQQBqeWpfYdp+0/iIuI/SffAXEIRWmj61xOlT1wdy3X8r4aEvzPPjg
	ODqTxt7IOQ92vO82Cuzk5QTxWCLAlliI2vakVyNE+LkTqsqM6CudW/ZWypMUOQOleJbYz/4fcq0/t
	xiS/3q3Z+YijR7nveuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPAZ-0000000A7p9-1QQc;
	Wed, 11 Sep 2024 15:22:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOy0-0000000A59L-0aBf
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 15:09:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-374b5f27cf2so4170621f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 08:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726067350; x=1726672150; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVkYHpudqLYcdqxUnypmWz6sNt1ioeqBftj88K8uSJM=;
        b=b5MrDoh50AcmYgDmgtrh8L2MQ6S33XZIH9J/Jrf/o+73+eyM//kQqUI2SqDJFCwBrB
         m1iyHdvChDTLie16lOw0ZflXkseNNY15ljsg9lf7kt6Rv6z1ReyRFGDbFTzB1ZJKppa8
         eA3ivUSMyJkJnM4RoT7KVhatqCxI1lYrOhsi90PCBE1SxqR0gsUYZhzW2VEOc2gF/WN+
         lf2UG9t4y49vwRUIbT9mHM6KhVnZu9IZh7OclyJ9DT4NphDhrRezUH14j+h3KtV4jG1Y
         OnSau/xKv6ziIbc77J/6tLSW+lBn14v3xJUPHNl/4wp5I9qpU8cr7ZjPYfJbh4bGdQqR
         3UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726067350; x=1726672150;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVkYHpudqLYcdqxUnypmWz6sNt1ioeqBftj88K8uSJM=;
        b=sB8nOih40GqRd6XylAo6LmD5CI+CPi6VydlrhnEfpwrgJO1yNtY4q34gIWz6MXlmtC
         vmUChk3b3ipXYUWU4mN0eOgFnrTgsMhzxfM3yI8gFHrGr0tLRW08gqht427KwWq2RPrc
         C0Zyh1/t5oCXZIlGQrAomUfm5xAW/q6Sz/Jcn7T4hFK/xjTDStoED1uJRmFlLbTaYwM9
         E35xAAJnRGs78+U41Rowj6Efpkw3tVud0fKBEbCaS2ATgaXCIlOgvumncIgXV89Gs2Rp
         XJFEs/5S+ceiC6zkqBXnMI5iXqwcMjrCBOA3poWt2E8XM0v0qq8KO+f3AALih3YtzS6W
         j4zw==
X-Gm-Message-State: AOJu0Yy9nI+gYBMIJaFVKOz43MZKgNE6udatE5fKtgHT80ZRKbWXUB0u
	cWH7BExsIxHVrp8YOnhHY9HVCUmhpopoSrOJVHBvQRzTYnXPe0JK5FjSOrcqqg8=
X-Google-Smtp-Source: AGHT+IH022ElrpZNSsZueuLvqwSqa0DsURDewSDN/7/BlSUlDy3q43WfoF2DOa5dbvVyxrr6XGoQBw==
X-Received: by 2002:adf:a186:0:b0:371:8cc1:2028 with SMTP id ffacd0b85a97d-3789268edeamr8594650f8f.14.1726067349432;
        Wed, 11 Sep 2024 08:09:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564af1asm11823756f8f.18.2024.09.11.08.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:09:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 17:09:06 +0200
Subject: [PATCH] dt-bindings: clock: convert amlogic,meson8b-clkc.txt to
 dtschema
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJGy4WYC/x2NywrCMBAAf6Xk7EISLT5+RXqIyTYuNg92YxFK/
 93oaRgYmE0JMqGo27ApxpWESu5iDoPyT5cjAoXuymp70ldjoJVKHlxaSvyR09HCu0pjdAkelAP
 lKDDTBwV8yStyg4RS8gX88vJwDujN6LQbZ636pTL+4z65T/v+BUUypTuRAAAA
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3984;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=svPrUDRaKTqHQLVdWxyhvAXQB+X4yADudTbd99RZ0iE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4bKTWdNSgq/DYRLr3ma+kl4WNK7Nd3+iJsaMzOD5
 CEo7ZdyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuGykwAKCRB33NvayMhJ0e0wD/
 oDpZ78Jn9TyUC6J2jSTfmVFEBJJtajhn5hTHTB7QZWRtuXk7SeaTYOGhD8gqgSZvL3huAqNBnB3FZ1
 IFPJRY5FUApWNMC1ArDXrjH3UIDWZbZZsTWnc+xInp6aiuEm4fEJvlbp8+rERZ/y+CbpeZseKZi1A1
 lRRqkDHfjhdau2kiKJ06xKGgBjBYNr1cTibv6OliiHwHx33wknl0gR2b4CT2kU+L4w+3RwjnHqRxyO
 cmPGTogM7D6Qnr2yQdvymgCLyPqu9HuaPXWH+hAcjr12kLj5iRxh5yoArUoYzARBfwxNxEPjvY4Kr1
 qcAB1AMGUZElNLvnp7gAVkIpsD1rCa92yrD2wkhNy6O59YI3XX/ziyn4IxeRqizOquxYpemosCv+an
 Xpobp5UpgT4rqaybTbAMrJvqloPVvXp56FXtj8qBVIAVqb8RfhutlP/Ro2X0BP5UphH5qsuwnaHajy
 epprp49pMOKwIeznTcyNOqeErQj2xiwtYY+Eq5xtj62ZqmfAx6G4fGKka+L9As0e4DZQAumbpwJL0k
 pITRIcuQYrHuNryR/ZLKdwPFpAB8Ne8egEvjA8I6glYIJA5LYO5RsO7p8emTWFa+M0r4WF3nzmi3xY
 TShErry4bkwzIFG2X5XcfWdszv4IhjJXPigldD5Hj32PKa2MUG8VYqgeeJYQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_080912_236126_697C3A88 
X-CRM114-Status: GOOD (  14.98  )
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

Convert the Amlogic Meson8, Meson8b and Meson8m2 Clock and
Reset Controller to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/clock/amlogic,meson8-clkc.yaml        | 45 +++++++++++++++++++
 .../bindings/clock/amlogic,meson8b-clkc.txt        | 51 ----------------------
 2 files changed, 45 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,meson8-clkc.yaml
new file mode 100644
index 000000000000..ab73d4654171
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8-clkc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,meson8-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson8, Meson8b and Meson8m2 Clock and Reset Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson8-clkc
+          - amlogic,meson8b-clkc
+      - items:
+          - const: amlogic,meson8m2-clkc
+          - const: amlogic,meson8-clkc
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: xtal
+      - const: ddr_pll
+      - const: clk_32k
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#reset-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
deleted file mode 100644
index cc51e4746b3b..000000000000
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-* Amlogic Meson8, Meson8b and Meson8m2 Clock and Reset Unit
-
-The Amlogic Meson8 / Meson8b / Meson8m2 clock controller generates and
-supplies clock to various controllers within the SoC.
-
-Required Properties:
-
-- compatible: must be one of:
-	- "amlogic,meson8-clkc" for Meson8 (S802) SoCs
-	- "amlogic,meson8b-clkc" for Meson8 (S805) SoCs
-	- "amlogic,meson8m2-clkc" for Meson8m2 (S812) SoCs
-- #clock-cells: should be 1.
-- #reset-cells: should be 1.
-- clocks: list of clock phandles, one for each entry in clock-names
-- clock-names: should contain the following:
-  * "xtal": the 24MHz system oscillator
-  * "ddr_pll": the DDR PLL clock
-  * "clk_32k": (if present) the 32kHz clock signal from GPIOAO_6 (CLK_32K_IN)
-
-Parent node should have the following properties :
-- compatible: "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"
-- reg: base address and size of the HHI system control register space.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. All available clocks are defined as
-preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
-used in device tree sources.
-
-Similarly a preprocessor macro for each reset line is defined in
-dt-bindings/reset/amlogic,meson8b-clkc-reset.h (which can be used from the
-device tree sources).
-
-
-Example: Clock controller node:
-
-	clkc: clock-controller {
-		compatible = "amlogic,meson8b-clkc";
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
-
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

---
base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-7dec15a0a5f0

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
