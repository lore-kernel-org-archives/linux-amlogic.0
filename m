Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C65ECE7AFB
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TlfXoL9oe0zRQTLymA8qmDWVtxHiowcx9xCbU+IdsPY=; b=vaNDfOX8wWWYtu
	PQuZehyHKbwkFUP6dzokd66XZTer81oHiXszjPLlsGoN/e9yIClCLE3GIr5I0NFAEe9i/09m0/cqY
	qXpCS3NwCmHkcjcNtjO/3IoIrTVfpAmeSUHBmaKNNw30eC1XgWCpxmxioQm1+GmKTdsEyhX8hlgj1
	OiwCgm0PCSGRYO0DJQGHFNd8xJ5IFBfSjDOHTX0zJQhM/ZTwhs8+VyZP6VEcSRkMcoWuWiKYEH+iL
	9ypbBaNdSlq/kJeAxHkzhXT/Lbvw1XPIRUrUXvIvAew+/oHL4tVAuMV9yD3JpPVa8R8rqJfl6STzq
	bAMcOcbTXuHL23zS35mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWLs-0000000BnBd-0HQd;
	Fri, 06 Sep 2024 10:38:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWIt-0000000BmTU-0cI4;
	Fri, 06 Sep 2024 10:35:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EAFC0A44E0C;
	Fri,  6 Sep 2024 10:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1767C4CEC4;
	Fri,  6 Sep 2024 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618898;
	bh=7v54Zyw0i0C7dV0JkDzLhWAWLm9ZlK6RJGxHS8FL/Mo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DHQ3RjM51GgPIb4qS4GAWbKuBBFegHLtmS0VKUoFMJvkC+iJDqS2m8uqdH1vSAalw
	 nF9ThSuDHpEmRSs4eNHTJP1/mh37/x2v1WDmsX+YsfGqcEM7Gd6VlPLMM6V9hQAJnD
	 nKTBEyM3K0/Ke4s574Cd/oPRJl+eWjYkMQ8RxQFwip16hnmftJ4yV8HeLcMeceIu/1
	 Igl1rUHOgXx5ZzRSnWhc0seNM17anac1I5v4GYnjb50+3Q5b3oGnVcSZwfjwYWYEJm
	 LfCE92K7RYPbQqq5PHDXxQL9tAI9KVXIwtBVXzoVV4sZykIQKE4VU6x29fo9ArUydN
	 1KjZRPOMeb7aQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C958ECD5BDD;
	Fri,  6 Sep 2024 10:34:57 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] clk: meson: Fix an issue with inaccurate hifi_pll
 frequency
Date: Fri, 06 Sep 2024 18:34:39 +0800
Message-Id: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL/a2mYC/z3MQQrCMBCF4auUWRtJhpJYV95DisR00g62TUmkK
 CV3NxZ0+c88vg0SRaYE52qDSCsnDnMJPFTgBjv3JLgrDSixlo2shefXzY0PofXJG6ss3pWGsl4
 ildcuXdvSA6dniO8dXtX3+jP031iVkAIbY8jLziCZi53G0LM7ujBBm3P+ALL78/ugAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725618896; l=2030;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=7v54Zyw0i0C7dV0JkDzLhWAWLm9ZlK6RJGxHS8FL/Mo=;
 b=edTobeBEWT7l5dp1KG9XBG20u88x9MHA5yUkCW5VI+uHjOQNbuVboAoWqLOhYqX6RvsOilHm9
 HXorFqcrXw3B/6ASQW/BrWaJqJgVvTW+QHvSQGQrFADat7+1Bnw9rsd
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_033459_355977_F3BCB838 
X-CRM114-Status: GOOD (  10.68  )
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

Some PLLS with fractional multipliers have fractional denominators with
fixed values, instead of the previous "(1 << pll-> frc.width)".

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
Changes in v2:
- Added frac_max to the pll parameter instead of flag.
- frac_max is added to hifi_pll for C3 and S4.
- Link to v1: https://lore.kernel.org/r/20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com

---
Chuan Liu (3):
      clk: meson: Support PLL with fixed fractional denominators
      clk: meson: c3: pll: fix frac maximum value for hifi_pll
      clk: meson: s4: pll: fix frac maximum value for hifi_pll

 drivers/clk/meson/c3-pll.c  | 1 +
 drivers/clk/meson/clk-pll.c | 8 +++++---
 drivers/clk/meson/clk-pll.h | 1 +
 drivers/clk/meson/s4-pll.c  | 1 +
 4 files changed, 8 insertions(+), 3 deletions(-)
---
base-commit: 80344f4c1a1edec507a20adca476af84ea58cd4c
change-id: 20240904-fix_clk-668f7a1a2b16

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
