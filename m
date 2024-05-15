Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C27C25B79
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 18:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djS0H1OywIkKBTHrpM5NzsYVKS4mVdk4MfIDkiz4bgo=; b=BMx3DP/IK4G03M
	UlU6mdtHsp+g5cP8qDA70TMzwIHSRGN1zGjuh7v0eZE+aI2VZ93VZpJY87QsGPG80ny1gTcNWeLAP
	Pzn5ke5Mtj8xbDK2aiaGlZ7YepdUEn/Fnnr7JKZjkGu1tQj03CVhC/vxKvpRN1qY6DAVL1mXZCf2R
	7Mr9ZxrwgSbNtJY1ZwnyNMgab05gX+80Ogm65Z82SjIoaJVe2tJMIPIcL+vAcsv8eQUYNOIwsrt/3
	wwxJJ8sK1JEeq0NKMCLl7UE9iM/V9xmaAxqaIWTqyqHiOe3Y3hyoWxjpfN5W9PLWwkcivgXjlRP3Z
	V6WErNuTVtNfxe8urpxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7JjR-00000002bzc-2uG1;
	Wed, 15 May 2024 18:52:05 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jin-00000002bWz-2Cwo;
	Wed, 15 May 2024 18:51:30 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9C12E100030;
	Wed, 15 May 2024 21:51:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9C12E100030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715799074;
	bh=HLi7xTDyRLEAgUnT8cYqP8dgXv3WaHfuTaUs047L2KA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=LIyAbjfNh2JDqD4QyyQPP81Ljkno3Pa1xKBpLgkpTc2VDhBTKjGFHHMvufMlsg3z9
	 QAFynle5MhGG/WlGnRPaCzZ+UD6OUh1SCrN7SbkQ8j6yhR9giMLm/siLRlMvL5myRy
	 yH6eRiF+++0sdBj62QxhOODTvwTPnr5lijRg31vtg5tT6qKjcxdQVzfAZhrDWUTlof
	 FYsVIjGqX8EnKWulLCpZMsx9OJ3JAtqTsGARpcWSBLRa0sJHCn8l/F/xuC6vF4Xo0S
	 08HFdn66Q9d5B11naK4ZJePcOJMXAqL0/ytZDhfULqwpkzbKV295DTTMUhrsdmFRDJ
	 IJ9aWJfgRH6eg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 15 May 2024 21:51:14 +0300 (MSK)
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
Subject: [PATCH v3 3/7] clk: meson: a1: pll: support 'syspll' general-purpose PLL for CPU clock
Date: Wed, 15 May 2024 21:47:26 +0300
Message-ID: <20240515185103.20256-4-ddrokosov@salutedevices.com>
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
X-CRM114-CacheID: sfid-20240515_115126_122820_10039EA8 
X-CRM114-Status: GOOD (  16.16  )
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

The 'syspll' PLL, also known as the system PLL, is a general and
essential PLL responsible for generating the CPU clock frequency.
With its wide-ranging capabilities, it is designed to accommodate
frequencies within the range of 768MHz to 1536MHz.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/clk/meson/a1-pll.c | 72 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/a1-pll.h |  6 ++++
 2 files changed, 78 insertions(+)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index 60b2e53e7e51..286e83199d17 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -138,6 +138,76 @@ static struct clk_regmap hifi_pll = {
 	},
 };
 
+static const struct pll_mult_range sys_pll_mult_range = {
+	.min = 32,
+	.max = 64,
+};
+
+static const struct reg_sequence sys_pll_init_regs[] = {
+	{ .reg = ANACTRL_SYSPLL_CTRL1, .def = 0x01800000 },
+	{ .reg = ANACTRL_SYSPLL_CTRL2, .def = 0x00001100 },
+	{ .reg = ANACTRL_SYSPLL_CTRL3, .def = 0x10022300 },
+	{ .reg = ANACTRL_SYSPLL_CTRL4, .def = 0x00300000 },
+	{ .reg = ANACTRL_SYSPLL_CTRL0, .def = 0x01f18432 },
+};
+
+static struct clk_regmap sys_pll = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = ANACTRL_SYSPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = ANACTRL_SYSPLL_CTRL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = ANACTRL_SYSPLL_CTRL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.frac = {
+			.reg_off = ANACTRL_SYSPLL_CTRL1,
+			.shift   = 0,
+			.width   = 19,
+		},
+		.l = {
+			.reg_off = ANACTRL_SYSPLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.current_en = {
+			.reg_off = ANACTRL_SYSPLL_CTRL0,
+			.shift   = 26,
+			.width   = 1,
+		},
+		.l_detect = {
+			.reg_off = ANACTRL_SYSPLL_CTRL2,
+			.shift   = 6,
+			.width   = 1,
+		},
+		.range = &sys_pll_mult_range,
+		.init_regs = sys_pll_init_regs,
+		.init_count = ARRAY_SIZE(sys_pll_init_regs),
+		/*
+		 * The sys_pll clock is usually enabled and initialized in the
+		 * bootloader stage. Additionally, the cpu_clk is connected to
+		 * sys_pll. As a result, it is not allowed to initialize the
+		 * cpu_clk again, as doing so would prevent the CPU from
+		 * executing any instructions.
+		 */
+		.flags = CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_pll",
+		.ops = &meson_clk_pll_ops,
+		.parent_names = (const char *[]){ "syspll_in" },
+		.num_parents = 1,
+	},
+};
+
 static struct clk_fixed_factor fclk_div2_div = {
 	.mult = 1,
 	.div = 2,
@@ -283,6 +353,7 @@ static struct clk_hw *a1_pll_hw_clks[] = {
 	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
 	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
 	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
+	[CLKID_SYS_PLL]		= &sys_pll.hw,
 };
 
 static struct clk_regmap *const a1_pll_regmaps[] = {
@@ -293,6 +364,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
 	&fclk_div5,
 	&fclk_div7,
 	&hifi_pll,
+	&sys_pll,
 };
 
 static struct regmap_config a1_pll_regmap_cfg = {
diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
index 4be17b2bf383..666d9b2137e9 100644
--- a/drivers/clk/meson/a1-pll.h
+++ b/drivers/clk/meson/a1-pll.h
@@ -18,6 +18,12 @@
 #define ANACTRL_FIXPLL_CTRL0	0x0
 #define ANACTRL_FIXPLL_CTRL1	0x4
 #define ANACTRL_FIXPLL_STS	0x14
+#define ANACTRL_SYSPLL_CTRL0	0x80
+#define ANACTRL_SYSPLL_CTRL1	0x84
+#define ANACTRL_SYSPLL_CTRL2	0x88
+#define ANACTRL_SYSPLL_CTRL3	0x8c
+#define ANACTRL_SYSPLL_CTRL4	0x90
+#define ANACTRL_SYSPLL_STS	0x94
 #define ANACTRL_HIFIPLL_CTRL0	0xc0
 #define ANACTRL_HIFIPLL_CTRL1	0xc4
 #define ANACTRL_HIFIPLL_CTRL2	0xc8
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
