Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46230ECE579
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GA2eh0UVSaHuuBNfJ9u9GVgHWD8/dHPWmEFcUteSXkY=; b=DsciNvrt5JB5IH
	MH34ze1ayHVnAwsIrvBCvo7zIwTlyBgMEVg4RziLxsV1nU/Q39jIgCt1Erp8vbSWgcyaSUETewlPd
	SdX0wys4Bq22PyQyckB1eaArujbp3viIvJSymtjhhPmRI8XV34/4/EkQhs7svNBhgnwSE1pqCa/Qb
	FLXZbe8r4p0DlLAZG2AaqTEj6JmvaIlWuZKYTBSlP2ykTxA2mHcfmM/diKOlaVlQPNoPLf7VaSf0R
	UQhgw/mbFgzYeZFRjebTmTmF7SgZ+ka4rS/d5YBxxJOIvF9MH2IMHTdoqfxSfmfZ8JIuANRAXigce
	E/KYh8y1ZWkDw4/Of+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbMj-00000001SU4-2Stb;
	Mon, 09 Sep 2024 10:11:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbKg-00000001Rt4-3rAZ;
	Mon, 09 Sep 2024 10:09:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3490BA4325B;
	Mon,  9 Sep 2024 10:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51807C4CEC5;
	Mon,  9 Sep 2024 10:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725876557;
	bh=C7UAKdScvu7TqeOxKRUYoZYp71CrNXj0fxW/6EE1p80=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=iKyCT0K4PzGo7YlCMs9PzcPsdrdRWcCagpOicLeWx2QXvdGHcsUCP0R1ITAqC7/Wp
	 E39v1EUTbBMaB+/8BFEm77O0FKhrpOfdzHPmVcUjnWM2vuMyriNhQhNPS2248EopWj
	 K53PW0E1GKISSSCng980tExiLdy/SIA8Gu3PUHT6cBwh9tGlyd4VwO493u0Uz7i4YC
	 ELe2jOCl51RFzdWoRxpa/OxoXov222Tw/PXg0r74UhFRwn0Vp51P+ZgD3zKXs0Qoxb
	 LxAXZBmxn3c09Ra+dy4nvDnQp58YUPy0oLyoWu9opG8fdQVcpfTmNF4PCIllpeEnih
	 FS4Jvtz/ORz3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1D2ECE57E;
	Mon,  9 Sep 2024 10:09:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] clk: meson: Fix an issue with inaccurate hifi_pll
 frequency
Date: Mon, 09 Sep 2024 18:08:55 +0800
Message-Id: <20240909-fix_clk-v3-0-a6d8f6333c04@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADjJ3mYC/3WMQQrCMBBFr1KyNpJMS2JdeQ8RSdNJO9g2kkhQS
 u9uWlBw4fLN/PdmFjEQRnYsZhYwUSQ/ZSh3BbO9mTrk1GZmIKAStai4o+fVDjeu1MFpIw00UrG
 8vgfMr610vmTuKT58eG3hJNfrp6G+jSS54FBrjU60GlCfzDj4juze+pGtlQR/TMimNmVdSWzAt
 u7XXJblDTHE2i3aAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725876555; l=2168;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=C7UAKdScvu7TqeOxKRUYoZYp71CrNXj0fxW/6EE1p80=;
 b=r9wUHlsoq+nN2A4qwXV3+SL+QBGKsPgq1dITS+PtSp9p0RSpqv12zxxoy3xJOqTi6JUlv6j19
 abISxvo8WXbAgvtHG2Kc1n/BF7CodJCx2fpxzYaOaXsQOac3SIrYpkN
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_030919_124822_BF7847DA 
X-CRM114-Status: GOOD (  11.21  )
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
Changes in v3:
- Drop the call to unlikely().
- Link to v2: https://lore.kernel.org/r/20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com

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
