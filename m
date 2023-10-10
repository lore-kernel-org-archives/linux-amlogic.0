Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6A9CD68F1
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Oct 2023 06:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C/24dbN3+4HFsB46sA4PtIjDfXgkUjPZopPa67pLJHk=; b=jHZCM41sltU/iR
	X862wqhzBTgfO8LTMktv2rkBBVzBrA5ZP+LGCVFKPXuxNzaqhzoiKn5HohINoMWbyFWQVktoXnhA2
	/ToFmVoaOaHEWSNDxz7JZHz7SrZvvYSX/wr6+ApxEmwrWDztyAzMJgUlNqmZVDrc/xKUQ038uLEQN
	Xc/ETps5Q5+2cPE+nm/5uczCGfSahItK3XFi8/pe6Kv6u9J62cShigQG7T5hKHLCsDCEDMq9+iUvH
	XA1SECb2XwFlbAoBMzjRShnm4otS+BIHVbDNQ5hTeECjfoxZV4hoz2dbA/N9JQAHUHvwJgq+OaxwS
	qEw02BGHaPODEn8Hh2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq6FU-00CaDa-1R;
	Tue, 10 Oct 2023 06:29:44 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq6FO-00CaAY-0i;
	Tue, 10 Oct 2023 06:29:42 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 10 Oct 2023
 14:29:19 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V2 0/4] Add C3 SoC PLLs and Peripheral clock
Date: Tue, 10 Oct 2023 14:29:13 +0800
Message-ID: <20231010062917.3624223-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_232938_256646_07C90A16 
X-CRM114-Status: UNSURE (   6.96  )
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

V1 -> V2:
 1. Fix errors when check binding by using "make dt_binding_check"
 2. Delete macro definition
          
Xianwei Zhao (4):
  dt-bindings: clock: add Amlogic C3 PLL clock controller bindings
  dt-bindings: clock: add Amlogic C3 peripherals clock controller
    bindings
  clk: meson: c3: add support for the C3 SoC PLL clock
  clk: meson: c3: add c3 clock peripherals controller driver

 .../clock/amlogic,c3-peripherals-clkc.yaml    |   92 +
 .../bindings/clock/amlogic,c3-pll-clkc.yaml   |   59 +
 drivers/clk/meson/Kconfig                     |   25 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/c3-peripherals.c            | 3096 +++++++++++++++++
 drivers/clk/meson/c3-peripherals.h            |   48 +
 drivers/clk/meson/c3-pll.c                    |  808 +++++
 drivers/clk/meson/c3-pll.h                    |   35 +
 .../clock/amlogic,c3-peripherals-clkc.h       |  230 ++
 .../dt-bindings/clock/amlogic,c3-pll-clkc.h   |   42 +
 10 files changed, 4437 insertions(+)
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
