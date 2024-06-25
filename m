Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD0FC2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAc2sADIEPvb/dnuXFi/HMLVU3vr4iB6OGIq4x1rqnI=; b=sye0Ki/6WnjFZr
	uoomfvL2FG6M1LByCOzpkNxMIoEDkQ60uih6FSaeNHYe4GRM1M9KfusVq4zc4QO5TBFlGP83HS/+P
	4M/XLPJY5I+RgICGkqLEbvRlQudQHkYTMKEFGQoeKwq4P0odMyOi8peyFiWZ6AJ9f6XVijd6X0/v+
	KLrd0r78cG9w/SOzBnSE+dCXE6B5w+nHajpg2eCteytZLc3t+I8yfvZ3P+DZqdHTUsvEsW4n8BCf4
	qghST2CQ3rRZvd+yYrHtguebDf/IfjiskCEUaXYOhAtzA8gep3z2pb46qXxhRRE67fs6sGtekNQXh
	nZHlfrhN3kQNq9RfTCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9WY-00000003nUY-2pV8;
	Tue, 25 Jun 2024 17:00:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9WU-00000003nSQ-1wdA
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 17:00:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-366edce6493so1976266f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719334800; x=1719939600; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kKhLA/uuVpBLqDNuK6HoaxS7wD29CsICGUEF4cAMpms=;
        b=zwHW8xV98zPuu7rHKC/9aUh5lXFkRL9gTR/7LKupKrOvsWpiHpcOo1vC8lNjDkte5e
         Zqe4D2u84w4wKJzekBnbF4PHbEvEqmC7ILayIKh2LUfLt3qxgTQvjmG+R6i664ClshPj
         D3it/rovqPJPKECHnklNUyo6Bt4TccEW2akU10G00U1o06H09dUecapt3RYzXQcQtzIJ
         yiJy443rJgtJ5ae5Poxat4Y3aDy4KgkoYSKTAHmdsZ2LdTtqAGcBn5MN5nNx+801AXxO
         q6qZIQq2uCYLjg20EF0QipB5+nUeAWA7XWTIQ0VvRFmQb2stTJL2I8rHLMlrgrvqxryv
         VSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334800; x=1719939600;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKhLA/uuVpBLqDNuK6HoaxS7wD29CsICGUEF4cAMpms=;
        b=pGKp/a9DpMOv39gyH8UmdCAC2xHBhNgxdMmZT0PkG6VZYEn/bw1WFnBrvhrWfr08xG
         KEKZN7mwGrkTPsc4ruzqp8stTHYxURu4RzRAZX/UB+3ztZjnMxEauDVv+OHt7hrWheXU
         WF3SuW0HFeclvABkCZ5TBOG2TmcYroczvThsCCB8p8kaGhubm3OBWNqr7XvU0bgHC3fv
         RTCNKesekyZxpqnr7+SSSHoYSAgn3iWiDV8tSqswZbIrNNJJisGNgsfFdhpfOp3Qe4DV
         eaKMi1xtsyAzItda2xUioM0qaV6qxDq/zFv5BgjKecm/946HYnbzFd29uiU6dWSrtFsO
         5yuA==
X-Forwarded-Encrypted: i=1; AJvYcCXGISEbKsn2osBfplpTHSm+Z73PnlNyormYjgT2PIWo4mI6+rgUTFvvF4hn1vycgrk7U4Cadi6+orIoXz9g1losjm+kwsbkU7kMVrVtN7hBzPc=
X-Gm-Message-State: AOJu0YwEjAiCk1YSQAULmanXAOZtQ0RvesacxNG2qgO/psAXvXwliilu
	v+O9ysFNPK8FFXF3hexd8HrphHm32WmxptHa0nZSRsbDa6FyRWVRsJu8OxYVtnw=
X-Google-Smtp-Source: AGHT+IGuDftD/fHoijaVLzFccwmGUpMG5buqZhT6v/Ke1w4CDd5JIUPcSTNtgPBRlJeit4/74Hb6Nw==
X-Received: by 2002:a05:6000:154d:b0:362:5816:f134 with SMTP id ffacd0b85a97d-366e9463da3mr7697083f8f.13.1719334800016;
        Tue, 25 Jun 2024 10:00:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638301cffsm13399466f8f.10.2024.06.25.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:59:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,  Lars-Peter Clausen
 <lars@metafoo.de>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-iio@vger.kernel.org,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] iio: frequency: add amlogic clock measure support
In-Reply-To: <190ccd62-0803-46fa-87ee-0f9cef5a784e@baylibre.com> (David
	Lechner's message of "Tue, 25 Jun 2024 09:52:30 -0500")
References: <20240624173105.909554-1-jbrunet@baylibre.com>
	<20240624173105.909554-3-jbrunet@baylibre.com>
	<04254d15-2f6e-435d-ba4c-8e2e87766b9b@baylibre.com>
	<1j4j9hift4.fsf@starbuckisacylon.baylibre.com>
	<190ccd62-0803-46fa-87ee-0f9cef5a784e@baylibre.com>
Date: Tue, 25 Jun 2024 18:59:58 +0200
Message-ID: <1jr0clgdpt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_100002_653777_9C8DDC01 
X-CRM114-Status: GOOD (  36.35  )
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

On Tue 25 Jun 2024 at 09:52, David Lechner <dlechner@baylibre.com> wrote:

> On 6/25/24 3:31 AM, Jerome Brunet wrote:
>> On Mon 24 Jun 2024 at 17:51, David Lechner <dlechner@baylibre.com> wrote:
>> 
>>> On 6/24/24 12:31 PM, Jerome Brunet wrote:
>>>> Add support for the HW found in most Amlogic SoC dedicated to measure
>>>> system clocks.
>>>>
>>>
>>>
>>>
>>>> +static int cmsr_read_raw(struct iio_dev *indio_dev,
>>>> +			 struct iio_chan_spec const *chan,
>>>> +			 int *val, int *val2, long mask)
>>>> +{
>>>> +	struct amlogic_cmsr *cm = iio_priv(indio_dev);
>>>> +
>>>> +	guard(mutex)(&cm->lock);
>>>> +
>>>> +	switch (mask) {
>>>> +	case IIO_CHAN_INFO_RAW:
>>>> +		*val = cmsr_measure_unlocked(cm, chan->channel);
>>>
>>> Is this actually returning an alternating voltage magnitutde?
>>> Most frequency drivers don't have a raw value, only frequency.
>> 
>> No it is not the magnitude, it is the clock rate (frequency) indeed.
>> Maybe altvoltage was not the right pick for that but nothing obvious
>> stands out for Hz measurements
>
> I'm certainly not an expert on the subject, but looking at the other
> frequency drivers, using altvoltage looks correct.
>
> But, we in those drivers, nearly all only have a "frequency" attribute
> but don't have a "raw" attribute. The ones that do have a "raw" attribute
> are frequency generators that use the raw attribute determine the output
> voltage.
>
>> 
>>>
>>>> +		if (*val < 0)
>>>> +			return *val;
>>>> +		return IIO_VAL_INT;
>>>> +
>>>> +	case IIO_CHAN_INFO_PROCESSED: /* Result in Hz */
>>>
>>> Shouldn't this be IIO_CHAN_INFO_FREQUENCY?
>> 
>> How would I get raw / processed / scale with IIO_CHAN_INFO_FREQUENCY ?
>> 
>>>
>>> Processed is just (raw + offset) * scale which would be a voltage
>>> in this case since the channel type is IIO_ALTVOLTAGE.
>> 
>> This is was Processed does here, along with selecting the most
>> appropriate scale to perform the measurement.
>> 
>>>
>>>> +		*val = cmsr_measure_processed_unlocked(cm, chan->channel, val2);
>>>> +		if (*val < 0)
>>>> +			return *val;
>>>> +		return IIO_VAL_INT_64;
>>>> +
>>>> +	case IIO_CHAN_INFO_SCALE:
>>>
>>> What is this attribute being used for?
>> 
>> Hz
>> 
>>>
>>> (clearly not used to convert the raw value to millivolts :-) )
>>>
>>> Maybe IIO_CHAN_INFO_INT_TIME is the right one for this? Although
>>> so far, that has only been used with light sensors.
>> 
>> I think you are mixing up channel info and type here.
>> I do want the info
>>  * IIO_CHAN_INFO_RAW
>>  * IIO_CHAN_INFO_PROCESSED
>>  * IIO_CHAN_INFO_SCALE
>> 
>> I want those info to represent an alternate voltage frequency in Hz.
>> I thought type 'IIO_ALTVOLTAGE' was the right pick for that. Apparently
>> it is not. What is the appropriate type then ? Should I add a new one ?
>
>
> The documentation at Documentation/ABI/testing/sysfs-bus-iio explains
> what the combination of a channel type and info means.

Oh missed that, Thx

>
> For example, out_altvoltageY_raw is defined as it used for the frequency
> generator case that I mentioned above. in_altvoltageY_raw is not defined
> which means probably no one has needed it yet. But it would still be the
> voltage value, not the frequency.

Got it. So the type I picked is wrong for sure.
So, maybe I need something new to measure a frequency ?

>
> There also isn't a in_altvoltageY_input defined ("_input" is the sysfs
> name for IIO_CHAN_INFO_PROCESSED). But in general, "input" (processed) in
> IIO just means the value in standard units instead of a raw value. It
> doesn't mean that any extra signal processing was done. And "scale" is
> just a way to convert "raw" to "input" (processed). So channels will either
> have "raw" and "scale" or only have "input" (processed), but not both.
>
> Could you describe at a higher level what the use case for the various
> values being exposed here are? I think that would be helpful in figuring
> out where they actually fit in to the standard IIO attributes.

So as discussed in the cover letter, This HW used to be driven by a driver
living in drivers/soc/amlogic/meson-clk-measure.c .
It provides debugfs entries to observe the rate of 128 system clocks.
It was fine until now and mostly used for debug in userspace.

To solve a problem with implementing eARC support in ASoC, I need
another driver to access the measurements, as simply as possible.
IIO provides an interface like this and the HW actually does
measurements so I seems like a good fit. I've got it to work
and happy with the result, both on the IIO and ASoC side.

What is really important to me is the information provided with
IIO_CHAN_INFO_PROCESSED, because the algorithm will adapt the scale (the
duration the clock is observed for) to not overflow the output and get the
best precision achievable. It is a compromise really. Consumer do not
have to worry about it, they'll get Hz.

I'd prefer to avoid having that algorithm (duplicated) in the consumers,
especially if it is a driver.

I've provided RAW and SCALE because it is cheap and easy to do TBH.
I can live without it. It is meant for consumers (if any?) that would
know better, like want to prioritize speed over precision.

Eventually that driver could evolve and also provide duty cycle
measurements, which is another reason why I think IIO is a good fit for
it.

>
>> 
>>>
>>>> +		*val2 = cmsr_get_time_unlocked(cm);
>>>> +		*val = 1000000;
>>>> +		return IIO_VAL_FRACTIONAL;
>>>> +
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +}
>>>> +
>> 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
