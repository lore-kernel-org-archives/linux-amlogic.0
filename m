Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98F2C77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 06:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZMuKp7DH8GI9kuCvFqDmPnE8iOtLrLDVd55JLTUnk8U=; b=1mhzZ9VrJjbQJK
	H6SmNE2c6KLmUIK0gYdoNWmXnCHp8qEQojAYjmzay2db0V733Z5/KzhYNemcRQVGe9bDVkDWHN0We
	2is5ccCm1RWMsIbQvWH1Alu46AEp+wBBbNcVkz9QUNTjTgnI0EhGW+WsU7QAres2TyasbM5/Ena0j
	dDYWA1oKnGVOGPL87Y59bltHHGlQxaQqxch5eXOvIV28t0nr6ddQoR3VO9sNAsBcCivRRFRgqBlT2
	mH3pUjlhpwwJCA+OOsuv30Pf4c9+f1xwxboGtqQjs5H3Ezg2SeIVGedFl9dv0ruPxJfiB9PNj+UiU
	7EsgfaiLIwc5MgsbhGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoUP-004YZk-3C;
	Tue, 16 May 2023 06:48:54 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoUM-004YXw-1T;
	Tue, 16 May 2023 06:48:51 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 16 May 2023
 14:48:34 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>, Yu Tu
	<yu.tu@amlogic.com>
Subject: [PATCH V8 RESEND 0/4] Add S4 SoC PLL and Peripheral clock
Date: Tue, 16 May 2023 14:47:32 +0800
Message-ID: <20230516064736.10270-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_234850_514062_1DA17AA6 
X-CRM114-Status: UNSURE (   6.94  )
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

1. Add S4 SoC PLL and Peripheral clock controller dt-bindings.
2. Add PLL and Peripheral clock controller driver for S4 SOC.

Yu Tu (4):
  dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
  dt-bindings: clock: document Amlogic S4 SoC peripherals clock
    controller
  clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
  clk: meson: s4: add support for Amlogic S4 SoC peripheral clock
    controller

V7 -> V8:
1. Change patch 0001/0002 dt-bindings title description, remove "meson".
Suggested by Dmitry, Neil.
2. Change patch 0003/0004 clocks comment, format and clock flags suggested by
Dmitry, Neil, Jerome.

V6 -> V7: Change send patch series as well change format and clock flags
suggested by Jerome. Change dt-bindings suggested by Krzysztof.
V5 -> V6: Change send patch series, as well change format and clock flags.
V4 -> V5: change format and clock flags and adjust the patch series
as suggested by Jerome.
V3 -> V4: change format and clock flags.
V2 -> V3: Use two clock controller.
V1 -> V2: Change format as discussed in the email.

Link:https://lore.kernel.org/all/20230417065005.24967-1-yu.tu@amlogic.com/

 .../clock/amlogic,s4-peripherals-clkc.yaml    |   97 +
 .../bindings/clock/amlogic,s4-pll-clkc.yaml   |   50 +
 MAINTAINERS                                   |    1 +
 drivers/clk/meson/Kconfig                     |   25 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/s4-peripherals.c            | 3830 +++++++++++++++++
 drivers/clk/meson/s4-peripherals.h            |  217 +
 drivers/clk/meson/s4-pll.c                    |  907 ++++
 drivers/clk/meson/s4-pll.h                    |   87 +
 .../clock/amlogic,s4-peripherals-clkc.h       |  131 +
 .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   30 +
 11 files changed, 5377 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/s4-peripherals.c
 create mode 100644 drivers/clk/meson/s4-peripherals.h
 create mode 100644 drivers/clk/meson/s4-pll.c
 create mode 100644 drivers/clk/meson/s4-pll.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h


base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
