Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AFBC83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 00:21:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B44120737
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 00:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nAC3N7m8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMysl0r2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B44120737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CqON7kxXqWKXlvTR3ORJrFAH99nrFg3fpMU5YsqPfEI=; b=nAC3N7m8tlXtKO
	1Zm7EqwSMFzL9wpe4HZRfCm6O8Fwdmsxh6xDxfRbAEokn0qLqVU93IY+OU8UP0IrYgJW+FOi7rjzm
	9ocI1cDH+XNIARqVZJ3FMfwHhhhnbZ3zMnDq/munsHnH0iNjxGwnO1TPQOofFkiwrPw0Nc/EChSm9
	uLq7NifJON1YwBfKwqdj4hJhqAmZ5E8amhzPI2LQXnCEsSseImvqq4XZEx+Qe19U/3ZO9PWzvU6W8
	lIHFJP3igDoT//qlJ+1bPdyBUgeHvgtye704gVmrra6zvjuU0KzSHO8tU4MBqzdM9PfupEGPlOA4I
	PnQnebT4OfnO35E/GRCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTaTZ-0000yy-N2; Wed, 29 Apr 2020 00:21:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTaTX-0000y0-KG
 for linux-amlogic@lists.infradead.org; Wed, 29 Apr 2020 00:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588119678;
 bh=Nl7sNPPDjmyKSImmAYVRl5vT/shfmBSnPOzhkCRLj1U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=uMysl0r2ezmlDqZsZ610g9vKmRvVOw+tNRZZbSPYLSwrquKra3GY5JUNcZio+igrV
 /Wx9wVwPpJFEbsl/UsbKgu3WUUyBfr770HbdBNcCz1JKAjNO1HHSCkGUXxnCEQwi9U
 zwYLoojsC65DPFiAlYeRITLaH6CxoMyPAQTqJL5w=
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: Add missing boundary to RGMII
 TX clock array
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158811967890.27675.272179209716453555.git-patchwork-notify@kernel.org>
Date: Wed, 29 Apr 2020 00:21:18 +0000
References: <20200418181457.3193175-1-maz@kernel.org>
In-Reply-To: <20200418181457.3193175-1-maz@kernel.org>
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_172119_686421_589ACAEA 
X-CRM114-Status: UNSURE (   5.03  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, khilman@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Sat, 18 Apr 2020 19:14:57 +0100 you wrote:
> Running with KASAN on a VIM3L systems leads to the following splat
> when probing the Ethernet device:
> 
> ==================================================================
> BUG: KASAN: global-out-of-bounds in _get_maxdiv+0x74/0xd8
> Read of size 4 at addr ffffa000090615f4 by task systemd-udevd/139
> CPU: 1 PID: 139 Comm: systemd-udevd Tainted: G            E     5.7.0-rc1-00101-g8624b7577b9c #781
> Hardware name: amlogic w400/w400, BIOS 2020.01-rc5 03/12/2020
> Call trace:
>  dump_backtrace+0x0/0x2a0
>  show_stack+0x20/0x30
>  dump_stack+0xec/0x148
>  print_address_description.isra.12+0x70/0x35c
>  __kasan_report+0xfc/0x1d4
>  kasan_report+0x4c/0x68
>  __asan_load4+0x9c/0xd8
>  _get_maxdiv+0x74/0xd8
>  clk_divider_bestdiv+0x74/0x5e0
>  clk_divider_round_rate+0x80/0x1a8
>  clk_core_determine_round_nolock.part.9+0x9c/0xd0
>  clk_core_round_rate_nolock+0xf0/0x108
>  clk_hw_round_rate+0xac/0xf0
>  clk_factor_round_rate+0xb8/0xd0
>  clk_core_determine_round_nolock.part.9+0x9c/0xd0
>  clk_core_round_rate_nolock+0xf0/0x108
>  clk_core_round_rate_nolock+0xbc/0x108
>  clk_core_set_rate_nolock+0xc4/0x2e8
>  clk_set_rate+0x58/0xe0
>  meson8b_dwmac_probe+0x588/0x72c [dwmac_meson8b]
>  platform_drv_probe+0x78/0xd8
>  really_probe+0x158/0x610
>  driver_probe_device+0x140/0x1b0
>  device_driver_attach+0xa4/0xb0
>  __driver_attach+0xcc/0x1c8
>  bus_for_each_dev+0xf4/0x168
>  driver_attach+0x3c/0x50
>  bus_add_driver+0x238/0x2e8
>  driver_register+0xc8/0x1e8
>  __platform_driver_register+0x88/0x98
>  meson8b_dwmac_driver_init+0x28/0x1000 [dwmac_meson8b]
>  do_one_initcall+0xa8/0x328
>  do_init_module+0xe8/0x368
>  load_module+0x3300/0x36b0
>  __do_sys_finit_module+0x120/0x1a8
>  __arm64_sys_finit_module+0x4c/0x60
>  el0_svc_common.constprop.2+0xe4/0x268
>  do_el0_svc+0x98/0xa8
>  el0_svc+0x24/0x68
>  el0_sync_handler+0x12c/0x318
>  el0_sync+0x158/0x180
> 
> [...]


Here is a summary with links:
  - net: stmmac: dwmac-meson8b: Add missing boundary to RGMII TX clock array
    https://git.kernel.org/khilman/linux-amlogic/c/f0212a5ebfa6cd789ab47666b9cc169e6e688732

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
