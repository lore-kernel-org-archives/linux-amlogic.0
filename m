Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AF8C54FC6
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 05:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=spW4VDCxPIQq4LQ5SuiBJJbLzd65smapmUCPJ4sJR/Y=; b=VZk/p6ZAXH9SLJ
	18mvTHmV2/q0mv5SN6Oc3spgPLpAeutj1LhXF8nZK6OBUGNCC8IbvnyOelqK78Qeb9KH5Ac2NdCHZ
	K3016G8HRJqx4QiHYFpoXhrEbyfiEp6qjrPD1uRqFItLCkkbRsPs9SXcO6e8vGGpJMTNOlJ5pRhc2
	GY7R+k12Qcy5io12BgRiktHJ8naEowOnmJcnqEsxtUdsVtzvYQ9xWDSspQmv49dVEDCIZt/XBndxo
	GGkkA+CTsmtM4OCh8P9id+wvzECpqbKZDNsD2cIisgPNB0W59MCtHkB5lOEmRB2wqjwwBUh3i3JST
	4ECcylgcsR4Rl3rkl8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRth-0000000Am2x-18AH;
	Fri, 06 Sep 2024 05:52:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRte-0000000Am1G-1ZZv;
	Fri, 06 Sep 2024 05:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE756A44678;
	Fri,  6 Sep 2024 05:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF551C4CEC4;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725601956;
	bh=g01KSPJoXIPurLe84AcyOHvY7DI2Ak8ynhEFBJfoOtg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tKA+dOgttwwsbZFDX0yViM54k+PSdYvK9glYNgdUAgx7tA48HGEhZUiYMQirQHNNq
	 vziGbqVkZkqUn797wPX8dSXhjE8KpNc2fl2/h1yScVNbRIfYGhRXGgU9Bgv/cnsEwy
	 hg1vGh8xCCKl6nkU2LfrGAWW8Q5pYYRZSRe8B7yFj39QFQ88Cvk7UewyY1VXojgmMJ
	 G0yplYeaR4IvJ637ySmGCxUI4Mu+oGoT1vYvn6l3V8LpE33/1vOiKsDrzeaGK/nPbN
	 Ps8EkwNmMpubGrQkTrrLQCeLvBrIlnaVSPUH2ob0bggbcOTLpGtr8rYI7pqpkMt92F
	 A0UYPs9rqghwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B15C54FC6;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 0/4] clk: meson: Fix an issue with inaccurate hifi_pll
 frequency
Date: Fri, 06 Sep 2024 13:52:32 +0800
Message-Id: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKCY2mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwMT3bTMivjknGxdMzOLNPNEw0SjJEMzJaDqgqJUoBTYpOjY2loAryT
 uhFkAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725601955; l=1915;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=g01KSPJoXIPurLe84AcyOHvY7DI2Ak8ynhEFBJfoOtg=;
 b=XOPNho1g4xaPZsvq42GBw4qtdRF1HzWnaEFGPdOhELlSCEJOlNnmLj11KCyoC+vmwCDfw/SzU
 R0GqjapV8XlA3dJXBmuCQcEr9UMihJD+wZRxX8G2C3dd7VdbzhpMB49
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_225238_585110_C969E713 
X-CRM114-Status: UNSURE (   8.73  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Some PLLs with fractional multipliers have fractional denominators that
are fixed to "100000" instead of the previous "(1 << pll->frac.width)".

The hifi_pll for both C3 and S4 supports a fractional multiplier and has
a fixed fractional denominator of "100000".

Here are the results of the C3-based command tests (already defined
CLOCK_ALLOW_WRITE_DEBUGFS):
* echo 491520000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
* cat /sys/kernel/debug/clk/hifi_pll/clk_rate
491520000
* echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
* cat /sys/kernel/debug/meson-clk-msr/clks/hifi_pll_clk
491515625       +/-15625Hz
* devmem 0xfe008100 32
0xD00304A3
* devmem 0xfe008104 32
0x00014820

Based on the register information read above, it can be obtained:
m = 0xA3 = 0d163;
n = 0x1 = 0d1
frac = 0x14820 = 0d84000
od = 0x3 = 0d3

hifi_pll calculates the output frequency:
calc_rate = xtal_rate / n * (m + (frac / frac_max)) >> od;
calc_rate = 24000000 / 1 * (163 + (84000 / 100000)) >> 3;
calc_rate = 491520000

clk_rate, msr_rate, and calc_rate all match.

The test and calculation results of S4 are consistent with those of C3,
which will not be repeated here.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (4):
      clk: meson: Support PLL with fixed fractional denominators
      clk: meson: c3: pll: hifi_pll frequency is not accurate
      clk: meson: s4: pll: hifi_pll support fractional multiplier
      clk: meson: s4: pll: hifi_pll frequency is not accurate

 drivers/clk/meson/c3-pll.c  |  1 +
 drivers/clk/meson/clk-pll.c | 22 +++++++++++++++++++---
 drivers/clk/meson/clk-pll.h |  1 +
 drivers/clk/meson/s4-pll.c  |  9 +++++++--
 4 files changed, 28 insertions(+), 5 deletions(-)
---
base-commit: adac147c6a32e2919cb04555387e12e738991a19
change-id: 20240904-fix_clk-668f7a1a2b16

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
