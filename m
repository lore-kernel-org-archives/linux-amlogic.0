Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC83C04FFE
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Apr 2024 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Bo6oUemttL8wPfzCoCTh6+SJje596YwrIQZ8AFUTKM=; b=GlT2LCxQKkOfj0
	3lEK4ky1Kj7lwnzgBiUnCHnyvmro2xQBw7yHmZH7/DPk0W8CDoAcg+f12rFp17mTVu9x+DT3BiCh1
	maZTmjZqFYYJPrWHCKpJYUKxBo/zgUhEWIA/DLSioDrxPQU6nke8QYdCQRs0+Xn6Cu7reMs149/Jy
	OXPVhhveGGI7V7ns0ZM9bFTQ4O46wfDmidXWaRRuAqc49nxqwzTprik7SZjfT2A0Ofpz2u4C9bPG3
	vVmYqxBJcRC2n/nks+xQy3dEWdhZol/vVIZw+jKXwuFHjmoAyglA9EsuQZBkOf1V/QU1MBlIZpm5V
	Y4CKWVm19U3f8nuXveZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnrC-00000005gCQ-0eEK;
	Fri, 19 Apr 2024 13:00:46 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnr6-00000005g6I-2ylo;
	Fri, 19 Apr 2024 13:00:44 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DF042100007;
	Fri, 19 Apr 2024 16:00:26 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DF042100007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713531626;
	bh=wKFbGy5kXF6YmVtQApc9Loyay81pnuGNBjJQMyo1XHY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=JTk3EAzoeVCi0LAVhcBtRyaZ5iOqwv+J8I0jB2MdXcy47F5vYDm71XyOhTbhTbBGA
	 5HUXxV8cEAb+JkcncVQZkOVLVWVD89NrNNP/etjFUTN+0ScoY1rkmzA2Rf/I3n+PZu
	 XZWLPYNLuSScVsEX3ugY7ZYa6inHZvODmGW1rikza8alooapkWEXHbA0RSn2kyWBda
	 J+UnNddlNmjQlvRKcdL4iEbyTsuDoqWw6BCVV8UE2MyeTwWyjQaqb7E4MxLsGLRnPi
	 IieTMCcXrapmWJyYAR3xbxQ0eQefy3aTOf2kXlT7nI2fBrLqqd0Imp9JnWho6rFxrq
	 ByOzpbBrrv1DQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 19 Apr 2024 16:00:26 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 19 Apr 2024 16:00:26 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH v3 0/6] Add A1 Soc audio clock controller driver
Date: Fri, 19 Apr 2024 15:58:06 +0300
Message-ID: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184806 [Apr 19 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;lore.kernel.org:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/19 12:19:00
X-KSMG-LinksScanning: Clean, bases: 2024/04/19 12:19:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/18 23:49:00 #24865988
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_060041_438104_F912B38C 
X-CRM114-Status: GOOD (  13.25  )
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

Changes v2 -> v3
 - reset:
   * added auxiliary device
 - yaml:
   * added declaration of optional clocks
   * fixed names in example and another cosmetics
 - clocks:
   * reworked naming
   * stop using of "core" clock name
   * fixed wrong parenting

Changes v1 -> v2:
 - Detached from v1's series (patch 2, 3, 4, 25).
 - Reuse some of defines from axg-audio;
 - Split the controller into two memory regions.

Links:
 [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
 [2] https://lore.kernel.org/lkml/20240328010831.884487-1-jan.dakinevich@salutedevices.com/

Jan Dakinevich (6):
  reset: reset-meson-audio: introduce separate driver
  clk: meson: axg: share the set of audio helper macro
  clk: meson: axg: introduce AUD_MUX_TABLE() helper macro
  dt-bindings: clock: meson: document A1 SoC audio clock controller
    driver
  clk: meson: a1: add the audio clock controller driver
  arm64: dts: meson: a1: add the audio clock controller

 .../bindings/clock/amlogic,a1-audio-clkc.yaml | 124 ++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  46 ++
 drivers/clk/meson/Kconfig                     |  16 +
 drivers/clk/meson/Makefile                    |   1 +
 drivers/clk/meson/a1-audio.c                  | 651 ++++++++++++++++++
 drivers/clk/meson/axg-audio.c                 | 244 +------
 drivers/clk/meson/meson-audio.h               | 149 ++++
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-meson-audio.c             | 207 ++++++
 .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++
 .../reset/amlogic,meson-a1-audio-reset.h      |  29 +
 include/soc/amlogic/meson-audio-reset.h       |  10 +
 13 files changed, 1371 insertions(+), 236 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
 create mode 100644 drivers/clk/meson/a1-audio.c
 create mode 100644 drivers/clk/meson/meson-audio.h
 create mode 100644 drivers/reset/reset-meson-audio.c
 create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
 create mode 100644 include/soc/amlogic/meson-audio-reset.h

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
