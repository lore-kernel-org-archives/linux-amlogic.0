Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65C2C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 14:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjAB26o1lhEXacznQKO702d4gy6S+avzz2QKV0StYxU=; b=T949neaWjP7MGv
	ZVorti3k5QrwlMPsfSbTvOEvixCxxUUQaHqUxRlF1AEyUGhCO9mk7UKSOynZ2JjdW846wLXmoJXUd
	rxH4YFN+vqSwlvT/Bp/9N66gauX0yO4ddEJ7ZKdIzWakYS0OTBOcYEt1R5YnyoQ8SRfJaX7dIrgBJ
	796rgCW87fQhnZfTeMPVUZopD0YXOOZlyBAavqxfv37XJWOhwa8P8C/ScJIWstLtQKvpHayAQMIUB
	opSk3cwWjAWyj4BfFsg8m7rhESoLKji2WRkjf0hZvGjhACGcvUvPabwDUzWqmhB6ggxw6WgHm0zVY
	7sULYWb4PkwxsQHa1Ojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuCj-00000009c1w-2NLs;
	Tue, 13 Feb 2024 14:56:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuCh-00000009c0y-0gyI
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 14:56:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33b86bc4bbaso980910f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707836170; x=1708440970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssLWo77neaxkSpzAJ8+TOpGyQzL5Wyk8VsbQlbpCfCQ=;
        b=Qh2phdNM7O1WvlZsfXt1zwBw5Kcbt13FklYIXUs5OBkOoE+xTM/QQBeDEk2dHtg6xJ
         r4LpjqGW+LtQzFQmYv3fYrxCLKCkZwkVVarCyn0HdTMoxhXUbtUr6F7MJoykJxD5+tSW
         dWo1hN/jXMet5Puqs5219qKPxl6vmtvimiqvfNKcai95vyyC6mXnUpnvAg+U5jlrNtvx
         G+rGmRHY3GdpEGN9i4/ZFWCfIjNXEk2O8VaTCJ7vLGItrJXmvUoJ4Yr6O4vJPnIMOjNS
         8lH0/SOSVnYa41FU9BWCLOFTXAti3Va+zZVNxescHZGTCoWQBl8NCZEY5yS7kJc1ysj8
         TG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836170; x=1708440970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssLWo77neaxkSpzAJ8+TOpGyQzL5Wyk8VsbQlbpCfCQ=;
        b=WEDEO8bfiyItfZVp6tm2WwIKq4jOptSl+qPw+4SDqRvMKa2736L77CGE7YIOhObRTN
         CACvOG7BxxE9dD5gjBuu2TMaPYIte8SdkIfybT79gVOxBHnBquXgz2Zh4o4Q/gOZMTzt
         61il/J/8/jZapL23afFStrX7zLNzsZMwUh+80L5jA++MLLGS6YRLgflr+X9xGboBpWeN
         hhykpV2LROuIemkXYkJmP74sPEbORT3CumWRI7XOZ7O7e9RSHJz2Et2tXc7O6omhnQT7
         1/PzcJ0tl01HDwJ99w85WRwl2Zr03+isx7Q4ZgCCkU8f9xTdT7W65OWKzwfwuFlqNAXt
         j3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXvy1eQ6MwhkxZasV0RsbQ5+H4xsBSSmJTocXG5L1BZlglCABs1hOkQWs5jsPegI5aakYoeC0LBHFD6ZDb6b0vdvFccANB9EGszAA7qbUrXqZI=
X-Gm-Message-State: AOJu0YxzFnd0XZtVrFOP9+MlvcUSNKg4ksa9Y9ochhz8spHnBBQE8ikX
	8ATG0wMpOSlULjkiNqrNN4UiONuFytns6KadMcuewkw1zSay6/kkv5zAz1xFvDaOvprWWeRiecA
	I
X-Google-Smtp-Source: AGHT+IF1C5nh8bJuFLM8ID8/TXnUxy59WDxnTOSKmeTtSXTfm5EIxLSpc8EAZ4jrn+byAImy5b1xdA==
X-Received: by 2002:adf:b192:0:b0:33a:e950:58fb with SMTP id q18-20020adfb192000000b0033ae95058fbmr6321630wra.57.1707836169918;
        Tue, 13 Feb 2024 06:56:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVp2fb+M8T86JLk57OjakjEiC7ePRaH4vSUiHw9eDkyWv+WkhD5gGBbYV2b8QVu+kudwXXWg9y4OArbVgnEiOnbTXJyyOVB7Zfc5YSjukI7pV8=
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id u6-20020a056000038600b0033ce2aae7ffsm625747wrf.33.2024.02.13.06.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:56:09 -0800 (PST)
Message-ID: <c4ebe7bc-82e4-4e0f-b870-745e7d1c1c31@linaro.org>
Date: Tue, 13 Feb 2024 15:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: amlogic: replace underscores in node names
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>
References: <20240213143217.336341-1-krzysztof.kozlowski@linaro.org>
 <e889f65e-9ce4-4995-8279-9275147195dd@freebox.fr>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e889f65e-9ce4-4995-8279-9275147195dd@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_065611_262853_5C1FC226 
X-CRM114-Status: GOOD (  11.66  )
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

On 13/02/2024 15:42, Marc Gonzalez wrote:
> [ Trimming recipients list because my comment is very tangential, almost irrelevant ]
> 
> On 13/02/2024 15:32, Krzysztof Kozlowski wrote:
> 
>> Underscores should not be used in node names (dtc with W=2 warns about
>> them), so replace them with hyphens.
>>
>> Cc: Marc Gonzalez <mgonzalez@freebox.fr>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../arm64/boot/dts/amlogic/meson-a1-ad402.dts |  2 +-
>>  .../meson-axg-jethome-jethub-j1xx.dtsi        | 14 ++++++-------
> 
> I use stat=120 so that format-patch doesn't truncate the path.
> 
> Without it, it's hard to tell if fixes only target arch/arm64/boot/dts/amlogic
> 
> BTW, I didn't mean to single out arch/arm64/boot/dts/amlogic,
> it's just the tree I'm working on at the moment. The issues
> are wider than that:
> 
> $ git grep -i ' [_a-z0-9-]*_[_a-z0-9-]* {' arch/arm64/boot/dts | wc -l

I know. I fixed few platforms in the past, fixed few more now.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
