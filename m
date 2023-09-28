Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1F4CE7B01
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Sep 2023 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f99XlqUNWhsZa5JO7oBKkTpcvSvmu6z9TwsraeFGGmM=; b=nhz/YPWFGSu0Yk
	Wcw2xcetfWkCzaRQJFtVzqvWTt8A9HQE0U1osG96nginQ1q3w1Y98AxJDyv5nDnEJjUjdMxZm1FDx
	3Kf0efswHLJWXg0IFldlQyIGY/0Typ84gighno+mQrH1hrQpISRtN0dWYKeWDZeiRTax7lnAunUGZ
	h8xL9XNCMX2kEnDcrFYSIz0/RF3rF52IfAewXfOZXPHKVAS34/UWoemYqzEMj4wtqnAk457+GenDs
	j4tzmn94BUiNREaZVmr6lfR4XgAveGXUD/HL8CKSor68S1pm0HWGHFMP9PmCcA0oNBdMZXji+okaY
	BFrp/oHHhLUKMyqNdsag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkcK-002PRk-0T;
	Thu, 28 Sep 2023 06:35:20 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkcF-002POv-21;
	Thu, 28 Sep 2023 06:35:18 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 28 Sep 2023
 14:34:55 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH 0/4]  Add C3 SoC PLLs and Peripheral clock
Date: Thu, 28 Sep 2023 14:34:44 +0800
Message-ID: <20230928063448.3544464-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_233515_667976_834B7044 
X-CRM114-Status: UNSURE (   6.79  )
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

Add C3 SoC PLLs and Peripheral clock controller dt-bindings.
Add PLLs and Peripheral clock controller driver for C3 SOC.

Xianwei Zhao (4):
  dt-bindings: clock: add Amlogic C3 PLL clock controller bindings
  dt-bindings: clock: add Amlogic C3 peripherals clock controller
    bindings
  clk: meson: C3: add support for the C3 SoC PLL clock
  clk: meson: c3: add c3 clock peripherals controller driver

 .../clock/amlogic,c3-peripherals-clkc.yaml    |   86 ++
 .../bindings/clock/amlogic,c3-pll-clkc.yaml   |   53 +
 drivers/clk/meson/Kconfig                     |   25 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/c3-peripherals.c            | 1372 +++++++++++++++++
 drivers/clk/meson/c3-peripherals.h            |   48 +
 drivers/clk/meson/c3-pll.c                    |  510 ++++++
 drivers/clk/meson/c3-pll.h                    |   35 +
 .../clock/amlogic,c3-peripherals-clkc.h       |  230 +++
 .../dt-bindings/clock/amlogic,c3-pll-clkc.h   |   42 +
 10 files changed, 2403 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/c3-peripherals.c
 create mode 100644 drivers/clk/meson/c3-peripherals.h
 create mode 100644 drivers/clk/meson/c3-pll.c
 create mode 100644 drivers/clk/meson/c3-pll.h
 create mode 100644 include/dt-bindings/clock/amlogic,c3-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,c3-pll-clkc.h


base-commit: 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
