Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA25FC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0qHOd3Pzhu/6IDYnP8/YSUrPqM6UynKEiBdcmHdp8w=; b=NlGQPbvnUcvZbR
	101jEFNh+pYEsr/v2yVugigm2iiHNL3V7woUh/GmMnJjWRNMmjahSp2yxptUB1X+fOX/xYKXP+k9V
	otoRZ48HxQC7YwBR0KWUtP/EZqzaFrEPrCKXHvvIE1/SP9y9j7QoPSex1oOAYUSLfb2CELViXC0We
	2c6CAXIIhF4W8Yf9E/Rm0dd6cLeaxTPm5kySaaMsSFpGRBreZrfoy04kS9GI3WIVpNi5Bz012Z1SN
	xRLtspiuTN8S/Q82MNbP3/GrOTDf/i522KV3YTUiV5/ZMbJ8JseYiSXjsNIJsss6nmMrkE6kUZieH
	RTM7YGZInIjTdssH6XCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKOR-002HC4-Az; Thu, 24 Feb 2022 20:07:15 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKOO-002HBP-JV
 for linux-amlogic@lists.infradead.org; Thu, 24 Feb 2022 20:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645733233; x=1677269233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oquRCPOPHkcQQcJh58aabPmPBddWqn9vbC+KkdzPF9A=;
 b=hWP3XDt5wWwzrxlMdhq/eOlQVxgSzdK5LOdwuj6dxZkOgiq4gMW+YPCx
 5XsHUC4x2YmVudC3Yu1ehb0niwGSRPXCjVHO1DvQNWN5/RNWGO/4hJzmg
 l4nlfGKZWNOOpm3YXF2P9ebankXJxkT98AUs+SPMul5IH3BoFPQR/YRzD E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 24 Feb 2022 12:07:11 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 12:06:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 12:06:39 -0800
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 12:06:39 -0800
Date: Thu, 24 Feb 2022 12:06:38 -0800
From: Jack Pham <quic_jackp@quicinc.com>
To: Alan Stern <stern@rowland.harvard.edu>, Heiner Kallweit
 <hkallweit1@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB Mailing List
 <linux-usb@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Tung Nguyen <tunguyen@apm.com>, "Mathias
 Nyman" <mathias.nyman@intel.com>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <20220224200637.GE13801@jackp-linux.qualcomm.com>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
 <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
 <Yhaxb0OvMwLtd6vr@rowland.harvard.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yhaxb0OvMwLtd6vr@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_120712_701292_AB975C06 
X-CRM114-Status: GOOD (  21.71  )
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

On Wed, Feb 23, 2022 at 05:13:03PM -0500, Alan Stern wrote:
> On Wed, Feb 23, 2022 at 09:58:56PM +0100, Heiner Kallweit wrote:
> > On 23.02.2022 15:17, Alan Stern wrote:
> > > Don't change register_root_hub().  Just change xhci_plat_probe(); make 
> > > it skip the second call to usb_add_hcd() if there are no USB-3 ports.

I believe this had been attempted in the past, but it does not appear
that patch was ever accepted:

https://lore.kernel.org/linux-usb/1517221474-19627-1-git-send-email-tqnguyen@apm.com/

Jack

> > This works on my system. However a consequence is that xhci->shared_hcd
> > is NULL.
> 
> Why is that?  xhci->shared_hcd doesn't get set in usb_add_hcd(), so 
> skipping that call shouldn't cause it to be NULL.
> 
> Note: If you skip calling usb_add_hcd(), you will also have to skip the 
> corresponding call to usb_remove_hcd().  There may be a few more 
> subtleties involved as well; like I said before, I'm not an expert on 
> this driver.  You should ask the xhci-hcd maintainer for advice.
> 
> Alan Stern
> 
> >  There are a few places like the following in xhci.c where
> > this may result in a NPE. Not knowing the USB subsystem in detail
> > I can't say whether these places are in any relevant path.
> > 
> > static int xhci_run_finished(struct xhci_hcd *xhci)
> > {
> >         if (xhci_start(xhci)) {
> >                 xhci_halt(xhci);
> >                 return -ENODEV;
> >         }
> >         xhci->shared_hcd->state = HC_STATE_RUNNING;
> > 
> > 
> > 
> > > Alan Stern
> > > 
> > >> What I can do: submit my patches as RFC, then there's a better basis
> > >> for a discussion.
> > >>
> > >>> Alan Stern
> > >>
> > >> Heiner
> > 
> > Heiner

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
