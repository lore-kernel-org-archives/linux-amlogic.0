Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08AEC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 08:26:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A438C60F6B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 08:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A438C60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bhAqwRiDhN/dAIY1zfvN81Uv0sNzB0AQSd3H8OTbhHs=; b=1yJqiK96Tqicf7nsmNwIa0OqOi
	XYQz9ePAsooBVzD5RazfRM6umbZ8dMV5pmsi4sG9NVrQ6sKW6aWsg82yO0bVnZKVS/7NpeZ+QrG4W
	4NfHBv8s7Mp5DTUnVA48N65Z5iQfmEZLMSmrefz4+FzRNOZv7iqxlPu+RV19QlhadVl5oGj63KaE0
	aN5nsGaBeX9cOWRRFPSHyQ/9V8RFGwYiSU9fFqzFKr5kttpoNwvFnrt+/KXkPq2aUX+vQRJYRx4Q+
	kvvKYfBGDyrenA/TxRqXFJKrs6iQu9fBJV4qZAQSZQUjRTwfjYT02Y85AOtna3biIh/+8fBJuhTHM
	vZ0Z4tPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSEdS-000uy6-ID; Mon, 20 Sep 2021 08:26:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSEdF-000uvL-Mj
 for linux-amlogic@lists.infradead.org; Mon, 20 Sep 2021 08:26:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u15so27385113wru.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Sep 2021 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sd2zasa8jsIrDfE+uKpeLHxh1coC9+sVR27g2clwkhM=;
 b=ckRxkYg0UKty5XJskZHyKC1uz5SKwEvg6hMxqc/s62FhCOm6PxEQHRhWcKB9WAoSJp
 GO4n/go5FJ+TTQdsm5+lFhx3+c9s44JCpKFqB96Py8X5+8mSfZxLDql4uVACODWS03lw
 osn3vXU5pyd4zEsoet9nqiW6CJ7lQqYzMd2AClGhOZqoA/1hYjPwwafSU9EWemy0XmgD
 fNHCxgzxURbgJYyH1nHQvqUL/NwJg6HbHMpaEri8rjH3AZSIUVr7F7CLvLO3CIzFZpL/
 AePngvOzTZNvxjRvw4wn+8WMUODP+GsiasazeQaiTRMy6wrFCNLZzlBKQI3u2jXhTYAN
 EpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Sd2zasa8jsIrDfE+uKpeLHxh1coC9+sVR27g2clwkhM=;
 b=qoTKbxmPKzybX28c1k1wX3SoCszCg8Pbj7770kRMmjTAOMO6S9jiayqEFP1mKldqRM
 A8NZmZbin7GnhbQ5ankUT/usU1AarDV/GI6hFer2Qag5Vf9sVkFYjBfbwItqZsUH2YfT
 BUTnYlRmhC2/GKcBFCfC/FcuCwKKPrckmKDdAtlU+k8Ns7QnWw20s33jJDRVl6o3n1R2
 kKbzqQ/zsu3WCkRspB195KyDwtGi7KAif4v5n+N7CaIoYHMPdnz6aI/0qoJSIyZD47Az
 IMoD3Ntpdr8ZIUy/ts1gddNbhRakqPdUj9pjNWc9Y+620Q15KvuNGnJOSm04AhNL8FEr
 apQw==
X-Gm-Message-State: AOAM533PykVDuLupAAWOmfwij33M7o2lQ1Mg5O61kBBI+VTDQn9tjWwd
 abz7OGV69HJDaDPiKNhME3AIzA==
X-Google-Smtp-Source: ABdhPJw/mT3WUCPVZ29jbrBrgnE8L+20CP0Qbr5FtszQo+bi6bIe+hZ7C0epV27RPl5aeN5zYF9n9g==
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr27071868wrs.196.1632126391761; 
 Mon, 20 Sep 2021 01:26:31 -0700 (PDT)
Received: from [172.20.10.7] ([37.169.24.17])
 by smtp.gmail.com with ESMTPSA id c132sm6707022wma.22.2021.09.20.01.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 01:26:31 -0700 (PDT)
Subject: Re: [PATCH] regulator: pwm-regulator: Make use of the helper function
 dev_err_probe()
To: Anand Moon <linux.amoon@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>
References: <20210919211129.4364-1-linux.amoon@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7dcee097-9119-1987-9bb5-777d541cc9f7@baylibre.com>
Date: Mon, 20 Sep 2021 10:26:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210919211129.4364-1-linux.amoon@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_012633_817017_6F2F355A 
X-CRM114-Status: GOOD (  19.38  )
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

On 19/09/2021 23:11, Anand Moon wrote:
> devm_regulator_register can return -EPROBE_DEFER if the
> regulator is not ready yet. Use dev_err_probe() for
> pwm regulator resources to indicate the deferral reason
> when waiting for the resource to come up.
> 
> Fixes: 0cd71b9a43ad ("regulator: pwm: Don't warn on probe deferral")
> 
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/regulator/pwm-regulator.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
> index 7629476d94ae..451e57a739f8 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -382,9 +382,9 @@ static int pwm_regulator_probe(struct platform_device *pdev)
>  					    &drvdata->desc, &config);
>  	if (IS_ERR(regulator)) {
>  		ret = PTR_ERR(regulator);
> -		dev_err(&pdev->dev, "Failed to register regulator %s: %d\n",
> -			drvdata->desc.name, ret);
> -		return ret;
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register regulator %s: %d\n",
> +				     drvdata->desc.name, ret);

No need to keep ret and print it since it will be printed by dev_err_probe, pass directly PTR_ERR(regulator) and drop the ": %d" from the error string.

Neil


>  	}
>  
>  	return 0;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
