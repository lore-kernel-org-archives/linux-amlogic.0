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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10C8C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:49:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80948207DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKT1vbxD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vMMPvCok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80948207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dcfzox22+Y1RUIRoPdCvOxbnIG0PbSICQTwHk0hqkhY=; b=UKT1vbxDSsxYMmOKw6p4rfaEd
	8FB9SDwaYeR169BeO2Q8dABtmtffDZiKCx71o/TMLuHoZLS8iFoFlEYv/yIrrzR878W+Val7vPglA
	nXMPKuKb9ddJrV6QTnDf5vQkJYk0QoYrKQMeGRhjxs4cE/NEVL+bp711fhIAr2bFRGNrmxRpBcjGq
	wwpnzpw5AXhts/KcvsAaoyaFHp3qZOjgg6Xw5vD0BsRdhbMaMFJnc7kI986p8ZZuJ49h0qnnlW8Vn
	wn4DCeq3Z1vfdd02LauIi73b5pgp4FZjMFo5hR666+CvkDSRsKTO3uwDkwKn1/Y8CSG4klyulCWQS
	rsOTPcHTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNti-0006Bb-It; Thu, 27 Aug 2020 19:49:22 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNta-00066J-EU; Thu, 27 Aug 2020 19:49:15 +0000
Received: by mail-pg1-x541.google.com with SMTP id l191so4105059pgd.5;
 Thu, 27 Aug 2020 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WpaQTjLfV7KuSsjB4F9wP9EPb6gXE6IBxqNf6Q1HCtA=;
 b=vMMPvCokJT5yJ29bs2poZN7/8ToLpy92ObHhrh0C8jSwKA6UlkjHuqmgZcPeY7DxzO
 I527Vpj4YlMmK+NwDxWuWuL2jzRXPBfa1GXkjw5WtJTqO3EOEUYOhy/0ieitpsqXWGxQ
 /OYxu49IXfLq1+YzrROvYpT3LyQzO3XZzftFohTTVRQGc6KisIh1PUDSBLIKKWtvbOxf
 MaNH6qP0GQGJEj0Fmt5z/vqAPulC6fszq4aXwBZ3hhpUOFytvHzuwkz0so+SpYkCl5RG
 t2h2mlFXF8+cdNBkM6DJn1VX2mejLI86PVuKsijPZt8fimCyC25oU78Xmoy+qQlrJbAE
 Ec2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WpaQTjLfV7KuSsjB4F9wP9EPb6gXE6IBxqNf6Q1HCtA=;
 b=C0HC0XQD1Bsrmcmo8SDTNIUEsPBqGi0sXgejN23wiu49Gne/FTvn95W20Jo1u7w+f2
 NkFXq0B9TMXyTfbRlNpOoTvPtkg8o4X5f9xaMRsmu6LmoSdT2bzYIT71c0Oo0EtdyQp/
 DURAWvhTuxrbGPfRHrAMJmgYQNCLszrxWOhvYdM6a/STZmA9Z7PyKc86y8Vvu2svAFVN
 41tl61TjS9ZAsO50HP7w/pVnAPG6ytKq0y7K0KZW8rwyHQi0SJ6Q35pZFb95Yvx4UDV6
 GikhI5wOqqW9/glxekKrwpGLKK/H7u39RKa72OxqUY0pD7dGRRZ/2tvsx3X2ZmWKgF/J
 qLQg==
X-Gm-Message-State: AOAM532Wa3eers1y2ludhkmrEe3w8otqgmEGKhC4VEkO8urnRx+hh71e
 4F9bVfmhrDOrPmDtf8qaTWHDQ7VQGaSf8zsj/TM=
X-Google-Smtp-Source: ABdhPJz1ZTuLx8D3lXV7Ue7cNy2v+gh/dlv/Okbh2nb8veYRd//0muFAck8Ma4Jv7DzINNSNTJ3Y0FOdg3nrFU2hNjs=
X-Received: by 2002:a62:2587:: with SMTP id l129mr18131209pfl.47.1598557752461; 
 Thu, 27 Aug 2020 12:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-6-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-6-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:48:56 +0300
Message-ID: <CAHp75Vd8ttMmOx28V3wXv5pY1fbru8aUV=fTBoJyZJ=CQRo7hw@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] iio: adc: meson_saradc: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_154914_496252_65A57F10 
X-CRM114-Status: GOOD (  19.29  )
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
> ---
>  drivers/iio/adc/meson_saradc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 93c2252c0b89..a9d06e8a576a 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -719,11 +719,8 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>                 if (ret == -ENODEV)
>                         return 0;
>
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(indio_dev->dev.parent,
> -                               "failed to get temperature_calib cell\n");
> -
> -               return ret;
> +               return dev_err_probe(indio_dev->dev.parent, ret,
> +                                    "failed to get temperature_calib cell\n");
>         }
>
>         priv->tsc_regmap =
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
