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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42950C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BC38207DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yHty4iRV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uCHxCyol"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BC38207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9MvgWGgx++TVfDp62m6GQTyC2lZaJfuwz4iC/kcMqWE=; b=yHty4iRV+ISHbLL7Rs9TQyhDV
	PjdYsKrfVCyANZenpbehkQMqGW7U0glnaUKVCz5j5w+DP1Qn28XrNLgknZAXW5fvjslJixXmZJuA3
	Ec9GyxMgJot52c/texVHrgXkz1zFIdN5CnN3VuwWw7ii1KH+s4ErzLLiVjrcP7CSzLBjYs6NLKwoQ
	riCZq/YAXUL2RJqoS/uVl23r5+1KoAFqv4yW0Z9jWAvQVkxZZUZV9+d/BZacPY5ClRt989sPk9UWN
	TsoseYLrhQp0y6AL1oONmuUyH0IOWutv5A0KiEiGNnSoGAGPRnjbyBsHeS4O9W+IzImUgNDNYjFud
	UY9ANrsow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNst-0005lW-CR; Thu, 27 Aug 2020 19:48:31 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNsn-0005iw-Pc; Thu, 27 Aug 2020 19:48:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id 31so4089074pgy.13;
 Thu, 27 Aug 2020 12:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kacN1ThtNH5U40mcv/4k6dMARnX9bfV0PWOTTEKKot4=;
 b=uCHxCyolCflVbO+WUbO5LZqzBxHhrvlh9Pfc4sUAey8ZLgzdCoqYIrLEdx8BpwQcBh
 s2GFIussGGUrYPA0MF7HrS5LyrCzsMV7f3icVtHxQDnUdBsayujKjO4yklbNWparyLk6
 6s/hYZYO7z9qF50wRRq3vSxKkZRtHXpiiZPUoABcbB8tpDAXLFRK8W47KyZVcZSsbKFl
 GcpeBcMwA/NHfGzT7yOp5nwKgLoqG3eJzac9x4Zrkxu9rtMnmOVUdbEfRzxdmbXvjGpK
 VnntcUFcoKeILOSwGYEdjuUalT1APy+Ayiduu0gb6oeP6w5roa17Qj+Rtnan3NJD4kzq
 Izgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kacN1ThtNH5U40mcv/4k6dMARnX9bfV0PWOTTEKKot4=;
 b=tjdMX06OyDBLA93XrkCa818rW8Lg3ejGD3q8vK3oBloB/MeCwmOIMX5qMUMbPP6g76
 4yw/vSGlFu8dvVGsg67jbenaMeZDgqkH6IdGCh+UWwePQC9TWuGEds46EovFCNKHfokf
 OTp6TuS5m0nSPQ+CcJvw4aXtJKPKzKQGj1ZVUZwo0+1CBqCwBLRMP256nNRURKtN0zsm
 riSb16xW9AjSQgINig9wlGSE9qobf5A+TCs4p5zeZ0Fbb36RujNVQd8SW04F/QUqzw4p
 jykYnb1sbFw1VBU7eWPeIk97OsBF4SOesearkQVyBBJhps9LO4Wo8+sEjRrVW0xA0m7n
 EWDA==
X-Gm-Message-State: AOAM530VZrKKXhBEExqx0Of7TxImbXHFwY0elB8qKKoB2telQ7wKg2HX
 Gf4+MBZtqtxfaA0V/vrkezl3mrd4JGA2ff9v0TE=
X-Google-Smtp-Source: ABdhPJzMBvf3SlQ4MXHwemF7WLO50QwdlrwNqcBo2uex50d1LsuaXz279AsMkddgVB3byOEu0XId2Ie0ozFdCkvrviw=
X-Received: by 2002:a17:902:407:: with SMTP id
 7mr17541240ple.167.1598557703780; 
 Thu, 27 Aug 2020 12:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-5-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-5-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:48:07 +0300
Message-ID: <CAHp75VepFzdeN=jaXvmSmkQauDJfgSU5ut3hA6a+Cer_SC52Og@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] iio: adc: ltc2497: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_154825_840472_CD14D517 
X-CRM114-Status: GOOD (  19.70  )
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
>  drivers/iio/adc/ltc2497-core.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iio/adc/ltc2497-core.c b/drivers/iio/adc/ltc2497-core.c
> index 9b8fd9c32364..d337ed96bbb0 100644
> --- a/drivers/iio/adc/ltc2497-core.c
> +++ b/drivers/iio/adc/ltc2497-core.c
> @@ -180,13 +180,8 @@ int ltc2497core_probe(struct device *dev, struct iio_dev *indio_dev)
>                 return ret;
>
>         ddata->ref = devm_regulator_get(dev, "vref");
> -       if (IS_ERR(ddata->ref)) {
> -               if (PTR_ERR(ddata->ref) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vref regulator: %pe\n",
> -                               ddata->ref);
> -
> -               return PTR_ERR(ddata->ref);
> -       }
> +       if (IS_ERR(ddata->ref))
> +               return dev_err_probe(dev, PTR_ERR(ddata->ref), "Failed to get vref regulator\n");
>
>         ret = regulator_enable(ddata->ref);
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
