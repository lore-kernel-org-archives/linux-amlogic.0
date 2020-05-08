Return-Path: <SRS0=FMw+=6W=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0067BC47247
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 May 2020 03:53:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0E942192A
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 May 2020 03:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O1dodLcT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ws3HSrFp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0E942192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77RUGv+vGydJOpy4Osw2rcWLWq+aXFEbTjM4gFcSt/Q=; b=O1dodLcT3RvG+B
	tOl6gxWa3Y3nOQFiIY8P5b2WBMoSPs1zi8NjwSxz0GNdjz7q8xNadav5rZFoVXUcIlh7JO//E776G
	iv/jhPtMaHFHSVUknsBLnDnxHmsV8jJRvxzR9qNnt0954QDZnqxEWo8I151+tv69RlilgC4MK9luN
	QFwiB6mDVq5hulHFcuaUaezoXGWnLKb0WwX3hbxx/zME2yf8HKFWiSCndh3b9x6SgVzV2k6rzj+3S
	vJuunHICv2nEBVdIuHODi/A8dXqSgp6CTn+AxM0aSfCU45rqEvAbrkg2GTeW5f1H5ktsWzfuA6Awy
	WBnCxYR98wT4+TRh8uFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWu4K-0000RN-8h; Fri, 08 May 2020 03:53:00 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWu4H-0000QJ-BV
 for linux-amlogic@lists.infradead.org; Fri, 08 May 2020 03:52:59 +0000
Received: by mail-vs1-xe42.google.com with SMTP id m24so272513vsq.10
 for <linux-amlogic@lists.infradead.org>; Thu, 07 May 2020 20:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AofEIL6YwXkUVr1SNl6pGav5cBT+5klZGSSb4tIGh2s=;
 b=Ws3HSrFplgBdKEF0d6Ef/CDW5EwS0mXz/l1DIcB7Yh88VTMzo5MJ1/iiMYqJgvjIps
 jZg+hxl63XPpkntjE6T09riZ2WW1K61v5WIqxg3xsIhYwQxmE9xabjYObXdDyEBG0BhN
 8VAe1as355JZIKEi5T6z7jcGg7UCgngipOJMay+JgSZzBvvfdm/Y/HE6PGURFLejYcae
 Qtj8iGyb6pngMMlDtfEwrZ0/7V8aPDpDm/HfLafQRWixtrEN1tg7Y1xjHAfOIXjAfH69
 mCETeiAkyA5W7hcljWLKKIu1/rag+QSkJSJ+/oMXE9NhCaqWtxFh2DTEV+zJZmpiIx2X
 Jxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AofEIL6YwXkUVr1SNl6pGav5cBT+5klZGSSb4tIGh2s=;
 b=SQnUqFccY1KLCkTGw76oSX9I6trcJ1DEuLNYWSNMOYEvDC6aM6X1kcAF5YJCAI15Ys
 Wgy8XTr/nJlNP8EesSiuEXor1D6irj1eMZrAM47UHyUYPS+FrKibqimFDcJ8JeetuGQ0
 u46fT/cXJ7NS5fwrpMfsdxu7ygcwEDsMSGDnSK++sw+tzTSyzxlhKTqBF9E4QdTW3HI2
 kA+pG9c1iID8BMmLNGxoaxBaZpxyCYFNJzw0ly+H4doibDxk5B+lH0XNrGGevu8iv8FL
 eR+hxLJd4GChuEO4WFy1FHg3ybIsUYmYTVos/cgvWBTXzOVkA2FaPpmzwHj11GLKir0G
 LSwg==
X-Gm-Message-State: AGi0PuZlCk7EgVB839/LCPlAfMoAi76AT7F6elWj+fB74PNpgYDUfAxa
 bbyfJU/bFrcVmYn43PiewBpLvutCn/OE8oG8i0BjzhTT
X-Google-Smtp-Source: APiQypK0VwJrY4iB2MHXq8SKZlSKQAWMfhS/ZAicl7WYe0F28/ri1drVF8Qs2B+UBwYxgSQnt7BKpD8v0MZ88ZPq2H4=
X-Received: by 2002:a67:302:: with SMTP id 2mr347325vsd.165.1588909975527;
 Thu, 07 May 2020 20:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200503222805.2668941-1-martin.blumenstingl@googlemail.com>
 <CAPDyKFrY0ApUCNL4gVHRc2FRcYaS0PKr_P4a18RUZHxcVceVWg@mail.gmail.com>
 <CAFBinCAhLiunUvw+BAHnv3XVmmU=Wxs1i=WLAAFL5=Hn0RPOvQ@mail.gmail.com>
In-Reply-To: <CAFBinCAhLiunUvw+BAHnv3XVmmU=Wxs1i=WLAAFL5=Hn0RPOvQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 8 May 2020 05:52:18 +0200
Message-ID: <CAPDyKFqO8D-UUvq3Ebtnp73xfD_0kaWBq=75wvFL=4xbK5Zj-g@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdio: trigger a soft reset after a timeout
 or CRC error
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_205257_562489_37258C73 
X-CRM114-Status: GOOD (  21.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tobias Baumann <017623705678@o2online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 7 May 2020 at 23:14, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Ulf,
>
> On Thu, May 7, 2020 at 11:29 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Mon, 4 May 2020 at 00:28, Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > The vendor driver (from the 3.10 kernel) triggers a soft reset every
> > > time before starting a new command. While this fixes a problem where
> > > SDIO cards are not detected at all (because all commands simply
> > > timed out) this hurts SD card read performance a bit (in my tests
> > > between 10% to 20%).
> > >
> > > Trigger a soft reset after we got a CRC error or if the previous command
> > > timed out (just like the vendor driver from the same 3.10 kernel for the
> > > newer SDHC controller IP does). This fixes detection of SDIO cards and
> > > doesn't hurt SD card read performance at the same time.
> > >
> > > With this patch the initialization of an RTL8723BS SDIO card looks like
> > > this:
> > >   req done (CMD52): -110: 00000000 00000000 00000000 00000000
> > >   clock 400000Hz busmode 2 powermode 2 cs 1 Vdd 21 width 1 timing 0
> > >   starting CMD0 arg 00000000 flags 000000c0
> > >   req done (CMD0): 0: 00000000 00000000 00000000 00000000
> > >   clock 400000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 1 timing 0
> > >   starting CMD8 arg 000001aa flags 000002f5
> > >   req done (CMD8): -110: 00000000 00000000 00000000 00000000
> > >   starting CMD5 arg 00000000 flags 000002e1
> > >   req done (CMD5): 0: 90ff0000 00000000 00000000 00000000
> > >   starting CMD5 arg 00200000 flags 000002e1
> > >   req done (CMD5): 0: 90ff0000 00000000 00000000 00000000
> > >   starting CMD3 arg 00000000 flags 00000075
> > >   req done (CMD3): 0: 00010000 00000000 00000000 00000000
> > >   starting CMD7 arg 00010000 flags 00000015
> > >   req done (CMD7): 0: 00001e00 00000000 00000000 00000000
> > >   starting CMD52 arg 00000000 flags 00000195
> > >   req done (CMD52): 0: 00001032 00000000 00000000 00000000
> > >   [... more CMD52 omitted ...]
> > >   clock 400000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 1 timing 2
> > >   clock 50000000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 1 timing 2
> > >   starting CMD52 arg 00000e00 flags 00000195
> > >   req done (CMD52): 0: 00001000 00000000 00000000 00000000
> > >   starting CMD52 arg 80000e02 flags 00000195
> > >   req done (CMD52): 0: 00001002 00000000 00000000 00000000
> > >   clock 50000000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 4 timing 2
> > >   starting CMD52 arg 00020000 flags 00000195
> > >   req done (CMD52): 0: 00001007 00000000 00000000 00000000
> > >   [... more CMD52 omitted ...]
> > >   new high speed SDIO card at address 0001
> > >
> > > Fixes: ed80a13bb4c4c9 ("mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoCs")
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > ---
> > > Ulf, I consider this non-critical because as long as the meson-mx-sdhc
> > > driver is not merged we only have one MMC driver for these platforms.
> > > I don't know anybody to prefer SDIO wifi over SD card access, so this
> > > can go into -next (in my option at least).
> > >
> >
> > Alright, applied for next, thanks!
> thank you for taking this patch!
>
> I received a confirmation (off-list) saying that this patch works as it should.
> Tobias was not Cc'ed on the original mail so he gave me to permission
> (again, off-list - he's Cc'ed now) to add his:
> Tested-by: Tobias Baumann <017623705678@o2online.de>

I will add it next time I rebase my branch, probably on Monday, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
