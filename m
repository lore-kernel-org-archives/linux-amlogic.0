Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1860DCE7AFD
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jE8Z4eqIRDXK1HYKHz5PuV5TeoDlsXR9Rej38TCfEJY=; b=FDWYUD3MeBPCb6
	2aX3V5XvTSdH5gtrWQWWSZ1AxFP/QUzk/Mjkse6OEmPJPhwDtqf/Sn8CJq1Wn48VrjDVszCR3A56T
	famvryjxZY66PW7JODsFCcwCzlHYE5QfSfNzHWZ5oI11Xz76QOVbXZy7d8wnPA+XnIXvFuE2euety
	3KN8snz/nGPX4v+Q+ewpy7o4f0LIvmmBU6fuCbTCLh+wZqxPDfLyAEVy13NxmcnTZ/PpcJh3APSIB
	Bw4y471iO3H6UR6aKXXLn85vXC3Ewc71f+CHRuOJ8qO3sq4uEBgKJa/ElbRFewN7VBknSLwBUkqpZ
	YpLN1h1nUTUL6jElFeDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWJt-0000000Bmhs-2b0b;
	Fri, 06 Sep 2024 10:36:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWIt-0000000BmTX-1Cms;
	Fri, 06 Sep 2024 10:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15DFF5C5BFB;
	Fri,  6 Sep 2024 10:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20D86C4CECC;
	Fri,  6 Sep 2024 10:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618898;
	bh=uCQdKOYsTP4hrdyMRlGaCSGI01VPRdBPeBN372SaHDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hCC7ONT/cma4aU4Z+r81N9RKtxKkYiwnLLzscmNvctmk6zKdwO5veqtwaJfrH6tGL
	 rX3BAgm1wS+ptOGNdEucxbMgzafuu+ZwE6ArALAFYpXVL2qnD1oqB4FsHFkwOKCd6H
	 3d89x0ihJso6L7UdL537YUJDILXENHayvC2n5SwL92huhMU0F9gXyIJ9HRFrVIUUru
	 O+yz3469o2aOf7/7oMjjxP0F7W/aGC3HMeWR2btV9WkVkRJSSZvK5qE6SD/Qo4evm6
	 +48d/CSoragLY6ILimAndiWNIgEAtiHqexOmqswOTYdoWK9w8whsg8lJZQuT5OpXHH
	 c1gOCnSIU9xzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16738CE7AFB;
	Fri,  6 Sep 2024 10:34:58 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 06 Sep 2024 18:34:42 +0800
Subject: [PATCH v2 3/3] clk: meson: s4: pll: fix frac maximum value for
 hifi_pll
MIME-Version: 1.0
Message-Id: <20240906-fix_clk-v2-3-7a3941eb2cdf@amlogic.com>
References: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
In-Reply-To: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725618896; l=793;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=0Clx6bfIj6hxSYsk/ARky+mR6oBy1RRrZhsjk6VQ2QA=;
 b=ThDaSqaw71UK6w/lWibNMR0YeJltaOgEuPPvwpd+6M1NwIFlx1gS3eMXr41yBZug7ojGK0sGw
 EBsrcnT4InBBrsES6cADjt0jMtjpw4fJjYCzE5zDZzNdk8sEla4Wvfn
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_033459_429734_5262C4EE 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Chuan Liu <chuan.liu@amlogic.com>

The fractional denominator of S4's hifi_pll fractional multiplier is
fixed to 100000.

Fixes: 80344f4c1a1e ("clk: meson: s4: pll: hifi_pll support fractional multiplier")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/s4-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index a97e19057b05..9697f6577e06 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -371,6 +371,7 @@ static struct clk_regmap s4_hifi_pll_dco = {
 		.range = &s4_gp0_pll_mult_range,
 		.init_regs = s4_hifi_init_regs,
 		.init_count = ARRAY_SIZE(s4_hifi_init_regs),
+		.frac_max = 100000,
 		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
