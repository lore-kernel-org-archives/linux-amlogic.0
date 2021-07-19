Return-Path: <SRS0=+Him=ML=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7759AC07E9B
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jul 2021 14:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D91D61002
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jul 2021 14:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D91D61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9muReEH7mjojMOt+Py8f/SV7BIY0R0rZmkJW5EuX8wg=; b=cNSS25rr0WBXFL
	bqFBtBFYsd0gK34paH9OcPBa7avjgjAfQuLbIAECQcTlqFjOk2ZFSYQEvlR3mkNBoMUMw05QdmUw/
	xtrEiC5lAfmclhJo9MJDrltdBf4ZeUCnnRpc54WPjhBU6TLPEekXwFtCFOOLGX3ZO4bgk/QDbndcZ
	6KtHYkIolQz64quo1a7F+oSk5pWLRHunSQOi3KoAhYELeA7c1FSHQkTMiDlRlqOwI3PkDB8E0mpHW
	vFrgqpie7MiKnYlMvmd6PU792djDsY7c22XcXzpOF7H5MQlctuCheyxBlvRvT8IXaJysF25gtyPgn
	f2Xm6L7wRPIXo2JcL79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5UeB-009xlV-50; Mon, 19 Jul 2021 14:53:31 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Ue7-009xkn-3o
 for linux-amlogic@lists.infradead.org; Mon, 19 Jul 2021 14:53:29 +0000
Received: (qmail 567075 invoked by uid 1000); 19 Jul 2021 10:53:22 -0400
Date: Mon, 19 Jul 2021 10:53:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Message-ID: <20210719145322.GA565905@rowland.harvard.edu>
References: <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
 <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
 <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
 <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
 <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
 <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
 <20210715014451.GA397753@rowland.harvard.edu>
 <CAFBinCD0GKcc8veWAkWG=NCban4k8n5E-QdhNfccuH8OXvtA6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCD0GKcc8veWAkWG=NCban4k8n5E-QdhNfccuH8OXvtA6g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_075327_354287_09687E7F 
X-CRM114-Status: GOOD (  40.80  )
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

On Sun, Jul 18, 2021 at 11:24:55PM +0200, Martin Blumenstingl wrote:
> Hi Alan,
> 
> sorry for being a bit slow to respond this time.
> 
> On Thu, Jul 15, 2021 at 3:44 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> [...]
> > Martin, here's another test you can try, on both the Odroid and PC
> > systems.  Boot with usb.autosuspend=-1 on the command line to disable
> Please note that in my tests below I used usbcore.autosuspend=-1 (so
> s/usb./usbcore./)
> I am assuming that usb.autosuspend is a typo because it doesn't seem
> to make a difference for me.

Yes, it was a typo.  Sorry.

> usbcore.autosuspend=-1 is the one you recommended earlier which did
> work around the issue on Odroid-C1.
> 
> > default runtime suspend.  But then before plugging in the drive, start a
> > usbmon trace and do:
> >
> >         echo 2 >/sys/bus/usb/devices/1-2/power/autosuspend
> >
> > to enable runtime suspend for the Genesys Logic hub.  (On the PC,
> > replace the 1-2 with 1-5 or whatever the appropriate device path is for
> > the GL hub.)
> The steps on my PC are:
> - boot with usbcore.autosuspend=-1 in the kernel cmdline (confirmed
> using cat /proc/cmdline)
> - start: cat /sys/kernel/debug/usb/usbmon/1u > 1u.mon-pc.out
> - echo 2 > /sys/bus/usb/devices/1-7/power/autosuspend (which I chose
> based on the lsusb output below)
> - wait at least 5 seconds
> - plug in my Corsair Voyager USB 3.0 flash drive
> - wait one or two seconds until the device shows up in dmesg
> - stop the cat command
> - lsusb -vvt
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>    ID 1d6b:0002 Linux Foundation 2.0 root hub
>    /sys/bus/usb/devices/usb1  /dev/bus/usb/001/001
>    [...]
>     |__ Port 7: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>        ID 05e3:0610 Genesys Logic, Inc. Hub
>        /sys/bus/usb/devices/1-7  /dev/bus/usb/001/005
>        |__ Port 3: Dev 10, If 0, Class=Mass Storage, Driver=usb-storage, 480M
>            ID 1b1c:1a03 Corsair Voyager 3.0
>            /sys/bus/usb/devices/1-7.3  /dev/bus/usb/001/010
> 
> Please note that virtually all USB2 devices are connected through hubs
> on bus 01 port 01 on this motherboard.
> So the 1u.mon-pc.out output probably contains information for other
> devices than the ones which are relevant here as well.

Yes.  It all looks normal.

> Then on my Odroid-C1:
> - boot with usbcore.autosuspend=-1 in the kernel cmdline (confirmed
> using cat /proc/cmdline)
> - start: cat /sys/kernel/debug/usb/usbmon/0u > 0u.mon-odroidc1.out
> - echo 2 > /sys/bus/usb/devices/1-1/power/autosuspend (which I chose
> based on the lsusb output below)
> - wait at least 5 seconds
> - plug in my Corsair Voyager USB 3.0 flash drive
> - wait a few seconds, the device is *not* being detected (no sign on
> life in dmesg)
> - stop the cat command
> - lsusb -vvt
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
>    ID 1d6b:0002 Linux Foundation 2.0 root hub
>    /sys/bus/usb/devices/usb1  /dev/bus/usb/001/001
>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>        ID 05e3:0610 Genesys Logic, Inc. Hub
>        /sys/bus/usb/devices/1-1  /dev/bus/usb/001/002
> 
> From what I can tell the outputs related to device 005 (on my PC) as
> well as 002 (on my Odroid-C1) are identical up to the point where
> Odroid-C1 is then just silent.

That's what it looks like to me too.  This means that the hub on the 
Odroid doesn't support remote wakeup properly.  Or else the root hub 
gets the remote-wakeup message and doesn't handle it properly.  Either 
way it's a pretty nasty bug for a significant piece of hardware.

> The first message to the USB bus is different between the two (001) in
> both cases. If I had to guess then the difference comes to the device
> number of the hub within the payload.
> 
> > Wait at least two seconds for the hub to go into runtime suspend before
> > plugging in the Corsair drive and stopping the trace.  It might turn out
> > that allowing the GL hub to suspend while keeping the DWC2 root hub
> > active will make a difference.
> >
> > (The reason for doing this on the PC as well as on the Odroid is to make
> > sure that the sequence of USB requests sent to the hub and responses
> > received from it is exactly the same in both cases.)
> If you want me to run any additional commands (either on my PC or
> Odroid-C1) then please let me know.
> 
> In case it's of any help I attached the sysfs attributes for both
> hubs. The only differences are:
> - bcdDevice: 6060 (on my PC) vs 3298 (on Odroid-C1)

Indicating that the two hubs really are of different designs.

> - urbnum: 72 (on my PC) vs 26 (on Odroid-C1)

That's not important for us.

These results suggest that the best approach will be to prevent the hub 
from going into runtime suspend.  You can do this manually by:

	echo -1 >/sys/bus/usb/devices/1-1/power/autosuspend

This will cause the hub to be resumed even if it was already suspended, 
so you don't need the kernel boot-line parameter.  However, I'm not 
sure whether the hub will then correctly detect the Corsair drive if it 
was plugged in before boot-up -- I suspect it won't.  Can you try this 
out, and start a usbmon trace before doing the "echo" command?

It's possible to create a udev script that will perform this action 
automatically at startup (does your OS use udev?).  Again, the only way 
to see if the Corsair drive will then work is to try it.

If this doesn't work, I think the only solution will be a kernel patch.

Alan Stern

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
