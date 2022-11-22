Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9DDC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1etCtuYvUOpM9++WU+lmwZKpwQY/pyVgwmtyy2/H+0=; b=JFsFlV1/pzVmzZ
	Bd2gH4uWd4NDm0KvlzgUo99MaAKON/o96ang3YGGjNYcteq39EDyMH7AzO8J9F4IuJuJXLrJuElAw
	WAw+A5IgdAC/8xXs//lhSQYUSv/75TMr5RWvz1CmBJtxwPGM7IRwtmY6IYFKKUP9DoGIwg0AGbgot
	TSQ38W8Rg6E99CoD3QS91kGt0tJ817TqjsBTbZ4JOGuUL3xw7p/SLeDmKXI7mjlR3A11kTnSXpqS/
	kT7NqB1TYf1OkhsZJT0fSyzbs5FactSaPXpieJWxSQXuXa4rWZQVYhFyhERr0ChjQECRw1hifDGYO
	erePiqogMcs73hzGFVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNvd-005p6c-Ls; Tue, 22 Nov 2022 07:42:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNvb-005ozL-20
	for linux-amlogic@lists.infradead.org; Tue, 22 Nov 2022 07:42:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id v7so10110566wmn.0
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Nov 2022 23:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QA8MIxpIapkC8rEFteuXA52vQ4uYeexAZXXoL3SYQDg=;
        b=j9/erFQZhyBUbV56VTTVREPvqvvwUBRXSGqaVS/BckbFM00YyHGVlZJjQHBu66+Uhy
         Nc8eyOJol/nhlpYY8ymw08M8wg8i/cPXaTrRdBvavolILqnQwLrveHQY61RbDm16JSP4
         fCdjDGqu1vkVWbxNYrZl6mK0q0TGsNQRTl+mOVJ/XcqiCK2xS55uH58l54jhxwQpr7wa
         z1vOHW4O9HVhinBazEUBY7ZIpq5pNTZiSbwPsAox4k82nVSithVEZl06lkHTOCu8mNvg
         +yfMERxrxxgKPC5Uy/zQlAaw9yPyX1oqTIyRDq+AJsmGz24j7cEHHSqc889e51NvKmVf
         9VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QA8MIxpIapkC8rEFteuXA52vQ4uYeexAZXXoL3SYQDg=;
        b=BCzHS4oRORV00TAWx903PCAQz5CJm0ufuKWfpY5J943PGLbyIS9tccKVx74w+KQn/x
         If6XDEy8UecQw6llyZjyJgymzP+N9ffXIxJZdR3hzYwQXeSOMqD87HYVhJ6Q16Mkhf9E
         Fw/TKYaP7eVQPiVgmYuHLSWFP3Mu1R+BsCuJGlv3DhtaF48etdG0ONNa1F5T8hHLD2wf
         bl3zqKAPNxxv2lfM7waJGCs/S1fEME57hAdCXnuHUbHy5AynV/4PPWk4lHm76CNCgpu6
         xYP6GDI1iLOMLUtpH09kGffqfY2mDmPQ4JM/Gg4ujDq8eQynXevbHgePZa69a77AKsyU
         Mq6w==
X-Gm-Message-State: ANoB5pmnfRxOsztiF7V6AGSyWvCLigmfHEIrg9rh3T/jm6ycvtNceswG
	QJCuJA6yxIHvwZJ/T+BWFaewag==
X-Google-Smtp-Source: AA0mqf4Ei//KY2A6ZGaG99iMhX8fGi7uYrNGLNXKBpd4mjqaLK9ggmNUXVO9NMVN9iSmOxMHvtie8g==
X-Received: by 2002:a1c:f006:0:b0:3cf:7b68:631 with SMTP id a6-20020a1cf006000000b003cf7b680631mr19316735wmb.55.1669102963360;
        Mon, 21 Nov 2022 23:42:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0? ([2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d4dc8000000b002366c3eefccsm13187908wru.109.2022.11.21.23.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 23:42:42 -0800 (PST)
Message-ID: <0df30bbf-3b7e-ed20-e316-41192bf3cc2b@linaro.org>
Date: Tue, 22 Nov 2022 08:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] crypto: amlogic - Add check for devm_kcalloc
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221122062230.22024-1-jiasheng@iscas.ac.cn>
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221122062230.22024-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_234247_148465_58EE4434 
X-CRM114-Status: GOOD (  17.10  )
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

On 22/11/2022 07:22, Jiasheng Jiang wrote:
> As the devm_kcalloc may return NULL pointer,
> it should be better to add check for the return
> value, as same as the others.
> 
> Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/crypto/amlogic/amlogic-gxl-core.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 6e7ae896717c..b243d6382664 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -238,6 +238,9 @@ static int meson_crypto_probe(struct platform_device *pdev)
>   	}
>   
>   	mc->irqs = devm_kcalloc(mc->dev, MAXFLOW, sizeof(int), GFP_KERNEL);
> +	if (!mc->irqs)
> +		return -ENOMEM;
> +
>   	for (i = 0; i < MAXFLOW; i++) {
>   		mc->irqs[i] = platform_get_irq(pdev, i);
>   		if (mc->irqs[i] < 0)


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
