Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20118C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 08:20:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14D5C60F48
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 08:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14D5C60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=78t8sd4NNgQtXfZeyy0QH0qwe3Kr8k0DfrhYAXMaDV4=; b=CYVkqozfehdKuZy+XAsOiEVbu3
	OF5EdqxGozOwlycXpdQxknAVr296kfKCMKk8XHeArMCQDxJjKScTgne5qqn6U1HPmGwT3sqpigUFb
	TSzyXgd/2SYZtCiKd7vKD0iM72jBEHq5lAYAGDXDNlrX0NXH0/7RsYd3aIyjH/bl5mCngi6QpP8bJ
	GPWv+KXY9j6895tiu+7e4boYopm/VMNfeRt8NXcSSSS3h5wUkO2YggGBKq6b79suLSHtzKrIUs+VD
	RDh2m16CvpTH11tst58XPtIg7kVRt3ibaHfJ73M6Mgkf+s+2K/ejOOzl8HTUjNDWoHva3sf4D8Uqh
	Wo75VW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Nkc-007gYX-G5; Fri, 30 Jul 2021 08:20:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9NkY-007gXX-OW
 for linux-amlogic@lists.infradead.org; Fri, 30 Jul 2021 08:20:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso2193746wms.1
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Jul 2021 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5zdWLUXNJU0I3jZZ3brzary8lrdEEnSpQU409joGD14=;
 b=JzWav/+UQ71FuwQ6UITAqfqrxp2ltUX7DgVNDt14RiOd46N2HR2jsHFvFah9+ZeeGB
 YSjrOTBFNpL1/OnS84wdFJfWATY79tOr3d8GDLMwAHddGerXsDur6CO3440ito/wC5RS
 OCxVVePArMHbKafvWRdtPySAYSgE6cdNBb7LBv4v8uUtB1FrN/s1baqVhwqvj5l6QIgE
 F9mlNDSbKvt3q7elNAmzVBduuqog7l7LgewwNnQQe/WO32J/wyREP3ZcmKNqwxY4Bz72
 mmSuYsNeprDL+dFqjgTZs2FLWWrZUPFwoOZEN1imHtqhNSTikxId9y0OJr/qVqZ4cy/T
 REZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5zdWLUXNJU0I3jZZ3brzary8lrdEEnSpQU409joGD14=;
 b=LbRbhzP6fELkwwI6bmt21E9+yNFZLgk/hxNRdSiSWyE8ZV3OcJiK9SZLtrS7W1CyCZ
 +c0md6U+9+bxXXi7ViIj0khOqjrWTCDOfzyOQM7gSyjM/SmNLkU9iktHK0I4vtnKY57t
 UEyXXz6djeKiy5YDzOa42zqU6buseT1P+eQKG3aDPk5ngtV9cUE+5/FsFG7vf1lxmO/n
 n3tqQQ56OGRXdte9KH7HLnN2eAZKpwPS6d8rdtPvemExJukyVrtGotz/4iSFuDiyLkXy
 RumgtoL0+/Jp6cspJylByHAzWONpzQ1QiqRtI9hAIFwVRtk3TbQfRI3GMRelvqALHFzL
 hlNA==
X-Gm-Message-State: AOAM533zKtO48gPovR4kdY/Hkv5+D/X9Vs3IDWESa0KVa0J1+wVaKSRb
 LO4RFclgii2TSQsFcPilu0f5Ow==
X-Google-Smtp-Source: ABdhPJyQFiTfoBz82jRJQWZ8jvSNbntfvoFKpzoIrcUu4TMY1XG3H6knR3+eJ7RxifDA1xn4kKY6rQ==
X-Received: by 2002:a05:600c:88a:: with SMTP id
 l10mr1710089wmp.78.1627633208255; 
 Fri, 30 Jul 2021 01:20:08 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0?
 ([2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0])
 by smtp.gmail.com with ESMTPSA id z6sm869484wmp.1.2021.07.30.01.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 01:20:07 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
To: Guenter Roeck <linux@roeck-us.net>, Artem Lapkin <email2tema@gmail.com>
Cc: wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-4-art@khadas.com>
 <20210730045857.GC2110311@roeck-us.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7832d036-3811-544e-8007-fe719bb38ded@baylibre.com>
Date: Fri, 30 Jul 2021 10:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730045857.GC2110311@roeck-us.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_012010_910940_562E7F52 
X-CRM114-Status: GOOD (  27.60  )
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

Hi Guenter,

On 30/07/2021 06:58, Guenter Roeck wrote:
> On Fri, Jul 30, 2021 at 12:13:55PM +0800, Artem Lapkin wrote:
>> Remove watchdog_stop_on_reboot()
>>
>> Meson platform still have some hardware drivers problems for some
>> configurations which can freeze device on shutdown/reboot stage and i
>> think better to have reboot warranty by default.
>>
>> I feel that it is important to keep the watchdog running during the
>> reboot sequence, in the event that an abnormal driver freezes the reboot
>> process.
>>
>> This is my personal opinion and I hope the driver authors will agree
>> with my proposal, or just ignore this commit if not.
>>
>> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
>>
> 
> A much better description would be something like
> 
> "The Meson platform still has some hardware drivers problems for some
>  configurations which can freeze devices on shutdown/reboot.
>  Remove watchdog_stop_on_reboot() to catch this situation and ensure
>  that the reboot happens anyway.
>  Users who still want to stop the watchdog on reboot can still do so
>  using the watchdog.stop_on_reboot=1 module parameter.
>  "
> 
> That leaves the personal opinion out of the picture and provides both
> a rationale for the change and an alternative for people who want
> to stop the watchdog on reboot anyway.
> 
>> Signed-off-by: Artem Lapkin <art@khadas.com>
> 
> As mentioned, I'd still like to get an opinion from the driver
> author and/or some other users of this platform. However, I'll
> accept the patch with the above description change if I don't get
> additional feedback.

Sorry for the reply delay and thanks a lot for your review.

The rationale from Artem is OK for me.

Please add my Acked-by for the whole patchset.

Neil

> 
> Thanks,
> Guenter
> 
>> ---
>>  drivers/watchdog/meson_gxbb_wdt.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
>> index 945f5e65db57..d3c9e2f6e63b 100644
>> --- a/drivers/watchdog/meson_gxbb_wdt.c
>> +++ b/drivers/watchdog/meson_gxbb_wdt.c
>> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>>  
>>  	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>>  
>> -	watchdog_stop_on_reboot(&data->wdt_dev);
>>  	return devm_watchdog_register_device(dev, &data->wdt_dev);
>>  }
>>  
>> -- 
>> 2.25.1
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
