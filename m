Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2D3CFB456
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 19:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K6FlI6wU60nSZmLjf2b3SP4JTonOf2rSV2YyKJwHAXw=; b=JsrW2RLK6t/HXz
	4nOvbJuxQx1I8Bfh8xKalGx6j/DjJobg73U6a1qO6dcWI6CTkEy6Zb5isZ9qsMdM/+eGJAHbscLZM
	zjAHx7A1+MtPPjCQJmJsnEY4dPtqj2iGTgbKUMk/J+6sj//XyeeW9qDwcVvxP/bbH6V4amh59RliD
	lcXA4PSdaP7isb5HjGPfXF2Eiw+zM7BhtawX7hSX5BUE0vfUscAOEMneFsUato6+wPewv1nhHcV1J
	OtaNY82ALEPRosH1LUL/uXuszdCsGtnJdeZu1U4A/+NHtTYCrLI2ScnoG3oD1rbUH9uLoHWlMz2bq
	xl2tmWxOhFQgdz4/740A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtSz-00000003cVP-2vq4;
	Mon, 07 Oct 2024 19:32:25 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtSt-00000003cTR-1U2a;
	Mon, 07 Oct 2024 19:32:23 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 387B1100008;
	Mon,  7 Oct 2024 22:32:11 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 387B1100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1728329531;
	bh=auwqfHEF7ME53k772fd+EeQA9nJK3Tgrnfl5jkgQXW0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=NVFTG0m9hBCOZnwq8gKbYdo1TmDaRc2Ili1m4JOv54oqKfpKsmSP+BtgmuN3SddSQ
	 GSfbbcAj2EAiJx/9UYfY5YMc7a/lwJJqjDEfkXblhzyQshQXxBqdUL8GBHswPzsFlz
	 siSqY7Q060gxXQzFbdPWoNtnYLsXw7ZhUqT87lKtQirSp6xF7G/HiKLJw6U3NVI7En
	 so6cypLtcb3irbJfzb75a6DCN2QVCAau1u+gtTXMFU33vkP53EisecAh7f927gQCF3
	 ri9U7DqT+xHxvTLyDCbT6NP2deyuwI5RHs18/CScD4WssBZ5aN0Wt6zM8jxtCO8IHw
	 Edt//fXB8DcDQ==
Received: from smtp.sberdevices.ru (unknown [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  7 Oct 2024 22:32:11 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH 0/3] pwm: meson: Support constant and polarity bits
Date: Mon, 7 Oct 2024 22:32:00 +0300
Message-ID: <20241007193203.1753326-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [172.28.192.106]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188277 [Oct 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/07 17:50:00 #26714324
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_123219_923355_60331BD1 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

This patch series add suppot for amlogic's newer PWM IPs hardware features:
constant and polarity bits.

Using polarity bit for inverting output signal allows to identify inversion
in .get_state() callback which can only rely on data read from registers.

Using constant bit allows to have steady output level when duty sycle is zero or
equal to period. Without this bit there will always be single-clock spikes on output.

Those bits are supported in axg, g12 and newer SoC familes like s4, a1 etc.
Tested on g12, a1.

George Stark (3):
  pwm: meson: Support constant and polarity bits
  pwm: meson: Use separate chip data struct for g12a-ee-pwm
  pwm: meson: Enable constant and polarity features for g12, axg, s4

 drivers/pwm/pwm-meson.c | 94 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 87 insertions(+), 7 deletions(-)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
