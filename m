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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC574C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:00:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A37A6207CD
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 20:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3eA4iG7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9Avjr9T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A37A6207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h19dL8Bz+RMgAfLIG7ZTiZSh5YwqYoBAALDhULHdonI=; b=b3eA4iG7jYByJkbyZLMl/exg6
	vaNWQMqTdZ4DlyslyXBUrNEcNW1Lr182qPnli3wlYNcibe54RWKKHUKOgqoPMROcVBI5s1ewdwb/C
	aQ89BO6akZyCrpUpNn3jscX4wB1hFz2Ua4lhrUXp+C7mjHKe1tVm7QceIvqgIh9Y6xSpnNJIMzCox
	2Y4Jlmggm7gwpgh4IGX/ILqV1NkmhVkfBeJLks3ZBcGLkIWVATaf7gV04FmPpjHbpoVnagxID3MzI
	TUf2Qt7x6cLxl8KcrNJAXsr/Rc5rmYQZoJhV3z9BOdjgJcgNg15Ykn8iouFnzMumyZRVXTzabJIyt
	TDCQqIp9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBO4T-0002K6-Fj; Thu, 27 Aug 2020 20:00:29 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBO4N-0002Hd-4k; Thu, 27 Aug 2020 20:00:23 +0000
Received: by mail-pg1-x543.google.com with SMTP id g1so4110338pgm.9;
 Thu, 27 Aug 2020 13:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7FsTR8MREGabBVt8LZ1j+20Xw6tV3sc64t+TrTmz1s=;
 b=H9Avjr9TBzYfwPOkz9EdvQOD/Hp2R/foNgj3n1RhDeUBaZ+T5lK3N+jmOVnF21fOPt
 cveijGliKTaLjmDGdxLWA8yVPczBusBiXh8fEduLfVMgyZ0AxHteuhJDmjK+uvJjLgPq
 hM8m0PARzvkixd1ZpgNhwBjSF1Ql6JaTzlrCF6hmmq+YjKNxQIvus1kjO8clKsH8C/t2
 Nr82ezEM0MgwJqZL7nrR3nrQCfjaqM4GPuz/FwXoB+2fw+2pY2HJ58nma+QCs85J+WsJ
 mBjjdnKmcvQsh0zyRUoV3RFVkHHilb03CsDzzWN0tKOzpTSWidOkEcJRc4N+Npaqr7Eh
 iyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7FsTR8MREGabBVt8LZ1j+20Xw6tV3sc64t+TrTmz1s=;
 b=kYb2JSFWBMDcP4aaa5gNwwrhc42a53FF6V2ukG4oTuxwomsCOfNhQ0Q/08yQ0c+/1s
 ZaORf+7EZ7OKO8gPnuN4APS5JmshvvsMnfD0kzMYBCQhoqbr7/dI+Z3C+nosSm6f2a3b
 OVRoFSUAHrDeCnsYT4VQp/cc46nPCNdFkJBEHNcPfii9v+Wqu2vM21T/IWr6bVgYtXeQ
 dypKfXAq5LuWoAwoAb2C152WwvyQF1pMpkQuEzlla4zt5nwWRrJOvUnhRL0ccH79dTZN
 oL0qwVstoyrtTKUZGXmSV/Xn2mcL/wjyL7F3FI5tCLENYCMMyB1Nr//pk2vSiQGPgh4u
 dCcg==
X-Gm-Message-State: AOAM533pAqSMKmC9XjVtSVZLU49q8CFuKa2nKnqHqQBrYjoZ8kxTlC6P
 3PuyopXn6WItM/S0jFO0jBGaEnK0oge8ZRBsE2U=
X-Google-Smtp-Source: ABdhPJzMVgucetaUrBARc94LCHK9ltEz39VRjcWxPvDTspL6QeAi4Dc29DqGVOxpjkKfh4YtQxfRbS/CdGszBd3FklY=
X-Received: by 2002:a63:f24a:: with SMTP id d10mr15673608pgk.4.1598558421035; 
 Thu, 27 Aug 2020 13:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-14-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-14-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 23:00:05 +0300
Message-ID: <CAHp75VdQYzuiXBXYBrwaLKzZDZWtyT1_kLAWVU0G7fXTi8fAGQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] iio: light: isl29018: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_160023_291851_A77A9873 
X-CRM114-Status: GOOD (  19.39  )
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

On Thu, Aug 27, 2020 at 10:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/light/isl29018.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
> index ac8ad0f32689..2689867467a8 100644
> --- a/drivers/iio/light/isl29018.c
> +++ b/drivers/iio/light/isl29018.c
> @@ -746,12 +746,9 @@ static int isl29018_probe(struct i2c_client *client,
>         chip->suspended = false;
>
>         chip->vcc_reg = devm_regulator_get(&client->dev, "vcc");
> -       if (IS_ERR(chip->vcc_reg)) {
> -               err = PTR_ERR(chip->vcc_reg);
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&client->dev, "failed to get VCC regulator!\n");
> -               return err;
> -       }
> +       if (IS_ERR(chip->vcc_reg))
> +               return dev_err_probe(&client->dev, PTR_ERR(chip->vcc_reg),
> +                                    "failed to get VCC regulator!\n");
>
>         err = regulator_enable(chip->vcc_reg);
>         if (err) {
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
