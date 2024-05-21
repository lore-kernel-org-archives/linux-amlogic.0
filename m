Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31417C25B74
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 22:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sHN47L1NF8ALMBvNE2XIHofh6Srn2ST7o0bnLAJarl8=; b=vf8Y2kWYCmH+FT
	e0SHA/5ivYfFMbHlQGjBZ7ZNYgqnQ/vwm2SIdcA0Eehcqt0deYgU8iCuVMtSQVTyPx+1d7OZFxvly
	4RgfKOPFz6a6e13qpCdFWHhkvN5Ymfm79hP7BnBp+13iUf7Fh6Q508NkPnp0c6UIipRv2+8+hnVUN
	68KO5bg0GLg8qZC70kMNHvIS1OfHaFIQxSMicnyLx4gMy/CaNn9pWhe5UR/cZj/1vHHeCMlTy5mZn
	r7VFpCnMu1WGfwDb9YAz2P9MqpDrgJ7iwYXlWbRIMu9iKXxZaWZpEptfzfq8F4pPsbgj+OKSNF7jv
	isHPQv5ntd7dHBl0e7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Xt6-00000001F86-1Y9H;
	Tue, 21 May 2024 22:23:16 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Xt1-00000001F4A-1XNG;
	Tue, 21 May 2024 22:23:15 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B98B1100013;
	Wed, 22 May 2024 01:23:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B98B1100013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1716330183;
	bh=CZg76scw7v97dA0RfUhhSpMZL+RjQmhtnVdo0IGU76s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=azYnNpfppiSYmIT828TB71EKKKOpRNG//yHacsHcbgs4+t4RXrVevSBAPpzyYPOC0
	 HcQArDScq+RvxC+Tr/db5qO56fQSilYqkT9s7n6Gp1Zt1ZundkxvFHsR5qcsNLPlIl
	 7ENARXbh6mlDzEJaIsPP6rO60LNgsrvwfnx2qzSMHdqJnHxEKd/Fi5ZqwDm5upqFuM
	 M+7QVo+dNIHPiC5YTE4u6YO5R/V3+oYNphQCo7c8AKWIoG2FkPn7JBbSuQKRYlfzxw
	 yltDNktVf81Gdtuf65FnkryDPsuA2qN4P2C6RaUIQXgnzqkKCQ/egH0YUx5VC/w9Un
	 fuyxWrY4HSHvg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 22 May 2024 01:23:03 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 May 2024 01:23:03 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>, Jerome Brunet <jbrunet@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Lucas Tanure <tanure@linux.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>
Subject: [PATCH 0/3] Introduce initial support of Amlogic AC200 board
Date: Wed, 22 May 2024 01:21:52 +0300
Message-ID: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185400 [May 21 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_smtp_not_equal_from}, sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/21 08:41:00 #25230763
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_152313_044933_913B4992 
X-CRM114-Status: UNSURE (   9.63  )
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

 - Make some cosmetics in existing device tree files;

 - Add the board.

Jan Dakinevich (3):
  arch/arm64: dts: ac2xx: make common the sound card
  dt-bindings: arm: amlogic: document AC200 support
  arch/arm64: dts: ac200: introduce initial support of the board

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 .../dts/amlogic/meson-sm1-a95xf3-air-gbit.dts | 87 -------------------
 .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts | 87 -------------------
 .../boot/dts/amlogic/meson-sm1-ac200.dts      | 22 +++++
 .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     | 87 +++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-h96-max.dts    | 87 -------------------
 .../dts/amlogic/meson-sm1-x96-air-gbit.dts    | 87 -------------------
 .../boot/dts/amlogic/meson-sm1-x96-air.dts    | 87 -------------------
 8 files changed, 110 insertions(+), 435 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
