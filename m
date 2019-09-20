Return-Path: <SRS0=KMNI=XP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E847C4CEC9
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 16:21:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 512942086A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 16:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D0kELHlV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2dMv4gKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 512942086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=py8+jnFgvi962qN3ZfHaUjm/v13qEhcO2WlwvRO2qZ4=; b=D0k
	ELHlVAKikunDs9FZFpe9s9JBXgs0MZFGqF5E8rSvpsaq3O6M0uuSACmGiAdhebHWugQZqRSO3IDCm
	hi9qrQJ8dtM6jQ7ns4v5LVnHeZ2RHrxaROhnPUBt1cRkg5sgXLtzcmLbqbc23IIk/X01DxyPmIBd3
	krCTOOsbMUy0nr3yKwkcTxTG8zv0b8XTS5JzczM7xO6/LKhI/oDB27fez+TXxKnLV0Y7UP3yjHjtY
	zm8IJK/ZqhnZmDMe9SNyie3XXq7g8GA1X/INQ19F20adzTmx9pes7uOTiC4Yt3PWC5UweC4Zu3hbl
	iW9CCPRbdy+UmVsmOhcFUHuoamz1hgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBLfA-0005dt-O0; Fri, 20 Sep 2019 16:21:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBLf7-0005d8-UW; Fri, 20 Sep 2019 16:21:39 +0000
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DB6520C01;
 Fri, 20 Sep 2019 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568996496;
 bh=G4ZWXDDOctrbtK9IV3kMcbrs/YmvosJWapnn4V56nvQ=;
 h=From:To:Cc:Subject:Date:From;
 b=2dMv4gKGZ2vVFWgyWkGWdSMy2Di/pvOoU6hPZv63Uy16TKnhnB6kYGji2GP8gVwC9
 6sxGbRg41pP6pwfavuLFXjJFxNmnkJ88MbUuKZVlNjgmR8fUDyrlfZN5r0KZ1hm23F
 IhnUK0hl/KOLKz0NhWnM6pOSrFuAC9P/OsyH3FyM=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC watchdog
 bindings to json-schema
Date: Fri, 20 Sep 2019 18:21:22 +0200
Message-Id: <20190920162124.7036-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_092138_031735_70C72CF7 
X-CRM114-Status: GOOD (  14.47  )
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

Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
using json-schema.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Indent example with four spaces (more readable),
2. Remove unneeded timeout-sec description and include generic bindings.
---
 .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
 .../bindings/watchdog/samsung-wdt.yaml        | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
deleted file mode 100644
index 46dcb48e75b4..000000000000
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* Samsung's Watchdog Timer Controller
-
-The Samsung's Watchdog controller is used for resuming system operation
-after a preset amount of time during which the WDT reset event has not
-occurred.
-
-Required properties:
-- compatible : should be one among the following
-	- "samsung,s3c2410-wdt" for S3C2410
-	- "samsung,s3c6410-wdt" for S3C6410, S5PV210 and Exynos4
-	- "samsung,exynos5250-wdt" for Exynos5250
-	- "samsung,exynos5420-wdt" for Exynos5420
-	- "samsung,exynos7-wdt" for Exynos7
-
-- reg : base physical address of the controller and length of memory mapped
-	region.
-- interrupts : interrupt number to the cpu.
-- samsung,syscon-phandle : reference to syscon node (This property required only
-	in case of compatible being "samsung,exynos5250-wdt" or "samsung,exynos5420-wdt".
-	In case of Exynos5250 and 5420 this property points to syscon node holding the PMU
-	base address)
-
-Optional properties:
-- timeout-sec : contains the watchdog timeout in seconds.
-
-Example:
-
-watchdog@101d0000 {
-	compatible = "samsung,exynos5250-wdt";
-	reg = <0x101D0000 0x100>;
-	interrupts = <0 42 0>;
-	clocks = <&clock 336>;
-	clock-names = "watchdog";
-	samsung,syscon-phandle = <&pmu_syscon>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
new file mode 100644
index 000000000000..5a3a3cec8e20
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/samsung-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC Watchdog Timer Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |+
+  The Samsung's Watchdog controller is used for resuming system operation
+  after a preset amount of time during which the WDT reset event has not
+  occurred.
+
+properties:
+  compatible:
+    enum:
+      - samsung,s3c2410-wdt                   # for S3C2410
+      - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
+      - samsung,exynos5250-wdt                # for Exynos5250
+      - samsung,exynos5420-wdt                # for Exynos5420
+      - samsung,exynos7-wdt                   # for Exynos7
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  samsung,syscon-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the PMU system controller node (in case of Exynos5250
+      and Exynos5420).
+
+required:
+  - compatible
+  - interrupts
+  - reg
+
+allOf:
+  - $ref: watchdog.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5250-wdt
+              - samsung,exynos5420-wdt
+    then:
+      required:
+        - samsung,syscon-phandle
+
+examples:
+  - |
+    watchdog@101d0000 {
+        compatible = "samsung,exynos5250-wdt";
+        reg = <0x101D0000 0x100>;
+        interrupts = <0 42 0>;
+        clocks = <&clock 336>;
+        clock-names = "watchdog";
+        samsung,syscon-phandle = <&pmu_syscon>;
+    };
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
