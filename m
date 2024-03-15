Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD4AC54E69
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nONn0aPYGn/whIYwfVAM3HuA6RwhexdSWgTSuxm5GTQ=; b=cwfTNzsmRdIWfW
	SrMcdxmlT1BD9F3j1DGEkgZBKPC1OCHQGXBZ9HRbR13ZYr4q+gndFFdB+FVX/esuMC+SV5T/lVFKm
	Kvg2QleXPp2BlXLZBOLDnOcaWb775eRYmpVsFIMr1Av1ilDCEXI/6WMfjrLCbpWaXVWae7ZEOMDoh
	qeXAY2/3q+kzlzLy/jWTqsBAwisg3reSmifaCilsFAsqW6uLwvexCZvVhjoY4pbGpn2KdwhTgebP6
	pnbzhAz+W73p67EYr3Z5Ho3W6S0vrrwD0K+0t49lg9M4CM59990RMS+v1XKoxQm7cgeeiBqBjFZtd
	GJyDnCyZhTK+aN5BSv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4Yg-0000000HQkL-1C0J;
	Fri, 15 Mar 2024 10:13:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4Yc-0000000HQhx-3V0Q
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Mar 2024 10:13:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-413fff2aa2aso4684685e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2024 03:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710497576; x=1711102376; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=LQKgoyfzzduaJ5jov9NmJ8PCZR9rXm8iDmJsBk54NZ8=;
        b=W9rJAAzrxVt8+jNiRUSR8wJYJ/i0VwGsqonlHxy5yXwOf2Zb/VaVUI8iD2FJMs0TmJ
         tMz0ud7xP2+U+/Ldx263QuHGP/gQJh90PLy2b49n39MVwo7jOd9j38VdxIcYxdM90LHe
         iGtfvczKzi7RGrSR5xCMeeJP5xVQr8151e5lED8ShkN27tVPtv/7tDVoRoOKCYYmKQlP
         UMWV7q1xQUGD+DVOLCZimZ0WjUahSiwi36W6DmdKzUQZWB21bKzdDTrRcNWhmisoUdm6
         PolqjiBp2JLkmn0i9zACvCBFY3DJrp4h3yEY1hmeZROYnKAlxAzUE6tjJgJDmpYy/VzW
         O/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710497576; x=1711102376;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQKgoyfzzduaJ5jov9NmJ8PCZR9rXm8iDmJsBk54NZ8=;
        b=qPJW5lF8Wd6jzqCmHDDqG6gm8VDgCAsPqc47PHK2RkxoP/bevxh+4XYyLgqJ53u2/8
         vzAsvFlM/C8myh5mmYl2Xq3mbLEeTs65/T5fVmiPFbWMtdm894/cOgPtAb37xvgoYzfo
         N/Fb3QwiHsl3EcE9+6aZ/AIZeYnLZ7JI0EzyNrNpqRCgAuiJyhaGZh6FnBFYEQ65bB/6
         lyt7V5du2cSLhvyVmyFf+mOSRXzJ11J74bRhZ6eLWZw6r4kHyxzQ6ThnmYh6RSVBuekX
         8Uoh3PV4LyIWsMEVWM6nWYlqE8urQSoMnTHziAo0SwbmYffKNb1nqPHr48llJ1JUOvmY
         mr5g==
X-Forwarded-Encrypted: i=1; AJvYcCXWDSaH+DPI8wy3NmOSAouN3evmyM1I4A4nUH9Ny22qKHUw7ge7KLiV7VAGqcLXwhHWGHHszY9fBE5s2YD/f74HUw94SwoF2cvk+vZ3OLhyz+4=
X-Gm-Message-State: AOJu0YxCzgabz73Up2XmLGskSpAIEnWWubkJZlaTvDlexBoI8IYeS4iv
	MAPTnSYLE5u90014D1XNVcIq6BsAhnGfmYjYw+1rWs4KEn8L0y1Y2KBPHDeEYqE=
X-Google-Smtp-Source: AGHT+IGkpPwSpcUKRjM84ML2A3Du8Hq7iROZC24mk3kzA01vpaV9CKlS3GgcL5y/xRPaeZYOGOCuww==
X-Received: by 2002:a05:600c:4eca:b0:414:1e0:2afa with SMTP id g10-20020a05600c4eca00b0041401e02afamr788040wmq.3.1710497575919;
        Fri, 15 Mar 2024 03:12:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id bu27-20020a056000079b00b0033ecbfc6941sm2481373wrb.110.2024.03.15.03.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:12:55 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-20-jan.dakinevich@salutedevices.com>
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
Subject: Re: [PATCH 19/25] ASoC: dt-bindings: meson: axg-sound-card: claim
 support of A1 SoC family
Date: Fri, 15 Mar 2024 11:06:52 +0100
In-reply-to: <20240314232201.2102178-20-jan.dakinevich@salutedevices.com>
Message-ID: <1jr0gbhkgp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_031258_921803_EFED7F54 
X-CRM114-Status: GOOD (  13.57  )
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

> Add "amlogic,a1-sound-card" compatible string alias to
> "amlogic,axg-sound-card".
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml   | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> index 5db718e4d0e7..492b41cc8ccd 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -14,7 +14,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: amlogic,axg-sound-card
> +    oneOf:
> +      - const: amlogic,axg-sound-card
> +      - items:
> +          - const: amlogic,a1-sound-card
> +          - const: amlogic,axg-sound-card

I know the rule about SoC related name but it is different here.
This does not describe HW in the SoC. 

The axg sound card is just a name, much like simple-card or
audio-graph-card. I could have named it "amlogic,my-awesome-card"

We would not add "amlogic,a1-simple-card", would we ?

It is purely a software component, which aggregate HW ones.


>    audio-aux-devs:
>      $ref: /schemas/types.yaml#/definitions/phandle-array


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
