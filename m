Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B67EB64DD
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jul 2023 06:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iysRB1ILUQ3f4R2ye1aFWUAHQNgM3BRmZIrs7k9780o=; b=JCW/8S2nUH91+5
	oYZYm4rPUgTJIWrrsxWfRPDj+whOyxMDSOVcDBthsuCNPwYXwgmsrzC6LhPXh9Ynm4Md0+DSqiwAK
	bE4cGa+8w7WbDhrKqHbDRAjqFRIYzHoGFORn+DvFsz98jVpj93n/oFVpmCcbR4KM0FacaHlCnZafe
	f06R4YQbUSm8lPUhPQZfaEIgppBOGH3HAcQ8SZq509og5vyBvDsPTttcgblXxPeEYLuMRWjVP3k2B
	9wQQRQYngOMG59EpelP8wgPSIKRPLQucz8B/8anBiVQ3RJUsYJT0zgMGtqcGG/a/qbNfOg13vJHHd
	hyB5iVirAfj1G+Y9PUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNoeM-002uKh-2U;
	Mon, 24 Jul 2023 06:02:30 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNoeI-002uHH-1f;
	Mon, 24 Jul 2023 06:02:27 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 24 Jul 2023
 14:01:53 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linus.walleij@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 0/3] Add binding header file for GPIO interrupt of Amlogic Meson-G12A
Date: Mon, 24 Jul 2023 14:01:05 +0800
Message-ID: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_230226_579401_21E5C2F2 
X-CRM114-Status: UNSURE (   6.92  )
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

After adding this binding header file, you can intuitively find
the interrupt number corresponding to each GPIO, and apply it
in the format of IRQID_XXX where it needs to be used.

Associated platforms:
- Amlogic Meson-G12A
- Amlogic Meson-G12B
- Amlogic Meson-SM1

[PATCH 1/3]: 
  V1 -> V2: Rename irq-meson-g12a-gpio.h to amlogic,meson-g12a-gpio-intc.h

[PATCH 2/3]:
  V1 -> V2: Include header file changed to amlogic,meson-g12a-gpio-intc.h

[PATCH 3/3]:
  V1 -> V2: Include header file changed to amlogic,meson-g12a-gpio-intc.h

Huqiang Qin (3):
  dt-bindings: interrupt-controller: Add header file for Amlogic
    Meson-G12A SoCs
  pinctrl: Replace the IRQ number in the driver with the IRQID macro
    definition
  arm64: dts: Replace the IRQ number with the IRQID macro definition

 .../boot/dts/amlogic/meson-g12-common.dtsi    |   1 +
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |   2 +-
 .../dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   2 +-
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi |   2 +-
 .../amlogic/meson-g12b-odroid-go-ultra.dts    |   4 +-
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     |   2 +-
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     |   2 +-
 .../dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |   2 +-
 .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  |   4 +-
 .../boot/dts/amlogic/meson-sm1-h96-max.dts    |   2 +-
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |   2 +-
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  12 +-
 .../dts/amlogic/meson-sm1-x96-air-gbit.dts    |   2 +-
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  35 ++---
 .../amlogic,meson-g12a-gpio-intc.h            | 126 ++++++++++++++++++
 15 files changed, 164 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h


base-commit: c58c49dd89324b18a812762a2bfa5a0458e4f252
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
