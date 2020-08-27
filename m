Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E61C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 11:26:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567E722CAE
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 11:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vwz5pdId"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567E722CAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/d2R1v0/WbX0bQkGPBIAC/+jkN+G9dMvHFAnFtjTBb4=; b=vwz5pdIdkmoCmJ6hDjCCuSwV8
	97f6ZAF4AZFCQRQrmWTVhkQ1UF8UIIOEqX2Z+kJKuFn4V0RYYIby4Ap6tE5Nqumk2EtYGe8ErM5Go
	ivWRVi2wcHo88IxthxQMRgv5ONF7YhCKa6vNyZr3S1BJYxRMZRbslZlDrRLXEKEWLjes7Whj8Sx0B
	1HLJwHsfPubQPU7Ey0OAkdQbVIXZuY5lY5aoV/rSxND9DNI7s+pF0Ev3UPZ3O2HhyH/15XJRvg8Uv
	G1H2i7h3CW7TIIwkkc7PhV1Fm4UN6eQlwlh9tyO1TY9f3AkocnQ9ISa+NH/bxwEoOvpEY5OxzCALA
	QOu3Gq7Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBG2o-00060y-KW; Thu, 27 Aug 2020 11:26:14 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBG2m-0005ze-6D; Thu, 27 Aug 2020 11:26:13 +0000
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 386C1FEB9735C037E07C;
 Thu, 27 Aug 2020 12:26:06 +0100 (IST)
Received: from localhost (10.227.96.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 27 Aug
 2020 12:26:05 +0100
Date: Thu, 27 Aug 2020 12:26:05 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/16] iio: accel: bma180: Simplify with dev_err_probe()
Message-ID: <20200827122605.0000770f@huawei.com>
In-Reply-To: <20200826145153.10444-1-krzk@kernel.org>
References: <20200826145153.10444-1-krzk@kernel.org>
Organization: Huawei tech. R&D (UK)  Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.227.96.57]
X-ClientProxiedBy: lhreml715-chm.china.huawei.com (10.201.108.66) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_072612_375861_8D605F2E 
X-CRM114-Status: GOOD (  16.02  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin
 Hilman <khilman@baylibre.com>, Marek Vasut <marek.vasut@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Alexandru
 Ardelean <alexandru.ardelean@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Beniamin Bia <beniamin.bia@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 26 Aug 2020 16:51:38 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Please make sure to send v2 to linux-iio@vger.kernel.org

> ---
>  drivers/iio/accel/bma180.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
> index 5b7a467c7b27..448faed001fd 100644
> --- a/drivers/iio/accel/bma180.c
> +++ b/drivers/iio/accel/bma180.c
> @@ -1000,19 +1000,15 @@ static int bma180_probe(struct i2c_client *client,
>  		return ret;
>  
>  	data->vdd_supply = devm_regulator_get(dev, "vdd");
> -	if (IS_ERR(data->vdd_supply)) {
> -		if (PTR_ERR(data->vdd_supply) != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get vdd regulator %d\n",
> -				(int)PTR_ERR(data->vdd_supply));
> -		return PTR_ERR(data->vdd_supply);
> -	}
> +	if (IS_ERR(data->vdd_supply))
> +		return dev_err_probe(dev, PTR_ERR(data->vdd_supply),
> +				     "Failed to get vdd regulator\n");
> +
>  	data->vddio_supply = devm_regulator_get(dev, "vddio");
> -	if (IS_ERR(data->vddio_supply)) {
> -		if (PTR_ERR(data->vddio_supply) != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get vddio regulator %d\n",
> -				(int)PTR_ERR(data->vddio_supply));
> -		return PTR_ERR(data->vddio_supply);
> -	}
> +	if (IS_ERR(data->vddio_supply))
> +		return dev_err_probe(dev, PTR_ERR(data->vddio_supply),
> +				     "Failed to get vddio regulator\n");
> +
>  	/* Typical voltage 2.4V these are min and max */
>  	ret = regulator_set_voltage(data->vdd_supply, 1620000, 3600000);
>  	if (ret)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
