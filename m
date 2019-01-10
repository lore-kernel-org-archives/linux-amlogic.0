Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D94C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 18:33:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328AA20874
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 18:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxiFwklE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328AA20874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QI0XhaDep3GrcNj95BgWQv/PVrXyqjG/mnlwYq2DU4o=; b=YxiFwklEx5RM/+
	B8vmim0dZJuWJM6GJjdwGtikBngAbVwshNRt2d+qmlA9zdrLFEUC7CpzfmiKg1OiPHcMxcaQVqqdq
	iZRfp8eXMaoeKvgWkLj3Aaq80ddR4+mCeg7FbUPx9OPiY/v+vgV0oPldUvMj3I0ktmSr47vsxT7ey
	k9XGgB4qKD1P7CuP7Nrjft6GJxxQ9BPc5SSV1HlN1xMjVrh+Xxma9aDd07HdFgHAa4hhAgimkj6Zn
	c0TYw4pp+07Vq7ZUZzRGqRVe/WLtLznJkb4nVniV8Tj27GcVwn1t/mI0KkxlK6xBA9uH5g7htYgkU
	wvgOaxcwBi9e1GprKTWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghf92-0008LN-Gk; Thu, 10 Jan 2019 18:33:32 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghf8z-0008Ky-5X
 for linux-amlogic@lists.infradead.org; Thu, 10 Jan 2019 18:33:31 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A7E13C0006;
 Thu, 10 Jan 2019 18:33:20 +0000 (UTC)
Date: Thu, 10 Jan 2019 19:42:38 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Elie Roudninski <xademax@gmail.com>
Subject: Re: Kernel segmentation fault unbinding eMMC on AML-S905X-CC
Message-ID: <20190110184238.GB982@voidbox.localdomain>
References: <5c3744c0.1c69fb81.93dc1.2aff@mx.google.com>
 <20190110140829.GA982@voidbox.localdomain>
 <CAJJ5kauWzt07njVUfhmab-CTYtCBzZF0PeV==5WqJnqtr8sNGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJJ5kauWzt07njVUfhmab-CTYtCBzZF0PeV==5WqJnqtr8sNGA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_103329_480813_B8870AE4 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 10, 2019 at 04:43:31PM +0000, Elie Roudninski wrote:
[ ... ]
> Your patch seems to work. I still got a stacktrace but not a segfault
> anymore, and it appears to be related to something else:
> [  148.133895] WARNING: CPU: 1 PID: 580 at
> drivers/mmc/host/meson-gx-mmc.c:1027 meson_mmc_irq+0x210/0x2a0
> [  148.137535] Modules linked in: cfg80211 rfkill 8021q garp mrp stp
> llc dw_hdmi_cec meson_dw_hdmi dw_hdmi meson_drm dwmac_generic
> drm_kms_helper dwmac_meson8b drm crct10dif_ce stmmac_platform stmmac
> drm_panel_orientation_quirks meson_ir ptp syscopyarea rc_core
> sysfillrect sysimgblt fb_sys_fops pps_core meson_canvas meson_gxbb_wdt
> [  148.166345] CPU: 1 PID: 580 Comm: bash Tainted: G        W
> 4.20.0_2 #1
> [  148.173498] Hardware name: amlogic p212/p212, BIOS
> 2019.01-rc2-00176-gf97c49d6a2 01/10/2019
> [  148.181780] pstate: 60400085 (nZCv daIf +PAN -UAO)
> [  148.186527] pc : meson_mmc_irq+0x210/0x2a0
> [  148.190586] lr : __free_irq+0x184/0x318
> [  148.194370] sp : ffff0000108efac0
> [  148.197647] x29: ffff0000108efac0 x28: ffff800005cfb600
> [  148.202908] x27: 0000000000000000 x26: 0000000000000000
> [  148.208169] x25: 0000000000000000 x24: ffff8000105e8228
> [  148.213431] x23: 0000000000000013 x22: ffff8000105e8358
> [  148.218692] x21: ffff800005e61f00 x20: ffff8000105e8200
> [  148.223953] x19: ffff800005e61f00 x18: 0000000000000000
> [  148.229214] x17: 0000000000000000 x16: 0000000000000000
> [  148.234476] x15: ffffffffffffffff x14: 6d6d2e3030303437
> [  148.239737] x13: 3030642f6270612e x12: 0000000000000040
> [  148.244998] x11: 0000000000000228 x10: 0000000000000040
> [  148.250259] x9 : ffff000009fa9de8 x8 : ffff000009fa9de0
> [  148.255521] x7 : ffff800007e7e050 x6 : 0000000000000000
> [  148.260782] x5 : ffff800007e7df90 x4 : 0000000000000000
> [  148.266043] x3 : 0000000000000000 x2 : ffff000008b90080
> [  148.271304] x1 : ffff800005e61f00 x0 : 0000000000000000
> [  148.276566] Call trace:
> [  148.278984]  meson_mmc_irq+0x210/0x2a0
> [  148.282692]  __free_irq+0x184/0x318
> [  148.286142]  free_irq+0x40/0x80
> [  148.289247]  meson_mmc_remove+0x48/0x190
> [  148.293130]  platform_drv_remove+0x30/0x50
> [  148.297190]  device_release_driver_internal+0x1b0/0x248
> [  148.302357]  device_release_driver+0x28/0x38
> [  148.306583]  unbind_store+0xdc/0x148
> [  148.310119]  drv_attr_store+0x40/0x58
> [  148.313743]  sysfs_kf_write+0x5c/0x78
> [  148.317364]  kernfs_fop_write+0xe8/0x1e0
> [  148.321247]  __vfs_write+0x60/0x190
> [  148.324695]  vfs_write+0xac/0x1b0
> [  148.327972]  ksys_write+0x6c/0xd0
> [  148.331250]  __arm64_sys_write+0x24/0x30
> [  148.335133]  el0_svc_common+0x94/0xe8
> [  148.338754]  el0_svc_handler+0x38/0x80
> [  148.342463]  el0_svc+0x8/0xc
> [  148.345308] ---[ end trace eb849c1a635abc72 ]---
> [  148.350408] meson-gx-mmc d0074000.mmc: Dropping the link to regulator.3
> [  148.356575] meson-gx-mmc d0074000.mmc: Dropping the link to regulator.1
> 

Yes should be fixed in 4.21 by https://lkml.org/lkml/2018/12/6/748.

> Moreover when I bind the eMMC after the unbind, Linux detects it
> properly, its a huge improvement!
> Thank you very much!
> 

Good, so I have submitted a slightly modified version of this patch
https://patchwork.kernel.org/patch/10756449/.

-- 
Remi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
