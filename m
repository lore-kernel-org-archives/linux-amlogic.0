Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A2CC43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 20:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDB138AoJWUgBjL3RIS00zLTsJFkqV/zPo1gbfENav8=; b=LzsE7HtzVYrcja
	WhQWmHkhNXJ8/gE0KLxDPmyzW6slHgM8/aB1sZVU/EJ6rxca87b2qEVUWDCDIj+hejgoMR/+1geJC
	6MTTrLPnoHo9rY0s2ZALD4uzH9MsHpru4GT1NM8GuRlj8qBlHK/GgClsFux7CVN6hExe7lNEYfZSt
	BZa+nGz63DSXkxqQx01lRagx4sn2u9gKrK9WbTzAXYs04MSlqp/UT6Z15YZbH93zEh85pvzBQXE5t
	iB2tgU+DcybKRxg/D47zY0P8+MGBORNgcu0/wIcfqg8/ickrpstJTHwcCEzRmJ8UVqz3C/DWI83hK
	WQLmdASgzhJh7jqOQWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO7g-00000005SlK-45DD;
	Thu, 02 Jul 2026 20:35:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO7c-00000005Skb-0Nq8
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 20:35:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so8382265e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2026 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783024494; x=1783629294; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3eCE6CojkhPNhytF+tXa0zDs8MGJ/t+zhz44dKA5rs=;
        b=PpX/8qXqcmfey4L2gSuL7TaIdKlHzCyuxD2RR1Kix4XR9rZi5rSXPVVKPRPWZvX/5X
         w4gzQMAW5jssYIqQ/OAwtjCSwH0qwvoXw9/m+nnotw1UBEHBRSAbmdJzRjdJHgSLRjbR
         7kWOH5iKVMzuzwUYs+5s2svW5Jff/bsXPB7KeF+svtbmvrks63OreP8YGKqy/+aU6OC1
         vcyW4iOg9tPqIjvLXbB7xAXQMp+SH7x7S52Z2CXaWtEsfRYZTKDSHZy2RkFLuZbSgCK/
         gNy6nMm9MlduTeDwubY6soxR4D50IZlsbxJHppRYUOVjSotOO8QRvuXRML9P18f+QCfP
         NAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024494; x=1783629294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3eCE6CojkhPNhytF+tXa0zDs8MGJ/t+zhz44dKA5rs=;
        b=r0I9Z+anZbeLhdga353Z9GhfgzD0LeUVza5q43YGKutTRpSRfMWVQAMCabLe8CD5Jv
         G71axykPkgtD4oiigojEcWgp50I51MzmVCGaX04YrOVXQbuD0+4SyjdGb4SbG3cQGmMH
         of6b0dDsYCAmDjej1ILTBXkfsEKPDrgzZPNX3JSTQTdOLjbvcUquL/5ztM0bTAsoVUwc
         SBAmdd0R6ev5gTGASf/YGOcSwJhFg5zbiggUwTYUT+Qtzd2t9DvOwMj/MuEckqkWO/4w
         IztLf7K/ieSHfu9nans6iA+oOYN48h4Qqzb8bhnnMQqK3Y5epH0kaNc46RPgu6R4BFAN
         2qTw==
X-Forwarded-Encrypted: i=1; AFNElJ90A4ZG5AVUbGEmNEzbxUZMHJoCGF98rsj98VQc+YOt1N5znCnF+J+E29iVPClXdcVd5/Tb7Eq/TekY23WE@lists.infradead.org
X-Gm-Message-State: AOJu0Yylej9nZkWkIZGZZRCi6W9M5jNu7hA/t1KRA3Ppn/QMzyz1Mbkr
	5a5WC1SriMdRrE4923a+mzndT9OJcZVoU+KNIdnf3pyfWR7arYD2KvaopIbT5eVR2ZM=
X-Gm-Gg: AfdE7cn6fnz2IDxjND8oGWrdXreCJx4yaeF2c2hAg9a9qzB4dogB5unbHnCD4BK4fFF
	b4YMHi09801N0hCJZAIb49wmRxr4Uno+aC7gjhjbnzfw37t/aBGmqGLJtn+YRyuYXY6oQ/ZXcKJ
	2IPT/I0raaW6dnCIWQ7Q970lTGyiY0s5LQ4T3tT8TubT02UMfwuKwFl6l0BvTmRR/996mPFM0uA
	foK5hjWuEQNn6F+3mZjmUN47c6GSQW8bwCm8TqrDHDkfBFxVAtR88+KOT9169tnXNuQQZMOeP+J
	9k0juyGhhhCyUakejweAeeAr+uLzgz8vv8FeDTZrHN4J+FfCc/exhMBCmj89hkuzaWx173l4lXV
	QGQofyWt8UkOrgkYyZc28FRq/6PxihWJ63UqFmtdlnw6ahQ9W+1HY721sAuVvAVZP/wEWXKVuLp
	7im1p7qC1s7DwGhMo=
X-Received: by 2002:a05:600c:4690:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493c9b6c137mr22238735e9.17.1783024494057;
        Thu, 02 Jul 2026 13:34:54 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm77131325e9.4.2026.07.02.13.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 13:34:53 -0700 (PDT)
Message-ID: <b1a0a7de-c5b1-4325-8159-d5a0bad1668e@baylibre.com>
Date: Thu, 2 Jul 2026 22:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: meson: gx-formatter: prepare on attach
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
 <20260702-fix-24-bit-i2s-playback-v1-1-bcd3a43fe32a@baylibre.com>
 <20260702111021.2CCDC1F00A3A@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260702111021.2CCDC1F00A3A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_133456_152979_A4AC324E 
X-CRM114-Status: GOOD (  18.74  )
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



On 7/2/26 1:10 PM, sashiko-bot@kernel.org wrote:
>> diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
>> index 311e63affb239..c7333f624b155 100644
>> --- a/sound/soc/meson/gx-formatter.c
>> +++ b/sound/soc/meson/gx-formatter.c
> 
> [ ... ]
> 
>> -static int gx_formatter_enable(struct gx_formatter *formatter)
>> +static int gx_formatter_prepare(struct gx_formatter *formatter)
>>   {
>>   	int ret;
>>   
>> -	/* Do nothing if the formatter is already enabled */
>> -	if (formatter->enabled)
>> +	if (formatter->prepared)
>>   		return 0;
> 
> [Severity: High]
> Will this prevent hardware reconfiguration for back-to-back playbacks?
> 
> Because the ALSA core utilizes pmdown_time (delayed power down), the DAPM
> widget remains in the powered-on state for a short time after playback
> stops.
> 
> If a new stream with different parameters (e.g., changing from 16-bit to
> 24-bit) starts rapidly before the power-down occurs, dapm_power_widgets()
> will not detect a power state change and will not emit a new
> SND_SOC_DAPM_PRE_PMU event.
> 
> Since the widget wasn't powered down, gx_formatter_detach() hasn't cleared
> formatter->prepared. This check will return early and skip updating the
> hardware for the new sample format, causing the new stream to play through
> incorrectly configured hardware.
> 

Uh, this seems right, but with a caveat. When I tested this series I 
launched 'speaker-test' with 16-bits and 24-bits in sequence and it 
worked perfectly.
To generate the problem described here I had to create a custom binary 
that played the two sine tones, one at 16-bits and the one at 24-bits, 
without closing the PCM in the middle (as the 'speaker-test' case was 
doing instead). This way I was able to recreate the problem. I don't 
know how common it is for an application to switch sample width "on the 
fly", but it's worth fixing it.

For the records, I just tried removing this commit and both test 
scenarios work just fine so I'm inclined in sending a v2 with this 
commit dropped.

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
