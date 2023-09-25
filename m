Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A9BCE7A94
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Sep 2023 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+M2l4CfV+/fAd7v2ZWywxui6nZqw6R3MFaDN9nqNwo=; b=ZtvjfwaITcvvs8
	wjrr7FqYxwOkCuGtM5LveMnIDfNr94cp7EpInA0yyB+ItMk427u0TpjU6a/OUoC9dwuWykeqIXDMv
	9dUyLuzOVr+SWCwUuaLUYjZ1hjfswWWBWU/8x7S8HClpGP/R16LJ62mS3RjVtmDHI8MONxWbrVFP5
	pnJdBMa+KD6nNVqKtRmpR9wXFGbmELe12VXZxCFFphRzFzWiv4ow80IuWOtv3lzhbfwY6kNTj4t3R
	TrsRwQ3hDFJEKD/2KWYjMG9OkXqkencKNOk0jCJTtUpZkvWHgmzuKaSO700BGnxSGWgQiLP1rFUP8
	URUeEqxdcZn0iuUwyOfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjIZ-00E6NZ-1N;
	Mon, 25 Sep 2023 10:58:43 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjIX-00E6Jy-02
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Sep 2023 10:58:42 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9b0168a9e05so517536966b.3
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Sep 2023 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695639517; x=1696244317; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tiTROYF3AfFrBmjQFXrAqpJSodgoRsdidpAw5hshkTU=;
        b=ZbQJ+r87YC7sQHI679j7wmLH8sbKXfax8Sx4C9wYahRbgcGVUYWcD7VbEEXUZkIoFG
         EPe5bDMGbDXQR1Itc76OG2N0xiiv1MBqwsSC0Ae1kzARfj4Uu4BjwqGbf1lIs9i3aqrV
         fZqU51Uyt0JfyGeR6HrRo+6p+zAOsORdFhjp6tTAWV8pfV7IWgzVZuIV8YpRxB49/QUb
         QTVCXwc2IT54QA8sD2iGmr6qcngTsjn9UP8B/3K8esTrvSwvUmX7z/XZomKcxavjksi5
         to4fXiBuba24qa5sUVhRQ9PZB3Z+ejpQrT+WE0zgY/zxzxnMJa0+EDRfjMFrLo/N63Yh
         Y34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695639517; x=1696244317;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiTROYF3AfFrBmjQFXrAqpJSodgoRsdidpAw5hshkTU=;
        b=sqF1Lv0SnXf4kV3/Xm1rSkkvjuc7EZLBxKPJO6COfOa551BCWfjs+lLhp1h7R6Kkf8
         zmNIUyFGyUq2+iCyJT2wwTovVdFB1WpIgXMnsaShrJy4vz61VS53p99bLujpX0yem8zW
         JvJ2yQq43rWw9lKtz7qqs4kJz89o2ZcvFHRdq/wHa5hSgOXe/WC3itTKiGwo21RjT8xY
         j/SGRc4edy6yk+IgXtuuBOrGI9A1h8zmdT4LNorEXWpcWoAnaWPDdPaIfn22MCN47jTI
         D6fgyJiGZEFCv2Ox2ELnkw+U72ImXg5UFxd12cIAM9JRaxfvO+ZQ4zcSm6c0br+PO3gn
         7SRA==
X-Gm-Message-State: AOJu0Yz8r+pD3+4o1qFYkw4r3f6Uihf6ybcOvlrbl+2FzK3FBmEbx6JV
	m//ZcJSBFyoMvhul03seY98d5w==
X-Google-Smtp-Source: AGHT+IF4gmtwCV/DJZX7wQ3igBMhnDs1k843Cr+1i4Its1jXiSjTaCKZiPsBP0dbK9WpkYc5jNaQqQ==
X-Received: by 2002:a17:906:cc4e:b0:9ae:5a9f:6a9f with SMTP id mm14-20020a170906cc4e00b009ae5a9f6a9fmr4978421ejb.52.1695639517106;
        Mon, 25 Sep 2023 03:58:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906bc4e00b009937dbabbd5sm6146381ejv.220.2023.09.25.03.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 03:58:36 -0700 (PDT)
Message-ID: <e9334edb-bf2e-4dca-9752-14b2924763a4@linaro.org>
Date: Mon, 25 Sep 2023 12:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: Add watchdog node for Amlogic-C3 SoCs
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230925090641.1185942-1-huqiang.qin@amlogic.com>
 <51470d7a-65a7-44c7-856b-53ca4b065553@linaro.org>
 <bb20efd5-4f60-5ded-caa6-2c9c94a10a44@amlogic.com>
 <235b17ef-b34c-4006-baa4-a1d4360dca16@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <235b17ef-b34c-4006-baa4-a1d4360dca16@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_035841_057235_75E18C11 
X-CRM114-Status: GOOD (  10.56  )
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

On 25/09/2023 12:45, Krzysztof Kozlowski wrote:
> On 25/09/2023 12:42, Huqiang Qin wrote:
>> Hi Krzysztof,
>>
>> On 2023/9/25 17:33, Krzysztof Kozlowski wrote:
>>> This is c3, not t7. Why do you use t7 compatible alone?
>>
>> The C3 and T7 use the same watchdog controller, so they are compatible.
> 
> I am not saying that they are not compatible. I am saying that different
> SoCs should use the same compatible. Just like for every other platform,

Eh, missing "not", so "should not use":

I am not saying that they are not compatible. I am saying that different
SoCs should not use the same compatible. Just like for every other
platform, Amlogic is not special here.

> Amlogic is not special here.
> 
> https://elixir.bootlin.com/linux/v6.6-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst

Please define compatibility list with t7 as fallback.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
