Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C7DC28D13
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Aug 2022 02:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/8yHqqBexd+TzwwbKkDs/asYFOxjBxKSmney4Mpz0Q0=; b=Po8V8X7sdkj6BM
	qVQibe+v5hhl7amU0X1igRtlaMw5CnyZMl5HCJbxiviXdANkQkX0qt8xY8CYM5/1SMNaRWOmDmNDn
	iFxn9SQioZLXQoTqeij7vOjXIicvdRMEc2UyP1Cma+u6ZSl8F4Du8u8vwYrqT1FfYn2xBcEYTk5TK
	7Kkr/6n4Ww/mJYRMZBlfPUrpjAuub2ZWIzIqkSl7Sff4zjEyLo+MGy2I+RjWfxP3HHQ3KVgrpCyfC
	FwGYn7LMvsdrD51eNCPV0Jxb9wXWoyNnAUkzjj4J0FN+MCQum7scj7qE9IpppnIkKyThhgQJvOEQW
	RroCQ1TuMQfuPeogZ5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQJe6-000Nhd-FS; Tue, 23 Aug 2022 02:28:02 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQJdk-000NPt-Ig; Tue, 23 Aug 2022 02:27:45 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Tue, 23 Aug 2022
 10:27:30 +0800
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
Subject: [PATCH V4 0/6] Add S4 SoC PLL and Peripheral clock controller
Date: Tue, 23 Aug 2022 10:26:24 +0800
Message-ID: <20220823022630.25007-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_192740_713666_A6B26C4D 
X-CRM114-Status: UNSURE (   6.07  )
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

1. Add PLL and Peripheral clock controller driver for S4 SOC.

Yu Tu (6):
  dt-bindings: clock: meson: add S4 SoC PLL clock controller bindings
  arm64: dts: meson: add S4 Soc PLL clock controller in DT
  clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
  dt-bindings: clk: meson: add S4 SoC peripheral clock controller
    bindings
  arm64: dts: meson: add S4 Soc Peripheral clock controller in DT
  clk: meson: s4: add s4 SoC peripheral clock controller driver

V3 -> V4: change format and clock flags.
V2 -> V3: Use two clock controller.
V1 -> V2: Change format as discussed in the email.

Link:https://lore.kernel.org/all/20220805085716.5635-7-yu.tu@amlogic.com/

 .../clock/amlogic,s4-peripherals-clkc.yaml    |  105 +
 .../bindings/clock/amlogic,s4-pll-clkc.yaml   |   51 +
 MAINTAINERS                                   |    1 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   34 +
 drivers/clk/meson/Kconfig                     |   25 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/s4-peripherals.c            | 3813 +++++++++++++++++
 drivers/clk/meson/s4-peripherals.h            |  218 +
 drivers/clk/meson/s4-pll.c                    |  880 ++++
 drivers/clk/meson/s4-pll.h                    |   88 +
 .../clock/amlogic,s4-peripherals-clkc.h       |  131 +
 .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   30 +
 12 files changed, 5378 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/s4-peripherals.c
 create mode 100644 drivers/clk/meson/s4-peripherals.h
 create mode 100644 drivers/clk/meson/s4-pll.c
 create mode 100644 drivers/clk/meson/s4-pll.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h


base-commit: 08fc500fe3d4b1f0603fb97ad353f246a3d52d2d
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
