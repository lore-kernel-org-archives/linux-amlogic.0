Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3597BC27C4F
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Jun 2024 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8h/NQkYXd2sTcwpykLepqNUDhwy4D3YpFJgr1EGXxQc=; b=CDHl3NzmLTE2vs
	5x3RD2+rBG0IcnKk1FYC8cbDKZ5CLJW3G+r2Wl/WBji/JASfRFvAasqqLQL+TT4fXVzad7Kiio8P+
	HijwGpz6lHtF29MKu+bP4xR/UFuIZH4V8oDrw9Q3YBvqYLJirdU3mTl84YpxuMEQ0wtzWZ2Izwpvs
	0fgq1uxGtmSlNm8yrSHgJ3kLcyUTTWQ8wUQny5OjRhYbb4pEsPT8AIQmERetHW48Z0dQpbtyMLDBK
	/u2BraS+DOdrZWGozuU4VEK9zCc8ApzYOE5kHj1VXin6j7UP2Iz1aTkynH5o7JqvHTtKt4gJu4264
	ZzKDtSuAee2G0K/1s5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNos5-0000000HYNM-40aX;
	Sun, 30 Jun 2024 07:21:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNos0-0000000HYMh-1IYq
	for linux-amlogic@lists.infradead.org;
	Sun, 30 Jun 2024 07:21:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-365663f51adso1246693f8f.1
        for <linux-amlogic@lists.infradead.org>; Sun, 30 Jun 2024 00:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719732065; x=1720336865; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TxIrL1L6dkYcdkFshMmKKgX5WO92izWELbH6RH4L7V8=;
        b=MYXXLfNpOFfuJpUrQtOjE4ZUGJYlYgy7qSARX6t2AbfNoGKuPG+/VlPJ9sVThtnn15
         070YKymhFYO0pM8glXfLkxChudiL7AwTM7gYKoFoQlZBFCj7KP0MCjW4IoGUDztj9Ec0
         5LjA4PcoSMe1c0AJVpfEQKu/UjDsMN3Bi9UmqWUW+NJk8+/CXz+hErUFsiOYvrwH0f+K
         37g+RUotbiqHzbxw9UrAtukIOOBHIsIprqyQSpkGABj65SZ2hr6VZFhvq4EUm74KC6Cx
         dx3k+M/y5BpKOWm071s0NtHIoB5Kun4JQMCSM5i7c7eyxBRzXvipobEPS5lqzdgp2zEK
         3n3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719732065; x=1720336865;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxIrL1L6dkYcdkFshMmKKgX5WO92izWELbH6RH4L7V8=;
        b=EvjZvpGhcMLKObHXdWdebqZ8BBGXCOjLgCXxLDXk6b4aK4HX6mmFah+s/rnUzL+YbU
         dLhWMDNPSjuaO3LQZyhH3DdGN1azjedLQ96Px+i7dA85f8Ku3peQCaSCmV9mpur63wyY
         taRD0lwvVmpDMLuLq6WxkHIQuwV86EJwBxKti3HIJWZkHYvgTjlrTuJbK/RD2/J9dzQr
         J959ui2PE65HqmjkKPasfgVfNSS4Sdvxt9sYbPtoGsb/J6MjBPHY/F9nMDI9jkrpBO6x
         QSPoye3F/njgWpp1Harhc8ar0jhsiD1EnayIUnL1tIw3YjjgcXXsjNPi/bA4x6hKcckF
         r2nw==
X-Forwarded-Encrypted: i=1; AJvYcCXN5dg/bDNj/3ch7sH2lSVeExfee1i7gCy9PvtSSyt7ys0q9lYaE39b3yOjGyggM2HM7AZxgjbCrCpHdqbP2GTHIbKsScjGg/SI8xX5x+a9fxw=
X-Gm-Message-State: AOJu0YxexigNb6+wLDSXcMil9aLmQSte+269qA+4yxCOSEUW+IrgHGHr
	ITbblcaaIHDU1MUx/rRfWBn/6TxLzHyzGXjscn+MVRfNZ7mq8PTruy1qy0+rCqk=
X-Google-Smtp-Source: AGHT+IGjjPVzsLMMKXGmALJ6E6SXf2+JbUt31lucblCiZrTTba6Axn63pFlilhVkWVbFmUwGL3yb6A==
X-Received: by 2002:adf:e985:0:b0:360:9a3f:aa7d with SMTP id ffacd0b85a97d-36775698c7amr1669101f8f.1.1719732064483;
        Sun, 30 Jun 2024 00:21:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:51e2:ba1a:8ad5:52c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc429sm6693888f8f.68.2024.06.30.00.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 00:21:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-iio@vger.kernel.org,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] iio: frequency: add amlogic clock measure support
In-Reply-To: <20240629204025.683b1b69@jic23-huawei> (Jonathan Cameron's
	message of "Sat, 29 Jun 2024 20:40:25 +0100")
References: <20240624173105.909554-1-jbrunet@baylibre.com>
	<20240624173105.909554-3-jbrunet@baylibre.com>
	<20240629204025.683b1b69@jic23-huawei>
Date: Sun, 30 Jun 2024 09:21:03 +0200
Message-ID: <1jwmm6hp5s.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_002108_379533_C6B22C1D 
X-CRM114-Status: GOOD (  23.22  )
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

On Sat 29 Jun 2024 at 20:40, Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon, 24 Jun 2024 19:31:03 +0200
> Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> Add support for the HW found in most Amlogic SoC dedicated to measure
>> system clocks.
>> 
>> This drivers aims to replace the one found in
>> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
>> 
>> * Access to the measurements through the IIO API:
>>   Easier re-use of the results in userspace and other drivers
>> * Controllable scale with raw measurements
>> * Higher precision with processed measurements
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Interesting device and the driver is pretty clean.
>
> Needs a new channel type though as altvoltage is in volts not hz.
>
> Various minor comments inline.
>
> Thanks,

Thanks for the feedback Jonathan.

Just a couple of things,

David expressed concerns with having both IIO_CHAN_INFO_RAW and
IIO_CHAN_INFO_PROCESSED for a channel and we did not reach a conclusion
on this.

My idea here is to:
 * Give full control over the scale to the consumer with
   IIO_CHAN_INFO_RAW
 * Give an easy/convenient way to get an Hz result with
   IIO_CHAN_INFO_PROCESSED. There is a bit more than just 'raw * scale'
   in the implementation of this info to figure out the most appropriate
   scale for the measurement. They idea is also to avoid code
   duplication in consumers.

David is definitely more familiar than me with IIO but we did not really
know how to move forward on this.

Is it OK to have both IIO_CHAN_INFO_RAW and IIO_CHAN_INFO_PROCESSED, or
should I ditch IIO_CHAN_INFO_RAW ?

>
> Jonathan

[...]

>> +	indio_dev->name = "amlogic-clk-msr";
>> +	indio_dev->info = &cmsr_info;
>> +	indio_dev->modes = INDIO_DIRECT_MODE;
>> +	indio_dev->num_channels = CLK_MSR_MAX;
>
> Superficially looks like the number of channels depends on the compatible.
> Ideally we shouldn't provide channels to userspace that aren't useful.

Not exactly. All SoCs have 128 inputs, Some may not be connected indeed
but some are, and the name is just not documented (yet).

>
> You could search the name arrays to see how far they go, but that is bit ugly.
> Probably wrap those in a structure with a num_channels parameter as well.
>

I've been doodling with this idea while writing this
driver. Technically, there is no problem.

The legacy driver this one will be replacing used to expose all 128
inputs. I thought it was more important to have continuity with the
legacy driver than filtering out possibly useless channels.

Another benefit of keeping all 128 is that the channel index (both in
sysfs and more crucially in DT) matches the one in the SoC documentation.
That makes things easier.

Would it be acceptable to keep all 128 channels then or do you still
prefer that I filter out the undocumented ones ?

>> +	indio_dev->channels = cmsr_populate_channels(dev, conf);
>> +	if (IS_ERR(indio_dev->channels))
>> +		return PTR_ERR(indio_dev->channels);
>> +
>> +	return devm_iio_device_register(dev, indio_dev);
>> +}

Thanks for you help.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
