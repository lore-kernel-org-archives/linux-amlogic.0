Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DBDC2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5igvObxxlVgF2ezJs06Ferlkupb/2wrcbn9TGw4rFKk=; b=FHl77BR2GELHfO
	VLWsE319uG/9SysfX5dZahaRhl+R3rZATmijcdgv7tjkRiyfIwODyNu+5bxn9fh4cyskNU9pr7m9X
	2hjmZLsnNmnB9XAM781RCjoywB4Fuft/ppthp56XuolI16p+mSy+dq2MpzQhOXYcaPw6kRyg4Jnod
	DXmeHyFCMJSLnHm5vXE7V90bT14YCJcYk+HykvN22/vbv6i1Iq9nFsBXHDJHry2tcs5g4uKf/jiDk
	xCDKtTexAFFcUlFcPoYAS2Chpo6/Zn1fVf6wB7xF76vSDGmWMe1+rXHtmldXDCmR4k3K9wWh6tXx6
	VEK7ET+Pewk9Qgh5D3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLsig-00000000v1W-37qn;
	Mon, 24 Jun 2024 23:03:30 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLsid-00000000v0l-1R8u
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 23:03:29 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-25cba5eea69so2357712fac.2
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 16:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719270206; x=1719875006; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3g9D0Q46hO8kNhPpdEwaUtcHtAz8RcXtaZXccgR5jlY=;
        b=XmXI6zSQs0eGkLU/AEfLN6ASHwR7C77GzP2mtEiqaA6sQsXROBBhwM1Kca2l/+B68h
         CZyUOOJHaf32nX+6QJBh9k1x/DTfAkIgbV33QtpZF44UK1LEqJWjO0yRLAYu8aityDxi
         E32K3VuWREabVU8zPAldTL3NQsRGODa5VswGoRAJg5zM0JXqWJOovg1YdvwZsbKBTa03
         W7RtOWCpkb2atZPURGozNYQGNBsTWKOGvYrtKda2EMDk7A/40zKWe55Wk1Mp/f0eC8Fb
         9m8wZlx9IDz+Fc9UN5xtYCezdI677cdon34Ew8o8swSLtxV6nfOJUNKeQhcgUtM1SaMg
         ikOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719270206; x=1719875006;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3g9D0Q46hO8kNhPpdEwaUtcHtAz8RcXtaZXccgR5jlY=;
        b=p990y64SYrbsGiD65XNUrWfiFcRYqKKXSK8tjjMCbZ/Tv6mU8w1MfbFyy3KOtZCEZD
         xsVlLNCPddsf4gqm4bquJX6kqnLVzTa+J0c5o9rJ8QhBcWoU0KME2FncSUqSNjymRTs0
         xIOm+FXqejLl8gBr/mRGivKLpduTIwJJObn3MOoV+9Lfilysdm9iuGK8oJ2cepQt77VP
         eOQedsOmhJG4vFnEEKtT0C9J+VryRujHTvxdjosWjEVRVQ/YgkpyYBnOkByGxPNXATu9
         iSwDz432cXgfB2TEAHZlDc0rYhbveyjMzGmjBxQTCBQz8NZIgWEdM54VW0OxPWF2ZPAQ
         U7og==
X-Forwarded-Encrypted: i=1; AJvYcCWq4AR0Qro4qgXx+OgTxpl1STbgNKRh0So7DdSzG8w37hGIh24j5ITgkkS6EFvDaH4aZjQ2SemJUP3iyWJOokhNErZL4muhoCjfNMczg8iJXJI=
X-Gm-Message-State: AOJu0YwghWlnk/S+UvqeLB4uxIoCTgWt+xyDYHtHRN/fwJIEJvXi7md6
	KpTh2W5DWhlXv5oExveLzEM8VZaofeoMfy+zoy/HMz+czN1tI8eGJJysowC4rmo=
X-Google-Smtp-Source: AGHT+IFxVezURAd/5Q5yZQXgYOOeSHSb+PVhkQILWZlE/kdMWFKaJiNd06/ecIGHDTH4uAzjPurqBA==
X-Received: by 2002:a05:6870:b4aa:b0:25c:be1e:4cef with SMTP id 586e51a60fabf-25d016dc295mr7325113fac.32.1719270205819;
        Mon, 24 Jun 2024 16:03:25 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4c040f0sm2137355fac.50.2024.06.24.16.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 16:03:25 -0700 (PDT)
Message-ID: <f169633d-5f53-4879-a151-f2cbcfb5efe2@baylibre.com>
Date: Mon, 24 Jun 2024 18:03:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: frequency: add amlogic clock measure support
From: David Lechner <dlechner@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240624173105.909554-1-jbrunet@baylibre.com>
 <20240624173105.909554-3-jbrunet@baylibre.com>
 <04254d15-2f6e-435d-ba4c-8e2e87766b9b@baylibre.com>
Content-Language: en-US
In-Reply-To: <04254d15-2f6e-435d-ba4c-8e2e87766b9b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_160327_602453_3E40821E 
X-CRM114-Status: GOOD (  17.37  )
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

On 6/24/24 5:51 PM, David Lechner wrote:
> On 6/24/24 12:31 PM, Jerome Brunet wrote:
>> Add support for the HW found in most Amlogic SoC dedicated to measure
>> system clocks.
>>
> 
> 
> 
>> +static int cmsr_read_raw(struct iio_dev *indio_dev,
>> +			 struct iio_chan_spec const *chan,
>> +			 int *val, int *val2, long mask)
>> +{
>> +	struct amlogic_cmsr *cm = iio_priv(indio_dev);
>> +
>> +	guard(mutex)(&cm->lock);
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_RAW:
>> +		*val = cmsr_measure_unlocked(cm, chan->channel);
> 
> Is this actually returning an alternating voltage magnitutde?
> Most frequency drivers don't have a raw value, only frequency.
> 
>> +		if (*val < 0)
>> +			return *val;
>> +		return IIO_VAL_INT;
>> +
>> +	case IIO_CHAN_INFO_PROCESSED: /* Result in Hz */
> 
> Shouldn't this be IIO_CHAN_INFO_FREQUENCY?
> 
> Processed is just (raw + offset) * scale which would be a voltage
> in this case since the channel type is IIO_ALTVOLTAGE.
> 
>> +		*val = cmsr_measure_processed_unlocked(cm, chan->channel, val2);
>> +		if (*val < 0)
>> +			return *val;
>> +		return IIO_VAL_INT_64;
>> +
>> +	case IIO_CHAN_INFO_SCALE:
> 
> What is this attribute being used for?
> 
> (clearly not used to convert the raw value to millivolts :-) )
> 
> Maybe IIO_CHAN_INFO_INT_TIME is the right one for this? Although
> so far, that has only been used with light sensors.

Probably not the right idea though since it applies to the frequency
measurement, not the voltage measurement.

> 
>> +		*val2 = cmsr_get_time_unlocked(cm);
>> +		*val = 1000000;
>> +		return IIO_VAL_FRACTIONAL;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
