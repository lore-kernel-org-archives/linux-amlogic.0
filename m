Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550AEC761A6
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ITEI19/HvuAU2u8KcMVnoX76QQYChTuPpmCrn6JuIEE=; b=dkSTtDppUi7eK/
	TcfAWm8SEWLwrvx29NRaEt8lVDcdLqkfCu/R/eU4/tXTCx9BG+CrCyZa9xG5/GIicD2m8e+Le28Zu
	U5bZViUYe+6jUvTVgh1utabeqxElfw1+MveAowCnIm+cruHCXEuWx+rtxWgSqd+OkGF/TAa3U/tp+
	1fE0JbmD8AlgLxqJF4bCPB6GAlesZzbcfSbvBdR+lxuJ9rAU0I9A/kl3y6mW/dYdvY9MwjuM7vVAl
	vcGSmV7ry31EKYis0yocPJhNYOFjD2NlBXzIlD9WtEVAS5K36QOVOOmfPhFeO9cYJadKJRIUWiYGa
	l4kXIyusZ0oYcX9w7QeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOyw-00GDrR-2Q;
	Mon, 03 Apr 2023 18:32:42 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOys-00GDo1-32;
	Mon, 03 Apr 2023 18:32:41 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 9EFA35FD33;
	Mon,  3 Apr 2023 21:32:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680546751;
	bh=skrvDahl5pDvwUwgatlspWiBA9wa5+vS0uE3UumKX9A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cqI6aPrNn5mtnhaVCbAtirVNzjeBzR1SEKqrbWHxEFvqNdiy5uS2bl+mGyCMo1kpC
	 qbic7dxZuXwZvNtjHjr7xmZAUB1qWUesntKZoLItRDdwnsx8qyGc6JQnEzxrRXX8ye
	 VJsYZWa6yQSM/eg+SuIgdfOESl0RFqLAJhcVVlfS3czuZp/rK51VZOwy9oi8fMOuvW
	 AnjaCxGZECwoCgwAkevP0F+K6F+Cc+ZoEOi5pdxOpMyUwF1ckHsop5lafBMhOPPCkQ
	 kng+5hNd3d/IJ7GR/VDPXokSM4AlD75/wqXsaZJb9QGfDMYOfKiPLBkHsxLXaUpNej
	 OUCtHv7kdPsag==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  3 Apr 2023 21:32:30 +0300 (MSK)
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
Subject: [PATCH v3 0/2] add support for Amlogic A1 SPI Flash Controller
Date: Mon, 3 Apr 2023 21:32:15 +0300
Message-ID: <20230403183217.13280-1-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/03 14:17:00 #21028104
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_113239_519488_811B885D 
X-CRM114-Status: GOOD (  11.28  )
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

This patchset introduces DT bindings and driver for the Amlogic A1 SPI
flash controller (A113L SoC).

The existing spi-meson-spifc driver is incompatible with the A1 SPIFC
at all.

The implementation has been tested on the Amlogic A113L SoC based device
connected with ESMT F50L1G41LB spinand flash.

This patchset has dependencies on the A1 clock series which is still
under review [1].

Changelog:
  v3 since v2 at [2]:
    - Drop the 'meson' name as Neil suggested
    - Make cosmetic changes

  v2 since v1 at [3]:
    - Make cosmetic changes

Links:
  [1] https://lore.kernel.org/all/20230321193014.26349-1-ddrokosov@sberdevices.ru/
  [2] https://lore.kernel.org/all/20230327211351.686831-1-mmkurbanov@sberdevices.ru/
  [2] https://lore.kernel.org/all/20230322150458.783901-1-mmkurbanov@sberdevices.ru/

Martin Kurbanov (2):
  dt-bindings: spi: add Amlogic A1 SPI controller
  spi: add support for Amlogic A1 SPI Flash Controller

 .../bindings/spi/amlogic,a1-spifc.yaml        |  41 ++
 drivers/spi/Kconfig                           |   7 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-amlogic-spifc-a1.c            | 456 ++++++++++++++++++
 4 files changed, 505 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,a1-spifc.yaml
 create mode 100644 drivers/spi/spi-amlogic-spifc-a1.c

--
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
