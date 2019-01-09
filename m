Return-Path: <SRS0=re6n=PR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718A7C43387
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 22:49:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 379F1206B7
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 22:49:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tlEW2xkb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzPVXhz8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 379F1206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qcJK5q/p+NCn1oAA5gZe5AgJHAPPuDtVwEaaNAA2kbM=; b=tlE
	W2xkbNzgmwdidiPnePjrlHnX96THhYEN7SpQtZOQP2+dYTtbWt9Cx5K/SacIsahY/nx9xsS/L8M6c
	+HZLiPVO4k+MiotNWRQKrsBoLg1TCbztNRaXuUFfTgfcCL53EQ0Vw2lUy6CvmFLbs3Y2nfi+6awMW
	NrQ+DyFUghyZF2SimCu3+YkRh76KqmfvRcAZSfaNBp2V7AVBJiUmfVfc06rI4NUAu1+S5RUgUm6TU
	oNqxHn140RCgKauEpwYPj6s2UlpNoV3iYluuez315VDml57MepcQ6NVOCEF7S8LOuAF2EC8Ba58oc
	5kYptRnMbD1hBVxEuRHJODSdtde2y+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghMen-0008NU-J0; Wed, 09 Jan 2019 22:49:05 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghMek-0008Ms-J5
 for linux-amlogic@lists.infradead.org; Wed, 09 Jan 2019 22:49:04 +0000
Received: by mail-ot1-x341.google.com with SMTP id s5so8221385oth.7
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jan 2019 14:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=O5uvsXnvbEx2D+KwGF1Rf8+iNCqkoCQHQpiITeD8wS8=;
 b=LzPVXhz8h1XvS5KGepMmec8Iq/lUvD35XThGhuSwelj1CFcG1FZ9xCPI7OZs2wQzOm
 JLPiGbeqltqUs0Wq+8DsrB0TFC0JxWJk/WRoc/fFjYG7bfmFQAfrp/m25egxZP1TkWRU
 agUpiHDnEWBknjaUjwUukjFG/RgjC6ZRwimikm+qA8HTZz8NYDqKwzNzaNp6R8s2ac8y
 +FAEGDdg29TGJxSvT88Btu/IMymH1oBAHdCBc6oUua9L0RkAOUmbl9K1lA+75nfPznU9
 xCZWSFt0wuKz+fGbCKrHhU9/6X/TRjJIiUJ45uAMlhzR7cVfdJmo2f9OEKINk0kdIqYY
 ZkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=O5uvsXnvbEx2D+KwGF1Rf8+iNCqkoCQHQpiITeD8wS8=;
 b=CFNMwv3+vbSsJ0qRN9FiWSIp08xZCxj57Njw1wD3eIfBWKLFfcpG8wklf6uHkkwUAJ
 yYFbi9aLhEcAnZdEE+2ivxu4RpIvzRPGMIRKppkWE2S9vG/rDanmnGky77twtMyqrbJc
 wQHHk8pTZYWvdZ2jly75Toqzfbf/zVxPHc+tviPdH+x/wr2JljWI8bo9ZOyJWDVtPegS
 wpRoKxYkcn3to2321l1qHaOWh7d1VcdxPYi6lMsRGBUjwUFiP+rrNL/fDMpAcLlkphXt
 bx7DpXzgdO/cGla00hJ/ZbC6juJCepnj2vihG3CftrLJGtSyn8FFbeFTAyNDd9K96+Kg
 7k6A==
X-Gm-Message-State: AJcUuke7I5iD2+oTTVGrgKE3kifZnh96FUDxBmDiZwOqw62fVf3fEHsa
 U8CNYQkXQI4Bo/bQMgBSRJDDV8Qp+kANTYltpilRBu5gixE=
X-Google-Smtp-Source: ALg8bN4jtEoMZwtMjjTE0EEZRhxTIIedV/g4Z2aTnR3En6UNFnbXVVDjsxyMHlmFRn/O3FByTCyKcBDHlW4mr766jm0=
X-Received: by 2002:a9d:1296:: with SMTP id g22mr4928475otg.305.1547074141219; 
 Wed, 09 Jan 2019 14:49:01 -0800 (PST)
MIME-Version: 1.0
From: Elie Roudninski <xademax@gmail.com>
Date: Wed, 9 Jan 2019 22:48:50 +0000
Message-ID: <CAJJ5kat3q8oJzu1U0Pw8ZqGw4vHY8mHjBERB9rCw9vYMSSb8OA@mail.gmail.com>
Subject: Kernel segmentation fault unbinding eMMC on AML-S905X-CC
To: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_144902_654617_DBAD4702 
X-CRM114-Status: UNSURE (   6.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hello everyone,

I am the owner of an AML-S905X-CC ARM board, also called "Le Potato"
with a full GNU/Linux system running on an SD card using kernel 4.20.
I also bought an eMMC 5.x module on loverpi:
https://www.loverpi.com/collections/libre-computer-project/products/libre-computer-board-emmc-5-x-module?variant=4173557729

I tried to use the eMMC module in order to put the system on it. Once
the system is booted from SD card, i plugged the eMMC module and tried
to detect it using the same command used by lc_redetect_emmc script
provided by libre computer:
> $ echo -n d0074000.mmc > /sys/bus/platform/drivers/meson-gx-mmc/unbind
> $ echo -n d0074000.mmc > /sys/bus/platform/drivers/meson-gx-mmc/bind

On the first command (the unbind) i get a kernel segfault:
------------------------------ 8< ---------------------------
[  443.872211] Unable to handle kernel paging request at virtual
address fffe0000138a03c8
[  443.874469] Mem abort info:
[  443.877228]   ESR = 0x96000044
[  443.880246]   Exception class = DABT (current EL), IL = 32 bits
[  443.886109]   SET = 0, FnV = 0
[  443.889128]   EA = 0, S1PTW = 0
[  443.892232] Data abort info:
[  443.895079]   ISV = 0, ISS = 0x00000044
[  443.898874]   CM = 0, WnR = 1
[  443.901807] [fffe0000138a03c8] address between user and kernel address ranges
[  443.908882] Internal error: Oops: 96000044 [#1] SMP
[  443.913711] Modules linked in: cfg80211 rfkill 8021q garp mrp stp
llc dw_hdmi_cec meson_dw_hdmi dw_hdmi meson_drm drm_kms_helper
dwmac_generic drm dwmac_meson8b stmmac_platform
drm_panel_orientation_quirks crc32_ce stmmac syscopyarea crct10dif_ce
sysfi
llrect sysimgblt ptp fb_sys_fops pps_core meson_ir rc_core meson_gxbb_wdt
[  443.942176] CPU: 0 PID: 467 Comm: bash Tainted: G        W
4.19.13_1 #1
[  443.949416] Hardware name: amlogic p212/p212, BIOS
2019.01-rc2-00176-gf97c49d6a2 01/02/2019
[  443.957699] pstate: 00400085 (nzcv daIf +PAN -UAO)
[  443.962450] pc : queued_spin_lock_slowpath+0x228/0x2d0
[  443.967533] lr : meson_mmc_irq+0x290/0x2a0
[  443.971583] sp : ffff00000fb0fa00
[  443.974860] x29: ffff00000fb0fa00 x28: ffff8000105ef118
[  443.980121] x27: ffff8000105ef118 x26: 0000000000000000
[  443.985382] x25: 0000000000000000 x24: ffff800010633728
[  443.990643] x23: 0000000000000013 x22: ffff800010633858
[  443.995905] x21: ffff800005fab800 x20: 000000006b6b6b6b
[  444.001166] x19: ffff800005fab820 x18: 0000000000000000
[  444.006427] x17: 0000000000000000 x16: 0000000000000000
[  444.011688] x15: ffffffffffffffff x14: 6d6d2e3030303437
[  444.016950] x13: ff00000000000000 x12: 0000000000000040
[  444.022211] x11: 0000000000000228 x10: 0000000000000020
[  444.027472] x9 : 0000000000000000 x8 : 0000000000040000
[  444.032734] x7 : ffff000009f24460 x6 : ffff80007fc7de80
[  444.037995] x5 : ffff000009f42518 x4 : ffff80007fc7de80
[  444.043256] x3 : ffff000009f236c8 x2 : ffff00000995de80
[  444.048517] x1 : ffff00000995deb0 x0 : ffff80007fc7de88
[  444.053781] Process bash (pid: 467, stack limit = 0x0000000086539f6f)
[  444.060161] Call trace:
[  444.062580]  queued_spin_lock_slowpath+0x228/0x2d0
[  444.067322]  meson_mmc_irq+0x290/0x2a0
[  444.071032]  __free_irq+0x184/0x318
[  444.074480]  free_irq+0x40/0x80
[  444.077586]  devm_irq_release+0x24/0x30
[  444.081382]  release_nodes+0x1e0/0x2e0
[  444.085089]  devres_release_all+0x60/0x88
[  444.089057]  device_release_driver_internal+0x1c8/0x248
[  444.094231]  device_release_driver+0x28/0x38
[  444.098459]  unbind_store+0xdc/0x148
[  444.101994]  drv_attr_store+0x40/0x58
[  444.105627]  sysfs_kf_write+0x5c/0x78
[  444.109240]  kernfs_fop_write+0xe8/0x1e0
[  444.113126]  __vfs_write+0x60/0x190
[  444.116570]  vfs_write+0xac/0x1b0
[  444.119848]  ksys_write+0x6c/0xd0
[  444.123125]  __arm64_sys_write+0x24/0x30
[  444.127015]  el0_svc_common+0x94/0xe8
[  444.130629]  el0_svc_handler+0x38/0x80
[  444.134340]  el0_svc+0x8/0xc
[  444.137187] Code: d37c0401 910020c0 8b010041 f865d8e5 (f8256826)
[  444.143223] ---[ end trace 62541ec2ffe020f2 ]---
Segmentation fault
------------------------------ 8< ---------------------------

I also tried this patch https://patchwork.kernel.org/cover/10739097/
as advised by narmstrong without any luck.
I also tried only removing the "non-removable" property also without luck.

With or without those patches, when i plug the eMMC nothing happened,
nothing in dmesg or any mmc device appearing in /dev

It must also be noted that the eMMC is shipped with a system that work
properly so some working code must exist somewhere :)

Regards,

Elie

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
