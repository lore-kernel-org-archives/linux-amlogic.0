Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61380C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Dec 2021 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cLsgjG2Bot7+FJzUZfqPfobxyxvf20+B+svkKPha3vk=; b=fiOdhlS1RPE5LT
	m7l6ZKK7YzeXV5102S2Y228n67+Ya4PP2zbgKsBf29OQomWT+xH1VqMn1V6AQOizSnPMKZ22A9waH
	JPQcIZVgDOkUqfm2Xo6o3Uhq9K8Imuv/P2vnjKeDQE/FsuXyPI+bdVByYurniifJhcw1u+sdc695k
	koMV/Rot+hY/pYzN9TQYDzHuy0lY0to4LkOcNZuQUxyOBHxvmY900VvxTub/pdTY1P0F+vzpySl5F
	K4QROTOF8hC5SQj5Dyy1bVwHVh4bVZd0jSDvRBuU/OtRYM7x+EXDuH+xTueQh25xNrEGj8nEH1L+g
	2Ms8xpqJ1kn2heRZf2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Xsc-002ijh-QU; Wed, 29 Dec 2021 12:16:30 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2XsR-002ig8-Hl; Wed, 29 Dec 2021 12:16:20 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Wed, 29 Dec 2021 20:16:10 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v3 0/3] pinctrl: meson-s4: add pinctrl driver
Date: Wed, 29 Dec 2021 20:16:02 +0800
Message-ID: <20211229121605.10513-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_041619_630561_F45BD148 
X-CRM114-Status: UNSURE (   9.17  )
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

This patchset adds Pin controller driver support for Meson-S4 SoC
which shares the same register layout with previous Meson-A1

Changes since v2 at [1]:
- add dt-bindings header file patch back with Rob's Acked-by

Changes since v1 at [0]:
- fix typos in commit message
- fix coding style problem in pinctrl-meson-s4.c
- change tdm groups makeup and split mclk groups

[0] https://lore.kernel.org/linux-amlogic/20211214022100.14841-1-qianggui.song@amlogic.com/
[1] https://lore.kernel.org/linux-amlogic/20211227080649.32275-1-qianggui.song@amlogic.com/

Qianggui Song (3):
  dt-bindings: pinctrl: meson: Add compatible for S4
  dt-bindings: gpio: Add a header file for Amlogic Meson S4
  pinctrl: meson: add pinctrl driver support for Meson-S4 Soc

 .../bindings/pinctrl/meson,pinctrl.txt        |    1 +
 drivers/pinctrl/meson/Kconfig                 |    6 +
 drivers/pinctrl/meson/Makefile                |    1 +
 drivers/pinctrl/meson/pinctrl-meson-s4.c      | 1234 +++++++++++++++++
 include/dt-bindings/gpio/meson-s4-gpio.h      |   99 ++
 5 files changed, 1341 insertions(+)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-s4.c
 create mode 100644 include/dt-bindings/gpio/meson-s4-gpio.h

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
