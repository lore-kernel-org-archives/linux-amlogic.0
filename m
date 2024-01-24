Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F054C47DDC
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cssdzolTO4faB+ORoJJHjolYFNtBar+19sgN/d0c/Bg=; b=mPYP+f/P+6xrYA
	OCiW9cWpUFUQXcO01JZ6LBSwaeAOHKO/T9BkdSpA8YgUMnaWzqRvTlTjWvuRg/DC6AYXdTrIn7MsI
	cIo1fRtkxkGHcrJB2RtqjDmy9RVr+9puuLMHhQNLNCAYd9d/BrJfEdqxYX2R1RsEh7WlOI4R8hOkQ
	OZdQoqrXAyiNMVGm5noCOS0Lt+bnse3b5hABJGVD+pz703aZu5V5XyhlQkNuUI1AlBK+5/vV2vyCz
	0qx+2ZFBWE3axMZfbU7PUOJKxW4Tp11JUL5jWeGIxXDPCatqagxVmcQknjcuWQK26IUj/F/YGzjAK
	96eoMhru67vaIE+iD8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYmK-0021yy-1j;
	Wed, 24 Jan 2024 08:38:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYmF-0021wc-0u
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jan 2024 08:38:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33924df7245so3926199f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jan 2024 00:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1706085507; x=1706690307; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=h1FUWfiTuw8iaOnUVAaUBuSlg9Mxe6vb31eu30jmGPc=;
        b=WAQNbUgKnQUogXLlNzoobgj/ndz95YWquyiY4rphLpG/UMDYz9nfYuQzr6LJJVRyCG
         lvHyClj0Let2P1FU7J7W1ZP5EQFAf1qf2CnJ/JNlgFaKW0hvtcDOEpjyEFgEHtZdKovq
         4PBO6AKaJ6trsdTDGy3jlANM42wy5E3H7gSAovb551yD1fD6s15NXNsUr9FYQqv94ZAn
         3Lq1L5Y+2B4jSbPphks5LGhMXr00NU7RCfXzF91VToaaOaVmTL8gjk9mW6pDCwa0ywUP
         WqpIgn0gGUHJFKd+8kfrSn4wKOH6GhVfTMF9JwwMbdy8c+dtVwBpRPFahK9mtBtxbLfw
         mkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706085507; x=1706690307;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1FUWfiTuw8iaOnUVAaUBuSlg9Mxe6vb31eu30jmGPc=;
        b=e1dUbGph13ma8BUVvPp5jOdrsrUr4+nYOvIBlkUjwryKszCrn/hZmWB+ztoIzvSf3K
         Wuak4ADoBG50SN36oPjrDfLHhzAa43uCakOw252EShasg4lPmhrYukytO2SQ5o8NXcJo
         8/NiJ6ZpTBK6BF+dagH3eWTaOiXPvl4SUhgHdDH5bkZy68o+iNZTCKFzvYiioIqqGKzx
         i+RopqNWJLeQhn3yAWldd6FOAtMw/kpIph4SQK3JYzHIybKolvBFuKq/jIbV8j9wwZF+
         CWbqVdU+Rkh5aNzADovfCqQnFmQOnQe6zjAkh3rm5hh8pmI4bc8SB7UtMXjeSSRtc8Pi
         3gQQ==
X-Gm-Message-State: AOJu0Ywck4mNZknHKWpSTSmgKVL0w8qWkePkJFc+pOmK6mONvnjU53wA
	JzlI8i5sSNNBij6fVDutpVkOds2Aq9sfLLWuoyFuzA95ZdLRAwKpAe4Aw+VbYiY=
X-Google-Smtp-Source: AGHT+IHWDnX0w1SzsoI8DA0xPySEzo5xJtqS7XZt2YHYZTHRfUc5D0hbaLhIUuqtBbzsb1EykQ2hjw==
X-Received: by 2002:a5d:6d52:0:b0:337:bcec:d45e with SMTP id k18-20020a5d6d52000000b00337bcecd45emr300741wri.35.1706085507028;
        Wed, 24 Jan 2024 00:38:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d8b6:17b6:386f:c67b])
        by smtp.gmail.com with ESMTPSA id df10-20020a5d5b8a000000b0033947d7651asm2936415wrb.5.2024.01.24.00.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 00:38:26 -0800 (PST)
References: <20240123165831.970023-1-avromanov@salutedevices.com>
 <20240123165831.970023-3-avromanov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@salutedevices.com
Subject: Re: [PATCH v2 02/20] drivers: crypto: meson: make CLK controller
 optional
Date: Wed, 24 Jan 2024 09:28:00 +0100
In-reply-to: <20240123165831.970023-3-avromanov@salutedevices.com>
Message-ID: <1j34unxh1a.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_003831_499839_26E798AA 
X-CRM114-Status: GOOD (  16.36  )
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


On Tue 23 Jan 2024 at 19:58, Alexey Romanov <avromanov@salutedevices.com> wrote:

> Not all Amlogic SoC's uses CLK controller.

That's fairly short description and very likely to be wrong.

Of all the SoCs I have seen mentionned in the bindings, they all have clock
"controllers"

I'd assume you meant "this crypto ip does not take a clock input on some
SoCs", correct ?

If that is what you mean, giving the list of the SoCs which - according
to you - do or don't take a clock ip input would be helpful.

>
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 35ec64df5b3a..a58644be76e9 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -263,16 +263,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
>  		return err;
>  	}
> -	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
> +	mc->busclk = devm_clk_get_optional_enabled(&pdev->dev, "blkmv");

Assuming some SoC actually don't have an input clock (I'm not
convinced), the clock still ain't optional for the ones which do.

Use the compatible to properly claim the ressource (or not) 

>  	if (IS_ERR(mc->busclk)) {
>  		err = PTR_ERR(mc->busclk);
> -		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
> -		return err;
> -	}
> -
> -	err = clk_prepare_enable(mc->busclk);
> -	if (err != 0) {
> -		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
> +		dev_err(&pdev->dev, "Cannot get and enable core clock err=%d\n", err);
>  		return err;
>  	}
>  
> @@ -300,7 +294,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  	meson_unregister_algs(mc);
>  error_flow:
>  	meson_free_chanlist(mc, mc->flow_cnt - 1);
> -	clk_disable_unprepare(mc->busclk);
>  	return err;
>  }


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
