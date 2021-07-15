Return-Path: <SRS0=A5vq=MH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56718C12002
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 01:45:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E46E5613B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 01:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E46E5613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stj+Rqmt40M8nizBPbj9rujlWkIs4ubiUmEgmUdY29g=; b=CgDoSknTV2HAhA
	NMoIN/FWgCozJ4MMOJmgBAtCOc9Yv6HAgPSx6Rr3P4co9hObtb6TgzLlTmZeMWIqvTBDipsSxUwZY
	kABlcsLl/xk/uuwyU8cdBRqLSeCL2okOwhdyumeWwqFw8FxVHMv1SgeOnq8KXET+I5V8FafpozvNJ
	xlcQbifnUhF+RMQvCnAmPTxcF2iVU5b/hRgDB61k93zd8O7n7g01m8ly3HvoYwJDky+sQE47eu0EG
	Ac0kY8SucbjAZ7j9gM3gU92F+Vocc5a2yMCe82HWs9cuMKrEkIrlwbeYF/naUOy7kA8Ow+oKXIvRt
	0ARzPaIddfsCH4IRkaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3qQs-00Got3-EQ; Thu, 15 Jul 2021 01:44:58 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3qQp-00Gorv-G9
 for linux-amlogic@lists.infradead.org; Thu, 15 Jul 2021 01:44:57 +0000
Received: (qmail 397993 invoked by uid 1000); 14 Jul 2021 21:44:51 -0400
Date: Wed, 14 Jul 2021 21:44:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Message-ID: <20210715014451.GA397753@rowland.harvard.edu>
References: <20210629161807.GB703497@rowland.harvard.edu>
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
 <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
 <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
 <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
 <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
 <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_184455_736661_1EF56CA2 
X-CRM114-Status: GOOD (  27.46  )
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

On Thu, Jul 15, 2021 at 01:16:44AM +0200, Martin Blumenstingl wrote:
> Hi Minas,
> 
> On Wed, Jul 14, 2021 at 5:27 PM Minas Harutyunyan
> <Minas.Harutyunyan@synopsys.com> wrote:
> >
> > Hi Martin,

> > Per our understanding this issue is because of power budget and
> > autosuspend functionality.
> Many thanks for doing this investigation!
> 
> > Autosuspend. Please review this patch: "usb: core: hub: Disable
> > autosuspend for Cypress CY7C65632"
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=a7d8d1c7a7f73e780aa9ae74926ae5985b2f895f
> >
> > It's very similar to your case. Actually you already tested
> > usbcore.autosuspend=-1 and it's helped you.
> > Could you please develop same patch for your soldered hub and test it.
> I found that drivers/usb/core/hub.c already has an entry for Genesys
> Logic USB hubs.
> It uses HUB_QUIRK_CHECK_PORT_AUTOSUSPEND instead of
> HUB_QUIRK_DISABLE_AUTOSUSPEND though.
> So I wrote a patch to change that (I attached it to this mail for
> reference, I will submit it as a proper patch one I understand enough
> about this).
> 
> With this patch applied all USB devices I have are auto-detected when
> hot-plugged.

Yeah, I suspect this patch will not be accepted.  There are a _lot_ of 
Genesys Logic hubs out there, and apparently none of them besides the 
ones in your Odroid systems have trouble with runtime suspend.

> My doubt with this is that my desktop PC (using an ASUS B550-F
> motherboard) comes with a few of these USB hubs soldered down as well
> - and there the behavior is different.
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>    ID 1d6b:0002 Linux Foundation 2.0 root hub
>    /sys/bus/usb/devices/usb1  /dev/bus/usb/001/001
>    |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>        ID 05e3:0610 Genesys Logic, Inc. Hub
>        /sys/bus/usb/devices/1-3  /dev/bus/usb/001/002
> [...]
>    |__ Port 7: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>        ID 05e3:0610 Genesys Logic, Inc. Hub
>        /sys/bus/usb/devices/1-7  /dev/bus/usb/001/005
> 
> I plugged in the Corsair Voyager USB 3.0 drive which is not being
> detected on my Odroid-C1+ and instantly this shows up in my kernel
> log:
>   usb 1-7.3: new high-speed USB device number 46 using xhci_hcd
>   usb 1-7.3: New USB device found, idVendor=1b1c, idProduct=1a03,
> bcdDevice= a.00
>   usb 1-7.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 1-7.3: Product: Voyager 3.0
>   usb 1-7.3: Manufacturer: Corsair
> 
> So I am wondering why it works there but not on my Odroid-C1, with the
> (only known) difference being the host controller (xhci_hcd vs dwc2)
> which is being used.

Indeed.

Martin, here's another test you can try, on both the Odroid and PC 
systems.  Boot with usb.autosuspend=-1 on the command line to disable 
default runtime suspend.  But then before plugging in the drive, start a 
usbmon trace and do:

	echo 2 >/sys/bus/usb/devices/1-2/power/autosuspend

to enable runtime suspend for the Genesys Logic hub.  (On the PC, 
replace the 1-2 with 1-5 or whatever the appropriate device path is for 
the GL hub.)

Wait at least two seconds for the hub to go into runtime suspend before 
plugging in the Corsair drive and stopping the trace.  It might turn out 
that allowing the GL hub to suspend while keeping the DWC2 root hub 
active will make a difference.

(The reason for doing this on the PC as well as on the Odroid is to make 
sure that the sequence of USB requests sent to the hub and responses 
received from it is exactly the same in both cases.)

Alan Stern

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
