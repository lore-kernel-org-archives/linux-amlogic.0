Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6BBC54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 11:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xwaaCZxuS00Stk9/xHcvxJ9/cAeIQE7dKxkwo4/Dwo=; b=jVcjSt1hhtH6Ia
	hMLj0qtCWliWrqjmLZk2sxpPqCMeFs1kLZ8rOlQX9rLJmn2BtKvQ6bguVufxQ/1iwrTQ86B99e6gY
	YxKKXfeBX6yQeGcRM3h/+z0WR1lHrKJFifTvbGZgHLvHvd3WDvOD801Bwavq6c8CQdB2C/RPfKFAO
	jgV1EwNMcivqFdXEhU061f8ihv0K+5/54nAfThLNeL2nyDPaUnTXci7ocThJFsp7osgGbDLjVLALV
	CZNjH/PNUn0RLdq3NnjkQtE0iRZIvgIk/70z1e0pD8yZL0mCp8NzCxyleqglnIaufPbDmnDG2kB0/
	7zh9c0VMgTpT1SywBiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMS0T-003FAh-QC; Mon, 30 Jan 2023 11:07:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRzc-003Eyr-Er
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 11:06:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id t18so10694172wro.1
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yNDMPXDJxIWFepXsoEIg2J6UzCqMyzPQRKfo3ReKfmw=;
        b=PL+/eKkvazCt3dk8l8KY94lK2apVCyduLPa131ikd12aEmLhpoT1gB/UqvSqrdewoC
         n6eyYkahPsoh6CqFNCqh4YLAHEWFDUwI4FdlLLjcJScm8A5gOxT873HdnZpFMZVxuAug
         gAqL8iyuBoc97QVazaAEi9NC2o81fDhrnKAu6OkFkd8bU0+qSV9GUrc4WyZI3aSvACLp
         DkfRe/TUcKVM39UgeGI8RGScBFCwyRjZ90op7RgUY2PRzMozVYOAMqnrR+LddNLkDC8D
         Q71BOdvfCJ53dsYkAI9qzBZcUnMPuwjiexcFTjxhJC6rVmzZW5qis7y/LUr1TM4R3vCQ
         S1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNDMPXDJxIWFepXsoEIg2J6UzCqMyzPQRKfo3ReKfmw=;
        b=JSkJrEy1OZsYloOHe42FSyCpI1GJkdgPxt5i4zQYCnXq47z1v5dIFYR0mzRLxGKjTQ
         iRQBy4wcgT74aute2puZhp32rpJ0h39hR7QwuUsIObBMYpLTWVgIT7CBJsrTicFyDFkA
         LwF9tErDKpRdcPyxfoSFi1Ao1zQxKp9FhbPoV2MCJIOcxycGdZzl5IJi752abmH7pexY
         Ny2B8n1AIrakZL5XBJdRkNdPKgx/fvM7Z8Ts7kHsNlGqgSHDAOF6HWajjbhUMPTBr0Dk
         rj6mcaO53CjyYQ+9wfolYDfq4089hHuPcsNgBw9GVeRut3bwBfHhex9tDIhT8JtfgMXd
         MWLA==
X-Gm-Message-State: AO0yUKVsvYdrXTK0COLolQ2U1ukbF60fOiJ/zeykA+17X2bDNErvIvOu
	U5/ZuY8Q62g1yFeDgLF5Jo2qww==
X-Google-Smtp-Source: AK7set9LUEaXBRP2ZmoaxSwk+r+D6tWi7u/YOFTSzqbjX/zFUp6z8R3Fo1IdcrdXUSUB91bWbAL9bg==
X-Received: by 2002:adf:f38f:0:b0:2bf:bf05:85ac with SMTP id m15-20020adff38f000000b002bfbf0585acmr15695242wro.23.1675076787638;
        Mon, 30 Jan 2023 03:06:27 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id t8-20020a5d6908000000b002bc7e5a1171sm11670124wru.116.2023.01.30.03.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 03:06:27 -0800 (PST)
Message-ID: <7789e36f-f13a-9837-5432-c16754922fa3@linaro.org>
Date: Mon, 30 Jan 2023 12:06:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] mmc: meson-gx: support platform interrupt as card
 detect interrupt
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com>
 <9e08411b-20cb-874f-8915-6f8dc32e9fcf@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <9e08411b-20cb-874f-8915-6f8dc32e9fcf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_030632_506812_9465DC55 
X-CRM114-Status: GOOD (  15.79  )
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

On 30/01/2023 00:10, Heiner Kallweit wrote:
> Use a new mmc core feature and support specifying the card detect
> gpio interrupt in device tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/mmc/host/meson-gx-mmc.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index be1a972c2..c87bc31d0 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1236,6 +1236,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>   		goto free_host;
>   	}
>   
> +	/* gpio card detect interrupt */
> +	mmc->cd_irq = platform_get_irq_optional(pdev, 1);

Ok it's fine but beware GXBB/GXL/AXG doesn't support Rising + Falling GPIO IRQ,
so this should only be used on G12A/B/SM1 and later.

Neil

> +
>   	host->pinctrl = devm_pinctrl_get(&pdev->dev);
>   	if (IS_ERR(host->pinctrl)) {
>   		ret = PTR_ERR(host->pinctrl);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
