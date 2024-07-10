Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E13C3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 22:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x16GnYXCQnbdT8dh/un0X3c7ZonkxYHODDz7lKfkuP8=; b=kgb+C5Yuis8HPY
	CuPjSGc5lXqjx9HzCwZtu3vccia0oaNr9v7vuAEFHiCQIjv3m+OQvBv4aTBPLaChX127h3YgqESih
	aNiUUm38quzDVPJ1YLugUeqre3RUPSIgAeHOMtfJ1dKCprtthQtqfGyBianeC+D8wu8+8+gBU5Bcy
	EQgr5zlNU8YgNK4mrXmNJPJFg0IOyBxT9YM4f7J89vFAmcxV14MR8yH1DS2HxBOnbDZGEUZ9L16Wy
	QGVroexRbboWxQRIm1mDHpDftqO27EXnSh60gyuE6shx7fNTxYdUt7/C32oD+5NjsWf5TZbgDlJhD
	Z8OG7R5VYz0/2KAnML5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfrw-0000000Bx7h-2lAe;
	Wed, 10 Jul 2024 22:33:00 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfrO-0000000Bwup-3pLQ;
	Wed, 10 Jul 2024 22:32:30 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0E38112000A;
	Thu, 11 Jul 2024 01:32:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0E38112000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720650742;
	bh=E8DoSITQiDGN2N6qCBfzM0o7rwHBN1Xbeo15NIHbPi4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=QsCMnKEagy+34hleDizogv35nVc74VaknBbAwL7Hv1z3wfhr4ZNfuTdv81QlLpMC1
	 tuwfsDwOMlMNUNqa40Wg1G1XSeLLv/LjdnMrSgBodQKxxqVblGS1u768LtExunw6tP
	 hykQi/6b3Q2EXWe7gDa3rVH+hq+S4Xz47BwU19psvUgR0MFawva6AKmFbTwIwoBKDZ
	 vshnoh2hXgtXtRjyON2/II+RayMCYgbc/6gdVFujxe2YVxKLeGgf7FgJOBA9EP7AMV
	 S3ekG9S+yaeNdEacAVqq7qBoC68wgDHwZiCPTs3/YNzbrtDNW7C3SMKx5l+mhPJhiK
	 DTly0hW6KOQhw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 11 Jul 2024 01:32:21 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jul 2024 01:32:21 +0300
From: George Stark <gnstark@salutedevices.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<glaroque@baylibre.com>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
	<rui.zhang@intel.com>, <lukasz.luba@arm.com>, <b.galvani@gmail.com>,
	<mmkurbanov@sberdevices.ru>
CC: <linux-i2c@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v2 0/3] amlogic SoC's power-domains fixes
Date: Thu, 11 Jul 2024 01:32:11 +0300
Message-ID: <20240710223214.2348418-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186446 [Jul 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/10 21:30:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/10 21:30:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/10 21:42:00 #25942395
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_153227_653654_9B1E1EEA 
X-CRM114-Status: UNSURE (   9.72  )
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

Changes in v2:
  dt-bindings: spi: amlogic,a1-spifc: make power-domains required
    - drop the patch
  dt-bindings: thermal: amlogic,thermal: add optional power-domains
    - drop required conditional
    - rewrite commit message
  dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
    - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
    - add RvB: Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
  arm64: dts: meson: a1: bind power domain to temperature sensor
    - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
  previous version [1]

[1] https://lore.kernel.org/lkml/20240708194808.1819185-3-gnstark@salutedevices.com/T/#m398c283b369108c5c557e68b7a1ada9abf3e5cba

George Stark (3):
  dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
  dt-bindings: thermal: amlogic,thermal: add optional power-domains
  arm64: dts: meson: a1: bind power domain to temperature sensor

 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml  | 3 +++
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 3 +++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi                      | 1 +
 3 files changed, 7 insertions(+)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
