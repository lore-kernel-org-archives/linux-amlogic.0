Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D215FC55ABD
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 15:25:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2062822263
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 15:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEUshy6i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s0sKGyNm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2062822263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+rIdd9RLMHLEUS2Q+BXyZV3PjuQmtV0H/n8HeyiRysE=; b=cEUshy6irXEFXh7qG0cDYeshs
	uMvQoHLm0foi63ammH5L5m0URwncrtUG8fSiuOKdkzFdPB5YSxPBSI+42VCwpOdz9Sn/B1deAR5Nw
	O4l7Itqs8t3BIhh5huc/9VILQhjjO5agHIc1z+B16DwWhqPkSy0Av/T9yuJXgU5iDhAB/nZ6Hn/KM
	Guec2vGHYS0kQbY3r6WCwyewuugIiJtqCEe3HLzkTbZ4k6GN819OYnq+ffvLE8+4VzLHd4/v+ZdEy
	Q/pzprxyBwvcIGS/EMJ1KpdZQEdkO68lBlNbUGZvJ504hYBMnb6pwSgKv/B6SoD1JC3kPK9wnvHe1
	L338XGJSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdaxV-0003Bc-Dx; Fri, 13 Nov 2020 15:25:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdaxR-00039o-1d
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 15:25:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id k2so10362872wrx.2
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2020 07:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=fh3sdYN4ySXdPD1FQVu1dC99IKskbJzhUsIZcKGht60=;
 b=s0sKGyNmrJtRczni+Nu+OHhlp+MV89+jp4a4uDTvYiCXoFX/gKAryrs9SHnrzvKw/r
 VxQ99Xuk8w4VDNr/7alL4kaXMyh7rPEQRsCslHv9on8T5EluVheEEAFzL5shdMbm+YQQ
 QT8lLkDiYgokmKugcSJQQZoKBUj82R0cBLMYI6r54fvf64H35J2w+pee9qlxQ8ifXpvY
 KkVksUXxX3JmkQjkgZXvQQbd7NIraiYvDhHEPSC5vo2Av+qV7c3NazQZLUEQureZ0o7H
 2Fn5h0UsupUIl1eyiR6Fy2c+CXXy0OruErlsoZREyOgQFeqw0G096ePP2xAojI98jVI5
 7fAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=fh3sdYN4ySXdPD1FQVu1dC99IKskbJzhUsIZcKGht60=;
 b=FszkkflUlBjNjemq1+BQjxXreGY/ZAr+Y45v5nX8ZMJ+7gzcdhbfFvt7jSGXdcZOov
 Y9GTHLjVZzj7nSaqFSyOGaWnOtIa2VCW+zEwJnLN+2mbsIB/fKBI4pmzAHIDhjk2yfgS
 2EDYgYcTkEBcHpIQjme/aqodV4GYPeOvxh5re5FZWm+E6kab9VbwriBKAuvKVi9Vc2LL
 fXwHdk9T2WYiMFALjIvyZ5SXpyRqGPx3zGERiaimw8YwlEpfgRdKWoc4BRYb8hQM8ob3
 Fte/3Bi0/NgouO5srzvY4CF8aUNPA6+bbZuSJwFageUYwSORrZRifMFzfdEv5O8agtKe
 b/gw==
X-Gm-Message-State: AOAM531zsK72oTPj+kqOoajj1e/r1EQMIPKOTF2BNP1v7UtuvM48NCsy
 5rrGXlmI2aSCIRL+C6ZXah83uIjPyJ5qQIaA
X-Google-Smtp-Source: ABdhPJwxconarfbkZMVreTzCgPKy8Q++gyfX3htiuHqgomRWZqBVyLzWlq1KmyWIF2JU2EisYgCWrA==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr4103486wrn.165.1605281143931; 
 Fri, 13 Nov 2020 07:25:43 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id f17sm10738795wmf.41.2020.11.13.07.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 07:25:43 -0800 (PST)
References: <e4e6cc45-bc18-40ec-035e-fdb45b9a8f46@gmail.com>
 <87o8lf74j5.fsf@nanos.tec.linutronix.de>
 <CAPDyKFosR2wd=jqADBF_dNd3kCMbM4oDAHyxiYC-5RF=SZ_E5A@mail.gmail.com>
 <1jzh3p9rs6.fsf@starbuckisacylon.baylibre.com>
 <CAPDyKFq8dM7Z48uUWHai83avwdhOOGU2NEefM7ifaOUcfW+BsA@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
In-reply-to: <CAPDyKFq8dM7Z48uUWHai83avwdhOOGU2NEefM7ifaOUcfW+BsA@mail.gmail.com>
Message-ID: <1jft5d1doq.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 13 Nov 2020 16:25:41 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_102549_178036_C56D159C 
X-CRM114-Status: GOOD (  20.19  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 11 Nov 2020 at 11:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:

> On Tue, 10 Nov 2020 at 16:05, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Thu 08 Oct 2020 at 11:08, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>> >
>> > Thomas, thanks a lot for helping out and looking at this!
>> >
>> > It looks like the testing of the patch below went well. Are you
>> > intending to queue up the patch via your tip tree?
>> >
>> > If you need any help, just tell us!
>> >
>> > Kind regards
>> > Uffe
>> >
>>
>> Hi everyone,
>>
>> Do we have a plan for this issue ?
>> I've had Thomas's change in my tree for a month, so far, so good.
>
> Instead of waiting for Thomas, perhaps you can pick up his patch and
> re-submit it?

TBH, I'm not confortable signing off something when I have no idea about
the implication, which is the case here.

>
> From my side, I can of course apply your original fix to the mmc
> driver, as an intermediate step.

In Thomas first reply, I did not really understand if it was bad from
the driver to use IRQF_ONESHOT. If it is OK, i'd prefer if things stayed
as they are. Otherwise, feel free to apply it.

> Is there a hurry?
>

Absolutely no hurry, at least not for me.

I noticed I still had Thomas's patch on top of the last rc which means
it had not been applied yet. Fishing for news, that's all.

> Kind regards
> Uffe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
