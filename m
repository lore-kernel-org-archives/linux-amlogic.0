Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B222C2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXGTFJpThs76w07K8n0lnH4iQ+lWs1Qdf2aTNfbEGEI=; b=dJ/0iTc7mNP6F0
	gsSkqn7f4XkuIIBJrb+koHAsZb5XegyV/DxZDo4jcVG/OsRjRIbT0qEAus28sYxyuUlytTK9TwYdc
	oHnPT+H/cvEcp9FK9uDyXN0URysxwTsq9STfz03QCuRrRcEnZRoWMwnr6OFOFjCUbbutGq8PW5xl+
	VXyd0I5EUqS/dha50lQy9nQbp1ql5qz0OaG9xwzLfF6zXTefkalkIj9zKQX5JN4mEDhnR6O5TwFK/
	R/xBWIad7pI1QeKRkBnQyrXL7ppjMBoiv3HH4PfynxnIIRvlWpeWW+yy5sRtEWyBbynNZ+FEtpA4/
	vOu/kG+gApyAHXT0Oxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7XC-00000003GZd-1Ktl;
	Tue, 25 Jun 2024 14:52:38 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7X8-00000003GYF-3oiY
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 14:52:37 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6fd3d9f572fso2692495a34.0
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719327152; x=1719931952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eFCwqpYMAlOae3Wq7kaGE7/Xc9Z4VICKduGMP+d5BYA=;
        b=CVlaW6ieSzrvQV1NhQQlZWV+eyw+MU+zdH/M7jUur01eRKoFY0aFJ1vbAXls1dlfUU
         5cRVt5JxWqDNnG+Xz9bduxXQEDIEG2GX5F4ztng5hklYgcdgb0NQhlD8xzUKjoJYMoii
         JigTF1kMDxEX1HeJ4CEjswxQnR/X+DxMbkQzkGuSxYaIZGwbxzP8GRiz2PyZqEX5P1WM
         hJbLPnZYJ7+is40+/Jsz/Ap/y2/S1SYvhzosLHWgtXqvltA9lax5KjhlgJdgEXLSq8aG
         q8HG28xwGbt12Y/4XV73PSp2QZ1WolDi42imnfuDMqMAxiDrBhePgJMVe/722GYOKy/k
         kDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327152; x=1719931952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFCwqpYMAlOae3Wq7kaGE7/Xc9Z4VICKduGMP+d5BYA=;
        b=eGLJcRMDlL3djMAy1A0Gz3uX+u5UVVvtP+j3APdtDXr8MZZK69lyMUpcjNTBiCK/I2
         ZCRxJYNxJ+mzhaUcxu2F8Y+9/tQmFEQBbLocSCGMmgVgzTOY4kGH/Z0YOiJkB0DX3tsC
         Fekq8ljBr9sygAPETmWFpZ+2YpODkFoyR4Bt7zoIKbVqpLQWvBcVYyRYXnVV7mJUMc8F
         GviuMHGyDkmvd/JJ1J9ziJxmKeX5tsYJ936JjBbGTfiX6XqLjFZZtszcdtnFDPA0UqKs
         ClBs2E2/hRHJKZG8QKa9CoxHfPTHUvBPP9qu2QHZy9lT5PE37H+f/Hvttiq1Mv74ze78
         vE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfP6eh7kvFyU17kcQVX4ptNx55GAvrsdM2b+QolrF/5EmfULusn1N4+YPGPV6KafM3IddFRHrpu0S86D8Yx6HsuFnshTdWA6MWc3b40yWjlA0=
X-Gm-Message-State: AOJu0Yw8M9313EHk+AuZZ+zvDGWlWR72jrY+L1+SQ+9w6qJOIRt0wFw8
	Cne5LEz+OGFx2YThPa9oX6Bti8CJ90CeWTsbAq1mW9gljMcDWhE/GMaIaqApVlE=
X-Google-Smtp-Source: AGHT+IGAyScvGTE83h+JooU2cToGFhIBseTN8NyFXWYnKyCjKQdamcC43ssWI2w6tTw3/ElSuMmRsA==
X-Received: by 2002:a05:6830:1e27:b0:6fc:3204:1244 with SMTP id 46e09a7af769-700af92396fmr8893804a34.19.1719327152376;
        Tue, 25 Jun 2024 07:52:32 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7009c6773aasm1557626a34.74.2024.06.25.07.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 07:52:31 -0700 (PDT)
Message-ID: <190ccd62-0803-46fa-87ee-0f9cef5a784e@baylibre.com>
Date: Tue, 25 Jun 2024 09:52:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: frequency: add amlogic clock measure support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240624173105.909554-1-jbrunet@baylibre.com>
 <20240624173105.909554-3-jbrunet@baylibre.com>
 <04254d15-2f6e-435d-ba4c-8e2e87766b9b@baylibre.com>
 <1j4j9hift4.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <1j4j9hift4.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_075235_793392_3F798EC6 
X-CRM114-Status: GOOD (  29.47  )
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

On 6/25/24 3:31 AM, Jerome Brunet wrote:
> On Mon 24 Jun 2024 at 17:51, David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 6/24/24 12:31 PM, Jerome Brunet wrote:
>>> Add support for the HW found in most Amlogic SoC dedicated to measure
>>> system clocks.
>>>
>>
>>
>>
>>> +static int cmsr_read_raw(struct iio_dev *indio_dev,
>>> +			 struct iio_chan_spec const *chan,
>>> +			 int *val, int *val2, long mask)
>>> +{
>>> +	struct amlogic_cmsr *cm = iio_priv(indio_dev);
>>> +
>>> +	guard(mutex)(&cm->lock);
>>> +
>>> +	switch (mask) {
>>> +	case IIO_CHAN_INFO_RAW:
>>> +		*val = cmsr_measure_unlocked(cm, chan->channel);
>>
>> Is this actually returning an alternating voltage magnitutde?
>> Most frequency drivers don't have a raw value, only frequency.
> 
> No it is not the magnitude, it is the clock rate (frequency) indeed.
> Maybe altvoltage was not the right pick for that but nothing obvious
> stands out for Hz measurements

I'm certainly not an expert on the subject, but looking at the other
frequency drivers, using altvoltage looks correct.

But, we in those drivers, nearly all only have a "frequency" attribute
but don't have a "raw" attribute. The ones that do have a "raw" attribute
are frequency generators that use the raw attribute determine the output
voltage.

> 
>>
>>> +		if (*val < 0)
>>> +			return *val;
>>> +		return IIO_VAL_INT;
>>> +
>>> +	case IIO_CHAN_INFO_PROCESSED: /* Result in Hz */
>>
>> Shouldn't this be IIO_CHAN_INFO_FREQUENCY?
> 
> How would I get raw / processed / scale with IIO_CHAN_INFO_FREQUENCY ?
> 
>>
>> Processed is just (raw + offset) * scale which would be a voltage
>> in this case since the channel type is IIO_ALTVOLTAGE.
> 
> This is was Processed does here, along with selecting the most
> appropriate scale to perform the measurement.
> 
>>
>>> +		*val = cmsr_measure_processed_unlocked(cm, chan->channel, val2);
>>> +		if (*val < 0)
>>> +			return *val;
>>> +		return IIO_VAL_INT_64;
>>> +
>>> +	case IIO_CHAN_INFO_SCALE:
>>
>> What is this attribute being used for?
> 
> Hz
> 
>>
>> (clearly not used to convert the raw value to millivolts :-) )
>>
>> Maybe IIO_CHAN_INFO_INT_TIME is the right one for this? Although
>> so far, that has only been used with light sensors.
> 
> I think you are mixing up channel info and type here.
> I do want the info
>  * IIO_CHAN_INFO_RAW
>  * IIO_CHAN_INFO_PROCESSED
>  * IIO_CHAN_INFO_SCALE
> 
> I want those info to represent an alternate voltage frequency in Hz.
> I thought type 'IIO_ALTVOLTAGE' was the right pick for that. Apparently
> it is not. What is the appropriate type then ? Should I add a new one ?


The documentation at Documentation/ABI/testing/sysfs-bus-iio explains
what the combination of a channel type and info means.

For example, out_altvoltageY_raw is defined as it used for the frequency
generator case that I mentioned above. in_altvoltageY_raw is not defined
which means probably no one has needed it yet. But it would still be the
voltage value, not the frequency.

There also isn't a in_altvoltageY_input defined ("_input" is the sysfs
name for IIO_CHAN_INFO_PROCESSED). But in general, "input" (processed) in
IIO just means the value in standard units instead of a raw value. It
doesn't mean that any extra signal processing was done. And "scale" is
just a way to convert "raw" to "input" (processed). So channels will either
have "raw" and "scale" or only have "input" (processed), but not both.

Could you describe at a higher level what the use case for the various
values being exposed here are? I think that would be helpful in figuring
out where they actually fit in to the standard IIO attributes.

> 
>>
>>> +		*val2 = cmsr_get_time_unlocked(cm);
>>> +		*val = 1000000;
>>> +		return IIO_VAL_FRACTIONAL;
>>> +
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +}
>>> +
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
