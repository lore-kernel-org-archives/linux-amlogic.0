Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E93C25B78
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fX+GGh1zwXfqOfXLYC5qvVqNaywyt0aN6GGOl6vnBgw=; b=xazWXMiZ1u8+2y
	zSuqlKNt0GXdYcFf+WMp2dXfgScQv3L79wK5D171CGiyCmU9bF2hqMDmtzOozDcKriW/6JA+KiQDU
	7IX9wJhUlEcd8rSQZGTIuMY2SyoVRnj4cgMl1O3APxvdQNBqwDrKob/3ifxzZYEsjB4tP4y98utiP
	PIdrSyYMI4lbx+A4ZMcUi0aVO7S6nuE4m90Qa8PpRXujHmvEuYeeKHtNLLPz4ZwvyFnG7lEs/zqVJ
	s0pDyZBo4AcCDind4wkz+sMuFlg1TbAu5Ikk2iTVKy66EcGgMCC1QgoN8dslpsBI8pg5NUV0hhW7k
	9BDfm2pET7Ae9hhp+ZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K52-00000002fPM-21L2;
	Wed, 15 May 2024 19:14:24 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K4t-00000002fLc-425w;
	Wed, 15 May 2024 19:14:18 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 65B9012002A;
	Wed, 15 May 2024 22:14:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 65B9012002A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715800454;
	bh=ZpnmzvxchVxol/81bNqqZ7Usi3DvPML8tgHPrv90gm4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=JiRAtee0eCPy7hhgO1tXrzkP7Toc/NeyqXJDCU/w8AI3y4AzGb5FBND7iw4sqdEKU
	 OZUeqEeA2Z9heLTK2UNEEWWBXtgHC/9FewFmX+3pkhylESuLmyUVVNJwwpx/gVRr1v
	 IK2335DfpDmoiaHEGafmwEe/hO84JarE0WB2nBSjvsVZBqfhJ7izz88vb938VO4Vza
	 ttIvINUcqJm+ySIW61oBW6Lg1972XtiQm5FIMu93R2jrVq6S5xN3st5NoSe0DJfGKK
	 8fdjtdi5mto7a+hJ7rhaJ8/l4bwr3u6Y75H1qDE70anQg4mSRoGZYyYWTP7UnwYaFG
	 JBAw4qeJj8GCg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 15 May 2024 22:14:14 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 15 May 2024 22:14:13 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v3 3/4] arm64: dts: amlogic: a1: add new input clock 'sys_pll' to clkc_periphs
Date: Wed, 15 May 2024 22:13:52 +0300
Message-ID: <20240515191405.25395-4-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515191405.25395-1-ddrokosov@salutedevices.com>
References: <20240515191405.25395-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
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
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/15 13:12:00 #25231738
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_121416_355934_15D14248 
X-CRM114-Status: GOOD (  11.58  )
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
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index afb5d7361177..f73bb7d1f381 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -747,10 +747,12 @@ clkc_periphs: clock-controller@800 {
 					 <&clkc_pll CLKID_FCLK_DIV5>,
 					 <&clkc_pll CLKID_FCLK_DIV7>,
 					 <&clkc_pll CLKID_HIFI_PLL>,
-					 <&xtal>;
+					 <&xtal>,
+					 <&clkc_pll CLKID_SYS_PLL>;
 				clock-names = "fclk_div2", "fclk_div3",
 					      "fclk_div5", "fclk_div7",
-					      "hifi_pll", "xtal";
+					      "hifi_pll", "xtal",
+					      "sys_pll";
 			};
 
 			i2c0: i2c@1400 {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
