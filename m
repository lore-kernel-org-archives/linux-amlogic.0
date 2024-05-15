Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BB0C25B78
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 18:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYtgYmM6j6DfPKOJoDXHuQfdOkDZqxklPoY4w2SzoII=; b=fYmZOzpNOLgnoj
	JSs36w2DjliPmHfPO5uO0P1SKBRW3eQBjwZUk7MvBdM5J2h/VbI2A9iuadYaRXnQK+pWumW1SS9x0
	XZ7Pctbm8t5tWzwDxOnIi14CX15wmJfxB5ZtY0miDxI195p23i+vh0NqBft2rtVLMJjp+3tUEDsIS
	KrcWI1H9eTWnXbv1P7w6SjoZEUT4ZhstHRe+g/GcZjeb3WIHy9VYvzre5ypshDl3SsKMH5iD6tZWS
	TkPhRcuZ/poV/fHLhv8IOTarnsPG6Ay3HiMA4OAxR49nSqRVK9yNNvlMh7a0WabbiZjVo6LO/p58Q
	c5nurxNeBhpuy2CdV7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jiu-00000002bbs-1ZRM;
	Wed, 15 May 2024 18:51:32 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jim-00000002bWw-0iXW;
	Wed, 15 May 2024 18:51:28 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id EDF2F12002A;
	Wed, 15 May 2024 21:51:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EDF2F12002A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715799073;
	bh=QMAt1ZjzhOa+8fsvoVbTc9wPD8ylKr2Pv+Hu9aMn9q8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=t4v5tbr54qe2OwX475AN7ahXxy0TnC3bb5p8iCnctvxdKFwGyjdq/AT5FlIpA/7bM
	 F6ba+fuDekQozD8Dqq02Ta3+umyqi3Z6ou9L1BLWMsmLCSF84iUNTZa8ZWNdkcVwu1
	 CH2KS7knzhP1Lh2UHaQr0SYsr322I+elPgSIfTymeJUzSuxLSWHTrTC+UNt+xYVmt/
	 p3TsiIKDct37hMdEfW0YgW9nKJibc+Nl8mQjkoJ62O48mK4B9/m2W5CCfOaJ7e4TKE
	 lQ86fcKTIGFYO7oWCCNbNvdvVriBXMD1KV9XPRR9OdHqDDxNzrP8TTeMopmmSeNOBV
	 e9CXnrPqOe7Pw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 15 May 2024 21:51:13 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 15 May 2024 21:51:13 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v3 2/7] dt-bindings: clock: meson: a1: pll: introduce new syspll bindings
Date: Wed, 15 May 2024 21:47:25 +0300
Message-ID: <20240515185103.20256-3-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515185103.20256-1-ddrokosov@salutedevices.com>
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185260 [May 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/15 13:12:00 #25231738
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_115125_114813_E2E8520A 
X-CRM114-Status: GOOD (  13.77  )
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

The 'syspll' PLL is a general-purpose PLL designed specifically for the
CPU clock. It is capable of producing output frequencies within the
range of 768MHz to 1536MHz.

The 'syspll_in' source clock is an optional parent connection from the
peripherals clock controller.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml   | 9 +++++++--
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h          | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
index a59b188a8bf5..c99274d2a9bd 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
@@ -26,11 +26,15 @@ properties:
     items:
       - description: input fixpll_in
       - description: input hifipll_in
+      - description: input syspll_in
+    minItems: 2 # syspll_in is optional
 
   clock-names:
     items:
       - const: fixpll_in
       - const: hifipll_in
+      - const: syspll_in
+    minItems: 2 # syspll_in is optional
 
 required:
   - compatible
@@ -53,7 +57,8 @@ examples:
             reg = <0 0x7c80 0 0x18c>;
             #clock-cells = <1>;
             clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
-                     <&clkc_periphs CLKID_HIFIPLL_IN>;
-            clock-names = "fixpll_in", "hifipll_in";
+                     <&clkc_periphs CLKID_HIFIPLL_IN>,
+                     <&clkc_periphs CLKID_SYSPLL_IN>;
+            clock-names = "fixpll_in", "hifipll_in", "syspll_in";
         };
     };
diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
index 2b660c0f2c9f..0dfc5e78a2d5 100644
--- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
@@ -21,5 +21,6 @@
 #define CLKID_FCLK_DIV5		8
 #define CLKID_FCLK_DIV7		9
 #define CLKID_HIFI_PLL		10
+#define CLKID_SYS_PLL		11
 
 #endif /* __A1_PLL_CLKC_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
