Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DA3C05027
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 20:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7H4/KcL2PNDIL/y7uNkTEN9iMIrxwBqOOk/8ircR/Ic=; b=Xdm+oo73deXZ14
	8LY3Ym8QAEadp0hPIqFqM7Qxcjc38AoLCer0OtMXqAfhrmJBmoKkgwts3LXWGKC9G5V83MdHJXQQd
	czKQ8qyj/qhAyviSLWq40M4qxuQ47EJKZSnx/BRqHce2aHZp8l3siRpkH869D3khs5t3GYoazCa6f
	SzXjmpcTGI4XDP+Ix4RTTVJlLg/0sBeBwoBUNFYVobL2JcgzKb/d26YtH/5oEnhkbGCcSMznRqZz0
	ZrVUlSpbsFD90OirpeaXWcoM087l3h9TeBkZ9TBooJITo+I6UlaM4CLMN+56l7xFrtGqdI65H5j0f
	Y4+RLmJP8m8KNd9wa4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO2Yz-003UBM-V5; Fri, 03 Feb 2023 20:21:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO2Yw-003UAm-Rr
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 20:21:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso6835296wms.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 12:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5sLjr7aYK315tj89Xz8yTzw8nhiBSznb+bT5o725x0=;
        b=HLoFOX9M38kF2qyUXFQwXqSnMduKtNxMFBrU5CvSYknJxcduZ84ZUxf/VVFfkk+dwR
         /WLjnjiBsb1y6V6GqLtfXH8j5KJDNyoWTaR76slT+yDk3LZqAJB1XDDj/ITC4vfTaEDc
         qFfA1b2qa/H9ba7GlMKHQAetHgjPTM8d4A5x2BWt0AEtogp1MPI5kISnP7fI+Rk6HQNR
         h71USPCrKliJYX5PoXeGf3p8mOTdD+tGnDRL5uvNeBQpeuYIDUzK7vnKZM0nDi3JChGc
         rML/UuG3wp30vrDrWJF1gFFn9XzjnHdc5MkgTBcQ5cZL/ZP8JUtO3UVYFG8JILgMYRMf
         2gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5sLjr7aYK315tj89Xz8yTzw8nhiBSznb+bT5o725x0=;
        b=fHjXsCqP7NLF5UYZMYY024tijvQ2c3SFGCASdp18m4Kvw0cu/bX3Px0k1u69boSyOi
         1lgq2+Q3RBrHPCh7OWi0Zc8Tgf9GBaH8xhRmhfbT93wDhidubMgw827FhRW+DNhaxUt4
         DVN6MrGKcc/haWN6UMirn3n1pFdmvAc8OOiCbV6kdlATVhuh8pllJ2R/z5atAvSjJfRp
         07sIH6XBl9ak2VvlvVy87NJA8ycla52Jq2xblmtXjBpWF3QGv7IKO87RUUMV179+MgxX
         I9cjRcW4Ti+H9w3OJyZkleNRDiEZLnAkjf85FPM/GKJegAeeB2WXCcHAmHpynolwwyL+
         9X8Q==
X-Gm-Message-State: AO0yUKX2g/niO/awZHLNN5NXCwBx/dAd+KdSqwzrlsumIBB0dQs6qFAG
	cClmmuIPXDtIB1cZT7tEyqbTdA==
X-Google-Smtp-Source: AK7set8Gpfp/Oz+hFP5DrhCusCPg/cotAzMpidE7HBO1Avb+cX25jy40Vo3VZeQupr3Q20OM5Hxk4g==
X-Received: by 2002:a05:600c:444f:b0:3da:c07:c5fe with SMTP id v15-20020a05600c444f00b003da0c07c5femr10596494wmn.5.1675455692569;
        Fri, 03 Feb 2023 12:21:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c310a00b003de77597f16sm3803784wmo.21.2023.02.03.12.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 12:21:32 -0800 (PST)
Message-ID: <f9d9bbfc-507d-2092-6ae8-f80ab3d23bd1@linaro.org>
Date: Fri, 3 Feb 2023 21:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
 <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
 <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
 <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
 <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_122134_970144_7B3DC40D 
X-CRM114-Status: GOOD (  12.50  )
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

On 03/02/2023 20:34, Jerome Brunet wrote:
> 
> On Fri 03 Feb 2023 at 18:59, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 03/02/2023 15:13, Jerome Brunet wrote:
>>>>> +          Multiplication factor between the frame rate and master clock
>>>>> +          rate
>>>>> +
>>>>> +      sound-dai:
>>>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>
>>>> Old binding was saying it is just phandle
>>>
>>> It is just a phandle but the bindings used to have problem with phandle
>>> that had cells.
>>>
>>> See:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml?h=v6.2-rc6&id=d031d99b02eaf7363c33f5b27b38086cc8104082
>>>
>>> Was it wrong or did the situation change since then ?
>>
>> Then define it as having cells:
>>
>> https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42
>>
> 
> The card is provided with the phandle.
> Whether or not the phandle has cells or not has nothing do with card
> driver. The card just consums sound-dai. I don't understand this comment.

You said this is only a phandle. Then you have just two options - either
this is one phandle without arguments (then change it as I asked
originally) or this is one phandle with arguments (then change it to
define the arguments like in example I gave you).

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
