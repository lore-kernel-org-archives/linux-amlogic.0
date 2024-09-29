Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AECCCF6498
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Sep 2024 06:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iZiTJrAHesGZpseIUwex5fW5KXO+d5sgNWaPyIl+NMU=; b=sxBBafiBzYWPLh
	2XNxDVpt546ZNNnu1MGd4kTDW/dFED7cuHveHb9WBRxfGgNtAS7CyYKleH9hm/xiqs/F9WFP7X4cq
	iGig0m3yfnniNArA5JaeJmkkvzkf5pic9qSvyiQuxwce/GVDQoDSlQb2fEVZYi8HGJ0uF20Q5EoVh
	95iMHA0bA89duGBeN9rvbjaER0yucCCvIc2M7tdej5d9oP7KxV2VB8hK742p/z1h0t0yDhVN4lVKz
	Xvu/YPRJvWzm2H25IcpwpX8fT8xH4+Rfr4O0rkmlsOurJToucRyG7CNlbZEFCfMBGERkY1wuYH3Ge
	ycXhUi3xvObLmuw4LY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sun8b-0000000EFR2-0VW3;
	Sun, 29 Sep 2024 06:10:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sun8Y-0000000EFPr-0nch;
	Sun, 29 Sep 2024 06:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AA365C0FDA;
	Sun, 29 Sep 2024 06:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1419C4CEC5;
	Sun, 29 Sep 2024 06:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727590227;
	bh=VuF+6B8clsCESzRY45mjWVDnp0roeP9EanMgzGgHiWE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PMvI8bvPOh99P0uhs1qw02qI/4fAiG+OaPeubI6weUSf7yES471ck+AnnR9LmruEZ
	 YCYeBHzXZ2pPvRu7YSY7svBrXGAUf5wBT7bdtfhfvAWuAdI52KN7zaEVAl2hrkz0AX
	 VhuxAKvcOK1j7935S1vzvVNXWIYDfL9um59N9pc6LIlseZWGLBHJ1jGXeaDrmgzumU
	 PFtqe1oFUzmFFYAo6J8kTq3so1uJqc7UjU1HxIq76Wa5MVP6mpRK/WsKH1N+GKmnNm
	 LPbshINP3VSGxN2nD3kh2shDro1j1VG5GL3T89dxojjimjeb8zyzhUWP3UpbHP0LDV
	 DBAbnsJ8FW2Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF78ECF6498;
	Sun, 29 Sep 2024 06:10:27 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 0/2] clk: Fix issues related to CLK_IGNORE_UNUSED failures
 and amlogic glitch free mux
Date: Sun, 29 Sep 2024 14:10:04 +0800
Message-Id: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADzv+GYC/x2MQQqAIBAAvxJ7TtCtg/aVCAlbdSEsNCII/550H
 JiZFwplpgJT90KmmwsfqYHqO3BxTYEEb40BJY7SoBGeHxt2vly0PhMJNNJpbXBwg4JWnZma8h/
 npdYP3BY0HWEAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727590225; l=2225;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=VuF+6B8clsCESzRY45mjWVDnp0roeP9EanMgzGgHiWE=;
 b=uv2V//H+abP/S3Lw1qAz+VmyJFzrQupRRNbZVAZLVVbSOXL4PGoneT4nrv9LXoR4p9o9RDGqB
 VeQpA48RrjADXJl+sHwiniuTizO/DMQ0PwSjqDVVZVEBJLoBCahwUM5
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_231030_396432_27E2EF13 
X-CRM114-Status: UNSURE (   8.89  )
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

If CLK_OPS_PARENT_ENABLE is configured for clock,
clk_core_disable_unprepare() is called in clk_disable_unused_subtree().
Even clocks that are configured with CLK_IGNORE_UNUSED are disabled,
resulting in the failure of CLK_IGNORE_UNUSED.

To ensure that amlogic glitch free mux can switch clock channels
properly, add flag CLK_OPS_PARENT_ENABLE to glitch free mux. The issue
that CLK_OPS_PARENT_ENABLE in CCF causes CLK_IGNORE_UNUSED to fail is
also exposed.

glitch free mux channel switchover failure issue(Test vpu_clk on S4):
step 1:
$ cat /sys/kernel/debug/clk/vpu/clk_parent 
vpu_0
$ cat /sys/kernel/debug/clk/vpu_0/clk_rate 
399999994
$ cat /sys/kernel/debug/clk/vpu_1/clk_rate 
666666656
$ echo 1 > /sys/kernel/debug/clk/vpu/clk_prepare_enable 
$ cat /sys/kernel/debug/meson-clk-msr/clks/cts_vpu_clk
399987500       +/-12500Hz

step 2:
$ echo 0 > /sys/kernel/debug/clk/vpu/clk_prepare_enable 
$ echo 1 > /sys/kernel/debug/clk/vpu/clk_parent 
$ cat /sys/kernel/debug/clk/vpu/clk_parent 
vpu_1
$ cat /sys/kernel/debug/clk/vpu/clk_rate 
666666656
$ echo 1 > /sys/kernel/debug/clk/vpu/clk_prepare_enable 
$ cat /sys/kernel/debug/meson-clk-msr/clks/cts_vpu_clk
0       +/-3125Hz

In step2, vpu_0 is disabled, and the vpu is not switched to vpu_1. At
this time, the vpu is still connected to vpu_0 and vpu_0 is disabled at
this time, resulting in the clk-measure not measuring the clock.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (2):
      clk: Fix the CLK_IGNORE_UNUSED failure issue
      clk: meson: Fix glitch free mux related issues

 drivers/clk/clk.c                  | 67 ++++++++++++++++++++++++++++++++++++--
 drivers/clk/meson/a1-peripherals.c | 12 +++----
 drivers/clk/meson/axg.c            | 16 +++++----
 drivers/clk/meson/c3-peripherals.c |  6 ++--
 drivers/clk/meson/g12a.c           | 18 ++++++----
 drivers/clk/meson/gxbb.c           | 18 ++++++----
 drivers/clk/meson/s4-peripherals.c | 32 +++++++++---------
 7 files changed, 122 insertions(+), 47 deletions(-)
---
base-commit: e736da1956cf0880a02ec5023f3487eea7611b5f
change-id: 20240929-fix_glitch_free-290c88923c31

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
