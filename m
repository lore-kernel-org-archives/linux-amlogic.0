Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C7CC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnF6UqotX1zzTLZesX8nLSzVhkxcsDf6DZI8Q06zzoc=; b=VoCsKlbKKH13sVN6uAZQXP5sAz
	RSAkUjpndmM4TpiPAeXGlcv8kwsUTtzGUrqpD7OLxe2RElSRW6uhyaPf1DzHimvMPxTuOBowCg+3K
	OTerfumOOEBFAYvUo947CiszsQevA+JPw2jIsX0Zhl2KtqOgDQl+dCvyEHfah6JyGmdVLzI479zMs
	wGpxXvRaj/EkzAs1T7QT6ffgFpUAOmsSVwioEIJZ18h9yRn53RnjIHPgKHetHwWIX5enlGtgqycuq
	3W2PQHgX27phkIygTO3y6aZWQsbEssFeEQBBr3YvVy0ja8RaAJuQX5YEKbIJp53Oy1ePncOhlwMqn
	11aS/3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnLk-00GSNq-OS; Wed, 23 Nov 2022 10:51:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnLi-00GSMV-6l
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 10:51:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1004335wmi.3
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 02:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=agDVV6DraxSox23J7he9F5SAzbVldvrCrvEWw1B8iX0=;
        b=azgb+gOo2rnkXkaWB0hgmT51zrOTplmQTjwYpklcBFwr+sWuSRQYK47K7a4bJY4FIz
         ELOE3FmCpcR2RbIgM1WVpOOO8hygA2BKahCA0tIbaA3to3Ydl6k6HGSqnZ9qcGY89lKa
         4LnFP/eHIH+cEz4KYlyHRYnFMl2hWuzm6+pU8O1jfhxG6A58QrVpzvS7Jh9pFjeEs8IF
         eTuNa3iwYNHHn2SHZ2uKiF9eBCt/TzzDhQbpqjqYfpQSjmIZheInMVE5YOk+tmdYiQvc
         zWaZpCYCu00enml4e4LB/8mY5Y4+R94Ng9fJL4/NGwCeEYtuf9ETzHqf1mLe8KMTvHaG
         FxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agDVV6DraxSox23J7he9F5SAzbVldvrCrvEWw1B8iX0=;
        b=tIkuSrhc/NQ8vylrhd0t2d1SYFa7ciPdgA/9e9SshIuDKKv2XK7FQDr4zksIZnOyMD
         1UCignMsceJ1zJPSuVjKtrrw77tcPyJ9I5WB6WSwDHYUddS6+blTsDggBm6mM9xVjeTe
         N9uZx2azotNmULWpGxRa9s/Ieh1/mWXPQ31A1TwpKbjXNZAuwAyEqB83gEuFfbvgvELA
         R9E9OWzgmhyhKLGcZZz32hfZg9yUD52vSs6vbB5E3lBxxwzescC6FeEvsZMON/8m02sP
         ppcblYUAw6BzQr+x9CZqHzvKBTffzcNMYvOohVfKFbHhtkJ0zALpBwdGamtlWMw1S12d
         bssA==
X-Gm-Message-State: ANoB5pmitVO/+nu4I5fMUNKJozflBuBOr0QevIZSD3WLvIfceFOChpqx
	vJuVyZseMRuxzFQotXUnHW0Tog==
X-Google-Smtp-Source: AA0mqf50gOVwqVJVHjrBbPSUHOYN4PCW7GS9QrtNjRCnKKQfX1lwCmse1TAs9eEweY/cecvNqhhgbg==
X-Received: by 2002:a05:600c:3109:b0:3c6:7abb:9d2b with SMTP id g9-20020a05600c310900b003c67abb9d2bmr12389185wmo.182.1669200683265;
        Wed, 23 Nov 2022 02:51:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id r64-20020a1c4443000000b003cfaae07f68sm1883416wma.17.2022.11.23.02.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:51:22 -0800 (PST)
Message-ID: <9ae1bae2-67ac-12da-7d4b-16dd73e13d5f@linaro.org>
Date: Wed, 23 Nov 2022 11:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic Drivers updates for v6.2
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org>
 <4a6b34ef-f5d2-4e56-a7f6-6a7c9cdda416@app.fastmail.com>
Organization: Linaro Developer Services
In-Reply-To: <4a6b34ef-f5d2-4e56-a7f6-6a7c9cdda416@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_025126_275503_730FA7F4 
X-CRM114-Status: GOOD (  14.39  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 22/11/2022 22:48, Arnd Bergmann wrote:
> On Tue, Nov 22, 2022, at 16:24, Neil Armstrong wrote:
>>
>> for you to fetch changes up to 7dc69c7d073e6004a281db8f7f15cf6ebf702ea0:
>>
>>     firmware: meson_sm: Fix memcpy vs iomem type warnings (2022-10-17
>> 17:19:04 +0200)
>>
>> ----------------------------------------------------------------
>> Amlogic Drivers changes for v6.2:
>> - Fix memcpy vs iomem type warnings in meson_sm driver
>>
> 
> It looks like a trivial fix, but I think it's actually wrong:
> The real problem appears to be the use of the ioremap_cache()
> function in meson_sm_map_shmem(), which returns an __iomem
> token that is mapped cacheable on architectures that support
> this function, but behaves like normal ioremap on others.
> 
> This is probably not what you want here, instead this should
> be converted to memremap(), with the __iomem annotation dropped.
> In the long run, we should try to kill off ioremap_cache
> entirely, and not introduce new ones.

OK will have a look into that,

Thanks,
Neil


> 
>       Arnd


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
