Return-Path: <SRS0=cz5x=ER=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F39C388F9
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2020 10:48:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B70B92063A
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2020 10:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yrxFB9YP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGYXz/W/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B70B92063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9MmaYgSVT2FnxFRA00zGAsmz8o/EavtjrgydlouJg3o=; b=yrxFB9YPVVl2IRNymMIys2PUV
	8ta52GIof5lzP6tfCU8wd+VMtBJ0+KagiciTXDyvzFbDHKIyrky1q73nnq/5ucegJnpZNgUv3cuEx
	RuSxhB+M1yRr9zjADxG49MRZnEMIgdPgFA1K6qJnaFEXdAl12yQCggJBEtldGxd23IjJnDm1gC+6X
	WdFV61ll1w4N9G+AMpKnYNXYNOM4U4AY04BkYd0db9iWWbY0D8+EV5Isku8YCSYZCWJC4acnSogM/
	FBdXAhJFmfwXa1R0Pxo30gk1NQx5+q4QCZsasRxq/URkqpsrnjq0bBAccIMSSRebM1NQLKr0MhCQY
	gFMncmd1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcnfO-0007kE-Qh; Wed, 11 Nov 2020 10:47:54 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcnfL-0007ib-A6
 for linux-amlogic@lists.infradead.org; Wed, 11 Nov 2020 10:47:52 +0000
Received: by mail-vs1-xe41.google.com with SMTP id b67so899408vsc.3
 for <linux-amlogic@lists.infradead.org>; Wed, 11 Nov 2020 02:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UgkXzU9/4gZgqTvAIagsY0SyNaXdwtJ+4SDO4OHtkpw=;
 b=jGYXz/W/9Xbn9CKQMNVGDOtpA4doGrtKtb4BOVOmGhgM0dzctntTNxl6iAmRqjND5F
 xecYDYR2ycG2D84rpCTuwmtx4WhLvy2+gcxQmWzUPAJ2C2iRPPNkeIfFUgsLlUMnaimM
 EM10wfaJrA7T16AuUEzYQqnrR4rg8g6ZWERekmh9F4oprY0BvAk9UtCX7FeplKXDr0Dp
 6D2ETw/aw6Bb80TiaVQ02N1/1r0PP2pp6p98+1sy0ajS+DlXm6pMkXhtgJ+pnClgpP5h
 le51d0O58VGkBT6FdPLSl3507Gzbfdbbra4sNQ30WKUDwuVgKSka+R5JLUByBXZpTIVy
 PfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UgkXzU9/4gZgqTvAIagsY0SyNaXdwtJ+4SDO4OHtkpw=;
 b=jRNTK9fxu5wWHiYMFTTbNLZCoqY3tVWxJks2dkWp/BTaenpGvRV6bnuSc8+zcadUl1
 5qtT+ZlGt4U+Rx1jDSgZWMXRFzZ3NDMG2LMKPkiHBk/b35D1W9zoxInV4W7iqHhZv4kj
 2Qu4ahkhvNDM1hSAUFP7qivY14coVkJtKHnhyS0vBMMgXk5B7B7lYZ3EU21ZfM5PBxMb
 7aZiokEi9/FpR9pxkuFIi4ebXy9vmnD/mHfZe83HEPbXLVZZk2U7lcc60I2TOmr/6WHj
 wfeFzIuepseeJSZNmUg5GqMGmQoit3bHj9l3A6f/FZXVHxRa1o+rC0zk+u/VQvtcsQsD
 oj4w==
X-Gm-Message-State: AOAM533sw31rRsNslcNLiPsW/T5RUZhCeowO6ms80RK9xEUh4uIzBEOG
 hfJGZc+PyV5QhPpj5rw/q4FKvST7UyxdAxSiK5gY0HF3/lZJ4paR
X-Google-Smtp-Source: ABdhPJxUM+6o+Ztc41vzfoV1T1XEqMiTB2AsemlLbtndzb34v3lhdhghjD321/DmrcfjSikdz3NFTviA88YwazaoRhI=
X-Received: by 2002:a67:3256:: with SMTP id y83mr15817866vsy.48.1605091667748; 
 Wed, 11 Nov 2020 02:47:47 -0800 (PST)
MIME-Version: 1.0
References: <e4e6cc45-bc18-40ec-035e-fdb45b9a8f46@gmail.com>
 <87o8lf74j5.fsf@nanos.tec.linutronix.de>
 <CAPDyKFosR2wd=jqADBF_dNd3kCMbM4oDAHyxiYC-5RF=SZ_E5A@mail.gmail.com>
 <1jzh3p9rs6.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jzh3p9rs6.fsf@starbuckisacylon.baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Nov 2020 11:47:11 +0100
Message-ID: <CAPDyKFq8dM7Z48uUWHai83avwdhOOGU2NEefM7ifaOUcfW+BsA@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_054751_511877_3E04A781 
X-CRM114-Status: GOOD (  14.80  )
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

On Tue, 10 Nov 2020 at 16:05, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 08 Oct 2020 at 11:08, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > Thomas, thanks a lot for helping out and looking at this!
> >
> > It looks like the testing of the patch below went well. Are you
> > intending to queue up the patch via your tip tree?
> >
> > If you need any help, just tell us!
> >
> > Kind regards
> > Uffe
> >
>
> Hi everyone,
>
> Do we have a plan for this issue ?
> I've had Thomas's change in my tree for a month, so far, so good.

Instead of waiting for Thomas, perhaps you can pick up his patch and
re-submit it?

From my side, I can of course apply your original fix to the mmc
driver, as an intermediate step. Is there a hurry?

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
