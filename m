Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05862C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 18:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbzH87jnxc6R8UrNs3aDwqTAcwcf4GrVOgrcq21DXIE=; b=pZIF1ffVXMOZCn
	9nmT9kg/BmpwY8c+Sfv2gMlQB6Tbtkh2m8N4f4V+TQsXRPgLkiE2PRidn8v8jnX8qLntVJlt81Fpw
	Rh1xDAlWGV8F1dCh7xgcDWq+U/bOpQLA3A8XmJo9HC7VP9krDOh7bvWYPyy4X1nRtHifC+FW+q2tQ
	cpBKmBuEUfuBqXtqmraj84pUzCWGPuZDAG1gvgkXo6MwHafhcqcxKyZKFZY3ESAz8Qju+DIVGPog6
	B2TYw1B9rnhJkn3PCIJUY040wDl/1XxEVibM/A+0rMKU8xM7hW2DjmTXYA6R0YhePJ9V82uCKfz6o
	tuUo28RtqpbU9bsZ4eAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttka-0000000GUfO-175H;
	Mon, 08 Apr 2024 18:29:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttkW-0000000GUeD-2LWn
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Apr 2024 18:29:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4155819f710so36978965e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2024 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712600982; x=1713205782; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=3y8+lTNdEv9p3qVZZSAL5TYeLEpaLOV40uPPZs1+/rA=;
        b=Jo6vRBacqMQjBR0hX7ITzHOHemv17sKLEZ66o0dqq3Px9eCITbbSVP5i7egkbC+OXk
         oCQ3xbfg+Ij/stMN/YhJlYFnPOH2Fx7tIVdAGDMV267LEyimKxYpydNQ4wFwUFBp2xbv
         UEfwKcCAIR1VPRrI9XM7LLGpcEqatF498CKE2YQH5sXV5ysaSida4a7Z4HwuHOVIKDlT
         +90Ca0BTyWn3wAJb+D/OXOOfKrGOmF4vw3CM5xX7FpEBmXlKgLt8QlnnNI7dOffgVpmc
         Kzmm4vWkQU63TxaN5z9n6ilrSxn8dG93Yb2ju5706jVZA9VMkgM13qDymEwuYKJv7SbW
         doSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712600982; x=1713205782;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y8+lTNdEv9p3qVZZSAL5TYeLEpaLOV40uPPZs1+/rA=;
        b=Srcg6CjQH2US4Or9gUsJjFIM5GOLb9O+QLg4eWz7coxwfwVuj3+sZsHBFno+EB580v
         2du33eQcjHsh422kJJLQZG63KIkpc5R/8jw2sC3CI/uvJKyM3nYRhqnuozgKsXHsagXl
         yj1RJnEp0DMN3OC0CGG72vuRcXNRAk110E9DRRfM6Q6Qr9lbsAkXHcCD9Do/S6fJw15F
         Nmqv7ipBotsiiiWQ00K34uWAkCuuVAiaLEhCJuRh9RlnV59L3FlyNQpebZvv2TwsCiwR
         RofrmUG/+c1LwLsRoG0OvZZu3XG7pQRpmo9iFysfcew3NPqq2kL1mhjBEz7r/KO7acjH
         vpRw==
X-Forwarded-Encrypted: i=1; AJvYcCUqwW1hydmAfleFdf7k9VdurMoGhIuDCfllN0a/50uxohN8C+mb8vN4EH+YVUAScf/4ju7zg2cIYwgLHYJgwHed+73i8gq0m5+JV5K+Ac0KZGo=
X-Gm-Message-State: AOJu0Yyny4qgedk0ea9s+GPqS5uiqd3s1kQSDYG/Rpi3galxdkkdBcFg
	pf7lyqnpw6os9HDYf1VzahsKNvuDk6GSmGLkZFpmFq/VFOcZ+Ca3ZMgPJxnhh5Y=
X-Google-Smtp-Source: AGHT+IFh8WHFAL+5KwNrKiDCA+QmN0hRuRdo0rWFUNNknNOcm/Yw6c64MqzQj6hHHotqbMcZSl4VIw==
X-Received: by 2002:a05:600c:4683:b0:415:8651:9b8e with SMTP id p3-20020a05600c468300b0041586519b8emr8571532wmo.39.1712600981964;
        Mon, 08 Apr 2024 11:29:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90bc:1f0d:aae2:3c66])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b00414807ef8dfsm14255016wmb.5.2024.04.08.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 11:29:41 -0700 (PDT)
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, lgirdwood@gmail.com, jbrunet@baylibre.com,
 broonie@kernel.org, conor+dt@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Date: Mon, 08 Apr 2024 20:15:54 +0200
In-reply-to: <20240408164947.30717-3-ddrokosov@salutedevices.com>
Message-ID: <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_112944_735662_98938247 
X-CRM114-Status: GOOD (  21.46  )
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


On Mon 08 Apr 2024 at 19:49, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The 'link-name' property presents an optional DT feature that empowers
> users to customize the name associated with the DAI link and PCM stream.
> This functionality reflects the approach often employed in Qualcomm
> audio cards, providing enhanced flexibility in DAI naming conventions
> for improved system integration and userspace experience.
>
> It allows userspace program to easy determine PCM stream purpose, e.g.:
>     ~ # cat /proc/asound/pcm
>     00-00: speaker (*) :  : playback 1
>     00-01: mics (*) :  : capture 1
>     00-02: loopback (*) :  : capture 1

The example above is exactly what you should not do with link names, at
least with the amlogic audio system.

Userspace pcm, otherwise known as DPCM frontend, are merely that:
frontends. What they do is entirely defined by the routing defined by
the userspace (amixer and friends)

So naming the interface in DT (the FW describing the HW) after what the
the userspace SW could possibly set later on is wrong.

Bottom line: I have mixed feeling about this change. It could allow all
sort of bad names to be set.

The only way it could make sense HW wise is if the only allowed names
where (fr|to)ddr_[abcd], which could help maps the interface and the
kcontrol.

Such restriction should be documented in the binding doc.

>
> The previous naming approach using auto-generated fe or be strings
> continues to be utilized as a fallback.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  sound/soc/meson/meson-card-utils.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index ed6c7e2f609c..7bae72905a9b 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -94,10 +94,14 @@ static int meson_card_set_link_name(struct snd_soc_card *card,
>  				    struct device_node *node,
>  				    const char *prefix)
>  {
> -	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
> -				    prefix, node->full_name);
> -	if (!name)
> -		return -ENOMEM;
> +	const char *name;
> +
> +	if (of_property_read_string(node, "link-name", &name)) {
> +		name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
> +				      prefix, node->full_name);
> +		if (!name)
> +			return -ENOMEM;
> +	}
>  
>  	link->name = name;
>  	link->stream_name = name;


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
