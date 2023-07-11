Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C276DC001B0
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jul 2023 07:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUFW8hN9cLblTz0jmGJpcSx442NWJyJogCT8SuAHAsk=; b=tcXpK4XxFEtSAJ
	4Fn9EbXX5GuOpGE2cIy9oLFzoe0L/YGlsSGm45dFGzyUiKzvUqWUi8/8aoH1uRokBJDw/QERlEbzX
	PDqaz0QuuZMTUpo0kE85s2p0Xp1Q+PuTNz2BjA3+eswc+gTFIvmjlZefyrTZRiJYW7Ol3Jcg0JXht
	YWJE4ZOB/XM5zDClv/enSSP3LcHRT8YeUgOY0HQn6mVUCEO8PXfSQHksDXiUmsnWNYD3ZLxxP18Uv
	XBRo6BKlMH50MgeHb6UueJCGcQGevn9iqYEbmaFUNQa8qz7r0k0fzhlEZvNfNO2WgIZ4Rgz8L8YvK
	D2d2ja4naB03QP+PTQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7mI-00Dyxi-22;
	Tue, 11 Jul 2023 07:27:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7mE-00DywX-25
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jul 2023 07:27:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso55082735e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jul 2023 00:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689060417; x=1691652417;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ADbPO0cfR4g593jKsVT2jVxZ9Mioa2lxar2bSYbOLIE=;
        b=hZOL2w6YahG6Oe+83BmyGnw9dh81Wixl9VF7GhIF0jxj3Bcms+ln/raIc2BJvS0VPy
         dWS2vCx2ld7gGyQKSJDzUthbMh+S9cQz9wS8hQB3xaigGaz6W1daCt6ey6YlIu7gBmML
         RqQfHnCcK2WXuRENAO/uMiomthxYWM4/RdpIohbsQ5XDb6FM+JJja5hVn75cT7Ucvu7Y
         lFcpSYhQdyGZKZ6LbVl1yWkR7DxBvVx0FAPOOIIdmpnyIyG3/Abft8SRpcoPoAZB9JIJ
         MppOf/3AqdJZ+hA6jO0khxQFlj7j+fzEnaguDRVvpfeSbpxt1Lqajl4CmmeLzdP9sJ1Z
         m7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689060417; x=1691652417;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADbPO0cfR4g593jKsVT2jVxZ9Mioa2lxar2bSYbOLIE=;
        b=RizmbDNXjCRYW3VUYJbN20qe2NgIu29oTwoZGtrqtdz4IvyrCjpdQv4e/9BYEzeqHY
         31RWpQrliPcpVyRtSkseAxK+ocQGSueoJi5gqax7xCyUD9iCjlyuCodF/D1vrzxNadj6
         tBVJx4pZCdMqWZVk8Zfjsm4QrbrlqDnI4m9x2UKy1YgD+afTKVV/Ye2o1xxy1tCpjus+
         w//pYEcTu0dKGv9pe1APsaYgCz5xbjkwYdZd6h8N+7wlhYGiwLPTe1lgHrM+TggNcwoC
         6mEoswz7kuPoX80cpKqEXAd1JjljK16c5tGKcMG3uaYHHD8uP6hEKpZCrDVOVbzYj3FX
         V8kw==
X-Gm-Message-State: ABy/qLZnXb9EUNek61YOotXAc6Am8oQuY+Xtfe/uqG+DjnfmbtuO+mPO
	aHOzH96dWQUfY/4OcSkIW4BGYw==
X-Google-Smtp-Source: APBJJlFG7xP3kWlIhAjztkagQDMNNRwQQCBCM6HY7T4sw6w4iXF2O6xSpJHcGRvKu0zLgI2eKeSszQ==
X-Received: by 2002:a05:600c:244:b0:3fb:b1af:a455 with SMTP id 4-20020a05600c024400b003fbb1afa455mr12472486wmj.5.1689060416993;
        Tue, 11 Jul 2023 00:26:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb0:4a33:b29e:11b3:752b])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c228d00b003fbe4cecc3bsm12129242wmf.16.2023.07.11.00.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 00:26:56 -0700 (PDT)
References: <20230706110331.19794-1-mmkurbanov@sberdevices.ru>
 <20230706110331.19794-3-mmkurbanov@sberdevices.ru>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>, Mark Brown
 <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Andy
 Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
Subject: Re: [PATCH v2 2/2] spi: amlogic-spifc-a1: add support for max_speed_hz
Date: Tue, 11 Jul 2023 09:25:31 +0200
In-reply-to: <20230706110331.19794-3-mmkurbanov@sberdevices.ru>
Message-ID: <1jlefm6h8g.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_002714_900463_CD2E67DF 
X-CRM114-Status: GOOD (  17.45  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 06 Jul 2023 at 14:03, Martin Kurbanov <mmkurbanov@sberdevices.ru> wrote:

> This patch sets the clock rate (spi_transfer->max_speed_hz) from the
> amlogic_spifc_a1_exec_op().
>
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> ---
>  drivers/spi/spi-amlogic-spifc-a1.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
> index a92e4fc23396..605e9e40455c 100644
> --- a/drivers/spi/spi-amlogic-spifc-a1.c
> +++ b/drivers/spi/spi-amlogic-spifc-a1.c
> @@ -107,6 +107,7 @@ struct amlogic_spifc_a1 {
>  	struct clk *clk;
>  	struct device *dev;
>  	void __iomem *base;
> +	u32 curr_speed_hz;
>  };
>  
>  static int amlogic_spifc_a1_request(struct amlogic_spifc_a1 *spifc, bool read)
> @@ -235,6 +236,21 @@ static int amlogic_spifc_a1_write(struct amlogic_spifc_a1 *spifc,
>  	return amlogic_spifc_a1_request(spifc, false);
>  }
>  
> +static int amlogic_spifc_a1_set_freq(struct amlogic_spifc_a1 *spifc, u32 freq)
> +{
> +	int ret;
> +
> +	if (freq == spifc->curr_speed_hz)
> +		return 0;
> +
> +	ret = clk_set_rate(spifc->clk, freq);
> +	if (ret)
> +		return ret;
> +
> +	spifc->curr_speed_hz = freq;

There is no guarantee that clk_set_rate() has set the rate you have
requested, at least not precisely. You should call clk_get_rate() here.

> +	return 0;
> +}
> +
>  static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
>  				    const struct spi_mem_op *op)
>  {
> @@ -243,6 +259,10 @@ static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
>  	size_t data_size = op->data.nbytes;
>  	int ret;
>  
> +	ret = amlogic_spifc_a1_set_freq(spifc, mem->spi->max_speed_hz);
> +	if (ret)
> +		return ret;
> +
>  	amlogic_spifc_a1_user_init(spifc);
>  	amlogic_spifc_a1_set_cmd(spifc, SPIFC_A1_USER_CMD(op));


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
