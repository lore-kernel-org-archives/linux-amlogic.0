Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31F8C25B75
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KDjhRPi3QHHT57/A6PQo5msUQMbEzlKVsOs3iTZvuQY=; b=LmIPZB3W/exJ8S
	UAxZoj/TRwtPmqTi9DXnSfz45ayHLAZloTtvWw2ag5m/ycCnRKPvGlAzBCKfwHMFdIaXIvRAgC/eP
	jkNl6QjwLz55Wwl8vx4DNomCjHIgcRgr2t4NzAPqXX0/Fgjnx6NMDPgfunQAp8xKcaG2f3Pr1Idjp
	JzSanVlr6CV19bYIjicjLyeie9g6mp0bmrFsB4TpxbH5DikWSt800Mae720BDFipNt6NoqG9tM925
	snT+sfOjefKNgWCDV0kvOLziRVQUPh0gf9U3f966zbs9cfpJpUY5L8KyyMqFBFffcV+eW2++ouRdF
	kEN9c6Ou+5Vq//7oaKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jir-00000002bad-3F8W;
	Wed, 15 May 2024 18:51:29 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Jim-00000002bWx-0jib;
	Wed, 15 May 2024 18:51:27 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4898D120028;
	Wed, 15 May 2024 21:51:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4898D120028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715799072;
	bh=ZyqQQyPWlX2imp1zQ5BuZ3BU1RSvHcPZrRiLbxR7aMY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=RMma/IwAPeXCjTIvZGsKqD4XNjBIhecK1citXeeLeTJpYTbnwg4kTXDA1DuPi7/Zi
	 HAD8/pAVynvyNXOiR7Cpz8yNVvetCFZlH1n/Tr1hTI0GweT3ugE9jTep3qoS4khsXB
	 fkNENPuKcIK3cuGVC4DCpJ9X5bO3jA6TF2Q2DK99CworS1RS4VpuMUQxUt4g+YiUP0
	 DvVOto/eXRuNmMmzSvvb0RhLvHouuebXiUeJ1nkMIPjL4xzZMT1X8mXDmn+qtiycvq
	 iHYVq2t4cWXrSr+4eaIZugBgQxOOVD8hdVZZvwdxQGFNj8iL/Y/w45ozyScsEisASP
	 DJfNV5mytMY1Q==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 15 May 2024 21:51:12 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 15 May 2024 21:51:11 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v3 0/7] clk: meson: introduce Amlogic A1 SoC Family CPU clock controller driver
Date: Wed, 15 May 2024 21:47:23 +0300
Message-ID: <20240515185103.20256-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185260 [May 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/05/15 12:35:00
X-KSMG-LinksScanning: Clean, bases: 2024/05/15 12:57:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/15 13:12:00 #25231738
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_115125_111655_F6F7EBD5 
X-CRM114-Status: GOOD (  17.56  )
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

The CPU clock controller plays a general role in the Amlogic A1 SoC
family by generating CPU clocks. As an APB slave module, it offers the
capability to inherit the CPU clock from two sources: the internal fixed
clock known as 'cpu fixed clock' and the external input provided by the
A1 PLL clock controller, referred to as 'syspll'.

It is important for the driver to handle the cpu_clk rate switching
effectively by transitioning to the CPU fixed clock to avoid any
potential execution freezes.

Validation:
* to double-check all clk flags, run the below helper script:

```
pushd /sys/kernel/debug/clk
for f in *; do
    if [[ -f "$f/clk_flags" ]]; then
        flags="$(cat $f/clk_flags | awk '{$1=$1};1' | sed ':a;N;$!ba;s/\n/ | /g')"
        echo -e "$f: $flags"
    fi
done
popd
```

* to trace the current clks state, use the
  '/sys/kernel/debug/clk/clk_dump' node with jq post-processing:

```
$ cat /sys/kernel/debug/clk/clk_dump | jq '.' > clk_dump.json
```

* to see the CPU clock hierarchy, use the
'/sys/kernel/debug/clk/clk_summary' node with jq post-processing:

```
$ cat /sys/kernel/debug/clk/clk_summary | jq '.' > clk_dump.json
```

when cpu_clk is inherited from sys_pll, it should be:

```
syspll_in    1  1  0  24000000    0  0  50000  Y  deviceless                 no_connection_id
  sys_pll    2  2  0  1200000000  0  0  50000  Y  deviceless                 no_connection_id
    cpu_clk  1  1  0  1200000000  0  0  50000  Y  cpu0                       no_connection_id
                                                  cpu0                       no_connection_id
                                                  fd000000.clock-controller  dvfs
                                                  deviceless                 no_connection_id
```

and from cpu fixed clock:

```
fclk_div3_div           1  1  0  512000000  0  0  50000  Y  deviceless                 no_connection_id
  fclk_div3             4  4  0  512000000  0  0  50000  Y  deviceless                 no_connection_id
    cpu_fsource_sel0    1  1  0  512000000  0  0  50000  Y  deviceless                 no_connection_id
      cpu_fsource_div0  1  1  0  128000000  0  0  50000  Y  deviceless                 no_connection_id
        cpu_fsel0       1  1  0  128000000  0  0  50000  Y  deviceless                 no_connection_id
          cpu_fclk      1  1  0  128000000  0  0  50000  Y  deviceless                 no_connection_id
            cpu_clk     1  1  0  128000000  0  0  50000  Y  cpu0                       no_connection_id
                                                            cpu0                       no_connection_id
                                                            fd000000.clock-controller  dvfs
                                                            deviceless                 no_connection_id
```

* to debug cpu clk rate propagation and proper parent switching, compile
  kernel with the following definition:
    $ sed -i "s/undef CLOCK_ALLOW_WRITE_DEBUGFS/define CLOCK_ALLOW_WRITE_DEBUGFS/g" drivers/clk/clk.c
  after that, clk_rate debug node for each clock will be available for
  write operation

Changes v3 since v2 at [2]:
    - rename CLK_MESON_PLL_INIT_ONCE to CLK_MESON_PLL_NOINIT_ENABLED to
      accurately describe the behavior when we don't run the
      initialization sequence for an already enabled PLL
    - provide accurate comment about CLK_MESON_PLL_NOINIT_ENABLED flag
      to meson_clk_pll_init() and A1 sys_pll clock definition
    - tag syspll_in and sys_pll input clocks as optional in the a1-pll
      and a1-peripherals clkc bindings per Conor and Rob suggestion
    - move sys_pll_div16 clock from a1-pll clkc to a1-peripherals clkc
      as Jerome suggested

Changes v2 since v1 at [1]:
    - introduce new 'INIT_ONCE' flag to eliminate init for already
      enabled PLL
    - explain why we need to break ABI for a1-pll driver by adding
      sys_pll connections
    - implement sys_pll init sequence, which is applicable when sys_pll
      is disabled
    - remove CLK_IS_CRITICAL from sys_pll
    - move sys_pll_div16 binding to the end per Rob's suggestion
    - add Rob's RvB
    - remove holes from the beginning of the cpu clock controller regmap
    - move a1-cpu.h registers offsets definition to a1-cpu.c
    - set CLK_SET_RATE_GATE for parallel cpu fixed clock source trees
      per Martin's and Jerome's suggestion
    - redesign clock notifier block from cpu_clk to sys_pll to keep
      cpu_clock working continuously (the same implementation is located
      in the g12a clock driver)

Links:
    [1] https://lore.kernel.org/all/20240329205904.25002-1-ddrokosov@salutedevices.com/
    [2] https://lore.kernel.org/all/20240510090933.19464-1-ddrokosov@salutedevices.com/

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

Dmitry Rokosov (7):
  clk: meson: add 'NOINIT_ENABLED' flag to eliminate init for enabled
    PLL
  dt-bindings: clock: meson: a1: pll: introduce new syspll bindings
  clk: meson: a1: pll: support 'syspll' general-purpose PLL for CPU
    clock
  dt-bindings: clock: meson: a1: peripherals: support sys_pll input
  clk: meson: a1: peripherals: support 'sys_pll_div16' clock as GEN
    input
  dt-bindings: clock: meson: add A1 CPU clock controller bindings
  clk: meson: a1: add Amlogic A1 CPU clock controller driver

 .../bindings/clock/amlogic,a1-cpu-clkc.yaml   |  64 ++++
 .../clock/amlogic,a1-peripherals-clkc.yaml    |   9 +-
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   |   9 +-
 drivers/clk/meson/Kconfig                     |  10 +
 drivers/clk/meson/Makefile                    |   1 +
 drivers/clk/meson/a1-cpu.c                    | 331 ++++++++++++++++++
 drivers/clk/meson/a1-peripherals.c            |  18 +-
 drivers/clk/meson/a1-pll.c                    |  72 ++++
 drivers/clk/meson/a1-pll.h                    |   6 +
 drivers/clk/meson/clk-pll.c                   |  40 ++-
 drivers/clk/meson/clk-pll.h                   |   1 +
 .../dt-bindings/clock/amlogic,a1-cpu-clkc.h   |  19 +
 .../clock/amlogic,a1-peripherals-clkc.h       |   1 +
 .../dt-bindings/clock/amlogic,a1-pll-clkc.h   |   1 +
 14 files changed, 560 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
 create mode 100644 drivers/clk/meson/a1-cpu.c
 create mode 100644 include/dt-bindings/clock/amlogic,a1-cpu-clkc.h

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
