Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682C5C79FB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 07:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgEFkHTxnax6nFtUqQzYjHpb95DfDHCPOGgckJ19J3k=; b=dad+1LBPWmOGe3
	Rv0Y9IF9UBxJCfz8wrv0dE75QR640fnrRxlS/gSi9MzjeyJOaCuyy/3IYh2BbTTYG/GXfrKdOEtNF
	jfIQusdVgA4b76IftDt9k+AlWgkDxY4gil6pXGKCW7fkJxpweN3RSxsXQ00+p1qbnRTx7rlxZ+gnr
	pq0EClUr5G6YUQcBkIJ302CtZiFHQ68/WXwdkQ5XqgFmCjggAj3kip894uI56CEDWXGIdMZVzx2Mb
	QzC3mUxZehTDpifsIjXiBl1zT5Hcbbz4ig++ug/5z8EyRnylc/eQCmg0RHyPYi4MYf0ymP9FoWS4L
	S/78s67azNJptseimt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZEN-0000000DdOq-3jcN;
	Thu, 10 Sep 2026 07:29:59 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZEL-0000000DdOO-37EF
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 07:29:59 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-484366874b0so1091654f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2026 00:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789025396; x=1789630196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0jIRTzqzV3q4uOQGdtY2jprNAQRxNJzHauEVeey+qw=;
        b=gCIJG9vjemLfFQey7UsGhwBqRFUtCyGSRAmn6D1c0/WWt5cEv82UfAqdjOw7PTXLKv
         OVJIHeRHnqWBDe1d3xei5RXB+xwYxVIrtVAM5ZW1++Ag/HeRAOxMss4QNdScLypcYjZp
         jvIHWUZUl0mU5wtV7e3idKYWVpYZWZQtzk9vV/+G0xKKtqxHp964Xhnmis/HkyXFaJeI
         yCxX03ZY/KGf9YqzM6zmsho728Ft+QL7H8hv+9jPhwBmzSs4PApkhN/KW8L4NHNMaGKs
         ljMRhZJ/PzJ0ktOi8DDVNjED0HCX8ehC69Pn3KoOlslzDNtUNJDtokFnM9yNQ/BQiRZp
         cUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025396; x=1789630196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0jIRTzqzV3q4uOQGdtY2jprNAQRxNJzHauEVeey+qw=;
        b=ABbrQU4PBA6B5r2BdlHxrAgpA0UElsr/cmNGawde4iIZ2RxvTgyogaL55cu8IcRAck
         4uVHfuje06FH9Rfu4LazJ7J+m0rGUC03virJjRYdNoI2UiYr8SiAFXd4jaYa1oyIBlUW
         Dm5bcf3wyFw7exSw8s/QE0L9GOY35F4A5nZK/oPKWKTVQp0vjTEOCgtwZTOn40QJhKXL
         KD65TcO045QC63HoYQJXPMjV5ru0k8DVIsTgX2qWZTqlnjtPItADhHt6BLjIHceGFXO8
         Fm2u8uiVwdLUKX2YDzYWI8L0MwpVnJBMxo9ceJS3gzKe/Fj4KtePJC252wKbqxHxq8Jh
         qXPA==
X-Forwarded-Encrypted: i=1; AKwUvBz3hQ6S3lUXHjQu3ilR4BPAAMDx/yA78N7QbplbmqMumXuwnI5yk/QUx/Yh35muGXzIUC4p2GkiexlPT0zr@lists.infradead.org
X-Gm-Message-State: AFuF++nS+c8Iw+/Kk4QHK0HOnWqZHjMIqEATtnZtKG2Tcw0WJAy7zyOU
	LZfS7Pt7TgucgvysKGEw9p8txHBRjFFyXNP9UTiuLV2ctGv2cFFgw5c6lesjyEfsyHY=
X-Gm-Gg: AYBFou0MQaYszHrnEsdFIH6cQkDYDTuI83snfRAQQLH0tkKwwm4SUt87UWT//o5pB/D
	lLSVoR+Wdv4D/kRCr8kleDNKVoF2qHbcqr+MZqjv9LoyRKv3qJhQBpEI+g2FKJovItR8uo+KLk+
	rGeRloR8lAknjW7NS22bzTcPAYZyEuOw4xdUXLX4TghC/d6ao3HWSELrJJNhmQhgYvUu5fEWCPy
	qIrZd4SQAfoBJeFR4a4g9kwg9VsUFq2gJhIfP7lw6XbLQ/T2w9/XVal5kgynSHcFhP2f6YwNPCI
	b71jz/OscYYc66PzZgNIzEd+J8DxkKpEPPirAcUZdXxnjcx/4+F/l5kArMjZH1mxapSYHgVIOX2
	RaVKCfu84/pfLxBpeOrKF65yrWlDpAdezdoeVDKtTAIf9peXCQWHdCh7+95umGUuZUING40tI7X
	HQkt8cPmj8zjamrGwwMBlh7tJh8eV/3uHJULimmDMsGI+hG/nTS4Lik6Xgd7RRS+0aiY2yQuLub
	ZGDTP8T19a04p6SEQ==
X-Received: by 2002:a05:6000:4713:b0:485:892b:bdad with SMTP id ffacd0b85a97d-485aada981emr23994207f8f.12.1789025395849;
        Thu, 10 Sep 2026 00:29:55 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm44551660f8f.5.2026.09.10.00.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:29:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: stable@vger.kernel.org
Subject: [PATCH 5.15.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Thu, 10 Sep 2026 09:29:50 +0200
Message-ID: <20260910072950.341030-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026090930-unguided-jam-8517@gregkh>
References: <2026090930-unguided-jam-8517@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_002957_788072_137390E0 
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
index 6f3918f0a782..8af08853ffe5 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1303,7 +1303,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
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
