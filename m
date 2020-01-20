Return-Path: <SRS0=EzQI=3J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3203BC32771
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jan 2020 03:50:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 955182073A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jan 2020 03:50:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3ZQqhZh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 955182073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HhJVzYyL2SBqJzy/jo2m9DOy0xYCUnYjcfJ/JfNH3P0=; b=a3ZQqhZhgK9A2q
	hG5VVqwqXy6WOEe5/pD7nrE29Vx6djqu2hTEGGyZJ86kkVqzZfWmJc61Qj0ojxrrnC3rbNYonR0TF
	d2cMbrNzhpcd86kso3ROGc4yXt7J/HSTkmZBoGS6XPdRgrRT4RpsSZjqQT8Yn/8GpnUFJRFz2lOBA
	I17/0r1WMyyjWRXhikjwSlcdmqqr66NHS0UzbhhSyvwVcyix2tVQpZwUeF38mIJIxYdgV5YA7OA1h
	ac2XGqBx5imKM7meBTJUTPaSsz93xHqmtOgOLqLf5KmLtnQek8N0i2XBwWXpE0HhMUj028iuCctHs
	epua4KA2+99GUqoyuR9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itO4d-0005NZ-NK; Mon, 20 Jan 2020 03:49:59 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itO4Q-0005Cd-F5; Mon, 20 Jan 2020 03:49:49 +0000
Received: from droid15-sz.amlogic.com (10.28.8.25) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Mon, 20 Jan 2020
 11:50:11 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v7 0/5] add Amlogic A1 clock controller driver
Date: Mon, 20 Jan 2020 11:49:32 +0800
Message-ID: <20200120034937.128600-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [10.28.8.25]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_194946_507855_E0313876 
X-CRM114-Status: UNSURE (   9.83  )
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

Changes since v6 at [7]:
-fix 'dt_binding_check' compiling error
-add acked-by

Changes since v5 at [6]:
-fix yaml file
-add rst/current_en/l_detect parm detection
-remove 'meson_eeclkc_data' in a1.c and a1-pll.c

Changes since v4 at [5]:
- change yaml GPL
- drop meson-eeclk.c patch, add probe function in each driver
- add CLK_IS_CRITICAL for sys_clk clock, drop the flag for sys_a and sys_b
- add new parm for pll, add protection for rst parm
- drop flag for a1_fixed_pll
- remove the same comment for fclk_div, add "refer to"
- add critical flag for a1_sys_clk
- remove rtc table
- rename a1_dspa_en_dspa and a1_dspb_en_dspb
- remove useless comment

Changes since v3 at [3]:
-fix reparenting orphan failed, it depends on jerome's patch [4]
-fix changelist in v3 about reparenting orphan
-remove the dts patch 

Changes since v2 at [2]:
-add probe function for A1
-seperate the clock driver into two patch
-change some clock flags and ops
-add support for a1 PLL ops
-add A1 clock node
-fix reparenting orphan clock failed, registering xtal_fixpll
 and xtal_hifipll after the provider registration, it is not
 a best way.

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
[3] https://lkml.kernel.org/r/20191129144605.182774-1-jian.hu@amlogic.com
[4] https://lkml.kernel.org/r/20191203080805.104628-1-jbrunet@baylibre.com
[5] https://lkml.kernel.org/r/20191206074052.15557-1-jian.hu@amlogic.com
[6] https://lkml.kernel.org/r/20191227094606.143637-1-jian.hu@amlogic.com
[7] https://lkml.kernel.org/r/20200116080440.118679-1-jian.hu@amlogic.com

Jian Hu (5):
  dt-bindings: clock: meson: add A1 PLL clock controller bindings
  clk: meson: add support for A1 PLL clock ops
  clk: meson: a1: add support for Amlogic A1 PLL clock driver
  dt-bindings: clock: meson: add A1 peripheral clock controller bindings
  clk: meson: a1: add support for Amlogic A1 Peripheral clock driver

 .../bindings/clock/amlogic,a1-clkc.yaml       |   65 +
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   |   52 +
 drivers/clk/meson/Kconfig                     |   18 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/a1-pll.c                    |  360 +++
 drivers/clk/meson/a1-pll.h                    |   56 +
 drivers/clk/meson/a1.c                        | 2249 +++++++++++++++++
 drivers/clk/meson/a1.h                        |  120 +
 drivers/clk/meson/clk-pll.c                   |   47 +-
 drivers/clk/meson/clk-pll.h                   |    2 +
 include/dt-bindings/clock/a1-clkc.h           |   98 +
 include/dt-bindings/clock/a1-pll-clkc.h       |   16 +
 12 files changed, 3078 insertions(+), 7 deletions(-)
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
