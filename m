Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E707FCAC59A
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Sep 2025 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=TPLlVVm88bLHf9lJ1oijhOTca/ov9IWYemcVLgUCXyc=; b=HfpNq1bjHfDeaD
	d2ohOH7+yx27kDrMGFhXPB6fRHSt9RcRG9cIWBy/WBQlDAAIJgaXysp4u4kb4le5CQ4PyIZfVNzJE
	JTktR6Oc3n5q1OlswdP/mLGw37rmY7F2pVDn3j3RcBFzFyjPbi97ZF/s/hCZ60vUnLKGtg9tNOXLD
	oBINXPUHeSka2LNWx9jk+WPTjjPqWnnrC1ThLAiTG3RF1p+c2GlGcMeQ03HgnRPnQOoeMripJ4o6g
	75UY8nHHDV+/jjjRzGmRHKLt+oEAzW6HzavznOzeygjeLK4NRCKGdbGM6ZTPZ88zKrD2G4KoJ+yH/
	xWiqwuixV4msImeUImng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzH9S-00000000Ybm-3tVx;
	Thu, 18 Sep 2025 16:06:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzH9Q-00000000Yb9-2l91
	for linux-amlogic@bombadil.infradead.org;
	Thu, 18 Sep 2025 16:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
	bh=irDApffJ5TVFRyQKwcFhXwSY4n2Rzqd5l4J/n3RE/x8=; b=l4X/vmtogZKPbvdOEmuIltb7X1
	yTkw9PIGgbSS8o0QV2N80uPLFtTkcq3aCKVK72HDhEL3u4VANBKLqVLwjPbnEFhKMY09GTahpEUJz
	Y6/IuBVaLNzO+yLTFpNkvR5bnXRi69SrgS2IVCP/RTv3caNmv9fVmpttDxAumE8tqRUT7kzRVMKx0
	7T41tVzJLMM7AFlihOJfG3w2p9jyVuX+CigBaXoG0DobiJmBmOQHzX8xJKJzkzGJeOxsG2RHgR0gD
	0SXem1JWohKd4H2HUEQ1GOgeFxfiixjvXQXUdvswlY3L1mVZ9DSoGnqyxXAakhFztlXrEhJwabsZr
	S++9KYEA==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzH9J-00000007eXZ-49X3
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Sep 2025 16:06:25 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250918160615euoutp0238361d7748c858979043ac26f5a42520~mbBzNmCD-1411314113euoutp02G
	for <linux-amlogic@lists.infradead.org>; Thu, 18 Sep 2025 16:06:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250918160615euoutp0238361d7748c858979043ac26f5a42520~mbBzNmCD-1411314113euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758211575;
	bh=irDApffJ5TVFRyQKwcFhXwSY4n2Rzqd5l4J/n3RE/x8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XbRJiMmcTqplBU1DDiepwLmT/WVm6h08wFXh8Wp+cVq17sSUmw5Km4cjIBX+NX1j9
	 DKacCdcBSP8R7tekGbRySsudnX+55wkXpsOkaaoZhE0h/UpNlqIfHbIT4XLXnDY9V2
	 BEnx3ngawiTNWYXVMV0lQK1K/Y/oUBmV4i5JJ9Tw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6~mbByfB1uf1725317253eucas1p1Y;
	Thu, 18 Sep 2025 16:06:14 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250918160614eusmtip2af2da5163fdeb2d9681208727274bc45~mbByDyyX02246622466eusmtip2L;
	Thu, 18 Sep 2025 16:06:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin
	Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>
Subject: [PATCH] clk: amlogic: fix recent code refactoring
Date: Thu, 18 Sep 2025 18:06:01 +0200
Message-Id: <20250918160601.3286872-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6
X-Msg-Generator: CA
X-RootMTR: 20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6
X-EPHeader: CA
X-CMS-RootMailID: 20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6
References: <CGME20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_170622_142983_0A1C005B 
X-CRM114-Status: GOOD (  13.10  )
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

Commit 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
refactored some internals in the g12a meson clock driver. Unfortunately
it introduced a bug in the clock init data, which results in the
following kernel panic:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
...
Data abort info:
...
[0000000000000000] user address but active_mm is swapper
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc1+ #11158 PREEMPT
Hardware name: Hardkernel ODROID-N2 (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __clk_register+0x60/0x92c
lr : __clk_register+0x48/0x92c
...
Call trace:
 __clk_register+0x60/0x92c (P)
 devm_clk_hw_register+0x5c/0xd8
 meson_eeclkc_probe+0x74/0x110
 g12a_clkc_probe+0x2c/0x58
 platform_probe+0x5c/0xac
 really_probe+0xbc/0x298
 __driver_probe_device+0x78/0x12c
 driver_probe_device+0xdc/0x164
 __driver_attach+0x9c/0x1ac
 bus_for_each_dev+0x74/0xd0
 driver_attach+0x24/0x30
 bus_add_driver+0xe4/0x208
 driver_register+0x60/0x128
 __platform_driver_register+0x24/0x30
 g12a_clkc_driver_init+0x1c/0x28
 do_one_initcall+0x64/0x308
 kernel_init_freeable+0x27c/0x4f8
 kernel_init+0x20/0x1d8
 ret_from_fork+0x10/0x20
Code: 52800038 aa0003fc b9010018 52819801 (f9400260)
---[ end trace 0000000000000000 ]---

Fix this by correcting the clock init data.

Fixes: 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 7e2c0ce91964..1413eadd8dc6 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4919,7 +4919,7 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_CPUB_CLK_DYN0_SEL]	= &g12b_cpub_clk_dyn0_sel.hw,
 	[CLKID_CPUB_CLK_DYN0_DIV]	= &g12b_cpub_clk_dyn0_div.hw,
 	[CLKID_CPUB_CLK_DYN0]		= &g12b_cpub_clk_dyn0.hw,
-	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_dyn1.hw,
+	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_dyn1_sel.hw,
 	[CLKID_CPUB_CLK_DYN1_DIV]	= &g12b_cpub_clk_dyn1_div.hw,
 	[CLKID_CPUB_CLK_DYN1]		= &g12b_cpub_clk_dyn1.hw,
 	[CLKID_CPUB_CLK_DYN]		= &g12b_cpub_clk_dyn.hw,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
