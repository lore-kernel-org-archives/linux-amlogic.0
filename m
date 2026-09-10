Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB5C79F9F
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9RCSgG7ye450MOqsPt188s/t8vm0+kb1W9ZhcCwcpg=; b=nLggXXAWej+zli
	KKMr3sBYnRncn9p/HR7p6m88SkA0Y1tJk1AdTfQ01ftDjV5lxDDfve9O+z1DOGqhX7s5FdO0+V7+x
	2gO8sl45hFMp+iP8y/qlUxGN+swu612DKcJbocDdMIbgGGdAdsPMLc3fU/xws5uZL3CpuUMHoxAuS
	gHXVVzpnaU4IDB9FNI1QoMF8I3nEiGZ0r1CJq23VKraxdiKH8Oazokb1d6ozLyJjadvfbixoY1CSy
	9aKzOtAzXXWzKtl2hxuz/pYIzVFEnIYJNXrgCDRhx/7MauByU4yBL9NKeVWHZdSDQXNo3mf8E/d7s
	zuShCBXYuI60vcXj+O/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z6b-0000000DcKj-3rOB;
	Thu, 10 Sep 2026 07:21:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z6Y-0000000DcKK-3gKP
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 07:21:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48586861639so280390f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2026 00:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789024912; x=1789629712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBWbvgVSsyhXVBg2MSypFeNWsM04CSfgVw/srqLzCR8=;
        b=esoDUma2p+MY7W7diEM2J3GoYE4nd40Jq+iGesEIddASQKWlz+N84i0ZuICZ1XaTRC
         +koXjCercikHRDT5GXLjrlNqUskI68OOWzkC0eTXAhgzrSMgDd96ap5UIFzhbVHK3xP9
         CaqdVmwpDcd7uwTDI/+zYK+eB58LVkdOdXaZ6v8wb4FAyvED5b/Ah2DfvuIeVSnNc623
         sbISk8uv2eGBRLRvVUh+qkN/7n//geZx4ifKbtHGPGNv8BAO5+gap+0IwogEOCgmbVZR
         ZU8l0PWWIJ4bpYVaOP2hUhFhy43OMwOVspkJKOldsjD4oopqqTyj4hZAz5uhHr2jQVaM
         wMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024912; x=1789629712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBWbvgVSsyhXVBg2MSypFeNWsM04CSfgVw/srqLzCR8=;
        b=qFY2QW77blLOwquiRGwrmj0pnBLsklxiqDRxzFSxSN9OBs0bqAk2gf21zA0KkEKhAg
         EPeGESMXbNMIcr6I7L3RlIY5ABBS/f7Aag49UjwYKO2bVB8H5cuEX+6LI+LvihNpAz6j
         C5/wWnhzQXGudK9c12u6fMjuEaaPgWx1jymUQH2GkPu8hnlmgGZi0UxTI8f35HChOL6d
         zWIlKmIkT3tk2H7u6imWtCnk48SEUNKCG9Bb+mZyCDpAQ15/IJgGdvl4dkZGAZrnkX1b
         USqmv3CoJOS7NeI7sx12DfEnvA5c8n7WbHHDBZp+MaJTETYdxjk1A/0A7vIW7/tqVgta
         MGMw==
X-Forwarded-Encrypted: i=1; AKwUvBy+G67sPsKt/0Ic+Wof4AyklZ+yrhvRyykD2e9MsaZ4LwbhgDOGUjXUFV2TSAjzra+Vt/LMcNwenlkIclmh@lists.infradead.org
X-Gm-Message-State: AFuF++mYrlu1FzrRm/PTXu1fgaH21qDk/saFV3CyP6mD+iLFb5y/H1IK
	1G8bcQtlKk54BnpzHbYalEWFEegMIoPqCWy3SGc6nYVLhn5HOurj+ttA/X1k0Or1japZAJG+/3x
	SFy3KU8c=
X-Gm-Gg: AYBFou2sVzr0+oAGPhvE9AwfYhBPxb6PkWczWeiwLo4rqnKzLGwOuw+HLbXtunHC1Ks
	yvmND8oT/BAFFVZc4PcD17VD3aPoPTo8xN9SvoIgxsKgbs0oBaaOJ9azQ6fVqgwzHGK0hAFkP+/
	ICf+DZLBTiJJQzWoOndSRFjolFHVn+BI1qXM6S5xWF5nMAP6Gpt1jJ14mDvM+BbMtmNVjUgb8QT
	Oyqzfu0SRSq9DaEN7t1805VeIfwsqpo0GNxqQDS+PPZixt1aogOHKU6Y25nUULgEh0pk8anzfF5
	ve9VGvWkaKYezzX3AqlBjc3GAgO44PHPGQLJGnlHYxSoy/i8LGFvOeiacrrMCblGQRyMdmpHElt
	0h+pWLDPoIo2BMoi988jus+HAzsgR2CxEkzglGtNVjJxRGTiSwVHbxCXWSkP+IkEMA+J3FmIWe7
	I13jiShhLXOKPeXlE3mfQdMmIi/1a3la3xwfQOP1C9YEzHwT1gjhmKAg3U0+zQLIuwgw8T4eTlv
	OBWVAn/bYZutM79xozXpMxoKaLT7w==
X-Received: by 2002:a05:6000:46d0:b0:485:8226:c691 with SMTP id ffacd0b85a97d-486e0f6ce92mr2725177f8f.16.1789024912542;
        Thu, 10 Sep 2026 00:21:52 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm51668875f8f.4.2026.09.10.00.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:21:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: stable@vger.kernel.org
Subject: [PATCH 6.12.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Thu, 10 Sep 2026 09:21:39 +0200
Message-ID: <20260910072139.313775-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026090928-nylon-handoff-edb8@gregkh>
References: <2026090928-nylon-handoff-edb8@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_002154_965732_FF009163 
X-CRM114-Status: GOOD (  14.05  )
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
index 2bfb0ab9c93c..39a6a31e796f 100644
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
