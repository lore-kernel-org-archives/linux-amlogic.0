Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D6EC25B79
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 18:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIxocrH8Y4rGst8CQiAxMYjormsf5hPFwSb0yaaWOHg=; b=B+SxSfdAjcpH3D
	jJrPDvI21VfxIgArtrffmLWKxPtgkv1r2uzL7w/QqUijbqi55/tVzNy23yaxqH7J1Mgap/0AbU8LE
	u43bmKBUafNnxdmRoOj/fxQXTlTCkOhXtRSvGgiQZNeSDwMNhsIU/Gohb9wrkpLi6yaVFy/9p66QI
	opnKrHeZ7WH+KfdSSWNxpKIMu50+2WF6zqwUoh5E81AePcocj4dcSPu30F4zYqMPeu+xHdq+ryPrL
	zeRVyDFdtDJu51AwFYjczaBbicTXzTWyECp9KisqvhSx/1z+RSlNL3rl04rXELlECDYNXAy1dS4w3
	Phe3b51Oeh2+AuCak9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jiv-00000002bcX-14Ni;
	Wed, 15 May 2024 18:51:33 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jin-00000002bXH-2BXv;
	Wed, 15 May 2024 18:51:29 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id EC313100031;
	Wed, 15 May 2024 21:51:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EC313100031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715799075;
	bh=6j+cd3D6A9wkF5Z/jGDf6RAc3Fv8FBkYTu7czdc0OWc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=W+8Qot0pe6zDk1PjtCo5+GrMLoUE3bgKR0O6aJhF+VwNzwc4T64YRA+DajAtzEvCR
	 BNZ9oumNb4fcmd6wlTnZEPKdMCb/RCUFXO7quhOEB7dfXPs7WOnC4sBjtkxo/Se9lK
	 Hxuy6YS0AZ66ikzNQpsubo74ToOSR0Ez6zZu1wLXtAZgsHvL9tKxPEXFm36TqLCMZr
	 BO7TlgaVCjawHJSwmSg+tWpxe0JbRSW4ToM1SdPfN9kczRasGuY5RRl3neMETxN+wv
	 BomhwX9NIxfDaev6sU5ECFvkPehDbuCa48aBNBcQe8Itg0Ek/RBM6c0fpm7lByvPEj
	 s4W8oFgLkjjJg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 15 May 2024 21:51:15 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 15 May 2024 21:51:15 +0300
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
Subject: [PATCH v3 5/7] clk: meson: a1: peripherals: support 'sys_pll_div16' clock as GEN input
Date: Wed, 15 May 2024 21:47:28 +0300
Message-ID: <20240515185103.20256-6-ddrokosov@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/15 13:12:00 #25231738
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_115126_102296_518A3DE7 
X-CRM114-Status: GOOD (  15.68  )
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

The clock 'sys_pll_div16' is one of the parents of the GEN clock. It is
generated inside the A1 Peripherals clock controller from 'sys_pll' PLL
clock source with a fixed factor.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/clk/meson/a1-peripherals.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 621af1e6e4b2..56e44299982c 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -746,14 +746,27 @@ static struct clk_regmap fclk_div2_divn = {
 	},
 };
 
+static struct clk_fixed_factor sys_pll_div16 = {
+	.mult = 1,
+	.div = 16,
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_pll_div16",
+		.ops = &clk_fixed_factor_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "sys_pll",
+		},
+		.num_parents = 1,
+	},
+};
+
 /*
- * the index 2 is sys_pll_div16, it will be implemented in the CPU clock driver,
  * the index 4 is the clock measurement source, it's not supported yet
  */
-static u32 gen_table[] = { 0, 1, 3, 5, 6, 7, 8 };
+static u32 gen_table[] = { 0, 1, 2, 3, 5, 6, 7, 8 };
 static const struct clk_parent_data gen_parent_data[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &rtc.hw },
+	{ .hw = &sys_pll_div16.hw, },
 	{ .fw_name = "hifi_pll", },
 	{ .fw_name = "fclk_div2", },
 	{ .fw_name = "fclk_div3", },
@@ -2024,6 +2037,7 @@ static struct clk_hw *a1_periphs_hw_clks[] = {
 	[CLKID_DMC_SEL]			= &dmc_sel.hw,
 	[CLKID_DMC_DIV]			= &dmc_div.hw,
 	[CLKID_DMC_SEL2]		= &dmc_sel2.hw,
+	[CLKID_SYS_PLL_DIV16]		= &sys_pll_div16.hw,
 };
 
 /* Convenience table to populate regmap in .probe */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
