Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AFDC25B0C
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cNDbZVr6jFN2NMf7RHDZPbcW9ZTOWmba8iiNVLLy8s=; b=h1RY83rL8Pttl/
	ZGZU/3YqzO3dHoAJtnJvCNPRrQq/rLxnJzf8/BvmX8brG1He296A2Kx+aoUlY/F3Z9d5NQUngUMLw
	l30kWQTXL/hnt21n9faI7flqWJkvs6maW7cpuT/Spm0Wjn2QlgXGkauEamzCve4hW3lq7OZ9/EPuR
	iYizkAxZOL8K+pJ4cD3yrfmD4w5O75QBjGQq6k95DApnWydKN5HaTvRQY/geaIXpPcfL6D6dBFWHP
	4tBF3OglRKk8D51KXA2U/3NZYH2Zs3W6tP7koxo/rbgNtKKYqz2SAwI/wb6rtJ2D33KQgBkkYZmYA
	E7doQcxp84rz/M7tKddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxnt-00CJeV-Ci; Mon, 08 Aug 2022 08:08:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxno-00CJaC-HE
	for linux-amlogic@lists.infradead.org; Mon, 08 Aug 2022 08:08:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id c22so4393181wmr.2
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Aug 2022 01:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=NNnX/w4KR5toGD9RgVndtRcxDMqXeRdCj55KEFs2Hv8=;
        b=mUVHiWqRa9/+fNjcjlhL3ZIVdEv+oiML2EZseUm4nq22f0fGCfCizZKJnvt3pe2gEO
         L9DQwRjKxKbH/F31ON/1nqMgQnqCtUZYz5NgPAVTWXW187S7lE7Rqb3FSTq39cEs85wW
         RXIuIXUXvJgNMS/Ji53LQNsRUsLHg1/qGI6RTN4+cjH9KK9M/X+t4nU5gnbNAvCePLvr
         +5vPjLCDlLCHx5+JRJe6e1zBxsWXhz2yIFhv2wjNNYGmyD4w+dDajqfrSWuXSjvZnffb
         vvYLzSOsf6TYpLhack8JnD81N3TGvSrAO/wkYwqIsmHdv6KNakq6M0BS65t9BZ2Mm9hz
         i2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=NNnX/w4KR5toGD9RgVndtRcxDMqXeRdCj55KEFs2Hv8=;
        b=W3F5tjlgpPQFSWioDkP6OffcQQDyx3vzKhMsPLrjTajbj1yLAUsgn8QKImtgPj6pF6
         ZSkyjpugpBnMKeWzOxRYY8NfH5Wln+AH8kEiTOX/yRLb9aeDdQVUQ9y1WY/QlmzayIIX
         1c4xy8YzQnr6ER1+k40v5OfKEQPwrpotabkJJQnUg61g+EpCZRaXD87DIm2pNKMR5P4l
         S1UcJg/ldN+uTUpbOu+W4WTMZsm4Z8IfU3jktqrpckSD2AtCx4gzu/RnxiwnhIjTwQkp
         YLlPpjHW++SyaaSARg7i4uRvE6WVpxD9J3me/B+hU0gEHVSrQXGOjXWpPK7jsbFaSb7N
         8uJg==
X-Gm-Message-State: ACgBeo3azvjg+RVAiZGFHB5IhXAumNT8ruUvYlfRGjSaotfzP3FIwQl9
	PjFPUFHy3jO5yax5SLKvrFY7Kg==
X-Google-Smtp-Source: AA6agR49AonvRm2M3vcHwa+yWIj4oRnXBmIYvyOUu0KWLI8WrqrV6s1eZRCopBH5PdEBUUx2tgBr1g==
X-Received: by 2002:a05:600c:35ca:b0:3a3:253b:708b with SMTP id r10-20020a05600c35ca00b003a3253b708bmr16975646wmq.86.1659946074166;
        Mon, 08 Aug 2022 01:07:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b? ([2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b])
        by smtp.gmail.com with ESMTPSA id w9-20020a5d6089000000b002205b786ab3sm10767511wrt.14.2022.08.08.01.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 01:07:53 -0700 (PDT)
Message-ID: <bd18d0ea-10b9-4fc6-3f3e-ace336bd796f@baylibre.com>
Date: Mon, 8 Aug 2022 10:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 13/33] thermal/drivers/amlogic: Switch to new of API
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linexp.org>, daniel.lezcano@linaro.org,
 rafael@kernel.org
Cc: rui.zhang@intel.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com, abailon@baylibre.com,
 lukasz.luba@arm.com, broonie@kernel.org, damien.lemoal@opensource.wdc.com,
 heiko@sntech.de, hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
 talel@amazon.com, thierry.reding@gmail.com, digetx@gmail.com,
 jonathanh@nvidia.com, anarsoul@gmail.com, tiny.windzz@gmail.com,
 baolin.wang7@gmail.com, f.fainelli@gmail.com, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, glaroque@baylibre.com, miquel.raynal@bootlin.com,
 shawnguo@kernel.org, niklas.soderlund@ragnatech.se, matthias.bgg@gmail.com,
 j-keerthy@ti.com, Amit Kucheria <amitk@kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>
References: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
 <20220804224349.1926752-14-daniel.lezcano@linexp.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220804224349.1926752-14-daniel.lezcano@linexp.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_010756_608365_EE30AA70 
X-CRM114-Status: GOOD (  21.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 05/08/2022 00:43, Daniel Lezcano wrote:
> The thermal OF code has a new API allowing to migrate the OF
> initialization to a simpler approach. The ops are no longer device
> tree specific and are the generic ones provided by the core code.
> 
> Convert the ops to the thermal_zone_device_ops format and use the new
> API to register the thermal zone with these generic ops.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
> ---
>   drivers/thermal/amlogic_thermal.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index e61b91d14ad1..d30cb791e63c 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -179,12 +179,12 @@ static int amlogic_thermal_disable(struct amlogic_thermal *data)
>   	return 0;
>   }
>   
> -static int amlogic_thermal_get_temp(void *data, int *temp)
> +static int amlogic_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>   {
>   	unsigned int tval;
> -	struct amlogic_thermal *pdata = data;
> +	struct amlogic_thermal *pdata = tz->devdata;
>   
> -	if (!data)
> +	if (!pdata)
>   		return -EINVAL;
>   
>   	regmap_read(pdata->regmap, TSENSOR_STAT0, &tval);
> @@ -195,7 +195,7 @@ static int amlogic_thermal_get_temp(void *data, int *temp)
>   	return 0;
>   }
>   
> -static const struct thermal_zone_of_device_ops amlogic_thermal_ops = {
> +static const struct thermal_zone_device_ops amlogic_thermal_ops = {
>   	.get_temp	= amlogic_thermal_get_temp,
>   };
>   
> @@ -276,10 +276,10 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>   		return PTR_ERR(pdata->sec_ao_map);
>   	}
>   
> -	pdata->tzd = devm_thermal_zone_of_sensor_register(&pdev->dev,
> -							  0,
> -							  pdata,
> -							  &amlogic_thermal_ops);
> +	pdata->tzd = devm_thermal_of_zone_register(&pdev->dev,
> +						   0,
> +						   pdata,
> +						   &amlogic_thermal_ops);
>   	if (IS_ERR(pdata->tzd)) {
>   		ret = PTR_ERR(pdata->tzd);
>   		dev_err(dev, "Failed to register tsensor: %d\n", ret);

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
