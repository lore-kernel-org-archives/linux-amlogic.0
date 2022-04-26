Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6C6C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Apr 2022 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8D9FgAgW2fdHoY+D8gbBIcy0afLA2nplleIWF59q3o=; b=LVLOfwwHzNmoFN
	NH3KI+bgAYDPg+dRfIIvGNwGiMDCoUXbWFvEbAF62T8ir04KJojpojb674VDYW09aH9Adym8vXFcv
	CYjP0k2WwtxwZmrzHaCoxzWKhU51gPUy83Ew7LwD09HKAvkvVqFddbWrD4d8aATvpjjsSJpHw8oeW
	LkoQFh3o5SP5+9ArUy6X6LHl6GRlMbl0axBrT2NYVTEaJS4zoCAEcdzUyrDxWsfoolf4fvI2QlAek
	D0JMpehMZj6plIdxySeF4l2PEhb8IF0Q31oYuBUw355cfSkxbJSGUSj989RbevfHHanUXkvolkvAn
	WguXVTLZ0dISu3yAjhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFcv-00CxuB-2p; Tue, 26 Apr 2022 07:28:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFcg-00CxpY-0N
 for linux-amlogic@lists.infradead.org; Tue, 26 Apr 2022 07:28:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id s21so9413696wrb.8
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Apr 2022 00:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=l1zJ8VxlH95i7bmbkW5DusyY0riNEFcvoXkV25MSWC8=;
 b=VBnruITIbTdIQ1ok28CoYp2T/geNiC7br3ch1I5mmowT7lmF+Yx5tnqpvvUp3xhkB2
 nBRbeolwRzPg1n3WzeYJFpyFOiUDLPKeYHKfm0nE4RPU80tAjwC8wJxcWOhTdCu02tUo
 8FW6o6tgGBHS/AAzC3K+bzCNXJvtGac2XZDqq2yc8KxYPfGgKgTUb13EhqeuZFkXIm8Q
 yjjTLYvKTRwjIvbTtzX4kdvz9B5UYvsqOawCjUF2p5ZvYRhCmeb+djHG/PVX/EpysLIH
 TBVLvFD1BfPYGtbz76Ss1n7ZOBNa+3VXwb7Ivdfwzq8vA9NNiKOTrx9nCfwxUlxVEIzt
 Gqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=l1zJ8VxlH95i7bmbkW5DusyY0riNEFcvoXkV25MSWC8=;
 b=H9SI64bgs+AFQSaKerLKxKGauw5V3YV3PjejmPN92aehPhbjGCgufSPWFuRzSao6wT
 1OKLH/XfklRAmapKZI4KT3e2m5z1XPWFlDTLm8V2h/xFh3R0iRX7VGs/40hxv+qVLt1v
 uOBO+LcT1hMSvUaXPK+VKdTwyzySruGIXJfEOrtl0w1xa/6S7vv1qimomZVxJEpfn9ez
 +Xy3TcfrpvkXiUpBHntHZOopvnLDysoU14e3j3C9sjV7eVThG89+spSq19vWQ29rBvX/
 01N8oY3dKv/WEoHmWWFfzasiAg18FT7JAIjRKd8jxyJv/4qRT1nbjaL8lckdAyPcMfKo
 nTRg==
X-Gm-Message-State: AOAM532ShayhF+CLwn9fDrE5OmnXPYy3+hN1onFhjfdav1y+VmZJ1dCV
 Y9fhtwHET01fkOQ16xHxwN87TQ==
X-Google-Smtp-Source: ABdhPJzFcW7fVqynzwnqu1+kGpV39ntF7L0H81VEZf7ot/PyQDhb1FyaJ62ipAbxKN0XJD/L3aJVNA==
X-Received: by 2002:a05:6000:1787:b0:20a:8b96:6342 with SMTP id
 e7-20020a056000178700b0020a8b966342mr17037980wrg.653.1650958110537; 
 Tue, 26 Apr 2022 00:28:30 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5959:ca32:2e01:b6fc?
 ([2001:861:44c0:66c0:5959:ca32:2e01:b6fc])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm13927451wmb.48.2022.04.26.00.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:28:29 -0700 (PDT)
Message-ID: <a8b8d5e8-758a-3cf5-6798-6769021ec4b4@baylibre.com>
Date: Tue, 26 Apr 2022 09:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Solid green screen with experimental panfrost/hdmi sc2 support
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <210d9cab-9704-1ece-a046-9ae1f61e09f6@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <210d9cab-9704-1ece-a046-9ae1f61e09f6@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_002834_158504_5CBF80B0 
X-CRM114-Status: GOOD (  32.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 25/04/2022 22:21, Heiner Kallweit wrote:
> Based on a HK1 RBOX X4 (S905X4) I'm "playing" with mainline support for SC2.
> This Android TV box is based on the ah212 reference board according to uboot prompt.
> Most relevant things are working meanwhile (eMMC, SD, SDIO/WiFi, USB2/3, ethernet)
> and I can use the system headless.
> However I'm struggling with panfrost/hdmi. With SC2 a lot of vpu registers have been
> relocated (e.g. all hhi regs), even though the functionality seems to be more or less
> compatible to G12A. I had to extend the timeout for HDMI PLL locking.
> After having sorted out such things:
> - dmesg for panfrost and hdmi looks normal
> - monitor detects signal and OSD shows correct resolution (1920x1080@60 in my case).
> I'd interpret this in a way that the clock/divider/mux registers are programmed correctly.
> However I just get a solid green screen. From what I've read this can be caused
> by a failing hdmi handshake. Not being an expert in DRM/HDMI any hint on where to start
> debugging would be appreciated.

A solid green means the pipeline has been correctly set up in regard to the clocking,
and some (invalid) pixels flows to the HDMI transceiver.

This means you can consider the HDMI & clock portion OK, and propably the ENCP aswell.

The OSD video pipeline is the following:

[ DDR -> VIU (RGB2YUV) -> VPP (Blending of planes, Scaling) -> ENCP (Pixel generation) -> HDMI-TX -> TMDS]

Green means value 0 in YUV, this means 0 is in the YUV pipeline, so it must be an issue with the VIU
part reading from DDR and doing the color conversion.

Check in the downstrean source code how the SC2 VPU is initialized, and looks at the differences since SM1.
Look at the VIU & VPP stuff init.

Neil

> 
> 
> Booting Linux on physical CPU 0x0000000000 [0x412fd050]
> Linux version 5.18.0-rc2-next-20220414+ (root@zotac) (aarch64-linux-gnu-gcc (GCC) 11.2.0, GNU ld (GNU Binutils) 2.38) #22 SMP PREEMPT Sun Apr 24 00:04:54 CEST 2022
> Machine model: Amlogic SC2 AH212
> Reserved memory: created CMA memory pool at 0x0000000074400000, size 188 MiB
> OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
> NUMA: No NUMA configuration found
> NUMA: Faking a node at [mem 0x0000000000000000-0x000000007fffffff]
> NUMA: NODE_DATA [mem 0x73fe8b40-0x73feafff]
> Zone ranges:
>    DMA      [mem 0x0000000000000000-0x000000007fffffff]
>    DMA32    empty
>    Normal   empty
> Movable zone start for each node
> Early memory node ranges
>    node   0: [mem 0x0000000000000000-0x0000000000ffffff]
>    node   0: [mem 0x0000000001000000-0x0000000004ffffff]
>    node   0: [mem 0x0000000005000000-0x00000000083fffff]
>    node   0: [mem 0x0000000008400000-0x000000000fffffff]
>    node   0: [mem 0x0000000010000000-0x00000000101fffff]
>    node   0: [mem 0x0000000010200000-0x000000007fffffff]
> Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
> psci: probing for conduit method from DT.
> psci: PSCIv1.0 detected in firmware.
> psci: Using standard PSCI v0.2 function IDs
> psci: Trusted OS migration not required
> psci: SMC Calling Convention v1.1
> percpu: Embedded 20 pages/cpu s42792 r8192 d30936 u81920
> pcpu-alloc: s42792 r8192 d30936 u81920 alloc=20*4096
> pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
> Detected VIPT I-cache on CPU0
> CPU features: detected: Virtualization Host Extensions
> CPU features: detected: ARM errata 1165522, 1319367, or 1530923
> alternatives: patching kernel code
> Fallback order for Node 0: 0
> Built 1 zonelists, mobility grouping on.  Total pages: 516096
> Policy zone: DMA
> Kernel command line: rw root=/dev/mmcblk0p3 rootwait console=ttyAML0,921600n8 earlyprintk=serial,ttyAML0,921600 audit=0
> audit: disabled (until reboot)
> Unknown kernel command line parameters "earlyprintk=serial,ttyAML0,921600", will be passed to user space.
> Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> mem auto-init: stack:off, heap alloc:off, heap free:off
> Memory: 1772604K/2097152K available (10752K kernel code, 1442K rwdata, 4296K rodata, 2816K init, 472K bss, 132036K reserved, 192512K cma-reserved)
> SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> rcu: Preemptible hierarchical RCU implementation.
> rcu: 	RCU event tracing is enabled.
> rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
> 	Trampoline variant of Tasks RCU enabled.
> 	Tracing variant of Tasks RCU enabled.
> rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
> NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> Root IRQ handler: gic_handle_irq
> GIC: Using split EOI/Deactivate mode
> rcu: srcu_init: Setting srcu_struct sizes based on contention.
> random: get_random_bytes called from start_kernel+0x6e0/0x9b8 with crng_init=0
> arch_timer: cp15 timer(s) running at 24.00MHz (phys).
> clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
> sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
> Console: colour dummy device 80x25
> Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=96000)
> pid_max: default: 32768 minimum: 301
> LSM: Security Framework initializing
> Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> cblist_init_generic: Setting adjustable number of callback queues.
> cblist_init_generic: Setting shift to 2 and lim to 1.
> cblist_init_generic: Setting shift to 2 and lim to 1.
> rcu: Hierarchical SRCU implementation.
> smp: Bringing up secondary CPUs ...
> Detected VIPT I-cache on CPU1
> CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> Detected VIPT I-cache on CPU2
> CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> Detected VIPT I-cache on CPU3
> CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> smp: Brought up 1 node, 4 CPUs
> SMP: Total of 4 processors activated.
> CPU features: detected: 32-bit EL0 Support
> CPU features: detected: 32-bit EL1 Support
> CPU features: detected: Data cache clean to the PoU not required for I/D coherence
> CPU features: detected: Common not Private translations
> CPU features: detected: CRC32 instructions
> CPU features: detected: RCpc load-acquire (LDAPR)
> CPU features: detected: LSE atomic instructions
> CPU features: detected: Privileged Access Never
> CPU features: detected: RAS Extension Support
> CPU features: detected: Speculative Store Bypassing Safe (SSBS)
> CPU: All CPU(s) started at EL2
> devtmpfs: initialized
> clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
> pinctrl core: initialized pinctrl subsystem
> NET: Registered PF_NETLINK/PF_ROUTE protocol family
> DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocations
> DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> thermal_sys: Registered thermal governor 'step_wise'
> thermal_sys: Registered thermal governor 'power_allocator'
> cpuidle: using governor menu
> hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> ASID allocator initialised with 65536 entries
> Serial: AMBA PL011 UART driver
> platform ff000000.vpu: Fixing up cyclic dependency with fe300000.hdmi-tx
> platform cvbs-connector: Fixing up cyclic dependency with ff000000.vpu
> platform hdmi-connector: Fixing up cyclic dependency with fe300000.hdmi-tx
> HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
> HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
> HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
> iommu: Default domain type: Translated
> iommu: DMA domain TLB invalidation policy: strict mode
> SCSI subsystem initialized
> usbcore: registered new interface driver usbfs
> usbcore: registered new interface driver hub
> usbcore: registered new device driver usb
> pps_core: LinuxPPS API ver. 1 registered
> pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> PTP clock support registered
> EDAC MC: Ver: 3.0.0
> FPGA manager framework
> Advanced Linux Sound Architecture Driver Initialized.
> vgaarb: loaded
> clocksource: Switched to clocksource arch_sys_counter
> VFS: Disk quotas dquot_6.6.0
> VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> NET: Registered PF_INET protocol family
> IP idents hash table entries: 32768 (order: 6, 262144 bytes, linear)
> tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes, linear)
> TCP established hash table entries: 16384 (order: 5, 131072 bytes, linear)
> TCP bind hash table entries: 16384 (order: 6, 262144 bytes, linear)
> TCP: Hash tables configured (established 16384 bind 16384)
> UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
> UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)
> NET: Registered PF_UNIX/PF_LOCAL protocol family
> PCI: CLS 0 bytes, default 64
> armv8-pmu ff634680.arm_pmu: hw perfevents: no interrupt-affinity property, guessing.
> hw perfevents: enabled with armv8_pmuv3 PMU driver, 7 counters available
> kvm [1]: IPA Size Limit: 40 bits
> kvm [1]: vgic interrupt IRQ9
> kvm [1]: VHE mode initialized successfully
> Initialise system trusted keyrings
> workingset: timestamp_bits=42 max_order=19 bucket_order=0
> squashfs: version 4.0 (2009/01/31) Phillip Lougher
> Key type asymmetric registered
> Asymmetric key parser 'x509' registered
> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
> io scheduler mq-deadline registered
> io scheduler kyber registered
> irq_meson_gpio: 87 to 12 gpio interrupt mux initialized
> soc soc0: Amlogic Meson SC2 (S905X4) Revision 32:b (2:1) Detected
> Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> fe07a000.serial: ttyAML0 at MMIO 0xfe07a000 (irq = 18, base_baud = 1500000) is a meson_uart
> printk: console [ttyAML0] enabled
> fe080000.serial: ttyAML1 at MMIO 0xfe080000 (irq = 19, base_baud = 1500000) is a meson_uart
> cacheinfo: Unable to detect cache hierarchy for CPU 0
> loop: module loaded
> tun: Universal TUN/TAP device driver, 1.6
> VFIO - User Level meta-driver version: 0.3
> usbcore: registered new interface driver usb-storage
> i2c_dev: i2c /dev entries driver
> sdhci: Secure Digital Host Controller Interface driver
> sdhci: Copyright(c) Pierre Ossman
> Synopsys Designware Multimedia Card Interface Driver
> sdhci-pltfm: SDHCI platform and OF driver helper
> meson-gx-mmc fe08a000.sd: Got CD GPIO
> meson-gx-mmc fe08c000.mmc: allocated mmc-pwrseq
> ledtrig-cpu: registered to indicate activity on CPUs
> hid: raw HID events driver (C) Jiri Kosina
> usbcore: registered new interface driver usbhid
> usbhid: USB HID core driver
> NET: Registered PF_PACKET protocol family
> Key type dns_resolver registered
> Loading compiled-in X.509 certificates
> cpufreq: cpufreq_online: CPU0: Running at unlisted initial frequency: 1512000 KHz, changing to: 1608000 KHz
> cpu cpu0: EM: created perf domain
> ALSA device list:
> meson-gx-mmc fe088000.sdio: allocated mmc-pwrseq
>    No soundcards found.
> Waiting for root device /dev/mmcblk0p3...
> mmc0: new HS200 MMC card at address 0001
> mmcblk0: mmc0:0001 DA6016 14.7 GiB
>   mmcblk0: p1 p2 p3
> mmcblk0boot0: mmc0:0001 DA6016 4.00 MiB
> mmcblk0boot1: mmc0:0001 DA6016 4.00 MiB
> mmcblk0rpmb: mmc0:0001 DA6016 4.00 MiB, chardev (241:0)
> EXT4-fs (mmcblk0p3): mounted filesystem with ordered data mode. Quota mode: none.
> VFS: Mounted root (ext4 filesystem) on device 179:3.
> devtmpfs: mounted
> Freeing unused kernel memory: 2816K
> Run /sbin/init as init process
>    with arguments:
>      /sbin/init
>    with environment:
>      HOME=/
>      TERM=linux
>      earlyprintk=serial,ttyAML0,921600
> random: fast init done
> mmc2: new ultra high speed DDR50 SDIO card at address 0001
> systemd[1]: System time before build time, advancing clock.
> NET: Registered PF_INET6 protocol family
> Segment Routing with IPv6
> In-situ OAM (IOAM) with IPv6
> systemd[1]: systemd 250.4-2-arch running in system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT default-hierarchy=unified)
> systemd[1]: Detected architecture arm64.
> systemd[1]: Hostname set to <hk1>.
> systemd[1]: Queued start job for default target Graphical Interface.
> random: crng init done
> systemd[1]: Created slice Slice /system/getty.
> systemd[1]: Created slice Slice /system/modprobe.
> systemd[1]: Created slice Slice /system/serial-getty.
> systemd[1]: Created slice User and Session Slice.
> systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
> systemd[1]: Started Forward Password Requests to Wall Directory Watch.
> systemd[1]: Arbitrary Executable File Formats File System Automount Point was skipped because of a failed condition check (ConditionPathExists=/proc/sys/fs/binfmt_misc).
> systemd[1]: Reached target Local Encrypted Volumes.
> systemd[1]: Reached target Local Integrity Protected Volumes.
> systemd[1]: Reached target Path Units.
> systemd[1]: Reached target Remote File Systems.
> systemd[1]: Reached target Slice Units.
> systemd[1]: Reached target Swaps.
> systemd[1]: Reached target Local Verity Protected Volumes.
> systemd[1]: Listening on Device-mapper event daemon FIFOs.
> systemd[1]: Listening on Process Core Dump Socket.
> systemd[1]: Journal Audit Socket was skipped because of a failed condition check (ConditionSecurity=audit).
> systemd[1]: Listening on Journal Socket (/dev/log).
> systemd[1]: Listening on Journal Socket.
> systemd[1]: Listening on Network Service Netlink Socket.
> systemd[1]: Listening on udev Control Socket.
> systemd[1]: Listening on udev Kernel Socket.
> systemd[1]: Mounting Huge Pages File System...
> systemd[1]: Mounting POSIX Message Queue File System...
> systemd[1]: Mounting Kernel Debug File System...
> systemd[1]: Kernel Trace File System was skipped because of a failed condition check (ConditionPathExists=/sys/kernel/tracing).
> systemd[1]: Mounting Temporary Directory /tmp...
> systemd[1]: Starting Create List of Static Device Nodes...
> systemd[1]: Starting Load Kernel Module configfs...
> systemd[1]: Starting Load Kernel Module drm...
> systemd[1]: Starting Load Kernel Module fuse...
> fuse: init (API version 7.36)
> systemd[1]: Starting Load Kernel Modules...
> systemd[1]: Starting Generate network units from Kernel command line...
> systemd[1]: Starting Remount Root and Kernel File Systems...
> systemd[1]: Repartition Root Disk was skipped because all trigger condition checks failed.
> systemd[1]: Starting Coldplug All udev Devices...
> systemd[1]: Mounted Huge Pages File System.
> systemd[1]: Mounted POSIX Message Queue File System.
> systemd[1]: Mounted Kernel Debug File System.
> systemd[1]: Mounted Temporary Directory /tmp.
> systemd[1]: Finished Create List of Static Device Nodes.
> systemd[1]: modprobe@configfs.service: Deactivated successfully.
> systemd[1]: Finished Load Kernel Module configfs.
> systemd[1]: modprobe@drm.service: Deactivated successfully.
> systemd[1]: Finished Load Kernel Module drm.
> systemd[1]: modprobe@fuse.service: Deactivated successfully.
> systemd[1]: Finished Load Kernel Module fuse.
> systemd[1]: Finished Load Kernel Modules.
> systemd[1]: Finished Generate network units from Kernel command line.
> systemd[1]: Finished Remount Root and Kernel File Systems.
> systemd[1]: Reached target Preparation for Network.
> systemd[1]: Mounting FUSE Control File System...
> systemd[1]: Mounting Kernel Configuration File System...
> systemd[1]: First Boot Wizard was skipped because of a failed condition check (ConditionFirstBoot=yes).
> systemd[1]: Rebuild Hardware Database was skipped because of a failed condition check (ConditionNeedsUpdate=/etc).
> systemd[1]: Starting Load/Save Random Seed...
> systemd[1]: Starting Apply Kernel Variables...
> systemd[1]: Create System Users was skipped because of a failed condition check (ConditionNeedsUpdate=/etc).
> systemd[1]: Starting Create Static Device Nodes in /dev...
> systemd[1]: Mounted FUSE Control File System.
> systemd[1]: Mounted Kernel Configuration File System.
> systemd[1]: Finished Coldplug All udev Devices.
> systemd[1]: Finished Load/Save Random Seed.
> systemd[1]: Finished Apply Kernel Variables.
> systemd[1]: First Boot Complete was skipped because of a failed condition check (ConditionFirstBoot=yes).
> systemd[1]: Finished Create Static Device Nodes in /dev.
> systemd[1]: Reached target Preparation for Local File Systems.
> systemd[1]: Virtual Machine and Container Storage (Compatibility) was skipped because of a failed condition check (ConditionPathExists=/var/lib/machines.raw).
> systemd[1]: Reached target Local File Systems.
> systemd[1]: Entropy Daemon based on the HAVEGE algorithm was skipped because of a failed condition check (ConditionKernelVersion=<5.6).
> systemd[1]: Rebuild Dynamic Linker Cache was skipped because all trigger condition checks failed.
> systemd[1]: Set Up Additional Binary Formats was skipped because all trigger condition checks failed.
> systemd[1]: Store a System Token in an EFI Variable was skipped because of a failed condition check (ConditionPathExists=/sys/firmware/efi/efivars/LoaderFeatures-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f).
> systemd[1]: Starting Journal Service...
> systemd[1]: Commit a transient machine-id on disk was skipped because of a failed condition check (ConditionPathIsMountPoint=/etc/machine-id).
> systemd[1]: Starting Rule-based Manager for Device Events and Files...
> systemd[1]: Started Journal Service.
> systemd-journald[158]: Received client request to flush runtime journal.
> systemd-journald[158]: File /var/log/journal/75805e3fad104d7bae8d530fa8c20fbe/system.journal corrupted or uncleanly shut down, renaming and replacing.
> cfg80211: Loading compiled-in X.509 certificates for regulatory database
> cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> meson-vrtc fe010288.rtc: registered as rtc0
> meson-vrtc fe010288.rtc: setting system clock to 1970-01-01T00:00:04 UTC (4)
> meson-saradc fe026000.saradc: supply vref not found, using dummy regulator
> i2c i2c-5: I2C-like interface, SDA and SCL are write-only
> i2c-gpio i2c-led: using lines 425 (SDA) and 426 (SCL, no clock stretching)
> meson-drm ff000000.vpu: Queued 2 outputs on vpu
> dwc3-meson-g12a fe03a000.usb: USB2 ports: 2
> dwc3-meson-g12a fe03a000.usb: USB3 ports: 1
> panfrost fe400000.gpu: clock rate = 24000000
> panfrost fe400000.gpu: [drm:panfrost_devfreq_init [panfrost]] Failed to register cooling device
> panfrost fe400000.gpu: mali-g31 id 0x7093 major 0x0 minor 0x0 status 0x0
> panfrost fe400000.gpu: features: 00000000,000017f7, issues: 00000000,00000400
> panfrost fe400000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000209 Mem:0x1 MMU:0x00002821 AS:0xff JS:0x7
> panfrost fe400000.gpu: shader_present=0x1 l2_present=0x1
> [drm] Initialized panfrost 1.2.0 20180908 for fe400000.gpu on minor 0
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4334-sdio for chip BCM4334/3
> brcmfmac mmc2:0001:1: Direct firmware load for brcm/brcmfmac4334-sdio.amlogic,sc2.bin failed with error -2
> brcmfmac mmc2:0001:1: Direct firmware load for brcm/brcmfmac4334-sdio.amlogic,sc2.txt failed with error -2
> meson8b-dwmac fdc00000.ethernet: IRQ eth_wake_irq not found
> meson8b-dwmac fdc00000.ethernet: IRQ eth_lpi not found
> meson8b-dwmac fdc00000.ethernet: PTP uses main clock
> meson8b-dwmac fdc00000.ethernet: User ID: 0x11, Synopsys ID: 0x37
> meson8b-dwmac fdc00000.ethernet: 	DWMAC1000
> meson8b-dwmac fdc00000.ethernet: DMA HW capability register supported
> meson8b-dwmac fdc00000.ethernet: RX Checksum Offload Engine supported
> meson8b-dwmac fdc00000.ethernet: COE Type 2
> meson8b-dwmac fdc00000.ethernet: TX Checksum insertion supported
> meson8b-dwmac fdc00000.ethernet: Wake-Up On Lan supported
> meson8b-dwmac fdc00000.ethernet: Normal descriptors
> meson8b-dwmac fdc00000.ethernet: Ring mode enabled
> meson8b-dwmac fdc00000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> meson8b-dwmac fdc00000.ethernet: device MAC address 02:ad:32:01:bd:b0
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4334-sdio for chip BCM4334/3
> brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may have limited channels available
> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4334/3 wl0: Jun 26 2012 11:32:33 version 6.10 (TOB) (r335311)
> dwc2 fdd00000.usb: supply vusb_d not found, using dummy regulator
> dwc2 fdd00000.usb: supply vusb_a not found, using dummy regulator
> dwc2 fdd00000.usb: EPs: 7, dedicated fifos, 968 entries in SPRAM
> fd6551 5-0024: Set up FD6551 LED controller with 4 digits and 7 symbols.
> xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
> xhci-hcd xhci-hcd.1.auto: hcc params 0x0228fe6c hci version 0x110 quirks 0x0000000000010010
> xhci-hcd xhci-hcd.1.auto: irq 31, io mem 0xfde00000
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 2 ports detected
> xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
> xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
> usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> hub 2-0:1.0: USB hub found
> hub 2-0:1.0: 1 port detected
> meson8b-dwmac fdc00000.ethernet eth0: PHY [mdio_mux-0.1:08] driver [Meson G12A Internal PHY] (irq=30)
> systemd-journald[158]: Oldest entry in /var/log/journal/75805e3fad104d7bae8d530fa8c20fbe/system.journal is older than the configured file retention duration (1month), suggesting rotation.
> systemd-journald[158]: /var/log/journal/75805e3fad104d7bae8d530fa8c20fbe/system.journal: Journal header limits reached or header out-of-date, rotating.
> meson8b-dwmac fdc00000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> meson8b-dwmac fdc00000.ethernet eth0: No Safety Features support found
> meson8b-dwmac fdc00000.ethernet eth0: PTP not supported by HW
> meson8b-dwmac fdc00000.ethernet eth0: configuring for phy/rmii link mode
> meson8b-dwmac fdc00000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> meson-dw-hdmi fe300000.hdmi-tx: Detected HDMI TX controller v2.01a with HDCP (meson_dw_hdmi_phy)
> meson-dw-hdmi fe300000.hdmi-tx: registered DesignWare HDMI I2C bus driver
> meson-drm ff000000.vpu: bound fe300000.hdmi-tx (ops meson_dw_hdmi_ops [meson_dw_hdmi])
> [drm] Initialized meson 1.0.0 20161109 for ff000000.vpu on minor 1
> Console: switching to colour frame buffer device 240x67
> meson-drm ff000000.vpu: [drm] fb0: mesondrmfb frame buffer device


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
