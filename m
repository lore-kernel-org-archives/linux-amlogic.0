Return-Path: <SRS0=U5JB=6T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B554CC47247
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 17:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8951E206CC
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 17:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W6A8nmEZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ke1ddssf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8951E206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3J+mH7pD09n/oyaPqyQkvKt1IrZQYpqSlm6a+5++88=; b=W6A8nmEZsOuDID
	d937Dn9xLcGEtSJHV/gpmUnnqR/ij0XdNzLZl+Win/mHDqdQTYV4eLCZHcswkqxi3aGFY8+jdy+xz
	OXGHlf5GDruCY7Xf4eMk+ZFHX5kwKiDriHWmzGYX1tAMji+jWeZMOBBcOEle6EGPRq436L7avz4tg
	GIP6V0HPjIpDqOJjmxyenibfNuATe2LMSCAFSbIRfGRpIhayp/r7viG3GaX6FMik3S9DX1M0/zpPX
	t+VhPGxQPqMzXlz4Fz0l2zqz/cmToICgsYdroitjv0rkR5cV1Ngi9pYLIrxjJ3yJ1mXSt7UwB979J
	w+svxnj4fOLlHgo4U0eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW1Pw-0003o7-Eq; Tue, 05 May 2020 17:31:40 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW1Pu-0003nK-22
 for linux-amlogic@lists.infradead.org; Tue, 05 May 2020 17:31:39 +0000
Received: by mail-vs1-xe44.google.com with SMTP id x136so1788927vsx.2
 for <linux-amlogic@lists.infradead.org>; Tue, 05 May 2020 10:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EQsoLSVjLAyR/M3Ocg/DHLH6pm0RmX/436FGjF6WTao=;
 b=Ke1ddssfTsxp0iPhblhR8uitz3u+NzVLxty3wGO22LNbm/oHweSwOoglBCDtTP/BIT
 nV1QFq59DQfSmb6KnLtJ20O65z/eG/stUQHHvO8IH4EjGKYIUy9p4mmslme/tNVh5Flm
 6cGsK5McFrzX89tb9oXS6LtVMITgWloKe3SwFt3NmJYkPMWNvHfXt2Ie7uhSd+23n+/8
 ATV6FtzN+kcQJYmd3TQIVidF4Kn9qkk/B5Pp0RJ4v+8tQh2QN5nO4biP92tJ6VPwRAnT
 Gj9H12bpBzqp+B/l/ZfQsusyeGTwkTsHyDvj43JP5reauKAVSHVR8hvyiuB885U4ug4L
 ZUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EQsoLSVjLAyR/M3Ocg/DHLH6pm0RmX/436FGjF6WTao=;
 b=dceelKvsiFYOKGsupj1SjntJYj4w6sGXWtE57yQAIVD1jqE0U7ELd9zMWx690KoDRd
 8wQLeG9EKOoWufMg+FQwc0yrMfemFprGDKecCx0MhPP8KPMBBTuHakC0u5ASjKBcf9Qx
 hdhdjv4Z6CEE+37zwR+fLgdXUtjbRjcLgulQSTDHDAb9Yf4e1GtZI+vH8CXDLLCVLjq9
 5N8caxw2vd/kKOChuq/NpJ+DqMTLTRmIDXs6P9T17fqwQhFO5/nMOfdgExBRKuTTHJil
 YvaxjjPadwqlv6cIl9+MJdhBXwQvvZSqVaELeZu9fbXD+wSESLz3LQ7Tme570jJyXflq
 +tkg==
X-Gm-Message-State: AGi0PuZDdJAWK1+UJDI3nNA7/h90HZwmIb/EbxNQP6/9vWACjTNIStQs
 +6QM7ZwkAtGY55AoXtajkYvw/YRKo6f8fcj8WW5v1Q==
X-Google-Smtp-Source: APiQypKY+Ec0L+QALIPDIkzOQ4WXjg5IcZuMySRts7hkgSJWNuiacaOPr1fNLfnrg/Vc3j1c0VN+v2jbTt5wryigOLM=
X-Received: by 2002:a67:302:: with SMTP id 2mr3875137vsd.165.1588699896206;
 Tue, 05 May 2020 10:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200428210229.703309-1-martin.blumenstingl@googlemail.com>
 <20200428210229.703309-3-martin.blumenstingl@googlemail.com>
 <1jlfmdi9uw.fsf@starbuckisacylon.baylibre.com>
 <CAPDyKFoEh8qKYFONo1SHnvwhDwjUa5bMnnT1Kbu8=4rd=T-8Kg@mail.gmail.com>
 <1jh7x1i3hj.fsf@starbuckisacylon.baylibre.com>
 <CAPDyKFq_USCNNps3s4+C_1hriycrxtRMKJvnPFcP59CZmLXbGw@mail.gmail.com>
 <1j1rnygye6.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j1rnygye6.fsf@starbuckisacylon.baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 May 2020 19:30:59 +0200
Message-ID: <CAPDyKFogZgX05mPgue4UT57cTM-KVPfmoPJPf1BNJurGN+qp-g@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] mmc: host: meson-mx-sdhc: new driver for the
 Amlogic Meson SDHC host
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_103138_264685_CC72171B 
X-CRM114-Status: GOOD (  20.43  )
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
Cc: DTML <devicetree@vger.kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yinxin_1989@aliyun.com, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 5 May 2020 at 18:05, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Tue 05 May 2020 at 10:17, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> > [...]
> >
> >> >> > +
> >> >> > +     return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> >> >> > +                                        onecell_data);
> >> >>
> >> >> I think registering a provider for a module that does not provide clocks
> >> >> to any other device is a bit overkill.
> >> >>
> >> >> I understand the matter is getting the per-user clk* pointer.
> >> >> Since this is the module registering the clock, you can use clk_hw->clk
> >> >> to get it.
> >> >>
> >> >> Once you have the clk* of the leaf clocks, you don't even need to keep
> >> >> track of the clk_hw* since you are using devm_
> >> >>
> >> >> Afterward, we should propably discuss with Stephen if something should
> >> >> be added in CCF to get a struct clk* from struct clk_hw*.
> >> >>
> >> >
> >> > [...]
> >> >
> >> > Hmm.
> >> >
> >> > I am not sure the above is a good idea, at all. Unless, I am
> >> > misunderstanding your point, which may be the case.
> >> >
> >> > I think above "shortcuts" could lead to abuse of the clock framework
> >> > and its internal data structures. When going forward, this could make
> >> > it unnecessary harder to maintain the clock framework.
> >> >
> >> > I know, it's not my responsibility, but from my experience with MMC
> >> > and SDIO interfaces, is that those have been too easy abuse - since
> >> > most of the data structures and interfaces have been exported. Now,
> >> > it's hard to roll back that, if you see what I mean.
> >>
> >> Indeed, it worth clarifying this first.
> >>
> >> With clk_register deprecated in favor of clk_hw_register, we are likely
> >> to see that case rise elsewhere.
> >>
> >
> > So, according to the separate discussion [1], I think we can let
> > Martin decide what option to implement at this point.
> >
> > 1. Implement the "clk_hw_get_clk()" approach. The preferred option,
> > but requires wider changes of the clock subsystem as well.
> >
> > 2. Keep the existing approach, with devm_clk_get(). I am fine with
> > this as well, we can always switch to 1) later on.
>
> I have a problem with this approach.
> The dt-bindings would include "#clock-cells = <1>" for a device that
> does not actually provide and only needs it has a temporary work around.
> Those bindings are supposed to be stable ...

I agree, the bindings need to be stable.

What is the problem of keeping "#clock-cells = <1>" around, when we
move to a clk_hw_get_clk() approach in the next step?

>
> I have proposed 2 other short term solutions, let's see how it goes

Yes, seems like we need to wait for Stephen's input then.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
