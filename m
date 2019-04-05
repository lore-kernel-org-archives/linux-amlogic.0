Return-Path: <SRS0=88k6=SH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD97C4360F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 15:44:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EAE220693
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 15:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLfhtTV6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="riSUW4xq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EAE220693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yw55YBxwTalXDqjZEGnHZusRVyq3bTBuhzRAOEdMq+M=; b=PLfhtTV6IZ6luE
	j+9swsU0bAycPRlSnZ2JXslzPfZOhZbVUPn2HdT/G+jd+za/p5MeDSseO6g8dg9D9GzCmNSA2YbAL
	rIMBPqRRN4crrN9HPL1FGjUh8Q+iplJHoUH8mdKZCqJDq5NJSmwzDnV52mam5q0L6HOSTrq5FjoE6
	Wka6UV40qKhDg/RDvze7eW/+FWNe2HzGklsTEYYiFflICGeyZ8mjpaC/IBgZ5BFR9HTl9pWcRpwQI
	/hbY/cGBCdDrn6xZUbYVovQ4F46Jmlrgir+9mw1RftykNBCoMZbhd4vJ4doV/QekdRgUtjxDJwaGx
	z4Bu8zChFikccWkZgMxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCR0p-00063H-Ur; Fri, 05 Apr 2019 15:44:15 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCR0i-000626-NA
 for linux-amlogic@lists.infradead.org; Fri, 05 Apr 2019 15:44:14 +0000
Received: by mail-it1-x142.google.com with SMTP id x132so10150504itf.2
 for <linux-amlogic@lists.infradead.org>; Fri, 05 Apr 2019 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VspmTPNLn8xL6ouAEeQeDx4TzQeyEHiFldQwlhIpHmo=;
 b=riSUW4xqNYoebenqTnGy0N5CQ3Qi9w65e5kaBkiuoBy6t9ybOJ4Ta6o+SDM7N5QQkn
 fbYsKUZihw33SO35lLO+8xMmCop6ps3odZys1GUxsROYZzHVTe6Nrr5S0N93RFrab9sp
 rWn7Mm7qbysDNx5sMY1v3LI5G/Epijjhn9t7XY/FDsH2VvT1cDHjQOSpfKzK4+Wa/wg7
 eik9GXh965M4U+n5DnV3+NVsZBAca4yVezVxMJe6djMTW1jjHWRdEKy6Hq3Qt51dU+Ck
 Oru0hAW6iUQwmjNRUAgDOXkwCbBE0bl4A/GXClLWNYJLoJ7Rad8ZcuuvzKrXiYeHLLvk
 /G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VspmTPNLn8xL6ouAEeQeDx4TzQeyEHiFldQwlhIpHmo=;
 b=szbGo/yuW+0R9Q6iDxkYpA0EA68P8OlrdrbIp/iM2sBKSLdnMIkCcdX3lnHmU1Mbvq
 gOkALJZVBIP3NaYe3KMFznyX1JOxHxuF44YKE0f7eDJ9BsLHon2Lpfy8G1nLtaL6FJs2
 X41jM4Jzlr0BeSiJj+krhRJf/B9/OFrk9u6AgvQetkfdSulPH/x5EzOOsSGSaTjX4YGV
 crVMVK8AMl70p7j5xo4udNdtEfx3niOD4qhXxn+arXQrgMY8n3VAS4Qz10Gpk671G935
 7DiyZMVvXRvCEw3CKf/4lWMY6s4MHA+ufDzwXaki3eyVXv65FMvSO8vWGdv85AGYnqn1
 xOJg==
X-Gm-Message-State: APjAAAUdry/GVfmVMsVzBdt9diRFJRFi73blklatUBC1utjriZDm83BU
 EXqLvRpzOmlGkTOcV9T/DX2iGy521OspZufQGzgZPw==
X-Google-Smtp-Source: APXvYqxw1P4R6K7ENi+qHR7TWDvyajbZPjl2skwR4UM6WAei5oODulK9yiOJq2uWXsWn5EbxJjU17OSOQDOQt1geoKI=
X-Received: by 2002:a24:ed4d:: with SMTP id r74mr10217596ith.79.1554479047125; 
 Fri, 05 Apr 2019 08:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190325111200.15940-1-jbrunet@baylibre.com>
 <20190325111200.15940-2-jbrunet@baylibre.com>
 <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
 <8b6f0bc6210834af2aff2de7dc95692dd87db539.camel@baylibre.com>
 <155389767798.20095.10570017301900287354@swboyd.mtv.corp.google.com>
 <6ef984dabf626760ae606567facdc5245fbba984.camel@baylibre.com>
In-Reply-To: <6ef984dabf626760ae606567facdc5245fbba984.camel@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
Date: Fri, 5 Apr 2019 08:43:40 -0700
Message-ID: <CAEG3pNCrANkLBeEA_wVU7n4U57X3sd-1EzhUZ_PHBryqPHoAaQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: meson: mpll: add init callback and regs
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_084408_797267_6F4661AC 
X-CRM114-Status: GOOD (  22.92  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "Stephen Boyd <sboyd@codeaurora.org>, Emilio Lopez <emilio@elopez.com.ar>,
 Hans de Goede <hdegoede@redhat.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel" <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Fri, Mar 29, 2019 at 3:58 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Fri, 2019-03-29 at 15:14 -0700, Stephen Boyd wrote:
> > > > We actively discourage using init callbacks. Can you do this some other
> > > > way?
> > >
> > > Yes I'm aware of that but init it the right place to do this.
> > > To be clear, this is not initializing the clock to some particular rate, the
> > > rate is preserved.
> > >
> > > It just applies the necessary settings that needs to be done only once to make
> > > sure the clock is in working order and that the rate calculated is actually
> > > accurate.
> >
> > Ok, but can you do that in your driver's probe routine instead of
> > attaching to the init callback? We want to get rid of "init" at some
> > point so throwing the init sequence stuff into the driver probe around
> > registration is a solution. Or we should think about not discouraging
> > the init callback
>
> Is is callback really a problem after all ?

It is a problem, insofar as Stephen and I want to remove .init some day.

> I think we should actively prevent using it to set a particular rate.
>
> Here, the goal is put the clock in working order. The bootloader does not
> always do that for us.

The above two sentences make it sound like this sequence belongs in .prepare().

I know that you're concerned with setting rate, but I guess it is safe
to assume that you'll always complete .prepare() before you begin to
execute .set_rate(), no? This also avoids the ugliness of putting it
in the .probe(), which I agree doesn't feel like an accurate thing to
do for a clock's own programming sequence.

.probe() is an OK place to put policy (turn these clocks on or set
them to this rate, for a known-good configuration).

Thanks,
Mike

> I could put this in controller driver, but I would have
> to repeat the init pattern for each instance of the clock...not nice
> Using the callback clearly shows the relationship between the init and the
> clock. I think it is a lot better.
>
> In the same series, I have added some init for the controller. In this case
> the init target a group of clocks, so having the init in the controller makes
> sense for that
>
>
>


-- 
Michael Turquette
CEO
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
Schedule a meeting: https://calendly.com/mturquette

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
