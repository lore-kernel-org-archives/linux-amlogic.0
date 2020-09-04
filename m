Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A901AC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 10:42:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE5D20770
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 10:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ock0uz8S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lf0HxtXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE5D20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ifno46Xk8VbWH4l8Xyio2DhoILRNI2ILpVTExlh6t3Y=; b=Ock0uz8SfeW8YBZg7DdkRiSfp
	tMg+XqcBIdvdFINIYwGc6/9cEXFY5m4MheVyOCf+Ou1Ukcw7jxOhTRhKuE30hduonar778ittwpZy
	iznfBLADmiOJlZ2gnw5VUjEFqLTLajCjlxZC1R1imXfjgB6iwELgGFHn8iByB1MJsxm9lpuNIXxS/
	3/4DXV3u9jvtAxM1ZoxBaNyI4E0Qr1nnG3ZG07Li5xZBKc++OYI16U2pHo3opfhLirjgwXUdGMi/A
	5m1UiF2yP4zfaQ5SHe3BGTIcURiG+SwfTHY5iP29rcftW3xhnKAfQuUgqgNkVacy6VoRtX8s3nDjN
	ewZ8FT/ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE9Ar-0002um-Vr; Fri, 04 Sep 2020 10:42:30 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE9An-0002sk-De
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 10:42:26 +0000
Received: by mail-pj1-x1042.google.com with SMTP id g6so2876903pjl.0
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2020 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XIRGdkogEbr2UU4S8C5/CFso+vuQ+g2531Q9ZkBMLUI=;
 b=lf0HxtXKMSyYzKLuSZFXF6q+/8QS2LhO8X4eKUQrQw27IOgZw9be6+E5iTpwCaRJ+Y
 lyKPPcsNegehi3VOvhhhAzzIusL4QB6dXCsO35c7v0Fp5veXhVfZosJaSZi/G4qTNGSU
 cNkdqloEiwKlqfMOBW/bWyzozp0NFaRbDqojxFe8k760+XTlP8ByHp+rwx8EnyDjtvtZ
 vErWrDcP9K+WXouHmumZN4kVZWTPSbKMIf1ZJvFO55ui1QQ6Bw9Bw4DJBimDzQUAWIhs
 TqJ+H/xKlfnggpy6RpbkxmV00XLVpT78HaH84BeTUwDcT9jJqwlqlYmtlKnFV3ce1ISp
 xQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XIRGdkogEbr2UU4S8C5/CFso+vuQ+g2531Q9ZkBMLUI=;
 b=ciF5P7cerZnI8jw/tIkyYsxds+/sN1XNmFL8LaS+VIS/0PnekIIbmjYdGPyV10pHc4
 RgPiyHsXVJw5vy297gHs+rcCHs2ajZgg3j2ZzOzsPWxY6ARmo6bNyY2NNEgxdEtDbQqn
 iPT1ChearWUcHbm2qT9Ku8ft7C69YnAXvn/D1v+mvKs/SvdTbViE8ZJ1aLoTnA3Js41s
 njz0D6iNlkugWTUzSoH7FNmDBCPmo6OEHKEj1nrWm9+MDz2cA6hNPQ91cAW4xWc7yPST
 21970vTE8LBHGH+LWuuG4sbRyncOpVH8fA5ajXwCoRGTe23s3f6X3uNCsnOn9C6BkggD
 qF3w==
X-Gm-Message-State: AOAM533e3trZcQwP6mgKfXFSZ8P1LJNyDp3qOANA5mO/7q0Ew7PKRwnw
 27HYIBhtQIHsv6ASI5JorSZD
X-Google-Smtp-Source: ABdhPJx5DfeJqeWBG7RepL9K/iqki0O/TK0I5SNGWwxqxq5OmeX0PIlrHDrBhn1zJA8hoV9b6IRjYg==
X-Received: by 2002:a17:90a:8589:: with SMTP id
 m9mr7675652pjn.109.1599216141746; 
 Fri, 04 Sep 2020 03:42:21 -0700 (PDT)
Received: from mani ([103.59.133.81])
 by smtp.gmail.com with ESMTPSA id s9sm4985194pgm.40.2020.09.04.03.42.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 04 Sep 2020 03:42:20 -0700 (PDT)
Date: Fri, 4 Sep 2020 16:12:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 6/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 are newer than 5.4
Message-ID: <20200904104211.GA4056@mani>
References: <20200903232441.2694866-1-dianders@chromium.org>
 <20200903162412.6.Ib121debfb18e5f923a3cd38fe9c36aa086c650c5@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903162412.6.Ib121debfb18e5f923a3cd38fe9c36aa086c650c5@changeid>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_064225_480937_D82E1B4D 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 swboyd@chromium.org, Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 0903, Douglas Anderson wrote:
> This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> probe") but applied to a whole pile of drivers.  This batch converts
> the drivers that appeared to have been added after kernel 5.4.
> 

Backporting made easy ;)

> Signed-off-by: Douglas Anderson <dianders@chromium.org>

For owl-mmc,

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> 
>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 1 +
>  drivers/mmc/host/owl-mmc.c           | 1 +
>  drivers/mmc/host/sdhci-esdhc-mcf.c   | 1 +
>  drivers/mmc/host/sdhci-milbeaut.c    | 1 +
>  drivers/mmc/host/sdhci-of-sparx5.c   | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> index 53e3f6a4245a..7cd9c0ec2fcf 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> @@ -903,6 +903,7 @@ static struct platform_driver meson_mx_sdhc_driver = {
>  	.remove  = meson_mx_sdhc_remove,
>  	.driver  = {
>  		.name = "meson-mx-sdhc",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table = of_match_ptr(meson_mx_sdhc_of_match),
>  	},
>  };
> diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
> index df43f42855e2..ccf214a89eda 100644
> --- a/drivers/mmc/host/owl-mmc.c
> +++ b/drivers/mmc/host/owl-mmc.c
> @@ -689,6 +689,7 @@ MODULE_DEVICE_TABLE(of, owl_mmc_of_match);
>  static struct platform_driver owl_mmc_driver = {
>  	.driver = {
>  		.name	= "owl_mmc",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table = owl_mmc_of_match,
>  	},
>  	.probe		= owl_mmc_probe,
> diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-esdhc-mcf.c
> index 71bf086a9812..ca7a1690b2a8 100644
> --- a/drivers/mmc/host/sdhci-esdhc-mcf.c
> +++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
> @@ -509,6 +509,7 @@ static int sdhci_esdhc_mcf_remove(struct platform_device *pdev)
>  static struct platform_driver sdhci_esdhc_mcf_driver = {
>  	.driver	= {
>  		.name = "sdhci-esdhc-mcf",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  	},
>  	.probe = sdhci_esdhc_mcf_probe,
>  	.remove = sdhci_esdhc_mcf_remove,
> diff --git a/drivers/mmc/host/sdhci-milbeaut.c b/drivers/mmc/host/sdhci-milbeaut.c
> index 4e7cc0680f94..148b37ac6564 100644
> --- a/drivers/mmc/host/sdhci-milbeaut.c
> +++ b/drivers/mmc/host/sdhci-milbeaut.c
> @@ -333,6 +333,7 @@ static int sdhci_milbeaut_remove(struct platform_device *pdev)
>  static struct platform_driver sdhci_milbeaut_driver = {
>  	.driver = {
>  		.name = "sdhci-milbeaut",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table = of_match_ptr(mlb_dt_ids),
>  	},
>  	.probe	= sdhci_milbeaut_probe,
> diff --git a/drivers/mmc/host/sdhci-of-sparx5.c b/drivers/mmc/host/sdhci-of-sparx5.c
> index 747f108a0ace..28e4ee69e100 100644
> --- a/drivers/mmc/host/sdhci-of-sparx5.c
> +++ b/drivers/mmc/host/sdhci-of-sparx5.c
> @@ -255,6 +255,7 @@ MODULE_DEVICE_TABLE(of, sdhci_sparx5_of_match);
>  static struct platform_driver sdhci_sparx5_driver = {
>  	.driver = {
>  		.name = "sdhci-sparx5",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table = sdhci_sparx5_of_match,
>  		.pm = &sdhci_pltfm_pmops,
>  	},
> -- 
> 2.28.0.526.ge36021eeef-goog
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
