Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8350C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6hrLUwbbdkIlbd7F5T2t9NzMMyh++vEn7LOgSkF6zJY=; b=VJJL21AciYUOXp
	nle2JSi4ca6Qt/I2f9o1eKFiX3uuoV/jcmjKj9Yj9bLzf6aFXhYuQNqAIoURIWDebUvQmgNZoqFHB
	872j2rnNiTf26LNAQIcAbLD1C0jjbLXPEGDrtdg5YDIOzDIyT2FtJuP8pn+rAI5dS9gcSpBux4XKd
	0c8/FrDpGXdR5mSHYKVpmZtkt+TMyrVMnPvVVdDHDpLoTPsH3TlWXEjzlNOLTRanVOqiZ/KCKwrET
	g6dkcRHC+j7/8C9y/duaL0w/ZBJHaDdOdyELdqgZ4V1sK0mXuAdrueIq/snoq1s6N09kdhvu/ie+2
	utWe1/QoUtR7ff7iFHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf02f-00GQna-0c;
	Wed, 22 Mar 2023 15:06:21 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf02a-00GQhz-06;
	Wed, 22 Mar 2023 15:06:18 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id E565F5FD41;
	Wed, 22 Mar 2023 18:06:02 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679497562;
	bh=eTQd2Y4ovzRd2JsVVJJ6xL7i63yb2NKMkofOC1iY5UQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kjuu67TLLhokyUl0zqlRRkAEQm8sl9wwsLAdlKeQfw2SUtfkK5YalzTxGlkP1Vrqd
	 tbKANfCR4jqjPhDMBSU5WQr2hmB+GpS1eNEbxPiBMERXY8rIyuDeh3K7EGjY9yhDDj
	 X9+YgeH3XRmdMEGIn+KN0I3X3rk5fN+8iq90A8w9/KFoosiXcBATOqv3mjBXCQr3ZO
	 /fj10e1wszNPQunskDzM8efw61e5A+PBuYqHKay78c03MnF4+BMN7o0ePYE4oyujmT
	 Z++NYCFZb7qmZeolobG42evY1MEMS5aMlayUoI4aaPnK8DLBESHmoc7NO8yqFBoxn6
	 vmlOKhOYz0e6A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 22 Mar 2023 18:06:02 +0300 (MSK)
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
Subject: [PATCH v1 0/2] add support for Meson A1 SPI Flash Controller
Date: Wed, 22 Mar 2023 18:04:56 +0300
Message-ID: <20230322150458.783901-1-mmkurbanov@sberdevices.ru>
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
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/22 10:34:00 #20990985
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_080616_264893_8934A76A 
X-CRM114-Status: GOOD (  11.30  )
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
SPI flash controller (A113L family).

The existing spi-meson-spifc driver is incompatible with the A1 SPIFC
at all.

The implementation has been tested on the Amlogic A113L SoC based device
connected with ESMT F50L1G41LB spinand flash.

This patchset has dependencies on the A1 clock series which is still
under review [1].

Links:
  [1] https://lore.kernel.org/all/20230321193014.26349-1-ddrokosov@sberdevices.ru/

Martin Kurbanov (2):
  dt-bindings: spi: add binding for meson-spifc-a1
  spi: add support for Meson A1 SPI Flash Controller

 .../bindings/spi/amlogic,meson-a1-spifc.yaml  |  42 ++
 drivers/spi/Kconfig                           |   7 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-meson-spifc-a1.c              | 444 ++++++++++++++++++
 4 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
 create mode 100644 drivers/spi/spi-meson-spifc-a1.c

--
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
