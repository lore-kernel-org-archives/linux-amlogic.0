Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014FBC52D7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 12:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16S9OlOb8qatymATELGypuBaALoFZeEV8HfdXMTbP6k=; b=iSKPK7ZFTo2cCj
	qN/JOoBKqf6ZDOp2jyoB0jdAjL9SXbpvfMaJwDREFYaFMoscHEF999jRL0bwMXD5VM0+dr7CkuLtL
	bebVI3XQApTL3TgaKfXjvofukUc+tJR2N153RFYvpP897QlLYTeKPH11KFcRTGlaRfy1H0EZ2htiS
	CdCYSykQhrnTatkJShDVshmPVhnvlvwuWE9Et8cBF4er4oBR0nvTaFeCIWuv1VV4cTq4BadhCuMJb
	CwaltaHxYwAlatsu0fNlLvXFOzJIsXibAAnj3MJC8mDpIIkXJdPhMKvB+MqCQFxwA8t/1H0cXAFsN
	Thk8jWI5AAwEH3tHAtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdr35-00000003mLl-3yUk;
	Tue, 13 Aug 2024 12:54:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdr33-00000003mKh-2cEs
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 12:54:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so7436302e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723553687; x=1724158487; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rFn/YBZy/HMj2dJ8dhDDDJeYokUl+M8JMlUEy7TbTsM=;
        b=JkT6b+3aXaYAVHxiTQ51ib8/1vsm3bZcIhqG2e33A4GRH5URkzq05+h3wnHmdDol/O
         cdx13PhwfFXd5Q6RL7PmQWuxjdO9VfCDTU/8/LQB/y56GmBgZbbF2hOMmKNF6LvCBmXg
         RxnamBd/0f3ZyaF+/SNsKF6uqJwzcdVH4Hck7CcoZePTW5RdBHCpAUlnL/pyjha/Ic+6
         nnmPnaxVI3NwKc9E4q69RTieBSr3gbhpx/Ms1PLXxcWziLWiw4/wROOFys/yUlmBKcRS
         V7ql1ifBulARWZT7FJx0IwQvV8/jjlfk2llWB5qp7ywT6shbjKMh9ZCFolkL2P/5qLgV
         X8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723553687; x=1724158487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFn/YBZy/HMj2dJ8dhDDDJeYokUl+M8JMlUEy7TbTsM=;
        b=qhOeY/DEyVenOFZF8l5zvTIeFTM+9BBid6DI4tM7DuWkyElVmEvLQRJs05kCaFXH4m
         0QDLsZwrZgnE+nvvQQFXxVYm6EDhdMHSTsIII5DfMznLG6+bEnTUmq9+SBpeD0e0YmER
         TC1IbOl+IEAnIqocluq1VC8qnI0OqkwjDGRCRnzXBALRe7I0u1T6ducvJjNI8UNWPAf+
         fC6jMrOFfzkTMedo/ZK+hFt1L69Ysr6vyGWq/zHiHUGmF3+u+1b+XwfdsLKtNe091MJL
         QpcJIjsyJjF2oEt6bk/kUP3Oulp80pAVB6kSf/OrvWBS4xOOU/H1hEAaVQQ9apoacVN5
         c+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Yd1RYYUuAM/sAWpfXeUXVqGPhTbQo+6Ibc/eCZTYCFR60aG/2BopTpK57H7BjpLObSRyCKgcQq2LgUW9BMr4rbyzrJotoctFzPJa0JTovGU=
X-Gm-Message-State: AOJu0Yxa1A5Cne3jepO8QI9ol2MnW24GfGSUbYflwUkojf8RUTC16QP2
	NotLYT7nY+RlNprQsBGR//ZfuhUhWvDE3xJ0PZwKUyabF9KT8C40M58dc/ERRes=
X-Google-Smtp-Source: AGHT+IEj1tS6vskS9s6AZSAVh7F+6G+pdl5MLE3yLVM4Q4OffllLaX+wtCu/Ob7rMwxPxtFvgC7Lcg==
X-Received: by 2002:a05:6512:acd:b0:52c:896f:930d with SMTP id 2adb3069b0e04-53213692a83mr2039446e87.57.1723553687085;
        Tue, 13 Aug 2024 05:54:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bb7bsm67969866b.133.2024.08.13.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:54:46 -0700 (PDT)
Date: Tue, 13 Aug 2024 15:54:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] media: ar0521: Refactor ar0521_power_off()
Message-ID: <ce0ed949-5e57-4193-8190-9e4aa9cb62be@stanley.mountain>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
 <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_055449_848581_060229DE 
X-CRM114-Status: GOOD (  24.48  )
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

On Tue, Aug 13, 2024 at 12:13:48PM +0000, Ricardo Ribalda wrote:
> Factor out all the power off logic, except the clk_disable_unprepare(),
> to a new function __ar0521_power_off().
> 
> This allows ar0521_power_on() to explicitly clean-out the clock during
> the error-path.
> 
> The following smatch warning is fixed:
> drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

It's better to just ignore false positives...  The problem here is that
Smatch can't track that to_ar0521_dev(dev_get_drvdata(dev))->sensor is the same
as sensor.  What I could do is say that "this frees *something* unknown" so
let's silence the warning."

The problem is that check_unwind.c is not very granular.  It just marks things
as allocated and freed.  I could make it more granular so the free and the
alloc have to match.  Or we could match based on the type.  This frees a
"struct ar0521_dev" so mark all those as freed in the caller.

>  drivers/media/i2c/ar0521.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 09331cf95c62..2c528db31ba6 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -835,7 +835,7 @@ static const struct initial_reg {
>  	     be(0x0707)), /* 3F44: couple k factor 2 */
>  };
>  
> -static int ar0521_power_off(struct device *dev)
> +static void __ar0521_power_off(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> @@ -850,6 +850,16 @@ static int ar0521_power_off(struct device *dev)
>  		if (sensor->supplies[i])
>  			regulator_disable(sensor->supplies[i]);
>  	}
> +}
> +
> +static int ar0521_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +
> +	clk_disable_unprepare(sensor->extclk);
> +	__ar0521_power_off(dev);

You had intended to remove the clk_disable_unprepare() from __ar0521_power_off()
but forgot so these are double unprepares.

regards,
dan carpenter

> +
>  	return 0;
>  }
>  
> @@ -908,7 +918,8 @@ static int ar0521_power_on(struct device *dev)
>  
>  	return 0;
>  off:
> -	ar0521_power_off(dev);
> +	clk_disable_unprepare(sensor->extclk);
> +	__ar0521_power_off(dev);
>  	return ret;
>  }
>  
> 
> -- 
> 2.46.0.76.ge559c4bf1a-goog
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
