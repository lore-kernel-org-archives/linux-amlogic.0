Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0D8CA9EC5
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 15:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NleBFEuwL0dsxs2n9DEXLn3nyRb1m8VAKAxfiwbxR3E=; b=C9RJswafBgDVHX
	bxzWfSqC634ZupcY34k4CxX6+7Z1o9fil4LILh9W882l8QPM02QzWk9qvfj4cGRqsv0w0MqgKJbyX
	AhVTMfuepKlSsa1Apn96ZSSgIExZYsV4+UVvKzYFeEVWYqeurjrv8IkLm9lE3ZtP5W4uNGYxqr3f7
	L1VaSV/3GbjNk6M2mInChY996yCWjybIVyC/csSPX/mipeqVelyjyHmeYUwPI9pMVYfSGyo4xjhDu
	KmGplSRM6pRYedkroJzE3/ojb5HMBeLMb/8l95BEZ6fBrI+WoA0cdxFLlvANyw7I2DdOEkGiMpb7z
	N9RYK23cX4K6n+aWdTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHjB-0000000AmTI-3vaa;
	Mon, 12 Oct 2026 15:14:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHj9-0000000AmST-1IoW
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 15:14:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48b03f23305so1679003f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791818049; x=1792422849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O90jitIO3s38c8EG4VvKygaj1zarOwk0tQIHj8nVOYg=;
        b=Y6edLW1VKbrPuw1iRz+buBfkMqymlcPQ4as3k1w1V1jfusJmB1Upsao+uUcWUoaHiB
         nf7t1BbR09xLWRvK+WSmiLA88SDJy9zUzs2hgrh6M441QrQJ+qGdJVqa1zHwEpMyLH5l
         WR2OsvHChUZE/v2lWPO2M9QFUfDN+c1Fu5Uqtj0nIT2wqMs3ucXC2sYDEazS4SBwlD9E
         8GT2T9YWj22T9jstFmm1bg3L5PpL0LlB4p2syOvMv1+lDeeDliNsV4GsbxYrrc7O1wyV
         +VuXR1FBWxuEyiqOGeU/SMu2YosqCwECv3xJr7dBQLEBbA3gdtELu7nSvn92uu6nzeBj
         iMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818049; x=1792422849;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O90jitIO3s38c8EG4VvKygaj1zarOwk0tQIHj8nVOYg=;
        b=bwrpQygtx7ZjdO/MMjk8xG8VxDL7Zzz4bhp7QzNiuu2bq/n9wV6MojCizHVpr6yfbw
         Le6Btj7UlbwKeW/olyBiXBm985yBvTc8zRyeMZmwo2p8+RPjvSSkT8sB4oFGO84rcwiU
         pSYk3ypr14pxEoKXSERNrpOf8xLtwnb3tNqVGQZHcYUqPdwpDR4AWlFCR/9wKEONfmpb
         xdodtsKB++kQVDjDiZdJpz0hEah4nqg6KJ31ArqRHoV5JHKpumOYWtUtNlcSBswuYdsP
         lwt0Spa919077aOrFl/6Bsg3Tb0/chKGZFniSRYWrLCs4TTSGx9O4aZcx+KlNYak5NU6
         dUAg==
X-Forwarded-Encrypted: i=1; AKwUvBz5MkZEk3G3C7vIj1wEpNhP6S+9mdNnra/9fSG/NUZvowJY0X3tDPRji7/VHplmMqZTrU1pvbSoDhhZwCAN@lists.infradead.org
X-Gm-Message-State: AFq9FYJWIPDVMWgQ/vEf9wZORG0n4eOZcKsltuTLDDqFOQADW8Wx3Uaj
	r8Z2QWSAquFLPVkdjTVPT7LovHZgvNYHXXSY6nmjwUrG5S8qO70kcXuFaAATd6Uj9d0=
X-Gm-Gg: AYBFou20I1LaxzTVgBVB3pGHKyuM5paqqp/KXEGPNr9HeN+sHcaT6s8GI7xUlok/YFP
	qo0gNv9uPEUpiy3GNx0fjqiLt8RvXwLpyhLwJYKRwmmdf1BIpQdOilO3ooNPY+9Ntqd4xvdAKS9
	Hjr6Xx6oUlhoRr2sqatYmCUalTlMl4HCO0N8AKskcDh1tP8CxLxuWZkR0n1aNxQp051SUTsuCbB
	bxfltfHWTWB+IbfMaSArwOCcKm4vfRlwhLJQToovYooEKccZowOsUyNzF4vSlM1ykpmqIDEYu9X
	eXnE3ot/UM8qOWngS6NzHocRqDAQWniMVhFRniqhJ6ony7joO5S9W12OQJhzVDm06XsSZC7i3k4
	ULbi3/9R4cf3Nv01G9SSXVrhMW8qs3ZjgskRm2ByXv7WTGlcReRAIJMWFc2FZjrbfcH6vY7V1h4
	Yxu63Jtlw48WZv3H6WfrE1sg+ac4w5VwlxUEsnfkybXUQOBFm0+fwxmwH/81eHQrEGlXQolN0Xn
	Q==
X-Received: by 2002:a5d:6f17:0:b0:485:a394:58ef with SMTP id ffacd0b85a97d-48dbaaed22bmr16768322f8f.30.1791818048717;
        Mon, 12 Oct 2026 08:14:08 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm3653f8f.16.2026.10.12.08.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:14:08 -0700 (PDT)
Message-ID: <d90324be-c43d-4d28-9f1a-e28e437031e8@baylibre.com>
Date: Mon, 12 Oct 2026 17:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-3-2476646118b5@baylibre.com>
 <1j5wzdzyqm.fsf@starbuckisacylon.baylibre.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <1j5wzdzyqm.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_081411_364418_E8F4A2EF 
X-CRM114-Status: GOOD (  21.55  )
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

Hi, thanks for the feedback and sorry for the late reply.

>> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
>> index 58dce9f08c9d..70ea39c77b32 100644
>> --- a/sound/soc/meson/aiu-encoder-i2s.c
>> +++ b/sound/soc/meson/aiu-encoder-i2s.c
>> @@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>>   				   struct snd_soc_dai *dai)
>>   {
>>   	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>> +	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);
> 
> Not sure about peeking on the other path like this :/

Yeah, I know this is perhaps not the nicest approach, but it's the same 
one I used for the bs-quirk handling (see the "startup()" and 
"hw_params()" callbacks). Since there can only be the playback and the 
capture stream, checking the other stream's "clk_enabled" is equivalent 
to a user counter in "gx_iface", without adding a second piece of state 
that has to be kept in sync with it.
Is that acceptable to you?

>>   	struct snd_soc_component *component = dai->component;
>>   
>> -	/*
>> -	 * If this is the last substream being closed then disable the i2s
>> -	 * clock divider.
>> -	 */
>> -	if (snd_soc_dai_active(dai) <= 1)
>> -		aiu_encoder_i2s_divider_enable(component, 0);
>> -
>>   	if (ts->clk_enabled) {
>> +		/* Disable the clk divider only if also the other stream is not using it */
>> +		if (!other || !other->clk_enabled)
>> +			aiu_encoder_i2s_divider_enable(component, false);
>> +
> 
> Looks like a race condition is possible here if one stream closes while
> the other one starts.
> 
> I think you need a common structure between the 2 paths (with a counter
> possibly) and it needs to be protected by a lock.
> 

I might be wrong, but I'm not sure a race condition can happen while 
managing these 2 clocks. Here's what I found:
- "iface->mclk" and "i2s_divider" are enabled/disabled on 
"prepare()"/"hw_free()" respectively.
- when "prepare()"/"hw_free()" are called the framework holds the 
"card->pcm_mutex".

So when one stream performs one operation, either "prepare()" or 
"hw_free()", it can read and modify (if needed) "ts->clk_enabled" both 
for itself and for the other stream safely.

Am I missing something?

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
