Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B652C28B2E
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Mar 2025 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cxGZw4ullZIaaikVDi5eBJdqgRmUE/jkrhqNxNJoWJ0=; b=XZVhe67RWgzkK6
	0GRKoXL0YqVC4AwQYT4m1sK/uDVounmkgvF6LDGyLZ4GmCChYDTGwFcTztPB9xhsLdINk0d/F9nQB
	joW5fc8wNlz2xeInGcoTZi6kkBhSsBbtem6Cg4aRbMszUUIRAkSGO07K6IK2FeRVNO6uP5a4INuwn
	Hnj3d6XZOkwzZcEZrL06FNauN9fS00GmHM7dF5KAyKfJlMb32d04xaqhrEu6c+ZVgRsczdPLz+I2b
	dJtJSXq4XJMMpUTz8323A2QrtHGJ+eJJimcv7ZPXWEZSPWYakMP2raf/L9HXFN3Jxi8j2gwF8Ro5c
	M5bRlbSWLGp6zY9xqGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLeH-00000000zrl-3mvV;
	Sun, 09 Mar 2025 18:45:17 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLHL-00000000xS0-1afT;
	Sun, 09 Mar 2025 18:21:37 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 339EF120004;
	Sun,  9 Mar 2025 21:21:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 339EF120004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544493;
	bh=UaZ3IToX9EA+ySS8nZsHr/BQXxlEJ2EpDl6spCpL+vU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=SOfwJ9nab/bugC5lDc9TBWTLoiiPW0Gu9YGQKAe7ayiKy5fq39HtptsEpfF/c8Yy9
	 emtZrG3OpVOAtnRe6sVlC5KAaAfo8TufqmRNCxu9je9Tgr265iU9HsC54aRfP4s3G2
	 9R/+m9qY/gnmu2SL1wGDjEoqCs2sUnNR4hg6KErB96hLl7H4VpSv3Wtz/xgIelY8gT
	 0d4X+gRdDdLfXP+IHxyuujghl3F1qk5XKCFQt9GWgS5+1B5666ZDQwdbP0uazRo0h9
	 ZWzZIZYSE4XbB80hKhxhlqvLyUcGbWzx0emzvofYANhkJqs+M3Dji0a7dxfIMUeyfj
	 K5GCwcXkkE9vQ==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:21:33 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh@kernel.org>
Subject: [PATCH v2 0/6] Enable audio on Amlogic A1 SoC family
Date: Sun, 9 Mar 2025 21:21:21 +0300
Message-ID: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [172.28.64.252]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 191599 [Mar 09 2025]
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2025/03/09 17:18:00
X-KSMG-LinksScanning: Clean, bases: 2025/03/09 17:18:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 17:28:00 #27692143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_112135_809311_EF76C048 
X-CRM114-Status: GOOD (  10.99  )
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

This series brings up the audio on Amlogic A1 SoC family and on Amlogic AD402
reference board.

Depends on [2][3][4]

Changes v1 [1] -> v2
 - detached from v1's series (patches 16, 17, 18, 19, 20, 21, 23, 24, 25)
 - use new names from updated clock controller
 - don't use A1-specific compatibe for pure software components
 - don't use link-name property

Links:
 [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
 [2] https://lore.kernel.org/all/20250309180940.1322531-1-jan.dakinevich@salutedevices.com/
 [3] https://lore.kernel.org/all/20250309181600.1322701-1-jan.dakinevich@salutedevices.com/
 [4] https://lore.kernel.org/all/20250309181630.1322745-1-jan.dakinevich@salutedevices.com/

Jan Dakinevich (6):
  ASoC: dt-bindings: meson: meson-axg-audio-arb: claim support of A1 SoC
    family
  ASoC: dt-bindings: meson: axg-fifo: claim support of A1 SoC family
  ASoC: dt-bindings: meson: axg-pdm: claim support of A1 SoC family
  ASoC: dt-bindings: meson: axg-tdm-formatters: claim support of A1 SoC
    family
  arm64: dts: meson: a1: add audio devices
  arm64: dts: ad402: enable audio

 .../reset/amlogic,meson-axg-audio-arb.yaml    |  10 +-
 .../bindings/sound/amlogic,axg-fifo.yaml      |   8 +
 .../bindings/sound/amlogic,axg-pdm.yaml       |   1 +
 .../sound/amlogic,axg-tdm-formatters.yaml     |  22 +-
 .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 110 +++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 443 ++++++++++++++++++
 6 files changed, 583 insertions(+), 11 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
