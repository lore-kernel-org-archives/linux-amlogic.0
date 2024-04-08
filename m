Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E83C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8TgWOjdlv7ZaZXBD7iyjy3D/NN1LGso+y7IZSmsivE=; b=ydlaXnoYQtMC2L
	UqiVjVNr7VlgML9kyYKSJp/dXK2hoL3fz8Os9Fpi2M+cOkbOfM2xiD9cEHmaqjzRUDVEtaPayPb5t
	ZVnB9DDlp9PyZQVROlBOKwKr2wu6Qxfm73zES7rGNfToRFA67sW+ZWTZ6NyKe8lGtwYGOOA3TxI+q
	qvm4tZETrye1lSb7+jVsYpwMlH1xPxp3Ppo8X+wuOj+D2uQUCfvZp4+gfjVDdKhYKI9Wy4n7JI5oP
	3LsdTrDFoOb6Hu3C5s907vArAzVX91ohcx0L7LXT5ZpIZU8f6gHhYpxyYH6hMXlVD4FZS+OpPqtza
	eUOUPzAQ0ybN8Vxr1Obg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttyv-0000000GX6J-1MN3;
	Mon, 08 Apr 2024 18:44:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttys-0000000GX5T-0s4E
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Apr 2024 18:44:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-345600106d3so1533238f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2024 11:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712601871; x=1713206671; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=PhxFWGtJcYu82R8UeAJlsE6XDeHCwucqCh4MxZcEi6Y=;
        b=gY0CbEtVl+hGxaspIgWwfbjGEcG5tuEuUCrPUVwjw3ub+xWtKQIXpsxl16lkVbnDqr
         2eUxu1xvUjEvs1chiNEPSc4WvnxH79IlW2y3haG2juh+p05o2Wy7HPN/mxwlgJ+1gwti
         ueLMCzh7V2/NbdCRrc8/CHlYOhjlsffaQ8dIQvyEDCfVDSxGivg2hZYpi0178OdKcAyb
         FOEx6BdXBBiH14j0sQ156Zsbg7n45SOkbFl5fEPKRXp+8gyUuIf2xfTNO0nqHm3sA7Nd
         /splc9Pr11st3tOfFapZX1qfO2IdRkI71dDssB49o3A5HXc/2Ny5PtKoquJA1els10P6
         upzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712601871; x=1713206671;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhxFWGtJcYu82R8UeAJlsE6XDeHCwucqCh4MxZcEi6Y=;
        b=DtCLIOq482Wzk/fghUNOIvrM7/Hyp+qRFglUr2B5dbblZDY0Ot0a/Tyk04Y3i3DaeG
         hFn5V4Cahk+Qs0jvBOASn6lif4O3io/akt0owSRLRIPZbjzaCB/JbjOTYSDjDJ+3/Lc0
         b0id7Tcmp33K7vhK2sYy2+91Qiv8k6xd2Ti6WZcuRQDKTdKe8082ou7+a1hUMTioaMzq
         hSLOcJdn5KjpXesRGzzG53tv9RQ3QBkxRUzK4p0t65XL9AydEURCAvCPoiLLI5iOruvt
         A+QPc+sWLJ/5nZrg8vRnUE/bJEC6tF4esBaBW6f927TLnh9iCWl3s2t1a+gun9JjwVFM
         a2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWjH1V64nGn0LmFg1GJAVqABbnqw77Ox3kFMM17rwaEMGcyD3R6CYN7h/eUqQh8NiDpn6InH5PjZGnsaHt6uvhPEOyiMmlkOKiCIIR7lDVWdGg=
X-Gm-Message-State: AOJu0Yz85CzcAoi6jtp4v84gnw1tAVE4CgHCp/hwrjzY2bDY2nBkiieU
	BekKV1CiL8EeZpSC+R9IDeCTP6Abv1s0uKRpF3aUe3DRbW2YydX+czxaNIcI258=
X-Google-Smtp-Source: AGHT+IFs9R4mz6UqK5BlaXGtELLYaVlJZoW6nTa0CMEXjr6omfui96tuEN/xbadb9qr3EQuod/33ww==
X-Received: by 2002:a5d:6e56:0:b0:343:4727:d11e with SMTP id j22-20020a5d6e56000000b003434727d11emr6395149wrz.47.1712601871525;
        Mon, 08 Apr 2024 11:44:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90bc:1f0d:aae2:3c66])
        by smtp.gmail.com with ESMTPSA id c9-20020adffb09000000b00345c2f84d5asm2736320wrr.10.2024.04.08.11.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 11:44:31 -0700 (PDT)
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dmitry Rokosov <ddrokosov@salutedevices.com>, neil.armstrong@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, conor+dt@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz,
 tiwai@suse.com, khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Date: Mon, 08 Apr 2024 20:42:22 +0200
In-reply-to: <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jwmp7ofsh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_114434_258584_4FEB5C8A 
X-CRM114-Status: GOOD (  24.01  )
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


On Mon 08 Apr 2024 at 20:15, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Mon 08 Apr 2024 at 19:49, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
>
>> The 'link-name' property presents an optional DT feature that empowers
>> users to customize the name associated with the DAI link and PCM stream.
>> This functionality reflects the approach often employed in Qualcomm
>> audio cards, providing enhanced flexibility in DAI naming conventions
>> for improved system integration and userspace experience.
>>
>> It allows userspace program to easy determine PCM stream purpose, e.g.:
>>     ~ # cat /proc/asound/pcm
>>     00-00: speaker (*) :  : playback 1
>>     00-01: mics (*) :  : capture 1
>>     00-02: loopback (*) :  : capture 1
>
> The example above is exactly what you should not do with link names, at
> least with the amlogic audio system.
>
> Userspace pcm, otherwise known as DPCM frontend, are merely that:
> frontends. What they do is entirely defined by the routing defined by
> the userspace (amixer and friends)
>
> So naming the interface in DT (the FW describing the HW) after what the
> the userspace SW could possibly set later on is wrong.
>
> Bottom line: I have mixed feeling about this change. It could allow all
> sort of bad names to be set.
>
> The only way it could make sense HW wise is if the only allowed names
> where (fr|to)ddr_[abcd], which could help maps the interface and the
> kcontrol.
>
> Such restriction should be documented in the binding doc.
>

Thinking about it further, even this does not make a lot of sense.
The information is already available from dai_name, prefixes and all.

Please use that instead if you must rename the userspace pcm, not DT.

>>
>> The previous naming approach using auto-generated fe or be strings
>> continues to be utilized as a fallback.
>>
>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> ---
>>  sound/soc/meson/meson-card-utils.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
>> index ed6c7e2f609c..7bae72905a9b 100644
>> --- a/sound/soc/meson/meson-card-utils.c
>> +++ b/sound/soc/meson/meson-card-utils.c
>> @@ -94,10 +94,14 @@ static int meson_card_set_link_name(struct snd_soc_card *card,
>>  				    struct device_node *node,
>>  				    const char *prefix)
>>  {
>> -	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
>> -				    prefix, node->full_name);
>> -	if (!name)
>> -		return -ENOMEM;
>> +	const char *name;
>> +
>> +	if (of_property_read_string(node, "link-name", &name)) {
>> +		name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
>> +				      prefix, node->full_name);
>> +		if (!name)
>> +			return -ENOMEM;
>> +	}
>>  
>>  	link->name = name;
>>  	link->stream_name = name;


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
