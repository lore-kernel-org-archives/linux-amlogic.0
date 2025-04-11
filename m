Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D46EC36010
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dm/aLtMA+670DNBk4zGQgM7O/z83cntZSUK+iGedOY=; b=KkJKRzfbsuY+7ejar8IDluQgKc
	cxr+A7nI/cPkPJ1/hvQuAXa+IVWpjWzvr1otDtcm8BDT9VGoKWR96SX56mspB6xjuHjvR4QOCvGNg
	frL+fLq3Gjd0eT3oC3ch4RqqdNPtoHIUpMohcALqYAMP0ywxf1BZT2euuXg+bZuLzUMy7lu3awJrv
	mFAX7jAI0oCLHbZBFdyEHER8NACc3VuTCDIbj0qw2qSBqWWja+wNDT6F1N0Wx8tSZbcTF9RTUicbU
	1vrSk547rrRIVfVVKs0+P+Qb1/AkmCsSY/7FdwXoGxLJj8kdmXgcHnOqwDJ57h5WgxRMNIRVGtRv3
	2RtN95aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39z9-0000000D4DD-1hhh;
	Fri, 11 Apr 2025 08:43:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39ox-0000000D1xL-2mUf
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Apr 2025 08:33:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso12413475e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Apr 2025 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360386; x=1744965186; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EK9rCz5R2JGRLR/abCueMGVjM/KpF6kJW3tcRtlcRvM=;
        b=mMZ+nxhEHzzuUzhtvUijFVytlRuOaCcn33qpBf1IdRanBiP5CWziMyBZfbx1PLUMo6
         2NmGfLZ5RUDM9oi6RpEcmjNt7H1OTZ0blrhU9yjNWOYZa59V2KtBiLveEONFc21P78X7
         0QI61IwGpigP4ezahdigqTHdO1+pVPMvhz5iuFW+9FGUFw4muyHVFWpiwHGJQMWk8obb
         Em+wB2m1hbRKZag/e7BOM5kP2w8xhZlk6DuTFLHlW+Y+MlXudG1QkNIz9Z0U4G38oIcK
         Tr6j4ZUqd4dHrw7MzQNGCjAVbQ949HPe+Egw9Y4h3C6YorUD+L0E9hA1gOrZso6Owrj9
         P58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360386; x=1744965186;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EK9rCz5R2JGRLR/abCueMGVjM/KpF6kJW3tcRtlcRvM=;
        b=L5N9wmnrIXLjNXK7gZEgdsBdFwlw8I1jaGPukQh/W61tMuCB1S3RjQjj29vbM0T1BR
         F2+L5kvgItyXb7WqlO8yksJESRplpwlkvOUPvRoddo5bhDNCYMyfQWGse1zNsOCVUodG
         2jbw9TC1F3szdIHFyA/weILrtBECvFhGhYEe4Bzl4+Ak8lbEcYG5y4obs0g1TVP+sx9D
         PXIOvFV3TPMWy/6uk/vo/ilPw+THHmkoBrwYqR6FE1dh5GdEdLM5qLWnEh6xWt/RO33I
         nh+OJw+EdwAb+w7mbHtZ8O0BDnCbwXATd5g71CnM2QptlrJPSlvbaX92sz3OJ6euN2+Q
         O56g==
X-Forwarded-Encrypted: i=1; AJvYcCVfhhg4QH8YkG07jthbX1oL1brimNvVpKKrruaXn4l5me3ZzexTqxAdK5DKxyaEXyxIPd2XVnSZZ8OLhOrO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq/iEYUmAR47gdEq48R7Meb1WFoWlFsqkrfSjD2kJMkfmEnX+h
	jADUUzuj0fZJnAdxNvsDaXMncN+NdUnd5ak79gyRq/wlE9Wj1IkEY7K21hQk0e0=
X-Gm-Gg: ASbGncsrl3ikcrMIOWeMHUW9gPpITz/D2zlZ9VBgNcM0ESmXp/bU0CsF9AaFzeVgKSx
	Dq8ZGiM5FZz8PbPinCCizyoHtfV7SsHxJg9B+FAGSjPWu/GmOEtrSJcO2wuUXLVF9rbuleonbsP
	1OPCqI6EJm0xNdvdcNsla6wEpt0h5tC2kl2nG/jwurwHHyZ5c+sWs3gCfkLQ34FQo1+9feSzv3k
	XKLZDu/e2SqY6uQlphtcNVX7m1jRjqpyVe04uOeCqUO2lVi4L/OkjfCdbzBRKqrTHTWKXp8HS1i
	MToGP7/BP28xvyXkLN2Dz/uwYqHKO5gJIjOu8Urm3Op4XSmmMQJZEpY7ciVY8EiPnQIxKpjOeTk
	Z613A0WPaKcQNu2MliQ==
X-Google-Smtp-Source: AGHT+IHlLQ8VnWkMNxW6NJ/2XfY1PSwDp+GZZTngXF4ukLUEAUWIscJaYqmOWxV7FEHDv1xafn6WCA==
X-Received: by 2002:a05:6000:144b:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-39eaaed2b6fmr1302713f8f.53.1744360385924;
        Fri, 11 Apr 2025 01:33:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c074sm1290725f8f.28.2025.04.11.01.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:33:05 -0700 (PDT)
Message-ID: <8e8aff0f-36cf-42cf-88a4-a9e3a646b73b@linaro.org>
Date: Fri, 11 Apr 2025 10:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 6/6] phy: amlogic: phy-meson-axg-pcie: Fix PHY creation
 order in axg-pcie probe
To: Anand Moon <linux.amoon@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
 <20250410133332.294556-7-linux.amoon@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250410133332.294556-7-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013307_700549_C3783C24 
X-CRM114-Status: GOOD (  13.80  )
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

On 10/04/2025 15:33, Anand Moon wrote:
> Reorder the PHY creation in the axg-pcie probe function to ensure all
> the resource is mapped before creating the PHY. This change addresses
> the issue where the PHY creation was attempted before
> mapping the necessary resources, potentially causing failures.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/phy/amlogic/phy-meson-axg-pcie.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> index 54baf7b8930e1..14dee73f9cb57 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> @@ -136,11 +136,6 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
>   	if (!priv)
>   		return -ENOMEM;
>   
> -	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
> -	if (IS_ERR(priv->phy))
> -		return dev_err_probe(dev, PTR_ERR(priv->phy),
> -				     "failed to create PHY\n");
> -
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
> @@ -158,6 +153,11 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
>   	if (IS_ERR(priv->analog))
>   		return PTR_ERR(priv->analog);
>   
> +	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
> +	if (IS_ERR(priv->phy))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy),
> +				     "failed to create PHY\n");
> +
>   	phy_set_drvdata(priv->phy, priv);
>   	dev_set_drvdata(dev, priv);
>   	pphy = devm_of_phy_provider_register(dev, of_phy_simple_xlate);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
