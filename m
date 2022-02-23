Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95567C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tUO2zh8kf8oFobgVKog3AS/bww6GvHdxVVjQ7w2yfw=; b=zC67ciJeXrjxle
	HpyRRKbLqZGKC4Si62x8Y5xxF4MDLCN/EIblIINXnVP5XlMeizQL66UmhiAIgASvWeJiH1Dmbhz4J
	hB0H2Iap/WYQ0hYFDPTd4n27QDEEgxGeSJABvDw1sMzqYHIeYlOCzqtfNp5JpyA9fUnpUhyOC9bN2
	eJ7teYn8snSqMNzyrK7WWknl+J91QuyQL0HmfsbZHy101kPrMex3A4j0Rfci3obNjyIVUqjSCc94Z
	Ip2tM4gCYWr/czRWLcsw4rAl0G00XYpswp0Nh6vN1+b/RtyiISkHsngm3TFSwm0lZUndJlG3R1VXp
	HFN1r2j4CC4mefqjO9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMt0F-00EqI5-VZ; Wed, 23 Feb 2022 14:52:27 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMsSN-00EhcR-LB
 for linux-amlogic@lists.infradead.org; Wed, 23 Feb 2022 14:17:29 +0000
Received: (qmail 1007847 invoked by uid 1000); 23 Feb 2022 09:17:24 -0500
Date: Wed, 23 Feb 2022 09:17:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <YhZB9C/xGaoslZzT@rowland.harvard.edu>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_061727_894565_480BB4D0 
X-CRM114-Status: GOOD (  21.73  )
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

On Wed, Feb 23, 2022 at 01:26:23PM +0100, Heiner Kallweit wrote:
> On 23.02.2022 03:10, Alan Stern wrote:
> > On Tue, Feb 22, 2022 at 10:13:09PM +0100, Heiner Kallweit wrote:
> >>
> >> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> >> index 83b5aff25..e3f40d1f4 100644
> >> --- a/drivers/usb/core/hub.c
> >> +++ b/drivers/usb/core/hub.c
> >> @@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
> >>  		ret = -ENODEV;
> >>  		goto fail;
> >>  	} else if (hub->descriptor->bNbrPorts == 0) {
> >> -		message = "hub doesn't have any ports!";
> >> -		ret = -ENODEV;
> >> -		goto fail;
> >> +		dev_info(hub_dev, "hub has no ports, exiting\n");
> >> +		return -ENODEV;
> >>  	}
> >>  
> >>  	/*
> > 
> > How about instead changing xhci-hcd so that it doesn't try to register 
> > a USB-3 root hub if the controller doesn't have any USB-3 ports?  I 
> > think that would make more sense.
> > 
> Right, this would be better. I checked and it seems to be a little bit
> bigger endeavor. If I let register_root_hub() fail, then this removes
> the USB3 bus/host (shared hcd), but also the USB2 bus/host.
> It took an additional change to xhci_plat_probe() to make it work on my
> system. Not sure what the impact could be on systems not using
> xhci_plat_probe(). Users may face the same issue like me, and having
> a USB3 hub with no ports may remove also the USB2 bus/host.

Don't change register_root_hub().  Just change xhci_plat_probe(); make 
it skip the second call to usb_add_hcd() if there are no USB-3 ports.

Alan Stern

> What I can do: submit my patches as RFC, then there's a better basis
> for a discussion.
> 
> > Alan Stern
> 
> Heiner

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
