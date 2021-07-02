Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E1FC07E95
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 19:33:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627AB613E1
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 19:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 627AB613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HogeQauGoc1Mw9ZuxKcQR+DMiAhCU+UrwSaJJj9kcs=; b=sBbrzoJj+/uNl+
	jan6M6178Tp3uaL+c/lrNBWEUiqR6Xn9j9dMaITG0SDYxoLNUwVCrtZOrzbowKYsiclRpJI0xdOEY
	ML2yCX04NuHd4fL5OtmY50qzu0W15CwwJQqAvFiN9ceU/FQhHaxe07YH1mOgl5oKI6R1gWfftL5p3
	ixjqTn91C3V4Fvu5F57WxvRdmIgEdI5pBKip84SfZmmrfVFRjg+IiBqKSvA5HyMNpNPYE0ISR66Wq
	avI1O2LvnKojnu8jr50NoBrZ+OM/+rGWfK7N/4aR1gm0QgKE3xh7Ju7BsJJ3SbEk4C/kPRVEtnueJ
	O3hq+e+YbITAekSBtJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzOv9-003t4S-VE; Fri, 02 Jul 2021 19:33:51 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzOv7-003t3d-8e
 for linux-amlogic@lists.infradead.org; Fri, 02 Jul 2021 19:33:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id m1so14635361edq.8
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Jul 2021 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GAippCKrMb1Zcv9GDuupcKoLDEyKodAAtcqMwLW9uGk=;
 b=RqwplAzqrz19C9fLsFGpKT8JEgnG7WAuyVurOAxZZhDDidxFRQ5cHQQXZEbj7BifjA
 1aFVTdClwewbVINOswVfiONwH4vRpORVYw1FKgFY5V9syKMi9qU6NTumdYm2fNapWX1N
 PU4bc7W2tA38vlyNvVJ2VleY3eHFudY4cmHov8xNIMY2h4w5GhTaz9lNdHO4y2MLljAv
 Il1TxPLwjsElcIelrfLWuVjE4wlUmV/Mg3tdPwyLyBoivIXGFO6L0UhRaQ7x8w5ZxGyt
 iDRADv8F1ChODzON+HZybEwh3rjkjFLTUgj4Ypdy93O+DQKlaaSwVl6jbVQxH5DI3JOY
 ZkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GAippCKrMb1Zcv9GDuupcKoLDEyKodAAtcqMwLW9uGk=;
 b=qKw0s0/KbIYr3qogbY1Z4tu0imnDzpPcTjXE0R3lNSvTdWNoilgj0vso2sDh4ezn6v
 PtYSrxyea/ZYJlCRqeoJlkSMRZ/+dbNd9fDhkuhfDKGIKeUJ/u5crT8QKyeH/Tf5Km3h
 SbHelS2l1SpmuYP9kaxJoaPjPGEJx54kThUOxtzunMojjgqbo6QuN74aJdhaEl7iGzC8
 ZPcwTYG6f3kLev3KLBgoOq/0YogYNGbks3XwkARBQlRXDqqDhn62oVUkn4Jjc/CKll2g
 7Z0YMYFpyroIs3sHsUNnqqQ1k0jjq/CDfBSC5EqG+WKXvWWjYx/DVMKwoKomUV8e+opZ
 cxCA==
X-Gm-Message-State: AOAM531b3Rjo8ML2doG17auLlfHR5rUiTlboU3ON73+CqmO/qmXVqof2
 LhIfL5vYEjDtTBQi1mLbgMCSUsgnvMgEP748u98=
X-Google-Smtp-Source: ABdhPJyex567wCzsmEkjroEDmUk8nR8+4zi+GGJU3ihof7nflp5/++YuxyTht6hMh3a2XekCUZYyOU6Ik1tIdMc/NaM=
X-Received: by 2002:aa7:d74b:: with SMTP id a11mr1421372eds.40.1625254426936; 
 Fri, 02 Jul 2021 12:33:46 -0700 (PDT)
MIME-Version: 1.0
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
 <20210630003556.GA718579@rowland.harvard.edu>
 <CANAwSgQadG+A2Tg2Ok5-Nw4i1a2tenABeyQnyTjzJKGHHw+6aA@mail.gmail.com>
 <CAFBinCC0nfrnQGmrXJ4FDTuy3RGX_FC8egjVaxhKaOSi9q+xzA@mail.gmail.com>
 <CANAwSgRPvTyMaQHWFeXcS-r5jdigSbcP0QvaTyJ1GFfUyPpqAg@mail.gmail.com>
In-Reply-To: <CANAwSgRPvTyMaQHWFeXcS-r5jdigSbcP0QvaTyJ1GFfUyPpqAg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 2 Jul 2021 21:33:36 +0200
Message-ID: <CAFBinCCFhK9Nx9ub5h3JctfXCnbrwL7XPV5dvPXWcvWqupnHkA@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To: Anand Moon <linux.amoon@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Minas Harutyunyan <hminas@synopsys.com>, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_123349_365179_566755E3 
X-CRM114-Status: GOOD (  17.36  )
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

Hi Anand,

On Fri, Jul 2, 2021 at 9:12 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > I am attaching my usbmon output on Odroid C2.
> > Can you please specifically state the testing steps you have used to
> > obtain that output?
>
> I followed the kernel documentation to get the output
> [0] https://www.kernel.org/doc/html/v5.10/usb/usbmon.html
Alan has previously provided the following command to get the usbmon output:
  cat /sys/kernel/debug/usb/usbmon/0u >mon1.txt

The output of that command depends on various factors:
- which USB devices were plugged in during boot
- which USB devices are plugged in when running "lsusb -vv"
- whether you are using the kernel cmdline option usbcore.autosuspend=-1

For the first two factors the "USB device" can be one of:
- no USB device plugged in at all
- one USB device which is not detected when running "lsusb -vv" (we're
calling this group of devices "first group", an example is my Corsair
Voyager USB 3.0 flash drive)
- one USB device which is being detected when running "lsusb -vv" and
also causing all other devices to be detected (we're calling this
group of devices "second group", an example is a cheap 1GB USB 2.0
flash drive that I have)

As you can see there's lots of combinations possible.
That's why it's important that you mention the exact steps to generate
the usbmon output.

If you're interested you can look at one of my earlier emails [0] (not
sure if you were Cc'ed then) where I was running the cat command as
suggested by Alan three times (each time plugging in different devices
at different times) and got three different outputs.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
