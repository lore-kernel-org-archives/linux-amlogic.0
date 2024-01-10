Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFD3C47258
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jan 2024 20:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2UIU8jW3nsip0oar2mAafDQ0ycSNUnOvPbT6PRcdttY=; b=T+9/JYBKEQ7CjM
	iq1/iWoX9VdjZ4g355gyZRZVHPSIfUGvo7lZfAOtNSH2hGmYxJasCWQpsrOMN8xTul6A/aHGDZxx+
	ALW+Nvs7HkdGQx/tfdx2exYYPF5+LIOAxoFxSenmqkkVIjS8QhxbNTGWGnL/pkuDRRXoSx4KJUdEH
	hncbF+am7HaTxsHgZbpMaI6Tq0Ot+BhtD5G6APgNoJIhXL5FAEnZBA4QQzn49qLSXxOnClQMywngL
	e/kM5Oe/5sdK5hpHx9pWnEFELBEoYFn9OdApt82vj61OCusbE6lNYeDBBFh+Q9MnOvJNZaAShRtuQ
	IVQkLQ7st/dN2qdYYMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNewH-00DsZh-2b;
	Wed, 10 Jan 2024 20:12:37 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNewD-00DsUe-1g;
	Wed, 10 Jan 2024 20:12:36 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C4787120005;
	Wed, 10 Jan 2024 23:12:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C4787120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1704917544;
	bh=tQOLNDPALbZxSNiRcS2Pal6rjPLgkScztVD9MdzJmCc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=QL4yN/Ia+nZze44oEFWPXMJlcJ6vkYuSthIXmBOrPbRRA4Ov2ODl0nUWt5QuUMvhr
	 dpCI6fq0d47KLiIkHPyw2bozA+fll+kLdRFUD0WsoR+fctmJhPLatVrTnxGt3X5ut+
	 05+4d9D+4SBRuyoCQM3QYeLFx/9JF9yEAqgOg2NrsV78+N6xbGkVsQpXrrgb9X5Fi2
	 J+B2bW69nGJv4Wwacqf583/jQ0/cqOA5S51yJCrhJVkSHewZTiYum/TKPLrnihzUlW
	 hZCW0bkIm1bBSwqrQo3ajLzQYBg0PYMovYP0IWkaUkIR6QhUhEgSDRv/bPSzGHBLZP
	 9fxm/V8t6OzPw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 10 Jan 2024 23:12:24 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 23:12:24 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <narmstrong@baylibre.com>, <neil.armstrong@linaro.org>,
	<clabbe@baylibre.com>, <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<artin.blumenstingl@googlemail.com>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v1 00/24] Support more Amlogic SoC families in crypto driver
Date: Wed, 10 Jan 2024 23:11:16 +0300
Message-ID: <20240110201216.18016-1-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182544 [Jan 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/01/10 17:01:00 #23071477
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_121234_254715_7A39B446 
X-CRM114-Status: GOOD (  10.55  )
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

Hello!

This patchset expand the funcionality of the Amlogic
crypto driver by adding support for more SoC families: 
AXG, G12A, G12B, SM1, A1, S4.

Also specify and enable crypto node in device tree
for reference Amlogic devices.

Tested on AXG, G12A/B, SM1, A1 and S4 devices via
custom tests and trcypt module.

Alexey Romanov (17):
  drivers: crypto: meson: don't hardcode IRQ count
  drivers: crypto: meson: make CLK controller optional
  drviers: crypto: meson: add platform data
  drivers: crypto: meson: add MMIO helpers
  drivers: crypto: meson: move get_engine_number()
  drivers: crypto: meson: use fallback for 192-bit keys
  drivers: crypto: meson: add support for G12-series
  drivers: crypto: meson: add support for AXG-series
  dt-bindings: crypto: meson: add new compatibles
  arch: arm64: dts: meson: a1: add crypto node
  arch: arm64: dts: meson: s4: add crypto node
  arch: arm64: dts: meson: g12: add crypto node
  arch: arm64: dts: meson: axg: add crypto node
  arch: arm64: dts: meson: s4-s805x2-aq222: enable crypto node
  arch: arm64: dts: meson: a1-ad401: enable crypto node
  arch: arm64: dts: meson: axg-s400: enable crypto node
  arch: arm64: dts: meson: g12a-u200: enable crypto node

Jan Dakinevich (7):
  drivers: crypto: meson: drop status field from meson_flow
  drivers: crypto: meson: move algs definition and cipher API to
    cipher.c
  drivers: crypto: meson: cleanup defines
  drivers: crypto: meson: process more than MAXDESCS descriptors
  drivers: crypto: meson: avoid kzalloc in engine thread
  drivers: crypto: meson: introduce hasher
  drivers: crypto: meson: add support for AES-CTR

 .../bindings/crypto/amlogic,gxl-crypto.yaml   |   2 +
 .../arm64/boot/dts/amlogic/meson-a1-ad401.dts |   4 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   8 +
 .../arm64/boot/dts/amlogic/meson-axg-s400.dts |   4 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
 .../boot/dts/amlogic/meson-g12a-u200.dts      |   4 +
 .../dts/amlogic/meson-s4-s805x2-aq222.dts     |   4 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   7 +
 drivers/crypto/amlogic/Makefile               |   2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 591 ++++++++++++------
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 260 ++++----
 drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 448 +++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 116 +++-
 14 files changed, 1135 insertions(+), 329 deletions(-)
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c

-- 
2.30.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
