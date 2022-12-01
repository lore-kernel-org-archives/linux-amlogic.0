Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE582C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 23:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwXhwrzp31p55/l2aIQSWCdyT2bWpOinVyrvrXhZxB4=; b=nfZ9PaoW/4HNmr
	5argnX1WO5DX/YHGTIMuALTyIPMOrqNwM97Qd4XOkpRpAlDGhOWekExD27PgQHvh+bdYxPlaJ+bRw
	0RohhDljCkt+8kAViYqyTDGPMHI62fMsbS0cMqEBH2yDVMe9olAUQr/mgCo1pXU/ktYBGTbyTx8XL
	RUyGzZO2OjVYtCsALur0zD+lLojWgIf/FH6oiMitYcUnvwl7xGbvhQ7J9+6e+m98VVp5CelJIDnz8
	1bIIA56Lj+4PwY8wA6nzmL2Rd00anQEfEwOFqgwGlY6gGrHTIxpEIhXc93/9/JaMK6/wcwXrNMJdi
	76IMKLTceJ3mTySQGtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0t3v-00Bim2-9f; Thu, 01 Dec 2022 23:33:51 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sV0-00BSWP-1I; Thu, 01 Dec 2022 22:57:49 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id E8C9E5FD0F;
	Fri,  2 Dec 2022 01:57:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669935457;
	bh=su3raxn0OGsgB1AdUJiueQi3w/7b0lMP0lopP7rXXpY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cNmnNR0WXQN6phqG51RQRC2mtxtZ5MEXY3k+09rPdvLXyKXzpm/ijJnUrIKOA5wtw
	 Z0piWjyB7Af3tgf22fEsa+r7y/HVZJ1X6mvf82a6AIYSma4FaKcVSX7Jrgvc/MF1IA
	 UxmBZL7LRaigh9JOMZq1Uku6CqfANbByJdao4xASKzOcCwwZfpavpoOoJuvRLV33SP
	 qKn9dLSLiNc09VZO3gohUgF3uKa9YJoG3+0//G6Js3FTpd3nIQB3nmFXzuibTA+p2i
	 IVcteNX+DhRB4Py1hMhnZMPPbJuRUSn2CMXz5uovgQ+fdwgErPyD812LWwO2zmnjjf
	 w6DH1H04lExhg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 01:57:37 +0300 (MSK)
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
Subject: [PATCH v8 10/11] dt-bindings: clock: meson: fixup A1 peripherals clkc dtb_check errors
Date: Fri, 2 Dec 2022 01:57:02 +0300
Message-ID: <20221201225703.6507-11-ddrokosov@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20221201_145746_476097_C30D3113 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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
    - no base offset in the dt node definition
    - CLKIDs aren't applied by names, just magic int constants there
    - address and size cells are required for long reg definition
    - wrong indentations

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 .../bindings/clock/amlogic,a1-clkc.yaml       | 36 +++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
index 7729850046cf..b0249ab21466 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
@@ -1,7 +1,7 @@
-#SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/amlogic,a1-clkc.yaml#"
+$id: "http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Amlogic Meson A/C serials Peripheral Clock Control Unit Device Tree Bindings
@@ -10,6 +10,7 @@ maintainers:
   - Neil Armstrong <narmstrong@baylibre.com>
   - Jerome Brunet <jbrunet@baylibre.com>
   - Jian Hu <jian.hu@jian.hu.com>
+  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
 
 properties:
   compatible:
@@ -50,16 +51,23 @@ additionalProperties: false
 
 examples:
   - |
-    clkc_periphs: periphs-clock-controller {
-        compatible = "amlogic,a1-periphs-clkc";
-        reg = <0 0x800 0 0x104>;
-        #clock-cells = <1>;
-        clocks = <&clkc_pll 6>,
-                <&clkc_pll 7>,
-                <&clkc_pll 8>,
-                <&clkc_pll 9>,
-                <&clkc_pll 10>,
-                <&xtal>;
-        clock-names = "fclk_div2", "fclk_div3", "fclk_div5",
-                      "fclk_div7", "hifi_pll", "xtal";
+    #include <dt-bindings/clock/a1-pll-clkc.h>
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clkc_periphs: periphs-clock-controller@800 {
+            compatible = "amlogic,a1-periphs-clkc";
+            reg = <0 0x800 0 0x104>;
+            #clock-cells = <1>;
+            clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                     <&clkc_pll CLKID_FCLK_DIV3>,
+                     <&clkc_pll CLKID_FCLK_DIV5>,
+                     <&clkc_pll CLKID_FCLK_DIV7>,
+                     <&clkc_pll CLKID_HIFI_PLL>,
+                     <&xtal>;
+            clock-names = "fclk_div2", "fclk_div3",
+                          "fclk_div5", "fclk_div7",
+                          "hifi_pll", "xtal";
+        };
     };
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
