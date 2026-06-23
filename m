Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF67CDB470
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jun 2026 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gCs/X9+/Cl5FebfBD9iLXeD2QDd+d6JRPY8aPjnoq/o=; b=WqlUu6Ed2oAjX4
	KoL/v+cFkZsscrhaQHU7jYj7YW3jupwDcRL4YpI+g0Rxqck4HI+t9G/vjtn6zKlbwg/BAiTk7FQIV
	7bt1j8+qOBwXVELC4B2MqVn8oYxCienh1HXX2h/TyPjLdsTlO5ASWjKTfif/5IcU5AYm2wuoxVukT
	v+R6mW5ul/PI848Opat/hKFKcgzKt7XRr+BM1In1+Q0H5HFPoFjXi+o9ishN3FzCqry/gMST+EeVD
	JGkyovsiLrc0W/Y0ueqWdYsDTYKtMuJst2RgBoDDos5KCBWOtUr9WNonFc/4me6OPuiJy2aau7x0x
	OLVEDhMJcfz2JbQh3x9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7bL-00000006q7k-1Spl;
	Tue, 23 Jun 2026 20:20:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7bI-00000006q6u-1rgx
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jun 2026 20:20:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45fe59255beso181814f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jun 2026 13:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782246003; x=1782850803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuzHGLvmYUwhc8I6yyvP2EEo7aup8Z3LHV+PsMNUuA8=;
        b=G1WW3fD1bJQgTbWgxgA4y+oOftpuBhX5oj42MgCySpgfXabxIZlKtNjY2/+YnUDoPr
         bIuZZkAKC0cVdk9cpfMWo/tmfr2CmI5BX4RV6vTzZG6NbRLbn14a0J2s8k+bhjfLW115
         q+3vL7qbp1lvpefWksHPR1AYpcxcQPH2SmWOzkMNxO2+WmL5kbqmkF8ePQbO/RrV7a++
         8F9rgS2I+zObvlDhCPrAXpMdVxErUgMMzXf7YPZPMFxjOPxTVPCf8dqhXc6S9wEvHTBV
         rOBi4ScDHmXrbO88wBS+3vba1ewvRx+dplz7I1kRKGboNihqA36xn2CDZGua9Z8qRIWB
         cMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246003; x=1782850803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuzHGLvmYUwhc8I6yyvP2EEo7aup8Z3LHV+PsMNUuA8=;
        b=S8m913XpkC/O34FOMfSMFlKYctUVuHMDfsWKMqMSi7NMBKn2ggOpc9YCMMugP+zbw0
         ifquXHaT+TKiN4nrCP61xjk92CjFa/lO9iR2S9hsvc6gE4uGvXPWToi4Kreb9CEwnUJq
         SMde8OkGG+JVt8UVcjsfukWuyjuBYc8XM4PZsW+xyFuUm2T7IhmToLT3sGoJHQNzbCtU
         0ZpoUskny+tBykxfwkAoqSkL9p53Xxg6pz64TIey40zmwk+CXRLW6nZKOQ3a3FwbHF4h
         qKf9r/5snNz2/YRerTffBu6wuJT0EXmsJeC/J7MWqjaYGxBnHd8YVsZ2na4YTjet+e2u
         Parw==
X-Forwarded-Encrypted: i=1; AHgh+Rrdi/3YJMMNtHFsj5IzdKD8BlW1SPkZFE3bRYZ/UXy5rUIifi4jRDanU5u2HHAMDJvczfMBubpwAqPABQmb@lists.infradead.org
X-Gm-Message-State: AOJu0YyLCCf4gofsQ4MkvEAIjUoH0+qLG30XKrQEIcOf4gQgVx35xJKm
	iAkQfku5FEVt30li0LFAFsuXVjW0XinXbhJj4uTtN3Cqjg2D39rg+zZD
X-Gm-Gg: AfdE7cmx7ogDOjyx8pQKz78Pv6PokLObLNR81XYETjKVXvJTE2zCItc/svC30nT+kSD
	3Q5lIg9gJv+62VWlmMSJEPCkPoOCLKrRLTNRvAYQ+G3HiVxWAHo3JbySaeFbbOpEayIdTh2dfxH
	5rFpI/1dDdbzP0hm+q0AdzPSoHOJdWnc84/dxP/M3wRKNUzvFOjk+KPr3pKPfLrtHrFeUO49/eh
	9t4Uxam2B2ryjhAaGzvEhTtC7vAhHWs9O4Bw/LbEYhqmUfJd4Sx2eNei2mwDX+SKeCJV5PWpw6R
	uPaQqfUyZXYBWTHVdmt/QXj6ifWAox84qQgx5+XC4nGw4xxIF2cH9T/Fti+f3fitukVyasIIieH
	71yz9Ap1nX2pF46O/3oXSVZLvNG1hY8QtphBdTG+aEseAhFjsXmtRwY2KO7D8BNu7tNy+PebW55
	Ep+pyvAucLQfcI2/HMRj6m9QT4Up0TIyUM43eDYQhH8DcR3UZrDkxelD/gRqHueUCKSuTsI4C4t
	EZ/NAt0OL2Vyz0q2h9LiceIT2OqE1UjXMUeR6/5KyE=
X-Received: by 2002:a05:6000:2507:b0:43f:dbbf:6d93 with SMTP id ffacd0b85a97d-46adadd2122mr7876270f8f.27.1782246002550;
        Tue, 23 Jun 2026 13:20:02 -0700 (PDT)
Received: from blackbox (dynamic-2a02-3100-a9b8-8b00-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:a9b8:8b00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c3bsm189460f8f.10.2026.06.23.13.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:20:02 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Tue, 23 Jun 2026 22:19:56 +0200
Message-ID: <20260623201956.1324992-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_132004_512428_2EC1902E 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, bmasney@redhat.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

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
---
Changes since v1 at [0]:
- fix typo in my own email address (apologies for the noise)


[0] https://lore.kernel.org/linux-amlogic/20260623201522.1322463-1-martin.blumenstingl@googlemail.com/T/#u


 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index f9131d014ef4..d432e08d1777 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1394,7 +1394,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
 		.name = "32k_clk_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = gxbb_32k_clk_parents,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gxbb_32k_clk_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
