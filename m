Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719CEC4829A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Feb 2024 00:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01RpEuvzGiwBFkp8MVZNoNNoUreLu+Uu0bBvdjS9QA0=; b=CiuEH1l7aA7IMm
	cibQvipeACGqZnGL/95K0yUSmXHUiIrfZtn2i7BhHkNuvFNyvOY/5Ti/HI79Y36oAymSf+OWmEi/M
	KpcQ5MRHPcIXMRBw/BtanzFXmjbI08kb9AiNQoyM5rb5UmbSB10B+WTTYs0jssXguNtfr736XOfEj
	w6u903sxYl9dklRn0l+UhMBc9q5IWLwSJKBSgo0+Kz8duv1MNcBTVTKH7xuzg+/0xWnwxnIqKEgj0
	vuHniA04+1rDNZumxfeFSpeSchr/UeFvDzRFvCdILRi3mrCyR31SYKMgtuRsBxxfRhvb/oJA8ie07
	o7x0/Zsj9/Dd/pfDx77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra33N-0000000BMTI-2aWh;
	Wed, 14 Feb 2024 00:23:09 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra33L-0000000BMSO-0Fmg
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Feb 2024 00:23:08 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-363b6848f95so16040345ab.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 16:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707870180; x=1708474980; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jWP8VrxhP1EJOZNrm4lfKLrk9GA9+9HRFG23gj3nBY=;
        b=0QDPxXEWjDRlSA4gXm3knrQMkpE0Dshy+KQ0e+y5GKZ4wrm/Awl6GKqhBXih6XAqcr
         IDcH9e5YF+ZQMwXI7h4S3EXNcPTIlWrcDF9nS5hvYxCToInmvVbmH+ABwfXSzezp9rUv
         ypXnmu9OPQGLIdVOoGvv8uJq1gY6L60vK5tY/9Sehq4mnr51ggFwQRDGqx7cmKSbxK/V
         W252JshBwaozZAakj2TC/Jag0dEG6ycgdCIYiO08qXGGHIKgcZxJJqUmJzmRw9usqbic
         nnsNkguIpWy8rrxwk0hVqEkIEr9bYzjyUqmID6dtqwlZrAL0qbvQGstErSqAGbruRa0p
         bpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707870180; x=1708474980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jWP8VrxhP1EJOZNrm4lfKLrk9GA9+9HRFG23gj3nBY=;
        b=M0CbSnS3g4D2iVBMmCXaXdGNS91JoiYXtBsNB/WURgCDvzlVHhcQQGzWW7tXIJUwAz
         cHGTFwGaziJSpZY06OUwYmm6EaqeXg7FusM7sND7dAAjpNBEnPjxCmb5sKzTj/ogEXG9
         N/P8ItDGkGdlC1gU9r2Nwalb2oFk9PwZbH+b6wWw6hUZbkiIJEi6y/EfExBe8H/YtyWj
         99xPrcGBJ56W35Rkik406xnPv+yvhKUCS/hJJJ1/6uHlzKGG7eIgLAFvY4YQXLeBi6ki
         13A/d70zGVBswWb6XSYXBLIWLUk9YUSbKnUgYx15xB0qto3Kh4jfeLg/0qmwFus9E3N8
         h9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCU0iUDoLIeBXCgyLBNAwA0iFgZnlXG3eNHPmZTz8OUKqGIEaHQvIFZAWzJ+D2G9YH7LQYvUiHQfDTw9IqXMCYS+85hiisRryPW3uyzsyMAD7Jg=
X-Gm-Message-State: AOJu0Yybr/UtrG7ob4U+1P1/JY3ELFbgvuVfQkiG6QMn7cH049ZLWyZB
	rOszJ9kWL5zYy7Cty/oykY+gvndmJogcwZohzgYW6ksOL+uoilpAbmMzHLfN8Q==
X-Google-Smtp-Source: AGHT+IGi6VVf6G6G8U5GGlsAZixQm5utU4tQarB9++MQ9JBSEGLE5FtrB605cWFIAkOkehjJn7O4vg==
X-Received: by 2002:a05:6e02:dd3:b0:363:9eb7:46ce with SMTP id l19-20020a056e020dd300b003639eb746cemr1293877ilj.11.1707870180370;
        Tue, 13 Feb 2024 16:23:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJKMkm18l+fATv5w8BOBEKdFq5seFQbl5h8/yelfPushV4gdBWN7jKSCWpz1BhL0Sti/1SuJTgYJ/fcVNH6XkrSm0NoaHSTSiI/fHwLilNsRJJtzimpBrGCTjtT9d3s2Ax3XegIe224IxqH7rcEwDA/kG7pamQItEMG58Jw4j5Ztxy29vglNeTsEkMdK0qDj8iMdP55M3/SCtxrS7QqjBNmHKuqoD07nm1SOMqL4/+aRObxOrky5V8t79knGogtBK/fly+mKEsz6LWFLZ/wRwleXiVozK6opOE16Q1C7tq1q89SonCNFWA89DU4D2TqFFavCW50sbPG+21GohBloHyGfw0ifOY2bFFrKJpEW3nXIMdIk7lVG+8R/xWdpNr5QXw1S7YliqMm+3mZOK0/P1E6lS9JjXddM/7Krxk56meFswS3dbQgAEWldQtjWJza6FMFw9c/mH20D+fWerx4TZ/afCihkwC1TzV+rBBmcZJRaKcldG2sFu38nMuPrF6aGgtI8dpeqPq8y0bVNRQfBUdTcdcWkCYI2pY3Cm0qX1G3/4M+87FoJzMfaTmNQydVUReHzA5OP8dyUn5MgQ=
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id s11-20020a056e021a0b00b00363a91effdbsm2807134ild.76.2024.02.13.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 16:22:59 -0800 (PST)
Date: Wed, 14 Feb 2024 00:22:57 +0000
From: Justin Stitt <justinstitt@google.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] ASoC: meson: aiu: fix function pointer type
 mismatch
Message-ID: <20240214002257.bfp6wk5j3wsaq6f6@google.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
 <20240213215807.3326688-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213215807.3326688-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_162307_153449_41167C72 
X-CRM114-Status: GOOD (  23.24  )
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

Hi,

On Tue, Feb 13, 2024 at 10:58:03PM +0100, Jerome Brunet wrote:
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
>
> sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   243 |                                        (void(*)(void *))clk_disable_unprepare,
>
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
>
> Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Silences the warning and makes the code more readable without adding any
new helpers. Awesome!

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  sound/soc/meson/aiu.c | 19 ++++---------------
>  sound/soc/meson/aiu.h |  1 -
>  2 files changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 7109b81cc3d0..5d1419ed7a62 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -212,11 +212,12 @@ static const char * const aiu_spdif_ids[] = {
>  static int aiu_clk_get(struct device *dev)
>  {
>  	struct aiu *aiu = dev_get_drvdata(dev);
> +	struct clk *pclk;
>  	int ret;
>
> -	aiu->pclk = devm_clk_get(dev, "pclk");
> -	if (IS_ERR(aiu->pclk))
> -		return dev_err_probe(dev, PTR_ERR(aiu->pclk), "Can't get the aiu pclk\n");
> +	pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(pclk))
> +		return dev_err_probe(dev, PTR_ERR(pclk), "Can't get the aiu pclk\n");
>
>  	aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
>  	if (IS_ERR(aiu->spdif_mclk))
> @@ -233,18 +234,6 @@ static int aiu_clk_get(struct device *dev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
>
> -	ret = clk_prepare_enable(aiu->pclk);
> -	if (ret) {
> -		dev_err(dev, "peripheral clock enable failed\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       aiu->pclk);
> -	if (ret)
> -		dev_err(dev, "failed to add reset action on pclk");
> -
>  	return ret;
>  }
>
> diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
> index 393b6c2307e4..0f94c8bf6081 100644
> --- a/sound/soc/meson/aiu.h
> +++ b/sound/soc/meson/aiu.h
> @@ -33,7 +33,6 @@ struct aiu_platform_data {
>  };
>
>  struct aiu {
> -	struct clk *pclk;
>  	struct clk *spdif_mclk;
>  	struct aiu_interface i2s;
>  	struct aiu_interface spdif;
> --
> 2.43.0
>
Thanks
Justin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
