Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A610FC04FF6
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Apr 2024 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUB1Oy6P0Jytk674hseQ/daIYnhf+iT4jU7t4TuFFWE=; b=ImO6Hq0NbfuPj0
	+yMzvXZEe37iacc2ucSk8DSwQW5VwyTlhkPk785DOpJQM387jmPrndzQTeg9IuFbQ5Hc39lDnrInx
	yrr+zQuitUg6ysEkdkFhBFv4HCpoWUaP89Y0PpRZyuKJzTZYWoaSbxhk1nUxy3/eJLsi4RXaS1+/a
	oxBuwjAHtQTGjniiX3KncE4d7AsDS1q6NoVfLt9wk3lvystnGgsYraJGmh/H//XshU6VlYl5jspsB
	EAiKVI0VrJhxD0BNJVLMvhovjE3wXMp9yydhIVIvsdb4f3pX1qjJY5+UwulxIXY66NoMy6DbKHNBD
	9U1Wqc+5BBxPvRJFhFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnrD-00000005gCw-1wFC;
	Fri, 19 Apr 2024 13:00:47 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnr6-00000005g6H-35MJ;
	Fri, 19 Apr 2024 13:00:44 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1159D10000B;
	Fri, 19 Apr 2024 16:00:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1159D10000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713531628;
	bh=KIuGAr064Uhr/J/wzqdUXxyIs1qnbRClXG3hlcnxZzs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Gw+XRuSqvKMjnf+7GtKvUJLYy8p23vmHiIZhAPW3gc5DUUg3NwXJlYvMGhaaQG3ug
	 hDFEB3UGCPGeiNU7X/LEwGpGq/p3H5FKrcohaXgKKPI8phcACa7pafFAEWRd6MCI5R
	 AoHeqfRPLnGOfgJgOGP6K41uQnPKZRGZs9Repo9FOqjb5KZzcEvTgHFneOmyKytik9
	 7CLURLQ61RSVobjCE55L3soLmBLNs/YGhBQ7AJMqWxWHR3STwomfqWgH8ZSyKqHJSe
	 shlTG0X5gWjDAVyZDYCFCNX9mE4UfDpzlEzArNbJk2EJynaI53uVnMZkw3pNfLRVMX
	 87kPj3gLomS1A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 19 Apr 2024 16:00:27 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 19 Apr 2024 16:00:27 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH v3 3/6] clk: meson: axg: introduce AUD_MUX_TABLE() helper macro
Date: Fri, 19 Apr 2024 15:58:09 +0300
Message-ID: <20240419125812.983409-4-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184806 [Apr 19 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_smtp_not_equal_from}, sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/18 23:49:00 #24865988
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_060041_477759_BDF2A558 
X-CRM114-Status: GOOD (  11.64  )
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

This macro takes into account ->table property of
'struct clk_regmap_mux_data'.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 drivers/clk/meson/meson-audio.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson-audio.h b/drivers/clk/meson/meson-audio.h
index cbcdbd487d4a..1947c6cbf233 100644
--- a/drivers/clk/meson/meson-audio.h
+++ b/drivers/clk/meson/meson-audio.h
@@ -17,9 +17,11 @@
 	},								\
 }
 
-#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pdata, _iflags) {	\
+#define AUD_MUX_TABLE(_name, _reg, _table, _mask, _shift, _dflags,	\
+		      _pdata, _iflags) {				\
 	.data = &(struct clk_regmap_mux_data){				\
 		.offset = (_reg),					\
+		.table = (_table),					\
 		.mask = (_mask),					\
 		.shift = (_shift),					\
 		.flags = (_dflags),					\
@@ -33,6 +35,10 @@
 	},								\
 }
 
+#define AUD_MUX(_name, _reg, _mask, _shift, _dflags, _pdata, _iflags)	\
+	AUD_MUX_TABLE(_name, (_reg), NULL, (_mask), (_shift),		\
+		      (_dflags), (_pdata), (_iflags))
+
 #define AUD_DIV(_name, _reg, _shift, _width, _dflags, _pname, _iflags) { \
 	.data = &(struct clk_regmap_div_data){				\
 		.offset = (_reg),					\
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
