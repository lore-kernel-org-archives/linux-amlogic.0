Return-Path: <SRS0=nKCN=CT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B135C43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 08:37:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF57D206D4
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 08:37:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L0tVHZBE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xShM8od5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF57D206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BDDGs0vUCJAfYODQYtjB5rsIp7o2YX9nXEvD1P/+NNM=; b=L0tVHZBE1yxtDAbr4qlacibnJ
	X+2wAlZ+jDKwszKIvrt4gAkinY7GsxqyU4N1ctKNDBWcOaiosznGnp37fXhN9v4b+10lQ66dqEFkt
	WJ3nrr+UyznFVvCx1yEuvr+MMQJ+AOXNd12Z/LRqaRea8O3JtRtQsx/jTGu+gXk3eHnd9Rhoa//rf
	0iT7FY7LYvJ9fkPva0YYlkxKyb7vMkWKR/Gs/orw0ia1j8+464sYiSujzlC+nWbbZhxVZ1QcLItuF
	UPm+OrhJhO3jTu2448XzKxuobvUCACVbapMhnehaVECGyjdbR4DhJo7eVDRFtcgTD3QOQrZE1RZ6O
	O6DOphfsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGI4i-0006yA-CB; Thu, 10 Sep 2020 08:37:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGI4b-0006uy-PY; Thu, 10 Sep 2020 08:36:57 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49B2320BED;
 Thu, 10 Sep 2020 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599727012;
 bh=FTig6rPaZltKUx3M9pM1ycw/aGv4o3ffuusmSgumDhI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xShM8od5RQmoImiTHhOxlMyzg9o3ljBugN4a2iBHXy0Z2ekwWv3uBFmyvtisw6ts1
 9ua5wSzxOQGjLK8n1jw65HT2a5t327eRPtroSOFd4/mnPnzor9N2j2F5ueX9IXzQqg
 7z1VW1nyh9Oc5r6RQbLV2cuuT9DFnJ0lyOAZRp4I=
Received: by mail-ej1-f51.google.com with SMTP id e23so7511876eja.3;
 Thu, 10 Sep 2020 01:36:52 -0700 (PDT)
X-Gm-Message-State: AOAM531THGaMNBXA8IM+EhdSJ9+OKFR75gB/pZfAzE0XWZX1YkZp0foN
 WN/nmzZdkg/wsU38dtmVspxPc6ekU3msGYTNz1Y=
X-Google-Smtp-Source: ABdhPJwjtDYLRSBq6Amx7NdpRb+UlTD9WZghEMqB4PGHfXl5M8kyQ8hrvlps+rLSbZFVvjfFqiDxJqkHawrXCoPGuqc=
X-Received: by 2002:a17:906:4046:: with SMTP id
 y6mr8123139ejj.148.1599727010714; 
 Thu, 10 Sep 2020 01:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
 <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
 <a37c69f2-1f16-2680-2716-0c1b77748d55@axentia.se>
 <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
 <CAJKOXPdNAw8scFKCGaC_hp4jMyLD_mFLKr=+fGKSm6nCkcRF9g@mail.gmail.com>
 <20200910091208.000055fa@Huawei.com>
In-Reply-To: <20200910091208.000055fa@Huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 10 Sep 2020 10:36:39 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdD0Qa1Fom4QYctjua4TfBa8CPaHd6PG5QViNweAr3GJQ@mail.gmail.com>
Message-ID: <CAJKOXPdD0Qa1Fom4QYctjua4TfBa8CPaHd6PG5QViNweAr3GJQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] iio: adc: stm32: Simplify with dev_err_probe()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_043654_019524_E0C7B2B2 
X-CRM114-Status: GOOD (  31.22  )
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
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Peter Rosin <peda@axentia.se>, Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 10 Sep 2020 at 10:13, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Thu, 10 Sep 2020 08:58:57 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > On Thu, 10 Sep 2020 at 08:52, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >
> > >
> > >
> > > On Thursday, September 10, 2020, Peter Rosin <peda@axentia.se> wrote:
> > >>
> > >> Hi!
> > >>
> > >> On 2020-09-09 21:57, Krzysztof Kozlowski wrote:
> > >> > On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:
> > >> >>
> > >> >> On Sat, 29 Aug 2020 08:47:16 +0200
> > >> >> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >> >>
> > >> >>> Common pattern of handling deferred probe can be simplified with
> > >> >>> dev_err_probe().  Less code and also it prints the error value.
> > >> >>>
> > >> >>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >> >>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > >> >>>
> > >> >> I don't have the thread to hand, but this tripped a warning next
> > >> >> and the patch was dropped as a result. See below.
>
> oops. That is what I get for reading an email very quickly then looking
> at the code a few hours later.  Still a problem here we need to fix
> unless I'm missing something.
>
> > >> >
> > >> > Thanks for letting me know. If you mean the warning caused by:
> > >> > https://lore.kernel.org/lkml/20200909073716.GA560912@kroah.com/
> > >> > then the driver-core patch was dropped, not the iio one:
> > >> > https://lore.kernel.org/linux-next/20200909074130.GB561485@kroah.com/T/#t
> > >> >
> > >> > So we are good here :)
> > >>
> > >> No, we are definitely not good. See below. That means "See below", and
> > >> not "Please take a guess at what is being talking about".
> > >
> > >
> > >
> > >>
> > >> >>> @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
> > >> >>>               priv->booster = devm_regulator_get_optional(dev, "booster");
> > >> >>>               if (IS_ERR(priv->booster)) {
> > >> >>>                       ret = PTR_ERR(priv->booster);
> > >> >>> -                     if (ret != -ENODEV) {
> > >> >>> -                             if (ret != -EPROBE_DEFER)
> > >> >>> -                                     dev_err(dev, "can't get booster %d\n",
> > >> >>> -                                             ret);
> > >> >>> -                             return ret;
> > >> >>> -                     }
> > >> >>> +                     if (ret != -ENODEV)
> > >> >>> +                             dev_err_probe(dev, ret, "can't get booster\n");
> > >> >>
> > >> >> This tripped a warning and got the patch dropped because we no longer
> > >> >> return on error.
> > >>
> > >> As Jonathan already said, we no longer return in this hunk. I.e., you have
> > >> clobbered the error path.
> > >
> > >
> > > Exactly my point why I proposed _must_check in the first place.
> >
> > That was not exactly that point as you did not mention possible errors
> > but only "miss the opportunity to optimize". Optimization is different
> > things than a mistake.
>
> In this particular case we have introduced a bug. If the regulator returns
> an error other than -ENODEV we will carry on when really should error out.
> This includes deferred probe route in which it won't print a message but also won't
> actually defer.

Yes, I see, Peter pointed this out. The commit was actually not
dropped from next so I will send a fixup.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
