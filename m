Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FFECD11DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ouMgcz0CwEC/b5pWuenk5zcxfiAsrhhwk7npgOhbBa8=; b=occHAwFq7e7oiA
	0jUkOfg1DKQelwgyGPB2fsBYBSxD6qt11BgHnhf8azx3mNIZuFCvHy0iiYfgSg9bRm/GC4f99cB8f
	HL2SMsnMGBzikiH52Fulty0Z03LNCDzHtDZIzgdoyYLNqr6rTlasgbAd4ZCaz4UL+t4GqKfNfmCyL
	b2I/8o57r5ZCyi+O+qwDfoGZ929xxGROED2aRcHQ30GWXzzkpC7fO7+vjyxsNPvgpR++yaHWHLhHX
	F3KkUezJCDefPVKICBMWY/CfT2AvijzVyPLKbq+CUSdHjW3IdcNpDDFtzMeoCc/CgnkwpC7tDq5ZQ
	tVmfGuxGu33wKmFaUVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpeHP-0000000Bt2D-1q5y;
	Thu, 28 Mar 2024 01:10:07 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpeHL-0000000Bsv6-347E;
	Thu, 28 Mar 2024 01:10:05 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A0F2A100013;
	Thu, 28 Mar 2024 04:09:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A0F2A100013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711588191;
	bh=37MYTDLUrT8ifUqapj/v8ztNZZHrBVw96rI4MOrEYP0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=IEbJU/cDongNfeDDtxTWgEwcSxg/PpC3ocspry+5WSWr7YXAD4N2MxsPMQRVfs28U
	 dnjWavBnGcH5NIl/hfJ997j0tGaAYUEkYs8HblBvrheS4ULPTpkPcoxnNBmJr04fLE
	 gdqihwocvPf4crgYZC74fn/qwgx3J5XZ+RNJ2d8ifbBxMg0PFwnpB1AA+z/1SvCjJb
	 oTDo++uaRaZ3R7PRV3ZUvZ6VxKDBHUJjXHwpXUhBJaCCb8LpQsBJiylRQMyKDyByys
	 wEMLzLi1RGv7eWzQqzX7nDQz4c2W38cyJ6/lDHueKlNIV2T8K8YvrpC1VbeYyiRQNk
	 tkITtssp3+2DA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 04:09:51 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 04:09:46 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH v2 0/5] Add A1 Soc audio clock controller driver
Date: Thu, 28 Mar 2024 04:08:26 +0300
Message-ID: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184457 [Mar 27 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 13 0.3.13 9d58e50253d512f89cb08f71c87c671a2d0a1bca, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/03/27 23:57:00
X-KSMG-LinksScanning: Clean, bases: 2024/03/28 01:00:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 00:06:00 #24481831
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_181004_212370_7329CEE5 
X-CRM114-Status: GOOD (  12.97  )
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

Links:

 [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/

Changes v1 -> v2:
 - Detached from v1's series (patch 2, 3, 4, 25).
 - Reuse some of defines from axg-audio;
 - Split the controller into two memory regions.

Jan Dakinevich (5):
  clk: meson: axg: move reset controller's code to separate module
  clk: meson: axg: share the audio helper macro
  dt-bindings: clock: meson: document A1 SoC audio clock controller
    driver
  clk: meson: a1: add the audio clock controller driver
  arm64: dts: meson: a1: add the audio clock controller

 .../bindings/clock/amlogic,a1-audio-clkc.yaml | 141 ++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  48 ++
 drivers/clk/meson/Kconfig                     |  18 +
 drivers/clk/meson/Makefile                    |   2 +
 drivers/clk/meson/a1-audio.c                  | 624 ++++++++++++++++++
 drivers/clk/meson/a1-audio.h                  |  45 ++
 drivers/clk/meson/axg-audio.c                 | 233 +------
 drivers/clk/meson/meson-audio-rstc.c          | 109 +++
 drivers/clk/meson/meson-audio-rstc.h          |  12 +
 drivers/clk/meson/meson-audio.h               | 143 ++++
 .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++
 .../reset/amlogic,meson-a1-audio-reset.h      |  29 +
 12 files changed, 1297 insertions(+), 229 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
 create mode 100644 drivers/clk/meson/a1-audio.c
 create mode 100644 drivers/clk/meson/a1-audio.h
 create mode 100644 drivers/clk/meson/meson-audio-rstc.c
 create mode 100644 drivers/clk/meson/meson-audio-rstc.h
 create mode 100644 drivers/clk/meson/meson-audio.h
 create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
