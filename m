Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB704C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Mar 2022 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G5BtmAH5YNilcGQprlv/BAaqyiID8C2sb5z8cVUiVdU=; b=kB45PlgT/B0wBjz+4DxJVyp6I7
	I0idaSXI4N5uteZbee9qUH6pGLybboWYDrgIBvG/GK8ZMRg1CHSdajb/wH3woEfMjLaod5kGcCDmj
	1ebAwKV6278kLezSWOdt6zx1W/TtPtio3c1GfUTJHT4PVow84x5PK5alGB9EnQy9tbueBMPrpw6jF
	Lc06yz95vgX8YrwE4V2brOmfr+rXyhwADtIqcx2R3zjDAT66Vsf7WbNWCIARz07Fv4LEeQwi2zUhp
	tcVYjW6Ik8/FFU2RmuLnFXNztG3inM0NsDyam0kLeWyGKyNtXREgjPq8CLtNAKEsrCPzNk/vwoY8J
	0ickbEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRbDh-004qjs-V0; Tue, 08 Mar 2022 14:53:49 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRbDf-004qjS-VC
 for linux-amlogic@lists.infradead.org; Tue, 08 Mar 2022 14:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646751227; x=1678287227;
 h=to:cc:references:from:subject:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zeMWxwZ30S6VBETKZhm258zEcDrFW79BXEaWO/w3pOQ=;
 b=Z9UYtb9Z3eyL20H/8zjqwo2Epjno/CMOagE7UxD8qw/YRM0PqtPjZXIj
 n9a0iq79LOWyHYUqgdoHOWv2rDnd1JHPoaZugITfGqfI8EW++2m7katw0
 He9UV5CzvttyNqmlDDqbCPQRwaRRfAQbk69BfFCSeWABG+GiPbgUwGuVT
 LDJaFpDXutH7nMzsidX0q24StzXnTwwrswTKDpDGlXhCSGuG9jjJ7xzIG
 46/xMBdf1G/2LYGVEy1vURrZfmw4+xVhsOCCciW3JEgrybhoOWlzU3ikq
 QpUWk3WwvkbrQcQikrWyn9qST9BtckK0wQUfDazT9eBxTEpjB4ieOQMXr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="234653613"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="234653613"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:53:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="578011785"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by orsmga001.jf.intel.com with ESMTP; 08 Mar 2022 06:53:45 -0800
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
 <e73bc0c1-e530-7419-0197-1b7de02c87c5@gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 5/5] xhci: support omitting shared hcd if either of the
 root hubs has no ports
Message-ID: <e41743c9-73dd-0c2c-3df3-a20b53f066e8@linux.intel.com>
Date: Tue, 8 Mar 2022 16:55:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e73bc0c1-e530-7419-0197-1b7de02c87c5@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_065348_054708_C0115D51 
X-CRM114-Status: GOOD (  21.37  )
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

On 4.3.2022 20.37, Heiner Kallweit wrote:
> If either of the root hubs has no ports, then we can get rid of
> overhead like the shared hcd. A major internal change is that now
> the main hcd can be USB2 or USB3.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/usb/host/xhci-mem.c | 11 +++++------
>  drivers/usb/host/xhci.c     |  9 ++++++---
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index a1a17713a..ced139583 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2362,12 +2362,11 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
>  		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
>  	}
>  
> -	xhci->needs_shared_hcd = 1;
> -
> -	/*
> -	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
> -	 * Not sure how the USB core will handle a hub with no ports...
> -	 */
> +	if (xhci->usb2_rhub.num_ports && xhci->usb3_rhub.num_ports)
> +		xhci->needs_shared_hcd = 1;
> +	else
> +		xhci_info(xhci, "USB%u root hub has no ports\n",
> +			  xhci->usb2_rhub.num_ports ? 3 : 2);

This now works for xhci controllers using xhci-plat.c, but in all other cases
the the secondary hcd will still be added.

Would it make sense to instead of setting xhci->needs_shared_hcd, we
set a xhci->allow_single_roothub flag in the .reset override function?
In the xhci-plat.c case this would be in xhci_plat_setup()

We would only add the flag if the respective probe supports one roothub.

Add a helper function to check if we if really should set up just one 
hcd in probe, and should call xhci_run_finished() already the he first time
xhci_run() is called (like you do in patch 3/5).

Something like:

bool xhci_has_one_roothub(struct xhci_hcd *xhci)
{
	return xhci->allow_single_roothub && (!xhci->usb2_rhub.num_ports != !xhci->usb3_rhub.num_ports);
}

Thanks
-Mathias

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
