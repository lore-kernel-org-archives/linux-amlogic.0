Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02727C77B7D
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 16:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjn0UgRA4XtAwwFpW8ONMaslI/uFJK01eOYttNtWnnE=; b=AHd0RMtZMIK6gv
	VcmQNewC2EYEzLwTpqP3zzLVjA9fr48BengH59daF5prPKbtIfUIuvRbEvsxuHTzzH0p9EK9U7Nao
	arKnN0i7nDSO4xdN62LEJhELXtvvjJUPDHIJ3efnBLDTNZVfReu+J8nrngGGqMgt5HXGiNI+G2QeE
	s+XJfQh8K+6rjQ2IOaGg4oMP1BL4FhPERSwxq4hzBGnBTLL+OfyfJGvSSFrrrtg6uekEB6Cezj1LZ
	XAIqFfqhsBiRtLVlzUG7kyvKXEutkym1OKA3+lCTIsDgqNlZ2QtGuF0QkNACDfpZaGmvTXnthBnGX
	0ws+l3qAQ7jKlregih8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyarJ-002iVg-09;
	Mon, 15 May 2023 16:15:37 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyarF-002iUD-2r
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 16:15:35 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so113264387a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684167332; x=1686759332;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJS5D1vfgi4TTcjlnoJnfi8uWYCbp5zquITsCVwXKkg=;
        b=UUG1XXdqlD4uioi6zJCtsLUgjDOrepIXs7cNIP2OrvwpYp8EAF7MLpWDbTrOItVSff
         4ga8S9Cz7Z0R7u3C4HtPHVrr9VVzku5Q6YXnHYRRFVNMXRtSn5EvJKyLz0I2BUMSRW5f
         HUZvDG/bFvJGnKx4NSHkSbRgFFMRhJ8eFaSWjq60f5QgC7UC45gYrZgTWzcbqqQDAizY
         6otU9tEmOimhM8omtjqzsgblNTccZo7xHs27d+5rSJpbq3FRvPL2bYVZUGwmFSJMot25
         6hBEr+hboWjUCKeLYk5rfALpu2HFiuQ4UiIdn/Nib17Qkc97vvCvOa3FUjRchdN8OVCW
         PFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684167332; x=1686759332;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJS5D1vfgi4TTcjlnoJnfi8uWYCbp5zquITsCVwXKkg=;
        b=djJjM4t9RMjiKZjQ1nv++Mt4eFgq0SCfR39Ipa6K7TZlIr78sl9pwnKGGoSe+KKbQX
         f/NBriknLi9CJWJNqph0cOe8V29NGGxLv7J0L1UhjHS3F8T+ABhfAdv2M8hlZDEBZG2V
         Geoh1ZdwNlkHTnJUFmHo5nqRARC2P3WUGdYtZyA23sCQtTmLf8r+qyDLza2BmmCsIA8J
         fU8ocbieJUrXOTI5yyg0quKI1Tv98tpSva34niyPW2/XzNaZkVym7l1adL5J+lDhMwsJ
         byZYMUBqHW32+XIXrQPIla8LOHt6J2Yx0g7hTiEFv5xL67FnYVLdVATZ8tRpZ8FV/CUt
         xKlw==
X-Gm-Message-State: AC+VfDwvLhlWCCbP93rRHUT988LCf7d485jcdTbrC6+gaioESBJBeKNL
	vMTNML3ypq2qaPa6B6980hYGSQ==
X-Google-Smtp-Source: ACHHUZ4LvlP9DFb1havihsTe2GP8UdnxD25y3X6vt/zSG426igeLG5X2pfGZzbDWqmdBnqcy0NaQzA==
X-Received: by 2002:a17:907:6da5:b0:94a:6229:8fc1 with SMTP id sb37-20020a1709076da500b0094a62298fc1mr31799999ejc.31.1684167332604;
        Mon, 15 May 2023 09:15:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id jl4-20020a17090775c400b009658475919csm9807639ejc.188.2023.05.15.09.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:15:32 -0700 (PDT)
Message-ID: <6228670c-3e06-3061-f304-a2c641962ffa@linaro.org>
Date: Mon, 15 May 2023 18:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: neil.armstrong@linaro.org, Jerome Brunet <jbrunet@baylibre.com>,
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
In-Reply-To: <d5c030f9-2f4d-25cc-b922-d00f5033ac37@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_091533_966983_D0E06C49 
X-CRM114-Status: GOOD (  16.59  )
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

On 15/05/2023 18:13, Krzysztof Kozlowski wrote:
> On 15/05/2023 18:06, Neil Armstrong wrote:
>> On 13/05/2023 20:28, Krzysztof Kozlowski wrote:
>>> On 12/05/2023 15:11, Neil Armstrong wrote:
>>>> Expose VCLK2_SEL clock id and add new ids for the CTS_ENCL and CTS_ENCL_SEL
>>>> clocks on G12A compatible SoCs.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   drivers/clk/meson/g12a.h              | 1 -
>>>>   include/dt-bindings/clock/g12a-clkc.h | 3 +++
>>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> Bindings must be a separate patch from the driver changes. If this
>>> causes bisectability issues, this means entire solution breaks ABI and
>>> is not appropriate anyway...
>>
>> This is basically how we handled CLK IDs on Amlogic clk bindings for the
>> last years, the amount of changes is very low and rather exceptional
>> compared to early development stage.
> 
> The commits with bindings are used in devicetree-rebasing repo, so we
> want them to be separate.
> 
> Meson is the only or almost the only platform making such changes. I
> don't get why, because the conflict could be easily avoided with using
> different names for defines in bindings and local clock. Approach of
> having bindings strictly tied with driver commit is never desired.

Also one more argument maybe not relevant here but for other cases -
this makes literally impossible to include the clock ID in DTS in the
same kernel revision, because you must not merge driver branch to DTS
branch. SoC folks were complaining about this many times.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
