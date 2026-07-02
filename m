Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C68CC43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 20:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmfiWMKhOZlQiZovRBqni2S4HNfbHnL4h8v8HJUTDBk=; b=GBvAh7lb0DAmvN
	PxEypvJDVWoT4dWLuQnWWf457sAKx5pdTOEEBrPvr7qArgE+6unNrLPc8wyL+IFsY56UkEWclHmUj
	zx05NyzSwEsS4GzkJESn7Gk8334+et7bk9awXLi9xDkfqVPOwOJO5q8MxPPldnALP/W8ZqvfpYcFU
	ZHQCYcq7MwgYDg4IYDj1YWAGVAZk9PHOggVAKR3OoBlZiMPrUp1TyWsrDQYPCGCRCAnLtaaQ1Kcd+
	4NCVg0I3iDxYCJlJ7n6orSXfwvFMnix9jEJy6j3beXY9u5pENGGuUfSatHToKs93+fO6cJGA+pIz+
	l4QRPGurapgHMXDxDwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOHJ-00000005T3H-432n;
	Thu, 02 Jul 2026 20:44:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOHG-00000005T2q-3YHQ
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 20:44:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1464924f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2026 13:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783025093; x=1783629893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYSEb1fRPNK7jUZ0mBNdZrE9oqYSNcb+vjaKrLF66Eo=;
        b=J0SQCmmADufuRtmACxcrdqK32YyyrFIl0CMcVApSN0h6qJbbFK3O79OnS3u8hOw2hG
         HjhrZ4MMlEV5BPsZ08eTX755ctsZXeSiyenGuMPZovFDuPnj745+iliSatlcXxI6MqLO
         qBiyhe5kXcyQWUrmASar5W4J4LJa+Z7TyEWgRyKyDEo5EKbMLj9xbSJI9q4Ta1/PW4I9
         jkfk5YJ0oeEwKAtDJeb1kgUYMLhHWTpdQRiySR1L090oDJC4A45Ty3vIqaPvs8zn+D7B
         hFKHyTWsIcfGYxljMxf+LLsg7KPfs+JU8epPrnX3tdgb1gFVhsrSH4Jh/otPmeHJAPg1
         c5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025093; x=1783629893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYSEb1fRPNK7jUZ0mBNdZrE9oqYSNcb+vjaKrLF66Eo=;
        b=oQ64h62TIO5+Vtjg8IR8Ly0MRQGoMy0ZZOTSAG1kVtDpefIR0ssXVKhAdIORoaYqIU
         RAEh90YmQYx+eqMy+B16b4ozV5OpmXg+jDV89sfZtbYm9tMBntoA5qpo0G6MgYqCE0HJ
         UeUIPId9LIsHDoB3Dl4I2pCeibDwX4RUZmsPGPQHccVbmws/at2qtj6A2SYj+UBwF6cu
         9FYQZjpU/7Dj+xtfdP677Wfti1ZrRpIrAexkXX6V3il3M0piPh+88IkjpycULs1lhr3q
         7TTrXz2F00VOEp4h6c/UilEF1Vl2D5w1RKhEdkCvXKKXUqgKNt2boQ2ilWvq5bSPPPFY
         sLOw==
X-Forwarded-Encrypted: i=1; AHgh+RqhB9TamsCFjUdyxCuzunFagd8dlTJ6k9J8pD4DhWrXmBvs7oxWAa7Sw8CRpGCmymrdlDKKQl0OoXTOa6Ax@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn1iukF9DqtBQKI4MEAu7p/+3gjvy+CAXh89DJXu185HK5q5RB
	ycCX+D7sCYp7oJCeVQ+MdZ+9zmGeoOu5EfKxW74QhcVCzqv6CBvc8LIWPxcF5sh77eY=
X-Gm-Gg: AfdE7cmkRPb3LbAJuJnWRK32Iy9X4l77vFsommwXFzOWZ55FJvUdZVZNGTgr6oT77w3
	oMeAiUhuTVb3zcTZTmGi1y8jeGXK0U0HQ0Is8sA7B5N6WLB6/JzEokugJ7GoGBcUaE+NSAIbLMP
	FLHWA3eKLJPq7FmdLJJCLLcQRLF/wep4rb3qxtON1dxEO2dCSjbuzlYdr+a/1pxKB6XZF+ePkD4
	tcEINxYXww9Udrv2TSUsfFvCvIxevCptJP2O+G2ZJjG0B2FYJxzmgLxNfdFL3a6UZ63yyrFviDU
	UemLYff2zF2IF2jpfg0hbH4knWY+BxRBIkjshFSfDFuBk9UbcAnn5RFkxdS78bNw+u1ssQ3PCwq
	bSORHtJS8T3GHUNacNjSvriASNf6HDiMVPerp/U8YvM1B+EfJl3VKkdUS2Q2DRZlj8L/pWlsZJe
	oO1akPaes0ftHOi0k=
X-Received: by 2002:a5d:5588:0:b0:473:1ccc:15bf with SMTP id ffacd0b85a97d-477b5488071mr8406342f8f.42.1783025092703;
        Thu, 02 Jul 2026 13:44:52 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm11660249f8f.24.2026.07.02.13.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 13:44:52 -0700 (PDT)
Message-ID: <787586e0-f11a-48ec-8a07-8e56043b7da8@baylibre.com>
Date: Thu, 2 Jul 2026 22:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: meson: aiu-formatter: remove pipeline reset
 from prepare
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
 <20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
 <20260702111422.42BA01F000E9@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260702111422.42BA01F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_134454_931087_146859CE 
X-CRM114-Status: GOOD (  18.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 7/2/26 1:14 PM, sashiko-bot@kernel.org wrote:

>> diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
>> index b4604734fe88d..cb554c2e7ce4a 100644
>> --- a/sound/soc/meson/aiu-formatter-i2s.c
>> +++ b/sound/soc/meson/aiu-formatter-i2s.c
> [ ... ]
>> @@ -55,11 +54,11 @@ static int aiu_formatter_i2s_prepare(struct regmap *map,
>>   {
>>   	/* Always operate in split (classic interleaved) mode */
>>   	unsigned int desc = 0;
>> -	unsigned int tmp;
>>   
>> -	/* Reset required to update the pipeline */
>> -	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
>> -	regmap_read(map, AIU_I2S_SYNC, &tmp);
>> +	/*
>> +	 * Pipeline reset is already implemented in aiu_fifo_i2s_trigger() at
>> +	 * trigger time.
>> +	 */
> 
> [Severity: High]
> Does removing this reset break dynamic DAPM routing (DPCM)?
> 
> When a backend is dynamically connected to an already-running frontend via
> DPCM, the frontend's trigger() callback is not invoked again.
> 
> For example, if the I2S FIFO frontend is started (e.g., routed to the SPDIF
> backend) and then the I2S backend is dynamically connected while the stream is
> running, the "I2S Formatter" DAPM widget powers up and calls
> aiu_formatter_i2s_prepare().
> 
> Without the reset pulse here, will the hardware fail to latch new
> configurations (like AIU_I2S_SOURCE_DESC), potentially resulting in corrupted
> or no audio output from the I2S backend?
> 

I'm not sure about this. The reason I removed the pipeline reset was 
that having it happening after the one on the FIFO side caused the 
stream at 24-bits to be corrupted.
In the scenario described by Sashiko we would have had the pipeline 
reset again after the one from the FIFO (which is continuouly running). 
Moreover I think that this would have happened also before my series 
that was recently merged, i.e. c7852d2dcf66
("ASoC: meson: aiu: align I2S design to the AXG one"), so I have some 
doubt that this could have worked seamlessly also before recent changes.

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
