Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232AEC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5LEPkGbfeLhuyUdBlWxsvCgTtyGVXeKWFa8hQpdUbU=; b=V9ztcMvtfokEZx
	4zbqbkeeCI9RTC3aynLaFl6hw8pi5VKDQdvDiUoFPqhL03wPJjVXnVKrso3zf9xq1kbyeSaTqYsxL
	RJh/GD7j5LfT0IbyEEXQQ7w/x5muqaiBk4ESTIL4NPUuhWoLL47Ybk4kOCredAoDsFu+0awjnJwx0
	jIJgXZMeEmPrmraSHkvbdOAXPRZks+TMWqHIL5Q1c5/kOLaWRjzO+mVwf4+/d7IwFgk9mFNslz21k
	vn/pxNQNUv53kczZkMu2XeWbKUowU0Kpe0O80UFal775lGvMrZKNyra5eLZUETCDOproErP/+5NVY
	lsrbfCoB2q+Nr689Ay+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3F45-00FDcV-La; Thu, 08 Dec 2022 11:27:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3F44-00FDQp-Nr
	for linux-amlogic@bombadil.infradead.org; Thu, 08 Dec 2022 11:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GdMCi41BRhoRVn7tJmgZDPG+60TkiWedqCw4ysK9tk0=; b=fvXvC6EeigX7SYVfIHt6BMw+Fe
	QsK40o0zMl++hncqaQ8ic/urC7qlRqryv/ddMRHr+kRMMC1Z9aADVhQdbCpVlRyzt7APJer/A8YU+
	aN/w4Ugo/jlEUTBn21yDr5eBLE2OmByUCTbb6Dy00kXUW49EZClDjmGt+d7m7n+cwjAaQ0WYJUM4X
	KSalKx4eqEJmqUhGAsSZkbP7CjnUPshbAHCSi1CV/tF6FzVSFBMx+50a3vkjy4d9CCLcJouNHSqfW
	bgKYPuQ9eN/OMP2csxvHvzBTHA9WBXb5xrDPloav/NM8EC4mPp9bR9kGQFKlfrt+RSykloCDy/SCh
	dFB8C3gQ==;
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EBt-008ULH-RA
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 10:31:50 +0000
Received: by mail-lj1-x230.google.com with SMTP id z4so1078989ljq.6
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Dec 2022 02:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdMCi41BRhoRVn7tJmgZDPG+60TkiWedqCw4ysK9tk0=;
        b=lRIiBy6pSMLBYxynao/nIi1eDsNXlLTyCPFstwfxAluBEIsM6LiU7Plqhn1aJ02Yq6
         2YJdwZYqtp5SUDN3HjG8GhAdVu762AjwFrIhiLmMDo+/00U1QEUfrdxnnY8+JxFp2uPJ
         2UYDhpLJAL6B/y+H9+VzKsi7aadEJjjhvkzC/UHQ1EBYgTJOCwfCibi7quEmPArd3F+X
         FAysDVc0mFhSzNCGA+sXa3nJM2+nODtpkXx2XWAXTSyOLjOiD/4fwSGhvQfbsosyBohS
         xJncVnJWk1EZGOlLaEax8AtfdXsmnjE6ZV3mzb8dI2Z23PrpJYC8Rr45WQYiVPutyQen
         y1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdMCi41BRhoRVn7tJmgZDPG+60TkiWedqCw4ysK9tk0=;
        b=syypu0tzHYo6z1eeDFdl1BMOTi9lwXswIO1mjTuX7YaT/xJCc2qb4zWmluIJVFKHun
         uenlD+0ByDLhUb3Rgz3jtYESE6zfLJz/NLrx2nv8Xv9POEp1MdlpRsMWXXg77Qju5oeY
         WPITOHe7XuKUpTQmToPze1K9QelkJKr3bX9NzAo28ksR3PNWsKEO7vtqtHlmspZFY2Dn
         LVdSNQgWohJMz+pYMps64awWQbws9IFnrztGoDTA+m4FP5TKbcUqR+DlRg7WecFvR6Pj
         G88T5GnYJ1bWj18D3jbHcFlir7QwAMzHZC69l0Q2sBpJ/rqe8DemZn0IsbHk2Rq9Kdgb
         G/Sw==
X-Gm-Message-State: ANoB5plJgwSb5XNFm6TI4kuc1DE9acL1k0xOuYWIikfgcOhGSRgcxgRg
	LtWq+NQGVSO78xsFWFGb90E7iQ==
X-Google-Smtp-Source: AA0mqf7PxHyaFqnbm9AneVRfDtcor/UK1px7NfgtBLnuUx3d7/tdOhjSb70zTR6W11rGcy5bWMAsRg==
X-Received: by 2002:a05:651c:2328:b0:27a:eae:9ecc with SMTP id bi40-20020a05651c232800b0027a0eae9eccmr3403499ljb.248.1670495503950;
        Thu, 08 Dec 2022 02:31:43 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:31:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 9/9] media: dt-bindings: st,stih-cec: convert to DT schema
Date: Thu,  8 Dec 2022 11:31:15 +0100
Message-Id: <20221208103115.25512-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_103146_062548_3E815254 
X-CRM114-Status: GOOD (  17.04  )
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

Convert ST STIH4xx HDMI CEC bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/cec/st,stih-cec.yaml       | 66 +++++++++++++++++++
 .../devicetree/bindings/media/stih-cec.txt    | 27 --------
 MAINTAINERS                                   |  2 +-
 3 files changed, 67 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/stih-cec.txt

diff --git a/Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
new file mode 100644
index 000000000000..aeddf16ed339
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/st,stih-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STIH4xx HDMI CEC
+
+maintainers:
+  - Alain Volmat <alain.volmat@foss.st.com>
+
+allOf:
+  - $ref: cec-common.yaml#
+
+properties:
+  compatible:
+    const: st,stih-cec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: cec-clk
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: cec-irq
+
+  resets:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - hdmi-phandle
+  - interrupts
+  - resets
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/stih407-resets.h>
+
+    cec@94a087c {
+        compatible = "st,stih-cec";
+        reg = <0x94a087c 0x64>;
+
+        clocks = <&clk_sysin>;
+        clock-names = "cec-clk";
+        hdmi-phandle = <&sti_hdmi>;
+        interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "cec-irq";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_cec0_default>;
+        resets = <&softreset STIH407_LPM_SOFTRESET>;
+    };
diff --git a/Documentation/devicetree/bindings/media/stih-cec.txt b/Documentation/devicetree/bindings/media/stih-cec.txt
deleted file mode 100644
index ece0832fdeaf..000000000000
--- a/Documentation/devicetree/bindings/media/stih-cec.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-STMicroelectronics STIH4xx HDMI CEC driver
-
-Required properties:
- - compatible : value should be "st,stih-cec"
- - reg : Physical base address of the IP registers and length of memory
-	 mapped region.
- - clocks : from common clock binding: handle to HDMI CEC clock
- - interrupts : HDMI CEC interrupt number to the CPU.
- - pinctrl-names: Contains only one value - "default"
- - pinctrl-0: Specifies the pin control groups used for CEC hardware.
- - resets: Reference to a reset controller
- - hdmi-phandle: Phandle to the HDMI controller, see also cec.txt.
-
-Example for STIH407:
-
-sti-cec@94a087c {
-	compatible = "st,stih-cec";
-	reg = <0x94a087c 0x64>;
-	clocks = <&clk_sysin>;
-	clock-names = "cec-clk";
-	interrupts = <GIC_SPI 140 IRQ_TYPE_NONE>;
-	interrupt-names = "cec-irq";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_cec0_default>;
-	resets = <&softreset STIH407_LPM_SOFTRESET>;
-	hdmi-phandle = <&hdmi>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c2593f346f8..b110c6d5133e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19924,7 +19924,7 @@ F:	sound/soc/sti/
 STI CEC DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/stih-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
 F:	drivers/media/cec/platform/sti/
 
 STK1160 USB VIDEO CAPTURE DRIVER
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
