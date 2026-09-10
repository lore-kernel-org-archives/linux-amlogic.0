Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A58C79FB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ey3nZVG2Yqzss2rKKQWYL2LXl2r8aEFP1KDx8hQMre4=; b=kjsm8KRfcBf6JA
	SClhx70yFxaAMucBh5nQJcuSHsW4A+eFkfdFehTM4K+8cMg2Yh/AqS+SJftZ3NhedYwELyvXQ7EEc
	DkzWn3RPv+kMNBNYEAZAx6VzG1bt5AFRCXus9ol1Q/QKMmjf058swo8jV/b7wxP/CEeTTgNHwyUGx
	jjYu6Pzml3DPPhLc3Plnprg1Cgh4C8jlFfxBqiOt7I/MNjhRansnz4UmpFaBbw1EFVRULDXABfP1m
	e9qf141LllH1BNJcJ0CeAVsHZwbtAIRd2iNgbeol4vfywR3O+Wn9vQFbpf4MtxPwC87xPrEBFGqnP
	n8+noktNHMe9x3wAARsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z8w-0000000DcZd-2veI;
	Thu, 10 Sep 2026 07:24:22 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z8t-0000000DcXt-3Hag
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 07:24:21 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso12510445e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2026 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789025058; x=1789629858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPxNHkZ825vy8qHU6Jaj099Tz7xshHGr54ytMScKCjY=;
        b=Ec/LM9Gb2dwud4UjwRoMpgNh9UsapwdBOiwWjfNvBXFdQDEXQkFBgHuc/kWvYISVpj
         LhRO7B1gNUBLgkzSDIzKZrt7v77vO1VqsdtD7HbxBUhJoqEUCz4oqeLWJbNyUn5jD/bV
         xyRvPICuIOn3J906xdQuOaMWXNM0wkzL093wtiyCwTBTPmpmUbHF5rNihLiWsrhOuU+9
         NhImlKSNsx/cQujZ6zCaqcQoyyzBTHHEU4uC83orRNHbudml6R/jRPtmOP21irwZhzY9
         nEnYOgIH0ftrtHZHpj4chIx9QatVogEsPGMZyyEdvff6cesEDgfioAO/2q07v6BLmb+Y
         fgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025058; x=1789629858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPxNHkZ825vy8qHU6Jaj099Tz7xshHGr54ytMScKCjY=;
        b=NOk6BNABPc28f+vMGPFRCfx1amsK5y1AAlQuyeDH/r+NXQKYprRCUAuUZcUNm8l2TW
         ufin3CGubP0Bl+/0p/73d8h8o4+g4G7rGLj5dXUd80M/jxUdhLqMcbkPkh+4rtZzUyAU
         tmp9x18gQrCWIlIFVUGxrRCH0lFVgX1BaFutZRi6cTai3xctzsLRhrByo+dNBzccQ4yG
         A2bFBBFebwaFe5UGOdC5VWnuQcHwbOATue6ykHI0o2RiFva8VqSpdJ7hfb7foaxYm0qf
         lWdiAiZiVAM29Y1FFI3kmSa/15w9x3aaOJ1Guq06uoZSIqf4QVPlNwtGKdkcCeL911EL
         tCsA==
X-Forwarded-Encrypted: i=1; AKwUvBzTiAOm9vwWvQDWzpWI+Fa7tnas8mUc/MoHwXRZ6mYxR5DAtnSPvb+bvscBt3iLyFxyUf/GzZnTyjbTZ/rW@lists.infradead.org
X-Gm-Message-State: AFuF++l7oeCiTPTg0GWSn828kgbXn6F11f3Cja4FPFjTTPss4TLeV3CJ
	hgUujHvfUTvWgh2OEbWHOzaZGc6RlK/vIPUlQejhm0UkEe6RSW5bhKdBJ1yoXLCWf3Q=
X-Gm-Gg: AYBFou2IrTpjeQ6EcCkII/O0W2Jpmc6FEvHRWcc17IESQZC5JnOHaAmCvuoN8gib7Qm
	+EZB9ak+sGE8fo4V4Kbt/uSD/jhdFBzVp24Q8j/OuWuNyUz7kHC1H6jEh3T4yEdM24E/tFVnWo3
	pA2L1Cg9YF88vO+CDygV2d3QzVN98IVK5iV/jp0reYlVnA84/wep9e8Bu4I5sZtT0eNfEODLbM3
	waxrdn2HIx++jIbWR+P7THQRjL2rw6ovcCMFffxA7h7vf2k3wDQT7ERmYz5gSE60sSyBqOLUElH
	j6GJzZwGFb6Ib0E5HsSS2dE14D1bJ6hKs97ppAgml9ersERJPBTcjz/vjkhyGFBrpY9fsR8FiD0
	BRqElyZcXRTR5XNfuYn6Orssxi/3djG2FuZeIGmOPB8jZAzdiZD3Y9UyO6zNNZE60d9oOfqVCYR
	LxejJkJSfIF9X/G+X1Yz4c+rQJRKorx9mWwpz0YOvtVPuJ1246i/mpBeNJ/iLGtNClWs4AerKW3
	4lCXwf0DYChhhR6/A==
X-Received: by 2002:a05:600c:1d9a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49d258ef83amr119431425e9.6.1789025057742;
        Thu, 10 Sep 2026 00:24:17 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf332esm47937635e9.8.2026.09.10.00.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:24:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: stable@vger.kernel.org
Subject: [PATCH 6.6.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Thu, 10 Sep 2026 09:23:47 +0200
Message-ID: <20260910072347.317012-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026090928-playmate-skating-2109@gregkh>
References: <2026090928-playmate-skating-2109@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_002419_845460_86C25237 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

The following out-of-bounds read has been observed by Christian on a
GXBB WeTek Hub:
==================================================================
BUG: KASAN: global-out-of-bounds in __clk_register+0x1b70/0x2418
Read of size 8 at addr ffffd66320cf88e0 by task swapper/0/1

CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc5 #1 PREEMPT
Hardware name: WeTek Hub (DT)
Call trace:
 show_stack+0x14/0x20 (C)
 dump_stack_lvl+0x74/0x94
 print_report+0x164/0x4b0
 kasan_report+0x98/0xd8
 __asan_report_load8_noabort+0x1c/0x24
 __clk_register+0x1b70/0x2418
 devm_clk_hw_register+0x74/0x15c
 meson_clkc_init+0xd4/0x20c
 meson_clkc_syscon_probe+0x5c/0x94
 platform_probe+0xbc/0x17c
 really_probe+0x184/0x844
 __driver_probe_device+0x154/0x35c
 driver_probe_device+0x60/0x188
 __driver_attach+0x168/0x4a0
 bus_for_each_dev+0xec/0x180
 driver_attach+0x38/0x58
 bus_add_driver+0x238/0x4c0
 driver_register+0x150/0x388
 __platform_driver_register+0x54/0x7c
 gxbb_clkc_driver_init+0x18/0x20
 do_one_initcall+0xb8/0x340
 kernel_init_freeable+0x49c/0x52c
 kernel_init+0x24/0x148
 ret_from_fork+0x10/0x20

The buggy address belongs to the variable:
 gxbb_32k_clk_parents+0x60/0x400

The buggy address belongs to a vmalloc virtual mapping
The buggy address belongs to the physical page:

Memory state around the buggy address:
 ffffd66320cf8780: 00 00 00 00 f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
 ffffd66320cf8800: 00 04 f9 f9 f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9
>ffffd66320cf8880: 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9 f9 f9
                                                       ^
 ffffd66320cf8900: 00 01 f9 f9 f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9
 ffffd66320cf8980: 00 00 02 f9 f9 f9 f9 f9 00 00 02 f9 f9 f9 f9 f9
==================================================================

Commit 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock
parent") dropped a non-existing clock parent from the gxbb_32k_clk_sel
mux but didn't adjust the hard-coded num_parents field. Fix the actual
number of parents of that mux by using ARRAY_SIZE instead (avoiding
similar problems in future).

Fixes: 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock parent")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Cc: stable@vger.kernel.org
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Link: https://patch.msgid.link/20260623201956.1324992-1-martin.blumenstingl@googlemail.com
(cherry picked from commit 628b6fee9fca292f12d07f0f1bcf1edefa949d81)
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 00eaca92b388..a6b46ad04794 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1305,7 +1305,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
 		.name = "32k_clk_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = gxbb_32k_clk_parent_data,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gxbb_32k_clk_parent_data),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
