Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DD1FA3748
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2024 12:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4TUtZPXruJVLWYhElD1Ur54uLs9/9rybeSRk3x2kb68=; b=etNjr+0/xpFZWo
	mZR1mTzMB++226u/OmF5go0qLo5RO25tMbM7z6HWda2/1IhG0sinw0Jlm2X2D1O+B/kshl6R88FP3
	YX3g7nCsPF2HQrHOVBn0JNpv6O9wuAbsxT5bSY/U2VoYvxWbhYExD3A6MBNThHP+Swr1TZKedod24
	uRak5Kf5OY7CVT9BQhBBLSDb6W6Rl6FAZ/5HGtx2FnXJvc5GEcNRVQs4BT69zparGX/+enWj8dwU+
	pnJ1FVNRkNBm25iZvWR+XuYBuJRavzAe4oPqZzP0ZFxNCinhlktwIfrrsTaX3F0rT39+I11VP1eSA
	PUhj+PL/boBNGcaZFZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp5IW-0000000FsXE-2wxZ;
	Fri, 13 Sep 2024 12:21:12 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp5Bf-0000000FqxO-1Heh;
	Fri, 13 Sep 2024 12:14:10 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8C820100016;
	Fri, 13 Sep 2024 15:13:53 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8C820100016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1726229633;
	bh=zCP8OSIeGAb7u3eR0jUeoJWzHJlMuxWsql4KkrdkLS4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=PRhSUgsRPk2DTv1J3x6tfmE9H548s4Rc6418FbvGUEJkOhUegfBGuztP0GG/j9fKv
	 3vmJA8HkEJb2fa3GEQuQDzgYlV7hfynLiA95xUs4mYG4q3UmgxdEw4RdkmAiMrk2Ku
	 Wb15nQ1bXPCxZkdVmgrH9J0nz1/yXMKRUM/rM8ZL2cS6u40lMIIEsU4wDcjZqcAPNR
	 3weGhGF1TkpcUJ8i2rjv9ecLAwTGSbMwQhaS4lmyKkzL7Q/CLhur1wFRnvN17tU79s
	 WsncET3xAMXtgNf4EHU6OVrE7GjZxj+YLp2DVkkj8/B/1W9rR2oWzfZzOiLUs9GlMO
	 729H4idBpHyDQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 13 Sep 2024 15:13:53 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH v4 0/5] Add A1 Soc audio clock controller driver
Date: Fri, 13 Sep 2024 15:11:47 +0300
Message-ID: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [172.28.129.52]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187732 [Sep 13 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 34 0.3.34 8a1fac695d5606478feba790382a59668a4f0039, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/09/13 10:32:00
X-KSMG-LinksScanning: Clean, bases: 2024/09/13 10:32:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/09/13 11:43:00 #26577866
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_051407_827395_D775A02F 
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

This series adds support for audio clock and reset controllers on A1 SoC family.

Dependency: [4]

Changes v3 [3] -> v4
 - Use auxiliary reset device implemented in [4]
 - Split the driver into files
 - Use common with axg-audio yaml schema
 - Unify clock-names with axg-audio

Changes v2 [2] -> v3
 - reset:
   * added auxiliary device
 - yaml:
   * added declaration of optional clocks
   * fixed names in example and another cosmetics
 - clocks:
   * reworked naming
   * stop using of "core" clock name
   * fixed wrong parenting

Changes v1 [1] -> v2:
 - Detached from v1's series (patch 2, 3, 4, 25).
 - Reuse some of defines from axg-audio;
 - Split the controller into two memory regions.

Links:
 [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
 [2] https://lore.kernel.org/lkml/20240328010831.884487-1-jan.dakinevich@salutedevices.com/
 [3] https://lore.kernel.org/lkml/20240419125812.983409-1-jan.dakinevich@salutedevices.com/
 [4] https://lore.kernel.org/lkml/9a4377fe27d8eb940399e452b68fb5a6d678929f.camel@pengutronix.de/

Jan Dakinevich (5):
  reset: amlogic: add support for A1 SoC in auxiliary reset driver
  clk: meson: axg: share the set of audio helper macro
  dt-bindings: clock: axg-audio: document A1 SoC audio clock controller
    driver
  clk: meson: a1: add the audio clock controller driver
  arm64: dts: meson: a1: add the audio clock controller

 .../clock/amlogic,axg-audio-clkc.yaml         |   3 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  48 +++
 drivers/clk/meson/Kconfig                     |  14 +
 drivers/clk/meson/Makefile                    |   3 +
 drivers/clk/meson/a1-audio-clkc.c             | 359 ++++++++++++++++++
 drivers/clk/meson/a1-audio-drv.c              | 104 +++++
 drivers/clk/meson/a1-audio-vad-clkc.c         |  85 +++++
 drivers/clk/meson/a1-audio.h                  | 131 +++++++
 drivers/clk/meson/axg-audio.c                 | 138 +------
 drivers/clk/meson/meson-audio.h               | 143 +++++++
 drivers/reset/amlogic/reset-meson-aux.c       |   9 +
 .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++++
 .../reset/amlogic,meson-a1-audio-reset.h      |  29 ++
 13 files changed, 1051 insertions(+), 137 deletions(-)
 create mode 100644 drivers/clk/meson/a1-audio-clkc.c
 create mode 100644 drivers/clk/meson/a1-audio-drv.c
 create mode 100644 drivers/clk/meson/a1-audio-vad-clkc.c
 create mode 100644 drivers/clk/meson/a1-audio.h
 create mode 100644 drivers/clk/meson/meson-audio.h
 create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
