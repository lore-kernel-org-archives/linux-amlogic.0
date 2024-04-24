Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F27C19F4F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jr9onY2nKZuZ+Yfloe3yyWrW0ZCDehBZsMlBHE/jP9o=; b=QXIxfD2rL+azwA
	RBEOE0uCCgEC6BAAAWE6Vy+ZcEgwgL2CgxsvTZ7ciXX3Rmh4xrmI+AkStjc9bFRK8aZKzq3CABOZY
	rkc3bi68UHnidoq3f1r45VRqTDIc9TnFh/v1uix15b7EWqWaMRp3p49En2qJD31baU8czLALzNLjM
	9qWhCI1xS7DEqk++azmKmNaP4rlhQt2feRcVaZswhtywDFgVBicdXHtfAVFvcVygI8Na1UtRYsoEi
	xIioBkO0xPsny2LYldOUE+NJdi6FOFVn4whzzVpH7lryLcoOPH01O/Yq6W5z8cGr4LGecoaOvOR1g
	W9QHJ2kCexCk9DOy4u9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcbt-00000004F1X-3K2B;
	Wed, 24 Apr 2024 13:24:29 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcbo-00000004Ezi-0cXq;
	Wed, 24 Apr 2024 13:24:26 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9C282120010;
	Wed, 24 Apr 2024 16:24:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9C282120010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713965056;
	bh=PivDwMlzP3nP6SQyIPep/9C0T91zkfzg9QOFeyHrECI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=MW/oZF6XmtOrUR5Y+CLP41Oo+RO9d5R08yTkNmYZwU3z5XdN6mDBAqsTzUU7BJxQw
	 WADMLcSmNil2Tjvhkrf7j8/lQ2B1Oks39pG071Nfurm4XRI2f5mj7ewF5uDBXImVgh
	 d3moSJtbhwtuFfG9pFrFAsBFEH7dX8tumklylYSqscHI7ipqAg5OJ6B62zQv5Ch5L5
	 S7krrV1/CjhDMp4SWsrCFZNzlDSap/0MiV54szWhv9J41PfcbKYcOWzkhPzC1DFI04
	 T+i1ObR6WykIEk9wWwplr0k9TJIxVFNHLh8FXQVvihmLAYYcpSmZqv5HQ6YU3G5Z9i
	 ng9Sh/uG+sgZg==
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
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v2 0/2] meson pwm small fixes
Date: Wed, 24 Apr 2024 16:24:06 +0300
Message-ID: <20240424132408.2565916-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
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
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/24 10:33:00
X-KSMG-LinksScanning: Clean, bases: 2024/04/24 10:33:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/24 08:29:00 #24954596
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_062424_888920_FF471943 
X-CRM114-Status: UNSURE (   9.41  )
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

[1] https://lore.kernel.org/lkml/20240423161356.2522636-2-gnstark@salutedevices.com/T/#m6d1d5cf100dc5b77f85e2a7d01c0b0097b6a04da
[2] https://lore.kernel.org/lkml/20240423161356.2522636-2-gnstark@salutedevices.com/T/#ma84e2d490bf79bda12f8393773c1af37b48d5473

George Stark (2):
  pwm: meson: Drop unneeded check in .get_state()
  pwm: meson: Add check for error from clk_round_rate()

 drivers/pwm/pwm-meson.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
