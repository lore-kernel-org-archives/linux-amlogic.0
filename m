Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E240AC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Feb 2022 12:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9J1hiqHBZ4AymUzGIIv/0tF6wlKkvK6kWFtEXWuHDA=; b=D3QFVnfrqnOCuN
	2TOBsxXEibsqY3Ke3pcMccee8/5OVCjUNgkGtZjenw4+fjCgWTyxttHJNIANmkVuz4gLqwm68Uc8+
	OPAjDyccAhmPKMdRkZ8EwKgiRH6V2ULKBmcw6NcxfU2WN3pafBgmXnTSH2DOPSitcGBIR2KBQcRRo
	4t1UMWKgjO1dawAJKwbbjBrmkQQ4nr7D8xxrOga8K39Kut9Ns5gdWCTwMe4PIuvi3mLRrLgGc+Ofg
	DDvdPwNu0+CqLPUcBTwNsoRHQZXr7MX6pwolZJDvQsLIu0bYUataRm4GH5bRKf7wSQAcBkYRhGatd
	sw+xWRTVvFOk0w0zHfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJa6N-00F1Mg-M4; Mon, 14 Feb 2022 12:05:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJZ8i-00EgTk-T5
 for linux-amlogic@lists.infradead.org; Mon, 14 Feb 2022 11:03:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e3so26260700wra.0
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Feb 2022 03:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=voOHTKZ6Kq7fuf3k40Bt/Cg/FVDuPGywOM97VgEuJp0=;
 b=xQB++bCcyZbYqGDxBMh+9AA7pbNWpiqOKO9eayXEWdhL54V9ZKRkHXGVx2ePd0kik2
 xWb4Wi5W6Kx4oDF/BjbZs0XPY+sSzfA4n7lGd3AoUhlWMrx7+h1ZjHC0wH7BTbD3vnG4
 G2PedixbbYUCGYRxVhkZ9VErAhM7CV/dy+WQhVO6qLx6+jXGvRPhqcuTg6FxqXRFPO0P
 SNaX2DwSF5G5ctwDcj973qnp1mK46X033LzKDyvwuGSQO7O1esGmOLK02lbuXaVXYtja
 fNH4HCfy1cs2OUDSPDHarllyk3/WwyM3kM/ROslSdb2Lh5nj2X8V1d3UzaNo7I4rBY+a
 3Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=voOHTKZ6Kq7fuf3k40Bt/Cg/FVDuPGywOM97VgEuJp0=;
 b=P+YYBkGn+4XqNM07ZURrRqqilwBayJi2MB3C40rXPdDy+K4ZmjFSXDV3OQbsgH4T56
 J6knwdG7oXWjAU1ue94Y9LrxV9otAYnzjeo8f/Ml25Vr10eH1v7gS35tva6PoBM7EtH8
 TQGGrgD2m3lmq+4vIeyxf1s15rqCJuBfhHn39gGN4Qq6J/AKBwx74xAEMeLeh2Ea2FRZ
 C/Ckpi0+sLvt42df4VG55PH5hVA9rg6d9rWl6OJb++aD1TpM8Y1DU8zg0vFp6Yrt8HDS
 wB/q5zNnrVCzBNjECJOeF7nGksZ6xZTgiaZuwhSfxZn3MQ0FNIFfO31nR+K1dK6z5kFz
 e2bw==
X-Gm-Message-State: AOAM532DA8iyeSHLfUbqA/jZ18Y8/6xXzP5cjvYzM80jYLgpivyzd9ro
 V76J6LaGkCQhqpdaIa4rftt/uw==
X-Google-Smtp-Source: ABdhPJyQGzvtUz4bb1kLHT2DVtQZlLvPUFqTZLzT4FocxEGsX88hVqvn2hnq4Ye2Kn+jy3pQYRsf6Q==
X-Received: by 2002:adf:8010:: with SMTP id 16mr10234280wrk.708.1644836606869; 
 Mon, 14 Feb 2022 03:03:26 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 u11sm26861096wrt.108.2022.02.14.03.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 03:03:26 -0800 (PST)
Message-ID: <c23da7e0-6881-1911-ecf1-ff515e71424e@linaro.org>
Date: Mon, 14 Feb 2022 11:03:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] nvmem: meson-mx-efuse: replace unnecessary
 devm_kstrdup()
Content-Language: en-US
To: xkernel.wang@foxmail.com, martin.blumenstingl@googlemail.com,
 narmstrong@baylibre.com, khilman@baylibre.com
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_0589E3FF08A4905922F78BC38602361C5505@qq.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <tencent_0589E3FF08A4905922F78BC38602361C5505@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_030329_044513_C5B87F5E 
X-CRM114-Status: GOOD (  13.43  )
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



On 17/01/2022 02:56, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> Replace unnecessary devm_kstrdup() so to avoid redundant memory allocation.
> 
> Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>

Applied thanks,

--srini
> ---
> Changelogs:
> Simplify the patch to replace unnecessary devm_kstrdup().
>   drivers/nvmem/meson-mx-efuse.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
> index 07c9f38..13eb143 100644
> --- a/drivers/nvmem/meson-mx-efuse.c
> +++ b/drivers/nvmem/meson-mx-efuse.c
> @@ -209,8 +209,7 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
>   	if (IS_ERR(efuse->base))
>   		return PTR_ERR(efuse->base);
>   
> -	efuse->config.name = devm_kstrdup(&pdev->dev, drvdata->name,
> -					  GFP_KERNEL);
> +	efuse->config.name = drvdata->name;
>   	efuse->config.owner = THIS_MODULE;
>   	efuse->config.dev = &pdev->dev;
>   	efuse->config.priv = efuse;

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
