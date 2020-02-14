Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB03C3B19D
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 15:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB86F24689
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 15:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OnHf+34Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rKy42ZJo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB86F24689
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1628tCfLyzPyADBTzHAWOWHahyoMhj+Xe43O7vaVC8=; b=OnHf+34YgQIRsk
	1amzW+aYYgtDpFkPn7WVPYrHRAH1vvLKdc1jKngsPD/iwLA9x5k5rMAs+dNJKyqD5PVlZ7z3dOrHl
	YCddTGZYCW4Hs16qXpsaPIfApw89qe63bPAtq4Nq+rd903Kmgm2EyEMxEOAt4Mv+ZXXfqYfSmMuOk
	tvbESFu2BBDThTRyXnGlWyC5oWVFgw9gwa2993el+oZqPESrdPUBQNl4Wm0wb5q/LMbOxVlOBn+3j
	2aZXxaAZ4CVhXvacwXctoLECF3tF92XV4tl9a2ZRO6BeXLPBDa4KVyub5tErTnqj5Fz+YnPZjCUng
	Hzc7mSMKAlB+QW9kY85A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2dEU-0003V8-Np; Fri, 14 Feb 2020 15:50:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dDX-0001Tt-HZ; Fri, 14 Feb 2020 15:49:24 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96B7A2468D;
 Fri, 14 Feb 2020 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695362;
 bh=dxyccyigJhbpHPCQ2eWhVt7tV6C/oCPf9Cj4BDUW/vo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rKy42ZJogbJiVIB0vxRQpET6l3+9EMQzeXR3cbqqH8r+dLG4Yki40Q9/vXKPyLlrc
 7yarKQN48r11rAJTbgoegpieXLNbyRaunXVlD11md8ai+gnUkGIwD5JzMZ/z3I1qRu
 wUUzEpM4edvipZ9eOVQlKEwgxeAw88EDe0+iSd1A=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 021/542] clk: meson: pll: Fix by 0 division in
 __pll_params_to_rate()
Date: Fri, 14 Feb 2020 10:40:13 -0500
Message-Id: <20200214154854.6746-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_074923_662076_F0C2EADA 
X-CRM114-Status: GOOD (  10.11  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Remi Pommarel <repk@triplefau.lt>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Remi Pommarel <repk@triplefau.lt>

[ Upstream commit d8488a41800d9f5c80bc0d17b9cc2c91b4841464 ]

Some meson pll registers can be initialized with 0 as N value, introducing
the following division by 0 when computing rate :

  UBSAN: Undefined behaviour in drivers/clk/meson/clk-pll.c:75:9
  division by zero
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc3-608075-g86c9af8630e1-dirty #400
  Call trace:
   dump_backtrace+0x0/0x1c0
   show_stack+0x14/0x20
   dump_stack+0xc4/0x100
   ubsan_epilogue+0x14/0x68
   __ubsan_handle_divrem_overflow+0x98/0xb8
   __pll_params_to_rate+0xdc/0x140
   meson_clk_pll_recalc_rate+0x278/0x3a0
   __clk_register+0x7c8/0xbb0
   devm_clk_hw_register+0x54/0xc0
   meson_eeclkc_probe+0xf4/0x1a0
   platform_drv_probe+0x54/0xd8
   really_probe+0x16c/0x438
   driver_probe_device+0xb0/0xf0
   device_driver_attach+0x94/0xa0
   __driver_attach+0x70/0x108
   bus_for_each_dev+0xd8/0x128
   driver_attach+0x30/0x40
   bus_add_driver+0x1b0/0x2d8
   driver_register+0xbc/0x1d0
   __platform_driver_register+0x78/0x88
   axg_driver_init+0x18/0x20
   do_one_initcall+0xc8/0x24c
   kernel_init_freeable+0x2b0/0x344
   kernel_init+0x10/0x128
   ret_from_fork+0x10/0x18

This checks if N is null before doing the division.

Fixes: 7a29a869434e ("clk: meson: Add support for Meson clock controller")
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
[jbrunet@baylibre.com: update the comment in above the fix]
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/clk-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index ddb1e56347395..3a5853ca98c6c 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -77,6 +77,15 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	unsigned int m, n, frac;
 
 	n = meson_parm_read(clk->map, &pll->n);
+
+	/*
+	 * On some HW, N is set to zero on init. This value is invalid as
+	 * it would result in a division by zero. The rate can't be
+	 * calculated in this case
+	 */
+	if (n == 0)
+		return 0;
+
 	m = meson_parm_read(clk->map, &pll->m);
 
 	frac = MESON_PARM_APPLICABLE(&pll->frac) ?
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
