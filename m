Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BDAC76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RypvUGJOk+sSD86UpeXShsc6KzLoQvSXQOT6KkZWbA4=; b=HSGbjfjajUwVaA
	GAAs8XFRkmJI0uD+4avwyjrXbwh5FHTXYTvuhJ+vrq4K5sX4h5H37A7erV4uZ8q4ECqWsYNMbc7D3
	b2RfhnPCNFDBeiPIz+xun5y7bHKqTac+slREbLlKesbL4gaHoyadKiB+c1UsBw+3JF0+etaqsuduu
	CFuJQNJSCxKtJSbEfr3pm7DT7MZK/1exRN4RqETILN83ZFSd+4GMFNw4UjXQymRzD9qm13vrsB/Y9
	iLikN7k4Q/ef6zWoT7JGQFf35TnYXe2DfdqfRGs1XusuhmZAJOfmbmgxV+mvsW3ut30sCYtA7F5di
	HCsVylsUFmyjXhYIB8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqF3-00Bojk-1q;
	Mon, 27 Mar 2023 17:02:45 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqEy-00BogF-24;
	Mon, 27 Mar 2023 17:02:42 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-17997ccf711so9997307fac.0;
        Mon, 27 Mar 2023 10:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679936559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIK1w+CXfgSPJmxTqeF0/WQOBbahQffqFqpwRnNFhjs=;
        b=ezMN/FVjQNfVExTXLPCXm19D6NH5e6npQ3T8ppMISTDK+VxPDMe/G2/nUvbqni8yEp
         f1jryggodY77esbz8UkZ60dIMV13qDVMYQiyARMbnsJ845hUQED44k16QoeincEUEtjL
         BQ95aj4VEGEVnMzeMntujYFOk4WfKbj66TzWlpplGbmmZ8xug8EBfn1y7B4V/UqPBAvM
         vKQJQDKOSYMaCai/2rXXG6jtQfN8Xx8o7B50+2us6Jee6P+JFbDJ8CPywLuTV2jFVHbj
         gLpXSIx2fcDdWlcvKhCvCHhHUT7alkXiVvXne354OFre6i/FWMCaAkafodPD6PgAe4ol
         cwpw==
X-Gm-Message-State: AAQBX9fkm7IBlAonkZzc7JM8bo6ZoFJ4yoki5AnjV36JzHo75G+pDGHk
	VIiur499bjYzZ1WVMUkZSw==
X-Google-Smtp-Source: AK7set+MgI/6QDWdbY7OBxPG8ErWpLlNItv/Ke5WnutBBXElg5yFH9Vd1Qk0S5csPH3n3Vjv/B4wYA==
X-Received: by 2002:a05:6870:8289:b0:177:ab68:aa9e with SMTP id q9-20020a056870828900b00177ab68aa9emr7503297oae.21.1679936559347;
        Mon, 27 Mar 2023 10:02:39 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id vd21-20020a0568708f9500b0017ae1aede32sm9799431oab.46.2023.03.27.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 10:02:38 -0700 (PDT)
Received: (nullmailer pid 4109396 invoked by uid 1000);
	Mon, 27 Mar 2023 17:02:37 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume La Roque <glaroque@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: thermal: Drop unneeded quotes
Date: Mon, 27 Mar 2023 12:02:33 -0500
Message-Id: <20230327170233.4109156-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_100240_695811_9B105941 
X-CRM114-Status: GOOD (  12.13  )
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
 .../devicetree/bindings/thermal/amlogic,thermal.yaml          | 2 +-
 Documentation/devicetree/bindings/thermal/imx-thermal.yaml    | 4 ++--
 Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 999c6b365f1d..20f8f9b3b971 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -30,7 +30,7 @@ properties:
 
   amlogic,ao-secure:
     description: phandle to the ao-secure syscon
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
 
   '#thermal-sensor-cells':
     const: 0
diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index b22c8b59d5c7..fe599e443eaf 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -40,11 +40,11 @@ properties:
       - const: temp_grade
 
   fsl,tempmon:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: Phandle to anatop system controller node.
 
   fsl,tempmon-data:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: |
       Deprecated property, phandle pointer to fuse controller that contains
       TEMPMON calibration data, e.g. OCOTP on imx6q. The details about
diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
index f09e8723ca2b..145744027234 100644
--- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
@@ -29,14 +29,14 @@ properties:
     maxItems: 1
 
   fsl,tmu-range:
-    $ref: '/schemas/types.yaml#/definitions/uint32-array'
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     description: |
       The values to be programmed into TTRnCR, as specified by the SoC
       reference manual. The first cell is TTR0CR, the second is TTR1CR, etc.
     maxItems: 4
 
   fsl,tmu-calibration:
-    $ref: '/schemas/types.yaml#/definitions/uint32-matrix'
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
     description: |
       A list of cell pairs containing temperature calibration data, as
       specified by the SoC reference manual. The first cell of each pair
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
