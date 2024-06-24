Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB813C2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0Kdqiu93vh5P3dU9HQqJBiQHtp5/ITpRlNvKRNZYyI=; b=HyXnzOTODhzcCl
	TLD2yRgWG8CxF+ELxaI9DFhTujXcs0rtM7TaDeP9nlb2d8zi/UHEAxtBgj1Bdh/oJGg+/GF8vJELC
	ahJbKXKHBf8YfZ8bGqvOMiEgQDU6SVVnNDpmLMxM3KXwMX9LApL1XwjvYaF1ulxX3LpW4aSDCbPCh
	3AzviyrLGxaf4fhh7pvOYvf4SBSF4hSKYCDaXM4CPe7ePIovJ1cK/SemUMKX+B5F++3MkU3kxMIGj
	/RWY5r9QuJ6xbIZDckD5JTVjiulrSZGe6SwQecOs/mZ6s3PeC5gIdciedAqa4JguP5SOlfWL2ezEF
	FdD4udHyJn4DDtc67QVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLsWn-00000000tkS-00iX;
	Mon, 24 Jun 2024 22:51:13 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLsWj-00000000tji-0TWb
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 22:51:11 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3d24724514eso2907377b6e.0
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 15:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719269466; x=1719874266; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSMLalLoG8lPuYSLVxw52g/GhJCfhMgtmpMfHHuN7E4=;
        b=WZqb8QRsROhLMToyUcYkZSB+8rKeu4xfJODcqWV4r/YyeIyfNuT0/78M5HAqoRelsf
         yWHG6yqt61URCg4c8d6YJHN7d2TEiFnh1ENDg0kQZoCqpTuyNylGoa2eHGEIM6SbXSeu
         YNBWd4QrZtXok/e4sP9G7Jla+X4Qec6eSL2AiGHoMMNr6A28lp+bXUIc++EdcbMWosB1
         BuebCRywX+yxsLtUQEi5rBalorWu8I83AAdduBH3fZGaL6hDPH6YCzkQev2YLkiid8Hh
         XS95x60nrX4BEZC5/YiMfTdpPRC1yJRqveqBjrQ6ICia6IETXr6F9CaGyvOMRT5RB1BB
         oMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719269466; x=1719874266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSMLalLoG8lPuYSLVxw52g/GhJCfhMgtmpMfHHuN7E4=;
        b=jk4zeHkyTcW45cWG3hlG0bJCONGYZ/B406TLTeeTKN/xlaKjsUGS9cGkscgkDNixVf
         BxHUp5SIspcH9WJvG7wqLRm3qxuYv6CNSuWOZdv5/cDkWfTHq55NGhN3gi8wNOfLvwvb
         ULXWm+ZmaSwM71LcO2wyVKIs8HGBVXPWoi5w+dGgeT1vG66hsf6O+AVCjU04J7MOhpG2
         zI7VFZ+yT5hwJTVh6Z7rk7y3ItQW3Qn3XHneznakGm11GoQQutUyaMvpvvHsVRpq9Voh
         j4LmOppFUykAe+q5Lyay0vdi/SkuSiP0XiZy4FOTUvD3a3ELicHJi8Exmnl43BQtLcAo
         Yy3g==
X-Forwarded-Encrypted: i=1; AJvYcCUd9WxWMmnYoskhc4Ijz5FWXfJ7mcqTlbGe0In7F78KyJtsTC43wJ0Fm0s7cfavpITM+2ske8udjLw0wVFvxtEzQbez0A1RjviTOi6OhDLQHog=
X-Gm-Message-State: AOJu0YylywFHoENbOTR75C5CBOL7YTPGvQ7C/njbGeR3Sz3ab5TdgibU
	F3Z+gPb6YSbWZ2uhCykt2lX3JdPWJBHN3dUypemQ6CvuNcyTMgZ82OKqm2OyYHTCd0w7O7ea2Tn
	U
X-Google-Smtp-Source: AGHT+IFEgKMQ0KzJb3GzFBxAKLmZWqCWQSiAPzPkM5FnZP8YbirfIfWJTrgLNLNXsuor9teoG1ivgQ==
X-Received: by 2002:a05:6808:189c:b0:3d2:2780:1c8f with SMTP id 5614622812f47-3d54594f36fmr6962253b6e.4.1719269466564;
        Mon, 24 Jun 2024 15:51:06 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344dde49sm1672731b6e.1.2024.06.24.15.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 15:51:06 -0700 (PDT)
Message-ID: <04254d15-2f6e-435d-ba4c-8e2e87766b9b@baylibre.com>
Date: Mon, 24 Jun 2024 17:51:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: frequency: add amlogic clock measure support
To: Jerome Brunet <jbrunet@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240624173105.909554-1-jbrunet@baylibre.com>
 <20240624173105.909554-3-jbrunet@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20240624173105.909554-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_155109_215336_B4EE2097 
X-CRM114-Status: GOOD (  11.74  )
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

On 6/24/24 12:31 PM, Jerome Brunet wrote:
> Add support for the HW found in most Amlogic SoC dedicated to measure
> system clocks.
> 



> +static int cmsr_read_raw(struct iio_dev *indio_dev,
> +			 struct iio_chan_spec const *chan,
> +			 int *val, int *val2, long mask)
> +{
> +	struct amlogic_cmsr *cm = iio_priv(indio_dev);
> +
> +	guard(mutex)(&cm->lock);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		*val = cmsr_measure_unlocked(cm, chan->channel);

Is this actually returning an alternating voltage magnitutde?
Most frequency drivers don't have a raw value, only frequency.

> +		if (*val < 0)
> +			return *val;
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_PROCESSED: /* Result in Hz */

Shouldn't this be IIO_CHAN_INFO_FREQUENCY?

Processed is just (raw + offset) * scale which would be a voltage
in this case since the channel type is IIO_ALTVOLTAGE.

> +		*val = cmsr_measure_processed_unlocked(cm, chan->channel, val2);
> +		if (*val < 0)
> +			return *val;
> +		return IIO_VAL_INT_64;
> +
> +	case IIO_CHAN_INFO_SCALE:

What is this attribute being used for?

(clearly not used to convert the raw value to millivolts :-) )

Maybe IIO_CHAN_INFO_INT_TIME is the right one for this? Although
so far, that has only been used with light sensors.

> +		*val2 = cmsr_get_time_unlocked(cm);
> +		*val = 1000000;
> +		return IIO_VAL_FRACTIONAL;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
