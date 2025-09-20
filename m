Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81858CAC5A0
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Sep 2025 04:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZOkosVbfQOk2+rvDPO9waBf+jkkL9K2SajTqqJvakU=; b=P1TQiEt6ThNHOh
	qZaqmVXu4JhYLS3NcjAPSjRvm8Pt5Fqvm85b/ZSLoB0Qvu5vyGcBauI5+hU2ieK/dCvvTHWCqvntY
	SBmtLQxERhVIinYYRroVCSVk0AoO42gBenXodGzGgQEAu8yPTOlU6Qwg0ya/8G6Wf7QrHXwjqpX0S
	kYps2UOXn7vsg1dZvigBs6n18NcDsAoP42jWZfVvVmApDcibx1U1E4ncNQh/bzYaIr6IWl5CKc68I
	T567+qRZUf/LKItjqCRinlNokMln9fd6DGOaADlcYGSrrKc9dNe16Dxm70gk1+hP9b7BMZJeegjDs
	rwnjf0BVtY70Je8mm4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzph9-00000004kUK-3GsB;
	Sat, 20 Sep 2025 04:59:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzph7-00000004kU1-2MeF
	for linux-amlogic@lists.infradead.org;
	Sat, 20 Sep 2025 04:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 412DA44912;
	Sat, 20 Sep 2025 04:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EB3C4CEEB;
	Sat, 20 Sep 2025 04:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758344371;
	bh=bZwm5S0mm6UMLKOrHzuuiC6Ew59OaikRwm6YhPA3rhk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LpnRi3YFym9rNPfNWPSQrdWW9DUIip1afdsGT/GIkVCzy47vxH7XT1jkxlMO3tCp1
	 t66piTOvhTy17f5uwGzHK9YhZ+b49yFeBhiS9WUHF/t5H7cfBiFLLPRUztUBG13/qA
	 by42+SclnHneA3ZkhRYgtY1S4upCEcxlFONot2yECUFtSRF/K39Wj6YolpVyqbUp1+
	 KRUfvARwPEX08keQX+4DNDJQvgl8ISsmUGE6SlIMIIwtffkc+AWGidHBNX9cx/OuOX
	 Ea4JV8dM055rFulfoiPbhD904F9/rl9gF83H0qDKI/D2Z4PyZms1BXJFjZuplm0Fx3
	 jDw2mwzuS5yzg==
MIME-Version: 1.0
In-Reply-To: <20250918160601.3286872-1-m.szyprowski@samsung.com>
References: <CGME20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6@eucas1p1.samsung.com> <20250918160601.3286872-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] clk: amlogic: fix recent code refactoring
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Date: Fri, 19 Sep 2025 21:59:30 -0700
Message-ID: <175834437006.4354.11933545174004616373@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_215933_625176_2E2452E2 
X-CRM114-Status: UNSURE (   7.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Marek Szyprowski (2025-09-18 09:06:01)
> Commit 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
> refactored some internals in the g12a meson clock driver. Unfortunately
> it introduced a bug in the clock init data, which results in the
> following kernel panic:
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Mem abort info:
> ...
> Data abort info:
> ...
> [0000000000000000] user address but active_mm is swapper
> Internal error: Oops: 0000000096000004 [#1]  SMP
> Modules linked in:
> CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc1+ #11158 PREEMPT
> Hardware name: Hardkernel ODROID-N2 (DT)
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __clk_register+0x60/0x92c
> lr : __clk_register+0x48/0x92c
> ...
> Call trace:
>  __clk_register+0x60/0x92c (P)
>  devm_clk_hw_register+0x5c/0xd8
>  meson_eeclkc_probe+0x74/0x110
>  g12a_clkc_probe+0x2c/0x58
>  platform_probe+0x5c/0xac
>  really_probe+0xbc/0x298
>  __driver_probe_device+0x78/0x12c
>  driver_probe_device+0xdc/0x164
>  __driver_attach+0x9c/0x1ac
>  bus_for_each_dev+0x74/0xd0
>  driver_attach+0x24/0x30
>  bus_add_driver+0xe4/0x208
>  driver_register+0x60/0x128
>  __platform_driver_register+0x24/0x30
>  g12a_clkc_driver_init+0x1c/0x28
>  do_one_initcall+0x64/0x308
>  kernel_init_freeable+0x27c/0x4f8
>  kernel_init+0x20/0x1d8
>  ret_from_fork+0x10/0x20
> Code: 52800038 aa0003fc b9010018 52819801 (f9400260)
> ---[ end trace 0000000000000000 ]---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
