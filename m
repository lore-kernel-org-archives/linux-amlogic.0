Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2997C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 05:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uTPEdhF7C2nJpZn9/wwwI37IAeDKK2gTVED7titbVUM=; b=gJwES8MMLxYtYs
	fEsi112cJHCmNxNayF+Ag2PHHR0AwN1jASgYqbHmi/MY4uVTvhIWbz0l8bTRigMMz7bWGDdb2xL3I
	pnxnfYD4caUUP4dxQeCfBokL7/WycOQyZpwNwS6Ym/oWlDeK8p1/JlTVR9BTtG4pmXlS8IdkP11uK
	GK//3ij2e1eb0oLyhkBT5Sjxb9fffUgvd8cb7q0S3Y9jQUDYDlkSr8nCCijBmCI3szyriBTJLTx7e
	aGTYOJ+N6xbAIvlzoG3AHcASAgiRpAkV9FR9p/OjIZIl9fezr0Z1TeZhXj/c7wOSKVvYIiCYtcIYj
	nOPWVUfQQ7kgrWtdNk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGwJD-004hbz-EJ; Thu, 28 Jul 2022 05:43:43 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGwJ0-004hTO-PT; Thu, 28 Jul 2022 05:43:32 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 28 Jul 2022
 13:43:17 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V2 0/3] Add S4 SoC clock controller driver
Date: Thu, 28 Jul 2022 13:41:59 +0800
Message-ID: <20220728054202.6981-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_224330_862325_1EAF0722 
X-CRM114-Status: UNSURE (   5.83  )
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

1. Add clock controller driver for S4 SOC.

Yu Tu (3):
  dt-bindings: clk: meson: add S4 SoC clock controller bindings
  arm64: dts: meson: add S4 Soc clock controller in DT
  clk: meson: s4: add s4 SoC clock controller driver

V1 -> V2: Change format as discussed in the email.

Link:https://lore.kernel.org/linux-amlogic/20220708062757.3662-1-yu.tu@amlogic.com/

 .../bindings/clock/amlogic,gxbb-clkc.txt      |    1 +
 MAINTAINERS                                   |    1 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   11 +
 drivers/clk/meson/Kconfig                     |   15 +
 drivers/clk/meson/Makefile                    |    1 +
 drivers/clk/meson/s4.c                        | 4732 +++++++++++++++++
 drivers/clk/meson/s4.h                        |  296 ++
 include/dt-bindings/clock/s4-clkc.h           |  146 +
 8 files changed, 5203 insertions(+)
 create mode 100644 drivers/clk/meson/s4.c
 create mode 100644 drivers/clk/meson/s4.h
 create mode 100644 include/dt-bindings/clock/s4-clkc.h


base-commit: b293bc9286ee21824e93f0fcfed3b78fdfee01e6
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
