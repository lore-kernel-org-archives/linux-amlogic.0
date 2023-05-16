Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCCFC7EE24
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUTbfBD9LuXhVnIb+alCz+AGjZwp7Wtr6FoY9jYbNUY=; b=UlCqcKHAz3e69Q
	u34tQgRGFTAQ5vsMzpNNoGyoHCer3sR1Ome3DqTHblF5WVOCMKQLm5z6PpV1hdA9MrGP2MWToFji+
	+Lz5a7ObeVIp1M01w+S+5thmdXUNQkyxMXi1B/vaVksRUm+cxXuPuZqxfdk8wJWZjIwKkdNIi2+KH
	rtxxVD/lH5dY2t02opWL472ZUn1PwT/9W9RYmGCTuSFtGW7wQkP59sblPq/Lo1nas1b3mI8WtHFkD
	DcfdiZ35aYPpTETEJeZ+kcGkBxsKU9Rhre8L/5dtbRec4VdZTbgGlwvm8Ls8tuteutRilnXsr1Ob4
	ahorbdyXL/a3qcI3VVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqrH-0052ZC-2m;
	Tue, 16 May 2023 09:20:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqrF-0052Xl-1m
	for linux-amlogic@lists.infradead.org;
	Tue, 16 May 2023 09:20:38 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so19241497a12.3
        for <linux-amlogic@lists.infradead.org>; Tue, 16 May 2023 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684228833; x=1686820833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKmrFlgSWX+t+l7PFgADejC3QH11/GIGNmgdRMFWF4M=;
        b=wNjphbz7UyLurZVuOw11aYjCR9pjaj5kpOwiOgs5llFTjhoQ2nXjO7AkDn85sl31VK
         AzibSy1qBWebYtFSQHQcm9jsOY4JZn8F+S3tGoAWBlKaORwFqBgNo3LnwLF+g/hJcy37
         s/lmssAGNCtAFfqz9EqYzmCTG1ZpMZtO1Gp2v+IZus6A7PKbpxrn66+lB23RkxiXm+ze
         ADy5a4oSp2rYpBfugLJDh+i1YPeC3gt8PnDhEqiMRpCcPTBJ1D4mRFjbOEMe5RoKk4XZ
         VqUMml0LLnFBkYhtMFX1QJfA2LYdgiJgKYnkE0qjxoqpJG3AHLyunTzBzWTMIY8ZhB4M
         H83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684228833; x=1686820833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKmrFlgSWX+t+l7PFgADejC3QH11/GIGNmgdRMFWF4M=;
        b=BuIAwPPIruPwudbdNlzZURshP4rKtKk/zWkKBJqML1M5RWlcjgteGxUADYiOS+SnDW
         VjZ11/R35h8MJlAVART1IgPCwkg6/rR5sSKtO0H+aoDOKWX7/jvpzimBrI9zUzTgKMSx
         dwsMLbmEt2eo08wnWXkX6FMyCRN+nPs3w5LX6JJ8TSZLg93ByoeknctABNdRg6oNgLMc
         sdqSj32sCgnxiIu9HCyqbPUM+Qi8ASZcR/5XVXV9jciAohKaSRCZONqR12HF11zjiYoG
         pAua4tl1ZObWhO9k7Z0R2rpCd2tji6wlln2hAFSncBHpXy1QlUNOfoYzMl9os0D/WHtq
         oTQA==
X-Gm-Message-State: AC+VfDxBSywtdAR2osYOuTpgGhgiXwI88Dgpye37QS4L01/VoG7+Rx73
	Cb1Ge9xorvEacTRase2SJFO6Sw==
X-Google-Smtp-Source: ACHHUZ6BJWFuWCwXtypRGM2NV6a/s3a/P/PDkDpk8hHfQebAywD0uX9kjk0A0N0fAJ3zx6ufXn35Nw==
X-Received: by 2002:a05:6402:202a:b0:504:8c1a:70db with SMTP id ay10-20020a056402202a00b005048c1a70dbmr31410720edb.32.1684228832934;
        Tue, 16 May 2023 02:20:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id v16-20020a056402185000b0050cc4461fc5sm7874223edy.92.2023.05.16.02.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:20:32 -0700 (PDT)
Message-ID: <c4d30304-08d8-6a31-8f91-7840fe2922fb@linaro.org>
Date: Tue, 16 May 2023 11:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 RESEND 0/4] Add S4 SoC PLL and Peripheral clock
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230516064736.10270-1-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516064736.10270-1-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_022037_588551_80E1851E 
X-CRM114-Status: UNSURE (   8.85  )
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

On 16/05/2023 08:47, Yu Tu wrote:
> 1. Add S4 SoC PLL and Peripheral clock controller dt-bindings.
> 2. Add PLL and Peripheral clock controller driver for S4 SOC.
> 
> Yu Tu (4):
>   dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
>   dt-bindings: clock: document Amlogic S4 SoC peripherals clock
>     controller
>   clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
>   clk: meson: s4: add support for Amlogic S4 SoC peripheral clock
>     controller
> 
> V7 -> V8:
> 1. Change patch 0001/0002 dt-bindings title description, remove "meson".
> Suggested by Dmitry, Neil.

So you only removed one word from title and description? This does not
justify dropping review tag.

You already got a comment for this - add the tag.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
