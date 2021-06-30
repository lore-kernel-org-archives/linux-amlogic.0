Return-Path: <SRS0=U8YT=LY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4D8C11F67
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jun 2021 00:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1052F61D50
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jun 2021 00:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1052F61D50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyDNY43o4FfeOUiSJQYIQck8QgKOgflJDmKbn3zcEkk=; b=i4W3+8hQsuhnO1
	dGTorqBIrJnzgmx1Y351litC4nN0Hhx1o3nloCmJjYiSdS/Zqq0Ktn/NZYCunhaAdkfU4XynNnvIF
	Rpcx1aMSHk/iBR+AoY3k+V7A8FkbDwQQ8V9Ji9JUkqs1lNB5KkmV1nNkRf0hTi5i3tTYTgacxQ3KW
	yY2Kgg7OvbZMr9IMWITSvP/maMlmZ2qC1YtV1Vcyzjd9SH5roC0IzHkty1+zT4MRcGNuUDhkqqx1p
	223cL+jIMgbJnsZmuF6SNx4p8nn8hOEdCdVMzMAhzmH5GdbIv442A95OiSbLxDmsQKZRfVQYylniJ
	MZeGspnvy73R1GVZ/Nrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyOCv-00CKpG-9X; Wed, 30 Jun 2021 00:36:01 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyOCs-00CKoG-Bf
 for linux-amlogic@lists.infradead.org; Wed, 30 Jun 2021 00:36:00 +0000
Received: (qmail 718644 invoked by uid 1000); 29 Jun 2021 20:35:56 -0400
Date: Tue, 29 Jun 2021 20:35:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux.amoon@gmail.com
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Message-ID: <20210630003556.GA718579@rowland.harvard.edu>
References: <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
 <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu>
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_173558_592541_1DE05791 
X-CRM114-Status: GOOD (  30.85  )
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

On Tue, Jun 29, 2021 at 06:30:08PM +0200, Martin Blumenstingl wrote:
> Hi Alan,
> 
> On Tue, Jun 29, 2021 at 6:18 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> [...]
> > > >         usbcore.autosuspend=-1
> > > wow, this helps indeed
> > > my steps are:
> > > - power off my Odroid-C1+
> > > - unplug all USB devices
> > > - boot with usbcore.autosuspend=-1 in the kernel cmdline
> > > - plugin my Corsair Voyager USB 3.0 flash drive (which was only
> > > detected before if an additional USB 2.0 flash drive was plugged in
> > > during boot)
> > > -> without any lsusb magic the device was immediately recognized
> >
> > That does show pretty convincingly that runtime suspend is causing the
> > problem.  But I still have no idea why the problem affects some devices
> > and not others.  It's a mystery.
> Maybe because there's two related problems (I am guessing here):
> The first issue is that USB hotplug is not working at all on my
> Odroid-C1+ (which means: dwc2 + GL852G USB hub).
> The second issue is that the workaround we had before (running lsusb
> -vv to make "hot plugged" devices show up) is not working for some USB
> devices.
> 
> It seems that using a different workaround (usbcore.autosuspend=-1)
> makes *all* USB devices show up - even without any "lsusb -vv" call.
> So I think we should focus on the first issue as it may also fix the
> other problem as well.

Those two issues could well be related; they could both be a result of 
improper handling of USB bus suspend.  Fixing that might fix both 
issues.

Alan Stern

> [...]
> > > after rebooting without usbcore.autosuspend=-1 (and no USB device
> > > plugged in during boot):
> > > # grep "" /sys/bus/usb/devices/*/power/autosuspend
> > > /sys/bus/usb/devices/1-1/power/autosuspend:0
> > > /sys/bus/usb/devices/usb1/power/autosuspend:0
> > >
> > > I think the next step is narrowing down which component is causing this issue.
> >
> > Maybe Minas can help.  He knows a lot more about dwc2 than I do (which
> > is practically nothing).
> I'll wait for Minas then
> 
> > > Interestingly my PC (running 5.12.13-arch1-2) also has two Genesys
> > > Logic USB hubs with the same USB vendor and device IDs as my
> > > Odroid-C1+: 05e3:0610.
> > > These hubs are connected to my AMD Ryzen 5000 CPU or the B550 chipset:
> > > usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
> > > (xhci-hcd 0000:02:00.0) hub
> > >  1-3               05e3:0610 09 1IF  [USB 2.10,   480 Mbps, 100mA]
> > > (GenesysLogic USB2.0 Hub) hub
> > > [...]
> > >  1-7               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
> > > (Genesys Logic, Inc. Hub) hub
> > >
> > > So far I have not observed any problems on my PC.
> >
> > Presumably because it uses xHCI rather than dwc2.
> indeed. I think it's good to know that it's not an issue affecting all
> Genesys Logic USB 2.0 hubs.
> As you mentioned above it's most likely that dwc2 is the culprit here.
> Or it might be some interoperability issue between dwc2 and GL852G
> 
> 
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
