Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7B3C25B77
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2024 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BLi8Kl/YcK29KLN7l3XgAu/TxDSu96rrMTb9wkRTre8=; b=LARGL2wh3CVJr5
	U6fxaNjmGolj51NFIzHZPxxoxG1hNCXpU+K7FwLiMV+31zpn+W8Exm0u5FeTw9pUwLdaMlek3Z9zo
	Ocv72JtGN22qZpWlV9qozpk0FYy0S6yCJhgQ1Kx/BHb7y7T4xS191ItDNlJ1Fc7iBc4MmSpF7EE2c
	DDlxyWuriVgJfIq1o/Mxa/FjUHMgCTmwU+n+S+zfeTW7Xpl1LYItYdlWwJwBk1+QU+hgG8B6BibGy
	G/i1K7yxpkzqsm/rX3csN6+UYLw4A3mgzjWyUAvSFR/8K0kJYfhfKb6MonUCJzO3zsrMChum4mSjS
	5EmThEtPWufBJg0olXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9hKJ-00000002MRa-0HQf;
	Wed, 22 May 2024 08:27:59 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9hKG-00000002MKb-1FR7;
	Wed, 22 May 2024 08:27:57 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Wed, 22 May 2024
 16:27:30 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH v9 0/5] Add C3 SoC PLLs and Peripheral clock
Date: Wed, 22 May 2024 16:27:22 +0800
Message-ID: <20240522082727.3029656-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_012756_357680_0F96F15F 
X-CRM114-Status: GOOD (  11.12  )
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

The patchset adds support for the peripheral and PLL clock controller
found on the Amlogic C3 SoC family, such as C302X or C308L.

Some clocks are provided by security zones. These clock accessed
througth SCMI driver in linux, inlcuding DDR_PLL,DDR_PHY, TOP_PLL,
USB_PLL, MIPIISP_VOUT, MCLK_PLL, USB_CTRL, ETH_PLL, OSC, SYS_CLK,
AXI_CLK, CPU_CLK, FIXED_PLL, GP1_PLL, SYS_PLL_DIV16, CPU_CLK_DIV14.

Changes since V8 [1]:
 - Use imply in Kconfig.
 - Link to v8: https://lore.kernel.org/all/20240430064438.2094701-1-xianwei.zhao@amlogic.com 

Changes since V7 [1]:
 - Remove included head file not used.
 - Link to v7: https://lore.kernel.org/all/20240424050928.1997820-1-xianwei.zhao@amlogic.com

Changes since V6 [12]:
 - Add pad src for rtc clock.
 - Add SCMI clock controller support, move some clock node in SCMI,such as GP1 PLL DDR USB etc.
 - Fix some spelling mistake.
 - Use lower case for bindings and update some input clocks desc.
 - Update some clock comments.
 - Delete prefix "AML_" for macro definition.
 - Addd some clock annotation and some clock flag CRITICAL.
 - Add maximum for regmap_config.
 - Delete some unused register definition and unused clock inputs. 
 - Drop patch subject redundant "bindings". Suggested by Krzysztof.
 - Not reference header file "clk.h" and replace comment. Suggested by Jerome.
 - Modify description about board in Kconfig file help item. Suggested by Jerome.
 - Link to v6: https://lore.kernel.org/all/20231106085554.3237511-1-xianwei.zhao@amlogic.com

Changes since V5 [3]:
 - Fix some typo and modify formart for MARCO. Suggested by Jerome.
 - Add pad clock for peripheral input clock in bindings.
 - Add some description for explaining why ddr_dpll_pt_clk and cts_msr_clk are out of tree.
Changes since V4 [10]:
 - Change some fw_name of clocks. Suggested by Jerome.
 - Delete minItem of clocks.
 - Add CLk_GET_RATE_NOCACHE flags for gp1_pll
 - Fix some format. and fix width as 8 for mclk_pll_dco.
 - exchange gate and divder for fclk_50m clock.
 - add CLK_SET_RATE_PARENT for axi_a_divder & axi_b_divder.
 - add CLK_IS_CRITICAL for axi_clk
 - Optimized macro define for pwm clk.
 - add cts_oscin_clk mux between 24M and 32k
 - add some missing gate clock, such as ddr_pll.
Changes since V3 [7]:
 - Modify Kconfig desc and PLL yaml clk desc.
 - Fix some format.Suggested by Yixun and Jerome.
 - Add flag CLK_GET_RATE_NOCACHE for sys_clk.
 - Optimized macro define for pwm clk.
 - Use flag CLK_IS_CRITICAL for axi_clk.
 - Add some description for some clocks.
 - Use FCLK_50M instead of FCLK_DIV40.
Changes since V2 [4]:
 - Modify some format, include clk name & inline, and so on.
 - Define marco for pwm clock.
 - Add GP1_PLL clock.
 - Modify yaml use raw instead of macro.
Changes since V1 [2]:
 - Fix errors when check binding by using "make dt_binding_check".
 - Delete macro definition.
Xianwei Zhao (5):
  dt-bindings: clock: add Amlogic C3 PLL clock controller
  dt-bindings: clock: add Amlogic C3 SCMI clock controller support
  dt-bindings: clock: add Amlogic C3 peripherals clock controller
  clk: meson: c3: add support for the C3 SoC PLL clock
  clk: meson: c3: add c3 clock peripherals controller driver

 .../clock/amlogic,c3-peripherals-clkc.yaml    |  120 +
 .../bindings/clock/amlogic,c3-pll-clkc.yaml   |   59 +
 drivers/clk/meson/Kconfig                     |   27 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/c3-peripherals.c            | 2365 +++++++++++++++++
 drivers/clk/meson/c3-pll.c                    |  746 ++++++
 .../clock/amlogic,c3-peripherals-clkc.h       |  212 ++
 .../dt-bindings/clock/amlogic,c3-pll-clkc.h   |   40 +
 .../dt-bindings/clock/amlogic,c3-scmi-clkc.h  |   27 +
 9 files changed, 3598 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/c3-peripherals.c
 create mode 100644 drivers/clk/meson/c3-pll.c
 create mode 100644 include/dt-bindings/clock/amlogic,c3-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,c3-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,c3-scmi-clkc.h


base-commit: ba535bce57e71463a86f8b33a0ea88c26e3a6418
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
