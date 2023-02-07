Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A93EC636CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjcJwMwk/o9urygwt4TGatjK4voQFqfRGQ4eYvA45A8=; b=oR21mQQ4L+ml4f
	+gvoF/W/E1LNU7Znt5kp4J+L4Pg/Puy4kH/jq0NqgmLgNQJZrJ5QyWV5VNDv2YOmxjldt2dN/xNCQ
	TZgOvj4ixGLIOxs2f8IPNWIemTSRoVorF2/RkFpfknxeMwMrWdMU//jeotTYmcBKoTxi1ZzrvA85i
	pWqqdvpMH87Q36AsCrKUR7Aa1Yu2xybBNs7b7cc9iJSAB7Bb2145K8ff1UOJMxwCDAWJuhZaoRrsV
	l0T2+D6NfnfMAjmFRnLVXwJ9OBV2FKJq9EoEwk6QgkojLGgiObO69QcEkHYOiSccuK2HMbPnjRTfA
	Oq2reDbSgwahPuiqOPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPN7J-00C6Fo-OB; Tue, 07 Feb 2023 12:30:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPN7G-00C6ER-WA
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 12:30:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h16so13360002wrz.12
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 04:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uo8Ualo99d53mmVi49FY+l820ilSRXIZGdKs4k2O74k=;
        b=lD9EZ7RPG6IizC5UEkDoAl2VLeg5YjRQJ9YuKzsS3PDhjFqSwmEkcfqb42JvX1M6PO
         jPwtqoYOWqmM8JxVJeAoMdRkwyLbWEWCf8iYoetSVVUw016uSm8r2XFY05mJ72meJu4b
         KLAaRI0zu3/9Slfx96CHzXB5AYW4gdj64B1X21R3beCnHSIQUsQfLV7RJB0IDWNv6wDz
         gJe+jj4fgugWXWjR5iOZMGNBsM2KDOLHH6cvvJuNQMmfcNmw1RFam2SYz8uCgWjP84Bk
         vsXdFu4q9yz6zrJ0t0507194GRN7eVBQr09dQLvVkrO0gaI53cfYu8ltm+OkSQMFA3Wc
         4PdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uo8Ualo99d53mmVi49FY+l820ilSRXIZGdKs4k2O74k=;
        b=CM0rACWIFzy2n9/zj9AkWW+JzL1klB0wpb0qOAk0tHvcnmMiOjwcj6Wgl5d67OUlxt
         XMfTTYLG3f7em9ZNucm1RXDN88FlzPy0gYvYPDAmHGhSKXo9Tm0pY5en+LEM6hrYMsAR
         e6p5C1zgTUvxRrGS0+4phq1vuP7WJ5sk/k3k1ofCDyMsYYswXNAke/t7N0tDfltK8+BF
         l06lYtMcY9hdSe8DHgrF1NhtuGvq/W9lELvR5mtcN+KKITAUwgXUTdIxzndNVyqtHyiB
         neisjQTSyH65m0UC7nA3UxusARF9ziSxyvznJ1xDWFKTv9mDBSz7envi538kZTOnLrZ7
         vXDQ==
X-Gm-Message-State: AO0yUKUU06ChJW2k0w2uM/2QlGo2sf4fgTssIx0/Zsirb/n2WNA7GPMH
	8aLu9bM/gszyPcVyVMphr1JH8Q==
X-Google-Smtp-Source: AK7set/FHB9i8kE1subd+a6lk2/Py5IpC82cHNa3nwC0OUd/lRxJYlOvxC7g0sC/El2fSuhrlQBR6A==
X-Received: by 2002:adf:f6c6:0:b0:2bf:b571:1f18 with SMTP id y6-20020adff6c6000000b002bfb5711f18mr3028904wrp.61.1675773027151;
        Tue, 07 Feb 2023 04:30:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k10-20020a5d6e8a000000b002bdda9856b5sm11214256wrz.50.2023.02.07.04.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 04:30:26 -0800 (PST)
Message-ID: <6804adf4-2fba-e4f9-36ef-a6b8bacae76d@linaro.org>
Date: Tue, 7 Feb 2023 13:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-8-jbrunet@baylibre.com>
 <a711905e-dbfb-4258-62be-250a9549a9c4@linaro.org>
 <1jbkm53jvg.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jbkm53jvg.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_043031_086338_F0ADCB1F 
X-CRM114-Status: GOOD (  11.10  )
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

On 07/02/2023 10:25, Jerome Brunet wrote:
> 
> On Mon 06 Feb 2023 at 20:21, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>>> +
>>> +  audio-routing:
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>> +    description: |
>>
>> You still have everywhere | which should be removed. Here and in almost
>> every other description when no special formatting is needed.
> 
> I'm sorry if I misunderstood your comment. I thought the problem was
> with the '-' of '|-', which I removed here.
> 
> Should I use '>' for the YAML multiline format instead ?

I asked to remove "|-". Don't add any other character - why do you need
it? Multiline descriptions don't need block scalar headers unless you
want to preserve some format.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
