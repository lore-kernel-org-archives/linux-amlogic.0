Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C85BE77180
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2024 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QjcQdQBzeBxJsugOKtkcDhSMSX/hu8CT8IOK5GxzNbY=; b=kOMcyVDU2bIZWu
	qPAdvfHzgj0f3SFeDEqhmrIsIXfFeptCRt6mwSURXTuGLHn9cazTbVe1QOWSe9osMLc51OjNI5ceH
	4l/foIzILZH3nIMg1DRCe+ZhmII9cKUsSHNSNgqDVQmmOf2wVLVh5gJr/iXQMUiDxxnrH3HplShXd
	xYuDawWskdw22Y5IvBEEXO/ewwnjIa8qKqKPSJy8IXpcJhvM/lUqyihBG8Mj3p8vCdXRgqfrdLe6q
	liWqIfILa3b4vQwGW+RgGIFPpJtA1Scp3r6isZyiJU/Xtsek92ptTRNXD1ZLN55FyaUyWrNrvP068
	HzF+Lya4lw36YyWv3bFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIzA-0000000EPs0-2lRe;
	Wed, 11 Dec 2024 09:26:24 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIy5-0000000EPXL-0m1J
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Dec 2024 09:25:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa680fafb3eso41470966b.3
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Dec 2024 01:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733909115; x=1734513915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NXcqVV41GkS5OCdhP1LRH9L5Mcp24WkFvJlZaO+kog4=;
        b=i57MOlTs9fI0fJww6ySsf+aZPyEh/mXyws0ZzqbFVXm0IwDjU/RHhc7vtUliVc9cDy
         JQFzCGlbwTmm/RA9Qglv7DkRkmbO45kb4K8qfX5srCVOQeEwT/vmZ5AL6suamnuHOJ/o
         Z+TcpCGCFB/E9DX3NmToVOc4hiM78ajDBsuSyjYFsDb61CSXcA04iIY9IBPnllT4DCMZ
         CA0hfBzHsTIr1Nm2q7J0RPpiZ0W+lBH47AXLbU6xpl3dVkUTk2dYBP22ViY2N4gnZOFG
         uii9bMCShrYLGUkJVGllUl8RkXEVaUhXnv8iyxRjQGKawEd11WSs/ptdkNOQHGo886GA
         rVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733909115; x=1734513915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXcqVV41GkS5OCdhP1LRH9L5Mcp24WkFvJlZaO+kog4=;
        b=FnfLB9WKk+1a1Co5TjEZOxrLBaR8+8Muv3QHKhKTiRAAU8qV87u/ds2Oy+i24nqd/W
         ZmUGPRIKzVDYCA6Ih2l1opDO3+egdXwsjc9kSUuoCxUBa+YrA7XP4aCvp9Mv0klaPQ1g
         CHuE2Nceyf6xMfXWfV9iRt0FlwBN3N6TKQvAsXCUWwZ4an5Ffckqw7gj29shb0XgMYNa
         8iz9d7vkFhwVvEHrlrGSg/kB5OkXq5h4zV1k3Wptv1wc7O+M/8+YR72ZbYvLGXJ8YFuW
         WjsplQavTDuTNzidHVhJFmx7rLtJ3dPDzEpTTPt2MHcOwdl3sWZRCKC+0DIK6SI55W1V
         dkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9LIOLsDwb5s4tDpqNGauVJy3mqBK0b3IjuyHiA17eY4Xv1ENVEZ7LVFwC4wQZTdJ8dsOwrTSY5JZubncz@lists.infradead.org
X-Gm-Message-State: AOJu0YybqImcaSqBbpMrQfcpoC6sqAcmrHowNX0ezaapGVLM0IE2wfM9
	dWA7G7ubl37CYIy2C8Vn4SRb5wPo/hMoEp8019HxBUxqVDE2Lm/Llk7HvUQGJbM=
X-Gm-Gg: ASbGncvIWD19lQ27w+J9q6m3TOLBi1x+doMPh534w4zKUdLoFTw/kQSpmaTjkciTSw4
	FO3zOndBkQz1MyQSCr6MKJxWNk2E12ywOQMvp0FN+/D24B/uic8j+2qfF4KB5dPhrXvK5jYWqzm
	N7eaoA7yHEvDJGh/WVrWRzksNMBDHnm1cMRe8/qICuikaA3ykWjY2G8eHBnBwDPW2VTP7L45WR4
	8EGK0dbIosXYm3xw2HiUvNMMMLkWcOCoqEie2/afJiPSvUl/7XZLfUh2Zy5E0DhV+gv
X-Google-Smtp-Source: AGHT+IHFyHBEA5HZHRpwyOqKtZhm48a+yS1LNgYQVR3j87nj6Xk8rdjKvJ/QyHwbpikKDarceoIpOg==
X-Received: by 2002:a17:907:3fa7:b0:aa6:79e6:5b03 with SMTP id a640c23a62f3a-aa6b116dff6mr82732466b.6.1733909115063;
        Wed, 11 Dec 2024 01:25:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa698a9b74asm333831466b.140.2024.12.11.01.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:25:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Shijie Qin <shijie.qin@nxp.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Emil Velikov <emil.velikov@collabora.com>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] media: dt-bindings: trivial white-space and example cleanup
Date: Wed, 11 Dec 2024 10:25:09 +0100
Message-ID: <20241211092509.34342-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_012517_226764_AB90912E 
X-CRM114-Status: GOOD (  10.99  )
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

Minor cleanups without funcitonal impact:
 - There should not be an empty blank line after SPDX tag,
 - Convention is to indent DTS examples in coding style with 2- or
   4-space indentation (4 is preferred),
 - Drop unused labels in DTS examples.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending second time, because I missed previous Rob's review.

I added now also Bryan's and Heiko's reviews from last resend.
---
 .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  1 -
 .../bindings/media/amlogic,meson-ir-tx.yaml   |  1 -
 .../bindings/media/amphion,vpu.yaml           |  1 -
 .../bindings/media/fsl,imx6ull-pxp.yaml       |  1 -
 .../media/mediatek,vcodec-decoder.yaml        |  1 -
 .../media/mediatek,vcodec-encoder.yaml        |  1 -
 .../media/mediatek,vcodec-subdev-decoder.yaml |  1 -
 .../media/microchip,sama5d4-vdec.yaml         | 17 ++++----
 .../bindings/media/nxp,imx8mq-vpu.yaml        | 41 +++++++++----------
 .../bindings/media/qcom,msm8916-camss.yaml    |  1 -
 .../bindings/media/qcom,msm8996-camss.yaml    |  1 -
 .../bindings/media/qcom,sdm660-camss.yaml     |  1 -
 .../bindings/media/qcom,sdm845-camss.yaml     |  1 -
 .../bindings/media/qcom,sm8250-camss.yaml     |  1 -
 .../bindings/media/rockchip,rk3568-vepu.yaml  |  1 -
 .../bindings/media/rockchip-vpu.yaml          | 29 +++++++------
 16 files changed, 42 insertions(+), 58 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
index a4f06bbdfe49..8ba5177ac631 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/allwinner,sun50i-h6-vpu-g2.yaml#
diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
index 377acce93423..6da8a6aded23 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/amlogic,meson-ir-tx.yaml#
diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
index 9801de3ed84e..5a920d9e78c7 100644
--- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/amphion,vpu.yaml#
diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
index 84a5e894ace4..3f47744459aa 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index b401c67e3ba0..d726d141a434 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index b45743d0a9ec..110e8f5f1f9e 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index a500a585c692..5865e6f0be89 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
index 59b805ca47c5..ede086d55add 100644
--- a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#
@@ -36,12 +35,12 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/at91.h>
-        #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
 
-        vdec0: vdec@300000 {
-                compatible = "microchip,sama5d4-vdec";
-                reg = <0x00300000 0x100000>;
-                interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
-                clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
-        };
+    vdec@300000 {
+        compatible = "microchip,sama5d4-vdec";
+        reg = <0x00300000 0x100000>;
+        interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
+    };
diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 3d58f02b0c5d..19528262810a 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#
@@ -44,26 +43,26 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/imx8mq-clock.h>
-        #include <dt-bindings/power/imx8mq-power.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu_g1: video-codec@38300000 {
-                compatible = "nxp,imx8mq-vpu-g1";
-                reg = <0x38300000 0x10000>;
-                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
-                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
-        };
+    video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu-g1";
+        reg = <0x38300000 0x10000>;
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+    };
   - |
-        #include <dt-bindings/clock/imx8mq-clock.h>
-        #include <dt-bindings/power/imx8mq-power.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu_g2: video-codec@38300000 {
-                compatible = "nxp,imx8mq-vpu-g2";
-                reg = <0x38310000 0x10000>;
-                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
-                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
-        };
+    video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu-g2";
+        reg = <0x38310000 0x10000>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
index 9cc0a968a401..3469a43f00d4 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
index 5cb0e337ea6e..644646de338a 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
index 584106e275f6..68d8670557f5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index d32daaef1b50..289494f561e5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index 06db2c1e6079..a372d991e652 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index 947ad699cc5e..d246f5d38427 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/rockchip,rk3568-vepu.yaml#
diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index 719aeb2dc593..8c2501634080 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
@@ -92,18 +91,18 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/rk3288-cru.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        #include <dt-bindings/power/rk3288-power.h>
+    #include <dt-bindings/clock/rk3288-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3288-power.h>
 
-        vpu: video-codec@ff9a0000 {
-                compatible = "rockchip,rk3288-vpu";
-                reg = <0xff9a0000 0x800>;
-                interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-                interrupt-names = "vepu", "vdpu";
-                clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
-                clock-names = "aclk", "hclk";
-                power-domains = <&power RK3288_PD_VIDEO>;
-                iommus = <&vpu_mmu>;
-        };
+    video-codec@ff9a0000 {
+        compatible = "rockchip,rk3288-vpu";
+        reg = <0xff9a0000 0x800>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "vepu", "vdpu";
+        clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
+        clock-names = "aclk", "hclk";
+        power-domains = <&power RK3288_PD_VIDEO>;
+        iommus = <&vpu_mmu>;
+    };
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
