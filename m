Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F876C352A1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kk7OSEbVQxQJ+Id1AWfx0R2+mmYAwbE1pUNsiD+g8VQ=; b=N4z9NdhHrQg7wo
	+yj1JiGg+gDGNDPZfLRnM/+t93EZjHU9Wd9ukCbHqlPnoS2rPIPAdESERJzGXnYeWXJ2lTcNpsiEK
	lXxXdKaOPBVGyReI+B9LJDAe5j3xJBK1DtCdIQjuxMgrwDKeObzSZl9OgAHvjo1XFI4L2pf4moS5o
	7zqgIBM5vQzPjufFLAThShR7XVxDRiuvHjQpbTXgFa+2m5SQF0iNf9J/KExxM4H2saisNRpIOKrXv
	2d197R6UuKDNamVDOJeEbSxNCW/hIGPiipDlzR4e8JyqTekIVQ/5iEI93nn9KwSlDB/2X+ernmf1t
	NcfpP2CK+WiVcGyP1Z+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rcX-00HD5R-5D; Wed, 07 Dec 2022 10:25:45 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ra4-00HAd3-BA
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 10:23:17 +0000
Received: by mail-lf1-x133.google.com with SMTP id b3so27951434lfv.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM9WQMSIRdXApIoaHecsAc8xlOdjlTCuk4hJZlXZk6o=;
        b=oOm0/ChZZbipR9FpLHwJ0+Yep6zyb2Kt/48SXcMWo2R9RGPNcR3M8PM7pUCGO0WmoN
         AFlXzZOyrI5OJhoUW8+xBVEQFkhZ5nJvWtCH1WXZsx5hcfZPL97pMlViMK3WGEuQxlW2
         4wBs1HGzZPucTyD3LaA39g0anfOGB+GrV+H0C/WYCcIHoPd+93+IwRRfi97m6n2LN6gT
         1T2ts29S9ajtkpa2LOgzWgCV9K5ZsfBrm2wXWsk2aTv/DeJKkA/ozZDtlYaoPmyI/8Vy
         L0SPdDf7U2hW3JjMyw6gZaiMdwZlxuDJq/vTBeD/0CDw2kj1nn0Ev83TJ6i6GwjoGqoU
         6DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM9WQMSIRdXApIoaHecsAc8xlOdjlTCuk4hJZlXZk6o=;
        b=pMu8ECmBbbqQqcZJIZ/iMOzl+jYiPP/dtP/Y8jHQ/li2kyyFY8kfPWLaS3oDq8y1Ic
         DBSQpp+qf/0jJ7pH3IVX2vDPv/aFZetXIsRS70adxYHugsbMDKNd+kUCTIaZM/nWQx8p
         ja9Z7JAUXRkeVvRRLCuhwC2/8XU/VnuFY81Esm5+UgGe7gHsMEQnTPhlUzoVY20efu6u
         rirxhPx1CERITY/UmXUKfjP8AtcE8NQuXl75+9GlXSIP6itpmlHaLLthKvays5Qc+ve+
         geX0Aa2zEY293RdcwgmxQxCwoSKbCzKtP6YRBPmeni+LNvmqv56Cv/ckPcxyPQ7mQwaw
         CNbA==
X-Gm-Message-State: ANoB5pnhMncYyyVAg2gDesCHADEgQIdvzrv9lBL8kbNG9mmseC+TkIcd
	6OgEgAJzLEtoWh4WIkSeLus3cw==
X-Google-Smtp-Source: AA0mqf4i4pan9nVuFZyQ3Pgc1JmG5VLJywzu6/33XHF1cay1j9OCzA8QqNXiMLd9ghuMyhS7QaqBWg==
X-Received: by 2002:ac2:4bc8:0:b0:4b3:9fcb:df92 with SMTP id o8-20020ac24bc8000000b004b39fcbdf92mr28983114lfq.607.1670408591839;
        Wed, 07 Dec 2022 02:23:11 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:23:11 -0800 (PST)
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
Subject: [PATCH v3 9/9] media: dt-bindings: st,stih-cec: convert to DT schema
Date: Wed,  7 Dec 2022 11:22:53 +0100
Message-Id: <20221207102253.26663-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_022312_434042_2C650A07 
X-CRM114-Status: GOOD (  17.54  )
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
