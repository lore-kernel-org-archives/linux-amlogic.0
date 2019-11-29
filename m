Return-Path: <SRS0=h6Hi=ZV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C48C432C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Nov 2019 14:46:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F16D21736
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Nov 2019 14:46:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GPxRIMpX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F16D21736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y8ogP/lKT0o1wUSxjwie0KOFX9jkwcP8nDIwH0MfYxo=; b=GPxRIMpXxU1oP/
	5yM0TUG+DtL5T51NOb7D8YV/U79ShTAwSX/U8QLfaeR7nOt+Nnh5MTMVRuQIYcGZm+ICy3Z1fJMjz
	rNvrMRLeQ/jElx9QD36FWXwqzlkjHOa9x6j6mru+9yXa93piz3Q/tWLskmDUJq9KG6FsY5VaXsnbj
	q1m2wu/UzX4yjiaLnkeCEoMKPR5vviIwNmMJcMOMtLBN2wjPHde4q+us/AJV53nGirRc4YehPXlI/
	NzVHwrNo8idDoVcpsqYu+lU6zZ5MM0Ik4Ojx8331z6SE/YyHZfKfC6Ximtw3qUAxD+AZl2K58EZtT
	kdU8IHhz2ejs2CQMnxsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iahXh-0003oZ-1p; Fri, 29 Nov 2019 14:46:45 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iahXV-0003gZ-6H; Fri, 29 Nov 2019 14:46:37 +0000
Received: from droid15-sz.amlogic.com (10.28.8.25) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 29 Nov 2019
 22:46:36 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v3 0/7] add Amlogic A1 clock controller driver
Date: Fri, 29 Nov 2019 22:45:58 +0800
Message-ID: <20191129144605.182774-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [10.28.8.25]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191129_064636_384375_E2D00E8B 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, Qiufang Dai <qiufang.dai@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Chandle Zou <chandle.zou@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add support for Amlogic A1 clock driver, the clock includes 
three parts: peripheral clocks, pll clocks, CPU clocks.
sys pll and CPU clocks will be sent in next patch.

Changes since v1 at [2]:
-add probe function for A1
-seperate the clock driver into two patch
-change some clock flags and ops
-add support for a1 PLL ops
-add A1 clock node

Changes since v1 at [1]:
-place A1 config alphabetically
-add actual reason for RO ops, CLK_IS_CRITICAL, CLK_IGNORE_UNUSED
-separate the driver into two driver: peripheral and pll driver
-delete CLK_IGNORE_UNUSED flag for pwm b/c/d/e/f clock, dsp clock
-delete the change in Kconfig.platforms, address to Kevin alone
-remove the useless comments
-modify the meson pll driver to support A1 PLLs

[1] https://lkml.kernel.org/r/1569411888-98116-1-git-send-email-jian.hu@amlogic.com
[2] https://lkml.kernel.org/r/1571382865-41978-1-git-send-email-jian.hu@amlogic.com

Jian Hu (7):
  dt-bindings: clock: meson: add A1 PLL clock controller bindings
  clk: meson: add support for A1 PLL clock ops
  clk: meson: eeclk: refactor eeclk common driver to support A1
  clk: meson: a1: add support for Amlogic A1 PLL clock driver
  dt-bindings: clock: meson: add A1 peripheral clock controller bindings
  clk: meson: a1: add support for Amlogic A1 Peripheral clock driver
  arm64: dts: meson: add A1 PLL and periphs clock controller

 .../bindings/clock/amlogic,a1-clkc.yaml       |   70 +
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   |   56 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   26 +
 drivers/clk/meson/Kconfig                     |   20 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/a1-pll.c                    |  334 +++
 drivers/clk/meson/a1-pll.h                    |   56 +
 drivers/clk/meson/a1.c                        | 2309 +++++++++++++++++
 drivers/clk/meson/a1.h                        |  120 +
 drivers/clk/meson/clk-pll.c                   |   21 +
 drivers/clk/meson/clk-pll.h                   |    1 +
 drivers/clk/meson/meson-eeclk.c               |   59 +-
 drivers/clk/meson/meson-eeclk.h               |    2 +
 drivers/clk/meson/parm.h                      |    1 +
 include/dt-bindings/clock/a1-clkc.h           |   98 +
 include/dt-bindings/clock/a1-pll-clkc.h       |   16 +
 16 files changed, 3181 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/a1-pll.c
 create mode 100644 drivers/clk/meson/a1-pll.h
 create mode 100644 drivers/clk/meson/a1.c
 create mode 100644 drivers/clk/meson/a1.h
 create mode 100644 include/dt-bindings/clock/a1-clkc.h
 create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
