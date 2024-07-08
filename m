Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8605CC3271E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jul 2024 19:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=klsZNkQH8OJXqdTG229OynHyAZyRFn+sEA4qu89P/AQ=; b=bJLVOeoXKS/4Mz
	Mk/dgqpan52ThqBNiG8h1rY6ZgYK57vx20bV09c9nYBIPmprQQwtVqpLWGMeiRNyGQtseIG6R+TCt
	weLnbc3fHHZFiP7u5pAmYls8D8rHlDkgcSiwT0xybWEsG7ktr1X/emdn+SD+mkEC7+bH2bUtoO03C
	InT+Ptcf72ZvIHrIOO49NMZDWXIh6y8z0JDiorEtQPQbQ12PIwQLJkys8YlRNdlZQG0AfcvftfA3+
	LWIzqqU23yU4jzK4y/vXsnslgDbLTdHcFoutlOFgj6KYz7cB6XgdxejKgY/G6SzUy/9qYwUZ0Y6mc
	+KrAEBM5JtVt+6WSNJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuLY-00000004sPo-19Ua;
	Mon, 08 Jul 2024 19:48:24 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuLU-00000004sNX-2D8U;
	Mon, 08 Jul 2024 19:48:23 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 054BE120005;
	Mon,  8 Jul 2024 22:48:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 054BE120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720468096;
	bh=b6lWsM0Po6dUCUZmlJfrJE/GhXqZ9octg7GqBGyGm3M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=LbZNkTBpkHeqONTCklpSMKnFlKM+Pzn1G27nbN9Q81h21xTOv6+KL+KJ+zGanNKOd
	 f+8p7a8QPJpt6sLVZNWDpge6amOYqdiW6QKH3xi417EWZNj9ik4lTExc9v6jgD+lRa
	 lZi/tpvwuV148JVHQ+f6SiduZXBeuPgX9ylk5iavrEeB+A368ZKWH+vDwEdKG6Hkmp
	 tl0rz43QGnbacN1Ko3VAY9aUPz5jzFDYUo+EGjcSPGzvEmw11fRc+fvRKUn6CznzVG
	 bqdfXvA1dk1si5YT/rssT6qieTr/XnPTejTdLS9R2y1fEx+NVUeX0v/o0JH/SjUy+6
	 ODLRR//vZdXAQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Jul 2024 22:48:15 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Jul 2024 22:48:15 +0300
From: George Stark <gnstark@salutedevices.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>,
	<broonie@kernel.org>, <glaroque@baylibre.com>, <rafael@kernel.org>,
	<daniel.lezcano@linaro.org>, <rui.zhang@intel.com>, <lukasz.luba@arm.com>,
	<b.galvani@gmail.com>, <mmkurbanov@sberdevices.ru>
CC: <linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH 0/4] amlogic SoC's power-domains fixes
Date: Mon, 8 Jul 2024 22:48:04 +0300
Message-ID: <20240708194808.1819185-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186376 [Jul 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 23 0.3.23 8881c50ebb08f9085352475be251cf18bb0fcfdd, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/08 16:01:00 #25918429
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_124821_274332_CF2C2D8A 
X-CRM114-Status: UNSURE (   8.84  )
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

Here's some fixes to the bindings and device tree related to Amlogic A1 SoC.
The SoC provides dedicated power domain for for almost all periphery.

George Stark (4):
  dt-bindings: spi: amlogic,a1-spifc: make power-domains required
  dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
  dt-bindings: thermal: amlogic,thermal: add power-domains
  arm64: dts: meson: a1: bind power domain to temperature sensor

 .../bindings/i2c/amlogic,meson6-i2c.yaml           |  3 +++
 .../devicetree/bindings/spi/amlogic,a1-spifc.yaml  |  4 ++++
 .../bindings/thermal/amlogic,thermal.yaml          | 14 ++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  1 +
 4 files changed, 22 insertions(+)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
