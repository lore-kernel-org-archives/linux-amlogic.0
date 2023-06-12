Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA98C7EE25
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 10:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVJMxWZnoX9+ySjPXfz2XTx7H+QvAzDQBa0h5e80Vmc=; b=oRFZiQxvWRHSlGU5qT7/EutZWh
	VPDdiphSUSEczUj/57DV9eWl+Io5k4CzvfHoLabntFWvBxfQWepjrL+CkiRZaacYqk0MT9aPGhKWT
	cQ4QnddeFrHXdyDexJ0UKm8pobpbnujg8wGBz9tm2TiJ1aNJzbchKQOlONLheFKgy83SdMOmJn0AH
	ri0yUP95sidvXk7qzSkuV9dnjvnrThe5VpzfWMGPgZOfyMGi/JKz+ibmnIArtouTnbEGgCOe8yDn1
	UDxfd5WDAazkLuaXKY5oq5kuXyMi6qtU8wr9uda32CrhYlshcOq/0C48UFjM378jvozz/RtoeVtRG
	Nen8DMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eNE-003PlP-1w;
	Mon, 12 Jun 2023 10:02:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eNB-003Pk7-2D
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 10:02:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f7ff69824dso25954335e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686564124; x=1689156124;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UJOXI7NWxaGlAMXmYuetibwBgSH1F/dmnVvJT284BrM=;
        b=zTPoQQWJD84HcoJrFCn9mkD1PeO1xl6IsF1iIgYGywYMn17RqI5LlBb327geclH/U9
         ii4dKWruN8SDX5m1E4gw0L1YjfGKDrsWd3Tzq8Okhb3lYLkVTXjhtkFxtKcwFKWjIIv/
         c5wLuBzTtWFgxQ1Qb6TCT562Y6zKfZr+ZdHVF6Gw3NAVjaR+uYe1UO3dm8AoZ1HxEGhF
         eARSyilgLoEe8WMoTJwo9oOoBFLYXUhf8hsLn1315iyCU4kUmU5OtpGHQlgfOiUKCzCd
         wAXZj2ii6c+2+8Ghh22YG7poWtKRvnM6q+pGfyrRiT5WeTkDUxn7Q+Q6s1+juQJBdRDj
         d/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564124; x=1689156124;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJOXI7NWxaGlAMXmYuetibwBgSH1F/dmnVvJT284BrM=;
        b=gwWqzOfu2epL/XvctuyQqGlcaa1khNtbV2Ir0CCzWsG6JV8Q6oRr4dUZ13wPwPQaz3
         P6zUDVaGYf9uY6jHylvIVyVXJWAYCrlG9GlodMgs2LGpKvEhwLUzMCvGlv9Zzv21SyAF
         IXhnpUcRtBs3bYzEU0oAExmCdc7r90iTsdvVLTSP1Q+COoChTxwr/WPcaYuE7xE8Sd53
         tfSadQkrYFBRysQLHaHaX+f/eRpjHBYV85lweGwJj0LEvPbRyoHNe/3Vm4Hoi2ngRsFz
         IgjtVbj4eShgSEBPW3EwkEZYpgw0WX+nH4W5DKME1YY05++HkHMEtIVC69rCegZks2av
         6rlw==
X-Gm-Message-State: AC+VfDx9XQWLw51gPxHMV6t/jEAiK7e2gnyKp6aV1bjwBqAnmq1H7HKr
	zcZCMUmp6k/CNMb+KHiilvFSpA==
X-Google-Smtp-Source: ACHHUZ4uehM4jQ8rsUJZWcL5ncSWhd7m36oC/WdXiwDlPhdGAUTl4fXk3Aq4tkLkq9IE3ADNKvU8Jw==
X-Received: by 2002:a5d:6b43:0:b0:307:f75:f581 with SMTP id x3-20020a5d6b43000000b003070f75f581mr4652304wrw.18.1686564124203;
        Mon, 12 Jun 2023 03:02:04 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id c2-20020a5d5282000000b002fae7408544sm12009223wrv.108.2023.06.12.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:02:03 -0700 (PDT)
Message-ID: <5cb3a029-2452-dbeb-691f-1c29ab7019bc@linaro.org>
Date: Mon, 12 Jun 2023 12:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] usb: dwc3-meson-g12a: Fix an error handling path in
 dwc3_meson_g12a_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Felipe Balbi <balbi@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Hanjie Lin <hanjie.lin@amlogic.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <9d28466de1808ccc756b4cc25fc72c482d133d13.1686403934.git.christophe.jaillet@wanadoo.fr>
Organization: Linaro Developer Services
In-Reply-To: <9d28466de1808ccc756b4cc25fc72c482d133d13.1686403934.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030205_727349_01AE342E 
X-CRM114-Status: GOOD (  15.36  )
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

On 10/06/2023 15:32, Christophe JAILLET wrote:
> If dwc3_meson_g12a_otg_init() fails, resources allocated by the previous
> of_platform_populate() call should be released, as already done in the
> error handling path.
> 
> Fixes: 1e355f21d3fb ("usb: dwc3: Add Amlogic A1 DWC3 glue")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/usb/dwc3/dwc3-meson-g12a.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 365aec00d302..e99c7489dba0 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -796,7 +796,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>   
>   	ret = dwc3_meson_g12a_otg_init(pdev, priv);
>   	if (ret)
> -		goto err_phys_power;
> +		goto err_plat_depopulate;
>   
>   	pm_runtime_set_active(dev);
>   	pm_runtime_enable(dev);
> @@ -804,6 +804,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +err_plat_depopulate:
> +	of_platform_depopulate(dev);
> +
>   err_phys_power:
>   	for (i = 0 ; i < PHY_COUNT ; ++i)
>   		phy_power_off(priv->phys[i]);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
