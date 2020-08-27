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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8F6C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:51:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C29CF2080C
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swCGQL+E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ix3Va+o+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C29CF2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rcOgOkMkues1gCS0DZ8tOjK+UT28e3MXWfQnbF+BEcg=; b=swCGQL+E/H08VoCRGo0DgGBvq
	AOi2An/Yd6lkRYF1/XvVmO8gmqdUJLCI1p7qsM2v2jl7ShpKo66BRzPNJ8WwLeg059ZDO4Z3X8UAh
	bOvA6V6wuNybxcJk+AUF0diXk9h6CsjLQyMEcZ4ZkpyRR6XZRhOB645ZaTS/8Gj5ZeIbnUv+itJ6R
	bEF2pGavybm2B1dbz5QFD04k8jJqyXDNRJFE7hH6171FnFTE/Lbz8ms8G0dTjNytw4orhpLhNBjp+
	o1VdlDMSQE/yrmoStlF04SWe9Zsh2cKJNCbA+poye7IjOG84BOQ9DH2R0h3pN9uCSP3zaR7KmJXro
	KopJehyhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNvh-0007MA-Om; Thu, 27 Aug 2020 19:51:25 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNu3-0006Mo-FS; Thu, 27 Aug 2020 19:49:47 +0000
Received: by mail-pf1-x444.google.com with SMTP id y206so4302692pfb.10;
 Thu, 27 Aug 2020 12:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J3gzyzO1gbxLdidSqR6d1wlDjGQFBUJvUcq8FiJnVtg=;
 b=Ix3Va+o+3XbmB70WBqBC725rnsHUyDm6ZoPZy2b6hcZ+38QrgQbROqTVcHhuzh8SXK
 rMQANp0HWGAK0S3jGGDuzX8pV7jIMANFnK9ew4PiVoz4gml/9QsbVZBlaad6zaN1zTHh
 L56Wy4g5LQD9tNdVMaYcFb7N6DSCrhozT7oT7ICoIwsrJXoKJ35rzoD+7dpGgpwdSemG
 QSZ1F8DLFO0OU5j/xtnuxVyj9N16sMJ07M9DSs8l6Ckbjdjz+9xWDA08Xegmz7/mZkJG
 XlgePyfePvWDzYQBw5KQxNn3PpFfJTT0e70LTT9XoS7BmcRJcAJrKFseBYXuCfY+VAcz
 tHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J3gzyzO1gbxLdidSqR6d1wlDjGQFBUJvUcq8FiJnVtg=;
 b=cKkcK3Jcfz9FtC8iZph92i6/Ta7u2seOBdZq2+RMPIG1zriDKXeaZTCSHHBfKRHfo7
 0TIDOTvKQn5/313D4MUOqdWpiA1h8xb/+CaSOw89QYud9DGnZBAM4+oadQFsBg6ZjN4f
 WloUgiMoBxrgQ/mDIsST/Y+NMUWfiLZQhycHNH4b2iLLK9phaE2BVBMKjVSGym1s6TQr
 nuTDLo3U391XZxx9zrfHRi3bdZAhmj67eGhrM775XXK4afJZxzOfdXgbUnQ9kUXIkLXf
 zRhXtBnqUF1GLN0cMTOMPuypcdJyMF+CMNnUjjv4TBmmBsSUHwFTyBt/0p4x9K0CtGaW
 CK4Q==
X-Gm-Message-State: AOAM5337R3QB+mURcW+gZZjbq2oLQKBYUII2jt7vG1HrBnKNOT9+NDQK
 /+3Rj1Owx8kFatuFPrXOagdyYXdvW5rAT1M1FIA=
X-Google-Smtp-Source: ABdhPJywOKJ7nbos0Vl5TfFihLljc3WSP3/cAdSxhBmVa6rR4UoZP9/yzEnECmoNYbP22WFTY+hpwLKOC2YaPImjw0A=
X-Received: by 2002:a17:902:8208:: with SMTP id
 x8mr6288066pln.65.1598557780819; 
 Thu, 27 Aug 2020 12:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-7-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-7-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:49:24 +0300
Message-ID: <CAHp75VezjCWG+_qLWevc9nX5zQUoB+2UpLJo9HXqnV5svmwX-Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] iio: adc: rcar-gyroadc: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_154943_671757_8F12849C 
X-CRM114-Status: GOOD (  19.95  )
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
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 10:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
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
>  drivers/iio/adc/rcar-gyroadc.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/adc/rcar-gyroadc.c b/drivers/iio/adc/rcar-gyroadc.c
> index d2c1419e72a0..e1a7c93fc2db 100644
> --- a/drivers/iio/adc/rcar-gyroadc.c
> +++ b/drivers/iio/adc/rcar-gyroadc.c
> @@ -495,12 +495,8 @@ static int rcar_gyroadc_probe(struct platform_device *pdev)
>                 return PTR_ERR(priv->regs);
>
>         priv->clk = devm_clk_get(dev, "fck");
> -       if (IS_ERR(priv->clk)) {
> -               ret = PTR_ERR(priv->clk);
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get IF clock (ret=%i)\n", ret);
> -               return ret;
> -       }
> +       if (IS_ERR(priv->clk))
> +               return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get IF clock\n");
>
>         ret = rcar_gyroadc_parse_subdevs(indio_dev);
>         if (ret)
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
