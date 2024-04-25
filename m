Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F079C10F15
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Apr 2024 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r9+raqjGZqGkfV3H09tgz1COU0TRbwHbyBEL7CBHTe0=; b=RLHe87qmt0Rhcg
	rakBalDp5NUuY50YPB4CCcP+uOPyA2bS0IU/ZU9TOiS+1Dvm45LeyvKi9vtXl4hjhoHNRZgYPg1UD
	fRytZYyig1zcIMWWDo7IMsQl/rKhW9vkkYLTrnwDTVTFpyaeeb8JCwek7nGaj6w0+8pDWYNIkq1aZ
	cYuOBcqlRiUBXhibskuqrgW0qVSfXjmhRfGR5b592x0Vtepp9Rc+gISJcpV79KN3BKktssQU+lToZ
	vIfyjNoHOaWlsamX0/vQnqsSX7LlzQmGwmFMPLLsrOopnTUoKfHp4kipOeaTMrKHRwT1U99La/pJf
	GJFJxRYTCfv1WHyTOelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02er-00000009XSL-3nj3;
	Thu, 25 Apr 2024 17:13:17 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02ei-00000009XKV-2oFZ;
	Thu, 25 Apr 2024 17:13:12 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B8DA612000A;
	Thu, 25 Apr 2024 20:13:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B8DA612000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1714065180;
	bh=wYm8pN+1CoBvKNj1w9JY3v9T8uYFYIB1Dq2+Zmhr2MM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ORREfMPkmA0Wgtmivtkg+frz3yhlTjoi0+atbo1fDIuChe6tjw4LWhe2HMY6luhsO
	 sfEyNxMNOLg9OA6q/SQu9XOzCHkbBMZ3cumhsCC3Yr6lWOcYWhpcbt4q59WwFKyfIB
	 RkbyiJcl/ebgGGBDCc7N9MYmh9jQVqsmjxaynT7IDEn3WtUFyshQBOugpuB15r+cjP
	 y56dpqXo+28Adz+jK3vJVkv5kzYNwDI2my7ERlNF8Q4EAoyDyoz6auLzOKYBGiaaAP
	 YiVPBfd1VKuxN31noe/VH34JdGF9y7I0PFim5tkavKnubxKT6p5J+MDm7hnR6bEyrj
	 N2r1laVzFFoag==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 25 Apr 2024 20:13:00 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Apr 2024 20:13:00 +0300
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <thierry.reding@gmail.com>,
	<hkallweit1@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v3 0/3] meson pwm small fixes
Date: Thu, 25 Apr 2024 20:12:50 +0300
Message-ID: <20240425171253.2752877-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184930 [Apr 25 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/25 14:26:00
X-KSMG-LinksScanning: Clean, bases: 2024/04/25 09:59:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/25 14:02:00 #24969020
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_101309_464208_907B9260 
X-CRM114-Status: UNSURE (   9.98  )
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

Just some small fixes for meson pwm.

Changelog:
v1->v2:
  pwm: meson: Drop unneeded check in .get_state()
    - update commit message
    - drop Fixes tag. It's not actually a bug
    previous version: [1]

  pwm: meson: Add check for error from clk_round_rate()
    - update commit message
    - change unsigned long fin_freq; to long fin_freq;
    previous version: [2]

v2->v3:
  pwm: meson: Add check for error from clk_round_rate()
    - change format modifier in dev_dbg() for fin_freq var to %lu
    previous version: [3]

  pwm: meson: Use mul_u64_u64_div_u64() for frequency calculating
    new patch

[1] https://lore.kernel.org/lkml/20240423161356.2522636-2-gnstark@salutedevices.com/T/#m6d1d5cf100dc5b77f85e2a7d01c0b0097b6a04da
[2] https://lore.kernel.org/lkml/20240423161356.2522636-2-gnstark@salutedevices.com/T/#ma84e2d490bf79bda12f8393773c1af37b48d5473
[3] https://lore.kernel.org/linux-arm-kernel/20240424132408.2565916-1-gnstark@salutedevices.com/T/#m52b7e5a34c3e8907235d73c2827b92cb13c93dd3

George Stark (3):
  pwm: meson: Drop unneeded check in .get_state()
  pwm: meson: Add check for error from clk_round_rate()
  pwm: meson: Use mul_u64_u64_div_u64() for frequency calculating

 drivers/pwm/pwm-meson.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
