Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF32DC11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 15:52:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF6561D72
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 15:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FF6561D72
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sAz2/KR+Xbs04qJBrmFWdx5VnuAKJORkwq+x02nJFI=; b=kaENOp0R7ctoAO
	6050CguMXciErs8GBGYt7buLiMyTpf3/6XldOhZjIWSOxVnWhTnD+vyCq6J5zkh2mOIqMTwQrrs41
	ik5qXvbVF7ZNZLT/93hS5sPfxDi8DMkL4h68OyroPUwHOu9BRuCeFasPrm2YFADKflu9p9vQ5UWzQ
	Q6mHhKCnZclmmE3eeu7N/CL87lEe3fPwsFcek6bKImmhcqGZ/lJjwT5p10OrgGSbIhRW1SIm14AkQ
	/J8LPQsdaHplWuxaZDz1Z5/3YUIWgn5hB9wxUUM7O/SYa0QW67cxRIKXS98KAGqeFFz5dP72WNRz8
	l5MPQslaTHlgfWfcj1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyG1v-00BWsT-7i; Tue, 29 Jun 2021 15:52:07 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyG1s-00BWrU-9f
 for linux-amlogic@lists.infradead.org; Tue, 29 Jun 2021 15:52:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id o11so24018612ejd.4
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Jun 2021 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xM/tkT/GPS6chgDovlrJLUCLh8SRJ9QQOLwPJZFx9ds=;
 b=aOrABFKmmHNJL4ocxxHXSZ2DmAJjm5EzlKBMVljZVraw3gwq//06mHHOfx0PzCQo3h
 yx230bOLGgQNWtxiRydz9c1Th8aYWsJODZDIkl3uFgjn/EBMcYPo+OLO75ubZO5Et9Db
 KVDNdYEFPoOOtlZApfsP/PNGcOVRamWbYgfD/xQ7wOLzi2jsRHK0HWkkWOAYA/Xy8J3O
 LjFiRjZK4dwHVYK86tTAJOta1+Ssl9yw+SD02eAQOIfw2cRAnxgoc7D1NxDsjnQurI1g
 284vJXgunRb8j12q9/11Vurn+kvKbWPDm4qPBuW4n2+2Dr6RoXPvxbPW+QwO5qiAPok6
 u4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xM/tkT/GPS6chgDovlrJLUCLh8SRJ9QQOLwPJZFx9ds=;
 b=IQCbG3HfcIdro7zEkq7gWZAhfRyIz8qp4ZElPg9YeKCKvBCc6M5KlabGlxlg9mcNP9
 hrXJQxsOpaalCeMO2otV5Ww3HlciZy3OwlS7z6VQLJabIKaLfFnz8h/YfhQNmwKgBTMx
 sFtqj5bJePTIP7+luIOuzXPRvPWOjV2J82HTEkIgKOAJnMMjZ8RBlbfNCmOFA0zA8MJD
 /N8VN0qbUjNbe4j5ccq3u32GmitkCE4b9kgm6YFCZFQscMxxnjfDFy1l1YXI1LMp3PYP
 Z2d/EqVCG2+ye2GwVdUxbwoDs7Fu0P8h6HejJJMtuFSAj+ESRugGxTuxsPRjValWYSVM
 YfEw==
X-Gm-Message-State: AOAM5301mCvlTHYAZTFyjmY1jb+bhP5gVj4L+PCIvEONwSE4AoVxClU6
 qyz/weFBAxLzU4NjoySJZkjwH5gKKovTF58mIl1zQTCJw/Q=
X-Google-Smtp-Source: ABdhPJxzsdqC2WrSFDo7TtSAAn2U0t5CNfpahdnc+eKlDtIrM0RzHnMAnB6InNbkuUUgdLkNUz9jiHe+iT6Jddjky6E=
X-Received: by 2002:a17:906:39c3:: with SMTP id
 i3mr15721290eje.527.1624981922000; 
 Tue, 29 Jun 2021 08:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
In-Reply-To: <20210629150541.GB699290@rowland.harvard.edu>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 29 Jun 2021 17:51:51 +0200
Message-ID: <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Matt Corallo <oc2udbzfd@mattcorallo.com>, linux-usb@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux.amoon@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_085204_404306_1C0A6C8A 
X-CRM114-Status: GOOD (  29.64  )
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

Hi Alan,

Your help here is very much appreciated!

On Tue, Jun 29, 2021 at 5:05 PM Alan Stern <stern@rowland.harvard.edu> wrote:
[...]
> > The attached mon1.txt is the output I get
>
> Did you remove something from the beginning of this trace?  It starts
> with what appears to be the tail end of a resume sequence for the
> on-board Genesys Logic hub.  If you didn't remove anything then
> something is pretty wrong because the hub was apparently only
> partially suspended.
I have not removed anything from the output (at least not on purpose).
To verify I just re-tried and got a similar result

> Anyway, the trace says that when the lsusb command ran, the hub woke up
> and didn't see any connections on any of its ports.  This could be
> caused by a bug in the hub itself, a bug in the way the system handles
> the hub, or maybe a bug in the way it handles a PHY or other component
> external to the hub.
This reminds me of commit cc10ce0c51b13d ("usb: dwc2: disable
power_down on Amlogic devices") [0]
I checked and the code for this commit is still in mainline (so it was
not reverted - either on purpose or by accident).

[...]
> > In case it's relevant for your further analysis:
> > - Odroid-C1+ and Odroid-C2 both use the USB PHY driver from
> > drivers/phy/amlogic/phy-meson8b-usb2.c
> > - Odroid-C1+ and Odroid-C2 both use use the dwc2 driver (running in
> > host-only mode in this scenario. there's a second OTG capable dwc2
> > controller which is currently disabled in mainline Linux on both
> > devices)
> > - Odroid-C1+ and Odroid-C2 have a soldered down 4-port Genesys Logic USB hub
> > - Odroid-C1+ does not use any GPIO to control VBUS on usb1
>
> Since the problem may be related to runtime power management, you
> should try booting with the command line parameter
>
>         usbcore.autosuspend=-1
wow, this helps indeed
my steps are:
- power off my Odroid-C1+
- unplug all USB devices
- boot with usbcore.autosuspend=-1 in the kernel cmdline
- plugin my Corsair Voyager USB 3.0 flash drive (which was only
detected before if an additional USB 2.0 flash drive was plugged in
during boot)
-> without any lsusb magic the device was immediately recognized

> to disable default USB runtime suspends.  Also, check the contents of
> /sys/bus/usb/devices/1-2/power/autosuspend to make sure that runtime
> suspend really is disabled.  Does that make the problem go away?
with usbcore.autosuspend=-1 (after plugging in my Corsair Voyager):
# grep "" /sys/bus/usb/devices/*/power/autosuspend
/sys/bus/usb/devices/1-1.1/power/autosuspend:-1
/sys/bus/usb/devices/1-1/power/autosuspend:-1
/sys/bus/usb/devices/usb1/power/autosuspend:-1

after rebooting without usbcore.autosuspend=-1 (and no USB device
plugged in during boot):
# grep "" /sys/bus/usb/devices/*/power/autosuspend
/sys/bus/usb/devices/1-1/power/autosuspend:0
/sys/bus/usb/devices/usb1/power/autosuspend:0

I think the next step is narrowing down which component is causing this issue.

Interestingly my PC (running 5.12.13-arch1-2) also has two Genesys
Logic USB hubs with the same USB vendor and device IDs as my
Odroid-C1+: 05e3:0610.
These hubs are connected to my AMD Ryzen 5000 CPU or the B550 chipset:
usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
(xhci-hcd 0000:02:00.0) hub
 1-3               05e3:0610 09 1IF  [USB 2.10,   480 Mbps, 100mA]
(GenesysLogic USB2.0 Hub) hub
[...]
 1-7               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
(Genesys Logic, Inc. Hub) hub

So far I have not observed any problems on my PC.

This is the lsusb.py output on my Odroid-C1+:
usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
(Linux 5.13.0-02058-g8452e2c291aa-dirty dwc2_hsotg DWC OTG Controller
c90c0000.usb) hub
 1-1               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
(Genesys Logic, Inc. Hub) hub


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/dwc2/params.c?id=cc10ce0c51b13d1566d0ec1dcb472fb86330b391

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
