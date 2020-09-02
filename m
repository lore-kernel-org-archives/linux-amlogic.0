Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA59C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 06:58:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5FB42075D
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 06:58:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A0INqTAn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NWvCEb+z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5FB42075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AVMPa1PpH56Py+ovq7qXdpLreoV9rZPh4F8sstQH63E=; b=A0INqTAnfqjAE96fjtFqG3WHq
	RZJ7qVYUpe9GxD8QOqluzf/y41NvJrVMpQ3naukAx4Q288ek9a6F9FRHkCBdXCCUcmilTGcj2t7iv
	a8EHU0mFXtIpANqRyUOSQ+w2xgT5nt4LyTxW+NE4AZ/N5elMDNsa3KnR12UMuxthtCC3FjynT8LAq
	7kNF1mIzybqZGj5rhfaI77qK4gGdORccSQye3AVImCiKVCmoyjP1xou6nd1JEUWECA2Aeb61MrWfq
	EfoQ/6nFqjSGR/52EQKUeR+r+UbWyNx3tJvSivCZnfXCyNGRj4HOmUvQetitIYnQ3XXLWv5uLZmZD
	PrCDx230Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDMiO-0004ob-5L; Wed, 02 Sep 2020 06:57:52 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDMiJ-0004nI-5w
 for linux-amlogic@lists.infradead.org; Wed, 02 Sep 2020 06:57:48 +0000
Received: by mail-wm1-x342.google.com with SMTP id z9so3347003wmk.1
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Sep 2020 23:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GrzbmRuj72YZ3pli3rvyAq1e20yZwoLmmyUmuPtijtA=;
 b=NWvCEb+zfjY47tPLxhm20C8AfNWrZ4AwUS7O506Fj3AjRzeMZgv85mtHhKzLCkirg+
 0N7OX+Z6ZJvyV9iaRuokLFJECgSzeXpQnoe2bHfIcFpsbH3W29f9/7/ZzvIuLTSW+gUJ
 MbDmTJuEZV1ClxnpOETmy4m9ZxbL9a8WZZ52+26OyNq1S8PDv6GvrTVXzSeKzJNRrhiz
 vYBFE0RG4/pEQosiIzohvKNXTWNFx8Sy8+iHrEVVoXAeN1bGwEXG+QgIa1sVjOixtAMW
 UjomBKZ8g8723Oe/jX/XIYhR5BNcbMIBduUVjd4O/FeVR6VcrHjvtvgShHMeLR4c0NA7
 zvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GrzbmRuj72YZ3pli3rvyAq1e20yZwoLmmyUmuPtijtA=;
 b=jbu/yGkxcyFr0CRvJrzinx8v1SsHiySprT86m7dGPehKsx7kkf3UwtZuujyA8gvoWN
 NRorC6LnfSiA05hUv0/8ipSdd9qBK9STdaZScEInWkG6C3KUKR2+IqWDKPAlqBOL465G
 hWDXSar6FeFTXiE9waktzimp2dATi9Cppx9b/XHpgYCz/l7KMHsP33FOgGQofYjp3noE
 5/7lKspZQmBZhtaLcTob/CU/XmMo29YrlGOnI00T+rpiLm/kdEFqAqSgcVYUoeW5Z01Z
 VrtM2to7s2qE7d0/DKUEmeAqAT+G1IHihbbsOj1z2I96j/gkpTU/O3Et2dMDz60xAxF0
 balA==
X-Gm-Message-State: AOAM531hfLpx6z5hvVp+57b9zxh4FqniiCN/1TTa3HykXBjSEvvI5UNl
 lmuWl09UkfWgjxClLUMUsiRmow==
X-Google-Smtp-Source: ABdhPJywo9I+yPyBED9hZ0Xjx19xwNmG3spDAmDqWtKbgYwoWZXYbaSca2kyMeafOO4ms2yXxh7FXw==
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr5215277wma.171.1599029864140; 
 Tue, 01 Sep 2020 23:57:44 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y1sm5692087wru.87.2020.09.01.23.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 23:57:43 -0700 (PDT)
Subject: Re: [PATCH] Revert "usb: dwc3: meson-g12a: fix shared reset control
 use"
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200827144810.26657-1-aouledameur@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <4e7c19de-f276-7b2a-695a-ef83c1477d19@baylibre.com>
Date: Wed, 2 Sep 2020 08:57:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827144810.26657-1-aouledameur@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_025747_347323_3A59352C 
X-CRM114-Status: GOOD (  22.23  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Dan Robertson <dan@dlrobertson.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Felipe, Greg,

Is it possible to apply this ? USB is broken on 5.8 stable and 5.9-rc on multiple GXL/GXM boards.

Thanks,
Neil

On 27/08/2020 16:48, Amjad Ouled-Ameur wrote:
> This reverts commit 7a410953d1fb4dbe91ffcfdee9cbbf889d19b0d7.
> 
> This commit breaks USB on meson-gxl-s905x-libretech-cc. Reverting
> the change solves the issue.
> 
> In fact, according to the reset framework code, consumers must not use
> reset_control_(de)assert() on shared reset lines when reset_control_reset
> has been used, and vice-versa.
> 
> Moreover, with this commit, usb is not guaranted to be reset since the
> reset is likely to be initially deasserted.
> 
> Reverting the commit will bring back the suspend warning mentioned in the
> commit description. Nevertheless, a warning is much less critical than
> breaking dwc3-meson-g12a USB completely. We will address the warning
> issue in another way as a 2nd step.
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/usb/dwc3/dwc3-meson-g12a.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 88b75b5a039c..1f7f4d88ed9d 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  		goto err_disable_clks;
>  	}
>  
> -	ret = reset_control_deassert(priv->reset);
> +	ret = reset_control_reset(priv->reset);
>  	if (ret)
> -		goto err_assert_reset;
> +		goto err_disable_clks;
>  
>  	ret = dwc3_meson_g12a_get_phys(priv);
>  	if (ret)
> -		goto err_assert_reset;
> +		goto err_disable_clks;
>  
>  	ret = priv->drvdata->setup_regmaps(priv, base);
>  	if (ret)
> @@ -752,7 +752,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	if (priv->vbus) {
>  		ret = regulator_enable(priv->vbus);
>  		if (ret)
> -			goto err_assert_reset;
> +			goto err_disable_clks;
>  	}
>  
>  	/* Get dr_mode */
> @@ -765,13 +765,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  
>  	ret = priv->drvdata->usb_init(priv);
>  	if (ret)
> -		goto err_assert_reset;
> +		goto err_disable_clks;
>  
>  	/* Init PHYs */
>  	for (i = 0 ; i < PHY_COUNT ; ++i) {
>  		ret = phy_init(priv->phys[i]);
>  		if (ret)
> -			goto err_assert_reset;
> +			goto err_disable_clks;
>  	}
>  
>  	/* Set PHY Power */
> @@ -809,9 +809,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	for (i = 0 ; i < PHY_COUNT ; ++i)
>  		phy_exit(priv->phys[i]);
>  
> -err_assert_reset:
> -	reset_control_assert(priv->reset);
> -
>  err_disable_clks:
>  	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
>  				   priv->drvdata->clks);
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
