Return-Path: <SRS0=4hYR=U2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15185C48BD6
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2019 10:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE5620828
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2019 10:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="slGyOmqu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbWlVs3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBE5620828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcFDnoIc2+hOzPsN2BmBSpWJ/HVch2+nbfztKTJUv00=; b=slGyOmqusLtvfs
	SYsLQI/NGqBbmkLIa/l1CvRFkjAoRNXcT3Gg96Ql9rW2YrS/VTOcFtTjvPVj6Kf+1PtFdvzj5kO7g
	v5Bi7/0GEDQkuQkFj3zOpC53SYJZM6M+goTkz5ogEW4PGmtl9kGbB6ARrInxeq4EHl6N6GFWE3rmy
	xMYT3lvNoVvRafYZHDzcrAKrBHhvbQpqsAf67AHtfUq/+UwVPtkpe63KAnMZH+FWLbkfNtgeeSgBn
	NE8BFzSthRXHRlN8pa/tKthgjlY19evvVErR8b9lvhW2JEqbQRDdkUUe4TfIAsN+zg6aYFDQbFFEb
	kBEvbn3EmdHL5dghZ0GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgRkl-0000Yi-0l; Thu, 27 Jun 2019 10:35:43 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgRki-0000YI-0I
 for linux-amlogic@lists.infradead.org; Thu, 27 Jun 2019 10:35:41 +0000
Received: by mail-io1-xd42.google.com with SMTP id h6so3652289ioh.3
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jun 2019 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tGaFBHWvHhWEXZWFh9n4GUcbkSKtg2DHj5Tkr/ZZaJE=;
 b=PbWlVs3g0y2niKqSt9UbUFH5rPBca0pk9isdJH5E0IhtOtNmLTc9NdsK6WMakGIKye
 PGYv4blvLnGGEn8Wb4sa3vcfwty2oc/6uO0guHMK6lrFPi74zM2r04HitqFJgFuwpCcB
 YO2jDbvUOVk0O29SBerK01EtQ90WXNvaX8n4yjKrqJuz0LUVPmUtOOG9S+uKmFNGduRr
 YZ+ke9wKqZziHRfIXMkjzbG+O770msfK9jQuHbfwpF1SsVzauO/lcMpey7kqXiS3ahC7
 PaHyrrvaxqWhKLEoxm+cfPY/ObQ3HmC417hY0S74n9I1AwuK4kAwIPcAZEkEoJTU/mG+
 4Z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tGaFBHWvHhWEXZWFh9n4GUcbkSKtg2DHj5Tkr/ZZaJE=;
 b=Uq1tLlwuxveEjyy+47HgH1DqeQ+FRM1zWXm9GSnQYbQ1EBa0yNZTYzS2XkVfq7Dpdy
 rsnvhfBWti7rYTXYADDAvR3ykD1Ed0vT+crWrdNc8MOmP0FcDt6QBZPd6NySwS0CbuFL
 L8Eao40/d8+MJ0g4q7WCKkAwNp7Ylwi1nKdglj8csNfZkAEfxUmVEgByFASl9JW14y8N
 bjEk44m6v+/iPqXFBsUoE4FjFL0H6vOW4VvBjATIRUZyIdb3f5akh4UP0f+QtQ5WOlWw
 Y9efIwwsVWONEiblXabooMA22UoOjJv2IrR6qyANuAYWgSC7nLtXM3oLBtQa0Rh4zTmb
 fyVg==
X-Gm-Message-State: APjAAAWHx10vqXMmDd6PgGmvXSDhQl3FdkD8v4KsbRAPIqzUUM4tlMWj
 o9KD6ZtJs8XQ9tB7O6J1Fj3t0GUWxMYV3YOvPJo=
X-Google-Smtp-Source: APXvYqztuUjVKhYxZeCShdjRyYym9lg8upkDjvNJhTumlnaHwMAcJmWOZHRcyc7ZdjAcGvKTHnNI2ZQX/ta38sXkWeQ=
X-Received: by 2002:a02:c90d:: with SMTP id t13mr3679253jao.62.1561631738450; 
 Thu, 27 Jun 2019 03:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <CANAwSgQqJn8PBUJGWk2ew1RT1Df_-uyHoA5ECovTG632EnS=rQ@mail.gmail.com>
 <99a6ca7a-3100-975f-c7a6-aaec04199719@baylibre.com>
 <CANAwSgScwahG8u-C6kRktDShezAS9D0o42HUkPnScRxhJEAAbA@mail.gmail.com>
 <CANAwSgQOaPmuYC6HQ-mPpCn_h98nvrX7_F7zy790NPdh0U=Fsg@mail.gmail.com>
 <7hpnn0oxqe.fsf@baylibre.com>
In-Reply-To: <7hpnn0oxqe.fsf@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 27 Jun 2019 16:05:26 +0530
Message-ID: <CANAwSgQXJE=aq0bPdmgaKfnjA1oBZisLgpYGWjqeM=Zqsyi0Xw@mail.gmail.com>
Subject: Re: Odroid-N2 on archlinux cannot boot on using linux-next on sd_card
 / emmc
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_033540_074138_43C0C741 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Thu, 27 Jun 2019 at 02:44, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > Hi Neil,
> >
> > On Tue, 25 Jun 2019 at 14:17, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi Niel,
> >>
> >> On Tue, 25 Jun 2019 at 13:17, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >> >
> >> > Hi Anand,
> >> >
> >> > On 25/06/2019 09:43, Anand Moon wrote:
> >> > > Hi Niel,
> >> > >
> >> > > I am not able to boot using sdcard / emmc module with
> >> > > *linux-next-20190624* kernel on my Odroid-N2
> >> > > when I want to boot using archlinux distro.
> >> >
> >> > Yes it's expected, the missing clocks were only merged today (cf
> >> > [GIT PULL] clk: meson: update for v5.3) and will appear in the next linux-next.
> >> >
> >> > Neil
> >> >
> >>
> >> Thanks for this input, I will check this with the latest linux-next.
> >> And then check my changes are valid.
> >>
> >
> > I think the clk change have being merged into linux-next-20190626
> > but still I am not able to get this pass the detect of *sd_card* or *eMMC*
> >
> > Here are the log: https://pastebin.com/Sw0wA4nM
> >
> > Any input for me to look into this?
>
> Probably more FYI than useful input, but at least in kernelCI, odroid-n2
> started booting succesffuly as of today next-20190626:
>
>   https://kernelci.org/boot/meson-g12b-odroid-n2/
>
> Kevin

Thanks for your input, I am able to boot my Odroid-N2 using eMMC.
But still I am struggling to get this booted using microSD card.

Right now it not stable, cannot get any thing to work or test

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
