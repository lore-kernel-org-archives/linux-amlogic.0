Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12E4C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFOM+WOOi4kiido7V9HFUjB+mMA1p4C1LJNKuJ84RTQ=; b=XtSjsimFUa7DMc
	IXn42zgbtmcJWBkIwLHAch5WQ2p31t8mSEiJH6iE8nrihhrYhnNa8dtucyTZVqJNTYLLlzcGuWTdd
	JXyf6/5gZ9tgLtPja1VvMz00aRcBA4TrvasWkoTfke07UOrPUzgsW3FwIGStn4RGZL1wqRQu7OZjl
	km0uozAIOO7XH/WjIFDWVB2k9cs7gVbmZcFkU7oNNT7zdvlViUQJrYSDGK2sUZ1rIHxakefpFDZAN
	NtB4McisYkns2nbKrM6Bij54tM7sItSEq5SRRzEZ/oLD0RYJtwWVhq6cISZMsgLDZYDYHwCP0Rjg1
	Cun235yM8tPHMH6PFIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCVn-00CMV7-DG; Sat, 22 Oct 2022 11:17:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omCVj-00CMUH-R3; Sat, 22 Oct 2022 11:17:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id a10so8116362wrm.12;
        Sat, 22 Oct 2022 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sA2bYZ3XVFkUZakMtHzGrtRu5x6TpZKvmsdXi2XwhiU=;
        b=LrelL53esVvDNzK7JlacYsdBBKAepepdYLMIrIcNIeeHhVa0CuaqIOYUfvmzbwbbIV
         NUrqiHsKKB6Ns2d5VFp/KoiTjGUOmqPuOL/iiGJNpdh8NW2j8eJXs7C75rervmICZTxy
         vfxzETx2gzUbjmkNb94Y64Aj8G/oudHvIS6OI8ani/yGrCoTlehX8oDMuifaAUOrORAo
         rCz97u12NEcgJZ957knSWDXDe19R1mo3ZQQZVj5SpbnGwz3ICo5lJBT9M71dCMh9wgAC
         zs2laFFMtTsNGJqtsv41DA8PcTb8RCHFmretqQ9Jph2v6Erc5xTfzETtymCsUs7q5nl4
         mUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sA2bYZ3XVFkUZakMtHzGrtRu5x6TpZKvmsdXi2XwhiU=;
        b=ACkikMx66PZQMTm6yAtkHyUhAzokMXoTJwBYyFvVIwcETaK5BbP1WZfTn0bpJ0paXX
         4jMc/yO95dz5bXoppKfnlsIa68Qj6Tv2fOm6VfxB9E38g8Gyp2driT4L4slEj6cJwvHu
         3Gakzj5NX2+jczPrayeNmg/8GMgbPnrVSS/oR/QEp55Rpb6/caNauFAK1wQZEO4mgsDz
         5kGr1YS6qpccHo/YaEZqo6uyFMJfLZQSn4AxY5II3UuLueM11Z50gypgbqbplemVsUrC
         gz0Rz69nSdksFQvUbDl3EOL/qJFARGL3ZS+iehzxo7OKYcUHyNJmXLG2R4YGLZLdwtHO
         uNgA==
X-Gm-Message-State: ACrzQf07r204pGTT5GQ/2oij84YkUZgyje18urBMB+qEeAHr6pAFZ0nV
	6ocqyYTOTPhQbV+LVKP3nioxukTOhOw=
X-Google-Smtp-Source: AMsMyM4eOuJ+XVI2qTJ+GOs67GYd3px6vhRwo691fIFE3fng5a6GOhxZ/ZVSYagF1CpRvimIdXXmxA==
X-Received: by 2002:adf:b612:0:b0:236:5d1f:143a with SMTP id f18-20020adfb612000000b002365d1f143amr1922922wre.364.1666437468668;
        Sat, 22 Oct 2022 04:17:48 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b9bc:1400:71ea:e20e:31:587a? (dynamic-2a01-0c23-b9bc-1400-71ea-e20e-0031-587a.c23.pool.telefonica.de. [2a01:c23:b9bc:1400:71ea:e20e:31:587a])
        by smtp.googlemail.com with ESMTPSA id r9-20020a05600c458900b003b47b913901sm12817815wmo.1.2022.10.22.04.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 04:17:47 -0700 (PDT)
Message-ID: <32b218b0-b2cc-9401-8303-c09575ed5209@gmail.com>
Date: Sat, 22 Oct 2022 13:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
In-Reply-To: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_041751_927226_3886C8DF 
X-CRM114-Status: GOOD (  17.72  )
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

On 29.08.2022 20:52, Heiner Kallweit wrote:
> Currently we loop over meson_parm_read() up to 24mln times.
> This results in a unpredictable timeout period. In my case
> it's over 5s on a S905X4-based system. Make the timeout
> period predictable and set it to 100ms.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - remove an unrelated change
> ---
>  drivers/clk/meson/clk-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index daa025b6d..53b8e17e4 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -277,15 +277,15 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> -	int delay = 24000000;
> +	int delay = 5000;
>  
>  	do {
> -		/* Is the clock locked now ? */
> +		/* Is the clock locked now ? Time out after 100ms. */
>  		if (meson_parm_read(clk->map, &pll->l))
>  			return 0;
>  
> -		delay--;
> -	} while (delay > 0);
> +		udelay(20);
> +	} while (--delay);
>  
>  	return -ETIMEDOUT;
>  }

Hi Jerome,
on Sep 6th you responded that the patch has been applied.
https://patchwork.kernel.org/project/linux-amlogic/patch/a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com/
However I still don't see it in linux-next. Is it pending in some other tree?

Heiner

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
