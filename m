Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D5106FD92
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2026 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yT7a4pUGYtU5OE0m1DHuxMfPb+hms22wsLC+ssp7Ciw=; b=DGMM+X7GVUKo2e
	iyBwn+j0YmpKcmg6wqiTtFR5u6J/wu5SGy0oeE+tMFbKnwaBNRIYR6fb0Erx6HjH3rHoxHHkG+9pE
	PYnjsalVUgwmfbN9YLt5wlOusWds87iw0YotNDrOGB5I8V+4qkBYV31kjk6dDbW1UnsVn1nPpDKHI
	WlCxCkwuQdpoLh67ZpaEOSLqZ227eqiTju2E8z/DMz4gVQ8Um+5c5tf3hExOT6bKksB5StaodIiK3
	aXVtF9GWbwIKvM0bkk/uHWD44HxaPl4b+iffzkgSkVzWh5GyMI1GZ1Dhgb6ZpvmKWvADKPAdAbxt2
	4ahSR5LdoevFJwAKf2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wVt-0000000GwJH-1Yv3;
	Fri, 13 Mar 2026 07:00:49 +0000
Received: from [64.106.246.77] (helo=mail-sc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wVn-0000000GwER-2Zvu;
	Fri, 13 Mar 2026 07:00:44 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 12 Mar
 2026 23:59:44 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ronald Claveau
	<linux-kernel-dev@aliel.fr>, Ferass El Hafidi <funderscore@postmarketos.org>
Subject: [PATCH v2 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
Date: Fri, 13 Mar 2026 15:00:21 +0800
Message-ID: <20260313070022.700437-3-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260313070022.700437-1-jian.hu@amlogic.com>
References: <20260313070022.700437-1-jian.hu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.121]
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_000043_653924_4DD48EE5 
X-CRM114-Status: UNSURE (   9.99  )
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

The mpll3 clock is one parent clock of the sd_emmc and mipi_isp clocks
on the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml
bindings. Add the mpll3 clock source to the T7 peripherals clock
controller input clock list, so that sd_emmc and mipi_isp can use it.

For logical consistency, place the required mpll3 entry before the
optional entry.

This change breaks the ABI, but while the amlogic,t7-peripherals-clkc
bindings have been merged upstream, the corresponding DT has not been
merged yet. Thus, no real users or systems are affected.

Fixes: b4156204e0f5 ("dt-bindings: clock: add Amlogic T7 peripherals clock controller")
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../bindings/clock/amlogic,t7-peripherals-clkc.yaml  | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
index 55bb73707d58..a4b214a941ea 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
@@ -24,7 +24,7 @@ properties:
     const: 1
 
   clocks:
-    minItems: 14
+    minItems: 15
     items:
       - description: input oscillator
       - description: input sys clk
@@ -40,12 +40,13 @@ properties:
       - description: input gp1 pll
       - description: input mpll1
       - description: input mpll2
+      - description: input mpll3
       - description: external input rmii oscillator (optional)
       - description: input video pll0 (optional)
       - description: external pad input for rtc (optional)
 
   clock-names:
-    minItems: 14
+    minItems: 15
     items:
       - const: xtal
       - const: sys
@@ -61,6 +62,7 @@ properties:
       - const: gp1
       - const: mpll1
       - const: mpll2
+      - const: mpll3
       - const: ext_rmii
       - const: vid_pll0
       - const: ext_rtc
@@ -97,7 +99,8 @@ examples:
                      <&gp0 1>,
                      <&gp1 1>,
                      <&mpll 4>,
-                     <&mpll 6>;
+                     <&mpll 6>,
+                     <&mpll 8>;
             clock-names = "xtal",
                           "sys",
                           "fix",
@@ -111,6 +114,7 @@ examples:
                           "gp0",
                           "gp1",
                           "mpll1",
-                          "mpll2";
+                          "mpll2",
+                          "mpll3";
         };
     };
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
