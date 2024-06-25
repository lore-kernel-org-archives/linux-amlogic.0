Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C29C2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 08:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ek7Sp5QWHzBPVAXr4geq5J9qRmn+a/havp/8Nn/q+Bg=; b=Klz5KSpIknc58t
	wIOsWiIRHrmaStb1bp/dFNhEmXfCBLeKDTs/CkCyTOAjk3FBZumkIePa6xf3gmNUSECBgNVNPuHJh
	nTDHAlLFDZjbL2tCOFrI62DXwkUMVg/96qmuwKAWztrhiFFYF+BcPx/1D/1BzDmht70DYLD4139um
	2ByahWHHWXdpN9KLO62hkAiE3jb5zrcpM+5hVMYQDQjwG4y+xPVgTbDKGi8DD7QujL84x2H4omoXL
	1cbnvmC/wsyoZgdABEB1bz74JUpWnjgwVYtapfvzmMus55iuvKGg6Q+GWpvdgL4y1G/lk2k6/W+AV
	Sejrv6ygGH95Rja8ggIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1ao-000000027d8-1atk;
	Tue, 25 Jun 2024 08:31:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1ak-000000027aj-1sKt
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 08:31:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-36703b0f914so130782f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 01:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719304312; x=1719909112; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MGiV5QhyBIwfF0R22KIxg/x70JWWD4uGuZLiiLVcCo=;
        b=rK1KbctjYN/oMAptZszk+ae5mpiUfv884AmeSqN6IK4h0D7sQMLR0Umdq+FUSXPSv3
         psM4nozXrbfyDv8uXOosCrOO6lk1sf+NsDu9MKACPki9XgxgS8PRs5pEmpQ3T7p+y7wV
         ONCOQyb5e1AyaGk7PdTPbkbIqsB0LFNh9dbaJvO+q8tGIPouIA2agIE7EAO5RhNWBhO/
         GU58YMgVn58XSB+/Zfp3oR0SlW0Ve48iIQ18EjjjsyU9KZvb0k3JBZSZL1dh6NrMhP+8
         WWOpDZ6ELiyrCLd2yDQAeaZmysk/7mOUsOBMYHVFQM3k54KHC1WGGSpXFiRNpVhMw+MS
         ou8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719304312; x=1719909112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MGiV5QhyBIwfF0R22KIxg/x70JWWD4uGuZLiiLVcCo=;
        b=qAxCApCe5E9UPMxcNvpQSX2W8SUeGxUIkc1NWh9YuLJ9Nk5nluCf58UZVOrIeA8jsT
         ouOpvigqS+CDUHndIkHSmisImm8Nj2IK1A/+ns/pVEEAz5KCqeUIvjya+IyUUeA+fYvR
         DzcXN5WaIch/8o8ZCnbFdbn02SIXRjTlxSjOeZvL0BJb8F6mngWEp3nBp55RCJr+KHGt
         HRELQJ6phw7q9HLQ2Azx/ur9Vd3Oc/oO/3RQp2BRMBg+gyJRSX3d5OS+bYBMYTJ3rkSw
         5KAh/eaidVy9Rpcftf6ynoOl+217iHnVq8ynQOKoV9ds7Mk3IDaSBIxHB4MvX/+kT3aV
         Bl5A==
X-Forwarded-Encrypted: i=1; AJvYcCVq5mGhKlwFFYN8RCV6IRaz/OFQV7FxzROiGi4d3/Wyzpb1XUem8nWH2V44cBWpRQ29ctrwAaJc02PRzpzUUBrR9K8pZsWQnKVPE4/VV9JZesA=
X-Gm-Message-State: AOJu0Yx1+VAVNYBS8PySVkLJt/aGEQu1Fyi83ODYbDm0CUWNtXWeli5u
	GWpLwZ37zpgAKyo01LtyXAef4/LKc3cIqAY06GUnlmzAvIGHJog61aau3Z/XyZg=
X-Google-Smtp-Source: AGHT+IHXVO0K6EtgWIdnjCpVKEK7FGGlTzFiwp9mjcV6PfHRnKrDwThJVhKUFKQBIxHO02PjXcqiXg==
X-Received: by 2002:a05:6000:1241:b0:366:e09c:56be with SMTP id ffacd0b85a97d-366e325c00amr6885391f8f.6.1719304312228;
        Tue, 25 Jun 2024 01:31:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b57:b4a1:3d50:32a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366388c401asm12286172f8f.45.2024.06.25.01.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 01:31:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,  Lars-Peter Clausen
 <lars@metafoo.de>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-iio@vger.kernel.org,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] iio: frequency: add amlogic clock measure support
In-Reply-To: <04254d15-2f6e-435d-ba4c-8e2e87766b9b@baylibre.com> (David
	Lechner's message of "Mon, 24 Jun 2024 17:51:05 -0500")
References: <20240624173105.909554-1-jbrunet@baylibre.com>
	<20240624173105.909554-3-jbrunet@baylibre.com>
	<04254d15-2f6e-435d-ba4c-8e2e87766b9b@baylibre.com>
Date: Tue, 25 Jun 2024 10:31:51 +0200
Message-ID: <1j4j9hift4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_013154_603650_4AD630B0 
X-CRM114-Status: GOOD (  20.47  )
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

On Mon 24 Jun 2024 at 17:51, David Lechner <dlechner@baylibre.com> wrote:

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

No it is not the magnitude, it is the clock rate (frequency) indeed.
Maybe altvoltage was not the right pick for that but nothing obvious
stands out for Hz measurements

>
>> +		if (*val < 0)
>> +			return *val;
>> +		return IIO_VAL_INT;
>> +
>> +	case IIO_CHAN_INFO_PROCESSED: /* Result in Hz */
>
> Shouldn't this be IIO_CHAN_INFO_FREQUENCY?

How would I get raw / processed / scale with IIO_CHAN_INFO_FREQUENCY ?

>
> Processed is just (raw + offset) * scale which would be a voltage
> in this case since the channel type is IIO_ALTVOLTAGE.

This is was Processed does here, along with selecting the most
appropriate scale to perform the measurement.

>
>> +		*val = cmsr_measure_processed_unlocked(cm, chan->channel, val2);
>> +		if (*val < 0)
>> +			return *val;
>> +		return IIO_VAL_INT_64;
>> +
>> +	case IIO_CHAN_INFO_SCALE:
>
> What is this attribute being used for?

Hz

>
> (clearly not used to convert the raw value to millivolts :-) )
>
> Maybe IIO_CHAN_INFO_INT_TIME is the right one for this? Although
> so far, that has only been used with light sensors.

I think you are mixing up channel info and type here.
I do want the info
 * IIO_CHAN_INFO_RAW
 * IIO_CHAN_INFO_PROCESSED
 * IIO_CHAN_INFO_SCALE

I want those info to represent an alternate voltage frequency in Hz.
I thought type 'IIO_ALTVOLTAGE' was the right pick for that. Apparently
it is not. What is the appropriate type then ? Should I add a new one ?

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

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
