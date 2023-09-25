Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863FACE7A95
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Sep 2023 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tH0BNsGxTaT/L5ExmOwdG+BQ/+1Idgrbs+S0CcPeZq4=; b=zwB6ax+94n0XfH
	bUWATBh1mLed9M4mFJ6J2w0FSWZU/t6fVj0lTxMb+KFNgkTh9L1OKzcRftulTFy5e1Q2YU/Xpk4JW
	TQcb20bpyXhwVyAKCTcpQOphU7Jj5AmEkD/9h0g8HaIdpVkg8p682WPZhlBKWMA+83r6AcO6aX2zF
	mAQRr/ps4bJ4K+GHBwz9xj5I7VVTIfjQRtjwqd2yLe1T5zRZB6YmnraH08A4nEGpFP1SEsDQ0Jw8R
	Vd2IGMY7OzWSZoXBiOoz+PEKCO3noZC8P1rsPx644GP0iNzs/+DPm+0GdtLuxRTLLWKO7b8c9MBzk
	MimnL/FdgC8k8KJn2LqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkj63-00E06q-1Y;
	Mon, 25 Sep 2023 10:45:47 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkj61-00E05P-0x
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Sep 2023 10:45:46 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c108e106f0so99601551fa.1
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Sep 2023 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695638740; x=1696243540; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJhOEMH58LR2rpNX8DYGMcQ4ke1/Bz5TvHhYkfY7lio=;
        b=NeCx3ieDW+cC04unXmu2/ovNeaXkjW+kly/uNqJPZSuI5IdL7xsywfl3SRwqqkfJH4
         euWcFupL0HdjkWNpcEAVd1/PNGY4yimEqR7I+sqj0xs1bLqhMXhsyfHoK65Ol5VIvWpX
         roQ4WSYv4jFmKq2ZExnuVL4knbdfqdzdybE1EhZ8LDgvjbSzRKxStsmDsNvcsJ88TDWI
         xog7ouGcW+p74mq9m9FCgYVWWV/iy0wT2XqXD0s9mwtCX6nS9zq01+SA0ngOoWn0MbYm
         4U2FrzUIDLz82BibUJDoltiJcIkTpBUSqrzqi88uL+KfYW788QLx+7S1SSAt++/xvYuG
         YjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695638740; x=1696243540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJhOEMH58LR2rpNX8DYGMcQ4ke1/Bz5TvHhYkfY7lio=;
        b=I0Y7fTIjYf39gJat8xu+kTIhUNsZMMei5Q8mbCa4LTPlh9WOyz+xCTATU66bWu3Wwh
         PmaYheG+VOlcTM/F2sZOIjgItTtc//UCpdaR7ap4lhfjOfLsYEhIYigBjxglkw41jJ8+
         0KAyx/h8c3zLeHRmo/O6hBhmqNPHUd2k0js4pMjLE4xAyMSHwGhCGSBirC/8Bt4rZ6rF
         i0+u5m050fi8QYIq2Z12OsV5In2X+SWnF/S+eoUyS64JYjJ/aeuopAUmNuqd6RGtN335
         2rtOn/qOvljuXRoOa+jvQDcivmCkGC+ub99e4G5lpN7jFSC1tlAQTqnDcTPwYeUYU8CQ
         bX5g==
X-Gm-Message-State: AOJu0YxlMk9T9smoEVVzY/0O/gqFKpdKQEdPfRXCBVsVm6cjhoIa00Ed
	OFC1X8RB7QZMUc4GJrAMc+e8ww==
X-Google-Smtp-Source: AGHT+IHxXTOX1fE2hluK//tSOALu1qxLgRqiFbpmx5Fz+r+ZkRzp1HhBud9Gohn39L6hc9ZVwlHCwA==
X-Received: by 2002:a05:6512:1596:b0:503:5d8:da2e with SMTP id bp22-20020a056512159600b0050305d8da2emr6292587lfb.13.1695638739673;
        Mon, 25 Sep 2023 03:45:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id l14-20020aa7cace000000b0053331f9094dsm5356947edt.52.2023.09.25.03.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 03:45:39 -0700 (PDT)
Message-ID: <235b17ef-b34c-4006-baa4-a1d4360dca16@linaro.org>
Date: Mon, 25 Sep 2023 12:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: Add watchdog node for Amlogic-C3 SoCs
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230925090641.1185942-1-huqiang.qin@amlogic.com>
 <51470d7a-65a7-44c7-856b-53ca4b065553@linaro.org>
 <bb20efd5-4f60-5ded-caa6-2c9c94a10a44@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <bb20efd5-4f60-5ded-caa6-2c9c94a10a44@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_034545_345557_484D061E 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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

On 25/09/2023 12:42, Huqiang Qin wrote:
> Hi Krzysztof,
> 
> On 2023/9/25 17:33, Krzysztof Kozlowski wrote:
>> This is c3, not t7. Why do you use t7 compatible alone?
> 
> The C3 and T7 use the same watchdog controller, so they are compatible.

I am not saying that they are not compatible. I am saying that different
SoCs should use the same compatible. Just like for every other platform,
Amlogic is not special here.

https://elixir.bootlin.com/linux/v6.6-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
