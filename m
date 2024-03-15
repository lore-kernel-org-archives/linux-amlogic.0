Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D847C54E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 09:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQuU4qg1prinZ+fRnjB/C/n1hf5xAyaS6xdpQSlFihY=; b=jLid0FjFhteXSL
	toUjVj/aqRNvLEub9/vmeoG6ZdGpVHs00zHXtQKNEMVHM/aPZ+ONz6QsOIQ65P31BQFHO4yscE0c3
	c0Q1yxRZ1AN0n3/LAlZp/YxnqdAPaEGbPFHlx+TBNPkJJBNldyKzXe5uPsXRQ71tdcU6wITQwFSuy
	ecQaAjueMsFj+vSvuw4fahKPz0TIwYC9T4PlcOWSHNbrnvgnvCCmO8T8ptcgmSQdDcLoqAyhGIMaA
	6rid29ZGFU5GDsXrJa53FHvoSj0RRX27hurcUSZL6wO+qTeuvEz1SklSKh3eOqD05FB14okWKuxH8
	BcUM7PY6gOdkvhmDx4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl3W1-0000000HFhI-3epN;
	Fri, 15 Mar 2024 09:06:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl3Vv-0000000HFg4-396s
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Mar 2024 09:06:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41400a9844aso1671685e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2024 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710493565; x=1711098365; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpMSBa9vXitkcuu7vgMM3w3/yA6IqPigK2dGLCTN5uc=;
        b=XNeHgBKmw7uU76PO2zoE65UykRJqF17USEoETN9R0tHinZAUP6sabvhqt8ZPC6tc/Q
         Z3I3F8w6Bkriv0KN2xlmRUHoCOxhbm2Ty0K5Uyh3GhydfNDtvd7u50zEv9GbNzXykyy4
         KdwknHCHfMf8YgX/ajK5YYzfpJozBBhePI6OV7gEKGYbSQ4uU1Bxt7gliqI2WQq5kViU
         lcELC9dtFHz144oAu4ZRaEN1IRYNaAS96evb//R3aFlcdUHtGr7xNJcBysbHDefKZ0zJ
         OwIvRTj7Q2JewQxCF0BT36aGdvN9EmCAfwgUlzSjCIIKpYHe2NCbUToEkytTIoxllVNs
         dJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710493565; x=1711098365;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpMSBa9vXitkcuu7vgMM3w3/yA6IqPigK2dGLCTN5uc=;
        b=sOhamuCMpdNZExloEIx/C6Hwms+khWTGMPlHMiF2+KY8sYE9ueFziKYyv23O85AMC1
         Aj+26rHRuX829VX9YWBH4n5Pz1p+Z9vJgfCqM+d8FkQ8vrQgoSelNjfTgxc1RX4M1thx
         22OC9g1XtSIWFL45gQD91ch1GXvm9fwoG0WOKKYs9Pw4JdXxNjSV2hHp8xzec+uBMnYJ
         75Ep9DkBH+oGevbbF+cR4EA3nJDcLHY8kfREcG/KURTCY8lGGMRV2lPqoUYpE1WPomFl
         BBYJOBnVujwB1mhuivY5Vpl5+ETLRxOIUD2KfIcbyiH+tpqIROoHWbpgQmLahMPg1CRG
         +EdA==
X-Forwarded-Encrypted: i=1; AJvYcCVxidh26dtZBDcHXi2xKlBSbpnGUjvAqCt/sscOZrmJxXY5HxSDKlcGl6bmbzRjL0dgPK2LEAZ2UltDW0ocig58Bk9nZwzbWvjVh/E7cKRSriQ=
X-Gm-Message-State: AOJu0Yx2Za6YBXDFfR/CYywecuPicd/oCGGT/DG5totbk6+aW0mI1OfN
	8XzaOGpEEx6hGVKqB0V98WBtBSS08xhpY8sp/iM2WKClR9sSfDSdA6uXxwiDNOs=
X-Google-Smtp-Source: AGHT+IGv2qeT4+XV+fkhSqD7rZTLCUTw8RubHWgYTp3yu9LMq3zgewNkauR43y7qOB4OhUkwae7l8g==
X-Received: by 2002:a05:600c:4f11:b0:414:37f:2798 with SMTP id l17-20020a05600c4f1100b00414037f2798mr483210wmq.6.1710493564904;
        Fri, 15 Mar 2024 02:06:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id fj6-20020a05600c0c8600b00414024b2f49sm900044wmb.0.2024.03.15.02.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 02:06:04 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Date: Fri, 15 Mar 2024 09:58:50 +0100
In-reply-to: <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
Message-ID: <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_020608_212324_907A709F 
X-CRM114-Status: GOOD (  16.28  )
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


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Existing values were insufficient to produce accurate clock for audio
> devices. New values are safe and most suitable to produce 48000Hz sample
> rate.

The hifi pll is not about 48k only. I see no reason to restrict the PLL
to a single setting.

You've provided no justification why the PLL driver can't reach the same
setting for 48k. The setting below is just the crude part. the fine
tuning is done done with the frac parameter so I doubt this provides a
more accurate rate.

>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  drivers/clk/meson/a1-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 4325e8a6a3ef..00e06d03445b 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>  	},
>  };
>  
> -static const struct pll_mult_range hifi_pll_mult_range = {
> -	.min = 32,
> -	.max = 64,
> +static const struct pll_params_table hifi_pll_params_table[] = {
> +	PLL_PARAMS(128, 5),
> +	{ },
>  };
>  
>  static const struct reg_sequence hifi_init_regs[] = {
> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>  			.shift   = 6,
>  			.width   = 1,
>  		},
> -		.range = &hifi_pll_mult_range,
> +		.table = hifi_pll_params_table,
>  		.init_regs = hifi_init_regs,
>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>  	},


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
