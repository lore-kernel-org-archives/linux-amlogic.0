Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537F0C0015E
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 07:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/0AKfbK3DpREi4NgCOwvFTwGOgBdUQT2uLU3fSKGE0=; b=Bj6t3E9sq02dMnfjiMbAfP0R0s
	lYqqlgw8GyQBnY/+QeS8XmissLNrsL+PlfVRsZbrZ4Ewso43onlau9lbQhDiTp/9GWQeFQicZ9jLj
	BrWNLxgnCCCjdEYdFS8JZdKJHOb73f2CWeqHOr3JKEV9xqdBXbqXfuVjX08ObZ/CugjHpKlwvqUs4
	uk0/b8xF+8xyZqD1yRkpA3bYiDkEOzV6icxKU+/8R/g1zkHzsUvsV7mAyviBAKPC6EXShB1FmHmh5
	ya6ZLWFwiyNfFmkdnTtm7AMyiMdjjdtFKka+zK91UjFbi+zPbIXyBag61m+/khCy8/b/BWE7Uls85
	uL8bb45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgFz-003uqN-0X;
	Fri, 07 Jul 2023 07:51:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgFw-003upE-33
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 07:51:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so1580640f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 00:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688716315; x=1691308315;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fNjkrmHlVFVreNzwzaKJvD6JsSUBJp+mLtd6ewiqgXQ=;
        b=sWEH5WwI7bhnW/i/z8rWRazBTtRWAFrJJo0dkgILYH6YOicm2QmFZi8o+uCxrp0glq
         4soNB8RNtfI907MoOU4CWJDc/pSkVhzdHcoX438KWZ0RXpMBQqnU10rYnQ2EKyTI9RLW
         nvVTZjaHdOgKF9KjjzquiPMIGEHbXih3qzuOFrOnOUDgiQcdaNs/s2XshxXS+FL1pxzn
         Uo58f6Lj8t8PPDBpRZXwXuNTDBBTP8Fkd3isks81T9OUdVxfcgS09JmFJ4+vyjoqqVui
         uu+2IXHQJoWHSmPiJOdm+XdkGLpbbv+1Eo2s91QCOGWiqMRG1LzMY9DA8UhT0H8rjZrJ
         AXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688716315; x=1691308315;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNjkrmHlVFVreNzwzaKJvD6JsSUBJp+mLtd6ewiqgXQ=;
        b=VOLl+HepLm8VAO38sCeUXAItgNVHnR2H9gugjkwM8yJGBGHxpI8oP38ZoN289CiwGP
         Nt2T3KngyqM/Tsd4aIPoWLgBIs9miN+YsUntOgE1tZyXb9cX/FdV9PaTmd1cBHDf1T8c
         zkJnwi6MUQRureA3zXuG21lwp3MuxcEfHZV2QOYLQqVWMsRz4fLt5PTRMkA95Hc9klQI
         Klfe1cqchERathrQya1wLASjkNKkMqlC4PYht79oZxarycvUcgHT5lhqCijQJ4jYpPFp
         l2jtxVH9aYWBFR3JbviHcZmztOYbRdVtQO1o0zok75UGyA3BXjE/wUPAqqWLjgD9tZ4v
         Nuvw==
X-Gm-Message-State: ABy/qLYVc/ZLwqMNdF/gkee/Ssmy3eANcqdxIjV/K9ydvzuvML2MI5Gf
	ekJzWaOCi1dIv/Uq02Cp+dwPoQ==
X-Google-Smtp-Source: APBJJlGUGxXsBpTAc6TQLncOqANnfeX8QE1aA12YKms/Zgz+2Sm5TxR7hq055te3JAWT1/YWJNmuKw==
X-Received: by 2002:a5d:452f:0:b0:313:df08:7b7e with SMTP id j15-20020a5d452f000000b00313df087b7emr1554524wra.14.1688716315590;
        Fri, 07 Jul 2023 00:51:55 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id o5-20020a056000010500b0030c4d8930b1sm3762071wrx.91.2023.07.07.00.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 00:51:55 -0700 (PDT)
Message-ID: <f5ffd795-bc09-e146-6d77-a631bdc6500e@linaro.org>
Date: Fri, 7 Jul 2023 09:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] spi: amlogic-spifc-a1: add support for
 max_speed_hz
Content-Language: en-US
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230706110331.19794-1-mmkurbanov@sberdevices.ru>
 <20230706110331.19794-3-mmkurbanov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230706110331.19794-3-mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_005156_987610_D24753CC 
X-CRM114-Status: GOOD (  18.08  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 06/07/2023 13:03, Martin Kurbanov wrote:
> This patch sets the clock rate (spi_transfer->max_speed_hz) from the
> amlogic_spifc_a1_exec_op().
> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> ---
>   drivers/spi/spi-amlogic-spifc-a1.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
> index a92e4fc23396..605e9e40455c 100644
> --- a/drivers/spi/spi-amlogic-spifc-a1.c
> +++ b/drivers/spi/spi-amlogic-spifc-a1.c
> @@ -107,6 +107,7 @@ struct amlogic_spifc_a1 {
>   	struct clk *clk;
>   	struct device *dev;
>   	void __iomem *base;
> +	u32 curr_speed_hz;
>   };
>   
>   static int amlogic_spifc_a1_request(struct amlogic_spifc_a1 *spifc, bool read)
> @@ -235,6 +236,21 @@ static int amlogic_spifc_a1_write(struct amlogic_spifc_a1 *spifc,
>   	return amlogic_spifc_a1_request(spifc, false);
>   }
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
> +	return 0;
> +}
> +
>   static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
>   				    const struct spi_mem_op *op)
>   {
> @@ -243,6 +259,10 @@ static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
>   	size_t data_size = op->data.nbytes;
>   	int ret;
>   
> +	ret = amlogic_spifc_a1_set_freq(spifc, mem->spi->max_speed_hz);
> +	if (ret)
> +		return ret;
> +
>   	amlogic_spifc_a1_user_init(spifc);
>   	amlogic_spifc_a1_set_cmd(spifc, SPIFC_A1_USER_CMD(op));
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
