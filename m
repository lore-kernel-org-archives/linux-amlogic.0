Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7592DC41513
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 18:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmmgMeCuEAjckDuQy6/DTBFTGJ59XSVh/qhzaV9ZGs4=; b=LVVa6Q0Gay3aDC
	b2kNRe+uh2D710r1aie8XoTRNH4knPhe5xrkarLTND1gy57bMtj8/yZt1ENYWkL9BEZZBc708ognF
	WX8IoqsNprlNeNuLqPzUzdWTDrdD2Nk2wK2QFA5MB7xZaOSlHMuYO9sFODseCQY1TvFtxWYZaK7Ur
	Loxu8TncaAXgbeBBcNdExF6Y2TF2zFkkXsVNfs8GXAGMisQ+hqYLGW5ux1DBr1mMCPlvLTxp80evp
	t+qg5XDM8/cJzg3grn7a2lzhserReB9WfUBmjVB9M3yLKfBwGKMnUSCEiGqV/v5NbYaBoHleXaiJG
	uQYgmP5jDGV1ESSOFBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jiq-00000002ba3-1SYN;
	Wed, 15 May 2024 18:51:28 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jim-00000002bXF-0fjl;
	Wed, 15 May 2024 18:51:27 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 45DE312002F;
	Wed, 15 May 2024 21:51:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 45DE312002F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715799075;
	bh=GVAW5JWcD01T1J+UtljJWyAOeYhpdOcLrFBEHbZTD0E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=c4p6wLPwp+qppXMRa7k/HpOAs365SYc2QacSfhVG5r8Go0Arss4mAh37jJYiJ0swn
	 0etdyIziGy9Ymm2aza/QVaLjWwYkF4qOUCQBbhhSDsoIFZc+G30msTXwUYQQiPwj28
	 6g/MVGTBkoiyKqUlZdLBC7sMr0fKVhtJZavHlEhWyNSJ73rQ4XU1qNlsJSTHKJa5eS
	 P902Sic9E2D0h+YxhFj5sJumYCMZk2onam/FxE4ut7ow5ewBmXJQuNtF4bkNNwZAT3
	 ShRitzinb9BW2GmJ3g/SF0wqOH0Lr7hGOA03PPRuY72L0MKiCshFWMd5SDxfxEmH1c
	 WEZdfsTUP0QCQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 15 May 2024 21:51:15 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 15 May 2024 21:51:14 +0300
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
Subject: [PATCH v3 4/7] dt-bindings: clock: meson: a1: peripherals: support sys_pll input
Date: Wed, 15 May 2024 21:47:27 +0300
Message-ID: <20240515185103.20256-5-ddrokosov@salutedevices.com>
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
X-CRM114-CacheID: sfid-20240515_115125_122043_987D052B 
X-CRM114-Status: GOOD (  13.51  )
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

The 'sys_pll' input is an optional clock that can be used to generate
'sys_pll_div16', which serves as one of the sources for the GEN clock.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../bindings/clock/amlogic,a1-peripherals-clkc.yaml      | 9 +++++++--
 include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h  | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
index 6d84cee1bd75..2568ad7dd0ac 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
@@ -30,6 +30,8 @@ properties:
       - description: input fixed pll div7
       - description: input hifi pll
       - description: input oscillator (usually at 24MHz)
+      - description: input sys pll
+    minItems: 6 # sys_pll is optional
 
   clock-names:
     items:
@@ -39,6 +41,8 @@ properties:
       - const: fclk_div7
       - const: hifi_pll
       - const: xtal
+      - const: sys_pll
+    minItems: 6 # sys_pll is optional
 
 required:
   - compatible
@@ -65,9 +69,10 @@ examples:
                      <&clkc_pll CLKID_FCLK_DIV5>,
                      <&clkc_pll CLKID_FCLK_DIV7>,
                      <&clkc_pll CLKID_HIFI_PLL>,
-                     <&xtal>;
+                     <&xtal>,
+                     <&clkc_pll CLKID_SYS_PLL>;
             clock-names = "fclk_div2", "fclk_div3",
                           "fclk_div5", "fclk_div7",
-                          "hifi_pll", "xtal";
+                          "hifi_pll", "xtal", "sys_pll";
         };
     };
diff --git a/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h
index 06f198ee7623..2ce1a06dc735 100644
--- a/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h
@@ -164,5 +164,6 @@
 #define CLKID_DMC_SEL		151
 #define CLKID_DMC_DIV		152
 #define CLKID_DMC_SEL2		153
+#define CLKID_SYS_PLL_DIV16	154
 
 #endif /* __A1_PERIPHERALS_CLKC_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
