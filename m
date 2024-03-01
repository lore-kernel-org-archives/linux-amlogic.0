Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2384DC5475B
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2024 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d057j+7Dv7Iz/cL/EcS5Gx3vUnGHvDiF+CaXljzBGHM=; b=SWIUJM7nUGbIVQ
	WyRnogjFaO2TOSl45PHG0F9Nez3fE9dxyILL3EVxaVmNozKWYAkZxSxf/x86zPNpeOYCO+50E+JzW
	RA4BSaejmUV8ih43AnSrilT8IXyfFkug16ie7G6iAgExyUppUVWVo600v/YqrSJEFQBqsn8rONACo
	y2gre5U5YYfjMSKkdXQ+2+mBKdD16Qn4zjUhEao1Nc/oFl3NX/No6OtrBXX1Eo+vZP5hkSxvKaDzF
	1w+IMZtmC7/K4MdqmxGzV6ThCxDuLyrQXNccozYMxIKIjCa/UOfQUEqxuBxqQdgEniFGykjA8DMax
	XN+h3TUQVG5NMVnngeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4ps-00000000tay-0eq0;
	Fri, 01 Mar 2024 15:30:08 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4pp-00000000tYx-08ga
	for linux-amlogic@lists.infradead.org;
	Fri, 01 Mar 2024 15:30:06 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2d24a727f78so25620331fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 01 Mar 2024 07:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709307002; x=1709911802; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=BRJMyL12Hfga3nBS66W3o9I5fxawyXMCNLNUrn0/Hvw=;
        b=fbMQipMj5g6SzzQeJ04m0HiviGkH/uYiqiN+bnGZBgu8zXC0O4kAf2nN/Y+TVamV3i
         JUywzLYNfLjwl+6LgqTgjo6/GKxGCs+iEtSjXQzLdc0tT7JtwCvIn90WCxwj/ABY4Zdc
         /1DqCNrwGbp47fV9Zh2nd7OiWiK1adSmkKUQEN+aacSTu/to8h2vm5EFFyGnUAAhyeXA
         eTx+t8p4EukW2Yrdy6CvEt5bkMiOAhRpfTOO6mg48y1rj55C7mRNAv91Bhjdss3FyBl9
         gt/MDX5BUGhuqvQTWGXRsgJL1H26mIGfhyx3wAupD0AhIm7J9k7XZ4agZvDEyarY5zuB
         YJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709307002; x=1709911802;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRJMyL12Hfga3nBS66W3o9I5fxawyXMCNLNUrn0/Hvw=;
        b=Y0U+omKluppVv1cK/lyBbc9SSQ2YMMiezGH3lSUZv6gm8PaKXUPQnh3puuu/jOoZ7F
         GUfXKdEoI2YlT5P+F0RQ3vUBbPW372Xh7lz74urpMLkgLVegv5YYk1xG+hJjwJsa7f8w
         Lvl6TVfxqVIpmyqM0Yq4LSTeTtiUNAYEzzNQHyUWSbDdUhdLzM+NoiKbY257qtJRErbv
         5MjubxtIkMUM3B+gA9B6eKpBJ81aNaRMNPc7CJ37hlDbFSxK9ekAsYpNMJZbfDA0LUSQ
         +xrIcEZbDDW7FvdQOzoKC9dMT8JNn1Ljisqm30sGbulqfEeJjZtA6B5r+nh6zpOXVzHo
         xIcw==
X-Forwarded-Encrypted: i=1; AJvYcCWaPoYLqufmv4vFFEEF7N+KKFf2sDih7r0hBrzGJPs0m/d5rI/ForhMsqe9JzeOwjy+ANXSmIyaYKG/GlQcRICSsYxy0bbnGGOlaLcEUKgtHqM=
X-Gm-Message-State: AOJu0YwI70iPtfVtnL3+VfRjxOM5m14Eds4uvjg2Zzsyr7lznDwPDLQY
	EYZHKnY4SgHrShqXQzZiTfqVwwvEpY2MuRI/mO9M1TwL6Aq0fanijEvA9/2+Daw=
X-Google-Smtp-Source: AGHT+IFtbsethllwdu9/U10rpGbV0itlW8rLnEVMWQkX3g7hsPRaSzXqc3jmdeQd4Le6Db0GX6+1Dg==
X-Received: by 2002:a2e:7d01:0:b0:2d2:b651:b0c3 with SMTP id y1-20020a2e7d01000000b002d2b651b0c3mr1563443ljc.49.1709307002212;
        Fri, 01 Mar 2024 07:30:02 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:efbe:c807:bcd8:19bf])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b0033d67791dc0sm4797347wrr.43.2024.03.01.07.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 07:30:01 -0800 (PST)
References: <20240301132936.621238-1-avromanov@salutedevices.com>
 <20240301132936.621238-4-avromanov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
Subject: Re: [PATCH v5 03/21] drivers: crypto: meson: make CLK controller
 optional
Date: Fri, 01 Mar 2024 16:21:20 +0100
In-reply-to: <20240301132936.621238-4-avromanov@salutedevices.com>
Message-ID: <1jwmqmrmva.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_073005_128573_198D35F8 
X-CRM114-Status: GOOD (  19.41  )
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


On Fri 01 Mar 2024 at 16:29, Alexey Romanov <avromanov@salutedevices.com> wrote:

> Amlogic crypto IP doesn't take a clock input on some
> SoCs: AXG / A1 / S4 / G12. So make it optional.
>

I commented this patch on v2 and the comment keep on being un-addressed.

The SoC either:
* has a clock that is required for the IP to work
* Or does not

It is not something you are free to provide or not.

For the record, I find very hard believe that some SoC would have clock,
and other would not, for the same HW.

Isn't it more likely that the clock just happens to be left enabled by
the bootloader on some SoC and it conviently allows to ignore it ?

> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index e9e733ed98e0..a3a69a59f476 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -269,16 +269,11 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
>  		return err;
>  	}
> -	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
> +
> +	mc->busclk = devm_clk_get_optional_enabled(&pdev->dev, "blkmv");
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
> @@ -306,7 +301,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  	meson_unregister_algs(mc);
>  error_flow:
>  	meson_free_chanlist(mc, mc->flow_cnt - 1);
> -	clk_disable_unprepare(mc->busclk);
>  	return err;
>  }
>  
> @@ -321,8 +315,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
>  	meson_unregister_algs(mc);
>  
>  	meson_free_chanlist(mc, mc->flow_cnt - 1);
> -
> -	clk_disable_unprepare(mc->busclk);
>  }
>  
>  static const struct meson_pdata meson_gxl_pdata = {


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
