Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE4BC10F1A
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BW0nQBZ8PmL0ZEapVJP/Qwm3WV+QVy9mCIndtq6yU2o=; b=twpUx/3SCzGQkO
	3eaJX8gjMcbM1UfNnmX4yCk6/UNSAy7WXYXD1BanVXugX/0sApss40lrMlo8S/UAHzPgw9UXxU9SX
	ei6O5RgfhDZIFwTUIY6asMOgwmKGCrdLtLOCBJUqhzZOaae6XmP42pePQixybPUqp5RIDURPCZ5Og
	Jtnd69oZNFUMDop89Fy55wfbXYnUqLy4KxxkY6HbcLhbJidSAZ08c2zGpZKrgFS+1A+3GT+U242h4
	vv0bBjQSpuItproUpNnb9bvsyTpRvDJktUKzP0MJSUwEbxtntLgtA3K1+cqtMHm6f0UO8LSWXeLaG
	zYXsurkekPJ8lbfjxGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzImZ-00000000gCT-0onh;
	Tue, 23 Apr 2024 16:14:11 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzImV-00000000gAX-0nvy;
	Tue, 23 Apr 2024 16:14:08 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 43D96120011;
	Tue, 23 Apr 2024 19:14:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 43D96120011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713888845;
	bh=5Gfs5AmZGozZkrrRTvm140Edujqw0V5kNp9waYflDF8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=b1yJeJJaDHqH69ss+sRunhyufYQj7rb6mouCKXrVFaysnuFWc1mTSgT1EdKNU6Pq3
	 A79gQ+iFnbkN0Ik2WngcXBxeoU35rNHzUXQh3IOuRagb9hDzpBNxo+53kX7rrwtmFf
	 yXSumzqbDzwQ4ffX1nb0oatFzMSYX461Wf41TP6vjjzW0ATntFn5grKADVJzfDfkmB
	 VL3FO6D8MQTQXABxWmID518Txl7ELHqLvPC32mgKsIqlp6xu42EYxFxDIVbedXbA9b
	 zlbsYkG4x9qmvprIbIh5ASsZ7oDjF+OW43b3OLIzQ6ac+CLmxuPZq+U3u2b8O0GYP1
	 QGCVfVjuwnZ2w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 23 Apr 2024 19:14:05 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Apr 2024 19:14:04 +0300
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <thierry.reding@gmail.com>,
	<hkallweit1@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>, Dmitry
 Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH 2/2] pwm: meson: add check for error from clk_round_rate()
Date: Tue, 23 Apr 2024 19:13:56 +0300
Message-ID: <20240423161356.2522636-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423161356.2522636-1-gnstark@salutedevices.com>
References: <20240423161356.2522636-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184882 [Apr 23 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/23 04:11:00 #24934400
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_091407_641285_B9591CF3 
X-CRM114-Status: GOOD (  12.64  )
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

clk_round_rate() can return not only zero if requested frequency can not
be provided but also negative error code so add check for it too.

Fixes: 329db102a26d ("pwm: meson: make full use of common clock framework")
Signed-off-by: George Stark <gnstark@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/pwm/pwm-meson.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index ebe76298f6e2..52604635b31e 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -168,9 +168,10 @@ static int meson_pwm_calc(struct pwm_chip *chip, struct pwm_device *pwm,
 		freq = ULONG_MAX;
 
 	fin_freq = clk_round_rate(channel->clk, freq);
-	if (fin_freq == 0) {
-		dev_err(pwmchip_parent(chip), "invalid source clock frequency\n");
-		return -EINVAL;
+	if (fin_freq <= 0) {
+		dev_err(pwmchip_parent(chip),
+			"invalid source clock frequency %llu\n", freq);
+		return fin_freq ? fin_freq : -EINVAL;
 	}
 
 	dev_dbg(pwmchip_parent(chip), "fin_freq: %lu Hz\n", fin_freq);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
