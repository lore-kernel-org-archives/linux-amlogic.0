Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540EEC3A5A7
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIkMHk/MaAkpqachlS8NMcgcKe2wflbV599y3xAJjvs=; b=s3q6s7upeCLXfL
	MqXcpqZr/T39Zd86eYRiVVjGLfbcam5ZWG2GRfkaP8t5PW92Q4uW/yb2zobFd/SGdME3wyBSOwndG
	89cGz0qBTJG+xqeV9hHPil/sc2o298Ky95MPBRwQxHnWlEmFnfFsNvyCGGY/FuvuVt6JpNDZ9vk/p
	1ZO9z32eHarrTCkdnB63pGRomqTyxUY+RMvyjrF2yM7uhFSRcrCfY+YTLErva09lXf/7IW6cOrgFB
	9xx/N/yAsiKIjvuy68SkWyb0Nd47nBu+7DC2QJ6CuCBq+7inmbzwRPl/cYSSLyc7x2Lpp9PyikRWK
	lxPn3QjhZhStgoMNR1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3F47-00FDic-3H; Thu, 08 Dec 2022 11:27:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3F45-00FDQp-6g
	for linux-amlogic@bombadil.infradead.org; Thu, 08 Dec 2022 11:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tOenoxBAkNYKXtwJphgPxrD71eAFNMzynp+gZ1XToN8=; b=J2+pxlYw9PwgMpiAwzmsyKiQXv
	r8tlhfEEnYdsBunmgrKQhYVVqI+NLGVGq4RC5mcaiMw6c1AkZLpkmpSMsjXzqLHvKWxgjSu4TLMdA
	V4ALiT7FYOoz7jmoEdL3cBF4Ek1T18CztBXahVXkMldC2BZHiihCBuk2TD8K7ngHPmcKzKHd2WxqK
	Js2HDGeDnoPVarS6UieZgiWfDdzTtwz4Kt+O+1vUti8Ji0goiB8O7OVcunij5kmg8dY48ZFhrrbd5
	NgNGpGEfW4Is5MyAKq32NUyVlX31YDjBgzsiehap3vd+1HDf2Bsypb4x6OmGLQsz6dchSJZf4V//F
	HGakeKVA==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EBv-008ULz-An
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 10:31:50 +0000
Received: by mail-lf1-x12f.google.com with SMTP id p8so1346489lfu.11
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Dec 2022 02:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOenoxBAkNYKXtwJphgPxrD71eAFNMzynp+gZ1XToN8=;
        b=o8XngGocPIidvkgu1fvEeMsGR11tSM/kYyqUqKm7FpJQJ66qrn3pqm+bYgclP5ofk+
         TNmKnBzMOk4TwnRyzP2jmoJZku7RjbAvM88wzsS8+QB5sylMOkdkvaYLNdi1Noz/fYOP
         zTl0P+Q1wY3I7pSmhYzJwaeza5idzjZkWEANuEtUwxsyes8RoRMbGd0O4bN9x2zvjW0S
         5GL8YXAfRtvGM5BVvTofghv6RUF1GLUQ5lmDguLlinFoA6I1UosPgqMdDOnkKdflgL51
         jJyllTWEoCsEJEYj/eYw8KdWdugJrpL2ua1EAxclSWCLUS1uXQICMaSAVTwXpkWbcRn1
         0lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOenoxBAkNYKXtwJphgPxrD71eAFNMzynp+gZ1XToN8=;
        b=58cioLS82zso6F/eS/Uhw1BgHvqoVQ+6dCrVXkGiF6XlZmBJlNtMrA234oKMIKmBhp
         YNgsR//0sjE3W2roDvInd/3fvfJQ7OneT/vvKTku2NC5N9ZL2riBipe6UzfRTe2PP8as
         qRZJLxZX0SEr0lvW6eJZ080iWdpcCNNFVMxMF7A8GoSjKpftbwRw7pIwD0n1uXsk5ABw
         qL9xz9tB5MH5EPkd2t/zWmQnq58uE3R12A6M0mGQXIf/o36/MpjHngb/NtEwWdTcTK9v
         3SEj5lQXtamuUch6uEQo5vM41kq++WuSoy+0OmssIv1KZEGK116IXJHgTJIN1DOK0n21
         PfhQ==
X-Gm-Message-State: ANoB5pmtFVOQym0Gd6CHEpPPX1QJN2220z3n9pRCtRrJcHaSN0rhQhOo
	vYkZh9/nD4eBotBTSaqLBys0BA==
X-Google-Smtp-Source: AA0mqf5Y2tquohXS7bzsUue4GL0BjG+LX0Iq+Q1kZ6k810S5E2OSvWojoqn8UWHdEWQhan3K4yYo1w==
X-Received: by 2002:a05:6512:acc:b0:4b4:bab7:d5a8 with SMTP id n12-20020a0565120acc00b004b4bab7d5a8mr25682371lfu.404.1670495502030;
        Thu, 08 Dec 2022 02:31:42 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:31:41 -0800 (PST)
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
Subject: [PATCH v4 8/9] media: dt-bindings: nvidia,tegra114-cec: convert to DT schema
Date: Thu,  8 Dec 2022 11:31:14 +0100
Message-Id: <20221208103115.25512-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_103147_516499_39CCD0D0 
X-CRM114-Status: GOOD (  17.35  )
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

Changes since v3:
1. Correct path in maintainers.

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
index 197351d3bb57..5c2593f346f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2999,7 +2999,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/tegra-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
 F:	drivers/media/cec/platform/tegra/
 
 ARM/TESLA FSD SoC SUPPORT
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
