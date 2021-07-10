Return-Path: <SRS0=UniE=MC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA714C07E95
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jul 2021 17:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D62061205
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jul 2021 17:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D62061205
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GyVTDY5cA5AqjkLy8AzSclOBtIbBy0Ia74KCadFh1o=; b=m6Cj1WQ/A06ihc
	BQ/RkJRJSbbVuApxQsfWon9Aqax1+OPERTz2Fq5Kz+4/Pqonihb2jfVT8nK2L1ChMUCzJInVcCyMu
	XajXdxNP1WpkLjkpfOxmRJoTiWXLYiI0goq3NS5dlqi7xW8D2Mm09f9SVcIqAQ4l8VwNkGNa8jn6E
	oP31/d+tozP/fkVlW4UsNbyp6+CwcIiIDRzcoJyhz9IX5DnPbCjmM8XenSP589jtad+TQB43CAn/f
	fbcEEZMGDB7111z156DLXP2pIP5qgnz2ae/c99S6hrNzPLuLCRAq4gtu2eJACK7uQ3ObJtsTTobkd
	q9ZcJVWClCRX4RSd7u1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2GSX-003vzM-Ec; Sat, 10 Jul 2021 17:08:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2GSV-003vyW-El
 for linux-amlogic@lists.infradead.org; Sat, 10 Jul 2021 17:08:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id nd37so23095809ejc.3
 for <linux-amlogic@lists.infradead.org>; Sat, 10 Jul 2021 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8sBYTJuQ75JTZT4uHwVhodoPEm3mG4wWISso+dIOLYk=;
 b=RpcCUwmSSb7NNcjart/+Nz5p0W6e9bl/Qtqpi4UskBwAhgw00UAmDHiS5Ul0CCe5t9
 9iQOJv0+7mcoTcW01YjsMoxvNqUX5QFN8yCYXidvw4OlESnSHomPPRFlyjngAgqC51Qh
 VWHQoad4/dcGmysSeZA6s9uCFHKx79fFM8bJzFtfLwIDJ6zcBP4uMBxbb1vH6xiU6WnP
 tf7Eo83rCJZMMLaIlpModMik0J/mPeANUqd4rAnZoJl+mIleKsAfFZ6A7Wdy1W/GxcOZ
 VWA0XJEy6MC9zltKUJGKZgU4NAtyi5VhZpmfn+fvf4IaSISjVcrAXDtgJqGduqWUlpsR
 nuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8sBYTJuQ75JTZT4uHwVhodoPEm3mG4wWISso+dIOLYk=;
 b=eLgj4iHc45XMikakXHdY/LbVEdQBbAjG3ynHwW4zix0fcJ6gDxUGIKhdbG4LzxSgeK
 huZL9vd9Go5VxMDzhlzxLaYicpzUPoTqodXNP5XDCGzx1+E1uArtnEcs5wA3eSgLfHGy
 owmqU9GLcSf8rjJ0MZOQ4wZ2r0zxphE7VOsHfSHSa4UY0JO1QUT6oTHqOef/lcKd06f3
 GJC1YBw+fShZHk3Da+lfOPWOwabcpeUPsFBMUv7/8ilplqgckyl3b/8au3pNXrbO9YCC
 uZEOg4rpen3eHkOYE0Q6+CQMWhfgwsherVdBHCQcore95MNDS4N14WsdkS/tMJE5YlQf
 BewQ==
X-Gm-Message-State: AOAM533z0OahStNKMv8Y1xC7JHV6JBQh4IA2R5cK9jgqPflexFiNnhjD
 fhChdZalmD4eFdMte1bXbZP/BLAuNoJXfBkvy64=
X-Google-Smtp-Source: ABdhPJzDljglsF2bwqagKTnNx1jViPlKg5RdyLJejdd8xFuatysTEXQgE+C52tds4bMMu8jatSndxbF8d+knW/byZVI=
X-Received: by 2002:a17:906:2306:: with SMTP id
 l6mr43270855eja.362.1625936885095; 
 Sat, 10 Jul 2021 10:08:05 -0700 (PDT)
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
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
In-Reply-To: <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Jul 2021 19:07:54 +0200
Message-ID: <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To: Minas Harutyunyan <hminas@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux.amoon@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_100807_570699_7D5B7CAA 
X-CRM114-Status: GOOD (  27.71  )
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

Hi Minas,

On Thu, Jul 1, 2021 at 1:09 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Minas,
>
> On Tue, Jun 29, 2021 at 6:30 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Alan,
> >
> > On Tue, Jun 29, 2021 at 6:18 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > [...]
> > > > >         usbcore.autosuspend=-1
> > > > wow, this helps indeed
> > > > my steps are:
> > > > - power off my Odroid-C1+
> > > > - unplug all USB devices
> > > > - boot with usbcore.autosuspend=-1 in the kernel cmdline
> > > > - plugin my Corsair Voyager USB 3.0 flash drive (which was only
> > > > detected before if an additional USB 2.0 flash drive was plugged in
> > > > during boot)
> > > > -> without any lsusb magic the device was immediately recognized
> > >
> > > That does show pretty convincingly that runtime suspend is causing the
> > > problem.  But I still have no idea why the problem affects some devices
> > > and not others.  It's a mystery.
> > Maybe because there's two related problems (I am guessing here):
> > The first issue is that USB hotplug is not working at all on my
> > Odroid-C1+ (which means: dwc2 + GL852G USB hub).
> > The second issue is that the workaround we had before (running lsusb
> > -vv to make "hot plugged" devices show up) is not working for some USB
> > devices.
> >
> > It seems that using a different workaround (usbcore.autosuspend=-1)
> > makes *all* USB devices show up - even without any "lsusb -vv" call.
> > So I think we should focus on the first issue as it may also fix the
> > other problem as well.
> above paragraph sums up the issues which Matt and I are seeing (on
> Odroid-C1+ and Odroid-C2) in case you didn't follow the full email
> thread
It's been a week since I sent my last mail
In case you are taking some days off: enjoy that time!
Please let us know if you have any questions about this as we're
looking forward to some hints on how to debug (and of course fix!)
this.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
