Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69422C77B7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEPVRWVXjiPk3oMMD5PyqLn2xqTzzSMJH19EAuvjYDA=; b=4CUhnn+eM8i/Yv
	V9gxR2zd7QLEETfPpQNelK1ZO+QPdl9Kn+PJv1kYXK5ymVdu+l4LsRXp/buvUJYhagG2YbFAyoWGt
	JD0gUhqyrniTyieZ1AgByu1SqkQynMmRlTdvzu9oPXxy/PRKYGiP4I6Qn77DqD6N6JwKUOhREilq6
	d6PZAc3zkmJoGcHrGtACqT/6ekx6+1I20q2X5vYLH5kG6gS1KUbiBj/MwJA2hBalD/9jv0JWHiZLf
	DQ9jR4cvY8kGMI27GjbvtnGnpwazuAwQlogaksgIgO7aoGczrszvJjhQDXYBVn0wihSsppj8OIR0s
	ESq0SGVslqhow1y79QGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyr20-0054sb-0P;
	Tue, 16 May 2023 09:31:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyr1x-0054rR-1L
	for linux-amlogic@lists.infradead.org;
	Tue, 16 May 2023 09:31:42 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9659443fb56so2177348466b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 16 May 2023 02:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684229500; x=1686821500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nihm3Do/jYZpk5hTKjhQtOwCyKKzOg7ffIDGvfFkZDY=;
        b=E2OQ4sV77vnvS3oG+lICbJM8PRrM0Is0aTrjTci7hnYWEF03LsA5F3vzNIkclaoSoF
         uDpC1BvLXFrx6JJvnNO/wuUExwsdcxdGyGdwAhfH8KvAkMenO+qGftPHZsbuDM0y0Qmj
         rMMkDbQ+buTOrmNHEraj4COZs1ZOCm30l59N4HAZ+fHC8ymVp5T6a/kQWZZwKFRkqcm/
         +exwEJf+5Zb1lqYVmH5SiP3A5PKeN1lwvxBk+TIZqjeR9hio957ljYRWCZPutYVsK0a1
         SeWa7/PfZnJhqFvSCpg2KfZa992P9QzcD4XqHUQ1/D6w1Jg7L43zuTf21eBYXYgE3f35
         B8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684229500; x=1686821500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nihm3Do/jYZpk5hTKjhQtOwCyKKzOg7ffIDGvfFkZDY=;
        b=OhVQv7QPTJhzQUF3xihQYd9xc+hAiuR0Xq4gAHrD2MYJrzS4kxcRrTHXJn6hSF1BWp
         fcN1DWJMxRIpGpUOLDve3EHeEofg+/0KXEetigoebcGLWINCgxrkIvYZqTNsnDeYlIC9
         G2EVo4DS/UKywKZxEessJWcnJbgWv8pTE+kFKdjGHY6MAvMdyX657WYZWsaEhhYvPFSv
         zeDsdwnB5ubTV8v2Uhbg5mWSx330iKVJblF4jvhcPRhM+EIqeDRI7YabBll1LGAG0WqG
         XubP/amxPFsQFC4iGdabpEtdwK0vcsPdzv+qYJ5fcRHBP7FHDH7yql1a0wwVcsLZ1maV
         /34Q==
X-Gm-Message-State: AC+VfDzSBNwos+kn9iTshJjSbiHFz9dQBuxceNQKhxRZZd09HHUw+U1F
	7rfa/I7Ob7PNkE2bUVlE1uO7ag==
X-Google-Smtp-Source: ACHHUZ5S7lHC9GBB63RVot5UzBveUyGBIm2S66/kFGOsCzwp9dmxU9oMaB3+0GcTywB8/5fNKb3Bcg==
X-Received: by 2002:a17:907:2d91:b0:969:f3b4:83 with SMTP id gt17-20020a1709072d9100b00969f3b40083mr22191059ejc.71.1684229499757;
        Tue, 16 May 2023 02:31:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id d21-20020a170906c21500b00965fdb90801sm10804120ejz.153.2023.05.16.02.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:31:39 -0700 (PDT)
Message-ID: <0aa96881-73ee-0aa5-efc7-7fa94248789d@linaro.org>
Date: Tue, 16 May 2023 11:31:38 +0200
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
 <c4d30304-08d8-6a31-8f91-7840fe2922fb@linaro.org>
 <bfc27a11-9be1-2391-3d26-62aa29fac190@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bfc27a11-9be1-2391-3d26-62aa29fac190@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_023141_460161_F0ED1A81 
X-CRM114-Status: GOOD (  11.76  )
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

On 16/05/2023 11:25, Yu Tu wrote:
> 
> 
> On 2023/5/16 17:20, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 16/05/2023 08:47, Yu Tu wrote:
>>> 1. Add S4 SoC PLL and Peripheral clock controller dt-bindings.
>>> 2. Add PLL and Peripheral clock controller driver for S4 SOC.
>>>
>>> Yu Tu (4):
>>>    dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
>>>    dt-bindings: clock: document Amlogic S4 SoC peripherals clock
>>>      controller
>>>    clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
>>>    clk: meson: s4: add support for Amlogic S4 SoC peripheral clock
>>>      controller
>>>
>>> V7 -> V8:
>>> 1. Change patch 0001/0002 dt-bindings title description, remove "meson".
>>> Suggested by Dmitry, Neil.
>>
>> So you only removed one word from title and description? This does not
>> justify dropping review tag.
> 
> Yes. I just remove one work.
> 
>>
>> You already got a comment for this - add the tag.
> 
> I wonder what I should do next?
> Add the tag and RESEND it again?

I cannot add other people tags, e.g. b4 ignores them.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
