Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2E5C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHu+MohgQMwfNHTj5Y5outfwtX4AFVGSK66igiJM4wk=; b=3ePpO5N2Wlb+NR
	lL9bWrjKnR0XtBWvsZTJxEUopTsxkQKeTBYQuvLLJpsIUpeE/xSvyz+/RxEllrb891ztCyx/3Dh7M
	uw+1xsT782wa8ZCrKX2gCgcsAav2K9vILzF+BOlpiQSs5mTTEQLTvbBBuEx62Y0qcSpRiUFST7bWm
	cTW+wmVnr1c6Ww91H0U/37HIfaaZT4EI4HTKTT8Q32fm8Rs8yokVsqHeb1vxWo7KT9IvTITLpleqH
	xeDNheAkhlcJGGbkJzmJwNx1QgNAmOa18bLPcAWRpMR/FbkUZequprgEl55PNsCM6GX/2QtVu/Hz3
	8SMxXpglK5au1Ex3TWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtu39-0000000GY5j-3xSl;
	Mon, 08 Apr 2024 18:48:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtu37-0000000GY4q-0HTX
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Apr 2024 18:48:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-343d1003106so2880120f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2024 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712602135; x=1713206935; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=/5O9U718NHGvhBsjamAS1sHo9zrNE6S5TEc1aVEiLaU=;
        b=dDtttQCnu8VS0zHyHH5xK2RjPgu1/Rq1RwgOUuj511lGL7HYjBjDcXr6CkX7SuC3kz
         pjtD9xIitQ4tXEvypkCXOyYMmLPIr/KEV/1S6+1b7L2M+LsID2bCInUCkKdb3IPdEUXS
         968oFCnEiPJNM6cITASaqBKsrstWCrKn5Vbp4E/lPq8z1mifXZ4wlNehtBh9sw4sWjSP
         GYIJZzeKq/DhTyJNsIPEmbj5jjsh1Bc6BiNOJhWTvlvQgqzhcvZGwgvhI+3vXJFGlewz
         u8XCWHNIu+Sr89n46JhmLoolO28nvU4iECd2tk0Gv+8dNTlhEzMZMh526M/ICoPlxyFx
         ZvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712602135; x=1713206935;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5O9U718NHGvhBsjamAS1sHo9zrNE6S5TEc1aVEiLaU=;
        b=JaWi8YjvmQRRtWeyqdwc2V5sZayG8s66c8I9s7xldO3sOAJyf7YlOX3w9FfZKags2N
         3z2rpyQ1Sy/absF14qpfkL10cBMTmUV2eX3pL2yFiFRW1UTY8K49PkPZYp5E/aYvGWkk
         TKdBVN0jX7828urxMsToJsEKNUJMXeUrAhKi78NSWCArLpzWdL3BBauEYErHwRpl6c8I
         pcOn5Uhe0acAjFUCF9GVVJB2wsHC1FgVjdzpGSsaT4MTedDsmn8NbeltOmfmdU8X28sp
         6EKVnYIW/7TD2Xf8ZL2mHnUWQt0rTDfVKZwaxrO4sBDE4hCSCcxF67ivBWKhX7LqKlVv
         oQHg==
X-Forwarded-Encrypted: i=1; AJvYcCU8f65ApYDgKWnpJNTrD40gc5rSIjBO0BvPu/X2acd8pJodq825kuZBIa198d+5GjJDCxa5Ni8YuS24O4XpPKjEd6oszHwWv7V7z914ud99AyU=
X-Gm-Message-State: AOJu0Yy0lVfpivHKjmN/9Gys44LUdvknGaLKhiyyV1x8x7UxVq/GWlrG
	tRhYqhy+yVvnwgYA9ESaYaq1Dlsd9Ij8us4u3D9QTA2R4kF5P4/eyr87RI8sYEg=
X-Google-Smtp-Source: AGHT+IG3Lg7mm8hPe5LwKDEb0DtuBWPIrOCUnl2T2Z41lBT6Pyv73n0DcdIqqnsFwOJp3c6VQ0kGmA==
X-Received: by 2002:a5d:64cf:0:b0:341:d7b5:27 with SMTP id f15-20020a5d64cf000000b00341d7b50027mr8950388wri.6.1712602134884;
        Mon, 08 Apr 2024 11:48:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90bc:1f0d:aae2:3c66])
        by smtp.gmail.com with ESMTPSA id m6-20020adff386000000b00343300a4eb8sm9561770wro.49.2024.04.08.11.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 11:48:54 -0700 (PDT)
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-2-ddrokosov@salutedevices.com>
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
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: meson: introduce link-name
 optional property
Date: Mon, 08 Apr 2024 20:44:36 +0200
In-reply-to: <20240408164947.30717-2-ddrokosov@salutedevices.com>
Message-ID: <1jsezvofl5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_114857_134523_CB5EC67C 
X-CRM114-Status: GOOD (  16.51  )
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

> The 'link-name' property is an optional DT property that allows for the
> customization of the name associated with the DAI link and PCM stream.
> This functionality mirrors the approach commonly utilized in Qualcomm
> audio cards, providing flexibility in DAI naming conventions for
> improved system integration and userspace experience.

As explained in patch #2, I think this change is wrong.
The names below describe a possible userspace usage of the interface,
not HW. This does not belong in DT.

The only valid name for the interface is one that helps map the PCM
interface and the kcontrols exposed in userspace.

This information is already available through dai_name, prefixes, etc.

Using DT for this is bad, in the context of these particular sound
cards at least.

>
> It allows userspace program to easy determine PCM stream purpose, e.g.:
>     ~ # cat /proc/asound/pcm
>     00-00: speaker (*) :  : playback 1
>     00-01: mics (*) :  : capture 1
>     00-02: loopback (*) :  : capture 1
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml   | 6 ++++++
>  .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml    | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> index 492b41cc8ccd..46774a3e4b1d 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -66,6 +66,11 @@ patternProperties:
>          maxItems: 1
>          description: phandle of the CPU DAI
>  
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
>      patternProperties:
>        "^dai-tdm-slot-(t|r)x-mask-[0-3]$":
>          $ref: /schemas/types.yaml#/definitions/uint32-array
> @@ -137,6 +142,7 @@ examples:
>  
>          dai-link-0 {
>              sound-dai = <&frddr_a>;
> +            link-name = "speaker";
>          };
>  
>          dai-link-1 {
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> index d4277d342e69..975c148f9712 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> @@ -52,6 +52,11 @@ patternProperties:
>          maxItems: 1
>          description: phandle of the CPU DAI
>  
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
>      patternProperties:
>        "^codec(-[0-9]+)?$":
>          type: object
> @@ -89,6 +94,7 @@ examples:
>  
>          dai-link-0 {
>                 sound-dai = <&i2s_fifo>;
> +               link-name = "speaker";
>          };
>  
>          dai-link-1 {


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
