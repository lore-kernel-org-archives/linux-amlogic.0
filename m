Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4CBC47DB3
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Feb 2024 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0mz/9ogPQ/X24N1RmfWhNplXuRwMLYoDPH9vHSNW+cQ=; b=LvdseENr2g4iCL
	jRzwoMdB3HHbgF0dj5xdZa4nMe9qz61IDRL6mwGK/dCpjCoB+SuCa/DsetUThZ1m0P5dzkrTepv8V
	7cRiUwKJAgEpLj5Jj6A6YT8eaI0TvPMfP/PgAcu8Du/fPEML4tRQH4L6MjaRl6Z52qvAvUKDIt3jm
	kUk3BNq9nGgwYptf5/26nXVbcWaZRKPzaZaVJftci0nOtke7g/RsglwSOjWjXHZLgt4JMKpy9q4ut
	zvlKIF6W9pJ7nkFQGKDZCHFOH/IsNToc0tYMwUQCE6d3q3+tVjL33+hFW4gImzC/kpNP8jFpQJqXV
	OPiUCno1h6vbaS1YrVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVuVm-0000000Bl4V-1p3q;
	Fri, 02 Feb 2024 14:27:22 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVuVi-0000000Bl0s-2xfx;
	Fri, 02 Feb 2024 14:27:21 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 856F8100009;
	Fri,  2 Feb 2024 17:27:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 856F8100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1706884023;
	bh=JeqPP36z4pnlbw1sLnjMU+SnvqzYB8B7+7WjQdUZT4c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=tv1lOjPnlavwyjm3XqtQCuyI0jQIgx8BjwD5J7mtuY+0ASihXhtcUwGqBSlJOpxF0
	 4VcsGPlJbYKLmhw4lYFAHsYtbmjiRh6elHhYTXK16Txt+RykRNbsbloux+baHiiROX
	 O37p8jA5N1pIMokgEMIfVIHfHW8aiWYuyJ5Jt0y3likxUqK0Y4+Q3N5+TD23MQyNmh
	 JL1FlWWuJiMA4sWq+EBP80SCK6Ckxspn9FxGmMxjpacDIaBY4YL2T4SdV6rqW26I4N
	 UBwHr9zyHt7iTS+fJ2xhaDLfRz5V6XQbSr4acJqiKHuO/pqPndy8yaPV2POm8jBRTd
	 hCSgBs0aA0r9Q==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  2 Feb 2024 17:27:03 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 17:27:03 +0300
From: Igor Prusov <ivprusov@salutedevices.com>
To: <jbrunet@baylibre.com>, <neil.armstrong@linaro.org>
CC: <kernel@salutedevices.com>, <prusovigor@gmail.com>, Igor Prusov
	<ivprusov@salutedevices.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: meson: Add missing clocks to axg_clk_regmaps
Date: Fri, 2 Feb 2024 17:25:48 +0300
Message-ID: <20240202172537.1.I64656c75d84284bc91e6126b50b33c502be7c42a@changeid>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183159 [Feb 02 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ivprusov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/02 11:00:00 #23326006
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_062719_467850_FEED1311 
X-CRM114-Status: GOOD (  11.46  )
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

Some clocks were missing from axg_clk_regmaps, which caused kernel panic
during cat /sys/kernel/debug/clk/clk_summary

[   57.349402] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001fc
...
[   57.430002] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   57.436900] pc : regmap_read+0x1c/0x88
[   57.440608] lr : clk_regmap_gate_is_enabled+0x3c/0xb0
[   57.445611] sp : ffff800082f1b690
[   57.448888] x29: ffff800082f1b690 x28: 0000000000000000 x27: ffff800080eb9a70
[   57.455961] x26: 0000000000000007 x25: 0000000000000016 x24: 0000000000000000
[   57.463033] x23: ffff800080e8b488 x22: 0000000000000015 x21: ffff00000e7e7000
[   57.470106] x20: ffff00000400ec00 x19: 0000000000000000 x18: ffffffffffffffff
[   57.477178] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000042a3000
[   57.484251] x14: 0000000000000000 x13: ffff0000042a2fec x12: 0000000005f5e100
[   57.491323] x11: abcc77118461cefd x10: 0000000000000020 x9 : ffff8000805e4b24
[   57.498396] x8 : ffff0000028063c0 x7 : ffff800082f1b710 x6 : ffff800082f1b710
[   57.505468] x5 : 00000000ffffffd0 x4 : ffff800082f1b6e0 x3 : 0000000000001000
[   57.512541] x2 : ffff800082f1b6e4 x1 : 000000000000012c x0 : 0000000000000000
[   57.519615] Call trace:
[   57.522030]  regmap_read+0x1c/0x88
[   57.525393]  clk_regmap_gate_is_enabled+0x3c/0xb0
[   57.530050]  clk_core_is_enabled+0x44/0x120
[   57.534190]  clk_summary_show_subtree+0x154/0x2f0
[   57.538847]  clk_summary_show_subtree+0x220/0x2f0
[   57.543505]  clk_summary_show_subtree+0x220/0x2f0
[   57.548162]  clk_summary_show_subtree+0x220/0x2f0
[   57.552820]  clk_summary_show_subtree+0x220/0x2f0
[   57.557477]  clk_summary_show_subtree+0x220/0x2f0
[   57.562135]  clk_summary_show_subtree+0x220/0x2f0
[   57.566792]  clk_summary_show_subtree+0x220/0x2f0
[   57.571450]  clk_summary_show+0x84/0xb8
[   57.575245]  seq_read_iter+0x1bc/0x4b8
[   57.578954]  seq_read+0x8c/0xd0
[   57.582059]  full_proxy_read+0x68/0xc8
[   57.585767]  vfs_read+0xb0/0x268
[   57.588959]  ksys_read+0x70/0x108
[   57.592236]  __arm64_sys_read+0x24/0x38
[   57.596031]  invoke_syscall+0x50/0x128
[   57.599740]  el0_svc_common.constprop.0+0x48/0xf8
[   57.604397]  do_el0_svc+0x28/0x40
[   57.607675]  el0_svc+0x34/0xb8
[   57.610694]  el0t_64_sync_handler+0x13c/0x158
[   57.615006]  el0t_64_sync+0x190/0x198
[   57.618635] Code: a9bd7bfd 910003fd a90153f3 aa0003f3 (b941fc00)
[   57.624668] ---[ end trace 0000000000000000 ]---

Signed-off-by: Igor Prusov <ivprusov@salutedevices.com>
---

 drivers/clk/meson/axg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index c12f81dfa674..5f60f2bcca59 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -2142,7 +2142,9 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
 	&axg_vclk_input,
 	&axg_vclk2_input,
 	&axg_vclk_div,
+	&axg_vclk_div1,
 	&axg_vclk2_div,
+	&axg_vclk2_div1,
 	&axg_vclk_div2_en,
 	&axg_vclk_div4_en,
 	&axg_vclk_div6_en,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
