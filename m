Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B830AC10F1A
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vj2jQNS74mO+COqnGdn/H/jICK+tuilHtVpR2YIyKro=; b=y2FWS1M0dQ4k7v
	ChElYWKgLRxGWKsllXcZmW8lO+nlVp4sD5mnf8O5jpaZfE8l20A/PbPgf3NYGSMbQim7cIJEBOPzv
	4mff+qUM7wK8xUPZeYtWafWHqbDQIamFzqWHoS4P7H4LVRZZ93MEkXHIBzbmkSD4UZjjeFIUcrPAR
	3+NjwgYro8WzHVysmo6JdAebb3ogpT/tQdEKMXyp184AgdKq/SAFEHzz1GRL55FZgxjZ5VHaIg3sj
	T3HMg4scYjzSjPd+ztiR+js9xKbsin9ag76V6Ndnb3KLvgpP01ieBEfdiBeJDekgyAlSqY+NE7iaj
	YsFSfyPag9XTg//CdXIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIj2-00000000fDO-0F5X;
	Tue, 23 Apr 2024 16:10:32 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIiy-00000000fB8-0tr5;
	Tue, 23 Apr 2024 16:10:30 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E6D0010000F;
	Tue, 23 Apr 2024 19:10:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E6D0010000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713888616;
	bh=DVY98jI0X94wEfGtVnGL5e71u5Av+34StswLSdjKMcs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=GY608lPm+OHvHFn6oSpWz8Y24ZDsU/bVdrbNUGJwLp2XrP0Egsps38mdY3vX3vTMG
	 VflSktVIFX42pcUFHhsOpAYpbw3vHw1N07nTdEed5Ze24OTPYae2UE3IJPc0TeHZQw
	 pmbQocZN9cbm/+Vu3w5F8WQa8gBl50uYLrNDXIohoJ+xfIZgxU2JlSvhJCVwFV/Q3J
	 Jq2yBlayDc/sDu6oXasrfG5DMspxP+D9f8x0hBhMdJySpWz7Uh33uRssQK5hg72VI5
	 GZ4xEqmXgDuFlUtvdZLHVw5E9EDdRFC5mLDVQl7j1hF3FltqlUkNiSpPmo27ibCkbm
	 N7k3UeVkNg9PA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 23 Apr 2024 19:10:16 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Apr 2024 19:10:16 +0300
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <thierry.reding@gmail.com>,
	<hkallweit1@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH 0/2] pwm: meson: add pwm support for A1
Date: Tue, 23 Apr 2024 19:10:04 +0300
Message-ID: <20240423161006.2522351-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
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
X-CRM114-CacheID: sfid-20240423_091028_882540_32295986 
X-CRM114-Status: UNSURE (   7.56  )
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

Add support for Amlogic meson A1 SoC family PWM.

George Stark (2):
  dt-bindings: pwm: amlogic: Add new bindings for meson A1 pwm
  pwm: meson: support meson A1 SoC family

 .../devicetree/bindings/pwm/pwm-amlogic.yaml  |  2 ++
 drivers/pwm/pwm-meson.c                       | 35 +++++++++++++++++++
 2 files changed, 37 insertions(+)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
