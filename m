Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72784C77B61
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 17:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DUxuS1DR9IQWQsGm/lflV2qoVhgduo0GYfb7Hj/wGMg=; b=RNu097Sic7GWAM
	Yh68F1PyEfnfoj726VLesWbIllytnDNar+ekB0WotvFSqeY09ot9AJwHKT1AIl1EN/RXwilzBO7mq
	cWbLm4gO2oFKouA4FbHPbEvbFVsTAE1I+2RYz4FxbmQKPrbH0pwF5OAEK3bTuRx73Pjl+HFZf0iKO
	PgerIH0tezDRr6YiVLijAjsIb+7sF3ohjVMtMzNRBFjpUDKdKQi5kMGFhcoIaIU9FNDW7tkSOq3fO
	bD/9E0YDy5xToyPHP5uCo2Ndacd2m9gSr526zqmKKWox9TDiCtLD/oVyiNCzQMi4qDPrM70F/hVo3
	AKC+fEnH3KhZAmaAOsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqDp-00Bo7a-04;
	Mon, 27 Mar 2023 17:01:29 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqDk-00Bo6M-34;
	Mon, 27 Mar 2023 17:01:26 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17786581fe1so9937299fac.10;
        Mon, 27 Mar 2023 10:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679936483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiTyBpredZ9G3c2Qr8ZySRrki6vsviNzT8Ei0s2GCWs=;
        b=0a9t/8rZdY8gaElHc1pS6lbIkfIbi7GqLonWdLE3HTPabLmFHdIeIqhu6WQkindPx9
         dHXT8OBwwkkb3dOH+PuMy6cxf+DNyujrIw6AvBkFYjNqkxj9O4GnGch478mjEzCjHFUy
         R9LZxaFezZfpHZZNumxNlLGs6yWr4Us5FGy1X4hKHoCEmBDWxDp85ayW0zW53pJsGSu4
         KNPdeiWX5jSPml2V28Ps9OBE5IWKVTR/RNPhHuRINi51B8//83B4DB+ikaIfX8++GTsq
         DoNhvv0z5d2ffkzCZO8xSVfVAVF3zGCJsyfuOZmQalF9h6Jx3spFE2KDSdt0WwaKySDd
         xFAA==
X-Gm-Message-State: AO0yUKXj7MB2u+ibxWk/8Js+NHYRhVp5CX/PolDcS4BzgKd4y682EMXi
	w0RlLa/3ferunm76OhSzVA==
X-Google-Smtp-Source: AKy350apFLu0p89aoZfe3hbeUVq/LGMiZBqIYewYKZlim7HEkNZnKA09d3D1uR6qEYhHiwbYrEbXIQ==
X-Received: by 2002:a05:6870:c5a5:b0:17a:d08c:c8a8 with SMTP id ba37-20020a056870c5a500b0017ad08cc8a8mr7880979oab.44.1679936482131;
        Mon, 27 Mar 2023 10:01:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b1-20020a4a98c1000000b00524f47b4682sm11527277ooj.10.2023.03.27.10.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 10:01:21 -0700 (PDT)
Received: (nullmailer pid 4103173 invoked by uid 1000);
	Mon, 27 Mar 2023 17:01:20 -0000
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: remoteproc: Drop unneeded quotes
Date: Mon, 27 Mar 2023 12:01:13 -0500
Message-Id: <20230327170114.4102315-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_100124_994518_E2FCE67A 
X-CRM114-Status: GOOD (  10.23  )
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml        |  4 ++--
 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  4 ++--
 .../bindings/remoteproc/ingenic,vpu.yaml           |  4 ++--
 .../bindings/remoteproc/qcom,glink-edge.yaml       |  2 +-
 .../bindings/remoteproc/qcom,smd-edge.yaml         |  2 +-
 .../bindings/remoteproc/renesas,rcar-rproc.yaml    |  4 ++--
 .../bindings/remoteproc/st,stm32-rproc.yaml        | 14 +++++++-------
 7 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
index 11cb42a3fdd1..3100cb870170 100644
--- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson AO ARC Remote Processor
 
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ae2eab4452dd..0c3910f152d1 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NXP i.MX Co-Processor
 
diff --git a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
index 85b1e43cab08..8b55dbd909b0 100644
--- a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/ingenic,vpu.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/ingenic,vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Ingenic Video Processing Unit
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
index 15e6851e1ff8..7b43ad3daa56 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
@@ -15,7 +15,7 @@ description:
 
 properties:
   $nodename:
-    const: "glink-edge"
+    const: glink-edge
 
   apr:
     $ref: /schemas/soc/qcom/qcom,apr.yaml#
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
index 7ec8a6b6682c..02c85b420c1a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
@@ -21,7 +21,7 @@ description:
 
 properties:
   $nodename:
-    const: "smd-edge"
+    const: smd-edge
 
   apr:
     $ref: /schemas/soc/qcom/qcom,apr.yaml#
diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
index 7e0275d31a3c..4bea679a0f61 100644
--- a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Renesas R-Car remote processor controller
 
diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 66b1e3efdaa3..37c0d7b4ceef 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics STM32 remote processor controller
 
@@ -29,7 +29,7 @@ properties:
 
   st,syscfg-holdboot:
     description: remote processor reset hold boot
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
           - description: Phandle of syscon block
@@ -39,7 +39,7 @@ properties:
   st,syscfg-tz:
     description:
       Reference to the system configuration which holds the RCC trust zone mode
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
           - description: Phandle of syscon block
@@ -95,7 +95,7 @@ properties:
       (see ../reserved-memory/reserved-memory.txt)
 
   st,syscfg-pdds:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
       Reference to the system configuration which holds the remote
     items:
@@ -105,7 +105,7 @@ properties:
           - description: The field mask of the PDDS selection
 
   st,syscfg-m4-state:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
       Reference to the tamp register which exposes the Cortex-M4 state.
     items:
@@ -115,7 +115,7 @@ properties:
           - description: The field mask of the Cortex-M4 state
 
   st,syscfg-rsc-tbl:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
       Reference to the tamp register which references the Cortex-M4
       resource table address.
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
