Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E429DC25B4F
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2024 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOEZzBnkjPstDvMYhMUtabvJ8JJbFXOZ22lA8n8GoJ8=; b=laYsuuiYaImEYs
	wPuH07sv+Xw+eQplwlbdqJ4yhuB6B11/D7/ehlJILQu1g1J2bwGARczDfrS2sRAL1Vr08zp3DupFV
	aQ/7tsg4GE0TJ0llrUFO+QLsRdOCrNkmk46IVk0MFXzDMcNtPgM4aWJW7u0Zkb1lDULUnyE7ZdpWx
	2Sj7m+sxjcMtPoROPUtprnyKP0rP5AGKEtpxL3EqWYjwqmR8L6MEARgGQLEA4FnFUp3qbWph/q+Mx
	Nen9a3nmlcK+3cGGD/SV0Ek3ex+uDAuhxQd2tw/+Prw4lLOiHk690Wl+bV+44wWFjDj5KtFya0R11
	q4S14JYIbV1LzIx9IPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MGd-00000004bNJ-1a7l;
	Fri, 10 May 2024 09:10:15 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MGK-00000004b2r-31AU;
	Fri, 10 May 2024 09:09:59 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BB218100008;
	Fri, 10 May 2024 12:09:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BB218100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715332184;
	bh=DYdJx4qVoqJXoc9CWf41h3URDnGHF1yW+XqV/nDou90=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=KZV+H0G3f4p2XgZ3BDEC6sivxAmuTsSXaBPaF/Pb31NRyMeAb9tT/UNQ3xs+BKnIw
	 xeu9QKWezqV0sS6RkaZ9TQgJe2JYeNdypX8YKHCGJ7XZg2Xf2NlD/8ZBEdal9X9k+A
	 oJGXw8UM3JgK7mZBJEWobcL5KA9QKyOHuuGu0hRjImTlogrNoxxBbrBUM5eJcP2Wwt
	 MzBRmOL8t/yGgT63YRGsagcOuhJCBeaHMVH1Jq12lYI3cvm/OBdqk2/hAnAoDPNAJj
	 oeDj+fWjedHus7ELnYCaWL6eduHdKyRuQ6P2VXzVaoZaQ7ycPcE+8To/AlurrbNoqP
	 aorTqgY7XosJw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 10 May 2024 12:09:44 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 10 May 2024 12:09:44 +0300
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
Subject: [PATCH v2 4/7] dt-bindings: clock: meson: a1: peripherals: support sys_pll_div16 input
Date: Fri, 10 May 2024 12:08:56 +0300
Message-ID: <20240510090933.19464-5-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240510090933.19464-1-ddrokosov@salutedevices.com>
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185158 [May 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/10 07:36:00 #25144647
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_020957_178247_D08D481A 
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

The 'sys_pll_div16' input clock is used as one of the sources for the
GEN clock.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../bindings/clock/amlogic,a1-peripherals-clkc.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
index 6d84cee1bd75..11862746ba44 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc.yaml
@@ -30,6 +30,7 @@ properties:
       - description: input fixed pll div7
       - description: input hifi pll
       - description: input oscillator (usually at 24MHz)
+      - description: input sys pll div16
 
   clock-names:
     items:
@@ -39,6 +40,7 @@ properties:
       - const: fclk_div7
       - const: hifi_pll
       - const: xtal
+      - const: sys_pll_div16
 
 required:
   - compatible
@@ -65,9 +67,10 @@ examples:
                      <&clkc_pll CLKID_FCLK_DIV5>,
                      <&clkc_pll CLKID_FCLK_DIV7>,
                      <&clkc_pll CLKID_HIFI_PLL>,
-                     <&xtal>;
+                     <&xtal>,
+                     <&clkc_pll CLKID_SYS_PLL_DIV16>;
             clock-names = "fclk_div2", "fclk_div3",
                           "fclk_div5", "fclk_div7",
-                          "hifi_pll", "xtal";
+                          "hifi_pll", "xtal", "sys_pll_div16";
         };
     };
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
