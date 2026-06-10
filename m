Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BDCCD98C5
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VndZe5YZldPZH1VuBxujfE+NTy6DZXAQzlQvr8BgkiI=; b=1qotNAGvQVDMAT
	QdkM1T9tyrdDjQTMO0vBoUHhhbXwULWKp/PuySp2eRHJ12/m/1O6dmhUuTqfBbPC2EF8P7IZ6YRbb
	1XylAVc4H1D5v2ys0xr0AGH3zx3nU87gMVZO5vj1wUrpbNheQJocC7yELeuofT89N+AXPzhvr2YTs
	xa0+AzEGN2m6YVNfMjSDpHDynOCok8lH+3uMkOGQzPERzVggPIxcfo11BWCJQD1deN4/ztI5sAeWF
	p30iBEYnf6ZRSKVBz/6AaXHYmFxgX2QTvrYYvq7bpDklkl9nGxtjSf4l2MUf2uhf52G2yZfiYsVke
	cMXT4npf5JNzzlrARmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIRh-00000007gDZ-3xSo;
	Wed, 10 Jun 2026 12:54:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIRf-00000007gCL-3Lrj
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jun 2026 12:54:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b12270b3so40315365e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2026 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781096050; x=1781700850; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdNmA7Q456iosyYRzPrqg00tebsLAHHTciT1QX6nIpA=;
        b=lHz+l1tFgSvH+cFcfYPsNYb06MT6hnK9j4DAmBcyZgfLEY7qYBauekBz+3oj44Ms3b
         7RgMf354CzHP17zsbpU4nHTF8+6RXVs69FCLZFUao9nP4pfE8jB1gregWDV8e9goyfkY
         Xfs2hi3j3qvP6ADJytVF3mmJrTR/uP4Utm+T9IPvfyREGFCC5YN5ekswuiXVwFgkjDnT
         uRtBPabueVjzPWObz97zd5N5EJha3bKiD2dScoDKbT+tlLtR1sqoXQM8l5b0ZvSTID2U
         XMHmVTj6dPQ6E486ZZhWeMIdwbuhxRErVXjKJ8ZcjHDK8BRpx5olOkmyzqnRxxNPwRz/
         E4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096050; x=1781700850;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OdNmA7Q456iosyYRzPrqg00tebsLAHHTciT1QX6nIpA=;
        b=MMHGY1Yr2Q3ZPGfFRdnMdWy9t/0FDckVuVOuq+jvO9iKbRh7P7DAxS8w3AUiBHGgVg
         e1dBOS8sI1awGPlV8erhQOlTEXFYdJonPtGhdmH2IeGjWuw6f5/WzP529vU933iPsQG0
         EBO9/WnENr/wxHIyd21KLiEubudX5GaU2+bEIwSXPq/piF31LUZ9ufsZI62J4M+j2Han
         RN8bdXqWpZCBaL9Xza8KiDhlVMuwBsLiSmB4RRtSqq9vY5yikqF6AWEM5ZfunBWZWyQs
         tpjbIhD6FqBaaB6gkqQmoEjKZrmOvpbvhW3zN/l7RwEQ0WfxKveb3E/HWF4Dvxs4j5v4
         yKDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RCJTKVr3TZgg9PvlEI2++GnWes22hhU6bJ5DdEJbBjC8g4vOUIyWghqizxDEM9O5pvsjICZzPqg3TI9kJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz731R1iKhMnbzX0/poEAMyfp+1ueaJnpE3Ucdps3fZt4fD9va
	H8ZcyIfjJGY+GaYNUhC1I2tUcjglrQm1lXk9rV+JhmNDfGd8zNccJhORA5mQRstjMm0=
X-Gm-Gg: Acq92OFC0M8tIVwhuiWXIadvyIizroZ4+JjfJxYRK78KpCAjU+ZM3jeey/JfGagcxdD
	FoasCea9rb5/OjVUgMKNkDvQYPGqWssG1VwkOMtiC2l+U0XL/3p14KMq4pdLI2PvMLg9KkkDR9Y
	hVmsVF0zUvwtklZBIgGWxjejt0RxjudVbrEDlFuiAEL0UWgm/oPuZYK0oe8/7/efKRqwmhIxaDy
	zzJ4KgTcCJhtY8GGC32jHinM1RQ+OHShqBWpSzXIu8/KXaLnwqEavKxBjbB+hw8XoRghWcRxIAP
	1cJITyk0S3Qt06XtTISg0EFvp2Ua3lCG44gxZlteMb3A1m0RBsMdGO4QBRY3jfeuETlSGsF0eLl
	8AnOayWtmsK4HRB2gMrc60dHZIahb/4gDcZLeWfXnaxNYFHFLQ0ixAwMqt39zFtauuEBobsN8c5
	KeLabCya7kWsmlj65HHdDfawCJsnFGWRib
X-Received: by 2002:a05:600c:37c9:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-490c262dcb5mr391675255e9.33.1781096050039;
        Wed, 10 Jun 2026 05:54:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc3fd502sm562365245e9.11.2026.06.10.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:54:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
In-Reply-To: <20260610102153.83367-1-phucduc.bui@gmail.com> (phucduc bui's
	message of "Wed, 10 Jun 2026 17:21:53 +0700")
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 14:54:08 +0200
Message-ID: <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_055411_847146_AED83D50 
X-CRM114-Status: GOOD (  20.26  )
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

On mer. 10 juin 2026 at 17:21, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.

I suppose it is OK but it does not seem to really clean anything and
make the code easier to follow in that instance, from my perspective at
least.

If there is policy to systematically use guard() whenever
possible then OK, otherwise it seems unnecessary.

>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/meson/axg-tdm-formatter.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
> index f451e4dce442..a6ba401104d5 100644
> --- a/sound/soc/meson/axg-tdm-formatter.c
> +++ b/sound/soc/meson/axg-tdm-formatter.c
> @@ -157,20 +157,19 @@ static int axg_tdm_formatter_attach(struct axg_tdm_formatter *formatter)
>  	struct axg_tdm_stream *ts = formatter->stream;
>  	int ret = 0;
>  
> -	mutex_lock(&ts->lock);
> +	guard(mutex)(&ts->lock);
>  
>  	/* Catch up if the stream is already running when we attach */
>  	if (ts->ready) {
>  		ret = axg_tdm_formatter_enable(formatter);
>  		if (ret) {
>  			pr_err("failed to enable formatter\n");
> -			goto out;
> +			return ret;
>  		}
>  	}
>  
>  	list_add_tail(&formatter->list, &ts->formatter_list);
> -out:
> -	mutex_unlock(&ts->lock);
> +
>  	return ret;
>  }
>  
> @@ -178,9 +177,8 @@ static void axg_tdm_formatter_dettach(struct axg_tdm_formatter *formatter)
>  {
>  	struct axg_tdm_stream *ts = formatter->stream;
>  
> -	mutex_lock(&ts->lock);
> -	list_del(&formatter->list);
> -	mutex_unlock(&ts->lock);
> +	scoped_guard(mutex, &ts->lock)
> +		list_del(&formatter->list);
>  
>  	axg_tdm_formatter_disable(formatter);
>  }
> @@ -330,7 +328,7 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>  	struct axg_tdm_formatter *formatter;
>  	int ret = 0;
>  
> -	mutex_lock(&ts->lock);
> +	guard(mutex)(&ts->lock);
>  	ts->ready = true;
>  
>  	/* Start all the formatters attached to the stream */
> @@ -338,12 +336,10 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>  		ret = axg_tdm_formatter_enable(formatter);
>  		if (ret) {
>  			pr_err("failed to start tdm stream\n");
> -			goto out;
> +			return ret;
>  		}
>  	}
>  
> -out:
> -	mutex_unlock(&ts->lock);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(axg_tdm_stream_start);
> @@ -352,15 +348,13 @@ void axg_tdm_stream_stop(struct axg_tdm_stream *ts)
>  {
>  	struct axg_tdm_formatter *formatter;
>  
> -	mutex_lock(&ts->lock);
> +	guard(mutex)(&ts->lock);
>  	ts->ready = false;
>  
>  	/* Stop all the formatters attached to the stream */
>  	list_for_each_entry(formatter, &ts->formatter_list, list) {
>  		axg_tdm_formatter_disable(formatter);
>  	}
> -
> -	mutex_unlock(&ts->lock);
>  }
>  EXPORT_SYMBOL_GPL(axg_tdm_stream_stop);

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
