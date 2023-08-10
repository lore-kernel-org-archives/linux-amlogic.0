Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFF2C04A94
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Aug 2023 06:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phWtbnsb2knw3sAKTrt/pIddD+UHepLiuu0TUPirNcA=; b=wO4cB6WNsDWF3+
	venLALcYYOVcx6bCbvGUyeZOK/Xw9STu+YpG8krafMynZ2jETNg/mgjFkT0jSnbyH22UdLjgWBAWv
	nd41Wee0OPnRy9aXV4uotf0xV+rlyyrADu8C4Vc6vLo8JpUUO5+85sEb3/5Ld2b5R7C+UdL7+hwfw
	iiynJ6ufN7C40QwJk/Dm0SzSaxr4kL8BIcWObeYykuBtpQ0SmHe4BroM0DJac0xKutQ3rjTSWJptI
	39PNIBtFKnU0pYvjjkuOpU7UqwzukDr6oRQBLMFJIQrHdWRpZOa0AB4zn7tYayxQYJcjAWS3+M96R
	OGQR6ny4vgL/SwgY9LsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyu0-006dsV-0D;
	Thu, 10 Aug 2023 06:12:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTytw-006drp-2O
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Aug 2023 06:12:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31759e6a4a1so485634f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Aug 2023 23:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691647914; x=1692252714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N48Tz5uXzvaHN9/qN3JfX8I4/w7VgPsbV3qQP+qe1tQ=;
        b=NiaZ9rdNmufbECzZZ87B+yprLA3NRl/R2PzxygOJHcFGcy2WzIj3IcU4zInyho5e0/
         c854lCFAyfPNxCY0Kt5FZOaF5CygOipP27pHXY3POE5Rm1jg3DB0Bqi7I/qk4L5DGk0r
         QU/3x7skzZ4VIhjfIyqoLo+doKDiCpB9RlVfMj/pdUNerajvb6RuUoYpiThmHfBMiXtO
         Eva5Zktvomy1Y3u1V2miFUaFd9j4gIqSLHPm/2D7A9tToV3ioY2wJACouLNeVZ2DZ9gJ
         OjCSNhpc4rkqitywFihe7PizS9deLQVVoSO4A0oEdM4cU8Wb4KQx/zFCoVGYrqLn2BP4
         nfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691647914; x=1692252714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N48Tz5uXzvaHN9/qN3JfX8I4/w7VgPsbV3qQP+qe1tQ=;
        b=lgBHZ03cbx+2wrskHgWzlSjQiJ2lwn6zvl5ZNnMrbuo8shl6yExTBDhpZMVxK68kOl
         CLFlZTnzLQNGl7QJgUUj33c8lKWH0j734eaBWhLthyijYasZP+y+pkKOVUHsM9T1ACZ9
         LTNRtmz+iA4Whxr7kgi4kC1riM5AxnCfzwGsZ0FJL1Lvg2TWJLaGidpsIIkQXcoBBp7D
         ZA3flZD1YAUbXCKjjVxk3Ka9ZIyS3vgV55mOO8gZf5gBB0yV6M62iI66rsGTNui8GKE9
         EADn9ZmxFwiKRGUT7zlfrnQoUXfbQmmYgfR1yqob1lLPcuhBStkl5CUyCMOqxjc5e2Tt
         qhmA==
X-Gm-Message-State: AOJu0Yx9vXFhlsgfcA4GpAOaSHI3c2+FydZ/jPCZInWngdxHP6fDvjL0
	gn8yE8dFj9P0B/z5OSMw18128A==
X-Google-Smtp-Source: AGHT+IEBBWdm106nH7ySkZ0gAbbGmz1kcDFv16EgML6LFboSZyVkgvF7ZYZlHBKZKyVm845g2SGOUg==
X-Received: by 2002:a05:6000:12ce:b0:317:15f5:a1ca with SMTP id l14-20020a05600012ce00b0031715f5a1camr1282078wrx.10.1691647914293;
        Wed, 09 Aug 2023 23:11:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d6147000000b00317e77106dbsm967610wrt.48.2023.08.09.23.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 23:11:53 -0700 (PDT)
Message-ID: <5c852193-9298-af2e-2b7d-dbba29768fec@linaro.org>
Date: Thu, 10 Aug 2023 08:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
Content-Language: en-US
To: Alexander Stein <alexander.stein@mailbox.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org> <8294548.NyiUUSuA9g@kongar>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8294548.NyiUUSuA9g@kongar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_231204_786623_AAE7D535 
X-CRM114-Status: GOOD (  15.65  )
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

On 09/08/2023 20:44, Alexander Stein wrote:
> Hi,
> 
> Am Mittwoch, 9. August 2023, 15:02:23 CEST schrieb Krzysztof Kozlowski:
>> On 09/08/2023 08:58, Jerome Brunet wrote:
>>>>> +      required:
>>>>> +        - '#reset-cells'
>>>>
>>>> else:
>>>>   properties:
>>>>     '#reset-cells': false
>>>> ???
>>>>
>>>>
>>>> You need to constrain the clocks per variant. Probably names are also
>>>> specific to each one, so the list of names can be moved here and you
>>>> keep just min/maxItems in the top level property.
>>>>
>>>
>>> input clock names and constraints are the same for all 3 variants.
>>
>> Then why do you have this huge, apparently unnecessary, oneOf? If it's
>> the same, then drop the oneOf and make number of clocks fixed.
> 
> But as far as I understand the number of clocks is not fixed. As Jerome pointed 
> out in the other post, it can have any combination of clocks and range from 1 
> up to 11, where 'pclk' is always 1st clock.
> I currently have no idea how to constraint that, despite limiting the number 
> of clock-names.

The same as in all other clock controllers (was also present on my list
of useful patterns - Variable length arrays (per variant)):
https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
