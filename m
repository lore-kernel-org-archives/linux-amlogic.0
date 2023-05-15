Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5939C77B7D
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9cgSVCAKfYXHAFqLpcjV6kR8xMc6BN2EIGYZJ6uf5Q=; b=wgfyaMByAtyYzw
	FjvaUEXiRS3CfQs3ifnV4DM/MURVfCeJP2GiP9MDWqE4KZGMpNOks57z6IzV8xRlUlGmSEwVFDWiZ
	9sBbx7o8fUSuhqxeV+OP8a6/EGZJtKbD4fsVON4O5jZsak+C2VQ5orTbewq5L3rak8P25daUGTHga
	+JaF2PzMs1dmsog7BIPnzblrbV4vM9ESYxdqVm+x88/D/LbOd4AS0gakDog2a1k4kRk/KL/5Wf0LO
	R4zeWAju2SsQi11t5CJoZ6mysgDgDgggJME6ge51fqwYv1YgHnAMXB742h0nRWpbu6MhOurM/K4Jd
	Pk1o8UlU8ID81Ok6JZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyb7h-002lq6-1i;
	Mon, 15 May 2023 16:32:33 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyb7e-002lm7-2b
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 16:32:32 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9661047f8b8so2003823066b.0
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 09:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684168347; x=1686760347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3v/Wb7rBhzrVb0azi8VEofeBQJDbLwQtTKKw6U3ZDgU=;
        b=IQsT47xSa6tWwtSS4bpFB6i7IlU4UCWjoB2VM6EVgVr5RwUXSq3USycHcD4tbK/vCl
         XKFNwbFQf/jruqOo/rvlMLjUuPCZycBQeUffWIkGgw5dBLDgAwgJsfn9sB2c1gpt/MWb
         ZimOxt+//pU5CUmXwdB6oaX701pD1/lBK9C8i44PPeQrgsn9OEHGJWH/NYbcHEPFyLA7
         Bsl/ZYBWcDioxjk2hHAzwoKjTcchrRCwPZ+4MkGwJt8hwBqHRsFf9J56AHJFmzCUvieH
         SSmmFu0lLW2Mx6PmN0R2RGRyKeGfRuZzS/ydIrOHo83gK/ShptAv3j5ZJAky00BooIMT
         CZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684168347; x=1686760347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3v/Wb7rBhzrVb0azi8VEofeBQJDbLwQtTKKw6U3ZDgU=;
        b=RP63+k4GeK5EqTPD7UxwgDCUEm7UpR6lsBYx1mwRrapsWVAxCKQxxowgDiWpktToGm
         NfvfCawEsMVavikACT655vuTPEcaoztISOo4YLXNTl1wFSg8IPkpT2rzGMwwkLKSjdxh
         sScCKyyOslF7ZkVO2y3MXDZJ6wSVMSYKn9HwiNv4rz+MZHRYpVcaI5ddAfCWRjsRu5zk
         LDswq8G/ih6nW6pOw6hZrZ4rv7ad77j6DIwStbQm0yIu5rm2gRvR5pLmFBhKNLVyN7oT
         pxsOwB1SVce83xpP+3dMJ70Sx0ESH498oq+jk5KQE0CUPJM7eESRSbqKJ/4sSywQNo8Z
         1o5Q==
X-Gm-Message-State: AC+VfDw9KOG4szqpbp1TNO4QhClORoe2+9mz2ou23SBRqMJSGE22vEdk
	ATX5BuPttTfXHsCJ5dCGUshZiA==
X-Google-Smtp-Source: ACHHUZ6gTLs+3cm2BhuQPDtT2O40r+PYINlcdVU5ENN0zj7TYzrHOXrFQdEsXBWgivvJve1UghmM7A==
X-Received: by 2002:a17:907:7fa8:b0:96a:9b5b:5d80 with SMTP id qk40-20020a1709077fa800b0096a9b5b5d80mr11887393ejc.13.1684168346707;
        Mon, 15 May 2023 09:32:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id s25-20020a170906285900b0096a5d341b50sm6679818ejc.111.2023.05.15.09.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:32:26 -0700 (PDT)
Message-ID: <17bfc33b-029f-a0f1-564d-e8c8d0a8695c@linaro.org>
Date: Mon, 15 May 2023 18:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
To: neil.armstrong@linaro.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
 <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
 <9fa0662e-8854-05f9-da7f-ec8e08d2badf@linaro.org>
 <d5c030f9-2f4d-25cc-b922-d00f5033ac37@linaro.org>
 <6228670c-3e06-3061-f304-a2c641962ffa@linaro.org>
 <9cba6384-123b-1cd1-ed02-08365a0ed529@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9cba6384-123b-1cd1-ed02-08365a0ed529@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_093230_852757_746A5BDE 
X-CRM114-Status: GOOD (  14.77  )
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

On 15/05/2023 18:22, neil.armstrong@linaro.org wrote:
>>> Meson is the only or almost the only platform making such changes. I
>>> don't get why, because the conflict could be easily avoided with using
>>> different names for defines in bindings and local clock. Approach of
>>> having bindings strictly tied with driver commit is never desired.
> 
> If we did it now, we would have make it differently and expose all the clock
> IDs on the bindings like on Qcom, be sure of that.

No, you just keep different names. The only problem here is that your
clock name is the same thus you cannot split bindings into separate patch.

> 
>>
>> Also one more argument maybe not relevant here but for other cases -
>> this makes literally impossible to include the clock ID in DTS in the
>> same kernel revision, because you must not merge driver branch to DTS
>> branch. SoC folks were complaining about this many times.
> 
> Actually we handle this very simply by having such patches merged in a immutable
> branch merged in the clock and DT pull-requests, it worked perfectly so far
> and neither Stephen or Arnd complained about that.

Arnd, Olof,

Any changes in the policies? Do you allow now driver branches (with
driver code) to be merged into DT branch?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
