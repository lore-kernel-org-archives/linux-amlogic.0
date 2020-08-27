Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17595C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:47:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D28F0207DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V+X3fWDP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihZcH1k7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D28F0207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DcQdHfTHXLZX7lAVh63QGWeToBRifBFRceovE+O2uI0=; b=V+X3fWDPAZYJ9VWUCB1pt40h/
	4PfBmOwV9Ui8rXeN+F3+hsxZ0iwlTs9X/B2t0B+lIs+wTPGmGETk+3YpZcJ+m/rngNJXmBwQuxM7Y
	/EqPCzrorPq6yw71s8JwlTAVuxLPJ2hPEalPB5QLso2na5KODIi6B5PzSAaTDuGODlPYA1iiwk4Uk
	qnIojVVRjxRJaqjbCY/7Mq2kUzHVptRox78Ceyed0qf6NvGdWthJY6MDZcSxIBuvmmgf/68M54WqA
	1p89/taOKr7HTQ4k6MWn+fQS1jiXGDLzV8TRPKOwqxNf/X6G6eHzndIZkYG7eQZ+qIhxpb3g6Zlhf
	M7alI6TuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNrJ-0004vU-0B; Thu, 27 Aug 2020 19:46:53 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNqz-0004ls-It; Thu, 27 Aug 2020 19:46:36 +0000
Received: by mail-pj1-x1043.google.com with SMTP id ds1so3190947pjb.1;
 Thu, 27 Aug 2020 12:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4NU6BsCwiLu6+Otmj54J8lCct1JA9I1q/fhttNJEeg=;
 b=ihZcH1k73aBsEgGVPjWLQocZn0fiBEC/RyzxrU/a/t0cYY1yTfKtJ66qVhkBBsp+wF
 nw779Cfrk1akAVYBNt+EZtWu2J2NmHlfYL/ZlvN6p1PahyRIaAj1EbMUTlhHa7XvgkV0
 /8w5ROAiSv76TVIFV+c561WAxlYlzPfMn4sXrzdbRyRtpCjD8TIcgbiJejM6eH3lx27p
 KK7nlfSrWPxSO4IdnSX613qI7aWFERPo8/MESGlTrwgsb7OrsQOyFAvPaXaIBnfcsQci
 lWCQhO4na/uVhFLdgKeyFDb+Bf1qSyGck4aHlEjJnvi+8OQUWHxpyr6avAcVkC1Y2CeG
 RbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4NU6BsCwiLu6+Otmj54J8lCct1JA9I1q/fhttNJEeg=;
 b=TBIaXtU4AiYVUOX6hsJfSA9fJ7cztKOwuTtOIKlVKhlN0y0Ti1W7zkJ9EXZeLklRYq
 JmRQf8UfHUfSQKFh7QhRZzHpXa2D0ily0q+JtDsk7wLusHSrFCVW8auNZp8YYlI1DBl5
 QnjqjgHCCFyTh0FrrauzOVKVy0bQ7TQBEpUe8rE/374L+AShj4vJPZ2PAPBj4NOkadtm
 ik+QIJHI957HIp+rA1PYtZIOy+6ksFBpEl4qFk21PcxR46Kt9APkv/UolHTj2EmJmEyq
 hxhU9XukMJivGjFmeWDum0nGrnlLSowBZ+zQ4ueqA8ChdpfugnMTYJkfwMzRmhRIR5+z
 E6uw==
X-Gm-Message-State: AOAM5326dsq8hassAPXB23S23tkX7eFAoKZYslD9781o8QCJQDFVl3jm
 6hRPzCSUfkQEQiJotJOFBL3raMsrmwlNrtjK7TU=
X-Google-Smtp-Source: ABdhPJyEV1tQrkEPIueWwokrA4SXeGmpkXh42Z1LuwZzneAgw9EKay1IXMnHY/3R1fyTLePgzlAuANLM2A+JeHBP3ao=
X-Received: by 2002:a17:90a:2c06:: with SMTP id
 m6mr392684pjd.129.1598557590941; 
 Thu, 27 Aug 2020 12:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-3-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-3-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:46:14 +0300
Message-ID: <CAHp75VdUfuuWWyYjejf=Oe0kdZmyc_RFDOB7cvZbJqNQ4NoW0w@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] iio: adc: envelope-detector: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_154634_167178_83A7F676 
X-CRM114-Status: GOOD (  20.16  )
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

On Thu, Aug 27, 2020 at 10:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
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
>  drivers/iio/adc/envelope-detector.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/iio/adc/envelope-detector.c b/drivers/iio/adc/envelope-detector.c
> index 2a4fd3bb64cf..91a7be4a3f1b 100644
> --- a/drivers/iio/adc/envelope-detector.c
> +++ b/drivers/iio/adc/envelope-detector.c
> @@ -348,11 +348,8 @@ static int envelope_detector_probe(struct platform_device *pdev)
>         indio_dev->num_channels = 1;
>
>         env->dac = devm_iio_channel_get(dev, "dac");
> -       if (IS_ERR(env->dac)) {
> -               if (PTR_ERR(env->dac) != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get dac input channel\n");
> -               return PTR_ERR(env->dac);
> -       }
> +       if (IS_ERR(env->dac))
> +               return dev_err_probe(dev, PTR_ERR(env->dac), "failed to get dac input channel\n");
>
>         env->comp_irq = platform_get_irq_byname(pdev, "comp");
>         if (env->comp_irq < 0)
> @@ -360,11 +357,9 @@ static int envelope_detector_probe(struct platform_device *pdev)
>
>         ret = devm_request_irq(dev, env->comp_irq, envelope_detector_comp_isr,
>                                0, "envelope-detector", env);
> -       if (ret) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to request interrupt\n");
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to request interrupt\n");
> +
>         env->comp_irq_trigger = irq_get_trigger_type(env->comp_irq);
>         if (env->comp_irq_trigger & IRQF_TRIGGER_RISING)
>                 env->comp_irq_trigger_inv |= IRQF_TRIGGER_FALLING;
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
