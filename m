Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B64CC47088
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 23:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIZbom+J3NykMfxXufGoRwlXvra4ATE73EW0iTQhT+8=; b=hnY7q97qL36TiM
	yfVIVMuqWOH3/eflcp0slK52M7KrKwrKH+18QO+xFKPq+ZthPrnsPMKgKOY4NvhFCFS6MGiuzQvoH
	uxVfw/OjF/DTNRM1/pjW0B0ctZ3l/eWqURPXPIS6mQNmcv043pzwxWqxfF5PMU/2zAajsyCFMr3jU
	9+wQv0ypdK+i9+qPHtBq1Yfds8fXgwqCo8HNWixeXYn8uZG1QaKbZFRHoSIFKojNr/cCTzH7s3xQt
	EenpzOks4SNWiKzzN4fKUx4bZvom+AR/VbO/tTUZ7nW8Xuek5N+qYt8w5IyswPm3JBixX5aPhOmh5
	oCPvThqVsy6OA1FTfE+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0t27-00Bhtm-JW; Thu, 01 Dec 2022 23:31:59 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sUy-00BSVs-IS; Thu, 01 Dec 2022 22:57:47 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C126F5FD12;
	Fri,  2 Dec 2022 01:57:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669935455;
	bh=8WuFTtlyje+RAPuOwRdLKN6aHl8n49XuWh4hJVbyhvE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qdLxOm4exQShUjJgIXX/fzGd0p+4cd4Z3SBfqRkvwdesAeXqhKXocNkJMLsJi2H05
	 HK/gfQOAuDcXePOD3hpT+f6Sq1tYSBmg22YiaPT+ukMEyLAz1lDWSqhR8vhqSzaZ1F
	 x+pvuiS6s81ANoqwS2I6G2HePklx/XnitXWOglBUV0DMzUGb9+DLsYnflrmYOeVW/R
	 cTh/18CHPPLK562AFZLIKjTBTMka9Ei7JCa+DwXWRrLAlMPfiJdcweUbDLzliElCCQ
	 TzNY2TNFjBK8vK+Z/GE3WnZa1GMX/P8PApwevfutPKTbk0fhSsYxm4CKo4Kk3/8xfc
	 +AtaVzU53e8nw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 01:57:35 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v8 08/11] dt-bindings: clock: meson: fixup A1 PLL clkc dtb_check errors
Date: Fri, 2 Dec 2022 01:57:00 +0300
Message-ID: <20221201225703.6507-9-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/01 20:49:00 #20634374
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_145745_045588_51D94E4E 
X-CRM114-Status: GOOD (  11.59  )
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

During running dtbs_check and dt_binding_check checkers the following
problems were found and resolved:
    - $id is not correct, it has wrong url path
    - CLKIDs aren't applied by names, just magic int constants there
    - address and size cells are required for long reg definition
    - wrong indentations

Also this patch adds new A1 clk controllers dt bindings to MAINTAINERS.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 27 ++++++++++++-------
 MAINTAINERS                                   |  1 +
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
index d67250fbeece..83f98a73c04e 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/amlogic,a1-pll-clkc.yaml#"
+$id: "http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Amlogic Meson A/C serials PLL Clock Control Unit Device Tree Bindings
@@ -10,6 +10,7 @@ maintainers:
   - Neil Armstrong <narmstrong@baylibre.com>
   - Jerome Brunet <jbrunet@baylibre.com>
   - Jian Hu <jian.hu@jian.hu.com>
+  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
 
 properties:
   compatible:
@@ -23,8 +24,8 @@ properties:
 
   clocks:
     items:
-     - description: input xtal_fixpll
-     - description: input xtal_hifipll
+      - description: input xtal_fixpll
+      - description: input xtal_hifipll
 
   clock-names:
     items:
@@ -42,11 +43,17 @@ additionalProperties: false
 
 examples:
   - |
-    clkc_pll: pll-clock-controller@7c80 {
-                compatible = "amlogic,a1-pll-clkc";
-                reg = <0 0x7c80 0 0x18c>;
-                #clock-cells = <1>;
-                clocks = <&clkc_periphs 1>,
-                         <&clkc_periphs 4>;
-                clock-names = "xtal_fixpll", "xtal_hifipll";
+    #include <dt-bindings/clock/a1-clkc.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clkc_pll: pll-clock-controller@7c80 {
+            compatible = "amlogic,a1-pll-clkc";
+            reg = <0 0x7c80 0 0x18c>;
+            #clock-cells = <1>;
+            clocks = <&clkc_periphs CLKID_XTAL_FIXPLL>,
+                     <&clkc_periphs CLKID_XTAL_HIFIPLL>;
+            clock-names = "xtal_fixpll", "xtal_hifipll";
+        };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index e04d944005ba..a02d81edeb4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1837,6 +1837,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/amlogic*
 F:	drivers/clk/meson/
+F:	include/dt-bindings/clock/a1*
 F:	include/dt-bindings/clock/gxbb*
 F:	include/dt-bindings/clock/meson*
 
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
