Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C36C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 19:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfYmZ/j8exxYGdqxFcNGc87WKgV1Wgh4/DvEnEHGme0=; b=GiGpneR0Rb3B24
	Sqytw2aNdMOKZHD9y8upuOLuC4dBbkwiCNWMd4112oV1NG0nAzsYYC9DIa6GTLTrX2joBi6eeOVsj
	m2UN06MDfM7Ehx7fViTNGO/buj4OtNkz1VlBTqvBSO7NlNFzLpyMJWSx/KocNPjrXHcRPzmpSS7yc
	LWl2ageKnaMgpSeZ2+82rdKgGJVqn3mAarn4zKD/aZJSEYgRuZDRJPY1OkQCO6tczYNL8AhT0rde3
	cqBIDdmZR97peNEGRs6wfwEa9y1qJHsBwIzw++tiB8Xz1f9OVQbHr9WxO63bzaxbkxNlNIyFiiZ2X
	irkbr3Bm8WKGecbvub9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAac-00BMy9-08;
	Tue, 14 Mar 2023 19:45:42 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAaZ-00BMxJ-0p
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 19:45:40 +0000
Received: by mail-ed1-x531.google.com with SMTP id eg48so7412208edb.13
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 12:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678823136;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dx+upmH7N2zp5Ua2gEK276tD+Y89nrLKL0Tl8k2Wdc=;
        b=Pt7sBXo66cdFGiG3vWh+CkVp1Bw91P5irWH136K9kdGym+9hymOenz0KmDzLZVIcV8
         OEKTgypmdaudkq+DxSm2tJLLZopgcaMLWKHlNaxICjUdo/gaSLTSCk+n9fJauJu5RzFg
         ZOPAF/E46gRArq+R/9dVS+NeOZ8iE6nFxlYBg4trr0py8i0HbMz4QV5OOUFU4jpXgJta
         uVkNv2fC9p0UCdDlXfhmfLsIsGswBZ3BqKzq04IsnVltdATy6u36w6u/Wdb0wboiuCxw
         RGV5jfWbK/LcrIpdPhqabhTi5MvDS2VrXmrCn1zJn1cnPx0XVsL+D22k3rBfcuReB1bw
         u1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823136;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dx+upmH7N2zp5Ua2gEK276tD+Y89nrLKL0Tl8k2Wdc=;
        b=PC5f0oqdZHg0Qn6QeZYXGZuksYmGWqgpQaLw7aooZikXfpEpch9OXFeBCp1E+7F0l7
         eaVPOvWf/re6Qo+Ob/ieuFdZnXDAvmdqM43xvWypLzvRJ0peaXwoDOX+x66LL/rp21M0
         eizUJctG45s92KHpcucJOz+o0J9a5PU7EplCeCtOvv/bW3/83izbmfni04hA9QNW1c4b
         d1kQluHk1pmy2HK4ZpORkaWekrtq1UG5rTwDp9HnMtPHcsZ7e/ntL9fNucUWVr9iKHHx
         Z83sQgdUnz5N8KSkJP/8gTB86bVV1/5dIOAHmeb1dSLSgdDHDmhBTEou7J0dkmVpPP8T
         BNlA==
X-Gm-Message-State: AO0yUKV3TqBxTmt04TbgYnba+/HVgX9QMue6NsPuW8+7s8WAY8J0J7MN
	XS9enYQvfXDl4tIUPR5axS6/hRcslmc=
X-Google-Smtp-Source: AK7set/bC6AB9ZG6QuoyPuS0ice1lrRUPEGYyY2vHo9H52eQjXoTVY10NNrAcAgb92Vxbow9Cdbi/w==
X-Received: by 2002:aa7:d49a:0:b0:4fb:994d:42c9 with SMTP id b26-20020aa7d49a000000b004fb994d42c9mr225680edr.24.1678823136165;
        Tue, 14 Mar 2023 12:45:36 -0700 (PDT)
Received: from ?IPV6:2a01:c22:772b:ab00:fde6:8525:8145:a65e? (dynamic-2a01-0c22-772b-ab00-fde6-8525-8145-a65e.c22.pool.telefonica.de. [2a01:c22:772b:ab00:fde6:8525:8145:a65e])
        by smtp.googlemail.com with ESMTPSA id h1-20020a50c381000000b004c0c5864cc5sm1494480edf.25.2023.03.14.12.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 12:45:35 -0700 (PDT)
Message-ID: <0696106f-8d70-6410-999a-fcda6c5b39c2@gmail.com>
Date: Tue, 14 Mar 2023 20:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pierre-Hugues Husson <phh@phh.me>, Rong Chen <rong.chen@amlogic.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
References: <11a8a0c8-a5b1-8f38-a139-97172ab7be68@free.fr>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: increase power-up delay
In-Reply-To: <11a8a0c8-a5b1-8f38-a139-97172ab7be68@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_124539_297430_D9171CAB 
X-CRM114-Status: GOOD (  17.33  )
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

On 14.03.2023 18:24, Marc Gonzalez wrote:
> With the default power-up delay, on small kernels, the host probes
> too soon, and mmc_send_io_op_cond() times out.
> 
Looking at mmc_power_up() and how power_delay_ms is used
I wonder what you mean with "host probes too soon".
Are you sure that the additional delay is needed for the Amlogic MMC
block IP in general? Or could it be that your issue is caused by
a specific regulator and you need to add a delay there?

> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
> Stress-tested with 80 cold boots, checking every time
> mmc2: new ultra high speed SDR50 SDIO card at address 0001
> IIUC, this will also slow down SD & MMC probing,
> but an additional 20 ms seems acceptable?
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6e5ea0213b477..73ecbcf588c65 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1182,6 +1182,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>  	mmc = mmc_alloc_host(sizeof(struct meson_host), &pdev->dev);
>  	if (!mmc)
>  		return -ENOMEM;
> +	mmc->ios.power_delay_ms = 20;
>  	host = mmc_priv(mmc);
>  	host->mmc = mmc;
>  	host->dev = &pdev->dev;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
