Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6753CD1283
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpgGawYI7ROEkOQz42cNTdYH7+sxPUQqBw5nZmR7R40=; b=1opwymJIwKfmkO
	wWHtwsCq6QwWQXmGC78aCjCLOvhMyJH6kGYmEB0dFnTR24833Bo0Rm4jPgQHit/EyzZCBnE6oM9kz
	OT+m4Dp+6FxWe2NK0aGa40xDuC9gZImkRgWRIk7jZzPXKd423A2bTQwWOmTAjFBWYITqUqGZ8kpdr
	O13dA0C9OEXZxEJho53Z8YIZllnwG9toJsg3QbhHWRaY1887qjOnCOquJq2pvHfIyUCKCFI6HUaLl
	ABAJn53VE9Fjzm2qXq2yhWJQ8El9M5bNwOwTR8DhiOjEcSpUiveW0NS3vcb65nH+8GL62ZmFQ0+wx
	/nPyQ61rweV22ts3vNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqJJt-00000001y66-2Y6c;
	Fri, 29 Mar 2024 20:59:25 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqJJo-00000001y3A-0rmM;
	Fri, 29 Mar 2024 20:59:22 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9FDD6120019;
	Fri, 29 Mar 2024 23:59:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9FDD6120019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711745956;
	bh=xuKBJ+Bt7jmJARjlnxEbw3uFcDYRdaA63r8bHT466l4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=iykvs8wdwCMKO0S65V/uYgb1g9MuFAgajGnAnFO1mAEfY5MpQPY2/WqC8AWRd9g4C
	 OinbB8il+h4M7HkRr/7gOLzijNxz18pvWbTPcpDJ15vU8bPPSTYMKlAFAYm37xWgd4
	 XzzK3DTSQtre7k2j+ifUoIJDdIgt09GxEw6BTNy29qmutxItgt09uFhWCG5Ng2r/jj
	 KPdL8LzwRcb5vovY8LitwA2+ETkEO9twiYbNWvKfZuXtG6TrTbTKEg5AltPiXOvlFH
	 PQZ+3EfFmtMq+zDUaBrn3wd60IHEm7rR4XuTVNdSA4PqSE+dGauSlEI46j/P9ZWOLh
	 G7Gt3WnOg9EJw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 29 Mar 2024 23:59:16 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 29 Mar 2024 23:59:16 +0300
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
Subject: [PATCH v1 4/6] clk: meson: a1: peripherals: support 'sys_pll_div16' clock as GEN input
Date: Fri, 29 Mar 2024 23:58:44 +0300
Message-ID: <20240329205904.25002-5-ddrokosov@salutedevices.com>
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
X-CRM114-CacheID: sfid-20240329_135920_946257_5EAA9F63 
X-CRM114-Status: GOOD (  14.69  )
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
generated in the A1 PLL clock controller with a fixed factor.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/clk/meson/a1-peripherals.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 621af1e6e4b2..3c4452f2b146 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -747,13 +747,13 @@ static struct clk_regmap fclk_div2_divn = {
 };
 
 /*
- * the index 2 is sys_pll_div16, it will be implemented in the CPU clock driver,
  * the index 4 is the clock measurement source, it's not supported yet
  */
-static u32 gen_table[] = { 0, 1, 3, 5, 6, 7, 8 };
+static u32 gen_table[] = { 0, 1, 2, 3, 5, 6, 7, 8 };
 static const struct clk_parent_data gen_parent_data[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &rtc.hw },
+	{ .fw_name = "sys_pll_div16", },
 	{ .fw_name = "hifi_pll", },
 	{ .fw_name = "fclk_div2", },
 	{ .fw_name = "fclk_div3", },
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
