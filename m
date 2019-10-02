Return-Path: <SRS0=Ikdi=X3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E125C352AA
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 16:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C1821A4C
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 16:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TTq1HhUp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBodjnd+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C1821A4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VXzWtrgIXZr+rsg7KM/NSiTWRwwvAAPxo+iPGiFZkwM=; b=TTq1HhUpyM/G0yhZehx18C5Kfe
	sDUPskADs4VIke9LAfcWNv/3/TTh8c8GcmuDFq7CIxU1V3u+G4eFHGV95FI/jw/25qaJt+FAITnc0
	F896XnNx767tHHUeXQoxFfhsfZHIoYdpfwH7Z9LfdSyUeXtx/2uqpAnLpq3d+I5+AonC9jW63Aswl
	e3YRCksGSsM0Uq6k0bjob7bveR0wCOGsbJh+Fxhq6HIvRVObIZaG5UeGv2qROWG28tMTafFh5HgEN
	6uXh7CMwq7XN7uMXyWFRV0mgbjahI+hATHVz+XWUkUvgKUVbjj8rey55u+LotcQaHbBXUZivvZmrC
	tFidG2Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFh9w-0001W9-6u; Wed, 02 Oct 2019 16:07:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFh9W-000187-HJ; Wed, 02 Oct 2019 16:07:00 +0000
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAB0C21D81;
 Wed,  2 Oct 2019 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570032418;
 bh=KAbuCnD+prY1C6Zt6H684PYSXHQ6rifTzvT4zUzGasA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QBodjnd+kTQuwK7T4rhnCJTH0L/AopBlQvrKuKpr+GXhhNyeGb2ap3JjX718k+Vfu
 fhlBth1zv0KVZCOnIzxF3OwtMKk2x6XIb0XTbxhS/8ffwzdh+mw6U4thYflKOD5Out
 LCh6hwS5tqiwHFbtibqUVjuLNeKO3Wh+KqdDgPsU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: power: Convert Samsung Exynos Power
 Domain bindings to json-schema
Date: Wed,  2 Oct 2019 18:06:31 +0200
Message-Id: <20191002160632.11140-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002160632.11140-1-krzk@kernel.org>
References: <20191002160632.11140-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_090658_629604_DDAC5D51 
X-CRM114-Status: GOOD (  14.35  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert Samsung Exynos Soc Power Domain bindings to DT schema format using
json-schema.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Indent example with four spaces (more readable),
2. Remove unneeded types,
3. Add missing address in example and fix the name.
---
 .../devicetree/bindings/power/pd-samsung.txt  | 45 -------------
 .../devicetree/bindings/power/pd-samsung.yaml | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/pd-samsung.txt
 create mode 100644 Documentation/devicetree/bindings/power/pd-samsung.yaml

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.txt b/Documentation/devicetree/bindings/power/pd-samsung.txt
deleted file mode 100644
index 92ef355e8f64..000000000000
--- a/Documentation/devicetree/bindings/power/pd-samsung.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Samsung Exynos Power Domains
-
-Exynos processors include support for multiple power domains which are used
-to gate power to one or more peripherals on the processor.
-
-Required Properties:
-- compatible: should be one of the following.
-    * samsung,exynos4210-pd - for exynos4210 type power domain.
-    * samsung,exynos5433-pd - for exynos5433 type power domain.
-- reg: physical base address of the controller and length of memory mapped
-    region.
-- #power-domain-cells: number of cells in power domain specifier;
-    must be 0.
-
-Optional Properties:
-- label: Human readable string with domain name. Will be visible in userspace
-	to let user to distinguish between multiple domains in SoC.
-- power-domains: phandle pointing to the parent power domain, for more details
-		 see Documentation/devicetree/bindings/power/power_domain.txt
-
-Deprecated Properties:
-- clocks
-- clock-names
-
-Node of a device using power domains must have a power-domains property
-defined with a phandle to respective power domain.
-
-Example:
-
-	lcd0: power-domain-lcd0 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10023C00 0x10>;
-		#power-domain-cells = <0>;
-		label = "LCD0";
-	};
-
-	mfc_pd: power-domain@10044060 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10044060 0x20>;
-		#power-domain-cells = <0>;
-		label = "MFC";
-	};
-
-See Documentation/devicetree/bindings/power/power_domain.txt for description
-of consumer-side bindings.
diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
new file mode 100644
index 000000000000..09bdd96c1ec1
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/pd-samsung.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC Power Domains
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |+
+  Exynos processors include support for multiple power domains which are used
+  to gate power to one or more peripherals on the processor.
+
+allOf:
+  - $ref: power-domain.yaml#
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos4210-pd
+      - samsung,exynos5433-pd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    deprecated: true
+    maxItems: 1
+
+  clock-names:
+    deprecated: true
+    maxItems: 1
+
+  label:
+    description:
+      Human readable string with domain name. Will be visible in userspace
+      to let user to distinguish between multiple domains in SoC.
+
+  "#power-domain-cells":
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#power-domain-cells"
+  - reg
+
+examples:
+  - |
+    lcd0_pd: power-domain@10023c80 {
+        compatible = "samsung,exynos4210-pd";
+        reg = <0x10023c80 0x20>;
+        #power-domain-cells = <0>;
+        label = "LCD0";
+    };
+
+    mfc_pd: power-domain@10044060 {
+        compatible = "samsung,exynos4210-pd";
+        reg = <0x10044060 0x20>;
+        #power-domain-cells = <0>;
+        label = "MFC";
+    };
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
