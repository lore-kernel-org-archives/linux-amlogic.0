Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07687C3DA40
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jeE/uOxQqlUsZGp1xMx5pXpbmrlc6pw3U5xusZ9WjFU=; b=Ql3hkeE//YzE/S
	W7A7GzbzUZE0a7RA62Uw9Ef38clYfOntndReKuQ2PGQs8UeOG/jXOMVafzyM4dzUwvY6BVimzDaRC
	K/6wZx2AjMOdeRMEJN/U7e4ngm/wSnQMyJXdA7gNmY5mU1jgZoj7Y/N694cyFhyZMecRhSdvanMgp
	1kNGWZQMWMstcwmHL8OBeZfcZzcaMMvhl4t3NKmUt8J0f6o8xbeNvkEGkQ5qpqGs9MJGxFmQwBxIi
	qZe94v1zZHzKGsTb/DPUd1PeNFLYTkahtLFcTamA/WmAmNqH1cRDzcsFwkoFpL3emUWNrC78Xm9ZC
	LFBd9yMTH1BvK5gH9haQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMmQ-001QC7-09;
	Thu, 06 Jul 2023 11:04:10 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMmM-001Q0G-2x
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 11:04:08 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1DC7A120087;
	Thu,  6 Jul 2023 14:03:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1DC7A120087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688641431;
	bh=P/blNqbgEw885UdhnTWktBHroh0ynoqnNCNWrFhTKZo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=WAD9J8em4WML6Bym4I7SodbuthSenznxng9P8yyTmNwxYRy6qkHsdHGiPBrojYMC1
	 61O351RUXcMmOdErrzs7h6JbyNR+dGr757a8cZW6i8s2zU6Jl3NKZkG9zm4ozyp0+3
	 NRnyedngCHem0DAz7ObC02YmX7FL6QycetRxxFssy1Mm+YX7FsjJt4ypo+DQpQntma
	 F1ODBUSkyaFMtqokrpj5y4uIQDwAeinu3qPoryR8VpuYr2rytjKDRTm5jnU7GnBkgB
	 NHPbDAWfV+UfDLhwaDc1fCPWFkafyLMLyxXnwPlpL62J1G7pX5h2OH45kkrOxMI3Li
	 xjdaeYFkmRfPQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  6 Jul 2023 14:03:50 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 6 Jul 2023 14:03:42 +0300
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <linux-spi@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>, Martin Kurbanov
	<mmkurbanov@sberdevices.ru>
Subject: [PATCH v2 0/2] spi: amlogic-spifc-a1: fixes and improvements for amlogic-spifc-a1
Date: Thu, 6 Jul 2023 14:03:29 +0300
Message-ID: <20230706110331.19794-1-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178468 [Jul 06 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: MMKurbanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/06 09:53:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/06 09:54:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 14:57:00 #21566867
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_040407_154187_B79504C5 
X-CRM114-Status: UNSURE (   8.96  )
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

This series adds support for max_speed_hz and implement adjust_op_size()
callback.

Changes v2 since v1 at [1]:
  - Make cosmetic changes as Andy suggested at [1]

Links:
  [1] https://lore.kernel.org/all/20230703094518.53755-1-mmkurbanov@sberdevices.ru/

Martin Kurbanov (2):
  spi: amlogic-spifc-a1: implement adjust_op_size()
  spi: amlogic-spifc-a1: add support for max_speed_hz

 drivers/spi/spi-amlogic-spifc-a1.c | 86 ++++++++++++++++--------------
 1 file changed, 45 insertions(+), 41 deletions(-)

--
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
