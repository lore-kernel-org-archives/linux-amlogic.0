Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8B5D12D68
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2024 03:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F3oFg5JRYVSuEQJ4rbb5xuF8GKs3WLylhOq8f8JuM8w=; b=z5PlMmBgStOlM0
	2RV/9efezQpJTTOFeRr4gMiDSQ5aIGWqpAEmBCjKr36dkNtw08JN0mpDpp6KzHjlrJ3bIKZ3CGcbb
	sezAdFEquP2BBaf549IIdg7brj8nX9R7a5vY5j1HRdnSF34U9TDwu2S4PpsDQsT2+Cgkw4P/8cZiX
	tliNv2SDdUWhxpt1aoUwefdgjchhZwPDOMVASU2ER9JUAB9+my05PY846tEn22rZFAtv22aXEA6/5
	1PYxZpoUx+sQMoq15+HV969BqBR9ogF8aCrE98mEFq7f+0JEbjEhcng9q2M+J+yFUiDpEXwYRYG5W
	xcIE53dLfI8Lc6QezfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALK0-0000000GFBG-2xjH;
	Mon, 11 Nov 2024 03:42:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALEl-0000000GEYM-3mzt;
	Mon, 11 Nov 2024 03:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A369AA40DBF;
	Mon, 11 Nov 2024 03:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AACF0C4CECD;
	Mon, 11 Nov 2024 03:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731296229;
	bh=g6bebViV2vgswvScFFgT4ihiXpYioBTgIRcyCJ4wOg0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lAEK7ZDGnUWWeuGgGHoSBZSIch//gY4F4iZv+vqgfDMvl4H2cXdo1ktf7PTJalbhK
	 OqPDqc7hZoV+ypChfdcdFWFRgOPUIW2OpBGKmVf4wL3KfMT3qfqkNprFjUWHwoIxoi
	 8w/5kxlytyCl8AA9bqTbC2JO45bqunfJLZ+sUBno9FnWb1bSNpLoZtxRt8K0RJ1/Du
	 +doveSPWZ5KWISLC+6CjI6csMkXFnJIOvQoV3YM4yZO6ONSsB0Xv5t6oYDrQ/GvldD
	 bbSPZsyRjIElY3luIiIy0FHF0x/5R6H5fTHmpj9NbXxSw6TcPnFCIn5FGCDtlu2Lbi
	 QjecLV+Ifsb0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09F0D12D49;
	Mon, 11 Nov 2024 03:37:09 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] clk: Fix issues related to CLK_IGNORE_UNUSED
 failures and amlogic glitch free mux
Date: Mon, 11 Nov 2024 11:37:00 +0800
Message-Id: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANx7MWcC/3WNwQqDMBBEf0X23JS4ltb01P8oInbdJAtqJBFpE
 f+9qfce3zDzZoPEUTjBvdgg8ipJwpQBTwWQ7ybHSvrMgBov2qBRVt6tG2Qh39rIrNBoqmuDFVU
 l5NUcOVcO47PJ7CUtIX6Og7X8pf9da6m0QrSGquvrxr19dOMQnNCZwgjNvu9f+2eoY7AAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731296227; l=2635;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=g6bebViV2vgswvScFFgT4ihiXpYioBTgIRcyCJ4wOg0=;
 b=5sClNyptQe3+bagbINnhGgZawIIkUqgm0F9mH6dWCZh1WqRUKdk8EPEuNykuNhlrS8kgQYefe
 +FPz2kz/kQND05wRTL8OF9cTnv6S6R+ApC+whsKI9TACfH4LDcdITbt
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_193712_109349_2539D9C1 
X-CRM114-Status: GOOD (  10.60  )
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
Changes in v2:
- The failure of glitch-free mux switching and the suppression of glitch
are split into two patch.
- The glitch-free mux adds support for the meson-8 family.
- Link to v1: https://lore.kernel.org/r/20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com

---
Chuan Liu (3):
      clk: Fix the CLK_IGNORE_UNUSED failure issue
      clk: meson: Fix failure of glitch-free mux switching
      clk: meson: Fix glitch occurs when setting up glitch-free mux

 drivers/clk/clk.c                  | 67 ++++++++++++++++++++++++++++++++++++--
 drivers/clk/meson/a1-peripherals.c | 12 +++----
 drivers/clk/meson/axg.c            | 16 +++++----
 drivers/clk/meson/c3-peripherals.c |  6 ++--
 drivers/clk/meson/g12a.c           | 18 ++++++----
 drivers/clk/meson/gxbb.c           | 18 ++++++----
 drivers/clk/meson/meson8b.c        | 21 ++++++++++--
 drivers/clk/meson/s4-peripherals.c | 32 +++++++++---------
 8 files changed, 140 insertions(+), 50 deletions(-)
---
base-commit: 664988eb47dd2d6ae1d9e4188ec91832562f8f26
change-id: 20240929-fix_glitch_free-290c88923c31

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
