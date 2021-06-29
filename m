Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE46C11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 15:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCBBF61D5E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 15:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCBBF61D5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPGfG798BexaUpxO/TCnvyum5CC6elA1fFCxFaoya/M=; b=rxOXjJPM3dRrrz
	uOxKicLs1c3jMjCfG1Wt3ev5q2JYMNbqahhCh65SV8JMCKFIYi1OBa7eSB+3LJZpr+resuYjCjhXI
	KdK7ZPcgUUlDefT8W5XO9tHiDnojIWW/n6cGxpDBY3hk4Uu8finy2OyrRrtWKnOIVIozGn0h4Mfnx
	+tFs/3OJpCd9cKH097tlgOwKS6h4qRxtoU6CNq0+ALsPLNIYSONgvZ+aVnXj78/BjYxT97OMIlOEw
	FNBqWIJeOgTz1fF9VNA8jwTSmZ05y/WcaMKwsQcFXItEHuX9c94i8NZ5hL2sebKTG5MIl8VK8fIoi
	ihCmZkogdM0caaHE97+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyFJ6-00BPE4-2I; Tue, 29 Jun 2021 15:05:48 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyFJ3-00BPDG-Gn
 for linux-amlogic@lists.infradead.org; Tue, 29 Jun 2021 15:05:47 +0000
Received: (qmail 701135 invoked by uid 1000); 29 Jun 2021 11:05:41 -0400
Date: Tue, 29 Jun 2021 11:05:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Matt Corallo <oc2udbzfd@mattcorallo.com>, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux.amoon@gmail.com
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
Message-ID: <20210629150541.GB699290@rowland.harvard.edu>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_080545_754036_59032F86 
X-CRM114-Status: GOOD (  34.67  )
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

On Mon, Jun 28, 2021 at 08:37:38PM +0200, Martin Blumenstingl wrote:
> Hi Alan,
> 
> I am also interested in finding a fix for this issue just like Matt.
> Also I think Anand is interested in this, so +Cc Anand.
> 
> On Mon, Jun 28, 2021 at 4:24 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> [...]
> > Okay.  You can try collecting some usbmon traces to see what's going on.
> >
> > First test: Boot with nothing plugged in, start a usbmon trace for bus 0
> > (cat /sys/kernel/debug/usb/usbmon/0u >mon1.txt), plug in a first-group
> > device, run lsusb -v to trigger enumeration, and then kill the "cat"
> > process.
> My first-group device is a Corsair Voyager USB 3.0 flash drive
> To be precise, "lsusb -v" doesn't make new devices show up for me, so
> I am using "lsusb -vv". I am just pointing this out so we're both on
> the same page here
> 
> The attached mon1.txt is the output I get

Did you remove something from the beginning of this trace?  It starts
with what appears to be the tail end of a resume sequence for the
on-board Genesys Logic hub.  If you didn't remove anything then
something is pretty wrong because the hub was apparently only
partially suspended.

Anyway, the trace says that when the lsusb command ran, the hub woke up 
and didn't see any connections on any of its ports.  This could be 
caused by a bug in the hub itself, a bug in the way the system handles 
the hub, or maybe a bug in the way it handles a PHY or other component 
external to the hub.

> > Second test: Same as the first except that you boot with a second-group
> > device already plugged in.
> mon2.txt is the result of:
> - power off my board (Odroid-C1+)
> - plug in a second-group device (cheap 1GB USB 2.0 flash drive)
> - boot Linux (which detects the USB 2.0 flash drive during boot)
> - cat usbmon ...
> - plug in my first-group Corsair Voyager
> - (this was now automatically detected, even without running lsusb)

This trace shows that the hub was not suspended and it did see the new 
connection.

> > The differences between the two traces may indicate where the problem
> > is.
> My interpretation of mon1.txt is that there's nothing seen on the bus.
> I don't see many similarities with the other outputs so I am hoping
> that you have some hint for me
> 
> In case it's relevant for your further analysis:
> - Odroid-C1+ and Odroid-C2 both use the USB PHY driver from
> drivers/phy/amlogic/phy-meson8b-usb2.c
> - Odroid-C1+ and Odroid-C2 both use use the dwc2 driver (running in
> host-only mode in this scenario. there's a second OTG capable dwc2
> controller which is currently disabled in mainline Linux on both
> devices)
> - Odroid-C1+ and Odroid-C2 have a soldered down 4-port Genesys Logic USB hub
> - Odroid-C1+ does not use any GPIO to control VBUS on usb1

Since the problem may be related to runtime power management, you
should try booting with the command line parameter

	usbcore.autosuspend=-1

to disable default USB runtime suspends.  Also, check the contents of
/sys/bus/usb/devices/1-2/power/autosuspend to make sure that runtime
suspend really is disabled.  Does that make the problem go away?

Alan Stern

> Maybe Matt can also share the usbmon output from his Odroid-C2 (a
> device I don't have) to confirm that it's the same issue (and we're
> not hunting two different problems).
> 
> 
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
