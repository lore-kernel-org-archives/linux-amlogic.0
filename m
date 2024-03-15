Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC01C54E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvuIspPp1oHmRAPPBBrUgxAvyQMhENZNbS8GSz8B1fo=; b=sJdgCgzqowT8rt
	P+E/AmW030YAp/k7JHa11eNtdqhfdi8IuctbADSEQdyQaxRpstpFqeVH24dxwUPoNSkzWegutDXLU
	/KvQR+10AJX/qULiZe4AvQXxNOAhtPnHJyxyyM822Cu/g9JIF8gmIby4gerGzJempaJ/YGUbAQKO6
	eP/uEGzhg+0+aMagujDNnL1OX6ZDIcBNkOyb3U1C5FkUgkP8avvsunNPUz/wLejno+dwL7RpW4Qep
	vUgIiKqeulgdhFZKzJrAbMCPDsztl2syfAPN8gJH3xvYnQGo6r/SHxTDINC5+I4Ya7JHdpVmKxfiG
	nMBq6IPUxg3g7mXH7tWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4gS-0000000HRq7-0gGY;
	Fri, 15 Mar 2024 10:21:04 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4gO-0000000HRn2-1sjd
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Mar 2024 10:21:02 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-513173e8191so2654912e87.1
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2024 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710498054; x=1711102854; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=6gMhyQcCq8fucjInJ87jHa5Zs8QHwH2ZIASN5Qcn1XU=;
        b=j9Jp7EisIO2E2J+5iE6LJ5Hbup1YW2ica85R60JMemdWzWJBp+8dZxk8AXfHWUGHh7
         vwGtEUBGy5ucQ/GF3CcqVJOBT2mFbPJJ4K5GltRLoweHCfLFhCJzIjCQkIrKtSnDbgkg
         GIdih6dFI9nGHzlyEmr/IHftGJ9y8W9jwB+kQu4NGVMA1ncGuXlnzMjvqTGvi45AfFzt
         kUlA+5XDAD6i7qY7OL8vBSEDr50nh3wlNU4wALrLFJvFGmH+Wf78fayPfCQpZsOehlA9
         e9Eis+EcmhxfWgIoRI/j1FRugx/if7Ct8a5gUSwvcUyrZ2gMJGFUprcGrJac+Q0Mh7qB
         e/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498054; x=1711102854;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gMhyQcCq8fucjInJ87jHa5Zs8QHwH2ZIASN5Qcn1XU=;
        b=jz1SOFIopgLRvn3mBiz91wNsunhue6skxR4ZzpKaYW+TrAaE/4EzDqTnA5k1HzGdst
         lB00Bj9kSLweq1YJ4fhTR8FrOJR08o72WktJ9c8Qm/XIf921+u5mzKWYfgCVESO1YR0X
         5ZtI2C7ahOFo5zire+HPJYsYUwS3LnVQvMYNvSCD5F19RdxhRV9s2I6KQJtu6wvizYvg
         5xnS1yypAkaVj9goEQlRtChll/w6ZrCYCMRfVkgemZ3O3IE0IFo9OTpC0pwJehaUAjfQ
         88qnJJHKm6QShwplEPMdRMkTHo6SSs0lthGJm6UUIdPdKnHXNPanpricf/x5oVJJvcaJ
         8pJw==
X-Forwarded-Encrypted: i=1; AJvYcCV0+f5amVNe7oEigKbELvF5miR8IrzVW7EjrT7xqa+ZRSX7SK6TeR4CHteEia6R5rXv+veqxpmfxQuHDQWDpCQG3kcPFTl9LRzgrF8liPbyMTg=
X-Gm-Message-State: AOJu0YztfznjR7wLFxQYPLqdcSbHzZHwe869+C32VETu8M27Kte5Lj0q
	1u4XQPOqNwD7eH1AaE5YfknaSDzTM8mR7zqc9h9oDc8vUOF3e927Z4x5po8aAHk=
X-Google-Smtp-Source: AGHT+IE93RWjsQIaXcrXP7QebJrBXb65k9rloMkqM4nhLZfNJA/HvogTh3saXyVEmcMBtfGaiLq/Mg==
X-Received: by 2002:ac2:4348:0:b0:513:42e:ddf0 with SMTP id o8-20020ac24348000000b00513042eddf0mr2648632lfl.36.1710498054118;
        Fri, 15 Mar 2024 03:20:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c3b8700b00413ea3db648sm8058358wms.26.2024.03.15.03.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:20:53 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-22-jan.dakinevich@salutedevices.com>
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
Subject: Re: [PATCH 21/25] ASoC: dt-bindings: meson: axg-tdm-iface: claim
 support of A1 SoC family
Date: Fri, 15 Mar 2024 11:13:48 +0100
In-reply-to: <20240314232201.2102178-22-jan.dakinevich@salutedevices.com>
Message-ID: <1jmsqzhk3e.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_032100_749204_8B6B986B 
X-CRM114-Status: GOOD (  15.88  )
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

> Add "amlogic,a1-tdm-iface" compatible string alias to
> "amlogic,axg-tdm-iface".
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> index 45955d8a26d1..7c1af85b52b4 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> @@ -14,7 +14,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: amlogic,axg-tdm-iface
> +    oneOf:
> +      - const: amlogic,axg-tdm-iface
> +      - items:
> +          - const: amlogic,a1-tdm-iface
> +          - const: amlogic,axg-tdm-iface

Same as the card driver. I could have named it "amlogic,tdm-iface"

This is purely a SW component, which help agregate clocks and
tdm-formatters. It is analog to a "gpio-leds" or a "pwm-clock"
driver. We would add a compatible for every SoC for these, would we ?

I don't think it makes a lot of sense to add this. It is not going to
hurt but this is just adding useless compatible to the doc that will
never be used

>  
>    "#sound-dai-cells":
>      const: 0


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
