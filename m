Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC017D44155
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Nov 2024 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ph3BYuPSU5tbPwWFYbTV2UUIBu7EsqySGrBSIFzJpok=; b=wSbIJjP8Kgybij
	s3CKNtLRuTTp6q7D9ONKgJA8G9+CC7/TN5xk7QALRyEEPYXRcl/Q/jRIcgChOvHHPZKf9EaWV4jJy
	L44iX+Q1gEvPMXd5FkEC+h0LLdOzletRbeM/WuFPKyRdtbQsho4WR4MeVziLBZMiqiTfAKwM7YW1d
	ZSnGuKcH0ZzjtoUdYW8fy/EuyYv4GQD4R7DR+BvdZyI20n29AXrdclhvrDisEC8GMh2dGPcPNjAR4
	IGceqWYsAqpyDxaSYAQl4yuHIggaXD3jai9FSkzy2X7zR5XxZO3OMTRo07l4MC3lcnCEMcija7hVr
	pLOte0EjbgapdUBpyR/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNjW-0000000CQJw-0nN5;
	Tue, 19 Nov 2024 12:53:30 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNjT-0000000CQHH-0UnG;
	Tue, 19 Nov 2024 12:53:28 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BC352100005;
	Tue, 19 Nov 2024 15:53:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BC352100005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1732020805;
	bh=WLMqgYAx8jrAH0NGtJJdr/WAytRnlNbxc+XJ13Kxixw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=otr+phbuxnZgxzhuPNw8Yn5zEK7ExbKETyvkv9/uME+p4txvy5tBOT97ScqSjaY5N
	 FfYu1sAl/Owu8xbp2Ln7LwPgS34gHW6h4R0YxY7WP7Tq+T5rAzsX0mKEFwY9g15RVU
	 T+F4xvMRDe3dZMdiXKldYTSbayR6tLmUawN8CzfMtwQNcvO0iXGAsbyVGjivme8BBl
	 PaMjf8AwYUESGPfMKWiJFnBcsX73HUhO+WwB335Kh3oJJ2OsK8ETFe2ozkGOCx16dv
	 9a523Lm5OGZO02h0pRZaZ/kuu+2XEm2FLZcM5C8vSc9fgeOXy7Fb1Mv75JwK76znZQ
	 ZFpEye9NZRQag==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 19 Nov 2024 15:53:25 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <ukleinek@kernel.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v3 0/4] pwm: meson: Support constant and polarity bits
Date: Tue, 19 Nov 2024 15:53:14 +0300
Message-ID: <20241119125318.3492261-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [176.57.76.73]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189267 [Nov 19 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/11/19 09:12:00
X-KSMG-LinksScanning: Clean, bases: 2024/11/19 09:12:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/19 08:41:00 #26886618
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_045327_499444_D3FE1C3A 
X-CRM114-Status: GOOD (  12.11  )
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

This patch series add support for amlogic's newer PWM IPs hardware features:
constant and polarity bits.

Using polarity bit for inverting output signal allows to identify inversion
in .get_state() callback which can only rely on data read from registers.

Using constant bit allows to have steady output level when duty cycle is zero or
equal to period. Without this bit there will always be single-clock spikes on output.

Those bits are supported in axg, g12 and newer SoC families like s4, a1 etc.
Tested on g12, a1.

Changes in v2:
  pwm: meson: Support constant and polarity bits
    - drop separate set_constant() and set_polarity() and move register writings
      into enable() and disable()
  pwm: meson: Simplify get_state() callback
    - add new patch to make .get_state() callback consistent. Since I add new
      fields to struct meson_pwm_channel either we should fill back all of them
      from registers or not at all.
  pwm: meson: Use separate device id data for axg and g12
    - add splitting amlogic,meson8-pwm-v2 into amlogic,meson-axg-pwm-v2 and
      amlogic,meson-g12-pwm-v2 with pwm_meson_axg_v2_data for both compatibles.
    - update commit message
    - add tag: Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
  pwm: meson: Enable constant and polarity features for g12, axg, s4
    - add enabling const and polarity to pwm_meson_axg_v2_data
    - add tag: Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
  link to v1: [1]

Changes in v3:
  pwm: meson: Simplify get_state() callback
    - drop local variable channel
  pwm: meson: Support constant and polarity bits
    - drop meson_pwm_assign_bit() and implement bit assignment in-place
  link to v2: [2]

[1] https://lore.kernel.org/linux-arm-kernel/20241007193203.1753326-4-gnstark@salutedevices.com/T/
[2] https://lore.kernel.org/linux-arm-kernel/l5xvdndysdvtil472it6ylthcfam5jp7lh3son45mezq7dh2yk@3yj557k2o5k5/T/

George Stark (4):
  pwm: meson: Simplify get_state() callback
  pwm: meson: Support constant and polarity bits
  pwm: meson: Use separate device id data for axg and g12
  pwm: meson: Enable constant and polarity features for g12, axg, s4

 drivers/pwm/pwm-meson.c | 105 ++++++++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 14 deletions(-)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
