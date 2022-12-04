Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927AAC4321E
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Dec 2022 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51+/NwPdSzhqogOu+ned/D149eMiBUQllrlNKDITjKk=; b=MKUNScfrxdfSNU
	LifrZj9s+km0VQB8KgWJtWQ8voP0GhyrNnULo9LGUKABNo+vkSX9HkbiA4Q1Tb7qqwr0tyZ5u7jjQ
	EMqRxnWrnFES/u9e5LLBnf4pjY7xpHxu3TATwX8G91oMXkkj8wiDVK8r/WXziKUiXz6CheVh2UKBm
	N9WlnZJBEGqPRs9kCm4VAbla8TeXmb+93PDC/w7Jgsb9QURS4hdc+lSFsaja+tZ3QJyOF3+5/31AW
	p+Tb8KC2qg+O7gz3R9PiFHXk3//M+2mm/VcXNzVR3HiANrAj2E0NO4eqqiSOMvc5GsR/5F7S75Q6R
	AmToPO9o0G4w51HXViNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tog-00ANKB-CO; Sun, 04 Dec 2022 18:34:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tkY-00AMQb-Aj
	for linux-amlogic@bombadil.infradead.org; Sun, 04 Dec 2022 18:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9aazsYiCUK+hhkaN7DSb9BXLEifN4Vj66BPeUPEEPTM=; b=JVceUxphNiFOOCNM5vfBe6yKmt
	CT8Dq+TfzvDB7A+QgPuzSc+5L4FVgo6//koP/J8evQiQoUZb3lhBbrANvKunU6HRReWr7RACRiy4M
	z6FjE4zN2zEGmGM0KHM+d7HqMxanYIdmhFIPun4MIYGEaMqk6JnZYzZTczYShnBv6f6lSjumtxFOB
	nukWIAb7tl9ElckD9m5iWaGGMR8o2H+nmC5M82/36kdn3zhqNPJ5Jbkkn3vuHZKyvhXZlJZw2om0t
	dotZWHBvNuhLUqdD73jtESueqdMB/+tsahiW6InJJoEYG/7C/etBWjstgrEmZ+iEYv6AQVv0mLome
	Ux6eqkKg==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tkE-007NOR-2K
	for linux-amlogic@lists.infradead.org; Sun, 04 Dec 2022 18:29:57 +0000
Received: by mail-lf1-x12f.google.com with SMTP id b3so15352904lfv.2
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Dec 2022 10:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aazsYiCUK+hhkaN7DSb9BXLEifN4Vj66BPeUPEEPTM=;
        b=sSRku4Abu4TUaaSejWrqY4U2E+YKf38PkhQg7Na1Bm47oQYnpZAGAQbDgfOtnzbwxI
         trEp6uS5wDke6RK9pH9vquIxLjo7Kc1apCRrqGlSaFBDZ52Oo4kCD6nwxjIH6fY9g/bv
         4PXYVD3QKo8J+qGvu42EvRRoEUKgvNbwl+7ntPkS3NzXisMxcbXzrOv2mMEj3cskeKK4
         B/+cblGTNaXQRS7ZNl4BbMgdp0m9I9nfbmRsz7NfCjtnJZ/mCLAd8RjqXB/saPPkp4OI
         nYJecI7/PDqQVLpEJHktPEJfXLiB73KDmAvPxBH1CmxHhQJ+7aPVgeyZFp4pyBCQqoaG
         M6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aazsYiCUK+hhkaN7DSb9BXLEifN4Vj66BPeUPEEPTM=;
        b=ac3oSKFGEJX+xClNECPqmGCILbFSZW8iPz79FAG6b4IDB+/6hNI0gi3ycQRprckftw
         gKlktfT/NYjsxYvhmWRGMhTHQ/OcJxBQPuGFLhdf3ZtsWC4fYwLK6++rmLFK5ZrIDELK
         aQzCIwtd9Q7gA3xTMzlFEuyxm3UjzW7fPEJ9lUw+c0WLVIgDpGgnzkmDV/qj+qJryrOp
         F6tO4lsucmqbbRWELbgxHh9R6/a16f+eqjXttmlKr8oKDZvyrEozHHVAjel3AELFfhY2
         K+cdQM8EdW607IPGo8xBn1d9plJi46YXKh34TLOD9SwveFQVKfxjn3bpLPzNkhq/Aa8b
         6QhA==
X-Gm-Message-State: ANoB5pkj8kjA71gCi/uPlW6M2r3y1rwaJ1yUvS4aSU90SsNVsrMRUzek
	z0RNd4r58hw+HPL0iQYBtlPToQ==
X-Google-Smtp-Source: AA0mqf7mde+fLncLGsqsu74oY7mom6NfLqupJzr3yJpn1m89tEjsfinULx30yTOV4PY+XU3wyD2ilw==
X-Received: by 2002:a05:6512:16a4:b0:4b2:5c79:ae9c with SMTP id bu36-20020a05651216a400b004b25c79ae9cmr25280095lfb.619.1670178570118;
        Sun, 04 Dec 2022 10:29:30 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:29:29 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 9/9] media: dt-bindings: st,stih-cec: convert to DT schema
Date: Sun,  4 Dec 2022 19:29:08 +0100
Message-Id: <20221204182908.138910-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_182954_103851_06684DAC 
X-CRM114-Status: GOOD (  17.30  )
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
index dee3f776be32..5bf8879b4a59 100644
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
