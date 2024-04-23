Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5E8C04FFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmwnw6Pke4sht/8p0/MKlIi7Zb05pr1oZrqUk2Q+bcc=; b=wznzKuYhY5tvv6
	XYJ96yh6eoWYf9jCopm6lZJ2mKvVD+lBiR6l9YinuU44ccaq1EqeQcY1HFHnAcjrU+lNzZBHmj41H
	f2CBKeCnvKRq31bdmANf09cK4iPpjWy/rzvmuvVtlu8kfjAOs2VrSfKkgV316Y4jNiXEf/bXRs5jZ
	dyJ/qiT6TpSdJ0XI36fJGaxsemwKmHgN5CXJUowPHyuOtUoeISQ5q3XDXVRFZ2jIJU/G1IJJTG1G4
	efOut7WRFqGI02Cfd0J7ZSg+ysPw2NTpRCypejlb5gptFUOS2kwUgorxHoTXWQYeGmx0uJrWYTuUE
	OK7f68nFT5PF7xs4IIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzImc-00000000gEb-0z0Q;
	Tue, 23 Apr 2024 16:14:14 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzImV-00000000gAP-1OIY;
	Tue, 23 Apr 2024 16:14:09 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id F38FC10000F;
	Tue, 23 Apr 2024 19:14:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru F38FC10000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713888844;
	bh=Eb7vuPSuYnLMwuwGHzpqpt0wDC94w7XsXp1ME5MdeHM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=rAWXG9MTkFJR8xM9NJQegShLU8uEwEu2YxwpPSX4u4ccFgdSmtiPJAtZepxmV0flQ
	 2NIuYWF5/eZs3NadRRTTBcvvA5MA5TuOcRxLzUpcZxZEipGMIoUgZEzETKcVo+6jSs
	 96ODG7/fU44CEaWDjdxp1cgI6tkeIWja2uDjeQgeM0MyBuG+ZQEL0L7Y44kmCafL3s
	 tuTWRVPFa4M4Oi6vo1wlmE+bMScl5Y732jQJfYcMFjtmtHb3n80+PxPB44vaYMK8/j
	 kXe23Yx/LSUFxxxIRfBM/5OP0dUIrqgFO27JPQlck7A3CHpDd+ebwrj8wiCnMHmKJq
	 156PXjxde7AxA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 23 Apr 2024 19:14:04 +0300 (MSK)
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
Subject: [PATCH 1/2] pwm: meson: drop unneeded check in get_state callback
Date: Tue, 23 Apr 2024 19:13:55 +0300
Message-ID: <20240423161356.2522636-2-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/23 04:11:00 #24934400
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_091407_832608_60026D84 
X-CRM114-Status: GOOD (  10.49  )
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

Drop checking state argument for null pointer in meson_pwm_get_state()
due to it is called only from pwm core with always valid arguments.

Fixes: 211ed630753d ("pwm: Add support for Meson PWM Controller")
Signed-off-by: George Stark <gnstark@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/pwm/pwm-meson.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 529a541ba7b6..ebe76298f6e2 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -311,9 +311,6 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	struct meson_pwm_channel *channel;
 	u32 value;
 
-	if (!state)
-		return 0;
-
 	channel = &meson->channels[pwm->hwpwm];
 	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
