Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D23C48260
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Feb 2024 00:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4/XSKePlitSFh07hd7oTo8tP5ts6Fcgdc9GFlpCro8=; b=hcQFt4doOZPPCi
	5Rqq06nOFtVkZ+L6at5BsBBoGcJ4szWKeQgq99qaHgIj/b/l9LsT4Im1DNQKco8eXH8G5B6Qtz3V4
	D4kk8HNeeqCZWfxN+RkxyDLvn7qcF0jBWVAOCaK7vvVx60xInkYrwYxRepkGd2T/FF+XmULTFvNO2
	eXVD0ecMAm5shQELuI2C7X+WfFrK2Xzfx7gsdfvCb1e4qMXVea5Fp31w5ocdgCvpesaOiR2WTAF9R
	GNYCeeMltKyhhVyu1uqg9YxAiwBUYg+HEDzc0VxHh2poAaNCzlgmWVO1iGwji2r7b89g6+WPVjh61
	sjoTg8MmZ8AQKBjNcVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra37M-0000000BMzW-11BD;
	Wed, 14 Feb 2024 00:27:16 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra37J-0000000BMyh-0IA3
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Feb 2024 00:27:14 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7c3e01a7fe0so235526139f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 16:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707870432; x=1708475232; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5T7AJQgyciJK6sFO1yWt0ErtUqKT+irq43WlU30JPg=;
        b=wrxCcwxJq5N0Ym/Y+eiykCiFKZ6nFJG/RXjFfP86Vyr/0opOZUiuEzcSLpy0pE3oEv
         xe1BVETF/x28jA9A/n3lDaOHUVQ3V2fM82cA34dSN9zbXvlqOUJt24efbdwbwlAheq7R
         BLjyzwwNEoZA5oFTftn/HbRDGKc9nIe83bu/4E8CYPNTpcCBiKOt/yuaIiS2UNV/8TRT
         psEOzlsQzjmjJRa0HJqfLEZJ6HTFwgRNdKzhBvJIXuLhKzoDxJ2SWkjWPnzbyS7cbiAV
         S73L2h/fFyBIl0A2yxOG/afKhQerQHBj+oOKFsoEjr26yK+yYBFguYwYe/KPjXQkY7S8
         8QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707870432; x=1708475232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5T7AJQgyciJK6sFO1yWt0ErtUqKT+irq43WlU30JPg=;
        b=rUwqs3IlY3Ir2pJ/LNMYPn1Pm4UXyPcVQcjA5UzMODCGa0Z/QchH21q6/ZOcEj2CWU
         vMQgIWf6gwvU31WplqQwpvMHbnIT04xdvFLIz08Xu8ZFRbQkJpt8SPaALoRsefsPl73e
         +H9GcxVwLSNPOyAL1WtXnNgtuoRVjvyj2keNedooYTgBnYoQiEMmcpuncLiWL5LEcSlb
         DyQg7F2Z6ydofYtmedoNNXqJi8QaeEnS/Q8ZL5WKfAyA5b1ux/j+PezneiFQYFefzAMZ
         gG2/B7NB0cKPb4ANcetY8XqeV++LdZxcCDwc+fbLMIJyaQ/onfwQ457n+pimv49ZI3dn
         okvA==
X-Forwarded-Encrypted: i=1; AJvYcCUoOpBXfcE7OTNOZHSCTBLV9K+guYcfSpSaisxWIM9HT4qdhtDZNAgKkDZDkquLsMJfZ0C5xzgtNDI3+7Gl+SSxc08g6/PTFPT7TmS7K4ryo4M=
X-Gm-Message-State: AOJu0YyobvMxKXC3sRsjP51+7JflJSKgLyZ0rhXBzX+oUJ1vj+BfZ6S5
	AivcVR+PIONXtYnsYOgLP16t0FTeYGPTLMzFRELh/2FJcMH5ZPjW5EcdJv5r2g==
X-Google-Smtp-Source: AGHT+IFlwS590K6G5HLkJzVAbnXNA3kjuDrNpfVIBkAOMMF2uKbvfvsNtgUXwFSf/vpyKj4XnjzfVA==
X-Received: by 2002:a05:6602:1c3:b0:7c4:19c7:646a with SMTP id w3-20020a05660201c300b007c419c7646amr1528777iot.19.1707870431645;
        Tue, 13 Feb 2024 16:27:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKbZdIao3MuWR588UKr53QbpcAZKhB9kXOjFoOwymzV+XRimiyLDuoM9Vs57HxOeDppfShIb00Z/u6rJ/tcurfJC3aTiIHy1JRA9nuzvdJSQyVigWL++i27Tg6fIAUmRPs3pe2p+FtKb8rdbUMwpszXHSfCYQ8lYx38ofWsyV43KntDzujWzjLLSYTYoTLz3/NQjxi7/US3Au353TFVbFIwDOwxfHDJfrUod67S4qui5i1m/1IHpqXQQ8wnRjb8MTF97izsHtcc/FdPHceEDqvEzUcFd3/ar9ByItkSBO9/+ufMNWKR/VqijYcxsIvZSPceDEMFIXWklvAyj1SFYHkWcQ5tDpEWTfPAvBv2CiYeyyLsoEeJXsoz8uTOZZuo2pDMSlEFzbAPlrHbAeBfQJJPM17PdZXYkPCbH0wUEjQyBL/W9YvrBKJV/h/Xh6m+14cbyX11OSRs9vYRixUqjBQBfEct7pfYePjSPdHykil6zADzWKQp4GEBbBYxlESGl2IAPVmFP5hsrMppTcEWxjF2HY22Cx0LgkOQRCIACoGIRiPq0cj6S3iAoDhbjgIvMmD+SLjXHsNtqaZMzM=
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id cp27-20020a056638481b00b0047140ce03casm2180833jab.22.2024.02.13.16.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 16:27:11 -0800 (PST)
Date: Wed, 14 Feb 2024 00:27:08 +0000
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
Subject: Re: [PATCH v2 2/2] ASoC: meson: t9015: fix function pointer type
 mismatch
Message-ID: <20240214002708.bhpvpt7cv7o4os5t@google.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
 <20240213215807.3326688-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213215807.3326688-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_162713_139918_E44AC4EA 
X-CRM114-Status: GOOD (  22.06  )
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

On Tue, Feb 13, 2024 at 10:58:04PM +0100, Jerome Brunet wrote:
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
>
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   274 |                         (void(*)(void *))clk_disable_unprepare,
>
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
>
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  sound/soc/meson/t9015.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..571f65788c59 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -48,7 +48,6 @@
>  #define POWER_CFG	0x10
>
>  struct t9015 {
> -	struct clk *pclk;
>  	struct regulator *avdd;
>  };
>
> @@ -249,6 +248,7 @@ static int t9015_probe(struct platform_device *pdev)
>  	struct t9015 *priv;
>  	void __iomem *regs;
>  	struct regmap *regmap;
> +	struct clk *pclk;
>  	int ret;
>
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -256,26 +256,14 @@ static int t9015_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, priv);
>
> -	priv->pclk = devm_clk_get(dev, "pclk");
> -	if (IS_ERR(priv->pclk))
> -		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get core clock\n");
> +	pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(pclk))
> +		return dev_err_probe(dev, PTR_ERR(pclk), "failed to get core clock\n");
>
>  	priv->avdd = devm_regulator_get(dev, "AVDD");
>  	if (IS_ERR(priv->avdd))
>  		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
>
> -	ret = clk_prepare_enable(priv->pclk);
> -	if (ret) {
> -		dev_err(dev, "core clock enable failed\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> -	if (ret)
> -		return ret;
> -
>  	ret = device_reset(dev);
>  	if (ret) {
>  		dev_err(dev, "reset failed\n");
> --
> 2.43.0
>
Thanks
Justin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
