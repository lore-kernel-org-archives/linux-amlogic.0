Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A26C77B75
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhXrGAgf3u/lgJ3UIossvdcMv7rOf5c9KiCBsAA53xc=; b=zXSenHBWZBHPCo
	N0Ea2J0GOb0c7jMewcq41yy0bIPdLbGVNhcGemKdA8E3Kf7ww9216LfK5AmWsgLI4FcgGlUuaRYGn
	LJ6NXtFk1tSkI2S3fPLgGTL+3kTNO9dKXTqlKaMTGloOOH4D51z7OFWkvMl6aQXf0vCVR1/Lq+4TQ
	rzgFLxquM+gQ1yf3SK25wLthwjHyNASvcEE/oNib6e29HSKxiHh9C7EfgyoI814I6nMGvsVvGLEDI
	SeyrHoME13LhRCTsY26P/+fW7xoRyZQS0aJznim+zExYrzj+ojWgCnWe1mQQDsF2v4i2YSDJ7kydK
	yQfdeP/1QxF5cGsq5Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyapM-002i6C-2f;
	Mon, 15 May 2023 16:13:36 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyapJ-002i3Z-1E
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 16:13:34 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso23730550a12.2
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684167209; x=1686759209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yt4YgbivgZUy6CAslsw+wadUPBQOwji2oiOofBvyIE=;
        b=tvs2Mv99cUuowVkw8JTeEyS/FlaWUvXfiycER2K09ffw24sZE99oSHdjDUylXJ69U2
         KNIiD/UHhj6g393JsIvEaj+9KgZ7Eeeny9e5wGJwJ1BELrLiU/1XbrZd2SDvj2GyGqo+
         f+JKfAYvK6mUQeV2Ylp2AbqIgisP74v15CsUqJx6inHF6uQQCbAK4K8tp+7fkwLf/kDB
         drJMnfDTsAbi5KudzxLBcM62VMdp08O4g2BYfdfoCHNfA68JKi+GTmI+0V0C8MmghyfB
         D/+Cadlj/0qPlOuhfTkCHjcnfxkSYIu0D+Z9sMrX4tlVFa/pKmphFbJI8oyGjzgH3T6C
         ThOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684167209; x=1686759209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yt4YgbivgZUy6CAslsw+wadUPBQOwji2oiOofBvyIE=;
        b=Qf+xB/6Fnj5i6hHo9JYKaKN+cNk0JWI/Yim4LKbRPmCklpYU92j6P0mVXfXsSh/dAe
         l/kvtye2adUzomEty0U+K/KoGXgJn7yLUPyw8zhYkfSWJcsdnFggbYfSAEK3EI0Ic7Vv
         c1kkE2u0wLn+yiROUOuaMucFY52wAol9nBLfaM23MMglBgBwS4EItOo5KbrT2YB1mly6
         aks1ssaZQSSMeszvdm/I4fyiCaxDZIK+m7m+hPczVKekLm16rVtGVUZdKkI9+yHEAoA8
         f6spd3wt/vxeP4hlU/A4K/0wWuJKyehliuDWUX2Nru2IrJJKp1mSHv5q3bFiQv9PwRUT
         Xrww==
X-Gm-Message-State: AC+VfDwhu1S2eXYtRb9zuF3TJSgqG/M19aqgEEJ049t3qnMyn8tVxrCN
	LLMoJXzNlP0F3tsB1N9RITx5fxs60YiwDzEJaVE=
X-Google-Smtp-Source: ACHHUZ6JMgRptdYRZnYUUXM44TYqSaYO8I3VL38YTcY8hYIY4ozSR1UzRxR5NBJBepvv5Q/oNsFiyw==
X-Received: by 2002:a17:906:7947:b0:94e:dd68:aba1 with SMTP id l7-20020a170906794700b0094edd68aba1mr31163585ejo.67.1684167208792;
        Mon, 15 May 2023 09:13:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id og51-20020a1709071df300b009662c57b4ffsm9775345ejc.96.2023.05.15.09.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:13:27 -0700 (PDT)
Message-ID: <d5c030f9-2f4d-25cc-b922-d00f5033ac37@linaro.org>
Date: Mon, 15 May 2023 18:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9fa0662e-8854-05f9-da7f-ec8e08d2badf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_091333_419075_E1B9018F 
X-CRM114-Status: GOOD (  13.14  )
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

On 15/05/2023 18:06, Neil Armstrong wrote:
> On 13/05/2023 20:28, Krzysztof Kozlowski wrote:
>> On 12/05/2023 15:11, Neil Armstrong wrote:
>>> Expose VCLK2_SEL clock id and add new ids for the CTS_ENCL and CTS_ENCL_SEL
>>> clocks on G12A compatible SoCs.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/clk/meson/g12a.h              | 1 -
>>>   include/dt-bindings/clock/g12a-clkc.h | 3 +++
>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> Bindings must be a separate patch from the driver changes. If this
>> causes bisectability issues, this means entire solution breaks ABI and
>> is not appropriate anyway...
> 
> This is basically how we handled CLK IDs on Amlogic clk bindings for the
> last years, the amount of changes is very low and rather exceptional
> compared to early development stage.

The commits with bindings are used in devicetree-rebasing repo, so we
want them to be separate.

Meson is the only or almost the only platform making such changes. I
don't get why, because the conflict could be easily avoided with using
different names for defines in bindings and local clock. Approach of
having bindings strictly tied with driver commit is never desired.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
