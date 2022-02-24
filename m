Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB29EC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tiWFtwptHUwiYWpFnLRxJwMMJMOGUX603rBkTZADYo=; b=R2q7ck5AxLUmm5
	E4JDWwBesSiv3k0bGn2mNLVjxRN1WEq/Eimmv4GshA5QRpxTjTS7VWskRJhXMYQXaxDs7EXWQDkdc
	c6vgPKlLpruUqBrITxtzCfi+kJPNQ8mLhp/RVorhDHsoR4fXzlrLG4ZUtykWtagPMe878Mi4X0Vkk
	O+noiTPvrlgfQ59QsrM+lItyFcWuBUOFc0kqkpRr+71QZW61BOvAB3b6H4BdKUL5hvDz/CxtUWimx
	uaRXB5lUt635PAQTqqk0l1X6wYHi+JXYglHUkVISgBJwfsSuspZkDogrOUvg+iuNk64tXMk36hX7i
	+bzlEyW7TWZ/r4wLTZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKc6-002KlR-Ju; Thu, 24 Feb 2022 20:21:22 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKc3-002KkK-1W
 for linux-amlogic@lists.infradead.org; Thu, 24 Feb 2022 20:21:20 +0000
Received: (qmail 1057734 invoked by uid 1000); 24 Feb 2022 15:21:14 -0500
Date: Thu, 24 Feb 2022 15:21:14 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jack Pham <quic_jackp@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Tung Nguyen <tunguyen@apm.com>, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <YhfougN/KOTZeGV7@rowland.harvard.edu>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
 <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
 <Yhaxb0OvMwLtd6vr@rowland.harvard.edu>
 <20220224200637.GE13801@jackp-linux.qualcomm.com>
 <7522820e-0b6d-7e2b-89db-30329c6c2245@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7522820e-0b6d-7e2b-89db-30329c6c2245@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_122119_271380_FA037AAD 
X-CRM114-Status: GOOD (  25.15  )
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

On Thu, Feb 24, 2022 at 09:16:05PM +0100, Heiner Kallweit wrote:
> On 24.02.2022 21:06, Jack Pham wrote:
> > On Wed, Feb 23, 2022 at 05:13:03PM -0500, Alan Stern wrote:
> >> On Wed, Feb 23, 2022 at 09:58:56PM +0100, Heiner Kallweit wrote:
> >>> On 23.02.2022 15:17, Alan Stern wrote:
> >>>> Don't change register_root_hub().  Just change xhci_plat_probe(); make 
> >>>> it skip the second call to usb_add_hcd() if there are no USB-3 ports.
> > 
> > I believe this had been attempted in the past, but it does not appear
> > that patch was ever accepted:
> > 
> > https://lore.kernel.org/linux-usb/1517221474-19627-1-git-send-email-tqnguyen@apm.com/
> > 
> I also found that xhci at several places relies on a proper shared_hcd,
> even if there are no USB3 ports. Therefore maybe go with the less invasive
> original version of my patch?
> 
> https://www.spinics.net/lists/linux-usb/msg222998.html

The patch that Jack refers to, written by Tung Nguyen, does always 
create the shared_hcd.  It simply avoids registering the shared_hcd 
when there are no USB-3 ports.

You should try that patch and see if it works on your system.

Alan Stern

> > Jack
> > 
> >>> This works on my system. However a consequence is that xhci->shared_hcd
> >>> is NULL.
> >>
> >> Why is that?  xhci->shared_hcd doesn't get set in usb_add_hcd(), so 
> >> skipping that call shouldn't cause it to be NULL.
> >>
> >> Note: If you skip calling usb_add_hcd(), you will also have to skip the 
> >> corresponding call to usb_remove_hcd().  There may be a few more 
> >> subtleties involved as well; like I said before, I'm not an expert on 
> >> this driver.  You should ask the xhci-hcd maintainer for advice.
> >>
> >> Alan Stern
> >>
> >>>  There are a few places like the following in xhci.c where
> >>> this may result in a NPE. Not knowing the USB subsystem in detail
> >>> I can't say whether these places are in any relevant path.
> >>>
> >>> static int xhci_run_finished(struct xhci_hcd *xhci)
> >>> {
> >>>         if (xhci_start(xhci)) {
> >>>                 xhci_halt(xhci);
> >>>                 return -ENODEV;
> >>>         }
> >>>         xhci->shared_hcd->state = HC_STATE_RUNNING;
> >>>
> >>>
> >>>
> >>>> Alan Stern
> >>>>
> >>>>> What I can do: submit my patches as RFC, then there's a better basis
> >>>>> for a discussion.
> >>>>>
> >>>>>> Alan Stern
> >>>>>
> >>>>> Heiner
> >>>
> >>> Heiner
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
