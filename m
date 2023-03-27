Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC8C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 21:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GHjOxzn7qrqom+cIkrck9Hpiu2ULo47NGfMevUv3bog=; b=GjpZoFcweuIfw/
	UvuBJXOMW9LMo6G0aDHMIvxQXdngmuORE5B4JmhVh98Cuwxg1dz/ua1acBNcqW2TIGjGDuaeG0yQQ
	3Y3nRYcwxo+4LAtJ0qaH3dOjt+vRPNT+0CguHKT3xlpk4N/+a77y2cYAg5Yuf1B7PvczFzO6ZdJdD
	WEL28l46ASqkZuVJe/8mc6C1K0HW1n3b5XcKEp74NjxLADMOTi4MkcwkdjhNRXMOlHa9vHjfY38pS
	9UqtC1Rk9iZPET912F6rgRUX6IiMQga6O2V0LeTU9B/yJ39Ap7kcUzPuoBAOPSD5ZFd5eIZyUsmuP
	Biwpq8Zk9ehIXivGZG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pguB2-00CO57-2o;
	Mon, 27 Mar 2023 21:14:52 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pguAz-00CO1R-2e;
	Mon, 27 Mar 2023 21:14:51 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 010175FD07;
	Tue, 28 Mar 2023 00:14:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679951677;
	bh=9ycbOjNYWPGPuemVUaFLexVP6yqoiw6Ms1b3Do67mQ0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XkFSNLxAWgQqGYBJ7Mu52Y2xhMANMpt/ZCoW6X3J2mfoB2wcx/Ij1ZSvdo/tXOKcA
	 zZtEmisEr2qhIkNyTYLPtmuKuZ4Fxj3Q/YQoacdFu7Y1cj0EIv+GTef92M+0590/N6
	 Wlyjj9VKd2L4144Qiwi8KoGw4KJaaGoUp2BI+2YqO1XEynS6goKuMhRec3bF/u3GRt
	 EgiRywFDIHpLLbsaKtuhXrFvaBHH6NuLteYAKlhLOHHLKfylFBNb8IwXzt2GNkAcvA
	 bCeGR683yVEEu5PDpW93b6aYB0iwMPY/CMAzqchLd9nuCEeOr18GNWkhFbtUXM5Mji
	 9ROO5beEKSl2Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 28 Mar 2023 00:14:36 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>, Martin Kurbanov
	<mmkurbanov@sberdevices.ru>
Subject: [PATCH v2 0/2] add support for Meson A1 SPI Flash Controller
Date: Tue, 28 Mar 2023 00:13:49 +0300
Message-ID: <20230327211351.686831-1-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/27 19:06:00 #21018749
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_141450_038865_928F5B94 
X-CRM114-Status: GOOD (  11.20  )
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

This patchset introduces DT bindings and driver for the Amlogic Meson A1
SPI flash controller (A113L SoC).

The existing spi-meson-spifc driver is incompatible with the A1 SPIFC
at all.

The implementation has been tested on the Amlogic A113L SoC based device
connected with ESMT F50L1G41LB spinand flash.

This patchset has dependencies on the A1 clock series which is still
under review [1].

Changelog:
  v2 since v1 at [2]:
    - Make cosmetic changes

Links:
  [1] https://lore.kernel.org/all/20230321193014.26349-1-ddrokosov@sberdevices.ru/
  [2] https://lore.kernel.org/all/20230322150458.783901-1-mmkurbanov@sberdevices.ru/

Martin Kurbanov (2):
  dt-bindings: spi: add Amlogic Meson A1 SPI controller
  spi: add support for Meson A1 SPI Flash Controller

 .../bindings/spi/amlogic,meson-a1-spifc.yaml  |  42 ++
 drivers/spi/Kconfig                           |   7 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-meson-spifc-a1.c              | 453 ++++++++++++++++++
 4 files changed, 503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
 create mode 100644 drivers/spi/spi-meson-spifc-a1.c

--
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
