Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4766C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Nov 2022 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M36S5pNr/7m0/QdxUUbG2z97ijH/+sIiaLlAwYGK3k4=; b=VWqzdoP6xtp6coJ9A+P4TUSq8e
	iUQRtSKiHyXqgZiPlK0O3JGIIOZnLFpnXpfBKIMCIuGpEAkvHDGazvZCutaLABy4O3HoX3dXs5GCT
	JEtuiQwYtxH9/v8dNVIDt3OlrN/6ITi38BwkjEHsV9NvMVXaELdOp8u7e5MDHRJUrj6XQMxKPefCM
	qqTW87B0Suc3GRdoyMYHgKdZTUXNsTA7ZLNHTHRb3tIHCp1aCUI2/fMbfP6iLk3LARmAjbrenyA4m
	UrKNXMnZzb69AM8qE2rB1kv6dSxVZsP9kefq9ZjnfFqX45ve2dlhDiwEz5QXr6F4ea1q/owTGpn0D
	dktGXezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshfg-00CTuD-5E; Wed, 09 Nov 2022 09:47:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshfe-00CTtI-3K
	for linux-amlogic@lists.infradead.org; Wed, 09 Nov 2022 09:46:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h9so24946933wrt.0
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Nov 2022 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SjAxgNVa5Iy7P1HQop4+LeiywcSnOALtrSCXa4yCO2s=;
        b=mwsOvQxikY4BQ8qam13FHKX5DNYwgrq90MGapnaTlTrrN0vHqoxjTy0YqYOj7O80uo
         JwBBMapqr/G0rK3he5L+pVR+r6CiQYE7SXyCRsmTdtoVnm2XVQQSYL5mYTP3tE4+ayJw
         bNtQIrliaZuYxaR2QT7pRFfDwBrwz77XWpT7wJ7MBTLFs620Vcye/4GUmVnPpySkB3bV
         /Koxz4qUvuxW0XgjFRVVRw2xL65XqRoblIdLpie23eLeV9kHeDn/ipg0M8mGS5Mm+YsX
         lukmySDwqGY+/osGMxIe4RF4US5ECF3fzFEdXgxI/xMHHyY+pSAhRqAj5s0qsTRLGUsh
         eBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjAxgNVa5Iy7P1HQop4+LeiywcSnOALtrSCXa4yCO2s=;
        b=BxdU+V9TPXEqK2z54JmPSx+Sws8vYpDAm2+Y0nc/raUQtBat/8S9vqNRczLwBpRpgJ
         2QeJ0NhpaDuylewB/IrhF0i4F+E5HSX8nDTxJ39/BX3pDTRfybX/e9ei3i+ZwhY4sbqp
         a5ev/WNLUlxrWeL48X+HLXaNqKxFzkeNGzKGLyTXGL2X5sT/VycO1mH2ONmR4mIWDnfa
         zPRn0MAI5DBJROW61alWl/1sxIaNmvU+SUTPrg0LUxGzpeMRCKzt1Ja59hNkof/gwRM4
         bTYgvQIwjhS3GHfsc1iO1T0xt07T0EoHysZRFAXAYB8P40IIzYMk6L3qCZrq+Eku26EG
         BVNg==
X-Gm-Message-State: ACrzQf3Tmtg4OtYr4nBd3GWsXS7lczTNAgi70dmPG5DiBrzLqZZ1YeS6
	t/zjkOQxATCLS3gqD+Iw3IVRiQ==
X-Google-Smtp-Source: AMsMyM42vjoWHmtle3AuJ4DjbxcufaFgTYg2QBcGe4karhQ/6wycyzv9vc5rqjul6OZ02PdWuTXGpw==
X-Received: by 2002:a5d:534b:0:b0:236:73ff:3605 with SMTP id t11-20020a5d534b000000b0023673ff3605mr36782817wrv.521.1667987211662;
        Wed, 09 Nov 2022 01:46:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5e95:d543:1caf:4e60? ([2a01:e0a:982:cbb0:5e95:d543:1caf:4e60])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d420a000000b0023682011c1dsm12496766wrq.104.2022.11.09.01.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 01:46:51 -0800 (PST)
Message-ID: <ac749b53-c768-0266-0173-9bdbf154be46@linaro.org>
Date: Wed, 9 Nov 2022 10:46:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] mmc: meson-gx: fix return value check of mmc_add_host()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: ulf.hansson@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
References: <20221108123417.479045-1-yangyingliang@huawei.com>
Organization: Linaro Developer Services
In-Reply-To: <20221108123417.479045-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_014658_172002_3EEFD02A 
X-CRM114-Status: GOOD (  17.64  )
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

On 08/11/2022 13:34, Yang Yingliang wrote:
> mmc_add_host() may return error, if we ignore its return value,
> it will lead two issues:
> 1. The memory that allocated in mmc_alloc_host() is leaked.
> 2. In the remove() path, mmc_remove_host() will be called to
>     delete device, but it's not added yet, it will lead a kernel
>     crash because of null-ptr-deref in device_del().
> 
> Fix this by checking the return value and goto error path which
> will call mmc_free_host().
> 
> Fixes: 51c5d8447bd7 ("MMC: meson: initial support for GX platforms")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/mmc/host/meson-gx-mmc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index df05e60bed9a..6e5ea0213b47 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1335,7 +1335,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>   	}
>   
>   	mmc->ops = &meson_mmc_ops;
> -	mmc_add_host(mmc);
> +	ret = mmc_add_host(mmc);
> +	if (ret)
> +		goto err_free_irq;
>   
>   	return 0;
>   


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
