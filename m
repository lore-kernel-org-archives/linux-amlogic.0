Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB8AC07E8E
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8zow6U0WszoI6W+s1JLeDFrG9rksZfCxm/nTlhmJWg=; b=VLcGHk5KmwmD5P
	rz5NyeoATjQ+QTfWrECfaoH8KDGFYC5/oTy+HToS5X9ZAyheyp8WaAWO7GZvfGNugbm8jzC9wa7uz
	8QHtX4bQ+Le3wSr5rA+25TEjpC+Jn2BMv0gafViw94y6nycIN27kWHSTStgcxskEKEudyJtKgi0si
	+Pf09dmhNhCG5XFQaF494556iouduhxYi9DQppNOz24uoYCFEXNn0IzsZVr4FtdFumxaKlJypRF7f
	bpP9wRRqOo7gMpVhpYyCK+TIQrCTMv0BwwP9XewS+jk34X34FJbEZoxw87vocGPMBhQaaofGOcTl0
	MhLKQrAIg58+rZJ+6m6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcbu-00000004F1d-0v6C;
	Wed, 24 Apr 2024 13:24:30 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcbo-00000004Ezj-0cRw;
	Wed, 24 Apr 2024 13:24:26 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C7A4B120015;
	Wed, 24 Apr 2024 16:24:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C7A4B120015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713965056;
	bh=CJqJH6Aem+/Zgl9mTPvkSpY22mVAhX57+bi5i0Gt8yo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=FTfSJxOoLiB1ltBzGDF2jq0P38lxy7g/qI0iDbTIisQo1R7GODF8Tj59opkiKAlJX
	 eLS/ziL3Qu5cNc5Rt6gYAnmuyKEuYeLA5GPnGny32Pa31uMj8WMNTDshUV219fKcvl
	 vCx2Ft7HDOJ+NoYxILPa60a86aAB+aivhDh31VSTZWLBiu8gyNuL/ELyDA5gm82P2Y
	 oxjCuS6/205wwxr1ovZHDAuyx2miBaUwTAIXhxiVBVo/Af/zuvdXcoWDM1Xs6b50Oe
	 vEKgt1YqwoPF8Mbw6EwYib7BWxdQJokDL4IDqNKcwH2cvi/ilS1AUvkRPyrl3w7KMs
	 lUan7Mr/4Gs8w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 24 Apr 2024 16:24:16 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 24 Apr 2024 16:24:16 +0300
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <thierry.reding@gmail.com>,
	<hkallweit1@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>, Dmitry
 Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v2 1/2] pwm: meson: Drop unneeded check in .get_state()
Date: Wed, 24 Apr 2024 16:24:07 +0300
Message-ID: <20240424132408.2565916-2-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424132408.2565916-1-gnstark@salutedevices.com>
References: <20240424132408.2565916-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184897 [Apr 24 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/24 08:29:00 #24954596
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_062424_886954_CCAAA1E0 
X-CRM114-Status: GOOD (  10.27  )
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

Drop checking state argument for NULL pointer in meson_pwm_get_state()
due to it is called only from pwm core with always valid arguments.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/pwm/pwm-meson.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index ea96c5973488..f4d70da621ec 100644
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
