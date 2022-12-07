Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60DAC4708E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaIWXFC9LMmg3F4Vuf+UG6qYuxe8CeELJA6SLU6wyiE=; b=CjA2tlfRTPHD4t
	NqsQFABIwDa7vWpvdD1EQ8Zcx3owZs6ciAr4b7n9/80onw88JF4rbMHjqkAr62nNTtIH/nICrXYfh
	lU7jWkLzRAtY8UPdtFB+wmR64cyNik/aaVwTpsZdnnybj7OYjGBccPiaPuqYrBfZ4d5TRmSpTkAT+
	t7kzLWvk7LHti5KsSRmW+HLCFQf9DJY+w1NAzLIuKoZgLbJbrW/TgsSK1WVJ8UO5qSV7/UAzuyooA
	zJL7tftHd45z6CQtzGc0XybtJkNBDSuiC0Kn8m1O/xYnzprsoRJodO1ieJtIF9yThsJJkk2sdGC0x
	n6ZszwubbTJL3QFVBhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rcV-00HD4W-Lp; Wed, 07 Dec 2022 10:25:43 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ra9-00HAtS-HX
	for linux-amlogic@bombadil.infradead.org; Wed, 07 Dec 2022 10:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4WOjKBqSX/bJNurWawr9UIxOhCwY9AfTE5WBw0ZvK0s=; b=Iy2u2I1k5+EvVgKP2z+bI/bPRA
	OjY9/Wo7rE6dY6dD725czHkD6pSfZCvSJpHObOu+N482W4VNl84Vv/a6TUNlrwb7UDkHuIrd4Lj4I
	A2ZScPNVA+d3uenj36caMHSI92UnwCMMhI45vK6RxPS2yUr1gd7NHI1Sob7L6nMMkIHS2mdd/+5Aw
	n8fG+hY+iSqChgdmtYuyMuBYgVPHKH4gU8xYp5ig4OmC4GBgwLmJaPtLlqd9yX74sXTHLItljAiwK
	qLJ/nKy8ElRk5Z6mRw+XoTFwUz/TSXqRejBIAAQ+c2OZq+60TIufsMkkyvhvL1teq4oFJjA+4BZKg
	WnQoLXHw==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ra2-008BOO-NB
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 10:23:13 +0000
Received: by mail-lf1-x12d.google.com with SMTP id d6so27940621lfs.10
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 02:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WOjKBqSX/bJNurWawr9UIxOhCwY9AfTE5WBw0ZvK0s=;
        b=DeQM6xRnfiSdaMP8oukCCK2af0Cj+1aL66olpRw8WNrvnr0qDTHiaN9sD05CbnnvJR
         DWKW0p8T3Lf38kXzN6/v4hUNzHDYTxaXvj9wJQlyHIB6q+jMiJzSHl2iIPlbE3TB/eld
         dVJVqPJ6XRMS7IzUwKlr51M7MTPa4n79Z4TQrW0brbGYHb/b4ennlqJDTkZGHsDI4+he
         3flAQDjvbd+7JJ8Ye1WBAhVN45mV9Pnlk5A0JIEuwvsvkLWZvw6pRv1RRZo34RqnYGDw
         U+Kj70Ga0SIjTKWelk3/apw7gWxk6XBhJKov3cwZzCzAhS/hhtSjjo1UOBAhzPZzKDJO
         TCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WOjKBqSX/bJNurWawr9UIxOhCwY9AfTE5WBw0ZvK0s=;
        b=dBKsxS+ZUiXOHT6rLZU1R9NMdaOqzToKwUQ3mDwu+PPkyV/gqRDHXlD09wTGKtnVMq
         CusUM+Hx99r6//vLfN2nNzxnA9fBuo+bhiB51IEmz1d9py7qoA9MuRqjg8i7F8Q/Xuy3
         LcGKI/i0vGSh2V4y1mAVLeo7GBI7RjA7ZW6ZG1eIUAjv1wAtLgLMx4MVsQwTQ9K3A0uX
         Auee1zm2Yf9If5ayLkG6JCNTpjsEHCb6zW0lRL8zisIcoayf6pMbjSwMtA2Qy8/mzebG
         pPlE6ebx9Ng5sjFhnGa6lUHNFj/8Pcu+47VUGxMVUSNXvLHdfi4AKEw2HJ2V/tblWZ94
         9o/A==
X-Gm-Message-State: ANoB5pmwpAPfVXhKghR1hOxr1oyuZoBTVEljhHhaCsquA9x2/cbQX9aU
	YAzz9CXvShDRd9WPOmGLrfK5Cg==
X-Google-Smtp-Source: AA0mqf4J0zL0WrlS4LLGj+qa03tSO2qLooF7xgibIAe/OWddv4WibIXv6pH+N3JWoeV4VeyeojNpyg==
X-Received: by 2002:a19:ca15:0:b0:4b5:9845:c89f with SMTP id a21-20020a19ca15000000b004b59845c89fmr182758lfg.127.1670408587036;
        Wed, 07 Dec 2022 02:23:07 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:23:05 -0800 (PST)
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
Subject: [PATCH v3 6/9] media: dt-bindings: samsung,s5p-cec: convert to DT schema
Date: Wed,  7 Dec 2022 11:22:50 +0100
Message-Id: <20221207102253.26663-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_102311_177776_E8FB43A5 
X-CRM114-Status: GOOD (  18.49  )
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

Convert Samsung S5P HDMI CEC adapter bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/cec/samsung,s5p-cec.yaml   | 66 +++++++++++++++++++
 .../devicetree/bindings/media/s5p-cec.txt     | 36 ----------
 MAINTAINERS                                   |  2 +-
 3 files changed, 67 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/s5p-cec.txt

diff --git a/Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml b/Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
new file mode 100644
index 000000000000..016c8a77c1a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/samsung,s5p-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5PV210 and Exynos HDMI CEC
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Marek Szyprowski <m.szyprowski@samsung.com>
+
+allOf:
+  - $ref: cec-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5p-cec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: hdmicec
+
+  interrupts:
+    maxItems: 1
+
+  samsung,syscon-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU system controller interface
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - hdmi-phandle
+  - interrupts
+  - samsung,syscon-phandle
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5420.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    cec@101b0000 {
+        compatible = "samsung,s5p-cec";
+        reg = <0x101B0000 0x200>;
+
+        clocks = <&clock CLK_HDMI_CEC>;
+        clock-names = "hdmicec";
+        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+        hdmi-phandle = <&hdmi>;
+        needs-hpd;
+        pinctrl-names = "default";
+        pinctrl-0 = <&hdmi_cec>;
+        samsung,syscon-phandle = <&pmu_system_controller>;
+    };
diff --git a/Documentation/devicetree/bindings/media/s5p-cec.txt b/Documentation/devicetree/bindings/media/s5p-cec.txt
deleted file mode 100644
index e847291d4aff..000000000000
--- a/Documentation/devicetree/bindings/media/s5p-cec.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Samsung HDMI CEC driver
-
-The HDMI CEC module is present is Samsung SoCs and its purpose is to
-handle communication between HDMI connected devices over the CEC bus.
-
-Required properties:
-  - compatible : value should be following
-	"samsung,s5p-cec"
-
-  - reg : Physical base address of the IP registers and length of memory
-	  mapped region.
-
-  - interrupts : HDMI CEC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to HDMI CEC clock.
-  - clock-names : from common clock binding: must contain "hdmicec",
-		  corresponding to entry in the clocks property.
-  - samsung,syscon-phandle - phandle to the PMU system controller
-  - hdmi-phandle - phandle to the HDMI controller, see also cec.txt.
-
-Optional:
-  - needs-hpd : if present the CEC support is only available when the HPD
-		is high. See cec.txt for more details.
-
-Example:
-
-hdmicec: cec@100b0000 {
-	compatible = "samsung,s5p-cec";
-	reg = <0x100B0000 0x200>;
-	interrupts = <0 114 0>;
-	clocks = <&clock CLK_HDMI_CEC>;
-	clock-names = "hdmicec";
-	samsung,syscon-phandle = <&pmu_system_controller>;
-	hdmi-phandle = <&hdmi>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&hdmi_cec>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 45402e03cda5..05acbaecef52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2866,7 +2866,7 @@ M:	Marek Szyprowski <m.szyprowski@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/s5p-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
 F:	drivers/media/cec/platform/s5p/
 
 ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
