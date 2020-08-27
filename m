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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27322C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:55:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3FD12080C
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:55:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sXyPMdQe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmDKpG7J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3FD12080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aiIFzj3zIOY7SWYMlQrHp8AdsROOAbT9RLPMjVSFKDk=; b=sXyPMdQeDsAZEu0lfM4LDbz+F
	3NcK/cdsfvtsN21Z6ahvzBg4W3pSYRp/hLzB0rZOpV9tbEQsyQbX82EeGgqAN7P+GVGazjPdhkbbv
	9X2FuR2eiUc7lD8Ofc5eR4wwJNGlLMNuo4QjYXDHDj/0g6Wl65vDtZYOaXtrMMdBhvYRbTe6ffRI9
	g+vZqArrsMRNcMg4khWOwZOPNQrO/cTYY2g/9aQnU21oSW4GdpphAQ0mhduymtDeVzhz3pBeOykk2
	k270Tt6a6hhwjGxiKy66i/V6+cEYZrsgoVJSLZBQuDH55oKMHITv/ZvmQG+U22STWhDw4aK34CNLY
	3X8kT16zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNzW-0000qn-OR; Thu, 27 Aug 2020 19:55:23 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNzF-0000kL-2e; Thu, 27 Aug 2020 19:55:12 +0000
Received: by mail-pj1-x1042.google.com with SMTP id q93so3097110pjq.0;
 Thu, 27 Aug 2020 12:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1iCBP+9jZBWChmw6UiUb37gEZ3nyFFfurQpHrGXgKOo=;
 b=fmDKpG7JsNZWYR4WnBcEBetb/oHsOCdtX523ndIe2IZMPYsIrBIKn1XtshfI4TqHwu
 D08AXB8uTUFH9zriG8lI0eNgDKRlaSQ9a+EWr/izTx93LB42f1p07HwFExW+QrUgdzyd
 ilaVRZ8+BDgLBgmCDQoEuZoEJTPlFaZWucf3rXVXkqEzzE9MpG9unIWKWpgco9V4FBG8
 CPvCh+d3lPSpQGZwMLm0Rg+2Ygk4XldfIOOPsXF+p9+3iCHmyKGE8aFMr8pYT4nRCAqb
 eEVyijsnhpi5gSlqNea/keX3CLEEgpzZulaCr/n7I8TIfrBd63KA70brURiKiTw0S43y
 LaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1iCBP+9jZBWChmw6UiUb37gEZ3nyFFfurQpHrGXgKOo=;
 b=krhqmCeiX0AUimYckGFuxL7sqsd//0Qhogqp6IVIT6s7Gp/OjTeL1G6KfzFAolUq33
 ZrD1c4JOu/bltTAQwyMEm5XZid2chZe16rVbc6YHyZ041RqfhJ0SuA0GFc0pTJNd0cO/
 m98DKtlvQTn5xghfjpRwFsCRDdBUjIqdlyngf5TcY4uhxWJAYVXI2NCD4IYsyTXMTsJ1
 R28SDJSCh/xC+2CEvdMD4ZOJ99UgH8sXMi8bMtWUP6qf8fbyd/BmR/RFVQZIrYJ4JlKg
 z6blqTOruMDCJcEaoHWl2YnSI+iZKaasBWWZcNNk1RrZWe4AujE6yzCxFWXhYip3JSsR
 HEGg==
X-Gm-Message-State: AOAM532MnNzdHaN+E5JH4CcEDc9NYXWXtAu8H1Lg948EcdxPYYYe896+
 y3BZyy/PtUaj6WIHnXa9xguPsw/cWn7LpkFc1dE=
X-Google-Smtp-Source: ABdhPJy3db6CIQJ4K7OGhMgQan8eyYxEg/iBHcrwmiOZE1uEdOWivJYmfC67a+ptd7Jp7WYZumerqKG+TuNU5caIQKE=
X-Received: by 2002:a17:90a:2c06:: with SMTP id
 m6mr418944pjd.129.1598558101205; 
 Thu, 27 Aug 2020 12:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-9-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:54:45 +0300
Message-ID: <CAHp75VeH1dcn7TzdWf7N5kQ2EQeBXFyXRpRHBb4TyUrx+g4q8A@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] iio: afe: iio-rescale: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_155505_199198_30A32016 
X-CRM114-Status: GOOD (  20.14  )
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
>  drivers/iio/afe/iio-rescale.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/afe/iio-rescale.c b/drivers/iio/afe/iio-rescale.c
> index 69c0f277ada0..8cd9645c50e8 100644
> --- a/drivers/iio/afe/iio-rescale.c
> +++ b/drivers/iio/afe/iio-rescale.c
> @@ -276,11 +276,8 @@ static int rescale_probe(struct platform_device *pdev)
>         int ret;
>
>         source = devm_iio_channel_get(dev, NULL);
> -       if (IS_ERR(source)) {
> -               if (PTR_ERR(source) != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get source channel\n");
> -               return PTR_ERR(source);
> -       }
> +       if (IS_ERR(source))
> +               return dev_err_probe(dev, PTR_ERR(source), "failed to get source channel\n");
>
>         sizeof_ext_info = iio_get_channel_ext_info_count(source);
>         if (sizeof_ext_info) {
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
