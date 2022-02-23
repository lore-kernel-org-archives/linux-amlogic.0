Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14119C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 02:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/MoHupJcM2rF+rWtU7Tm31N+u729p3EvWRHDgvJnts=; b=PMTVdyelgVum5d
	ycXd5+Fp9XBgQcVvR+iIA3p/Gc/FF2MuYgcoi8EM1Xzn+cVuv9yIOhtv+amMrTEPdCD18snEkf7pY
	hmDdniPEDwp7RzLKlKDWK/6XcHH86qna92Ba9ftutoklrSgP5j45iFJx+aI2ZJPlVLKKmINbj2gJB
	o2J8EntVLoUObqhWjRpljLL8S9Pxij6xYNOP2BGTR+KvvZGe9Ad8vAA0FfLuB7I29ISw4ccSWbx3W
	h3ED3E85aEq0DO553wqzHnrVoawa85LD8d9hs1mVKBQvSfCdbHiz+g9ZeqFCRgFwLYjS2ae+guzF9
	cW/3OesCZMTl+vSOBkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMh6h-00CHBh-GQ; Wed, 23 Feb 2022 02:10:19 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMh6e-00CHAw-I0
 for linux-amlogic@lists.infradead.org; Wed, 23 Feb 2022 02:10:19 +0000
Received: (qmail 993346 invoked by uid 1000); 22 Feb 2022 21:10:11 -0500
Date: Tue, 22 Feb 2022 21:10:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_181016_769374_1E2A759B 
X-CRM114-Status: GOOD (  21.96  )
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

On Tue, Feb 22, 2022 at 10:13:09PM +0100, Heiner Kallweit wrote:
> I get the "hub doesn't have any ports" error message on a system with
> Amlogic S905W SoC. Seems the SoC has internal USB 3.0 supports but
> is crippled with regard to USB 3.0 ports.
> Maybe we shouldn't consider this scenario an error. So let's change
> the message to info level, but otherwise keep the handling of the
> scenario as it is today. With the patch it looks like this on my
> system.
> 
> dwc2 c9100000.usb: supply vusb_d not found, using dummy regulator
> dwc2 c9100000.usb: supply vusb_a not found, using dummy regulator
> dwc2 c9100000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
> xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
> xhci-hcd xhci-hcd.0.auto: hcc params 0x0228f664 hci version 0x100 quirks 0x0000000002010010
> xhci-hcd xhci-hcd.0.auto: irq 49, io mem 0xc9000000
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 2 ports detected
> xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 2
> xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed
> usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> hub 2-0:1.0: USB hub found
> hub 2-0:1.0: hub has no ports, exiting
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/usb/core/hub.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 83b5aff25..e3f40d1f4 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
>  		ret = -ENODEV;
>  		goto fail;
>  	} else if (hub->descriptor->bNbrPorts == 0) {
> -		message = "hub doesn't have any ports!";
> -		ret = -ENODEV;
> -		goto fail;
> +		dev_info(hub_dev, "hub has no ports, exiting\n");
> +		return -ENODEV;
>  	}
>  
>  	/*

How about instead changing xhci-hcd so that it doesn't try to register 
a USB-3 root hub if the controller doesn't have any USB-3 ports?  I 
think that would make more sense.

Alan Stern

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
