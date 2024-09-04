Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FDACD3431
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2024 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d29d/p/aVA5cD4N6TC0WkpKrBL43pQkS0ZsmmJ0Y0bk=; b=FNowZwML1QyyKF
	Oq3VW3MZNFgXEyDMmsOZbcgLmqtDyrgAWdcIa7RnN98BHnSeJVdNKz0tIJE6nLh3vjm41KZ9Nki+h
	2d8Uz3bYWkzz5FD45yamWEnkfYggWM6oAA0C4koGGsPSWWV9YjSuS3co1tIqMTQNWtkhOIoKxFdCA
	6jlQpE8pQfvwRPTHiPbP1YDqaJxTV3F17+THmuPJFc75LHJRmGCMdzl9+MSHeXU6hr+I6oGQDAKJW
	VSRTTi6TUnL1DYmjjdp3o4S5XrwqzLETzQDL+HcEipkCcUddo+gV4bXK19PbnthujsZ2oifjCZILT
	R5Kv/1/WmNY6xPPhoPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slkLD-00000003Aa0-2uKm;
	Wed, 04 Sep 2024 07:22:11 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slkJN-00000003AEP-3D5d;
	Wed, 04 Sep 2024 07:20:18 +0000
Received: from droid02-cd.amlogic.com (10.98.11.201) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Wed, 4 Sep 2024
 15:20:14 +0800
From: <chuan.liu@amlogic.com>
To: <chuan.liu@amlogic.com>, <xianwei.zhao@amlogic.com>
CC: <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] clk: meson: Fix an issue with inaccurate hifi_pll frequency
Date: Wed, 4 Sep 2024 15:20:13 +0800
Message-ID: <20240904072013.517905-1-chuan.liu@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.98.11.201]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_002017_808704_35DA31BC 
X-CRM114-Status: UNSURE (   7.88  )
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

From: Chuan Liu <chuan.liu@amlogic.com>

Some PLLs with fractional multipliers have fractional denominators that
are fixed to "100000" instead of the previous "(1 << pll->frac.width)".

The hifi_pll for both C3 and S4 supports a fractional multiplier and has
a fixed fractional denominator of "100000".

Here are the results of the C3-based command tests (already defined
CLOCK_ALLOW_WRITE_DEBUGFS):
# echo 491520000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
# cat /sys/kernel/debug/clk/hifi_pll/clk_rate
491520000
# echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
# cat /sys/kernel/debug/meson-clk-msr/clks/hifi_pll_clk
491515625       +/-15625Hz
# devmem 0xfe008100 32
0xD00304A3
# devmem 0xfe008104 32
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

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:  <linux-amlogic@lists.infradead.org>
Cc:  <linux-clk@vger.kernel.org>
Cc:  <linux-arm-kernel@lists.infradead.org>
Cc:  <linux-kernel@vger.kernel.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>


--- b4-submit-tracking ---
# This section is used internally by b4 prep for tracking purposes.
{
  "series": {
    "revision": 1,
    "change-id": "20240904-fix_clk-668f7a1a2b16",
    "prefixes": []
  }
}
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
