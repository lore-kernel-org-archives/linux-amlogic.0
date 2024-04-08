Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E393C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0M3ywSS0S1Hmaz5hjFK5YZhhMCT/Jo02fVNw+jt8L6U=; b=fYHLrklzchg68K
	xGZpRYPK67KXuQ1q0Xi08CinvreLVPZjCvYnGj49QHcxL+sYUi1Uh3dN6EFE4leu68ZH8so3V5gUe
	I8LkAUot/bIJNehYPy5TKTDP1LnKHny1bF11x4oL9YOO1CVMU61JAlmgfHs9h+NtqIFS5tT2nZtlz
	6f3XUGhRQXZdTrw6dQqEzuNp/MWvryBr836M4X2yWbiuz/KyPHCWSz23AhhGK27jdrUY+MXSvGBCA
	HhrJGD1I/oQA4OCD1G7vgf9lfHpS1yh1YzmAVfSAx1gl7q+nItD8kp2bql4SipsiwMtzNoEdBuuiu
	sylRyWT9Z5Vmwy4c/KKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtuEI-0000000GaEK-26sT;
	Mon, 08 Apr 2024 19:00:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtuED-0000000GaB5-2ulE
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Apr 2024 19:00:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-416923f05faso4441005e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2024 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712602823; x=1713207623; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=H+B+dIHSb8yRhnSvIGZyYqGXJXmpVr8yjlKl3yu6l4I=;
        b=gyGGi50xkvCLpEFxr7gF1e7dD1G4wREUwHuSS/DFM+E/Hoxofre3J9a7MnNeVuq0g6
         0On2hpKk8b5d4S7zIncpOZTyAYgEtDeKnC9xc3j1esXgDSuqrU7HzOzyb8DGn4exrlUO
         wnjPfQeo7JRFuc+Vg+gLVqViyPnHwRjFPUqbV73a+L2bcR1OEsVQA8MSFWtlSBJRpfEu
         32xz8WWS0PL7VCZfuFks9RNOHeh832BAReeQM3/WEUPFCjkK8k6TPcvAnxl3NSPuwnGd
         vJ2UyOd5abUB43ZZsaqdMyu1c3EqgWpNORh/43RYRoIGaACwPg9CPECbhi9KX1ZCz/pY
         24gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712602823; x=1713207623;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+B+dIHSb8yRhnSvIGZyYqGXJXmpVr8yjlKl3yu6l4I=;
        b=mWWe6wBFAYFCd+lAzRRLuMvVSmQXAE6OOZ+vKJezfluRKnVRKNFhreFPKCwRZNKnsY
         ym/S2x16qRxdoGa2fWDi2LIXCiwj5RTgx7Y98hEaCxAAFyI/jpn2PBN9kmUKLsw1r1kz
         YR5v2LMX1On9OLyc8QOIMaWXzPgLD3Yj6k9w87a5Acz7fW42/S4brsBpyJaoqOAErg+7
         Zyez1DvAHaBwVKttmJi925Yopq0Tm56r9hYNdcLGeiTtrQMjI/wpYf5d7KVwcdqhtwED
         CdVL/QpSkGE0zsJpv26SEmCWa+GALFMq9Ojp9UJgIFAbJY9WAunMtIe+YvPHJ1LdKhQt
         7iBg==
X-Forwarded-Encrypted: i=1; AJvYcCVXEv1/1tizDJzu3Zkox0LwMPmPyeGMN0UsMQhsy8GdZqtzyHfXaMY1piuP0YLd4rrXHZX0g1BnfSdpQt7tZz3wUX+Pb3fYSpwSX9MiCjPKBB4=
X-Gm-Message-State: AOJu0YyrHkkY6Lfbpo6CO3g12r4baMmb5HGd9KXSQxjO9N3vUSEbIYKt
	EpDwCrGeXUbOr0ccptHkYOwwBg1bxD4d+Jo5QlVjbmI/Rr83xjNsG2vP+hKPOes=
X-Google-Smtp-Source: AGHT+IGP2XX1WCI1/h92HKpEVxqSPYGzlO2h896WkQD9sJo7lY2DOrCu08c0YYaiv8QAmxpQYmTAyg==
X-Received: by 2002:a05:600c:1c8a:b0:415:666e:9438 with SMTP id k10-20020a05600c1c8a00b00415666e9438mr7600760wms.3.1712602822639;
        Mon, 08 Apr 2024 12:00:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90bc:1f0d:aae2:3c66])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c1c1600b004165315d885sm7177799wms.11.2024.04.08.12.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 12:00:22 -0700 (PDT)
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
 <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, conor+dt@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz,
 tiwai@suse.com, khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Date: Mon, 08 Apr 2024 20:53:42 +0200
In-reply-to: <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
Message-ID: <1jo7ajof22.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_120025_811387_9EBE6A01 
X-CRM114-Status: GOOD (  33.58  )
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


On Mon 08 Apr 2024 at 21:40, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> On Mon, Apr 08, 2024 at 08:15:54PM +0200, Jerome Brunet wrote:
>> 
>> On Mon 08 Apr 2024 at 19:49, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
>> 
>> > The 'link-name' property presents an optional DT feature that empowers
>> > users to customize the name associated with the DAI link and PCM stream.
>> > This functionality reflects the approach often employed in Qualcomm
>> > audio cards, providing enhanced flexibility in DAI naming conventions
>> > for improved system integration and userspace experience.
>> >
>> > It allows userspace program to easy determine PCM stream purpose, e.g.:
>> >     ~ # cat /proc/asound/pcm
>> >     00-00: speaker (*) :  : playback 1
>> >     00-01: mics (*) :  : capture 1
>> >     00-02: loopback (*) :  : capture 1
>> 
>> The example above is exactly what you should not do with link names, at
>> least with the amlogic audio system.
>> 
>> Userspace pcm, otherwise known as DPCM frontend, are merely that:
>> frontends. What they do is entirely defined by the routing defined by
>> the userspace (amixer and friends)
>> 
>> So naming the interface in DT (the FW describing the HW) after what the
>> the userspace SW could possibly set later on is wrong.
>> 
>> Bottom line: I have mixed feeling about this change. It could allow all
>> sort of bad names to be set.
>> 
>> The only way it could make sense HW wise is if the only allowed names
>> where (fr|to)ddr_[abcd], which could help maps the interface and the
>> kcontrol.
>> 
>> Such restriction should be documented in the binding doc.
>> 
>
> The link-name is an optional parameter. Yes, you are right, it can be
> routed in a way that it no longer functions as a speaker in most cases.
> However, if you plan to use your board's dt for common purposes, you
> should not change the common names for DAI links. But if you know that
> you have a static setup for speakers, microphones, loopback, or other
> references (you 100% know it, because you are HW developer of this
> board), why not help the user understand the PCM device assignment in
> the easiest way?
>
> Ultimately, it is the responsibility of the DT board developer to define
> specific DAIs and name them based on their own knowledge about HW and
> understanding of the board's usage purposes.

Speaker and mics are NOT statically tied to a frontend. They are tied to a
codec (... possibly). The routing from the frontend to the backend is
dynamic, even while streaming.

So defining FW names based on usage in wrong.
As Mark pointed out as well, DT is not the place for this.

>
>> >
>> > The previous naming approach using auto-generated fe or be strings
>> > continues to be utilized as a fallback.
>> >
>> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> > ---
>> >  sound/soc/meson/meson-card-utils.c | 12 ++++++++----
>> >  1 file changed, 8 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
>> > index ed6c7e2f609c..7bae72905a9b 100644
>> > --- a/sound/soc/meson/meson-card-utils.c
>> > +++ b/sound/soc/meson/meson-card-utils.c
>> > @@ -94,10 +94,14 @@ static int meson_card_set_link_name(struct snd_soc_card *card,
>> >  				    struct device_node *node,
>> >  				    const char *prefix)
>> >  {
>> > -	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
>> > -				    prefix, node->full_name);
>> > -	if (!name)
>> > -		return -ENOMEM;
>> > +	const char *name;
>> > +
>> > +	if (of_property_read_string(node, "link-name", &name)) {
>> > +		name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
>> > +				      prefix, node->full_name);
>> > +		if (!name)
>> > +			return -ENOMEM;
>> > +	}
>> >  
>> >  	link->name = name;
>> >  	link->stream_name = name;
>> 
>> 
>> -- 
>> Jerome


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
