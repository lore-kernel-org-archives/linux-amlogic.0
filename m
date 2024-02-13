Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC2FC4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlb1VQOa4A5O3qLU2cNiC/eK4xoaeEKKv9ObzA4xkRU=; b=KUqmSXS6bMmCjh
	/cfc+2n9Wuy/u108b8XrPfn1nrkyTk3yxM7bUBZjcWG6jNFAHflz6NSjAXKIKh2vUP4pizAuhC/1M
	PlN/zWeKAzZnDCYCfTsvzO+gjr1WvfiK8ELrRK+ckMbHk8YPDSTW/fd/RXTfrEVbeypQqzvCDUyKC
	x523N3vEv4J49epLASHK8UJH/IQejqO1pon4QXOKslOcxNbIeKpz5rqp3HKiLodiUpvpZIei+iX9r
	nxDrGPymzVquig/c5x4rrcsW7qUjYyagmQCUnWlvvqPcaylSr98zka9KNoQ/gKLvttXYjsaWbTL1W
	8qtxQ10Pr7eRJ95AZAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqDH-00000008sCj-0Ah9;
	Tue, 13 Feb 2024 10:40:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqDD-00000008sBm-3st4
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 10:40:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-410c804e933so16089345e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707820825; x=1708425625; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=73nQOWwOG85LqUQijwY3y2kTDnNiZFOlELYxkV2QtZQ=;
        b=N4lv0gxD9CwGV0CX0xC9eXtiZkB3h4BS9Nm7CosC0zewO879puT3nNDifmC6qEViBw
         xz8EJWhNR6XqBAonLfwQung+f1Kk6CAdUEQGIDZMISujpI/zhcYym4j6tiusbxj7C2Vs
         Mv2Vituyj8djq3TJZ1QrrZAb60PGkahBlhbd+mufcMqZpHEtJQ8zNi+NsORl5Zr6ttEH
         qsL2AHvn/dPp3j593TuZ2Sne6EYNA5CuUiW/rp3ojYa4dRQOmMTLn5rqI2c6TH+t8Rkb
         27WkqydvwBOrACyRnf3LTq8YNAayoqjYmjAILFInDb/CMLTqgHbhlxYI6yO8zaSDrl7L
         9JoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820825; x=1708425625;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73nQOWwOG85LqUQijwY3y2kTDnNiZFOlELYxkV2QtZQ=;
        b=ujRilcDs6Qr+Fa+BGhPbqEjKxmOPkutY9p/0BXm33+7tZCXorReEVLqeh9eSgQirN7
         KFv78yqZxABEO9uHGfwJz9b3wTXFXOLnxL5gYsmM63p9iLHCpOav5CYvN14tP/1TBHCD
         hx+yZPd8c/iJIQIFyAnu0exhCg2m9QCnBv45gYxQIltyFuMcBOXnuDTgOXLNDZmNTb/0
         EZsibjrpSLSqHVq2i+GUM/wYpkfp9usEj/TCj1Jz6miFpibGQcsBao+zQK1hSpyZp8l7
         ZBQpWgM6rDrYbHNj2GHVBfRLKlbZbZzCxUrloMnc2lYr5xQR7a/PZpKv9C4MfYckdCrs
         Baog==
X-Forwarded-Encrypted: i=1; AJvYcCUIxU9h0nBxF6uW/GcMImb5jhovVXmBSKFYu0j0uqQxa9KlXRdVbHW5AYUqHHW+tXTZjN2vnDgQ+q4vqPVU+Lk3412gx0UbVXvKywXMPr7sLGc=
X-Gm-Message-State: AOJu0YwUvugXhbtDRpZ4zpCJt2qLxa/C+MiY7kQZhSwo6WOUo+hcHvxp
	Pf0c1RpLTk48jc+e6c0LghzfuqIvN5wX4TZO7pYdH4bvS8aLCD2uWNhxMkuepWc=
X-Google-Smtp-Source: AGHT+IFE2dDl+7H9jhreEKYF+PUjtVPBRcNJ1aERTrrwwC5G4DL6A6zOSd3wAcqga8EO4wTyXt03Pg==
X-Received: by 2002:a05:600c:35d6:b0:410:bb99:af83 with SMTP id r22-20020a05600c35d600b00410bb99af83mr5171034wmq.23.1707820824810;
        Tue, 13 Feb 2024 02:40:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmcpbchwPyNzBfnbLcEYhaLnxRQSdBvMKjGg0MfaCh7YWyITG3KZKFcRYjfwe4AlHSq1gIXWIjsiVyv1IInLv1tZVd8zmquscCy1pDKYwdz6ynaEkFHraLMWSkLqh5TRj+L/JjihgJpQCVLPbPVfylHTV3batPXQXXindEdpdMqE0SUk5RUOICCx9f4Eb8h5DTJ8vDSxJbXIeNoJfFhXRq8lNOY7jMZ0c+xcyncspd16YHa0IkYhvVU1WUQqEArUfvTF+SOUM4Dt6OU0uFU2i45yO6k7zltzOl+BYRYI7XlCDdoZkIcl6ELjYAmedeiuco7vlSNcPnTNVtdkYiXPyrZF4K/En7BMlacB3N5g8zIxanpUjM7LvvquL2djRo3o6JaZB2FQXw7cwz+qwougFRtQ5bk+HRzQ8Ra85TnWjlTyaRM3YUC2vSlcte05ZhhsU6FN+8sVvI8CBvm84Yfr43mveqKKKtpCM3lfNAJocWu3ZsxvGPwGF945dM0y7mcsU7DT3vSkHlfGIfh+vu1JdHCc99fhNPmRDiBz88JQwxFhk5TEvCYmvJFBeL6rPDrBlBgM2F5Ni3KdJGf3GhrGtWo9/OtDGksh6UCEtuWoWIVDh1P6usyEPmTFpYFe0IEzH8GUOB4to5Jo8wRg+cp9MHbcK38SJVltJ8NNXA
Received: from localhost ([2a01:e0a:3c5:5fb1:509b:4241:48a3:e3e0])
        by smtp.gmail.com with ESMTPSA id m20-20020a7bce14000000b00410e0fd6179sm4811973wmc.34.2024.02.13.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 02:40:24 -0800 (PST)
References: <20240213101220.459641-1-arnd@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jerome
 Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Date: Tue, 13 Feb 2024 11:36:28 +0100
In-reply-to: <20240213101220.459641-1-arnd@kernel.org>
Message-ID: <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_024028_218219_10DC24FB 
X-CRM114-Status: GOOD (  22.97  )
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


On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Casting between incompatible function types causes a warning with clang-16
> because it breaks control flow integrity (KCFI) rules:
>
> sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to
> 'void (*)(void *)' converts to incompatible function type
> [-Werror,-Wcast-function-type-strict]
>   243 |                                        (void(*)(void *))clk_disable_unprepare,
>       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>   406 |         __devm_add_action_or_reset(dev, action, data, #action)
>       |                                         ^~~~~~
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to
> 'void (*)(void *)' converts to incompatible function type
> [-Werror,-Wcast-function-type-strict]
>   274 |                         (void(*)(void *))clk_disable_unprepare,
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>   406 |         __devm_add_action_or_reset(dev, action, data, #action)
>       |                                         ^~~~~~
>
> These two meson drivers cast clk_disable_unprepare() into a different type
> in order to have it automatically called from the driver relase. Add
> trivial helpers to do the same using correct types.
>
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/meson/aiu.c   | 9 ++++++---
>  sound/soc/meson/t9015.c | 9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 7109b81cc3d0..211f360df284 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -209,6 +209,11 @@ static const char * const aiu_spdif_ids[] = {
>  	[MCLK]	= "spdif_mclk_sel"
>  };
>  
> +static void aiu_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>  static int aiu_clk_get(struct device *dev)
>  {
>  	struct aiu *aiu = dev_get_drvdata(dev);
> @@ -239,9 +244,7 @@ static int aiu_clk_get(struct device *dev)
>  		return ret;
>  	}
>  
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       aiu->pclk);
> +	ret = devm_add_action_or_reset(dev, aiu_clk_disable, aiu->pclk);

Hi Arnd,

This probably pre-dates the introduction of devm_clk_get_enabled()
It would probably be better to use that instead of duplicating helper
functions which do the same thing.

If for any reason it is not possible, a common helper in clk.h would
preferable I think.

>  	if (ret)
>  		dev_err(dev, "failed to add reset action on pclk");
>  
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..e0f9a603a5e9 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -243,6 +243,11 @@ static const struct regmap_config t9015_regmap_config = {
>  	.max_register		= POWER_CFG,
>  };
>  
> +static void t9015_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>  static int t9015_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -270,9 +275,7 @@ static int t9015_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> +	ret = devm_add_action_or_reset(dev, t9015_clk_disable, priv->pclk);
>  	if (ret)
>  		return ret;


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
