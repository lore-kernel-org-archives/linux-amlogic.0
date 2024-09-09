Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5FDECE584
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jE8Z4eqIRDXK1HYKHz5PuV5TeoDlsXR9Rej38TCfEJY=; b=GgXBv1K/+8/hig
	b0l0/6RYNLMa9w4B1KVlYt1joUL3b1OZwsLYlnqA3xn1mzv8O3IzS383Ekxq0ADAiR8SifIl/X3Ev
	0Hnl/9gL96NoEarSNqQX+o8eGr9GaZrWb0IQKMSiycjbBsUsoR6HYUEtcqv3Z811r11lWO8HLpGLq
	ntq124l2E/1j/eiGg00XY4us/f+rG0WhbKqlRPJ4zKmYyuLv/riC3KN46FDvFtKqqsKU4Rt7Pf8Qs
	/mIWo01qJmAT9W8QfgDt5kbzRH4jOWIGrAli9OEZDgYf+iApIH5RpMq66MUPe0kN2ZKvLh7JekD6c
	v5Phnz05hVHgjY/mWZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbMj-00000001SU0-0vWY;
	Mon, 09 Sep 2024 10:11:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbKh-00000001Rt7-0Us6;
	Mon, 09 Sep 2024 10:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89F675C5645;
	Mon,  9 Sep 2024 10:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 754F1C4CECC;
	Mon,  9 Sep 2024 10:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725876557;
	bh=uCQdKOYsTP4hrdyMRlGaCSGI01VPRdBPeBN372SaHDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PxQNulY87u5/JVzGFlANjQm8D2poWanBScahXoiT27qgfOSZJACpHGAKBue0+w106
	 4bjqgF5BjlV+hBr7D1a8vUjB5I2azY+QXIoT/hLJtFkutf5Qb2lRJT4KfiW2JKhCLY
	 Rri+qgrEymZw3p9Sdtt9qJK4RXI39CwQKAkrdfZKF5P5E/ysSGC1swIFqBwmgfG0pG
	 6uQ3NbcnaeEhN0Go1fhycNqQMx4em+pr3AdPY4YcbU3hbPAw8CtdgBqs9tdEBkVg60
	 szsJB+W7ocdADklMsXVdCzUDnQ6fI3flmLP+TqyXxbhq4asqNqQ2HPMenrBhxTDJMa
	 cEvKwA1aNWOOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BFAECE584;
	Mon,  9 Sep 2024 10:09:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 09 Sep 2024 18:08:58 +0800
Subject: [PATCH v3 3/3] clk: meson: s4: pll: fix frac maximum value for
 hifi_pll
MIME-Version: 1.0
Message-Id: <20240909-fix_clk-v3-3-a6d8f6333c04@amlogic.com>
References: <20240909-fix_clk-v3-0-a6d8f6333c04@amlogic.com>
In-Reply-To: <20240909-fix_clk-v3-0-a6d8f6333c04@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725876555; l=793;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=0Clx6bfIj6hxSYsk/ARky+mR6oBy1RRrZhsjk6VQ2QA=;
 b=kW8tt0TPN5U0gdUFRbA8YWbIIehLdHdhtzws/z4AezrasCh7v4VlykiQ5tI84OkY62bcGPxlT
 z/4cFfsxf5RDwcO6cTBms1LwgLJBDWjner2BfweVSBII5r+prmbwmco
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_030919_233436_551962FA 
X-CRM114-Status: UNSURE (   8.59  )
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
