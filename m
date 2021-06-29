Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4C4C11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 16:30:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB41B61D7A
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 16:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB41B61D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siwCBgZ7LTTcXGTBY/9l/aYh90rPZaPf9QWA/2DMoYQ=; b=JyAMSoda1k10ia
	zUj8LgJCkWNsfZ5htm64ZdpExmA1xUmxmADjwu0vMmV43Yb9kT0LupA5bC3fYOWT5KySBjFJxRCBj
	pEHhEqidmha4oHNK3HohLqNzN/hB/ZYUAhiDi/INMINtoqzsYBKKyVs/AJ5s5vYcZXlr8eAlUA1H7
	yBaLA/z/4cBUAvpxMjteZDEIxAlK5c2ewaG6eUSQbJ0Uk1MKotuLSMusUbzWk0InAbzVAhL7BunCn
	ERwrqUcefY6TH+JjQ1AaJC/nwhW6XlwUdY+GzsrETqAoxeTk9yZVNcE58hbZNvvCkPy7tv3UXBscF
	COZdI5eY6tQ4WXAvGdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyGcz-00Bbjt-FC; Tue, 29 Jun 2021 16:30:25 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyGcw-00Bbiw-Go
 for linux-amlogic@lists.infradead.org; Tue, 29 Jun 2021 16:30:23 +0000
Received: by mail-ed1-x52c.google.com with SMTP id l24so3983819edr.11
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Jun 2021 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OHe0eFcmYQ5PzF6+xoOarEjDNa4SGeNkpxUxScaUgS4=;
 b=t3eoRPSOLgu5xXYDncaiPemns4rJGTQGB06bA4RRSGxs596Xlk54/O6KcPDd9+zl6x
 Umw6zd8Njas5JRZ2rsfunXn0kGMlDuppXB/VCYQFdlWcFy3Do1FbWo8MYaohLOpEY7/E
 tlyhNDsiFrOUGL1NhnRoSLB/425u1B/3Ek4ov4R/WUjgmYzRdJfvR0f2mt6AaEE9s88j
 qZIlNfcm+65jWyZTBIiNsQBOs0meLkE5yeLhIy/HvvaLCzaGeq5e1MEl3762PpZnbgcT
 zsQUEXckTTAZWN4R+jgryen63q5c5WpzKIkUcE2JA4MQZacSvNByPvI7YibYfxxazryG
 5oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OHe0eFcmYQ5PzF6+xoOarEjDNa4SGeNkpxUxScaUgS4=;
 b=P3jkIazUBdD8bzgF7dQpI0i7p7t2AIkhWLwJtYowoQ3e/i3VUE9Fbh64YeukKV3Fxb
 Hm1jYjlttGgLgvRJBvafB4xHZQ/IaIz/rdqOwBGCj4ev9esYtmTyLihTZHcjuc4GsPNm
 0to8PIRglGpMha0+XsyaTGcSftzoSVQSN8UFGuVLrnfsbKp8NSkXdJTuwodA1cA4Fr5H
 4YyLtj84dhP+id5bZpT2VkTg+Fwva34owhNaGuniWY4VY/5YDwrFLE0P+QUAUUrC4T5y
 Dm/zkdHsAFaupU+sA/jb9QQG3ZT4YV3qfTvid2IuquNVoPx/QDCYMSG0W3eArBtT1NS+
 PWFA==
X-Gm-Message-State: AOAM5309U5fjSZN+PqtIfaqiiv0VRfARGs5lyv6sDB/gz3QYWNSkO8tW
 f0Bi1Fhl8yjSwC3+X3zsyzniB9x1BqH9xoMMzzM=
X-Google-Smtp-Source: ABdhPJyGFyDiZmBAnJdyWdrmQ6lVbMTFrADDLhgM5U20QbJcoJn59GmHrLHtrzF5WC9FPb9jR6Ie7F2QZd0lG1WEQrY=
X-Received: by 2002:a50:ec08:: with SMTP id g8mr16012397edr.98.1624984219164; 
 Tue, 29 Jun 2021 09:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
 <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu>
In-Reply-To: <20210629161807.GB703497@rowland.harvard.edu>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 29 Jun 2021 18:30:08 +0200
Message-ID: <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To: Alan Stern <stern@rowland.harvard.edu>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Matt Corallo <oc2udbzfd@mattcorallo.com>, linux-usb@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux.amoon@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_093022_579939_1DD23BD7 
X-CRM114-Status: GOOD (  26.57  )
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

On Tue, Jun 29, 2021 at 6:18 PM Alan Stern <stern@rowland.harvard.edu> wrote:
[...]
> > >         usbcore.autosuspend=-1
> > wow, this helps indeed
> > my steps are:
> > - power off my Odroid-C1+
> > - unplug all USB devices
> > - boot with usbcore.autosuspend=-1 in the kernel cmdline
> > - plugin my Corsair Voyager USB 3.0 flash drive (which was only
> > detected before if an additional USB 2.0 flash drive was plugged in
> > during boot)
> > -> without any lsusb magic the device was immediately recognized
>
> That does show pretty convincingly that runtime suspend is causing the
> problem.  But I still have no idea why the problem affects some devices
> and not others.  It's a mystery.
Maybe because there's two related problems (I am guessing here):
The first issue is that USB hotplug is not working at all on my
Odroid-C1+ (which means: dwc2 + GL852G USB hub).
The second issue is that the workaround we had before (running lsusb
-vv to make "hot plugged" devices show up) is not working for some USB
devices.

It seems that using a different workaround (usbcore.autosuspend=-1)
makes *all* USB devices show up - even without any "lsusb -vv" call.
So I think we should focus on the first issue as it may also fix the
other problem as well.

[...]
> > after rebooting without usbcore.autosuspend=-1 (and no USB device
> > plugged in during boot):
> > # grep "" /sys/bus/usb/devices/*/power/autosuspend
> > /sys/bus/usb/devices/1-1/power/autosuspend:0
> > /sys/bus/usb/devices/usb1/power/autosuspend:0
> >
> > I think the next step is narrowing down which component is causing this issue.
>
> Maybe Minas can help.  He knows a lot more about dwc2 than I do (which
> is practically nothing).
I'll wait for Minas then

> > Interestingly my PC (running 5.12.13-arch1-2) also has two Genesys
> > Logic USB hubs with the same USB vendor and device IDs as my
> > Odroid-C1+: 05e3:0610.
> > These hubs are connected to my AMD Ryzen 5000 CPU or the B550 chipset:
> > usb1              1d6b:0002 09 1IF  [USB 2.00,   480 Mbps,   0mA]
> > (xhci-hcd 0000:02:00.0) hub
> >  1-3               05e3:0610 09 1IF  [USB 2.10,   480 Mbps, 100mA]
> > (GenesysLogic USB2.0 Hub) hub
> > [...]
> >  1-7               05e3:0610 09 1IF  [USB 2.00,   480 Mbps, 100mA]
> > (Genesys Logic, Inc. Hub) hub
> >
> > So far I have not observed any problems on my PC.
>
> Presumably because it uses xHCI rather than dwc2.
indeed. I think it's good to know that it's not an issue affecting all
Genesys Logic USB 2.0 hubs.
As you mentioned above it's most likely that dwc2 is the culprit here.
Or it might be some interoperability issue between dwc2 and GL852G


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
