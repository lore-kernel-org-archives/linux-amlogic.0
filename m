Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF72CD343F
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2026 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKgOFZ26oYVp6db4Vr5ijwQlulHheQxzSvhXaOcL7zo=; b=ihu5g8Irl1Q8lf
	xL/5DmPFR56tMNAJwVNF2NnUGGtgIGxgYTbmJGEMYgy0KOCm6jlSAasJqPCFHhbHdzLe23uv7DobR
	lCdaZSoUbfICJtlMem+tTx4gSr9TAe3wca8dfDrApc4NONrg+tyGLV3oE8sujbjK2X/UAd+ba0pgf
	FHmPfDHZK9lTmKW79NmHrVjcGJehiybnu4zA7v6IqBv6JCZMQDJrxOjce08GQhpW5cLu195CAm85g
	vXQaXp9eB2uYQdXuW8Cvq7FwfBLlygo5mvtWit8nwVdR4HFpxI3hEj4pc18VNsb0fDH1Y5quy7JCg
	NsNqfMr090ZrS/yIiOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpi9-000000081rD-1eFB;
	Fri, 15 May 2026 10:24:05 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpi6-000000081ps-0pXo
	for linux-amlogic@lists.infradead.org;
	Fri, 15 May 2026 10:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=PvbSSysDoVrZemjFZZG7ax47szEisjMVuslblnZ/F/M=; 
	b=gcmEkcGF5jhn2B7c1fNZVcM97LSD2U5nM7S8l4g58eR+wlqh0pUnoVqCYPfh/paOUM6xhr4/3Pe
	KAXvKYJR5XJScRPqMZaEUquKn6IJa+U9/gwjBV94K/dgqi31GWdJ79qIfM6Iw+92+5s9jSWdGEiBT
	M6aAac4HBJi2FbMpQHKDEimGF8kqSBirSG4gVFiNBtIA4tmRsKpMWLx5fHAMEZvRveRN8csmaCqlf
	mWsT2shBnFlFHo3xRPaTEfpG2AAs+B+nmA2waPVtojKAn7hNhoWzxOZeP8zzOxerStpWsgwBmU0K8
	ApDzJjptSBH6rFqpAU6KNMibhAOW8zGsLIZA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wNphz-00EOYM-2R;
	Fri, 15 May 2026 18:23:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 15 May 2026 18:23:55 +0800
Date: Fri, 15 May 2026 18:23:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: clabbe@baylibre.com, davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn, stable@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>
Subject: Re: [PATCH] crypto: amlogic - avoid double cleanup in
 meson_crypto_probe()
Message-ID: <agb0O_i_QJCTuKPU@gondor.apana.org.au>
References: <20260508042416.419216-1-dawei.feng@seu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508042416.419216-1-dawei.feng@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_032402_251361_43E07678 
X-CRM114-Status: GOOD (  18.37  )
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

On Fri, May 08, 2026 at 12:24:16PM +0800, Dawei Feng wrote:
> When meson_allocate_chanlist() fails after a partial allocation, it already
> unwinds the allocated chanlist state through its local error path.
> meson_crypto_probe() then jump to error_flow and calls
> meson_free_chanlist() again, causing the same per-flow resources to be torn
> down twice. In the reproduced failure path, the second teardown
> re-entered crypto_engine_exit() on an already destroyed worker and KASAN
> reported a slab-use-after-free in kthread_destroy_worker().
> 
> Prevent double-free by handling partial allocation failures locally within
> meson_allocate_chanlist() and skipping the outer cleanup path.
> 
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available.
> 
> The bug was reproduced in a QEMU x86_64 guest booted with KASAN on v7.1,
> using the reproducer under tools/testing/meson_crypto_probe. The reproducer
> forces the second dma_alloc_attrs() call in the gxl-crypto probe path to
> return NULL, making meson_allocate_chanlist() fail after partial
> initialization. On the unpatched kernel this reliably triggered a
> slab-use-after-free. With this fix applied, the same reproducer no longer
> emits any KASAN report and the probe fails cleanly with -ENOMEM.
> 
>     ==================================================================
>     BUG: KASAN: slab-use-after-free in kthread_destroy_worker+0xb2/0xd0
>     Read of size 8 at addr ff1100010c057a68 by task insmod/265
> 
>     CPU: 1 UID: 0 PID: 265 Comm: insmod Tainted: G           O        7.1.0-rc2-00376-g810af9adc907-dirty #10 PREEMPT(lazy)
>     Tainted: [O]=OOT_MODULE
>     Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x68/0xa0
>      print_report+0xcb/0x5e0
>      ? __virt_addr_valid+0x21d/0x3f0
>      ? kthread_destroy_worker+0xb2/0xd0
>      ? kthread_destroy_worker+0xb2/0xd0
>      kasan_report+0xca/0x100
>      ? kthread_destroy_worker+0xb2/0xd0
>      kthread_destroy_worker+0xb2/0xd0
>      meson_crypto_probe+0x4d0/0xc10 [amlogic_gxl_crypto]
>      platform_probe+0x99/0x140
>      really_probe+0x1c6/0x6a0
>      ? __pfx___device_attach_driver+0x10/0x10
>      __driver_probe_device+0x248/0x310
>      ? acpi_driver_match_device+0xb0/0x100
>      driver_probe_device+0x48/0x210
>      ? __pfx___device_attach_driver+0x10/0x10
>      __device_attach_driver+0x160/0x320
>      bus_for_each_drv+0x104/0x190
>      ? __pfx_bus_for_each_drv+0x10/0x10
>      ? _raw_spin_unlock_irqrestore+0x2c/0x50
>      __device_attach+0x19d/0x3b0
>      ? __pfx___device_attach+0x10/0x10
>      ? do_raw_spin_unlock+0x53/0x220
>      device_initial_probe+0x78/0xa0
>      bus_probe_device+0x5b/0x130
>      device_add+0xcfd/0x1430
>      ? __pfx_device_add+0x10/0x10
>      ? insert_resource+0x34/0x50
>      ? lock_release+0xc9/0x290
>      platform_device_add+0x24e/0x590
>      ? __pfx_meson_crypto_probe_repro_init+0x10/0x10 [meson_crypto_probe_repro]
>      meson_crypto_probe_repro_init+0x330/0xff0 [meson_crypto_probe_repro]
>      do_one_initcall+0xc0/0x450
>      ? __pfx_do_one_initcall+0x10/0x10
>      ? _raw_spin_unlock_irqrestore+0x2c/0x50
>      ? __create_object+0x59/0x80
>      ? kasan_unpoison+0x27/0x60
>      do_init_module+0x27b/0x7d0
>      ? __pfx_do_init_module+0x10/0x10
>      ? kasan_quarantine_put+0x84/0x1d0
>      ? kfree+0x32c/0x510
>      ? load_module+0x561e/0x5ff0
>      load_module+0x54fe/0x5ff0
>      ? __pfx_load_module+0x10/0x10
>      ? security_file_permission+0x20/0x40
>      ? kernel_read_file+0x23d/0x6e0
>      ? mmap_region+0x235/0x4a0
>      ? __pfx_kernel_read_file+0x10/0x10
>      ? __file_has_perm+0x2c0/0x3e0
>      init_module_from_file+0x158/0x180
>      ? __pfx_init_module_from_file+0x10/0x10
>      ? __lock_acquire+0x45a/0x1ba0
>      ? idempotent_init_module+0x315/0x610
>      ? lock_release+0xc9/0x290
>      ? lockdep_init_map_type+0x4b/0x220
>      ? do_raw_spin_unlock+0x53/0x220
>      idempotent_init_module+0x330/0x610
>      ? __pfx_idempotent_init_module+0x10/0x10
>      ? __pfx_cred_has_capability.isra.0+0x10/0x10
>      ? ksys_mmap_pgoff+0x385/0x520
>      __x64_sys_finit_module+0xbe/0x120
>      do_syscall_64+0x115/0x690
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7f7d6d31690d
>     Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f3 b4 0f 00 f7 d8 >
>     RSP: 002b:00007fffc027ac68 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>     RAX: ffffffffffffffda RBX: 000055f7b81967c0 RCX: 00007f7d6d31690d
>     RDX: 0000000000000000 RSI: 000055f79a0d6cd2 RDI: 0000000000000003
>     RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000003 R11: 0000000000000246 R12: 000055f79a0d6cd2
>     R13: 000055f7b8196790 R14: 000055f79a0d5888 R15: 000055f7b81968e0
>      </TASK>
> 
> Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
