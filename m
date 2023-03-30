Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17326C761A6
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Mar 2023 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=otohMrqgzmWJupc7ODQn+u/kOMFK1l7sTTGv4O9kcFc=; b=lBWFbatYrFMdEJ
	qkiAkgcrTnE5++F8WtM404OfQaN4SGxcrU6rjBqBZ04YGOIgfWYfMel7y62tOFQ3IST1zvlPVGukm
	SlKeNwFglnLiTgiVVIqrhWa4WC+tiMDJXlc9YKKKxUbDL9hInhrNJlj6+PWgaBb7x9WqKowp2ANQv
	ZHr4rQn2480asuuep+b8UQkVO7l8vTmB1g9lESTCSTenRE6htgAUGy3dTKXxpsWk5lygfkJAKQLjF
	gMoYfXNnjMJaAitS78iDneAE/qSxMFEViiJDGPH8OCzi5Ay3c2Pugn6ZvdVTidbKihK2K7783B/jh
	rPtUCma9QYMqmwrLiYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phodL-003I1z-2y;
	Thu, 30 Mar 2023 09:31:51 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phodD-003Hxu-2U;
	Thu, 30 Mar 2023 09:31:49 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id C8CD82003F2;
	Thu, 30 Mar 2023 11:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1680168696;
	bh=8zerUhd2E6rSbbCao9Z2TfxP2RLYue3Wc35FzbQvKJE=;
	h=Date:To:From:Subject:Cc:From;
	b=N36vEqbTtSiGtP3PEHMFeO2WLN2oeqg+uDnVzgo+5QiAUxR3D/Ha/rY57T5UHkNHU
	 EhpxGOgykV8jirW6zozkHo/WYKISH4iSAn3b2eqQezbNFdu8jN6/gI50a4c6X+Iv8P
	 34Q/ooGsCA6dDcZRC6uzc6nFJKmXrLpJFymUkk9WNno2EjpmIHuTyI2X7khjinr3T/
	 ERQvgx5i1C/kEw6Ar373psn/Hhbeja17AFxw8xvvxbbUdGRvMNPQEtIxdHD/CZ4O+K
	 Q9FgVxpL8XxknbwNMuHa+NhGryvgM2TWCi0O4XRUoDo3QCMFGVIe5fyxHraxJqux8K
	 /XlHyLdEre65A==
Message-ID: <86e8d67d-d527-9432-03fe-aea749bcf3e4@free.fr>
Date: Thu, 30 Mar 2023 11:31:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Uses of unseeded randomness on arm64 board
Cc: Arnd Bergmann <arnd@arndb.de>, Theodore Ts'o <tytso@mit.edu>,
 Jason Donenfeld <Jason@zx2c4.com>, Pierre-Hugues Husson <phh@phh.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_023144_258623_835B6064 
X-CRM114-Status: UNSURE (   5.34  )
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

Hello,

Out of curiosity, I enabled WARN_ALL_UNSEEDED_RANDOM
for my S905X2 dev board (dmesg output provided below
for those interested in the result).

Relevant(?) crypto defconfig options:
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y

Regards


[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 6.2.0 (mgonzalez@venus) (aarch64-none-linux-gnu-gcc (GNU Toolchain for the A-profile Architecture 10.3-2021.07 (arm-10.29)) 10.3.1 20210621, GNU ld (GNU Toolchain for the A-profile Architecture 10.3-2021.07 (arm-10.29)) 2.36.1.20210621) #487 SMP PREEMPT Thu Mar 30 11:05:39 CEST 2023
[    0.000000] Machine model: SEI Robotics SEI510
[    0.000000] OF: reserved mem: node linux,cma compatible matching fail
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000004ffffff]
[    0.000000]   node   0: [mem 0x0000000005000000-0x00000000072fffff]
[    0.000000]   node   0: [mem 0x0000000007300000-0x000000007fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 19 pages/cpu s37288 r8192 d32344 u77824
[    0.000000] pcpu-alloc: s37288 r8192 d32344 u77824 alloc=19*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 516096
[    0.000000] Kernel command line: console=ttyAML0 debug nohlt
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 2002132K/2097152K available (7488K kernel code, 1026K rwdata, 2468K rodata, 6976K init, 379K bss, 95020K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000001] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
[    0.000049] random: get_random_u64 called from start_kernel+0x504/0x6c8 with crng_init=0
[    0.000128] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.000243] Console: colour dummy device 80x25
[    0.000277] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=96000)
[    0.000291] pid_max: default: 32768 minimum: 301
[    0.000382] random: get_random_bytes called from setup_net+0x50/0x330 with crng_init=0
[    0.000461] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.000478] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.000586] random: get_random_bytes called from uuid_gen+0x1c/0x50 with crng_init=0
[    0.000633] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.000715] random: get_random_bytes called from uuid_gen+0x1c/0x50 with crng_init=0
[    0.000735] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.001043] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001145] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001376] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001449] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001523] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001586] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001665] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001736] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001812] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001902] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.001970] cblist_init_generic: Setting adjustable number of callback queues.
[    0.001981] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.002003] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.002063] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.002084] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.002165] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.002232] rcu: Hierarchical SRCU implementation.
[    0.002238] rcu:     Max phase no-delay instances is 1000.
[    0.002271] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.002340] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.002736] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.002795] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.002839] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.002902] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.002963] smp: Bringing up secondary CPUs ...
[    0.003005] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.003077] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.003153] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.003238] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.003309] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.003548] Detected VIPT I-cache on CPU1
[    0.003683] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[    0.003800] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.003927] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.004001] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.004080] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.004161] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.004369] Detected VIPT I-cache on CPU2
[    0.004466] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
[    0.004545] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.004616] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.004690] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.004764] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.004829] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.005024] Detected VIPT I-cache on CPU3
[    0.005116] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
[    0.005171] smp: Brought up 1 node, 4 CPUs
[    0.005178] SMP: Total of 4 processors activated.
[    0.005185] CPU features: detected: 32-bit EL0 Support
[    0.005190] CPU features: detected: CRC32 instructions
[    0.005262] CPU: All CPU(s) started at EL2
[    0.005266] alternatives: applying system-wide alternatives
[    0.006153] random: get_random_bytes called from uuid_gen+0x1c/0x50 with crng_init=0
[    0.006187] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.006259] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.006458] devtmpfs: initialized
[    0.015687] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.015847] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.016192] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.016211] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.016309] pinctrl core: initialized pinctrl subsystem
[    0.016994] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017023] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017042] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017059] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017079] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017096] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017114] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017131] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017148] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017165] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017182] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017200] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017217] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017234] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017252] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017269] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017286] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017303] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017320] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017337] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017354] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017371] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017389] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017407] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017423] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017439] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017456] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017473] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017489] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017506] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017523] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017539] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.017560] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.018018] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocations
[    0.018076] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.018143] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.018190] audit: initializing netlink subsys (disabled)
[    0.018229] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.018342] audit: type=2000 audit(0.016:1): state=initialized audit_enabled=0 res=1
[    0.018633] thermal_sys: Registered thermal governor 'step_wise'
[    0.018696] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.018779] cpuidle: using governor menu
[    0.018869] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.018950] ASID allocator initialised with 65536 entries
[    0.034331] platform ff900000.vpu: Fixing up cyclic dependency with ff600000.hdmi-tx
[    0.039035] platform cvbs-connector: Fixing up cyclic dependency with ff900000.vpu
[    0.039558] platform hdmi-connector: Fixing up cyclic dependency with ff600000.hdmi-tx
[    0.042210] KASLR disabled due to lack of seed
[    0.042397] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.042730] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.042845] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.042985] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.043090] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.043306] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.044708] iommu: Default domain type: Translated 
[    0.044714] iommu: DMA domain TLB invalidation policy: strict mode 
[    0.044968] SCSI subsystem initialized
[    0.045099] usbcore: registered new interface driver usbfs
[    0.045129] usbcore: registered new interface driver hub
[    0.045161] usbcore: registered new device driver usb
[    0.045660] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.046332] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046362] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046379] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046397] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046413] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046429] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046446] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046463] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046480] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046496] random: get_random_bytes called from rc80211_minstrel_init+0x5c/0xf8 with crng_init=0
[    0.046634] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.046730] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.046969] clocksource: Switched to clocksource arch_sys_counter
[    0.047245] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.047329] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.047400] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.047470] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.047546] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.047623] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.047719] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.047799] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.047876] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.047972] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048044] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048155] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048236] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048314] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048398] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048482] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048577] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048656] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048736] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048813] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048891] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.048967] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049060] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049135] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049214] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049292] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049367] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049442] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049517] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049596] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049679] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049755] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049831] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049909] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.049989] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050068] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050142] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050218] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050299] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050376] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050455] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050538] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050628] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050705] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050779] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050870] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.050950] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051039] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051115] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051194] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051272] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051352] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051430] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051510] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051591] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051670] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051748] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051839] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051919] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.051995] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052076] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052154] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052236] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052313] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052387] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052467] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052547] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052630] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052717] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052794] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052871] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.052949] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.053022] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.053101] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.053174] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.053256] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.053334] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.053412] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.053635] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.053798] NET: Registered PF_INET protocol family
[    0.053823] random: get_random_u32 called from __get_random_u32_below+0x18/0x70 with crng_init=0
[    0.053859] random: get_random_u32 called from neigh_hash_alloc+0x80/0xd0 with crng_init=0
[    0.053878] random: get_random_u32 called from neigh_hash_alloc+0x80/0xd0 with crng_init=0
[    0.053893] random: get_random_u32 called from neigh_hash_alloc+0x80/0xd0 with crng_init=0
[    0.053907] random: get_random_u32 called from neigh_hash_alloc+0x80/0xd0 with crng_init=0
[    0.053991] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.054057] IP idents hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.054065] random: get_random_bytes called from ip_rt_init+0x84/0x204 with crng_init=0
[    0.055439] random: get_random_u32 called from __get_random_u32_below+0x18/0x70 with crng_init=0
[    0.055607] random: get_random_u32 called from rt_genid_init+0x20/0x40 with crng_init=0
[    0.055622] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.055674] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes, linear)
[    0.055734] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.055750] TCP established hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.055865] TCP bind hash table entries: 16384 (order: 7, 524288 bytes, linear)
[    0.056278] TCP: Hash tables configured (established 16384 bind 16384)
[    0.056379] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    0.056427] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    0.056548] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.056610] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.057562] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.063306] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.063385] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.063433] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.063472] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.063512] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.063565] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.068482] Initialise system trusted keyrings
[    0.068505] random: get_random_bytes called from key_alloc+0x2bc/0x520 with crng_init=0
[    0.068535] random: get_random_bytes called from key_alloc+0x2bc/0x520 with crng_init=0
[    0.068548] random: get_random_bytes called from key_alloc+0x2bc/0x520 with crng_init=0
[    0.068560] random: get_random_bytes called from key_alloc+0x2bc/0x520 with crng_init=0
[    0.068572] random: get_random_bytes called from key_alloc+0x2bc/0x520 with crng_init=0
[    0.068653] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.068784] workingset: timestamp_bits=62 max_order=19 bucket_order=0
[    0.068956] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.068989] random: get_random_u32 called from bucket_table_alloc.isra.0+0x64/0x150 with crng_init=0
[    0.081446] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081538] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081581] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081622] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081662] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081705] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081748] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081790] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081833] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081880] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081921] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.081963] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082006] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082049] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082091] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082136] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082178] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082221] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082267] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082310] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082368] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082410] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082449] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082491] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082530] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082569] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082612] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082657] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082698] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082741] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082784] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082827] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082868] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082908] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.082948] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083040] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083081] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083126] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083168] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083211] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083254] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083297] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083338] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083392] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083431] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083472] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083512] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083555] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083596] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083638] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083683] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083726] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083768] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083810] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083851] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083892] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083935] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.083975] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084015] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084054] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084094] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084138] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084178] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084221] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084263] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084306] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084368] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084409] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084449] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084492] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084538] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084590] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084638] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084680] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084721] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084763] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084804] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084847] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084891] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084933] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.084973] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085024] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085102] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085152] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085205] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085252] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085296] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085346] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085400] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085469] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085528] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085582] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085632] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085683] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085733] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085788] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085835] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085884] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085937] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.085988] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086029] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086071] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086114] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086160] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086201] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086246] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086296] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086340] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086395] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086446] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086496] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086545] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086603] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086656] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086711] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086754] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086802] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086851] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.086892] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.087055] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.087112] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.087162] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.087213] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.087265] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.087308] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.087348] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.087395] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.100855] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.100979] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.104655] Key type asymmetric registered
[    0.104673] Asymmetric key parser 'x509' registered
[    0.104788] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    0.104795] io scheduler mq-deadline registered
[    0.104799] io scheduler kyber registered
[    0.105215] irq_meson_gpio: 100 to 8 gpio interrupt mux initialized
[    0.105945] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.108594] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.108604] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.109658] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.109744] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.117325] soc soc0: Amlogic Meson G12A (S905X2) Revision 28:b (40:2) Detected
[    0.118885] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.118954] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    0.119490] ff803000.serial: ttyAML0 at MMIO 0xff803000 (irq = 14, base_baud = 1500000) is a meson_uart
[    0.119513] printk: console [ttyAML0] enabled
[    0.122920] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.123153] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.123216] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.123271] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.125924] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.126119] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.126210] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.126259] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.129534] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.129638] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.134939] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.169502] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.169614] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.169759] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.169806] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.171630] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.171729] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.171950] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.171999] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.198292] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.198430] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.204095] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.218025] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.218170] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.220975] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.221112] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.221242] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.221288] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.221448] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.221492] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.225212] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.225338] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.227608] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.227730] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.227859] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.227906] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.227983] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.257388] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.257554] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.259909] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260018] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260070] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260113] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260157] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260209] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260289] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260356] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260434] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260501] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260574] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260727] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260772] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260826] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260870] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260917] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.260973] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.261027] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.261085] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.261132] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.261230] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.261283] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.261349] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.261414] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.261498] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264122] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264227] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264298] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264345] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264388] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264443] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264498] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264554] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264607] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264652] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264698] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264741] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264782] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264824] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264870] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264924] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.264978] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265019] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265081] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265124] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265167] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265208] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265256] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265296] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265340] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265385] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265429] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265473] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265517] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265558] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265598] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265640] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265683] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265727] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265767] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265811] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265854] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265896] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265939] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.265985] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266026] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266086] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266129] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266172] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266215] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266260] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266305] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266349] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266391] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266433] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266476] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266519] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266564] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266607] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266653] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266698] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266742] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266783] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266825] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266868] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266911] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.266956] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267023] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267067] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267125] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267170] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267214] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267255] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267296] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267338] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267383] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267427] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267469] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267511] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267550] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267593] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267635] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267682] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267723] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267768] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267811] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267853] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267897] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267942] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.267986] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.268030] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.268074] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.268137] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.268180] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.268223] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.268265] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.268310] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.268359] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.270630] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.270734] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.270780] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.270822] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.270864] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.270918] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271082] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271131] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271174] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271218] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271262] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271303] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271347] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271390] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271433] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271479] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271523] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271594] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271638] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271680] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271722] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271766] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271808] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271849] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271890] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271935] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.271979] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272021] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272065] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272108] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272163] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272265] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272309] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272356] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272399] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272444] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272491] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272535] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272578] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272619] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272678] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272722] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272765] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272806] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272851] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272895] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272938] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.272981] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273023] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273070] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273113] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273155] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273198] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273238] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273281] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273325] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273366] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273413] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273459] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273500] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273543] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273586] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273628] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273689] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273732] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273783] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273824] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273867] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273913] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.273958] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274002] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274046] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274090] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274131] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274174] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274218] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274262] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274304] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274351] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274394] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274438] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274480] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274524] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274568] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.274617] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330331] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330465] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330515] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330559] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330600] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330645] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330689] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330731] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330775] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330818] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330861] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330902] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.330944] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331032] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331075] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331115] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331157] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331201] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331246] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331289] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331333] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331374] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331418] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331463] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331524] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331567] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331613] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331659] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.331717] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.335978] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.336096] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.336140] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.336197] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.342616] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.343505] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.343626] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.349887] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.350008] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.355999] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.356109] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.356182] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.356425] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.356472] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.356522] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.359111] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.359230] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.359288] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.359452] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.359496] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.359542] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.361418] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.361496] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.361554] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.364567] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.364677] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.364749] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.372846] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.372962] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.373021] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.373217] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.373263] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.386939] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387127] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387189] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387245] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387303] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387350] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387397] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387497] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387591] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387670] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387721] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387763] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387809] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387852] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387895] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387944] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.387988] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.388031] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.388074] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.388120] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.394596] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.394712] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.394758] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.394806] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.394848] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.394904] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.394950] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.395033] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.395080] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.395123] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.395182] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.401832] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.401970] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.402017] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.402060] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.402104] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.402154] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.402205] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.402248] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.402293] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.402356] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414076] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414194] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414251] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414340] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414383] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414439] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414485] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414525] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414567] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414612] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414654] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414696] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414737] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.414775] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    0.835124] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    6.620011] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    6.620109] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    6.620713] ffd24000.serial: ttyAML6 at MMIO 0xffd24000 (irq = 15, base_baud = 1500000) is a meson_uart
[    6.645757] random: get_random_u32 called from shmem_get_inode+0x184/0x380 with crng_init=0
[    6.645968] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    6.646416] random: get_random_u64 called from copy_process+0x2ac/0x1410 with crng_init=0
[    6.646540] random: crng init done
[    6.678001] loop: module loaded
[    6.681272] usbcore: registered new interface driver usb-storage
[    6.683123] meson-vrtc ff8000a8.rtc: registered as rtc0
[    6.687753] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:06 UTC (6)
[    6.695854] i2c_dev: i2c /dev entries driver
[    6.706814] meson-sm: secure-monitor enabled
[    6.707072] meson-g12-ddr-pmu ff638000.pmu: can't request region for resource [mem 0xff638000-0xff6380ff]
[    6.707273] meson-gx-mmc ffe03000.sd: allocated mmc-pwrseq
[    6.714951] meson-g12-ddr-pmu: probe of ff638000.pmu failed with error -16
[    6.721121] Pmmc2
[    6.727920] NET: Registered PF_PACKET protocol family
[    6.734121] Key type dns_resolver registered
[    6.741076] registered taskstats version 1
[    6.742438] Loading compiled-in X.509 certificates
[    6.777927] Qmmc2
[    6.816090] meson8b-dwmac ff3f0000.ethernet: IRQ eth_wake_irq not found
[    6.819061] meson8b-dwmac ff3f0000.ethernet: IRQ eth_lpi not found
[    6.825143] meson8b-dwmac ff3f0000.ethernet: PTP uses main clock
[    6.831594] meson8b-dwmac ff3f0000.ethernet: User ID: 0x11, Synopsys ID: 0x37
[    6.838122] meson8b-dwmac ff3f0000.ethernet:         DWMAC1000
[    6.843316] meson8b-dwmac ff3f0000.ethernet: DMA HW capability register supported
[    6.850707] meson8b-dwmac ff3f0000.ethernet: RX Checksum Offload Engine supported
[    6.858123] meson8b-dwmac ff3f0000.ethernet: COE Type 2
[    6.863298] meson8b-dwmac ff3f0000.ethernet: TX Checksum insertion supported
[    6.870314] meson8b-dwmac ff3f0000.ethernet: Wake-Up On Lan supported
[    6.876767] meson8b-dwmac ff3f0000.ethernet: Normal descriptors
[    6.882533] meson8b-dwmac ff3f0000.ethernet: Ring mode enabled
[    6.885246] sdio_read_cis: vendor=2d0 dev=4359
[    6.888314] meson8b-dwmac ff3f0000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    6.888690] sdio_read_cis: vendor=2d0 dev=4359
[    6.894196] dwc3-meson-g12a ffe09000.usb: USB2 ports: 2
[    6.901071] sdio_read_cis: vendor=2d0 dev=4359
[    6.905044] dwc3-meson-g12a ffe09000.usb: USB3 ports: 1
[    6.908169] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    6.910226] mmc2: new ultra high speed SDR50 SDIO card at address 0001
[    6.914632] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
[    6.920392] brcmfmac: F1 signature read @0x18000000=0x17294359
[    6.925339] xhci-hcd xhci-hcd.1.auto: hcc params 0x0228fe6c hci version 0x110 quirks 0x0000000000010010
[    6.931827] brcmfmac: BCM4359/9: chip=4359 rev=9
[    6.939323] xhci-hcd xhci-hcd.1.auto: irq 19, io mem 0xff500000
[    6.947078] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4359-sdio for chip BCM4359/9
[    6.954515] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
[    6.959160] brcmfmac mmc2:0001:1: Direct firmware load for brcm/brcmfmac4359-sdio.seirobotics,sei510.bin failed with error -2
[    6.964818] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
[    6.964826] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
[    6.974605] brcmfmac mmc2:0001:1: Direct firmware load for brcm/brcmfmac4359-sdio.clm_blob failed with error -2
[    6.979264] hub 1-0:1.0: USB hub found
[    7.017712] hub 1-0:1.0: 2 ports detected
[    7.021954] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    7.030013] hub 2-0:1.0: USB hub found
[    7.033400] hub 2-0:1.0: 1 port detected
[    7.038330] meson-gx-mmc ffe07000.mmc: allocated mmc-pwrseq
[    7.044423] Pmmc1
[    7.055639] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    7.065056] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    7.073757] Freeing unused kernel memory: 6976K
[    7.076841] Qmmc1
[    7.087040] Run /init as init process
[    7.087069]   with arguments:
[    7.089898]     /init
[    7.092149]   with environment:
[    7.095251]     HOME=/
[    7.097574]     TERM=linux
[    7.233274] mmc1: new HS200 MMC card at address 0001
[    7.233835] mmcblk1: mmc1:0001 8GTF4R 7.28 GiB 
[    7.238687] mmcblk1boot0: mmc1:0001 8GTF4R 4.00 MiB 
[    7.243047] mmcblk1boot1: mmc1:0001 8GTF4R 4.00 MiB 
[    7.247730] mmcblk1rpmb: mmc1:0001 8GTF4R 512 KiB, chardev (248:0)
[    7.347269] brcmfmac: brcmf_wcc_attach: executing
[    7.363078] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may have limited channels available
[    7.371097] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4359/9 wl0: Dec  3 2021 10:19:31 version 9.87.51.11.79 (g6ac4dbb) FWID 01-154df7ac

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
