Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E3C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jun 2022 20:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxVlb1JeYd4Ew1RSXox9JRsVCjm5Lnr/UjIMYWEM+WM=; b=w5sGLwVvJ/c9WO
	nQ7U8IwhJkq6BeRcZRq9Ogt8M55rVegVtC22sPeFRJ2eecdQxA51TR/puw0MFJK3qUT0JbGF1g0JL
	f84NKX0l4GuDiUo/t+lyFTp8ujlpb9N6fpmW+NxpcuuS+7f01xDqHsDbIedOBzPL0rCiHLJMOXu8i
	4o3ayjq2rEqXay48f1h5KQEYU37pUfZzsrGhkZx2BclNercew8JS1oyXnBDa8piGv+6ctgkr0+IiR
	wTSIs2/8pCMLhelDTpEMMuXGopaPlUxQw4tAVi7dBGI201bqa2uEuAlY2czFUPRGwNImCBs1O8Qjt
	wUwAnC2Wk+QUN7ssCDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz2iX-00EwCY-3d; Wed, 08 Jun 2022 20:55:53 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz2iT-00EwBa-Be
	for linux-amlogic@lists.infradead.org; Wed, 08 Jun 2022 20:55:51 +0000
Received: by mail-pj1-x102e.google.com with SMTP id cx11so19714429pjb.1
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Jun 2022 13:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z/232fzsVbb7dgjNepxZL4eoZulfS0veP9YySAYDrQo=;
        b=Mz3VM2FrViv5JJgPLBSzhsF/5Ab5v6EaGZlPLBWHUqEkHspSLxAI7+9Zl0xvwS9gqs
         aV5+y1pqf3dfCqT1FDAq+qth0g0/w4DLiydl6XVIGNGx9f9MI4wmAt9Q2P5bxLFQ+v06
         kcY4H4+MxzRixP+icSkbQJi6wkAgcITVTTY4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z/232fzsVbb7dgjNepxZL4eoZulfS0veP9YySAYDrQo=;
        b=aqVPlGP/kBJ19AgwOCXjd0+zEsgcMugANtKXgJMbLQXdP1/DAXlNED4cw+ecSCbLPT
         cUIVSzaOSWNLaCwsQxk+75Fk3ICO6dYCMybEXE1MLPtHRectxOo/szjoAV45Vo/eUCyC
         G6WKB2wzhM0vWDFujfrDu46YfD57P5VT6Ab4qBav/i2OJJmzKVAITG/+3WFaVLVvL7JK
         LTYl2R0vlABjhohADSca1pISMhHT6TQfP/8xY1rKHvaPolOE/SGE328hL6S+bzNm0iFe
         hRpPEFnUXAhCb0gOWiIIWAS7BNP/cRlPUg5a6ASmoNJsTuZVCnuoCQ8DmHADG+bA4uHt
         Wc2w==
X-Gm-Message-State: AOAM530y3ZGgGpEtnVOYkXWc90SYNnRLPssywuoFbJk8A7mpOV3bF59x
	0of5vDhnOETkSDyg0+XLidcmaw==
X-Google-Smtp-Source: ABdhPJy+2kmfWTcZO/pQLinOhtlK+K2d4T2PZ4GHLb6oQd6EMz8vbAyf2Ihf0LiDu4tNq7XYpUaqDg==
X-Received: by 2002:a17:90b:224e:b0:1e6:8ae1:8e1a with SMTP id hk14-20020a17090b224e00b001e68ae18e1amr1076608pjb.59.1654721743972;
        Wed, 08 Jun 2022 13:55:43 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:fcda:2ad5:4ebc:c99c])
        by smtp.gmail.com with UTF8SMTPSA id e3-20020a170902784300b001663165eb16sm9648849pln.7.2022.06.08.13.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 13:55:43 -0700 (PDT)
Date: Wed, 8 Jun 2022 13:55:41 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux USB Mailing List <linux-usb@vger.kernel.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jack Pham <quic_jackp@quicinc.com>, Tung Nguyen <tunguyen@apm.com>
Subject: Re: [PATCH v2 4/5] usb: host: xhci-plat: prepare operation w/o
 shared hcd
Message-ID: <YqEMzQgqG16gwFUq@google.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
 <506113fe-5bd9-bdd0-7858-2b702ca32d53@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <506113fe-5bd9-bdd0-7858-2b702ca32d53@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_135549_492784_53142740 
X-CRM114-Status: GOOD (  20.79  )
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

Hi,

with v5.19-rc1 (which includes this patch) I encounter a NULL pointer
exception during system resume on a SC7280 board, which has an
USB2-only HCD:

[   40.490107] Internal error: Oops: 96000005 [#1] PREEMPT SMP
[   40.490121] coresight-dynamic-funnel 6b04000.funnel: PM: calling pm_generic_resume+0x0/0x48 @ 3467, parent: soc@0
[   40.495836] Modules linked in: veth rfcomm algif_hash algif_skcipher af_alg uinput venus_enc venus_dec videobuf2_dma_contig videobuf2_memops cros_ec_typec xt_MASQUERADE typec hci_uart btqca venus_core v4l2_mem2mem videobuf2_v4l2 qcom_q6v5_mss videobuf2_common qcom_pil_info qcom_q6v5 ipa qcom_common rmtfs_mem
[   40.506420] coresight-dynamic-funnel 6b04000.funnel: PM: pm_generic_resume+0x0/0x48 returned 0 after 0 usecs
[   40.506427]  ip6table_nat fuse 8021q cdc_ether usbnet cfg80211 bluetooth ecdh_generic ecc r8152 mii joydev
[   40.534424] CPU: 4 PID: 68 Comm: kworker/u16:2 Not tainted 5.19.0-rc1 #160 01dfc77dff686f7aa36c93a01f531f57c578e1d9
[   40.534433] Hardware name: Google Herobrine (rev1+) (DT)
[   40.544539] coresight-tmc 6b05000.etf: PM: calling pm_generic_resume+0x0/0x48 @ 3467, parent: soc@0
[   40.554421] Workqueue: events_unbound async_run_entry_fn
[   40.554435] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   40.554441] pc : usb_hcd_is_primary_hcd+0x10/0x30
[   40.556483] usb usb2: PM: usb_dev_resume+0x0/0x2c returned 0 after 123459 usecs
[   40.556698] usb 2-1: PM: calling usb_dev_resume+0x0/0x2c @ 3480, parent: usb2
[   40.565157] coresight-tmc 6b05000.etf: PM: pm_generic_resume+0x0/0x48 returned 0 after 0 usecs
[   40.570596] lr : xhci_init+0x24/0xf8
[   40.570604] sp : ffffffc008873c30
[   40.570606] x29: ffffffc008873c30 x28: ffffffdb82157000 x27: 0000000000000402
[   40.570615] x26: ffffff8080040838 x25: ffffff8080906a10 x24: 0000000000000002
[   40.579923] coresight-etm4x 7040000.etm: PM: calling pm_generic_resume+0x0/0x48 @ 3467, parent: soc@0
[   40.585363]
[   40.585365] x23: ffffffdb82157000 x22: 0000000000000000 x21: 0000000000000000
[   40.585372] x20: 0000000000000000 x19: ffffff8081f9c000 x18: 0000000000000800
[   40.585378] x17: 0000000000000354 x16: ffffffdb82162cf8 x15: fffffffe020377c8
[   40.592549] coresight-etm4x 7040000.etm: PM: pm_generic_resume+0x0/0x48 returned 0 after 0 usecs
[   40.597370] x14: 0000000000000000 x13: 0000000062a0f74e x12: 0000000000000018
[   40.597378] x11: 0000000080200000 x10: fffffffe02037820 x9 : ffffffdb817e4490
[   40.597385] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 000000000000003f
[   40.604934] coresight-etm4x 7140000.etm: PM: calling pm_generic_resume+0x0/0x48 @ 3467, parent: soc@0
[   40.612230] x5 : 0000000080200018 x4 : fffffffe02037820 x3 : 0000000080200018
[   40.612237] x2 : ffffff8080de0400 x1 : 0000000000000000 x0 : 0000000000000000
[   40.612244] Call trace:
[   40.612247]  usb_hcd_is_primary_hcd+0x10/0x30
[   40.621107] coresight-etm4x 7140000.etm: PM: pm_generic_resume+0x0/0x48 returned 0 after 0 usecs
[   40.624769]  xhci_resume+0x378/0x5a8
[   40.624775]  xhci_plat_resume+0x70/0xac
[   40.624783]  platform_pm_resume+0x44/0x58
[   40.628215] coresight-etm4x 7240000.etm: PM: calling pm_generic_resume+0x0/0x48 @ 3467, parent: soc@0
[   40.635529]  dpm_run_callback+0x54/0x1a0
[   40.635538]  device_resume+0x220/0x23c
[   40.635545]  async_resume+0x34/0x84
[   40.642885] coresight-etm4x 7240000.etm: PM: pm_generic_resume+0x0/0x48 returned 0 after 0 usecs
[   40.644448] usb usb3: PM: usb_dev_resume+0x0/0x2c returned 0 after 211490 usecs
[   40.644660] usb 3-1: PM: calling usb_dev_resume+0x0/0x2c @ 3486, parent: usb3
[   40.652340]  async_run_entry_fn+0x30/0xd8
[   40.652349]  process_one_work+0x190/0x3d0
[   40.652356]  worker_thread+0x230/0x3d4
[   40.652361]  kthread+0x104/0x2d0
[   40.653923] coresight-etm4x 7340000.etm: PM: calling pm_generic_resume+0x0/0x48 @ 3467, parent: soc@0
[   40.661229]  ret_from_fork+0x10/0x20
[   40.661243] Code: d503245f aa1e03e9 d503201f d503233f (f9413808)
[   40.661247] ---[ end trace 0000000000000000 ]---
[   40.681525] Kernel panic - not syncing: Oops: Fatal exception
[   40.681529] SMP: stopping secondary CPUs
[   40.684977] Kernel Offset: 0x1b79000000 from 0xffffffc008000000
[   40.684980] PHYS_OFFSET: 0x80000000
[   40.684982] CPU features: 0x800,0002e015,19801c82
[   40.684987] Memory Limit: none

In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
however this field isn't initialized by __usb_create_hcd() for a HCD
without secondary controller.

On Wed, Mar 16, 2022 at 11:11:33PM +0100, Heiner Kallweit wrote:
> This patch prepares xhci-plat for the following scenario
> - If either of the root hubs has no ports, then omit shared hcd
> - Main hcd can be USB3 if there are no USB2 ports
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/usb/host/xhci-plat.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 5d752b384..c512ec214 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -180,7 +180,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
>  	struct device		*sysdev, *tmpdev;
>  	struct xhci_hcd		*xhci;
>  	struct resource         *res;
> -	struct usb_hcd		*hcd;
> +	struct usb_hcd		*hcd, *usb3_hcd;
>  	int			ret;
>  	int			irq;
>  	struct xhci_plat_priv	*priv = NULL;
> @@ -327,21 +327,26 @@ static int xhci_plat_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto disable_usb_phy;
>  
> -	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
> -			dev_name(&pdev->dev), hcd);
> -	if (!xhci->shared_hcd) {
> -		ret = -ENOMEM;
> -		goto dealloc_usb2_hcd;
> -	}
> +	if (!xhci_has_one_roothub(xhci)) {
> +		xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
> +						    dev_name(&pdev->dev), hcd);
> +		if (!xhci->shared_hcd) {
> +			ret = -ENOMEM;
> +			goto dealloc_usb2_hcd;
> +		}
>  
> -	xhci->shared_hcd->tpl_support = hcd->tpl_support;
> +		xhci->shared_hcd->tpl_support = hcd->tpl_support;
> +	}
>  
> -	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
> -		xhci->shared_hcd->can_do_streams = 1;
> +	usb3_hcd = xhci_get_usb3_hcd(xhci);
> +	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
> +		usb3_hcd->can_do_streams = 1;
>  
> -	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
> -	if (ret)
> -		goto put_usb3_hcd;
> +	if (xhci->shared_hcd) {
> +		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
> +		if (ret)
> +			goto put_usb3_hcd;
> +	}
>  
>  	device_enable_async_suspend(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
