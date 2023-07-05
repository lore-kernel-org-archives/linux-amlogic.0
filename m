Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587C3C00528
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wVlc4oN13uT7GY7rQygbii+hm2yKvn9URwQFUbBiZ9w=; b=45AShEqRoMfOS9
	mfM+yIzk0sxN+v3kaq6Pd1IEA9nYEYLG8aExqo4oCSArIzS/diec9EUqSQsBZ2O2eegLde6sBc/CS
	IADivyUgL5wnjbVHmDemhF6A/aE2PEClvHIkfoY5YMtPztKRKpITuxoBaOadR3B70mcDtWiKi2OD1
	kEI79YK9IBBrUlMIMVDJp8lEdzlJWTpokFbbY2udI1eo66bfiX6GepQUbCAmZVjkn8v9fjaMeYfsS
	ino2TGHK3ravZAt9M8jF4jus1q9IjKcNX1Qv0Qw+JWDd2RflweIvG98PPq0Eq/gyFJjXAx50mVpC3
	cSltjgcZ1cBIDve1/a9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75c-00GjIe-2p;
	Wed, 05 Jul 2023 18:18:56 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75U-00GjCO-1V;
	Wed, 05 Jul 2023 18:18:52 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C0EBC12006D;
	Wed,  5 Jul 2023 21:18:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C0EBC12006D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688581121;
	bh=3czK2XZcVhnxWQ4LxP6D2tqOHdgOkwBZ2FrUJZvSVhU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=aCBQsMuE53VtU6GUf47xiQKpt/QInrkHBmzHeXyxvDHIG7l7o9RAAHLsimb4G4X2F
	 yJaRMB/uYZfb16RhFVAdKMLVTTJz90Gl/qUk2FC0W/FiCF8EfiXkKvUGy6hB/3g4J8
	 eedHep8Td6AythOkK5oP8ryJQqM8DkyAX/TSuWgny5lSl4Ujsiy8/arxYJ9PnWUaep
	 sgiDK2co6JrMxTplEJkBQNeHtOMYcaSsmJrRJ97jZgsTWu2AmzPJ8B9SVcLCduVLTg
	 md7smJVLIeDshrChS7XQjwEnKwahCi7efN29ry/Hu1dn/inRxtSVzzqqbKqj3CORuo
	 vikqkpMDUVWIA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 21:18:41 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 21:18:39 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>, <jirislaby@kernel.org>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <xianwei.zhao@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v2 0/7] tty: serial: meson: support ttyS devname
Date: Wed, 5 Jul 2023 21:18:26 +0300
Message-ID: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178461 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, libera.irclog.whitequark.org:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/05 16:50:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/05 16:49:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 14:57:00 #21566867
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_111849_249578_5039ABB7 
X-CRM114-Status: GOOD (  13.65  )
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

During a IRC discussion with Neil, as reported in reference [1], an idea
emerged to provide support for a standard devname 'ttyS' in new SoCs
such as A1, S4, T7, C3 and others. The current devname 'ttyAML' is not
widely known and has caused several issues with both low and high-level
software, without any apparent justification for its implementation.
Consequently, it has been deemed necessary to introduce the 'ttyS'
devname for all new 'compatible' entries, while still retaining backward
compatibility with the old 'ttyAML' devname by supporting it in parallel
with the new approach. This patch series therefore aims to implement
these changes.

Changes v2 since v1 at [2]:
    - as suggested by Conor, relocate modifications with the new
      uart_data structures of S4 and A1 SoC from the main meson_uart
      patchset to a separate patchsets
    - ensure that the uart_driver is not unregistered if there is at
      least one active port
    - per Neil's suggestion declare separate uart_driver and console
      objects for both tty devnames (ttyAML and ttyS) to enable the use
      of multiple uart objects with different compatibility strings

Links:
    [1]: https://libera.irclog.whitequark.org/linux-amlogic/2023-07-03
    [2]: https://lore.kernel.org/linux-amlogic/20230704135936.14697-1-ddrokosov@sberdevices.ru/

Dmitry Rokosov (7):
  tty: serial: meson: use dev_err_probe
  tty: serial: meson: redesign the module to platform_driver
  tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs
  tty: serial: meson: introduce separate uart_data for S4 SoC family
  tty: serial: meson: add independent uart_data for A1 SoC family
  dt-bindings: serial: amlogic,meson-uart: support Amlogic A1
  arm64: dts: meson: a1: change uart compatible string

 .../bindings/serial/amlogic,meson-uart.yaml   |   2 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   4 +-
 drivers/tty/serial/meson_uart.c               | 145 ++++++++++--------
 3 files changed, 88 insertions(+), 63 deletions(-)

-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
