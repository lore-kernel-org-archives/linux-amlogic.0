Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A523C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHbCXxXrd7G0db42vD8i94cn4QaOd/j9Rfn1+p820Xo=; b=ST73rS1LqMwQnp
	h1hVe7rPYG3/DcsSaJaW8KjTO5OPENjEITKoTL/CAD5BAoHdqPvIFygO+cb0lnwtjLif9s0aZUJDr
	yd9Pai8OddNvcTBvHk5tWq5I6Nau/Jet3D9JogJJr1lgnvw1D2AVQCpca0gbrKDpq8i4tzwxrhRTN
	pdMORLnISrwrfkfJ1748U/iCeeGBh+/+aq43+ejIMyt7BePAJx8LWnc6LInG5M1iqjorTIcCE98Ll
	S5FeK1CNloXfvrHyBHc2NTAehOU0EOCe5eLeFPTYRH/zuh2o4uyXCDn0dE6BYc/uE8XByCvQ02O0a
	bHOI91zITD+adhU6ujMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqJJt-00000001y6C-42JJ;
	Fri, 29 Mar 2024 20:59:25 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqJJo-00000001y33-0sdA;
	Fri, 29 Mar 2024 20:59:22 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 46A74120018;
	Fri, 29 Mar 2024 23:59:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 46A74120018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711745955;
	bh=A5x5jKRDY5bKTnsE7ZPSAZXHgm2KzJ5lAzPlz2XgJ8o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=mIU5BVwv28i10hrRdZaJEk1em0XFBEUYSPODNtOBKY3m/IgvqqX8eY9PjLRw4scEs
	 L8yQkJfz1rQMimfMCS/RyY9EevTSpe4zRz+BbZZwOkWcZZZ2fuhodejy21g61laNiZ
	 KqzvIoAgEnfGHz/16W0r/sdyO4jQew/BBv+H9FkCsN9pmHhSBGu39Uiqk2y5nppxVc
	 kadPsLnm6T71c/qXHjGBontxfNjBNJTwTwSYSaAhettfsSqoRSQH0B6pkoeF1D239K
	 nmq9mYyypsTiricoLBcPI6QIGKHc9ironM9dd5pV9NB8lCQZ0ZBBACLDjmdk0Y3MRU
	 1qRyio+Fwlvmg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 29 Mar 2024 23:59:15 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 29 Mar 2024 23:59:14 +0300
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
Subject: [PATCH v1 2/6] clk: meson: a1: pll: support 'syspll' general-purpose PLL for CPU clock
Date: Fri, 29 Mar 2024 23:58:42 +0300
Message-ID: <20240329205904.25002-3-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329205904.25002-1-ddrokosov@salutedevices.com>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184500 [Mar 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/29 16:52:00 #24511844
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_135920_956069_533BF48E 
X-CRM114-Status: GOOD (  18.10  )
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
 drivers/clk/meson/a1-pll.c | 78 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/a1-pll.h |  6 +++
 2 files changed, 84 insertions(+)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index 60b2e53e7e51..02fd2d325cc6 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -138,6 +138,81 @@ static struct clk_regmap hifi_pll = {
 	},
 };
 
+static const struct pll_mult_range sys_pll_mult_range = {
+	.min = 32,
+	.max = 64,
+};
+
+/*
+ * We assume that the sys_pll_clk has already been set up by the low-level
+ * bootloaders as the main CPU PLL source. Therefore, it is not necessary to
+ * run the initialization sequence.
+ */
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
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_pll",
+		.ops = &meson_clk_pll_ops,
+		.parent_names = (const char *[]){ "syspll_in" },
+		.num_parents = 1,
+		/*
+		 * This clock is used as the main CPU PLL source in low-level
+		 * bootloaders, and it is necessary to mark it as critical.
+		 */
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor sys_pll_div16 = {
+	.mult = 1,
+	.div = 16,
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_pll_div16",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sys_pll.hw
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct clk_fixed_factor fclk_div2_div = {
 	.mult = 1,
 	.div = 2,
@@ -283,6 +358,8 @@ static struct clk_hw *a1_pll_hw_clks[] = {
 	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
 	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
 	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
+	[CLKID_SYS_PLL]		= &sys_pll.hw,
+	[CLKID_SYS_PLL_DIV16]	= &sys_pll_div16.hw,
 };
 
 static struct clk_regmap *const a1_pll_regmaps[] = {
@@ -293,6 +370,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
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
