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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C45BC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:10:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A7620737
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:10:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oiVayILf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SQC6zE+/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHv8XBuv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A7620737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5eOjoeq17rEmcFNV1cK3W3iUCfTBphpuFJQZ0zPc20E=; b=oiVayILfkCaAE9gCR7bLvoGjm
	1JsiwcPg58talcnZM4c652q1wc7wiOQ1bwrwGIsC3IL4oQ1g+0k8F3IAcqXH46ul5f4SOM1H1+v/y
	52zE6rfO/tLW5Ra6jZK+vytEHmi48M44pM3v2tH9aDfXHs3m0AOiWMLwwdNogPZECDxnqfKaNhAj2
	Z9lMBSfUAL4JrKS2x7r5xVl9IPsJ8FWxrIqmlafU1qzXemJYp/SXR5SG4JS/BLH8iYJYJd1Pq05C/
	4hq9IAr/e+sDbWgoLt/+ODB2sFALFp9n368zoiLswxC+YhvxUJQzbdYE9chSZK2R+zDAsSXFFt6s0
	K5I7UfNQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBODu-00053L-JB; Thu, 27 Aug 2020 20:10:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBODW-0004rj-4B; Thu, 27 Aug 2020 20:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zKJLemoVLYYxLBYCuDxkTU6hysuqtvkOfMWKltUpHmg=; b=SQC6zE+/ZqcnN96n/cjpDrLqlS
 todoPzIwnI98lgrMYxb9nxQkvQl4NpOZacXxq5LYJbzg8bC5b25uNgudTavr/Nbu23eu5n4Qd23O5
 skEeErG6CY7jUazRJD5czk2CHhnOLiORmVnI9VapNfIB3zJjtYRKTcahW+/nxgIvqjYSmZ6F9I8jo
 ogYycnDY4WFTJiVoHZ4SMwdxRnVnjh3It5l5lBwaJazgu8ePcwnRg3AM/i6KKXF2SVYZSHg3xDYbq
 zAI8Qopvpp7d9hOUcJU2jP07tr64G5LySu7KWzDuGBasAyOcFxda0pRrgh4XNdjM77ZJjZf0p7sBl
 u8DrwTNw==;
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNzs-0007cN-JM; Thu, 27 Aug 2020 19:55:47 +0000
Received: by mail-pj1-x1043.google.com with SMTP id n3so3096335pjq.1;
 Thu, 27 Aug 2020 12:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zKJLemoVLYYxLBYCuDxkTU6hysuqtvkOfMWKltUpHmg=;
 b=aHv8XBuvf3mu31R7gKeKtuhgl1EoOsKrQs5CzuB4CzH9W+US75wwPQkCadexNhNh8Y
 0aNGjmQg3w5t6xy7olIU3pLgnxAKjeBpK4hvGZeHopw6+XaKY3sCmgG8BERcRAN5hbty
 o90oICnyLq0PNZgSAc9Vx68ynwtaBo929qt8T5KVuCBUcgZ8iN8NKp4zsjEHhXsubYNi
 i20SB1o6xkpoYW5/YSmIBPyAI7ziv/N6WHGyTfxG80rFCPalXkVksf0FNDPmLSK41pL4
 NumTs+7qpXLhoWktPnOAmSOHDxt0X0RQs0eC41ysk8HCQtMo5qeBU9DzR1qJh77FoN7c
 QTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zKJLemoVLYYxLBYCuDxkTU6hysuqtvkOfMWKltUpHmg=;
 b=h6DPjkDiEfWipJfaXnW9vF+NMe3G0oV32yoi/N8R4QaBO094QHT54APDug+PQLZz8i
 3Hzn2h/14VMYB1OWQVsON1jz5s/xtRTZkc8Nb7gD+ut93aXYDxVpuYXUcbDLHoFSfh8Q
 RiMAuBe3lqhhlheJexw9mjOpJtGTuaNORRn9eQvsSiOmWJzycrNHsegOBC7qdoDyPdty
 4nUx0kKwbHLkOfC0OYZ4b9WGB4F9IzsFQxqVgtlIkXSsRvum3n4wrAvZv6bMWNZZDSOH
 YZ4eqmIfRt8KJwDSkv8LH1TncEGdK4qGWeRlj/JsS3oWRTm7tT+Fofel37qqWa1Ak+Nf
 V+lg==
X-Gm-Message-State: AOAM5322XYLaOd/O/S/nUEySGhMKYZJuwqKh2uvX6ujz2tExZ2VC1vqs
 fYJa/kQkuggoNihfGTSY1oDbuBOF2cjCTvowKgE=
X-Google-Smtp-Source: ABdhPJzWsp6WVsNzpr3PrSg5dBnXCuc4a+cBQMZrivfL7x35pwluAfdNM04pSMxxwhkDuruCwpYH6X8QYAVfVIkpaUg=
X-Received: by 2002:a17:90a:e7cb:: with SMTP id
 kb11mr384454pjb.181.1598558141774; 
 Thu, 27 Aug 2020 12:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-11-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-11-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:55:25 +0300
Message-ID: <CAHp75VcQHTeAtw7zKkie+9re_GRpgdDKrR+Fq-77+mVEYDcFkw@mail.gmail.com>
Subject: Re: [PATCH v2 11/18] iio: chemical: scd30: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_205544_773491_FAE1D5A6 
X-CRM114-Status: GOOD (  17.85  )
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
> Acked-by: Tomasz Duszynski <tomasz.duszynski@octakon.com>
>
> ---
>
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> 2. Add Ack
> ---
>  drivers/iio/chemical/scd30_core.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
> index eac76972f83e..4d0d798c7cd3 100644
> --- a/drivers/iio/chemical/scd30_core.c
> +++ b/drivers/iio/chemical/scd30_core.c
> @@ -705,13 +705,8 @@ int scd30_probe(struct device *dev, int irq, const char *name, void *priv,
>         indio_dev->available_scan_masks = scd30_scan_masks;
>
>         state->vdd = devm_regulator_get(dev, "vdd");
> -       if (IS_ERR(state->vdd)) {
> -               if (PTR_ERR(state->vdd) == -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -
> -               dev_err(dev, "failed to get regulator\n");
> -               return PTR_ERR(state->vdd);
> -       }
> +       if (IS_ERR(state->vdd))
> +               return dev_err_probe(dev, PTR_ERR(state->vdd), "failed to get regulator\n");
>
>         ret = regulator_enable(state->vdd);
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
