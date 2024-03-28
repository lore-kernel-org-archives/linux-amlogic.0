Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C19CD11DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 19:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hqBaD9TCl3szRVwUQ8V+MtawCig+wfWIQawwQW6eWD4=; b=qY2wuLpsaNXwh/
	gHHYH3Qz5fJNloDqGJRXMZBfsv44G63TUoa7camp0bbv8zKnItQvL1QcS2JAwKogTx9/pXCLczv7A
	mxjtlkt62EeO73I1BFTUvqUqU+0GcuBTCzuGLmBIi08wlZLuF9Da0qEm4sagD9qqHI3OhsrruXKqr
	SHlMiJn6UKp3U+SNisZaFuJNtJ1pEpIol3Dn6vjFyMpMktfOAeywv7vZYNvWk0oL+cUbQzOSszvbG
	y6g/3GrxdfQ4Frvnc6WhZO4ha/my3e07e5FR0qb/WKMfNUcLhTHWsmjGB1ZvYry8tzhFjIA1vZHnr
	myaUpQcnYciVYGO5AN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvsi-0000000FUXy-2ID5;
	Thu, 28 Mar 2024 19:57:48 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvsf-0000000FUVj-2NYn;
	Thu, 28 Mar 2024 19:57:47 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7C6FD120006;
	Thu, 28 Mar 2024 22:57:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7C6FD120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711655862;
	bh=J1/tsMz9G9CRvZryKckzyx/QA25/rYaJHeU8Rg8upNg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ij6tDyPiW4C1258e7K6nBMoIU18H1z4zgXG+IH5DSnAgh11efPtYTZHRIcbHt8ZTi
	 dRveYjM0c72rVRxPc/tcw52+vWVZnhpo+x5XTT6w/03PHZ2kaZNFeShkaTI3ZZMr7D
	 2sNZFi/h/l7BBlo8ymuyWTSoB0VBtTf3hoDMmEnEWVJQa8n+8j7ka5+EX64qVBMWpf
	 a/gUt5KekUo8fP7wZdF0a+IGsW8+nm1qL73SWvaL6uGkFXRXF0dXit/RAwpRA7m1H2
	 Ztdabxe1yPChvhpCzpRCKFHKydbfVjOeZUR43A94qNRc3eg+VPKGPk8cnLK1gmU45f
	 YjtE22mUplBJg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 22:57:42 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 22:57:41 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <sboyd@kernel.org>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v1] clk: meson: pll: print out pll name when unable to lock it
Date: Thu, 28 Mar 2024 22:57:29 +0300
Message-ID: <20240328195733.30572-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184478 [Mar 28 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 18:13:00 #24496606
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_125745_973632_EC4F6A8B 
X-CRM114-Status: GOOD (  13.72  )
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

In most meson systems, multiple PLLs are present, making it difficult to
identify the specific PLL that fails to lock. To address this issue,
print out the name of the PLL that cannot be locked.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/clk/meson/clk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 6fa7639a3050..78d17b2415af 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -436,8 +436,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	ret = meson_clk_pll_enable(hw);
 	if (ret) {
-		pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
-			__func__, old_rate);
+		pr_warn("%s: pll %s didn't lock, trying to set old rate %lu\n",
+			__func__, clk_hw_get_name(hw), old_rate);
 		/*
 		 * FIXME: Do we really need/want this HACK ?
 		 * It looks unsafe. what happens if the clock gets into a
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
