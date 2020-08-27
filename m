Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE9AC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:01:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8CC227BF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ehnnEIAr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8LyWEgN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8CC227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xuktC8oV3pkQFOV6COyOEmVweFGK2ErvZjMgU4AF1JQ=; b=ehnnEIArAFQHErT6KxZ+J/Zo4
	wbkxMIeWWSLCbIPA9ZDug4o7sKClJqIkRlmfF7Fw+H6dEcQxcKNGlwV54ZxvbanySxyF5Q8ZIdIO5
	KGjebbdZIbN57al3XXPn0eG41ja0d8tz/+knYEbSt/ufV3c74nS3gn/vZXeFjRdZy9ht2o7z7OmrA
	ZJG3HSv7+8+JXdWSHJjkTabZBQ1MDjsYWhzl7GzWzw16Fn6EH+Pdey4+m07lvu2yD25EBtM2TBFg3
	Meyh1OT5cHob6957wCt80kbdrNupwpDwhF/ZyClUe7COvT4bUNPqPn9v89ac2iao77iMqxEC2mlci
	so/J3vj0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBO5a-0002m9-Il; Thu, 27 Aug 2020 20:01:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBO5Q-0002hB-HF; Thu, 27 Aug 2020 20:01:29 +0000
Received: by mail-pf1-x441.google.com with SMTP id d22so4338783pfn.5;
 Thu, 27 Aug 2020 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvjSdv4nUxPfwBP9PKjoRBAQ4y+6+2F4ni6LT9Fuaqw=;
 b=H8LyWEgNqOpDRjSSDYB9n9KmWL3CtBr2jnO1bgCkicNJQLaAzjXu56afxptqb2MvJr
 QE+3oafRBg5l1ARaKoGkOAqtmaPZR2pYOm1smalhZaJv6ND6sCy2q1yMwD1CQb+ny5bT
 jo+/Uve7QIH8I3TGoiXlFrnRmFnDrMxL41sZa2WJlyMnxr/ewFu0azP2BolPZNw8FL9S
 mYFfPBlosvKpNaNeBlCPfPbQOFWX775syR8FZmU9289TyTEPXQOOZi+KDmdAGqZC7Ir0
 Zuy0V/AZ0QwQ0N6MekI9WFEVkauZr4xejAvIIW+nQw6Phj7CBtrcnlI69zL1vrD0KYAs
 xc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvjSdv4nUxPfwBP9PKjoRBAQ4y+6+2F4ni6LT9Fuaqw=;
 b=OEaJ93pONpHqs60xXI/BRRJ4wRAJiMbVxrzscvodNs+2Ork7AiA/6OH5j9csAxmr5l
 kGK7TygKlMKGH7JQHurDF3oZdmayRYOmr3m32ngbGKzWwSVG0zbFgx2Dn9DduFXTKoTy
 O8NQoedKkPjaOj9uE5eRwPGdA8N2Y74Qxq8i8wZFFhBFL9Z1OcLdeLc1r8bgVjVY+ez1
 pswPT+yLYjjG0ev9ZvHMFa8Xi16YAeyHZpRIhGSem+jtZmBRCqEs0VGpLbrKzBPIoovg
 hSoaMRdnRWalpX/9uDnjR6xMLUYh1kMwKf+SigwUn0qBI9tO6+wFY8u+zq8DA7jguzlK
 EsPw==
X-Gm-Message-State: AOAM531L/PPXaZIDAbquXq/v40LTOL9jZx+uvxg28lu6qE2L22WmxAOl
 NIlmOumAIkHxkme8UT+kxDwnnElcBTLrGA3KhSA=
X-Google-Smtp-Source: ABdhPJwSRYUZsSB/8KnvgLSmu13GxDxmWJ06S1nuD0ZKldgoptbvJ3SrDq+X27CzDqiFe3ukQbDy/QDCjgIaF8SxOns=
X-Received: by 2002:a63:f24a:: with SMTP id d10mr15676744pgk.4.1598558486512; 
 Thu, 27 Aug 2020 13:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-16-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-16-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 23:01:10 +0300
Message-ID: <CAHp75VdTTH3ZNxoFqsXLMBnGcBwaCdRZYUJrHBznvcb46i9Afg@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] iio: magnetometer: ak8974: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_160128_596294_5EC9EB06 
X-CRM114-Status: GOOD (  19.07  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio <linux-iio@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marek.vasut@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Kukjin Kim <kgene@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 10:29 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> ---
>  drivers/iio/magnetometer/ak8974.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/iio/magnetometer/ak8974.c b/drivers/iio/magnetometer/ak8974.c
> index cbb44e401c0a..548c686e29d6 100644
> --- a/drivers/iio/magnetometer/ak8974.c
> +++ b/drivers/iio/magnetometer/ak8974.c
> @@ -843,15 +843,8 @@ static int ak8974_probe(struct i2c_client *i2c,
>         ret = devm_regulator_bulk_get(&i2c->dev,
>                                       ARRAY_SIZE(ak8974->regs),
>                                       ak8974->regs);
> -       if (ret < 0) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(&i2c->dev, "cannot get regulators: %d\n", ret);
> -               else
> -                       dev_dbg(&i2c->dev,
> -                               "regulators unavailable, deferring probe\n");
> -
> -               return ret;
> -       }
> +       if (ret < 0)
> +               return dev_err_probe(&i2c->dev, ret, "cannot get regulators\n");
>
>         ret = regulator_bulk_enable(ARRAY_SIZE(ak8974->regs), ak8974->regs);
>         if (ret < 0) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
