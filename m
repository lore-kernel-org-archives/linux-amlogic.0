Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22058CD5BA4
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 05:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYXVDYyvPKhS9neOmX7pyh/hzv4CkzyMY9BkwPe4H/Q=; b=s5Jum8wKtDoTp6
	DYWGQcRYD1Dexf0O3fIE8+kfl+kG3awBgmWgA0EO68q7G+RWWgMKqKbxXexqGCCVQdm4DJYUjSdxR
	EMGebo5JxFceblwEtmoyQPNxbc+8MYNozaLHqDnPZ4weMbVH2kI02tji93w9ES2A2NwsX2xEhTP2O
	ucq23wAVZgUYMCwaJbFvRcp5pMQaSTbq4xZzVNeZwrlM4QG3lkegjS3cQxIGKTA8Ez2SqOwWPeKE8
	AYHFnuORe09VMjGe63G1WyPa9XVwHPeeBNRglMZA+3swns9Yr4cA8T02GI7sK+NbsRfs0P9t+Unvs
	e0GB0VUze30gHiyvqt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRvb-0000000Amgq-3DIj;
	Fri, 06 Sep 2024 05:54:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smRte-0000000Am1I-2L7z;
	Fri, 06 Sep 2024 05:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0611A44671;
	Fri,  6 Sep 2024 05:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D445CC4CEC9;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725601956;
	bh=S3mFqsYvIRYGegsx08fYvuzsX6Qwu4VsDx147bN5fYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YCUAAoKkVzT2EMiB9d27VUcc2cwtreBRMnj8ACMRtWT68xLZHapaFd8VxJwPlmrNa
	 eXlp8EuZ4p9XYAKbWECgqunAnmbTcFPuU+zFacPZMnNYhA/UO+/Ea8XeXy5AJ/cIHB
	 D3Rerl1wyv3x3kN56BxKQOMO7+xAshSmTWIECqT7GapOdkQQ+3b3ApMdB26UiuiJzs
	 fM0m17qCQEL0zynEU1HvIhsQawZeiSyjfqWCehYLajnCZRze4v3up1WYLrTQEHE+Wo
	 UazDJJwgOj+eQZZArA24Dv+IghHu/ATxBBGjk+1LWiAxTikBDV+o2Mv65hn4gr5Nrc
	 A4uZUJi2Nikwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A64CD5BA4;
	Fri,  6 Sep 2024 05:52:36 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 06 Sep 2024 13:52:34 +0800
Subject: [PATCH 2/4] clk: meson: c3: pll: hifi_pll frequency is not
 accurate
MIME-Version: 1.0
Message-Id: <20240906-fix_clk-v1-2-2977ef0d72e7@amlogic.com>
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
In-Reply-To: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725601955; l=836;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=M/IqRKmFgbyGrESbxg574FVPvS6H4iQmlVvP8JBwBMQ=;
 b=fchMifHrKQ1Qtl5EJeyYwqm5AFN+WR+v2xXBG5jYR5Bv2xcf2EFq/9m415BdgCEIMgcTOHG5p
 ZLaESWUH2lsD2xDLkYxGRCwkuqlxfJmrulvCl1A4FRfKItaqvJsnTzp
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_225238_899954_410464E6 
X-CRM114-Status: UNSURE (   9.25  )
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

The fractional denominator of C3's hifi_pll fractional multiplier is
fixed to 100000, so flag CLK_MESON_PLL_FIXED_FRAC_MAX is added.

Fixes: 8a9a129dc565 ("clk: meson: c3: add support for the C3 SoC PLL clock")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/c3-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 32bd2ed9d304..a350173efe90 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -361,6 +361,7 @@ static struct clk_regmap hifi_pll_dco = {
 		.range = &c3_gp0_pll_mult_range,
 		.init_regs = c3_hifi_init_regs,
 		.init_count = ARRAY_SIZE(c3_hifi_init_regs),
+		.flags = CLK_MESON_PLL_FIXED_FRAC_MAX,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "hifi_pll_dco",

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
