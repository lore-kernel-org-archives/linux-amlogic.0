Return-Path: <SRS0=MUs3=F2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF52C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Dec 2020 17:29:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A63C323133
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Dec 2020 17:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A63C323133
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wO3/XjPl8jW14zdtagglQWG+vEGNPT29F5ZRQ1tsnj4=; b=XiEsvRLTRbcaYtAb1mzS/8wya
	TuYlKTfWtC3sP8WxeSwjnD9FOk4NWT7EE52KsQKLzpPk9PHFouT2YL4zH7tyYcxjk3YAsyTiSP6WX
	DrMtpOMGsii1MoudJTyxq9lZZR0iYdI/STFFxrt7xo2Vs40Udd4AwXc/RTqMZeUk4/vbz6ch06sVV
	6MyCUrQc2rMk4vFkJrbmJB3/1ZpMgwc5QI9cNKrAzb7IlRxfDF/Kgw/XA1dlesT5rwQEgqpye2Pyb
	3uKEOGaW21v7IUIjY3Vxmz2usQp+w5xPJ3fNEHSajdvpZHAz1rrZZTfUfAvVgMQTuUfaYoWfip3oI
	JfyQxeCHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krlT0-0007ST-Ng; Tue, 22 Dec 2020 17:28:58 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krlSt-0007Rp-C9
 for linux-amlogic@lists.infradead.org; Tue, 22 Dec 2020 17:28:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id lt17so19285795ejb.3
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Dec 2020 09:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EzWloF/pr8zybezruT+CRW1uufhvp6eJ7quYYpxScOs=;
 b=j8jElfL2z55Bh+9MwUk0fXSL0Nh6MRiObrZxi6UpiNxJcBHs6JFuh+gIV8FSHFFYfA
 aiDPURkORkmbcqE2D7VW/OMjL2CKUKgHEr45iNUmFTZkjf8dktLOM26uxz4Fl5bQ9qVZ
 u8Brp4xwrvWmBdxoSZjf22qfZa+NBV4Hlskmopot+NBDHNEbrDwLnffcRamlPj9CX1Yh
 QallvLYFIWXqwF3P7m3z4/YXPPTnDASJJe4K5obpdbYVF5pvfYiKhnpwxzH+ZkAFnpfS
 KUY4EMu/mqJkjHNTT4SCinAulpcSIV9b7QmytIICh2xQnTRgwQDvG8Wz4W+2vqQvKVuy
 QfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EzWloF/pr8zybezruT+CRW1uufhvp6eJ7quYYpxScOs=;
 b=qb/5H6udTWimmBvn6PRTYMaOfP5VuPi7HgeFo1VJRXArQ9eEjNneKVcItgEgWLVpwB
 k3RStpEenWpjE4MLrlFUX1/tf0LvT//+wKLjFsaDQ57e50ogv7rJLQMJ0dEEXPfyO4VW
 yutRtjhcthDhr6aK8rIDk6dTVM/r5100rw0X1NaKvpJpnV75BUnwJV5mOHcky0MeTe1x
 oZezbAxfdjNGogwBk3LWNYbPZ3QbWtbMrfVkS0NW/qsIu/l9NWn3R64tLo6KUWZnvMDy
 SzcKzDKfCjsfjE9dEf2jafYA96I/aJU4X0MEpTTGTQW/UeaoP2wilsXClSz12nhu9TRc
 BjMw==
X-Gm-Message-State: AOAM533jpIixFQqYi1Caj3vxrqLPY+UaVLXG/z8bjG7RLH+4WhV2dZJl
 36DW0MiJrCj8kfowUiohAp+2J42Jhw84WB9yjao=
X-Google-Smtp-Source: ABdhPJxXWqqdJneyzkEcktNBdwN/0yAhwNfbfWjH9QyyCAmYtpUP88rteizfl/KEl+4Xa2Tu5P7He744VG57llF1Ork=
X-Received: by 2002:a17:906:4050:: with SMTP id
 y16mr20141744ejj.537.1608658129331; 
 Tue, 22 Dec 2020 09:28:49 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCAdq59k5wY_K+_NCxx-PLrp+eAsfOE1jkj4q5TFn7ruEg@mail.gmail.com>
 <20201222172458.dfuqmm7hwhjqs6th@chatter.i7.local>
In-Reply-To: <20201222172458.dfuqmm7hwhjqs6th@chatter.i7.local>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Dec 2020 18:28:38 +0100
Message-ID: <CAFBinCDA5qv10j-42vBMO--6d12FXKAi-iLsi493Qya3sXWWMg@mail.gmail.com>
Subject: Re: [sysadmin] linux-amlogic patchwork not showing new patches
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_122851_444882_CFF8AD8B 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: linux-amlogic@lists.infradead.org, dwmw2@infradead.org,
 khilman@baylibre.com, webmaster@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Konstantin,

wow, that was quick

On Tue, Dec 22, 2020 at 6:25 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Dec 22, 2020 at 05:45:19PM +0100, 'Martin Blumenstingl' via Systems Administrators wrote:
> > Hello,
> >
> > our linux-amlogic patchwork [0] is not showing newly sent patches.
> > The last patch showing up there is from December 3rd 2020.
>
> Sorry about that -- this was missed during system migration done around that
> time.
Thank you for taking care of this!

> > Mails are showing up in our mailing list archive though: [1]
>
> The upside of the new post-migration setup is that we feed patchwork from
> public-inbox archives, so nothing got lost. All messages received since
> December 3rd are now in patchwork.
great, I can see new patches in patchwork already!


Thank you and have a nice day!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
