Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D43C77B75
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 May 2023 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:To:Cc:In-Reply-To
	:Date:Subject:Mime-Version:Content-Type:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34J6NKMiANdDPDuBFEQUeR0Uh++ripy8Y8851k6UhdM=; b=xad2zCF9ZCBC8Cu9QxSbz8LpV0
	l6w8DURjKeF7LKtooHm1cGktA5+qmE/49wrAMLo7tnDMM6rWB54yMXx2qsE+B9m8RGqyzrVo9nkNy
	1jva9h6InjzjXz8NBtrWWcIKEWet9GJ5Uk6xA/aVeMPLdre+fqMVIZf1/nPvt5XIpU43iFlrT6oXz
	RWQt6vHS6OpWoLIVMK6xQdORitLWqe2HeZRub+17qiQnUGNUPMGA+NzJRIAgfd3IxvlOIoNPELZkm
	nEkeUDq3f5ugXk5XL3dSFP/CfAuzqDR7OT05luoglywbSox440y45hhbt+J4RZMuw7/nPpyoC9Cg5
	PSQcNVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1PsE-00A1tH-0Z;
	Tue, 23 May 2023 11:08:14 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Ps9-00A1qw-15
	for linux-amlogic@lists.infradead.org;
	Tue, 23 May 2023 11:08:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64d2e8a842cso3651699b3a.3
        for <linux-amlogic@lists.infradead.org>; Tue, 23 May 2023 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684840084; x=1687432084;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wurxxrx/WcnK/I7ughUjYHebGTZvZEvuIolRAK0rf3I=;
        b=T9LgrdhmgO4Q5mMgLjc3rOWPfjViP7xrX/Gje/XOE1Fo0Rlr2BwEo7A0DgcdcpkEF5
         35yYlOB7qY7gxxZnv5j4dAV0UJAPuKqY0V66vCNJyh4fpmcRAou9kYoC8ovL2uWYDaht
         El7uLmo/2VrZNST2CtqSmWnHsJ02HfNY8uco1Lg0JN6OK+MODGTaf05uQnZL2DP9S2uB
         jC36TKkhUfEpxkErdvkiSxlsL4h5lOKJxa8hFLV8NCidBAgTwxbeb/4U48D14mZV9PEY
         1glr8IHmrQRuZXxpRQZZqVLjJnvNn3NAVgs1cZekyoS6xLobcVekYqum6w+3Sgr3lTNe
         GV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684840084; x=1687432084;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wurxxrx/WcnK/I7ughUjYHebGTZvZEvuIolRAK0rf3I=;
        b=PPfaRaFvgunPOBxXQ9AGZKEr+H19UMxfa1tb7+7DXrmw4xmmmWBCmlgUQOxVWf/xdY
         mMrM6lA2wNntkCfYj5+DLyCbptmJam+cEH8cN1e/yxJFI1ViiSxkYGS4a56KB8NUyJmT
         HocUUqIJUzL8tKCikSL3F2XDOhi0+H653MyyOf5lu3AuHy53hKgE6TewaI0/6bTNN6mo
         TKnUAqxzWLEIscMjWIEiQxE9eVUFZFto1/tCHMVCHQizKWaI5fWW8dkdXMaFLgMQbSB9
         Fp858Rou21FlAqM4Mhh1tmCgXhefjmlVuVVirVjTdkw5QW7/xGqFf9yG6hZ/ckzk+nJw
         yR9A==
X-Gm-Message-State: AC+VfDw/kM86i36lPNxvudIF4QIL92UICaYh3caDEt6KcihiNFICuYwt
	xupFxgH7DeVriWruHvW56jE=
X-Google-Smtp-Source: ACHHUZ4vMhBL8rdRxWUZJcxieLoPE3XjlXULhA2J6Dc6QUEmYt/GorT4EchEFBOdQ6VfZUASyHFY0Q==
X-Received: by 2002:a05:6a20:1590:b0:102:8f0a:5acf with SMTP id h16-20020a056a20159000b001028f0a5acfmr15208668pzj.62.1684840084219;
        Tue, 23 May 2023 04:08:04 -0700 (PDT)
Received: from smtpclient.apple (167.19.100.220.dy.bbexcite.jp. [220.100.19.167])
        by smtp.gmail.com with ESMTPSA id d27-20020a630e1b000000b0052cbd854927sm5753161pgl.18.2023.05.23.04.08.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 May 2023 04:08:03 -0700 (PDT)
From: Oleksii Fedorov <vsnrain@gmail.com>
Message-Id: <4B372141-D4B1-4C30-9FD4-D054F872F57A@gmail.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_1AEF4106-46CA-4714-94AF-66B963EB9F53"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: Mainline kernel 6.0+ hangs on S905D3
Date: Tue, 23 May 2023 20:07:51 +0900
In-Reply-To: <20651FC4-6797-4F2F-9A13-1649D0953DBF@gmail.com>
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
To: neil.armstrong@linaro.org
References: <3EC0EBE6-208A-424D-98FE-BAC8B8707519@gmail.com>
 <ec4932f7-c279-2787-7712-4b7d60a64223@linaro.org>
 <20651FC4-6797-4F2F-9A13-1649D0953DBF@gmail.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_040809_405797_BC1F40AC 
X-CRM114-Status: GOOD (  11.20  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--Apple-Mail=_1AEF4106-46CA-4714-94AF-66B963EB9F53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello.

Sorry, it's been a long time since my last message, but I got back to =
checking this issue.
And I have found out, it seems is the issue with Arch Linux ARM kernel =
config file
=
https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/linux-aarch64/c=
onfig

6.3.3 kernel built with archlinuxarm config gives exact same issue

--Apple-Mail=_1AEF4106-46CA-4714-94AF-66B963EB9F53
Content-Disposition: attachment;
	filename=log-6.3.3.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="log-6.3.3.txt"
Content-Transfer-Encoding: quoted-printable

S=
M1:BL:511f6b:81ca2f;FEAT:A0F83180:20282000;POC:B;RCY:0;SPINOR:0;0.0;CHK:0;=

bl2_stage_init 0x01
bl2_stage_init 0x81
hw id: 0x0000 - pwm id 0x01
bl2_stage_init 0xc1
bl2_stage_init 0x02

L0:00000000
L1:00000703
L2:00008067
L3:15000000
S1:00000000
B2:20282000
B1:a0f83180

TE: 70913

BL2 Built : 15:21:48, Aug 28 2019. g12a g1bf2b53 - luan.yuan@droid15-sz

Board ID =3D 10
Set cpu clk to 24M
Set clk81 to 24M
Use GP1_pll as DSU clk.
DSU clk: 1200 Mhz
CPU clk: 1200 MHz
Set clk81 to 166.6M
DDR driver_vesion: LPDDR4_PHY_V_0_1_18 build time: Aug 28 2019 15:21:45
board id: 10
Load FIP HDR from SPI, src: 0x00010000, des: 0xfffd0000, size: =
0x00004000, part: 0
fw parse done
Load ddrfw from SPI, src: 0x00060000, des: 0xfffd0000, size: 0x0000c000, =
part: 0
Load ddrfw from SPI, src: 0x00038000, des: 0xfffd0000, size: 0x00004000, =
part: 0
PIEI prepare done
fastboot data load
fastboot data verify
verify result: 266
Cfg max: 4, cur: 1. Board id: 255. Force loop cfg
LPDDR4 probe
ddr clk to 1608MHz
Load ddrfw from SPI, src: 0x0003c000, des: 0xfffd0000, size: 0x0000c000, =
part: 0

dmc_version 0001
Check phy result
INFO : ERROR : Training has failed!
1D training failed
Cfg max: 4, cur: 2. Board id: 255. Force loop cfg
LPDDR4 probe
ddr clk to 1608MHz
Load ddrfw from SPI, src: 0x0003c000, des: 0xfffd0000, size: 0x0000c000, =
part: 0

dmc_version 0001
Check phy result
INFO : End of CA training
INFO : End of initialization
INFO : Training has run successfully!
Check phy result
INFO : End of initialization
INFO : End of read enable training
INFO : End of fine write leveling
INFO : End of Write leveling coarse delay
INFO : Training has run successfully!
Check phy result
INFO : End of initialization
INFO : End of read dq deskew training
INFO : End of MPR read delay center optimization
INFO : End of write delay center optimization
INFO : End of read delay center optimization
INFO : End of max read latency training
INFO : Training has run successfully!
1D training succeed
Load ddrfw from SPI, src: 0x00048000, des: 0xfffd0000, size: 0x0000c000, =
part: 0
Check phy result
INFO : End of initialization
INFO : End of 2D read delay Voltage center optimization
INFO : End of 2D read delay Voltage center optimization
INFO : End of 2D write delay Voltage center optimization
INFO : End of 2D write delay Voltage center optimization
INFO : Training has run successfully!

channel=3D=3D0
RxClkDly_Margin_A0=3D=3D58 ps 6
TxDqDly_Margin_A0=3D=3D106 ps 11
RxClkDly_Margin_A1=3D=3D0 ps 0
TxDqDly_Margin_A1=3D=3D0 ps 0
TrainedVREFDQ_A0=3D=3D29
TrainedVREFDQ_A1=3D=3D0
VrefDac_Margin_A0=3D=3D32
DeviceVref_Margin_A0=3D=3D29
VrefDac_Margin_A1=3D=3D0
DeviceVref_Margin_A1=3D=3D0


channel=3D=3D1
RxClkDly_Margin_A0=3D=3D67 ps 7
TxDqDly_Margin_A0=3D=3D106 ps 11
RxClkDly_Margin_A1=3D=3D0 ps 0
TxDqDly_Margin_A1=3D=3D0 ps 0
TrainedVREFDQ_A0=3D=3D29
TrainedVREFDQ_A1=3D=3D0
VrefDac_Margin_A0=3D=3D31
DeviceVref_Margin_A0=3D=3D29
VrefDac_Margin_A1=3D=3D0
DeviceVref_Margin_A1=3D=3D0

 dwc_ddrphy_apb_wr((0<<20)|(2<<16)|(0<<12)|(0xb0):0004=20

soc_vref_reg_value 0x 00000026 00000027 00000026 00000027 00000026 =
00000026 00000026 00000025 00000028 00000025 00000025 00000027 00000027 =
00000026 00000025 00000028 00000026 00000024 00000025 00000026 00000027 =
00000028 00000026 00000024 00000027 00000026 00000026 00000028 00000025 =
00000025 00000027 00000025 dram_vref_reg_value 0x 00000013
2D training succeed
aml_ddr_fw_vesion: LPDDR4_PHY_V_0_1_18 build time: Aug 28 2019 13:53:31
auto size-- 65535DDR cs0 size: 2048MB
DDR cs1 size: 0MB
DMC_DDR_CTRL: 00c0002cDDR size: 2048MB
cs0 DataBus test pass
cs0 AddrBus test pass

100bdlr_step_size ps=3D=3D 444
result report
boot times 0Enable ddr reg access
Load FIP HDR from SPI, src: 0x00010000, des: 0x01700000, size: =
0x00004000, part: 0
Load BL3X from SPI, src: 0x00078000, des: 0x01768000, size: 0x00114000, =
part: 0
bl2z: ptr: 05129330, size: 00001e40
0.0;M3 CHK:0;cm4_sp_mode 0
MVN_1=3D0x00000000
MVN_2=3D0x00000000
[Image: g12a_v1.1.3390-6ac5299 2019-09-26 14:09:46 luan.yuan@droid15-sz]
OPS=3D0x04
ring efuse init
2b 0c 04 00 01 33 12 00 00 16 38 34 36 42 4b 50=20
[0.017319 Inits done]
secure task start!
high task start!
low task start!
run into bl31
NOTICE:  BL31: v1.3(release):4fc40b1
NOTICE:  BL31: Built : 15:57:33, May 22 2019
NOTICE:  BL31: G12A normal boot!
ERROR:   Error initializing runtime service opteed_fast

<debug_uart>


U-Boot 2023.04-rc1-00573-gb97487db4e (Feb 14 2023 - 04:06:30 +0900) =
khadas-vim3l

Model: Khadas VIM3L
SoC:   Amlogic Meson SM1 (S905D3) Revision 2b:c (4:2)
DRAM:  2 GiB
Core:  407 devices, 34 uclasses, devicetree: separate
MMC:   sd@ffe03000: 0, sd@ffe05000: 1, mmc@ffe07000: 2
Loading Environment from nowhere... OK
In:    serial
Out:   serial
Err:   serial
Net:   eth0: ethernet@ff3f0000
Hit any key to stop autoboot:  0=20
Card did not respond to voltage select! : -110
Card did not respond to voltage select! : -110
switch to partitions #0, OK
mmc2(part 0) is current device
Scanning mmc 2:1...
Found /extlinux/extlinux.conf
Retrieving file: /extlinux/extlinux.conf
boot
1:      ArchLinux ARM
2:      mainline
Enter choice: 2
2:      mainline
Retrieving file: /Image
Retrieving file: /initramfs-linux.img
append: root=3DUUID=3D48c32f3a-0cf5-4fa3-9789-13a25f3b6efc rw audit=3D0 =
console=3DttyAML0,115200n8 console=3Dtty0 no_console_suspend =
consoleblank=3D0
Retrieving file: /dtbs/amlogic/meson-sm1-khadas-vim3l.dtb
Moving Image from 0x8080000 to 0x8200000, end=3Dabd0000
## Flattened Device Tree blob at 08008000
   Booting using the fdt blob at 0x8008000
Working FDT set to 8008000
   Loading Ramdisk to 7a7a2000, end 7af0e9cd ... OK
   Loading Device Tree to 000000007a78c000, end 000000007a7a1946 ... OK
Working FDT set to 7a78c000

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd050]
[    0.000000] Linux version 6.3.3-1-aarch64-ARCH (user@arch-vm) (gcc =
(GCC) 12.1.0, GNU ld (GNU Binutils) 2.38) #1 SMP PREEMPT_DYNAMIC Tue May =
23 09:25:16 UTC 2023
[    0.000000] Machine model: Khadas VIM3L
[    0.000000] efi: UEFI not found.
[    0.000000] OF: fdt: Reserved memory: failed to reserve memory for =
node 'secmon@5000000': base 0x0000000005000000, size 3 MiB
[    0.000000] Reserved memory: created CMA memory pool at =
0x000000006a400000, size 256 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible =
id shared-dma-pool
[    0.000000] OF: reserved mem: 0x000000006a400000..0x000000007a3fffff =
(262144 KiB) map reusable linux,cma
[    0.000000] OF: reserved mem: 0x0000000005000000..0x00000000052fffff =
(3072 KiB) nomap non-reusable secmon@5000000
[    0.000000] OF: reserved mem: 0x0000000005300000..0x00000000072fffff =
(32768 KiB) nomap non-reusable secmon@5300000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000007f806fff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000000052fffff]
[    0.000000]   node   0: [mem 0x0000000005300000-0x00000000072fffff]
[    0.000000]   node   0: [mem 0x0000000007300000-0x000000007f806fff]
[    0.000000] Initmem setup node 0 [mem =
0x0000000000000000-0x000000007f806fff]
[    0.000000] On node 0, zone DMA: 2041 pages in unavailable ranges
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 22 pages/cpu s51176 r8192 d30744 u90112
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: Virtualization Host Extensions
[    0.000000] CPU features: detected: Qualcomm erratum 1009, or ARM =
erratum 1286807, 2441009
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or =
1530923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: =
514086
[    0.000000] Kernel command line: =
root=3DUUID=3D48c32f3a-0cf5-4fa3-9789-13a25f3b6efc rw audit=3D0 =
console=3DttyAML0,115200n8 console=3Dtty0 no_console_suspend =
consoleblank=3D0
[    0.000000] audit: disabled (until reboot)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, =
2097152 bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 =
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 1699868K/2088988K available (19072K kernel code, =
4576K rwdata, 10324K rodata, 7680K init, 975K bss, 126976K reserved, =
262144K cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, =
Nodes=3D1
[    0.000000] Dynamic Preempt: full
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D64 to =
nr_cpu_ids=3D4.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay =
is 100 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, =
nr_cpu_ids=3D4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on =
contention.
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff =
max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000000] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps =
every 4398046511097ns
[    0.000415] Console: colour dummy device 80x25
[    0.000426] printk: console [tty0] enabled
[    0.000859] Calibrating delay loop (skipped), value calculated using =
timer frequency.. 48.00 BogoMIPS (lpj=3D24000)
[    0.000923] pid_max: default: 32768 minimum: 301
[    0.001088] LSM: initializing lsm=3Dcapability,yama
[    0.001116] Yama: becoming mindful.
[    0.001294] Mount-cache hash table entries: 4096 (order: 3, 32768 =
bytes, linear)
[    0.001321] Mountpoint-cache hash table entries: 4096 (order: 3, =
32768 bytes, linear)
[    0.002783] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    0.003755] cblist_init_generic: Setting adjustable number of =
callback queues.
[    0.003780] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.003903] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.004182] rcu: Hierarchical SRCU implementation.
[    0.004196] rcu:     Max phase no-delay instances is 400.
[    0.008567] EFI services will not be available.
[    0.009260] smp: Bringing up secondary CPUs ...
[    0.010333] Detected VIPT I-cache on CPU1
[    0.010402] cacheinfo: Unable to detect cache hierarchy for CPU 1
[    0.010442] CPU1: Booted secondary processor 0x0000000100 =
[0x411fd050]
[    0.011522] Detected VIPT I-cache on CPU2
[    0.011577] cacheinfo: Unable to detect cache hierarchy for CPU 2
[    0.011603] CPU2: Booted secondary processor 0x0000000200 =
[0x411fd050]
[    0.012697] Detected VIPT I-cache on CPU3
[    0.012749] cacheinfo: Unable to detect cache hierarchy for CPU 3
[    0.012774] CPU3: Booted secondary processor 0x0000000300 =
[0x411fd050]
[    0.012885] smp: Brought up 1 node, 4 CPUs
[    0.012970] SMP: Total of 4 processors activated.
[    0.012983] CPU features: detected: 32-bit EL0 Support
[    0.012994] CPU features: detected: 32-bit EL1 Support
[    0.013006] CPU features: detected: Data cache clean to the PoU not =
required for I/D coherence
[    0.013021] CPU features: detected: Common not Private translations
[    0.013033] CPU features: detected: CRC32 instructions
[    0.013045] CPU features: detected: RCpc load-acquire (LDAPR)
[    0.013056] CPU features: detected: LSE atomic instructions
[    0.013068] CPU features: detected: Privileged Access Never
[    0.013079] CPU features: detected: RAS Extension Support
[    0.013167] CPU: All CPU(s) started at EL2
[    0.013180] alternatives: applying system-wide alternatives
[    0.017890] devtmpfs: initialized
[    0.034149] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.034199] futex hash table entries: 1024 (order: 4, 65536 bytes, =
linear)
[    0.038974] pinctrl core: initialized pinctrl subsystem
[    0.041993] DMI not present or invalid.
[    0.042814] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.044149] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic =
allocations
[    0.044323] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for =
atomic allocations
[    0.044526] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for =
atomic allocations
[    0.046382] thermal_sys: Registered thermal governor 'fair_share'
[    0.046391] thermal_sys: Registered thermal governor 'bang_bang'
[    0.046407] thermal_sys: Registered thermal governor 'step_wise'
[    0.046420] thermal_sys: Registered thermal governor 'user_space'
[    0.046432] thermal_sys: Registered thermal governor =
'power_allocator'
[    0.046523] cpuidle: using governor ladder
[    0.046574] cpuidle: using governor menu
[    0.046865] hw-breakpoint: found 6 breakpoint and 4 watchpoint =
registers.
[    0.047025] ASID allocator initialised with 65536 entries
[    0.049899] Serial: AMBA PL011 UART driver
[    0.084839] platform ff900000.vpu: Fixed dependency cycle(s) with =
/soc/bus@ff600000/hdmi-tx@0/port@0/endpoint
[    0.097807] platform hdmi-connector: Fixed dependency cycle(s) with =
/soc/bus@ff600000/hdmi-tx@0/port@1/endpoint
[    0.101144] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 =
pages
[    0.101176] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
[    0.101191] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 =
pages
[    0.101204] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
[    0.101217] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 =
pages
[    0.101229] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.101242] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 =
pages
[    0.101254] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.101809] cryptd: max_cpu_qlen set to 1000
[    0.119683] raid6: neonx8   gen()  2162 MB/s
[    0.136801] raid6: neonx4   gen()  2131 MB/s
[    0.153917] raid6: neonx2   gen()  1973 MB/s
[    0.171026] raid6: neonx1   gen()  1633 MB/s
[    0.188155] raid6: int64x8  gen()  1393 MB/s
[    0.205269] raid6: int64x4  gen()  1521 MB/s
[    0.222371] raid6: int64x2  gen()  1420 MB/s
[    0.239514] raid6: int64x1  gen()  1075 MB/s
[    0.239528] raid6: using algorithm neonx8 gen() 2162 MB/s
[    0.256593] raid6: .... xor() 1622 MB/s, rmw enabled
[    0.256608] raid6: using neon recovery algorithm
[    0.257822] ACPI: Interpreter disabled.
[    0.264273] iommu: Default domain type: Translated=20
[    0.264299] iommu: DMA domain TLB invalidation policy: strict mode=20
[    0.265211] SCSI subsystem initialized
[    0.265708] usbcore: registered new interface driver usbfs
[    0.265757] usbcore: registered new interface driver hub
[    0.265806] usbcore: registered new device driver usb
[    0.267094] pps_core: LinuxPPS API ver. 1 registered
[    0.267110] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 =
Rodolfo Giometti <giometti@linux.it>
[    0.267154] PTP clock support registered
[    0.267366] EDAC MC: Ver: 3.0.0
[    0.268401] scmi_core: SCMI protocol bus registered
[    0.269410] FPGA manager framework
[    0.269536] Advanced Linux Sound Architecture Driver Initialized.
[    0.270440] NetLabel: Initializing
[    0.270456] NetLabel:  domain hash size =3D 128
[    0.270467] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.270537] NetLabel:  unlabeled traffic allowed by default
[    0.270976] vgaarb: loaded
[    0.271432] clocksource: Switched to clocksource arch_sys_counter
[    0.271833] VFS: Disk quotas dquot_6.6.0
[    0.271887] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 =
bytes)
[    0.272235] pnp: PnP ACPI: disabled
[    0.282508] NET: Registered PF_INET protocol family
[    0.282722] IP idents hash table entries: 32768 (order: 6, 262144 =
bytes, linear)
[    0.284528] tcp_listen_portaddr_hash hash table entries: 1024 (order: =
2, 16384 bytes, linear)
[    0.284574] Table-perturb hash table entries: 65536 (order: 6, 262144 =
bytes, linear)
[    0.284658] TCP established hash table entries: 16384 (order: 5, =
131072 bytes, linear)
[    0.284769] TCP bind hash table entries: 16384 (order: 7, 524288 =
bytes, linear)
[    0.285124] TCP: Hash tables configured (established 16384 bind =
16384)
[    0.285352] MPTCP token hash table entries: 2048 (order: 3, 49152 =
bytes, linear)
[    0.285458] UDP hash table entries: 1024 (order: 3, 32768 bytes, =
linear)
[    0.285505] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, =
linear)
[    0.285697] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.286287] RPC: Registered named UNIX socket transport module.
[    0.286305] RPC: Registered udp transport module.
[    0.286317] RPC: Registered tcp transport module.
[    0.286327] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.286352] PCI: CLS 0 bytes, default 64
[    0.286919] Trying to unpack rootfs image as initramfs...
[    0.287578] kvm [1]: IPA Size Limit: 40 bits
[    0.287678] kvm [1]: vgic interrupt IRQ9
[    0.287731] kvm [1]: VHE mode initialized successfully
[    0.290229] Initialise system trusted keyrings
[    0.290586] workingset: timestamp_bits=3D46 max_order=3D19 =
bucket_order=3D0
[    0.290708] zbud: loaded
[    0.292373] NFS: Registering the id_resolver key type
[    0.292448] Key type id_resolver registered
[    0.292464] Key type id_legacy registered
[    0.292512] nfs4filelayout_init: NFSv4 File Layout Driver =
Registering...
[    0.292539] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver =
Registering...
[    0.292581] ntfs3: Max link count 4000
[    0.292594] ntfs3: Read-only LZX/Xpress compression included
[    0.292861] SGI XFS with ACLs, security attributes, quota, no debug =
enabled
[    0.331559] NET: Registered PF_ALG protocol family
[    0.331609] xor: measuring software checksum speed
[    0.335553]    8regs           :  2519 MB/sec
[    0.339753]    32regs          :  2358 MB/sec
[    0.344233]    arm64_neon      :  2212 MB/sec
[    0.344256] xor: using function: 8regs (2519 MB/sec)
[    0.344287] Key type asymmetric registered
[    0.344303] Asymmetric key parser 'x509' registered
[    0.344469] Block layer SCSI generic (bsg) driver version 0.4 loaded =
(major 242)
[    0.344707] io scheduler mq-deadline registered
[    0.344726] io scheduler kyber registered
[    0.344797] io scheduler bfq registered
[    0.352148] irq_meson_gpio: 100 to 8 gpio interrupt mux initialized
[    0.382053] IPMI message handler: version 39.2
[    0.421197] soc soc0: Amlogic Meson SM1 (S905D3) Revision 2b:c (4:2) =
Detected
[    0.432965] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.438556] ff803000.serial: ttyAML0 at MMIO 0xff803000 (irq =3D 14, =
base_baud =3D 1500000) is a meson_uart
[    0.438636] printk: console [ttyAML0] enabled
[    0.568209] Freeing initrd memory: 7600K
[    0.572253] ffd24000.serial: ttyAML6 at MMIO 0xffd24000 (irq =3D 15, =
base_baud =3D 1500000) is a meson_uart
[    1.625463] serial serial0: tty port ttyAML6 registered
[    1.631189] msm_serial: driver initialized
[    1.638366] random: crng init done
[    1.642881] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    1.659135] SPI driver max3421-hcd has no spi_device_id for =
maxim,max3421
[    1.660591] usbcore: registered new interface driver uas
[    1.665617] usbcore: registered new interface driver usb-storage
[    1.671551] usbcore: registered new interface driver ums-alauda
[    1.677414] usbcore: registered new interface driver ums-cypress
[    1.683368] usbcore: registered new interface driver ums-datafab
[    1.689317] usbcore: registered new interface driver ums_eneub6250
[    1.695450] usbcore: registered new interface driver ums-freecom
[    1.701392] usbcore: registered new interface driver ums-isd200
[    1.707263] usbcore: registered new interface driver ums-jumpshot
[    1.713314] usbcore: registered new interface driver ums-karma
[    1.719074] usbcore: registered new interface driver ums-onetouch
[    1.725111] usbcore: registered new interface driver ums-realtek
[    1.731064] usbcore: registered new interface driver ums-sddr09
[    1.736928] usbcore: registered new interface driver ums-sddr55
[    1.742792] usbcore: registered new interface driver ums-usbat
[    1.748633] usbcore: registered new interface driver =
usbserial_generic
[    1.755041] usbserial: USB Serial support registered for generic
[    1.763553] mousedev: PS/2 mouse device common for all mice
[    1.777512] device-mapper: uevent: version 1.0.3
[    1.777804] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) =
initialised: dm-devel@redhat.com
[    1.793543] sdhci: Secure Digital Host Controller Interface driver
[    1.794097] sdhci: Copyright(c) Pierre Ossman
[    1.799482] Synopsys Designware Multimedia Card Interface Driver
[    1.805875] meson-gx-mmc ffe05000.mmc: Got CD GPIO
[    1.805905] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.817877] ledtrig-cpu: registered to indicate activity on CPUs
[    1.822224] meson-sm: secure-monitor enabled
[    1.825890] hid: raw HID events driver (C) Jiri Kosina
[    1.830067] usbcore: registered new interface driver usbhid
[    1.835506] usbhid: USB HID core driver
[    1.849908] Initializing XFRM netlink socket
[    1.850050] NET: Registered PF_INET6 protocol family
[    1.880385] Segment Routing with IPv6
[    1.880495] In-situ OAM (IOAM) with IPv6
[    1.882387] mip6: Mobile IPv6
[    1.885279] NET: Registered PF_PACKET protocol family
[    1.890392] Key type dns_resolver registered
[    1.902385] registered taskstats version 1
[    1.902554] Loading compiled-in X.509 certificates
[    1.906310] zswap: loaded using pool lzo/zbud
[    1.916153] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating =
architecture page table helpers
[    1.920063] Key type .fscrypt registered
[    1.923624] Key type fscrypt-provisioning registered
[    1.929453] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dyes, =
fsverity=3Dno
[    1.935693] Key type encrypted registered
[    2.270128] dwc3-meson-g12a ffe09000.usb: USB2 ports: 2
[    2.270180] dwc3-meson-g12a ffe09000.usb: USB3 ports: 1
[    2.279085] dwc2 ff400000.usb: supply vusb_d not found, using dummy =
regulator
[    2.282093] dwc2 ff400000.usb: supply vusb_a not found, using dummy =
regulator
[    2.289344] dwc2 ff400000.usb: EPs: 7, dedicated fifos, 712 entries =
in SPRAM
[    2.298778] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[    2.301671] xhci-hcd xhci-hcd.0.auto: new USB bus registered, =
assigned bus number 1
[    2.309208] xhci-hcd xhci-hcd.0.auto: hcc params 0x0228fe6c hci =
version 0x110 quirks 0x0000000000010010
[    2.318448] xhci-hcd xhci-hcd.0.auto: irq 19, io mem 0xff500000
[    2.324404] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[    2.329811] xhci-hcd xhci-hcd.0.auto: new USB bus registered, =
assigned bus number 2
[    2.337293] xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 =
SuperSpeed
[    2.343917] usb usb1: New USB device found, idVendor=3D1d6b, =
idProduct=3D0002, bcdDevice=3D 6.03
[    2.351951] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, =
SerialNumber=3D1
[    2.359104] usb usb1: Product: xHCI Host Controller
[    2.363933] usb usb1: Manufacturer: Linux 6.3.3-1-aarch64-ARCH =
xhci-hcd
[    2.370487] usb usb1: SerialNumber: xhci-hcd.0.auto
[    2.375715] hub 1-0:1.0: USB hub found
[    2.379057] hub 1-0:1.0: 2 ports detected
[    2.383371] usb usb2: We don't know the algorithms for LPM for this =
host, disabling LPM.
[    2.391119] usb usb2: New USB device found, idVendor=3D1d6b, =
idProduct=3D0003, bcdDevice=3D 6.03
[    2.399211] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, =
SerialNumber=3D1
[    2.406469] usb usb2: Product: xHCI Host Controller
[    2.411200] usb usb2: Manufacturer: Linux 6.3.3-1-aarch64-ARCH =
xhci-hcd
[    2.417753] usb usb2: SerialNumber: xhci-hcd.0.auto
[    2.422952] hub 2-0:1.0: USB hub found
[    2.426319] hub 2-0:1.0: 1 port detected
[    2.431054] pca953x 0-0020: using no AI
[    2.438932] meson-gx-mmc ffe03000.mmc: allocated mmc-pwrseq
[    2.440846] meson-gx-mmc ffe07000.mmc: allocated mmc-pwrseq=

--Apple-Mail=_1AEF4106-46CA-4714-94AF-66B963EB9F53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



But if I rebuild same kernel but with Manjaro config
=
https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-aml/-/blob/mast=
er/config
it works fine.

Any idea which kernel config parameter might be breaking boot on sm1 =
(khadas vim3l) board but work fine on g12a (radxa zero) board ?

Thanks.

> On Mar 6, 2023, at 20:06, Oleksii Fedorov <vsnrain@gmail.com> wrote:
>=20
> Switching uboot does not look like it changes anything, though I am =
not sure how far back should I downgrade.=20
> I tried switching to khadas official uboot[1], and it has same issue.
>=20
> [1] https://dl.khadas.com/firmware/vim3l/uboot/mainline/
>=20
> I have not tried v6.3-rc1 yet, let me compile it and check...
>=20
>=20
>> On Mar 6, 2023, at 19:01, Neil Armstrong <neil.armstrong@linaro.org> =
wrote:
>>=20
>> Hi,
>>=20
>> On 06/03/2023 10:35, Oleksii Fedorov wrote:
>>> Hello.
>>>=20
>>> I am sorry for maybe a stupid question, but I am having issues =
running mainline kernel on Amlogic S905D3 (Khadas VIM3L board).
>>> It completely hangs around
>>>=20
>>> [    2.376752] meson-gx-mmc ffe03000.sd: allocated mmc-pwrseq
>>> [    2.378645] meson-gx-mmc ffe07000.mmc: allocated mmc-pwrseq
>>> [    2.384125] simple-framebuffer 7fe5b000.framebuffer: framebuffer =
at 0x7fe5b000, 0x195000 bytes
>>> [    2.391417] simple-framebuffer 7fe5b000.framebuffer: =
format=3Dx8r8g8b8, mode=3D720x576x32, linelength=3D2880
>>> [    2.401893] Console: switching to colour frame buffer device =
90x36
>>> [    2.406763] simple-framebuffer 7fe5b000.framebuffer: fb0: =
simplefb registered!
>>>=20
>>> If there is no HDMI display attached, last 4 lines do not appear and =
it hangs at
>>>=20
>>> [    2.378645] meson-gx-mmc ffe07000.mmc: allocated mmc-pwrseq
>>>=20
>>> I will also put the full boot log to attachment.
>>> Kernels with amlogic specific patches seems to work fine, like =
manjaro linux-aml[1] or linux-aarch64-flippy[2]
>>>=20
>>> Do you know what might be the issue, or what exact patch fixes it? =
Is there any plans of moving it to mainline?
>>=20
>>=20
>> I don't know this issue at all, thanks.
>>=20
>>=20
>> Is this the same with v6.3-rc1 ? downgrading u-boot changes something =
?
>>=20
>>=20
>> Neil
>>=20
>>=20
>>>=20
>>> Best regards,
>>>=20
>>> [1] https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-aml
>>> [2] https://aur.archlinux.org/packages/linux-aarch64-flippy
>>>=20
>>>=20
>>=20
>=20


--Apple-Mail=_1AEF4106-46CA-4714-94AF-66B963EB9F53
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--Apple-Mail=_1AEF4106-46CA-4714-94AF-66B963EB9F53--

