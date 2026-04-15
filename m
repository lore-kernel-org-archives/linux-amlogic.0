Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE27F43828
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNSTwMX7QFYgW6JAtM1H5yShxgzZWPOMJf3ckJJ9IIA=; b=vca+DPNiOLNtTk
	97JWuBVN5Je8chOZp194R3CL4UOXolkn5PO9bUakGCYgpzu67f62/ALtHs53EbL05XkXDl21D+Tu7
	COzmeymfLzb1ridzym28NawmigkZxyJHuAgJNG51MKBGlMQe0zUB3ofNEyLJATp/NMRLBTL9CtL8E
	mZcly4Rdik45XSXL3F6aUMhLcucpe2Pe8DJDK1rV5kaguvtsIXT5YLRbqBmiOC2OEK/9NaSfcr8jD
	j4VHZDf9tmmf6MQTpyzoImzIDQGrlIYGNNpHTQ/EdYCytPVZvALXaYEj8jp2PCMwkMCt71pHH1Nbs
	ZIRwcfqyyWbMzVDNaZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Ep-00000001ElY-1nRw;
	Wed, 15 Apr 2026 14:29:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1El-00000001Ekd-1WAx
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Apr 2026 14:29:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so49492995e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776263341; x=1776868141; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ee7S1C7CW9QXX3hiuXvnlueBA+ocQbUcyBQidGRH/6U=;
        b=f9y40bQ+acGFbrE46lJFRR93et6yvcCdygPHtRUoDHPabEAK0Aq3k0uXlrpOQYwKyf
         N3Cmp04xeSzVjhifAy3utcaCZWgNmxLY/Epw9EAfHljAim4QGFmkXi7Q5zc6mrgZHO3Z
         X7BeCZB3RKKXICVrNcDx7tAilvlAMhVGxLKNUEbXuap8Om417KAfID+iP6tkO2876l/p
         NYz3LvPQLeUGr9OR004JyYAAHcxrLrwdLBTtw0flAV5XX2PAu879UQNDjLViYsyyiNNE
         nFpzoNM4VEI6gLpfnaYPnO0D9qW2Ksk7vo6Kkaaq2j1TVcceFJVdjQmF5Ce0vG9mOegD
         CZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776263341; x=1776868141;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ee7S1C7CW9QXX3hiuXvnlueBA+ocQbUcyBQidGRH/6U=;
        b=eLhYW0bEIp2Aeoi5Wdz91TMPdmEUG5f73gIgfdmF3p7CJ1YfI4oWElzHG2WjXT08z8
         KpVHC8vi4eS4v3KjUGRkuXbilQ7utOv4hVqrVqMnXDQLYs0Qn2jZrVeXaFgleBaMcPvK
         SqAq6WLTw/TxhSy6kL3Oym5jHGc27Gclv8tkrhj6Tvw/pM9obL9/uJwrdE8bHRokj0yt
         9IZFs4JFlY2yvfnxrlj0UAEww9Bbwixm9cTSjXmVg3FF0IB6AWkUkL+d9FZihs5Qg8DM
         WW/nOr2KhmY54qCb26afFia0jQZn0ZHafNdaqONEchybdYgvUZyYZckqlzddLzdEfV5m
         8OZA==
X-Forwarded-Encrypted: i=1; AFNElJ9GKDY75x+j9RI05PfHW+7s8nVawqH9vDYu3s0NdbOp7E7ZM+rKMa7f0Q5HpvygpXaGipamNzT+wIbkgkdP@lists.infradead.org
X-Gm-Message-State: AOJu0YxNm/PjJzXVHIopwWfLijEjYvysJUA+50fOmSRjblq4AUQxZoLN
	VnKZbOifqOS8stEJiX9ZcDvUvOaJSS5BdjhoJMLjeNjC2qun59chBVQ/XgwNPQBNjZk=
X-Gm-Gg: AeBDievzBrLYWm3ttEgXIFoT2oxDW/OCBAMuQiJvOAoSaZv+f92sWrUp7++RgMl9iIs
	cvyxrWhN7ba3aNWBOBGJZWsozxIjHFODnXAa0sayYi69zM7wLpBENiArbuxgOIVu9DO5Aagew1f
	4XpqaOUMht74K76H9dJtXYNrd9wD6Moj5Xbb/xRTc0fG4cl6O8g4B4wBmUU6r+4KObgTzMKVlgs
	0cCEIWe1VFDyb/cN0Bfrf21wtq4dre/LpghJH9shv8fk/HmDdw321uV70jV0BPAqSXTPipUKvbr
	dOZ+PTqS2DuXMOHw+b4i7I56F74O4/E9N9n5QDOeGWFw2zFaimsgu3C/1JYCAhqJpzEt1C6qCUt
	9b1oFHl+Z7nyN6ZtyvMpwsWy8o3Dt/WDTgtR+jniCuGlfziQWk7Y/Th9TLpUiqlup5AJw0392aC
	xDY6m/DCK2yE3s6aal7CJgZGJ6VSxW73pt
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488d68057cdmr284525805e9.1.1776263341086;
        Wed, 15 Apr 2026 07:29:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e64b:985d:5292:5ef5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488f096d110sm28244435e9.11.2026.04.15.07.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:29:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Valerio Setti <vsetti@baylibre.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 02/11] ASoC: meson: aiu-encoder-i2s: use gx_iface
 and gx_stream structures
In-Reply-To: <58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk> (Mark
	Brown's message of "Tue, 14 Apr 2026 17:13:48 +0100")
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
	<20260411-audin-rfc-v2-2-4c8a6ec5fcab@baylibre.com>
	<58d1df89-7c97-4e2f-af15-93d1f7bce5a7@sirena.org.uk>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 15 Apr 2026 16:28:58 +0200
Message-ID: <1jy0ios3f9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_072903_555176_6A083A06 
X-CRM114-Status: GOOD (  15.81  )
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

On mar. 14 avril 2026 at 17:13, Mark Brown <broonie@kernel.org> wrote:

> On Sat, Apr 11, 2026 at 04:57:27PM +0200, Valerio Setti wrote:
>
>> @@ -200,13 +200,17 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>
>> -	aiu_encoder_i2s_divider_enable(component, true);
>> +	ret = gx_stream_set_cont_clocks(ts, iface->fmt);
>> +	if (ret)
>> +		dev_err(dai->dev, "failed to apply continuous clock setting\n");
>> +
>> +	aiu_encoder_i2s_divider_enable(component, 1);
>
> If we're checking the error here we should probably return it as well.
> Including the error code in the log message is also generally helpful.
>
>> @@ -214,16 +218,20 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>>  static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>>  				   struct snd_soc_dai *dai)
>>  {
>> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>>  	struct snd_soc_component *component = dai->component;
>>  
>> -	aiu_encoder_i2s_divider_enable(component, false);
>> -
>> -	return 0;
>> +	/* This is the last substream open and that is going to be closed. */
>> +	if (snd_soc_dai_active(dai) <= 1)
>> +		aiu_encoder_i2s_divider_enable(component, 0);
>> +	return gx_stream_set_cont_clocks(ts, 0);
>>  }
>
> Note that we only hw_free() if we preprared, but we enable in
> hw_params().

Huh interresting, I had not thought of that. Valerio and I discussed the
clock part a lot for this rework. It is the crux since since the
interface and clock setting lives in the AIU subsys but serves both the
AIU and AUDIN subsys.

Valerio maybe you could keep function above just to set the rate, but
enabling the clocks through a DAPM supply widget ? This is kind of what
the AXG is doing.

what do you think ?

(actually in the AXG the each formatter widget call CCF
clk_prepare_enable() but a supply widget poking the register would do
the same thing)

>
>> @@ -284,6 +295,8 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>>  	if (ret)
>>  		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
>>  
>> +	aiu->i2s.iface.mclk_rate = freq;
>> +
>>  	return ret;
>>  }
>
> This means we store the new rate even if the set above failed.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
