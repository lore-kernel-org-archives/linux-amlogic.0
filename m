Return-Path: <SRS0=JomC=TR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C724C04AB4
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 May 2019 15:27:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0508C21734
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 May 2019 15:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q2OavZpu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0508C21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYnVaaHG7nJE1xSlMH4cYSIROmdWv2d4kCI7nRZ+cp4=; b=q2OavZpuNTLMAM
	ecM2NX1nG4G4U7n2nMuz0rjquIAoyshUM3uv4BZLavRBcXqXJS9sP9Eivf+a4CuqmEUQrpCMvYesm
	tS+4YjQ3U1zYMhUxgLmiX5lDwzynn2hbGU4X2PFCOfJbw2QCqzCRED0iwMTck2Fx1ygt+c3aqSGo7
	SdIsUMwE/knKATwH7kMkoNwCdgz2FRiAdXMb41DPhBZkFc1HVFv+RVYeCabrlTJWpajovHcuvp0+r
	z+7wlfZDsS+kbLxzXS+dTuVlyN2PB0sMYk2/U3hK2b12Fm9AehzTSRl9oqpS6Fdk6zB5ZMQlTLsgc
	d8ZNtLR/onzceD7Jnteg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRelz-0004Fj-M8; Fri, 17 May 2019 15:27:51 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hReld-0003qM-52; Fri, 17 May 2019 15:27:33 +0000
Received: by mail-ot1-f67.google.com with SMTP id r10so7102923otd.4;
 Fri, 17 May 2019 08:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1XBYGYCbC9tO86cnAcGoXN5XYaU0F07Vjq2LhyumLK8=;
 b=Fc8dS8tQiUDdxxQNaJxARosdlqFLe+sW0BZzkYhyaFXYtGr9gkiBRDVGFwByguFuv9
 E52+QJAzVmetuQmRdymbE3d0AujjQNGhhtOb+hkqXM/oQoL7LcBAg0ClGeNm74Y2h8dj
 S9qbzUukVDKKcPr/cVENQyqFUKtFmprpdZwhT7X1rNVerNblJBn9Id9l0eqUr4Y5YTqa
 PKu9jhYUaLcDuqMsE6zlmw/q7s6pWh0351oUmgd6jrTzUBnQBY0RwgEKcAfHbLj83Qcp
 frrxP9FNjLQpqHptaseSWL+zaSVZMy59UxrnuQ9gCHGkU2WPZcYAZHDI5KoZDOjYqLkO
 0qXQ==
X-Gm-Message-State: APjAAAWlRYKPV1HRaNzhKxb9PA/bSzHWx9QC/4yAgSZpYT1oQTWcH0bh
 yJKMDrzjcmg92OarGz8fcQ==
X-Google-Smtp-Source: APXvYqwpuRuRgUl0tfHm+0s59pTu5SXG0sJ9Py2DbN5qxuWHvjcE8+2uQPOaLAL0M1VpK04lYW8MQQ==
X-Received: by 2002:a9d:6e07:: with SMTP id e7mr2184240otr.53.1558106846511;
 Fri, 17 May 2019 08:27:26 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id i13sm2186859otl.27.2019.05.17.08.27.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 17 May 2019 08:27:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v3 2/2] dt-bindings: arm: Convert Amlogic board/soc bindings
 to json-schema
Date: Fri, 17 May 2019 10:27:23 -0500
Message-Id: <20190517152723.28518-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517152723.28518-1-robh@kernel.org>
References: <20190517152723.28518-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_082731_893762_8FF4B19D 
X-CRM114-Status: GOOD (  13.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert Amlogic SoC bindings to DT schema format using json-schema.

Cc: Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v3:
- Add board descriptions
- Rebase onto Linus' master

 .../devicetree/bindings/arm/amlogic.txt       | 113 --------------
 .../devicetree/bindings/arm/amlogic.yaml      | 140 ++++++++++++++++++
 2 files changed, 140 insertions(+), 113 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic.txt
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic.yaml

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
deleted file mode 100644
index 5f650248b18e..000000000000
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ /dev/null
@@ -1,113 +0,0 @@
-Amlogic MesonX device tree bindings
--------------------------------------------
-
-Work in progress statement:
-
-Device tree files and bindings applying to Amlogic SoCs and boards are
-considered "unstable". Any Amlogic device tree binding may change at
-any time. Be sure to use a device tree binary and a kernel image
-generated from the same source tree.
-
-Please refer to Documentation/devicetree/bindings/ABI.txt for a definition of a
-stable binding/ABI.
-
----------------------------------------------------------------
-
-Boards with the Amlogic Meson6 SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,meson6"
-
-Boards with the Amlogic Meson8 SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,meson8";
-
-Boards with the Amlogic Meson8b SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,meson8b";
-
-Boards with the Amlogic Meson8m2 SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,meson8m2";
-
-Boards with the Amlogic Meson GXBaby SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,meson-gxbb";
-
-Boards with the Amlogic Meson GXL S905X SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,s905x", "amlogic,meson-gxl";
-
-Boards with the Amlogic Meson GXL S905D SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,s905d", "amlogic,meson-gxl";
-
-Boards with the Amlogic Meson GXL S805X SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,s805x", "amlogic,meson-gxl";
-
-Boards with the Amlogic Meson GXL S905W SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,s905w", "amlogic,meson-gxl";
-
-Boards with the Amlogic Meson GXM S912 SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,s912", "amlogic,meson-gxm";
-
-Boards with the Amlogic Meson AXG A113D SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,a113d", "amlogic,meson-axg";
-
-Boards with the Amlogic Meson G12A S905D2 SoC shall have the following properties:
-  Required root node property:
-    compatible: "amlogic,g12a";
-
-Board compatible values (alphabetically, grouped by SoC):
-
-  - "geniatech,atv1200" (Meson6)
-
-  - "minix,neo-x8" (Meson8)
-
-  - "endless,ec100" (Meson8b)
-  - "hardkernel,odroid-c1" (Meson8b)
-  - "tronfy,mxq" (Meson8b)
-
-  - "tronsmart,mxiii-plus" (Meson8m2)
-
-  - "amlogic,p200" (Meson gxbb)
-  - "amlogic,p201" (Meson gxbb)
-  - "friendlyarm,nanopi-k2" (Meson gxbb)
-  - "hardkernel,odroid-c2" (Meson gxbb)
-  - "nexbox,a95x" (Meson gxbb or Meson gxl s905x)
-  - "tronsmart,vega-s95-pro", "tronsmart,vega-s95" (Meson gxbb)
-  - "tronsmart,vega-s95-meta", "tronsmart,vega-s95" (Meson gxbb)
-  - "tronsmart,vega-s95-telos", "tronsmart,vega-s95" (Meson gxbb)
-  - "wetek,hub" (Meson gxbb)
-  - "wetek,play2" (Meson gxbb)
-
-  - "amlogic,p212" (Meson gxl s905x)
-  - "hwacom,amazetv" (Meson gxl s905x)
-  - "khadas,vim" (Meson gxl s905x)
-  - "libretech,cc" (Meson gxl s905x)
-
-  - "amlogic,p230" (Meson gxl s905d)
-  - "amlogic,p231" (Meson gxl s905d)
-  - "phicomm,n1" (Meson gxl s905d)
-
-  - "amlogic,p241" (Meson gxl s805x)
-  - "libretech,aml-s805x-ac" (Meson gxl s805x)
-
-  - "amlogic,p281" (Meson gxl s905w)
-  - "oranth,tx3-mini" (Meson gxl s905w)
-
-  - "amlogic,q200" (Meson gxm s912)
-  - "amlogic,q201" (Meson gxm s912)
-  - "khadas,vim2" (Meson gxm s912)
-  - "kingnovel,r-box-pro" (Meson gxm S912)
-  - "nexbox,a1" (Meson gxm s912)
-  - "tronsmart,vega-s96" (Meson gxm s912)
-
-  - "amlogic,s400" (Meson axg a113d)
-
-  - "amlogic,u200" (Meson g12a s905d2)
-  - "amediatech,x96-max" (Meson g12a s905x2)
-  - "seirobotics,sei510" (Meson g12a s905x2)
diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
new file mode 100644
index 000000000000..6d5bb493db03
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/amlogic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic MesonX device tree bindings
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Carlo Caione <carlo@caione.org>
+  - Kevin Hilman <khilman@baylibre.com>
+
+description: |+
+  Work in progress statement:
+
+  Device tree files and bindings applying to Amlogic SoCs and boards are
+  considered "unstable". Any Amlogic device tree binding may change at
+  any time. Be sure to use a device tree binary and a kernel image
+  generated from the same source tree.
+
+  Please refer to Documentation/devicetree/bindings/ABI.txt for a definition of a
+  stable binding/ABI.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Boards with the Amlogic Meson6 SoC
+        items:
+          - enum:
+              - geniatech,atv1200
+          - const: amlogic,meson6
+
+      - description: Boards with the Amlogic Meson8 SoC
+        items:
+          - enum:
+              - minix,neo-x8
+          - const: amlogic,meson8
+
+      - description: Boards with the Amlogic Meson8m2 SoC
+        items:
+          - enum:
+              - tronsmart,mxiii-plus
+          - const: amlogic,meson8m2
+
+      - description: Boards with the Amlogic Meson8b SoC
+        items:
+          - enum:
+              - endless,ec100
+              - hardkernel,odroid-c1
+              - tronfy,mxq
+          - const: amlogic,meson8b
+
+      - description: Boards with the Amlogic Meson GXBaby SoC
+        items:
+          - enum:
+              - amlogic,p200
+              - amlogic,p201
+              - friendlyarm,nanopi-k2
+              - hardkernel,odroid-c2
+              - nexbox,a95x
+              - wetek,hub
+              - wetek,play2
+          - const: amlogic,meson-gxbb
+
+      - description: Tronsmart Vega S95 devices
+        items:
+          - enum:
+              - tronsmart,vega-s95-pro
+              - tronsmart,vega-s95-meta
+              - tronsmart,vega-s95-telos
+          - const: tronsmart,vega-s95
+          - const: amlogic,meson-gxbb
+
+      - description: Boards with the Amlogic Meson GXL S805X SoC
+        items:
+          - enum:
+              - amlogic,p241
+              - libretech,aml-s805x-ac
+          - const: amlogic,s805x
+          - const: amlogic,meson-gxl
+
+      - description: Boards with the Amlogic Meson GXL S905W SoC
+        items:
+          - enum:
+              - amlogic,p281
+              - oranth,tx3-mini
+          - const: amlogic,s905w
+          - const: amlogic,meson-gxl
+
+      - description: Boards with the Amlogic Meson GXL S905X SoC
+        items:
+          - enum:
+              - amediatech,x96-max
+              - amlogic,p212
+              - hwacom,amazetv
+              - khadas,vim
+              - libretech,cc
+              - nexbox,a95x
+              - seirobotics,sei510
+          - const: amlogic,s905x
+          - const: amlogic,meson-gxl
+
+      - description: Boards with the Amlogic Meson GXL S905D SoC
+        items:
+          - enum:
+              - amlogic,p230
+              - amlogic,p231
+              - phicomm,n1
+          - const: amlogic,s905d
+          - const: amlogic,meson-gxl
+
+      - description: Boards with the Amlogic Meson GXM S912 SoC
+        items:
+          - enum:
+              - amlogic,q200
+              - amlogic,q201
+              - khadas,vim2
+              - kingnovel,r-box-pro
+              - nexbox,a1
+              - tronsmart,vega-s96
+          - const: amlogic,s912
+          - const: amlogic,meson-gxm
+
+      - description: Boards with the Amlogic Meson AXG A113D SoC
+        items:
+          - enum:
+              - amlogic,s400
+          - const: amlogic,a113d
+          - const: amlogic,meson-axg
+
+      - description: Boards with the Amlogic Meson G12A S905D2 SoC
+        items:
+          - enum:
+              - amlogic,u200
+          - const: amlogic,g12a
+
+...
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
