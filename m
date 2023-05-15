Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FED3C7EE23
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 17:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iW1HqtLExM89UzC8IPvhDh6V4e/QHhqULe5Q46k19Jg=; b=Oc7PfTYFdUqdRwwQ6tPlF5pt4t
	esysLj9BqFFf9KPIZNuatmCgIgpeG4sCQVlyWop5UcNNIzqQ5qLbG7rj3tPdSYHsXJYVi8ikFxZ5+
	yW8Wp9xBXqte3h1+lQn6rYKFQJSPVWaprLAfXiZAUvwk7aFgILRP5KrkteJni4Gw0yARkRh7MUpMw
	q1GWV/Li1QHmtL10lM9skG7x/0+Bop3/9DNEeWU+FrjmEaULG+f3prXHZYp9OaBsBsDun/iRpijUJ
	+7Xc+8bW3J22rdtKrPCP+vbY58psmP5j7uer2B9WvLjb9m6ez0OyLMHJ5am3LF7v9ya8vv8oc8jin
	UDDGfdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyc1a-002wuq-16;
	Mon, 15 May 2023 17:30:18 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyayR-002jwU-0b
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 16:23:00 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f423ac6e2dso63854385e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 09:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684167774; x=1686759774;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L/BFaR2bXmYV85aZ3VRwxHXRXyNTTuSJM62QQ7kJk14=;
        b=XobnY8dEDD5WdDsk8tbcbCChwsRbJjuhaQcAVTQG6QA4fd8oGxrcXKJ1AgPzDHF4YF
         iuFoC+kO9NnOf4NjasgKbvGzdkx3vkK8Vq3z5lpynoTjyuR6lI9Wlh5JrwXm9ki5bFUa
         lvU4eBabnuZjU1+dgRWwwJuO54dZGOF5z31g2iCiTDMwzccWs0cGGRjNZR1rGlMg57za
         fAt81vYy5OUbGayVg5t4ljnYrTMa20FH+fdAh7okT3u+OZP+B5LNYEG5nyGV/U915VHL
         ILtJEcIOXMFzppP2iokbEhnB+qHCcr8HCYzYwbQ5eoCcBoJTw1ZMppByQhzC10RLlXj2
         aVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684167774; x=1686759774;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/BFaR2bXmYV85aZ3VRwxHXRXyNTTuSJM62QQ7kJk14=;
        b=bFQyyj+WqaY2cIIGq1r30qeLZMxa4nVqxoSdcUrWC/51B/mTC7Z4bwTfqCXrK4+udG
         NHADs+7gH9qLDrugOKMSn2f9y2lOxJ9rEm2DgfZREeyZAz86t0HVQu+YwPOhwcrFTGvF
         KeOroV9KsrlhDhui9LgN1lSnu8/MDGRjKQUPyX6QO47WTgKQ7cAg2nBeDjcSuA0zrO+K
         BPgMttlhgU6fqD1M2bCWnK6CbGM2pkLewANtZB6BO7Fb1jR0gVcH2dBZTrdaSBB5AXVu
         MfpodCA7XljPud3cf41gH/IbU9UKYZYrhKnhP2lmDF2ipX2BSrUHthvwfJu3KoEMpsEs
         RM2A==
X-Gm-Message-State: AC+VfDwWTWrNfQ70je9IdEO5rHtbl4dzA46QU6k2dPlBW5e1sm26ZBrC
	Xz4ObCr30BU5ugNNDb+67KhOlw==
X-Google-Smtp-Source: ACHHUZ45LY914ONoEcieAp+9ip6x5dmqMig4lZWDIrIooklY3Q93vho3dB48zUvDlbhW6BuZmPpLZw==
X-Received: by 2002:a05:6000:1b8f:b0:306:2b31:5935 with SMTP id r15-20020a0560001b8f00b003062b315935mr19815654wru.55.1684167773728;
        Mon, 15 May 2023 09:22:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ee7:a396:6195:bb56? ([2a01:e0a:982:cbb0:ee7:a396:6195:bb56])
        by smtp.gmail.com with ESMTPSA id u19-20020a7bc053000000b003f09d7b6e20sm37425314wmc.2.2023.05.15.09.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:22:53 -0700 (PDT)
Message-ID: <9cba6384-123b-1cd1-ed02-08365a0ed529@linaro.org>
Date: Mon, 15 May 2023 18:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
 <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
 <9fa0662e-8854-05f9-da7f-ec8e08d2badf@linaro.org>
 <d5c030f9-2f4d-25cc-b922-d00f5033ac37@linaro.org>
 <6228670c-3e06-3061-f304-a2c641962ffa@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <6228670c-3e06-3061-f304-a2c641962ffa@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_092259_224078_E2A3CDE2 
X-CRM114-Status: GOOD (  18.56  )
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

On 15/05/2023 18:15, Krzysztof Kozlowski wrote:
> On 15/05/2023 18:13, Krzysztof Kozlowski wrote:
>> On 15/05/2023 18:06, Neil Armstrong wrote:
>>> On 13/05/2023 20:28, Krzysztof Kozlowski wrote:
>>>> On 12/05/2023 15:11, Neil Armstrong wrote:
>>>>> Expose VCLK2_SEL clock id and add new ids for the CTS_ENCL and CTS_ENCL_SEL
>>>>> clocks on G12A compatible SoCs.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>    drivers/clk/meson/g12a.h              | 1 -
>>>>>    include/dt-bindings/clock/g12a-clkc.h | 3 +++
>>>>>    2 files changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> Bindings must be a separate patch from the driver changes. If this
>>>> causes bisectability issues, this means entire solution breaks ABI and
>>>> is not appropriate anyway...
>>>
>>> This is basically how we handled CLK IDs on Amlogic clk bindings for the
>>> last years, the amount of changes is very low and rather exceptional
>>> compared to early development stage.
>>
>> The commits with bindings are used in devicetree-rebasing repo, so we
>> want them to be separate.

A lot of commits changes the bindings and other part of the kernel source,
it was solved with git filter-repo a long time ago.
While I understand in an ideal world those commits should only touch
Documentation/bindings, it's sometime not possible.

>>
>> Meson is the only or almost the only platform making such changes. I
>> don't get why, because the conflict could be easily avoided with using
>> different names for defines in bindings and local clock. Approach of
>> having bindings strictly tied with driver commit is never desired.

If we did it now, we would have make it differently and expose all the clock
IDs on the bindings like on Qcom, be sure of that.

> 
> Also one more argument maybe not relevant here but for other cases -
> this makes literally impossible to include the clock ID in DTS in the
> same kernel revision, because you must not merge driver branch to DTS
> branch. SoC folks were complaining about this many times.

Actually we handle this very simply by having such patches merged in a immutable
branch merged in the clock and DT pull-requests, it worked perfectly so far
and neither Stephen or Arnd complained about that.

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
