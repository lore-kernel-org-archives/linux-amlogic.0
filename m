Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E9DC7618E
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Apr 2023 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeGwvZvizrs8r7ZHH9zRojDWlX4ICG9SQKXxBlM7jaE=; b=l4TU/hjUkUmW02
	PfvLEQyDscOgmtAx9Knt5MHyR3DF2gL1jRd1i3oYF40jrPMl93KvQMNo1Au0lhfwxB9icNB7Euk+e
	VhgSNeUcKAUDvXJNAayXahFEWNFr4hQ7w+/PGNR8dLa40Arlm8AsUQiirx0UM+zGIVJiLTpclUUU7
	918iw/1qESiOlUlQCoLR5c/5sYCs8R58yyQ751ziwIYXLxu9EUnhtnxtvbRs2eeeFV84gpQT5jptY
	TCpt7Uhjhf3X+RJpCQg50+titzftUNAzUYEr1mUeqyJDxcZ/Q2ba6whS3YA/Z+IYPw4NrzVQyI+ze
	NPi5LgebUsYqqGvyo28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppslX-00BHvG-0i;
	Fri, 21 Apr 2023 15:33:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppslS-00BHuE-0Q;
	Fri, 21 Apr 2023 15:33:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3010889c6ebso1173040f8f.2;
        Fri, 21 Apr 2023 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682091211; x=1684683211;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC3svFk4XAPKdzjA+OTrAzU2Lfe2zHdqn7Mlo6gk9NI=;
        b=Kf0UrYdVVOH5GK9XokEsyp9sWqwnBzD1CqqnWbMR7dticBjiAZ6kMfgt7WPKi5q38b
         cc9JAjiyZLlYgfNFxQRoilv4jS9PFXzSdDFL+o352heVE2I/KqDd9Kui1ZAd1WGNr4bs
         6KkNHt626jSDQWk40/OANG8+66i4YKDjW4gzRhA2ngjmyo+eSmdjMo/V6fLLDas115WF
         5VrnbFTDeoyaV9LpnlTnFYiZyPYbnMqxBZLePcRCiKx4XvZ4LvEuQh8aVds2hD5Tsyd+
         /5QAuSMhJjKaztn7U6mwxufNeBsJYLZi6HgYSTbf9tU74OpT3/6BZLlSqKpdApwA2fow
         BO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682091211; x=1684683211;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HC3svFk4XAPKdzjA+OTrAzU2Lfe2zHdqn7Mlo6gk9NI=;
        b=CaBG7HiOmVvED1GuoA1vn+DG8r+ZRetrW4SHT1HwZbesYmzC50HWP9vb7IIvs+1EPd
         YUYtKuVx5eX2Bg3JulDUI0WHAUfKDeA/sqqhHefVr3fqtGHULFUKgDHd6euUyS9LQ4oU
         EPxgbqjxt0/vuYW1Jp1OUWUGa68JERgeHgE3Wmum6gnBS5yP+NP3vFGQgDXsyXNrB4ma
         9H2txdiV8AhMD8Fz707yeXPi9KiiSgGMCXUCBuNyde8TCzfYm62eCgvVtWpeQ+Tk0yXT
         CK4TLTN9Hby9qhTpdtUxOh5uv6vl2nKk7UMKkE0I2PsWxKX4620CfOSFP5hOYk7J/0IV
         goEA==
X-Gm-Message-State: AAQBX9fgwYhw+OsiTbetjP5O1u979KcG5kcK6qDYtE76tnOQpn4kDXVH
	yhmslOKyzPFpwmgoSPbBEa4=
X-Google-Smtp-Source: AKy350bGA4afJcGNnGUG1GskKygwZhFCP6vVswVC+F0QdnciS8gk+botp/N1mwm/kOKMSV+m2IyTSw==
X-Received: by 2002:adf:ef0d:0:b0:2fc:ec82:4dbf with SMTP id e13-20020adfef0d000000b002fcec824dbfmr4145646wro.1.1682091210923;
        Fri, 21 Apr 2023 08:33:30 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b8bd:100:e56d:8c4a:e6a8:c253? (dynamic-2a01-0c23-b8bd-0100-e56d-8c4a-e6a8-c253.c23.pool.telefonica.de. [2a01:c23:b8bd:100:e56d:8c4a:e6a8:c253])
        by smtp.googlemail.com with ESMTPSA id h15-20020a05600c314f00b003f1978bbcd6sm9947wmo.3.2023.04.21.08.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 08:33:30 -0700 (PDT)
Message-ID: <5b1a84ee-1f96-1585-5167-4f4e266a7fb7@gmail.com>
Date: Fri, 21 Apr 2023 17:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, kernel@sberdevices.ru
References: <5a5920db-4c32-25e8-d1e3-bd2f724dd242@gmail.com>
 <20230421145723.oq7zqbhhz4fhkmyj@CAB-WSD-L081021>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] pwm: meson: simplify calculation in meson_pwm_get_state
In-Reply-To: <20230421145723.oq7zqbhhz4fhkmyj@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_083334_192598_C2EA0B6E 
X-CRM114-Status: GOOD (  22.49  )
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

On 21.04.2023 16:57, Dmitry Rokosov wrote:
> Hello Heiner,
> 
> Thank you for the patch! Please find my comments below.
> 
> On Wed, Apr 19, 2023 at 11:30:55PM +0200, Heiner Kallweit wrote:
>> I don't see a reason why we should treat the case lo < hi that
>> different and return 0 as period and duty_cycle. Let's handle it as
>> normal use case and also remove the optimization for lo == 0.
>> I think the improved readability is worth it.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Inside this patch, in my opinion, you have not only simplified and
> optimized but have also modified the logic. It is important to provide
> more details on this modification. Previously, in cases where
> (channel->lo != 0) && (channel->lo < channel->hi), period and duty_cycle
> were not calculated. However, in your patchset, duty_cycle and polarity
> are calculated and returned to the caller in such cases.
> Can you please share the details of why this is the right solution?

It's the obvious solution. I see no reason to return all zero's for
lo < hi, and also the commit that added this calculation doesn't provide
an explanation. It just references the calculation in meson_pwm_calc(),
however I fail to see that lo < hi is treated differently there.

c375bcbaabdb ("pwm: meson: Read the full hardware state in meson_pwm_get_state()")

> Also, please rephrase the commit message using 'modify' instead of
> 'simplify'.
> 
>> ---
>>  drivers/pwm/pwm-meson.c | 14 ++------------
>>  1 file changed, 2 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>> index 5732300eb..3865538dd 100644
>> --- a/drivers/pwm/pwm-meson.c
>> +++ b/drivers/pwm/pwm-meson.c
>> @@ -351,18 +351,8 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>>  	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
>>  	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
>>  
>> -	if (channel->lo == 0) {
>> -		state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
>> -		state->duty_cycle = state->period;
>> -	} else if (channel->lo >= channel->hi) {
>> -		state->period = meson_pwm_cnt_to_ns(chip, pwm,
>> -						    channel->lo + channel->hi);
>> -		state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm,
>> -							channel->hi);
>> -	} else {
>> -		state->period = 0;
>> -		state->duty_cycle = 0;
>> -	}
>> +	state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel->hi);
>> +	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
>>  
>>  	state->polarity = PWM_POLARITY_NORMAL;
>>  
>> -- 
>> 2.40.0
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
