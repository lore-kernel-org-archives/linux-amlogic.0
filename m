Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731C8C4708E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 10:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXogZhLtWWUXKaDZBIeBXfqHTOytzP7am8E6yDY5lXw=; b=H/FLnEfOUYvvIr
	SwU3oSC5SJhj00uU/Ed933ShgJ9z3+6AEffsNbWkKh6TjvYhsu5zuubftHCpDmswufYaMVAKHZg17
	tXVX6Y6GXAQyS9osDo7d9ZTMb2SRoap1ikEW9aqRX06S9fZDhTeUiWsmXHQ7JrR6gobKDrEx0u7HR
	87k162BsGwdTAn9mR9MbClP+SuQjYOuD0UZobxi/3TwFBOFGrVYqTxYocv9lVm60eFOORtQly67gG
	7DaDE3aIs4zYBK+TT6k+YQ1fNDI1Iu17kylVHMQG+AO5UURl83/90NPMTzJCojCTrtmER2GmEwSCn
	Z5rCeq+wTiMLNdT4zfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2re6-00HEGM-Iy; Wed, 07 Dec 2022 10:27:22 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2raH-00HB5n-2j
	for linux-amlogic@bombadil.infradead.org; Wed, 07 Dec 2022 10:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2AUwX2bZWFPRltw54sKVrGy9ss5uTmSF0GAbGdEL1cY=; b=O5cO48+shZlpU2JzEhsl4jsHe3
	7d2N+4pBYlvifx3wYa3ez21J0RMaliPznnqgz5SHDqP8chvv2lwnaaPLU6K/N1nogC/OSn6G7KlXW
	Cci7CJJv/0GnvVEXCWLu384NhY55zu9Dqq4qWEugL1a2m15i7S5XdqJKkdMQoALq85fJznGqTZCDK
	DL31beFsJc5K+RM5jGxZtddqiaESrEu/dVZVpSgoRNk/4+8zJJwp1xw2L5qJVqvbcrjcUqFYLN4lq
	a2GwABnakEBV3b0qDEsQbnuWBhM34yweuXoDRahNg1G4OAHBE3Nq+9yzoNVIA9Hab029sxmp7N05E
	gGrhPymw==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ra4-008BOu-84
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 10:23:22 +0000
Received: by mail-lf1-x12f.google.com with SMTP id c1so27958108lfi.7
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 02:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AUwX2bZWFPRltw54sKVrGy9ss5uTmSF0GAbGdEL1cY=;
        b=XB4U+5ZljqR/bbvMKNFN+vU986ORmhbBYnwpj6Uoaam4TDmCl6l8ew66p5/mQ47Epa
         z0o12IwUwbpEyhZcDHgTqQzPDIE5NrGOBVhdpEKEb0NGLGt/XpOkcGNL3LQRzggQftXp
         Jiha1ZD1+2g9OZZMRkK3JM2Vegm7aRTb3FHLE696vEYIfSgdkIW615VQ8/VnfpnwXnNL
         F9MYW0+YuG1aa3h/KjQ7Qh9jLBaIQAKMX9/DeIqWh5Y8VMIJo5BpBlJ098LdAUCwfGS8
         aBtx7RWJNGRqUD4stzuz9inChA7HS4LowmCH0RW3VGtGv00Gbe+Ft5RQ1BVUiXwbthu0
         o91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AUwX2bZWFPRltw54sKVrGy9ss5uTmSF0GAbGdEL1cY=;
        b=f6LtlQteCL2oIFDHMeSOQ/QIqx7p+cUMNCrMSATGOKbhdluaEC5A5cdYA22vKphD1d
         pr15tGfjzt27B0fS9PCpVdUEM9OtrzwXemvpefRwu/Q6aJ70qRq8lJribBtdpYd3emwc
         3+FyfkHXWy8NhTiiSaT27ZTuCYIfeAugqk9WvNLFHrdcIGqHfLOashYrpADXhMMQPi/4
         cQqNCjapNKCyc26Twl+ooIZlqXYEs9h/MXxpU1lfjWIzE7MYf3nx/d3n44raKFIOcFcx
         QS0zzeRDzjL0ZWKciDNT+Gk9m5BJTdV3gjEAzMFCt4su0SawkdzyZbS1Zf7m4eiGd/9L
         sKcQ==
X-Gm-Message-State: ANoB5pm49J3f6cuiC1ascvjPej084QCZIriq9GdahESR2ZAXGtt3UDz1
	uNbevMz+LQL9Ekx+s9MbqtZT4Q==
X-Google-Smtp-Source: AA0mqf4yC5k5Vs4wsmk6nVdssr0tS1Ijg5ULzsObdS7ZFIejpoMI85/cYKftYxb5UoYNwRrKvQ9Ilw==
X-Received: by 2002:a05:6512:1291:b0:4af:eabf:3c57 with SMTP id u17-20020a056512129100b004afeabf3c57mr23092457lfs.449.1670408590286;
        Wed, 07 Dec 2022 02:23:10 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:23:09 -0800 (PST)
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
	Rob Herring <robh@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH v3 8/9] media: dt-bindings: nvidia,tegra114-cec: convert to DT schema
Date: Wed,  7 Dec 2022 11:22:52 +0100
Message-Id: <20221207102253.26663-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_102312_394022_5713BC95 
X-CRM114-Status: GOOD (  17.59  )
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

Convert NVIDIA Tegra HDMI CEC bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>

---

Changes since v2:
1. Rename to nvidia,tegra114-cec.yaml
2. Nvidia->NVIDIA
---
 .../media/cec/nvidia,tegra114-cec.yaml        | 58 +++++++++++++++++++
 .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt

diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
new file mode 100644
index 000000000000..369c48fd9bf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/nvidia,tegra114-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra HDMI CEC
+
+maintainers:
+  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+
+allOf:
+  - $ref: cec-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra114-cec
+      - nvidia,tegra124-cec
+      - nvidia,tegra210-cec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: cec
+
+  interrupts:
+    maxItems: 1
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
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    cec@70015000 {
+        compatible = "nvidia,tegra124-cec";
+        reg = <0x70015000 0x00001000>;
+        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_CEC>;
+        clock-names = "cec";
+        status = "disabled";
+        hdmi-phandle = <&hdmi>;
+    };
diff --git a/Documentation/devicetree/bindings/media/tegra-cec.txt b/Documentation/devicetree/bindings/media/tegra-cec.txt
deleted file mode 100644
index c503f06f3b84..000000000000
--- a/Documentation/devicetree/bindings/media/tegra-cec.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Tegra HDMI CEC hardware
-
-The HDMI CEC module is present in Tegra SoCs and its purpose is to
-handle communication between HDMI connected devices over the CEC bus.
-
-Required properties:
-  - compatible : value should be one of the following:
-	"nvidia,tegra114-cec"
-	"nvidia,tegra124-cec"
-	"nvidia,tegra210-cec"
-  - reg : Physical base address of the IP registers and length of memory
-	  mapped region.
-  - interrupts : HDMI CEC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to HDMI CEC clock.
-  - clock-names : from common clock binding: must contain "cec",
-		  corresponding to the entry in the clocks property.
-  - hdmi-phandle : phandle to the HDMI controller, see also cec.txt.
-
-Example:
-
-cec@70015000 {
-	compatible = "nvidia,tegra124-cec";
-	reg = <0x0 0x70015000 0x0 0x00001000>;
-	interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA124_CLK_CEC>;
-	clock-names = "cec";
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 197351d3bb57..dee3f776be32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2999,7 +2999,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/tegra-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
 F:	drivers/media/cec/platform/tegra/
 
 ARM/TESLA FSD SoC SUPPORT
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
