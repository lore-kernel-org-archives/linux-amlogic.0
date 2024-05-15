Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9569C04FFE
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 02:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3JR7/dSjXoDs+qPR/4km4PcycemtcECCH4gAR6BHEU=; b=K3nk2C4OdQnzZO
	jgjeOd6t3z14Jwos9szZzTucBjO5DIRiKzF/+QZHsYMVuc3kn3pAxtDFJkyeEcFMq697bKo8NycAY
	mHWwPjiWeCSMNaYpGYGNKHb74IrKU+sBQ3i2qEkFkRwFvH3gw+J0mlqbSU7B51pptRP3IB4AzrutJ
	jY7pHDG4qajbIYdkLwQBZP/DL1IwY7/cxELKhQOEWYZn4dAMeRLe9PI8WtI8vUtR2wc6pIe4BSo/M
	g/jDqEMEWyY1gXF140BNd8DT3sIfBjpwZF/djHJOJWcVrcbmfXV8yzy9GMB5oDUwgIb2lADbiRHQ0
	K/Du2tapsMYfTB53RmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s74OZ-0000000096L-1Dg1;
	Wed, 15 May 2024 02:29:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s74OV-0000000094U-0jro;
	Wed, 15 May 2024 02:29:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ed012c1afbso49882165ad.1;
        Tue, 14 May 2024 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715740165; x=1716344965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIgpUa8KxyLUmcPW5rdHLb8CzpDEUu73pDtvEeNol/o=;
        b=TvqG5Em3io0jeWlmuN71bBRmaRnoifT1e2MQc2XLRdD38SWXANx6dCBjVXADKkQ48o
         ICxUY2Pte77Y6kL0ZNq/aw0tI1jzUqtKfQ8RvLNer9/Zwnd3M4XbK+0xftqdPDM9lkei
         EBh4nn6iCb23+c7OZMW4XfSa3Jg9NA4qVjnU/+uFay7LwHpI17E/D+f4oLI3kAGMleWQ
         94rZccRMl9/HxRYlDlqzGMODFmWjCNPNEJvjZztkGH745z4oHRG6N0CoH2ZwEytPP+cS
         Gk0WAD+FT+sNkFJYDX0OJF5mcWhm/HR46VWbHrKkgMBTy9xOj5zxc7Zma8lswYHYTfUS
         ohJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715740165; x=1716344965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIgpUa8KxyLUmcPW5rdHLb8CzpDEUu73pDtvEeNol/o=;
        b=WNlZUTbCfNS2/r52WX3wjlGZZ/F3+chv0I9lxqSzyBaHMpFwPlVEMZ0veJN7Qvc1BR
         bmKwYgYNyC+pFZbQA7Y6HlfK08Wy9nRb5PfrK50mj3oATlTIKPwl/xJea7ZeIhvbbpzd
         7H3zxjg4URf0jxR/iMxi61ml7DkjQzmISxZm+WWRp40CgvwS+i6rndELivp/J0ygydkx
         ZADqBU23QWZZkjljnvsFMwGZUL7KQRvBWCHnWrycknN1yw2E9UhvcZEvwRvuC0NwXby6
         IUwKvpdkEEmYdDh4viFag0P669P+LrBIpzKorLIG0h3N8stUS8jKiA3/ezrgiLRL427J
         QV+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFV0bMj6BvoUkvJop9zbnyfFfky6RuYH2wuf7hv3enW+ey4+uqr+v1lTNDQORun6SilVduCBgm6ImpXdF/K9NUBDQFJ41w9SKYSqNxOAixPTVOwm2MxpXvtskwEPmdMqlDrgCqBMkUdDcGbH0R/cZL63RhyF9uvQ==
X-Gm-Message-State: AOJu0YxgMjy7si7o7crPLfPvQDJaqtem4bs7WqnBpXgACSwl+fOwtmWF
	E08daEW71FNFc8IKPUFkg0LPu0tV8+K61GLfBKvtcmMIWaPwMfB0
X-Google-Smtp-Source: AGHT+IETFi8DKe3FtKXom1fBYbrA1Dew9V92VfYordZI22nsUhMyQZEwc1CmQQPcxQYcjYoeLbYaLw==
X-Received: by 2002:a17:902:f648:b0:1e4:6cd7:30b3 with SMTP id d9443c01a7336-1ef4318d311mr217684985ad.23.1715740165386;
        Tue, 14 May 2024 19:29:25 -0700 (PDT)
Received: from ?IPV6:2804:431:cfd2:fcb9:629f:d1de:f0d7:c9e8? ([2804:431:cfd2:fcb9:629f:d1de:f0d7:c9e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d3e26sm105562555ad.43.2024.05.14.19.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 19:29:25 -0700 (PDT)
Message-ID: <768c3e38-724a-42d7-a51d-16044bc69ed5@gmail.com>
Date: Tue, 14 May 2024 23:29:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: meson-efuse: Replacing the use of of_node_put to
 __free
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Julia Lawall <julia.lawall@inria.fr>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240416011751.93016-1-marilene.agarcia@gmail.com>
Content-Language: en-US
From: Marilene Andrade Garcia <marilene.agarcia@gmail.com>
In-Reply-To: <20240416011751.93016-1-marilene.agarcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_192927_263944_3F5F052C 
X-CRM114-Status: GOOD (  18.28  )
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

On 15/04/2024 22:17, MarileneGarcia wrote:
> Use __free for device_node values, and thus drop calls to
> of_node_put.
> 
> The goal is to reduce memory management issues by using this
> scope-based of_node_put() cleanup to simplify function exit
> handling. When using __free a resource is allocated within a
> block, it is automatically freed at the end of the block.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
> ---
>   drivers/nvmem/meson-efuse.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> index 33678d0af2c2..400a9a075e53 100644
> --- a/drivers/nvmem/meson-efuse.c
> +++ b/drivers/nvmem/meson-efuse.c
> @@ -42,20 +42,19 @@ static int meson_efuse_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct meson_sm_firmware *fw;
> -	struct device_node *sm_np;
>   	struct nvmem_device *nvmem;
>   	struct nvmem_config *econfig;
>   	struct clk *clk;
>   	unsigned int size;
> +	struct device_node *sm_np __free(device_node) =
> +		of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
>   
> -	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
>   	if (!sm_np) {
>   		dev_err(&pdev->dev, "no secure-monitor node\n");
>   		return -ENODEV;
>   	}
>   
>   	fw = meson_sm_get(sm_np);
> -	of_node_put(sm_np);
>   	if (!fw)
>   		return -EPROBE_DEFER;
>   

Hello everyone,
Did you have a chance to look at the patch? Any questions or suggestions 
about it?

Thank you,
Marilene

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
