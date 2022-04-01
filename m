Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4EDC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxsN/+mTI8G7L8lnu4zSCZJcEApyXd5mB9xYP9cVkbU=; b=a44pF2FLzkJm+B
	03uNPLxs2toL35goXoTmv2WLwrWudLh0fqJJvIc1hFGxGX3esk+C6FO1ZqTCDaH4T1hbs6kq6grZI
	OGV9qDqw/RrPWFzt+Zvt4kg9cWnKt7U1+kxZOP1w7f2/3+LkB3Gq/xbBGGmasIL39m77OfaWW6XcM
	Omq/7NtQE0IspPJeUU8YDMy5cj3oue/X78ptiR1GnH/dJ7pPgnwT5FsoJEEDbiQAGnV83Fr4p93BJ
	AFX4K4OTHDECVVTWilRjxNtTAhyP+ZUMsT8KJ3obupefUsh9Ek+feM5g2wTyPy2bmpw8tRAA0tRhY
	P2LrVRPom1vcVUewKfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naFsO-005PtA-QG; Fri, 01 Apr 2022 11:55:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naFsK-005Ps4-Bl; Fri, 01 Apr 2022 11:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1648814132; x=1680350132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5+sZgDQA+8H/5r2/Yyfhka7Pza4QE5RJAHyTjUyWDs=;
 b=ltMy+XWJtIe/+JSSQWlfQuVoWZpmBfU8RE2pFuxF36raUpFxyExZJyLZ
 r3SNzsS3kqKuIi/M6MxQslgfJJR5lk6WGkgwZsBTc/EAY1aTIFIkDVKEj
 wK8sJvbaSuTDwm68n/fcixIOlD0ejG6uM6kNNBoQ6ATlQb4hwI9lH5Oi6
 hZBM80rIfMm4m2VhJAdL7qsqq758YWZWBtz1ZJeMBDBPgKtG4NhoDK6Qb
 eBNg4lNK7/vHnwhqb5NmvfEkqy2dKFBJTfLcgpOHbAe5TUJB/VMsIy/U8
 q+ipPCwCzg8FQNCZ76qoF7d9Dk+PTgPhNeTn/1Y14xnVQ+jU95O0gIeNm Q==;
X-IronPort-AV: E=Sophos;i="5.90,227,1643670000"; d="scan'208";a="23042697"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 01 Apr 2022 13:55:24 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 01 Apr 2022 13:55:24 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 01 Apr 2022 13:55:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1648814124; x=1680350124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5+sZgDQA+8H/5r2/Yyfhka7Pza4QE5RJAHyTjUyWDs=;
 b=GDel+VITt9h+5pnW9MVr7r4CHDSG6Wg5i9XjIxWji7d2gDK/JiRNLQWf
 ovzc8HX4Mjl0iCQvSDPy0JW9yFmcZzDi7vGZjzloyTEbA12MQQpErYrz+
 97iacGYOqVAyDhtMRPb+IHe7a0sQHNp4K02kTjCQ5IJR0eApBulgD1nMz
 AYh4dp0NSF2RUYSbhwTDWhM76B/IE9BHsOSDRaV1KV6KDcMQ1fmRvl+Yb
 AdILLKKKqoNyu4x1cPhhPg3kT86OZmVHivxZsh/KLCLleLGuKtxSe+CgT
 mDIZhpulyobyt9KVkG6T1E9mVhF+DLkthEjWyTgLVFRX2mm4x0KwUdCNP g==;
X-IronPort-AV: E=Sophos;i="5.90,227,1643670000"; d="scan'208";a="23042695"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 01 Apr 2022 13:55:24 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D3B84280065;
 Fri,  1 Apr 2022 13:55:23 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Subject: Re: (EXT) Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Date: Fri, 01 Apr 2022 13:55:20 +0200
Message-ID: <2236051.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220331153134.h3alp24hzquajkly@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <YkXCGlrok0niwlyg@atomide.com> <20220331153134.h3alp24hzquajkly@houat>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_045533_005294_23893FCB 
X-CRM114-Status: GOOD (  22.26  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

Am Donnerstag, 31. M=E4rz 2022, 17:31:34 CEST schrieb Maxime Ripard:
> * PGP Signed by an unknown key
> =

> Hi Tony,
> =

> On Thu, Mar 31, 2022 at 06:00:42PM +0300, Tony Lindgren wrote:
> > * Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> > > On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > > > It seems the dts assigned-clock-parents no longer works now?
> > > =

> > > That would make some kind of sense, __set_clk_parents calls clk_put on
> > > both the assigned clock and its parent.
> > > =

> > > Could you see what parent (and why?) it tries to enforce then?
> > =

> > It picks the other option available for the mux clock that only has
> > two options. No idea why, but if you have some debug patch in mind I
> > can give it a try.
> > =

> > > It looks like the gpt1_fck driver might favor another parent for that
> > > rate, which, if it's an invalid configuration, shouldn't really happe=
n?
> > =

> > Hmm there's a gate clock and a mux clock, there's not really a rate
> > selection available here for the sources.
> =

> If I followed the OMAP driver properly, clk_mux_determine_rate_flags is
> doing the heavy lifting, could you run your test with

I'm affected by this patch as well on an imx8mp platform (see [1] for some =

details)

In the failing case with with your patch applied I get the following error =

---
[    0.661064] clk_set_rate_range_nolock: core req rate 500000000          =
                                                          =

[    0.664084] clk_set_rate_range_nolock: clamped rate 500000000           =
                                                          =

[    0.669851] clk_core_set_rate_nolock: rate 500000000                    =
                                                          =

[    0.674843] clk_core_set_rate_nolock: rounded rate 500000000            =
                                                          =

[    0.680536] clk_set_rate_range_nolock: core req rate 800000000          =
                                                          =

[    0.686389] clk_set_rate_range_nolock: clamped rate 800000000           =
                                                          =

[    0.692164] clk_core_set_rate_nolock: rate 800000000                    =
                                                          =

[    0.697153] clk_mux_determine_rate_flags: requested rate 800000000      =
                                                          =

[    0.703363] clk_mux_determine_rate_flags: current parent sys_pll1       =
                                                          =

[    0.709487] clk_mux_determine_rate_flags: current parent rate 800000000 =
                                                          =

[    0.716147] Unable to handle kernel NULL pointer dereference at virtual =

address 0000000000000000
[    0.724977] Mem abort info:                                             =
                                                          =

[    0.727775]   ESR =3D 0x96000004                                        =
                                                            =

[    0.730835]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits            =
                                                              =

[    0.736177]   SET =3D 0, FnV =3D 0                                      =
                                                              =

[    0.739239]   EA =3D 0, S1PTW =3D 0                                     =
                                                              =

[    0.742382]   FSC =3D 0x04: level 0 translation fault                   =
                                                            =

[    0.747287] Data abort info:                                            =
                                                          =

[    0.750172]   ISV =3D 0, ISS =3D 0x00000004                             =
                                                              =

[    0.754027]   CM =3D 0, WnR =3D 0                                       =
                                                              =

[    0.757002] [0000000000000000] user address but active_mm is swapper    =
                                                          =

[    0.763394] Internal error: Oops: 96000004 [#1] PREEMPT SMP             =
                                                          =

[    0.768985] Modules linked in:                                          =
                                                          =

[    0.772049] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.17.0-next-202203=
31+ =

#48 8e9d24095c7f6b15f85bc2ad57a5609e219130b9          =

[    0.782984] Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MPxL (=
DT)                                                       =

[    0.789985] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)                                                       =

[    0.796985] pc : clk_mux_determine_rate_flags+0x280/0x2cc               =
                                                          =

[    0.802407] lr : clk_mux_determine_rate_flags+0xf4/0x2cc                =
                                                          =

[    0.807747] sp : ffff800009ceb590                                       =
                                                          =

[    0.811072] x29: ffff800009ceb590 x28: ffff800009ceb6a0 x27: =

ffff800008eaa038                                                     =

[    0.818245] x26: ffff8000092fe0b0 x25: ffff000000090000 x24: =

ffff000000090000                                                     =

[    0.825420] x23: 0000000000000000 x22: ffff800008ea95d8 x21: =

ffff0000028f4700                                                     =

[    0.832595] x20: 000000002faf0800 x19: 0000000000000000 x18: =

0000000000004590                                                     =

[    0.839770] x17: 0000000000004570 x16: 0000000000004560 x15: =

ffff8000092ff250                                                     =

[    0.846945] x14: 0000000000000000 x13: 3030303030303030 x12: =

3820657461722074                                                     =

[    0.854120] x11: 6e6572617020746e x10: 6572727563203a73 x9 : =

7563203a7367616c                                                     =

[    0.861295] x8 : 665f657461725f65 x7 : 205d373834393037 x6 : =

ffff800009a947c8                                                     =

[    0.868472] x5 : ffff800008eafe68 x4 : 0000000000000009 x3 : =

000000002faf0800                                                     =

[    0.875645] x2 : ffff800008eafef4 x1 : ffff800008eaa038 x0 : =

ffff8000092fd5b8                                                     =

[    0.882822] Call trace:                                                 =
                                                          =

[    0.885273]  clk_mux_determine_rate_flags+0x280/0x2cc                   =
                                                          =

[    0.890347]  clk_mux_determine_rate+0x10/0x20                           =
                                                          =

[    0.894720]  clk_core_determine_round_nolock+0x4c/0xb4                  =
                                                          =

[    0.899882]  clk_core_round_rate_nolock+0x30/0x80                       =
                                                          =

[    0.904607]  clk_core_round_rate_nolock+0x70/0x80                       =
                                                          =

[    0.909334]  clk_hw_round_rate+0x44/0x74                                =
                                                          =

[    0.913270]  clk_factor_round_rate+0x60/0x80                            =
                                                          =

[    0.917557]  clk_core_determine_round_nolock+0x88/0xb4                  =
                                                          =

[    0.922720]  clk_core_round_rate_nolock+0x30/0x80                       =
                                                          =

[    0.927445]  clk_core_set_rate_nolock.part.0+0xa4/0x1d0                 =
                                                          =

[    0.932695]  clk_set_rate_range_nolock+0x234/0x244                      =
                                                          =

[    0.937507]  __clk_put+0x60/0x12c                                       =
                                                          =

[    0.940834]  clk_put+0xc/0x1c                                           =
                                                          =

[    0.943809]  __set_clk_parents+0x12c/0x244                              =
                                                          =

[    0.947920]  of_clk_set_defaults+0x20/0x50                              =
                                                          =

[    0.952032]  of_clk_add_hw_provider.part.0+0x94/0x120                   =
                                                          =

[    0.957107]  of_clk_add_hw_provider+0x10/0x20                           =
                                                          =

[    0.961482]  imx8mp_clocks_probe+0x3458/0x34d0                          =
                                                          =

[    0.965945]  platform_probe+0x64/0x100                                  =
                                                          =

[    0.969707]  call_driver_probe+0x28/0x130                               =
                                                          =

[    0.973732]  really_probe+0x178/0x310                                   =
                                                          =

[    0.977409]  __driver_probe_device+0xfc/0x144                           =
                                                          =

[    0.981782]  driver_probe_device+0x38/0x12c                             =
                                                          =

[    0.985982]  __driver_attach+0xcc/0x220                                 =
                                                          =

[    0.989834]  bus_for_each_dev+0x6c/0xc0                                 =
                                                          =

[    0.993682]  driver_attach+0x20/0x2c                                    =
                                                          =

[    0.997270]  bus_add_driver+0x140/0x230                                 =
                                                          =

[    1.001120]  driver_register+0x74/0x120                                 =
                                                          =

[    1.004970]  __platform_driver_register+0x24/0x30                       =
                                                          =

[    1.009697]  imx8mp_clk_driver_init+0x18/0x20                           =
                                                          =

[    1.014070]  do_one_initcall+0x58/0x200                                 =
                                                          =

[    1.017920]  do_initcalls+0x164/0x19c                                   =
                                                          =

[    1.021597]  kernel_init_freeable+0x134/0x17c                           =
                                                          =

[    1.025970]  kernel_init+0x2c/0x150                                     =
                                                          =

[    1.029470]  ret_from_fork+0x10/0x20                                    =
                                                          =

[    1.033065] Code: f9000f94 912982c1 b0002900 9116e000 (f9400262)        =
                                                          =

[    1.039188] ---[ end trace 0000000000000000 ]---                        =
                                                          =

[    1.043869] Kernel panic - not syncing: Attempted to kill init! =

exitcode=3D0x0000000b                                               =

[    1.051523] SMP: stopping secondary CPUs                                =
                                                          =

[    1.055467] Kernel Offset: disabled                                     =
                                                          =

[    1.058960] CPU features: 0x000,00020009,00001082                       =
                                                          =

[    1.063684] Memory Limit: none                                          =
                                                          =

[    1.066748] ---[ end Kernel panic - not syncing: Attempted to kill init! =

exitcode=3D0x0000000b ]---
---

With the $subject patch reverted and bootable system:
---
[    0.659922] clk_core_set_rate_nolock: rate 1000000000                   =
                                                          =

[    0.662154] clk_core_set_rate_nolock: rounded rate 1000000000           =
                                                          =

[    0.667932] clk_core_set_rate_nolock: rate 800000000                    =
                                                          =

[    0.672918] clk_core_set_rate_nolock: rounded rate 800000000            =
                                                          =

[    0.678601] clk_core_set_rate_nolock: rate 500000000                    =
                                                          =

[    0.683592] clk_core_set_rate_nolock: rounded rate 500000000            =
                                                          =

[    0.689276] clk_core_set_rate_nolock: rate 400000000                    =
                                                          =

[    0.694267] clk_core_set_rate_nolock: rounded rate 400000000            =
                                                          =

[    0.699980] clk_core_set_rate_nolock: rate 800000000                    =
                                                          =

[    0.704942] clk_core_set_rate_nolock: rounded rate 800000000            =
                                                          =

[    0.710627] clk_core_set_rate_nolock: rate 393216000                    =
                                                          =

[    0.715611] clk_core_set_rate_nolock: rounded rate 393216000            =
                                                          =

[    0.721815] clk_core_set_rate_nolock: rate 361267200                    =
                                                          =

[    0.726284] clk_core_set_rate_nolock: rounded rate 361267200            =
                                                          =

[    0.734097] clk_core_set_rate_nolock: rate 800000000                    =
                                                          =

[    0.736977] clk_core_set_rate_nolock: rounded rate 800000000            =
                                                          =

[    0.742652] clk_core_set_rate_nolock: rate 400000000                    =
                                                          =

[    0.747645] clk_core_set_rate_nolock: rounded rate 400000000            =
                                                          =

[    0.754565] clk_core_set_rate_nolock: rate 500000000                    =
                                                          =

[    0.758331] clk_core_set_rate_nolock: rounded rate 500000000            =
                                                          =

[    0.764688] SoC: i.MX8MP revision 1.1                                   =
                                                          =

[    0.767931] clk_core_set_rate_nolock: rate 500000000                    =
                                                          =

[    0.772675] clk_core_set_rate_nolock: rounded rate 500000000            =
                                                          =

[    0.778354] clk_core_set_rate_nolock: rate 200000000                    =
                                                          =

[    0.783351] clk_core_set_rate_nolock: rounded rate 200000000            =
                                                          =

[    0.793748] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled     =
                                                          =

[    0.798952] 30860000.serial: ttymxc0 at MMIO 0x30860000 (irq =3D 34, =

base_baud =3D 5000000) is a IMX                                  =

[    0.806527] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq =3D 35, =

base_baud =3D 5000000) is a IMX                                  =

[    0.815329] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D 36, =

base_baud =3D 5000000) is a IMX                                  =

[    0.824176] 30a60000.serial: ttymxc3 at MMIO 0x30a60000 (irq =3D 43, =

base_baud =3D 1500000) is a IMX                                  =

[    0.832588] printk: console [ttymxc3] enabled                           =
                                                          =

[    0.832588] printk: console [ttymxc3] enabled                           =
                                                          =

[    0.841244] printk: bootconsole [ec_imx6q0] disabled                    =
                                                          =

[    0.841244] printk: bootconsole [ec_imx6q0] disabled                    =
                                                          =

[    0.857871] clk_core_set_rate_nolock: rate 80000000                     =
                                                          =

[    0.862796] clk_core_set_rate_nolock: rounded rate 80000000             =
                                                          =

[    0.868469] clk_core_set_rate_nolock: rate 20000000                     =
                                                          =

[    0.873364] clk_core_set_rate_nolock: rounded rate 20000000             =
                                                          =

[    0.879258] clk_core_set_rate_nolock: rate 80000000                     =
                                                          =

[    0.884154] clk_core_set_rate_nolock: rounded rate 80000000
[...]
---

The 500000000 and 800000000 look a bit like the assigned-clock-rates for =

clock-controller@30380000 in arch/arm64/boot/dts/freescale/imx8mp.dtsi

If you need some more information, do not hesitate to ask

Best regards,
Alexander

[1] https://lore.kernel.org/all/1911426.usQuhbGJ8B@steina-w/




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
