Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A074EB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg8U799UKTiGbnNBzYfa3HOOb+OtZdiybL0jIfTnMYw=; b=0JVvUJMiT1JrdEhKXgqigB+FA5
	0S1BN7HhPzx6UN0q1pMzrbHtMq52uIl8JckrwPd21lkeD01H0zLzv8XFe9AVEy5Ib2EDa/CEJ0sqP
	OYSeT6wlAM24p5QYsYry8FoPQgrqQi1ln6a70T7d++wC/97UZUuJevy1NDLLFrqGd7KJ9p6xLaXBP
	MphejMSsiU9WrIlhNb6H2KdClFpXSC3zIYQNVEKE3cZFsWwfiRWq6i6SyZKHCdJKq3kstvhPXgmVH
	LetFS61m8xFyyuB6tI6EFbYNzXNSQY0u41yE7T2qGXhILPoLXrg1Vhpyo1Uy3UD2g0xn6ynMH4taN
	7qL9DPag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgDt-003uGB-1v;
	Fri, 07 Jul 2023 07:49:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgDr-003uF4-0J
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 07:49:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso17288985e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 00:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688716185; x=1691308185;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9EnDHhrFdq4WRPA6nencTKPgQFqADeWH5m8/o3xI9B8=;
        b=g1YuWBRKHLFT0FuLHKbxERzH7W5s4CbuSJ3luIHO7njz/BcL7v6U8EMEAou5wcL5XU
         jdC024WagmvLbTQU7S4FFroIzyhT0XYsAsqySsoRm/tP0HZeMKaNm5vagX8fNtCX5w7d
         +TTVnENjnND/pMl8I2rZFHIepEkmC3xVhpjM59FIZhsbzOdOrrRg9HkIsRObyIIEztC+
         xskJ89cqaVli1Vps42QIQRwflilzYnTGlyjv9OaN1RXkNkFu0GNCJI4COY6iUNz9InL4
         3HoL+j9VD+pVmS0Z17nCjCK904gxrTPnDYKAJgErrXymk8e8G8f6HrOAOpw6XB2zn+C6
         FlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688716185; x=1691308185;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EnDHhrFdq4WRPA6nencTKPgQFqADeWH5m8/o3xI9B8=;
        b=S64Ue5yM5OjgP91iC8dABtw7JHEHF9fbLJlHx663xE2iuVeq4fESd7No5KqmhEAz96
         TvkEff/qsRXwXJVBUNTFcAAbAZjZ08Iczzj95PeG5G0VBL/eGXZ9m3NT6+EcTVOdx6iW
         xHfOm9kI841kEqAnJcJv4boK+xX3mdwO3BJ4PKrkCcUTopHJhdXjxpWurCKhOPx1wGEE
         jkJEfgq5z6MRt3rIW8gq2lgi6hFt8HOF96TjKwlwxE4JnJgzk9GN8zsqOdfLIudVffaN
         BwuspSLlYd9vnGsHHrDr78+TF7aRbgEGAvBejDMlMu16VkSeNsu+ncYDV2YiouJUlIC1
         15Zw==
X-Gm-Message-State: ABy/qLaVx9ChcdikTjUsv5igaciqoVqeRVMVTuBr5By4xSL44T+1l52J
	k75DMA0tF7sykbaOVB0/a+I5kQ==
X-Google-Smtp-Source: APBJJlGYScvW1lAKhc3c3YrVDD6Uj/RBfcMAhiRqaaXOv3mivFVVkG2S890dmxWftnhVg5f1N40JFQ==
X-Received: by 2002:adf:e2c6:0:b0:313:fa44:a410 with SMTP id d6-20020adfe2c6000000b00313fa44a410mr3787177wrj.52.1688716185182;
        Fri, 07 Jul 2023 00:49:45 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id g3-20020a5d5543000000b0030e5bd253aasm3739416wrw.39.2023.07.07.00.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 00:49:44 -0700 (PDT)
Message-ID: <bbf39525-5afb-2185-e768-f78de0ed63e4@linaro.org>
Date: Fri, 7 Jul 2023 09:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2 1/4] soc: amlogic: use name instead of index as
 criterion
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
 <20230707003710.2667989-2-xianwei.zhao@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230707003710.2667989-2-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_004947_137342_4E690D6B 
X-CRM114-Status: GOOD (  16.53  )
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

On 07/07/2023 02:37, Xianwei Zhao wrote:
> The  variate 'index' could be equal to zero in some SoCs. Such as C3 SoC,
> PWRC_C3_NNA_ID be defined zero. Use 'name' instead of 'index' as criterion.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2: add a new patch for change.
> ---
>   drivers/soc/amlogic/meson-secure-pwrc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index 25b4b71df9b8..c11d65a3e3d9 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -179,7 +179,7 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
>   	for (i = 0 ; i < match->count ; ++i) {
>   		struct meson_secure_pwrc_domain *dom = &pwrc->domains[i];
>   
> -		if (!match->domains[i].index)
> +		if (!match->domains[i].name)
>   			continue;
>   
>   		dom->pwrc = pwrc;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
