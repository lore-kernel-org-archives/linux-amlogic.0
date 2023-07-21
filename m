Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D7CEB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jul 2023 07:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IblqbSPwze6gyXPxqd+UmxrmXBQzfN9LtxyWu/PyFzY=; b=BXDJmo4MscfDei
	9cw7KmkHqmbeEzTDe/D67g45e9+VuiJ5NkuYBseRymiUbxpGMMY+Vt1bMh6yeyUaQxdUzELeiZ0z5
	eLE3Aw0en4xF/+QHoSl2+gz2eQYHxTQanDPcNX7DPdFoBkOI6KlQBEb0xlAGVbvG7H2enV3/cmOw5
	OsTaw/y6pXEAmAQmlgTWbSwZjXtbW89l3df+jnEuCz7Oh0nTn5GmH9RcFuxY/sEf8IVBajIyR5Vv9
	XsMLIO4u3UU+kGttI1qWSSEbJetwLNK9MaUPv0HlAkan5W0AxxW/lyJBVpFiHZFMFU4T21n59V5xW
	8Z+Dn2GPE9LY7e2vsang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkfE-00DCED-2F;
	Fri, 21 Jul 2023 07:35:00 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkfC-00DCC0-0a;
	Fri, 21 Jul 2023 07:34:59 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 21 Jul 2023
 15:34:31 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linus.walleij@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 0/3] Add binding header file for GPIO interrupt of Amlogic Meson-G12A
Date: Fri, 21 Jul 2023 15:32:11 +0800
Message-ID: <20230721073214.1876417-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_003458_241850_A9795227 
X-CRM114-Status: UNSURE (   6.48  )
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
 .../irq-meson-g12a-gpio.h                     | 126 ++++++++++++++++++
 15 files changed, 164 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/interrupt-controller/irq-meson-g12a-gpio.h


base-commit: c58c49dd89324b18a812762a2bfa5a0458e4f252
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
