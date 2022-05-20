Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE42CC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 May 2022 23:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjUHXx85Z1NsrSKZdIfxnxQ6n+zIbO9mHKLrtGBrcBs=; b=kF+CVNnCo30fSl
	aZ0BmxbrSsH6YuIw3r/ZOLlac5slNMsD09Xm1nkevu/CpuHqYQ+eNq0T9TwmFLpfsaV8xs+FK0C0H
	HmKqJmR2uLAtgmKRspHmXMIOlA9SvDh/5MBmuC2ScBAX5T1EPfdVxX1hpJ9CQrPBPHaD8j276k2NW
	pB+aJl5mVSCM5AIXjqK/ibnndQT0zMq0T/f/8V7pXuVdyd1nK1zCYvwMVEBZ91t278gUBa894gixu
	yZH1lQ2RKln1sWN8TMVurUZlsGwu+aPyoxbbrbewFxL1ecp5cSwRcl056O10jjuMNx0pRtDPjbHNI
	XJiDgCzeMdyzQ5olFlqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsC5W-00EuRn-EF; Fri, 20 May 2022 23:31:18 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsC5J-00EuPn-Hp
 for linux-amlogic@lists.infradead.org; Fri, 20 May 2022 23:31:08 +0000
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7558402F0
 for <linux-amlogic@lists.infradead.org>; Fri, 20 May 2022 23:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653089460;
 bh=ZoLTGUNDR/cAceQ0062xDpVyhJQOJqv761l2k/Ads6Y=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=fV8TXl8DWC0htBxqaDP0gUmOJQEU68WKgv/nmFSP5ZTUuUCvrNm8Ib5x3wtYLH34W
 btXPKnAtdu8xkKcsNao0XoYrll4xMUj59xnEZeNaeZq8j8WfqWI2SY3vrpHJlE0Rav
 N9QWQIpMfsJA5ZRZ5UL/EIFadnAeTeH+ycedNoU6UE6LHslT7jqO12oZOYkXl74sn8
 86rFz5/oliUAkD/gBXIJQxwJpvUq3EeloaryYAuYXvmh25HfRlrQsSL1qA6W39U3BR
 2AMm2gl5h4mdAPls+akGS+n/WzX40/Ydgt3CFzt4LRoxtTUH0GqvCUS9wKaqhgfWQf
 0rgmQ53XWutow==
Received: by mail-il1-f198.google.com with SMTP id
 d6-20020a056e02214600b002d1508d53edso5644355ilv.16
 for <linux-amlogic@lists.infradead.org>; Fri, 20 May 2022 16:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZoLTGUNDR/cAceQ0062xDpVyhJQOJqv761l2k/Ads6Y=;
 b=qwD0q39+yUzbs8VlWCaCr0q+RO6nqd4Bnt3/+bLb9CywRXJPJiD3XUbqSErJhKzHyV
 2aHXFBnT0JLIcTYOXsp4+fiLxUCAJNd2RTj9VWIHWLfle21RYayMRdGJeCxF2Q5YnIMj
 DlhQv1xUkT+NNefwTNiUw9nfcLxunkqXMrUCfvqFJYx6z4VU++SH7yvQM+gxWIDHmFJn
 6eN8kPxD5Z1wzI5UFVkAt0xtNbDgxmjks1rCMn4xPV9bqkv1s86zgwPQLXhh3RT8FX0m
 vKWr2yaUhTS3dxqJiGwMMSlqG+iZi3kg+lV9Pcb2CQSiXCBBU3KzQEPExXiQSPqisRyV
 HGeg==
X-Gm-Message-State: AOAM533WWQZzJQWEodKk0QJMoetZqRjOqEi6TorvuObTl9E5ai4Vy480
 ybITQTcmhEObVm/vYPAkKuleLh6oqEpGp1ffrHsIIecKsYWB76sYzIJ39W+3eeiuHbyuRaE4/LQ
 jekRIaLXUm2qmCMynZpUhszeHZ1+aRpkFske4rFfTK+OxFFuq
X-Received: by 2002:a02:16c2:0:b0:32d:f31d:45f6 with SMTP id
 a185-20020a0216c2000000b0032df31d45f6mr6282392jaa.139.1653089454142; 
 Fri, 20 May 2022 16:30:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrtdAbEC5hj6n7GNi2jPy+JL1ipHjj/PZSah8pk+o8Vxq2XMD5ZUfcCyU4+J/fAG98A+kutw==
X-Received: by 2002:a02:16c2:0:b0:32d:f31d:45f6 with SMTP id
 a185-20020a0216c2000000b0032df31d45f6mr6282380jaa.139.1653089453851; 
 Fri, 20 May 2022 16:30:53 -0700 (PDT)
Received: from xps13.dannf (c-73-14-97-161.hsd1.co.comcast.net. [73.14.97.161])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a926f0b000000b002cde6e352bdsm2238339ilc.7.2022.05.20.16.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 16:30:52 -0700 (PDT)
Date: Fri, 20 May 2022 17:30:50 -0600
From: dann frazier <dann.frazier@canonical.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Kevin Hilman <khilman@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 6/8] arm64: Import latest memcpy()/memmove()
 implementation
Message-ID: <YogkqqK1vjsRLBU2@xps13.dannf>
References: <cover.1622128527.git.robin.murphy@arm.com>
 <3c953af43506581b2422f61952261e76949ba711.1622128527.git.robin.murphy@arm.com>
 <CGME20210608111534eucas1p2964e360336878b9e7a791c0fbeb12940@eucas1p2.samsung.com>
 <acb244ad-0759-5a96-c659-5c23003d3dcd@samsung.com>
 <00519b97-7e09-49ed-817e-de234b0c1cd4@arm.com>
 <7624e09f-cd52-9430-ab18-1d816c8d2898@samsung.com>
 <66d01d91-f52c-1318-aa12-175afff86bad@baylibre.com>
 <20210608124248.GA16585@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210608124248.GA16585@C02TD0UTHF1T.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_163105_905465_5A1A6960 
X-CRM114-Status: GOOD (  22.65  )
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

On Tue, Jun 08, 2021 at 01:42:48PM +0100, Mark Rutland wrote:
> On Tue, Jun 08, 2021 at 02:36:26PM +0200, Neil Armstrong wrote:
> > On 08/06/2021 14:21, Marek Szyprowski wrote:
> > > On 08.06.2021 13:37, Robin Murphy wrote:
> > >> On 2021-06-08 12:15, Marek Szyprowski wrote:
> > >>> This patch landed recently in linux-next as commit 285133040e6c ("a=
rm64:
> > >>> Import latest memcpy()/memmove() implementation"). Sadly it causes
> > >>> serious issues on Khadas VIM3 board. Reverting it on top of linux
> > >>> next-20210607 (together with 6b8f648959e5 and resolving the conflic=
t in
> > >>> the Makefile) fixes the issue. Here is the kernel log:
> > >>>
> > >>> Unable to handle kernel paging request at virtual address =

> > >>> ffff8000136bd204
> > >>> Mem abort info:
> > >>> =A0 =A0 ESR =3D 0x96000061
> > >>> =A0 =A0 EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > >>> =A0 =A0 SET =3D 0, FnV =3D 0
> > >>> =A0 =A0 EA =3D 0, S1PTW =3D 0
> > >>> Data abort info:
> > >>> =A0 =A0 ISV =3D 0, ISS =3D 0x00000061
> > >>
> > >> That's an alignment fault, which implies we're accessing something =

> > >> which isn't normal memory.
> =

> [...]
> =

> > >>> I hope that the above log helps fixing the issue. IIRC the SDHCI dr=
iver
> > >>> on VIM3 board uses internal SRAM for transferring data (instead of =
DMA),
> > >>> so the issue is somehow related to that.
> > >>
> > >> Drivers shouldn't be using memcpy() on iomem mappings. Even if they =

> > >> happen to have got away with it sometimes ;)
> > >>
> > >> Taking a quick look at that driver,
> > >>
> > >> =A0=A0=A0=A0host->bounce_buf =3D host->regs + SD_EMMC_SRAM_DATA_BUF_=
OFF;
> > >>
> > >> is completely bogus, as Sparse will readily point out.
> > =

> > My bad, what's the correct way to copy data to an iomem mapping ?
> =

> We have memcpy_toio() and memcpy_fromio() for this.

ltp's read_all_sys test is triggering something similar which I
bisected back to this commit - see below. Does this imply we need
something like a memory_read_from_*io*_buffer()?

[ 2583.023514] Unable to handle kernel paging request at virtual address ff=
ff80004a3003bf
[ 2583.031456] Mem abort info:
[ 2583.034259]   ESR =3D 0x96000021
[ 2583.037317]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[ 2583.042632]   SET =3D 0, FnV =3D 0
[ 2583.045689]   EA =3D 0, S1PTW =3D 0
[ 2583.048834] Data abort info:
[ 2583.051704]   ISV =3D 0, ISS =3D 0x00000021
[ 2583.055542]   CM =3D 0, WnR =3D 0
[ 2583.058512] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D00004011822310=
00
[ 2583.065217] [ffff80004a3003bf] pgd=3D10000800001a2003, p4d=3D10000800001=
a2003, pud=3D100008000fa35003, pmd=3D100008001ddbd003, pte=3D0068000088230f=
13
[ 2583.077751] Internal error: Oops: 96000021 [#22] SMP
[ 2583.082710] Modules linked in: nls_iso8859_1 joydev input_leds efi_pstor=
e arm_spe_pmu acpi_ipmi ipmi_ssif arm_cmn xgene_hwmon arm_dmc620_pmu arm_ds=
u_pmu cppc_cpufreq acpi_tad sch_fq_codel dm_multipath scsi_dh_rdac scsi_dh_=
emc scsi_dh_alua ipmi_devintf ipmi_msghandler ip_tables x_tables autofs4 bt=
rfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov async_me=
mcpy async_pq async_xor async_tx xor xor_neon raid6_pq libcrc32c raid1 raid=
0 multipath linear hid_generic usbhid cdc_ether hid usbnet mlx5_ib ib_uverb=
s ib_core uas usb_storage ast drm_vram_helper drm_ttm_helper ttm i2c_algo_b=
it drm_kms_helper syscopyarea crct10dif_ce sysfillrect ghash_ce sysimgblt s=
ha2_ce fb_sys_fops sha256_arm64 cec sha1_ce rc_core mlx5_core nvme drm psam=
ple xhci_pci nvme_core mlxfw xhci_pci_renesas tls aes_neon_bs aes_neon_blk =
aes_ce_blk crypto_simd cryptd aes_ce_cipher
[ 2583.158313] CPU: 38 PID: 8392 Comm: read_all Tainted: G      D          =
 5.13.0-rc3+ #15
[ 2583.166394] Hardware name: WIWYNN Mt.Jade Server System B81.030Z1.0007/M=
t.Jade Motherboard, BIOS 1.6.20210526 (SCP: 1.06.20210526) 2021/05/26
[ 2583.179075] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=3D--)
[ 2583.185072] pc : __memcpy+0x168/0x260
[ 2583.188735] lr : memory_read_from_buffer+0x58/0x80
[ 2583.193524] sp : ffff80004321bb40
[ 2583.196826] x29: ffff80004321bb40 x28: ffff07ffdd8bae80 x27: 00000000000=
00000
[ 2583.203952] x26: 0000000000000000 x25: 0000000000000000 x24: ffff07ffd2b=
d5820
[ 2583.211077] x23: ffff80004321bc30 x22: 00000000000003ff x21: ffff8000432=
1bba8
[ 2583.218201] x20: 00000000000003ff x19: 00000000000003ff x18: 00000000000=
00000
[ 2583.225326] x17: 0000000000000000 x16: 0000000000000000 x15: 00000000000=
00000
[ 2583.232449] x14: 0000000000000000 x13: 0000000000000000 x12: 00000000000=
00000
[ 2583.239573] x11: 0000000000000000 x10: 0000000000000000 x9 : 00000000000=
00000
[ 2583.246697] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 00000000000=
00000
[ 2583.253820] x5 : ffff07ffb7d93bff x4 : ffff80004a3003ff x3 : ffff07ffb7d=
93b80
[ 2583.260945] x2 : ffffffffffffffef x1 : ffff80004a3003c0 x0 : ffff07ffb7d=
93800
[ 2583.268069] Call trace:
[ 2583.270504]  __memcpy+0x168/0x260
[ 2583.273807]  acpi_data_show+0x5c/0x8c
[ 2583.277464]  sysfs_kf_bin_read+0x78/0xa0
[ 2583.281378]  kernfs_fop_read_iter+0xac/0x1e0
[ 2583.285637]  new_sync_read+0xf0/0x184
[ 2583.289290]  vfs_read+0x158/0x1e4
[ 2583.292594]  ksys_read+0x74/0x100
[ 2583.295898]  __arm64_sys_read+0x28/0x34
[ 2583.299723]  invoke_syscall+0x78/0x100
[ 2583.303466]  el0_svc_common.constprop.0+0x158/0x160
[ 2583.308332]  do_el0_svc+0x34/0xa0
[ 2583.311637]  el0_svc+0x2c/0x54
[ 2583.314685]  el0_sync_handler+0xa4/0x130
[ 2583.318596]  el0_sync+0x19c/0x1c0
[ 2583.321903] Code: a984346c a9c4342c f1010042 54fffee8 (a97c3c8e) =

[ 2583.327989] ---[ end trace e19a85d1dd8510e5 ]---

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
