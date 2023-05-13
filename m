Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33C5C77B7A
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 May 2023 18:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAuJuZgeufpOozJYXW0m0e0+VbnGZo/hOZYjqxvMBVw=; b=EMuYD5y2JDdkOY
	lzg4pt1Nukvj9VPxuwyHtHYe6jE4lGitX2jckk5ms1+EVykEOxsp8wbmWb7mkTxaqENyrjp6KL477
	WqwZqbMATbsaxQbdtp+ucIfYlJOiu5QJLikwhdoJ4Bd2JG74Fl6OfursoEh+v607GocKXl31Rj/DA
	gL4bHbU0oludB0vZplbfWlodvu+1XsskEzKS6exx6M3NsFxFA7E+EtuYKP5/pL/Qa88GRk53kVK2w
	3vmP6n9MzzFN2EQXLEBJodSYfs9SFr9BXiUNnDcIAsWqLIyD9d6wtQYb/MOZ48YVELC1RWYxdBo6O
	SrqbZCQOS7gTjK6MYoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtyr-00FZqj-0b;
	Sat, 13 May 2023 18:28:33 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtyn-00FZp2-1Z
	for linux-amlogic@lists.infradead.org;
	Sat, 13 May 2023 18:28:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so99296872a12.0
        for <linux-amlogic@lists.infradead.org>; Sat, 13 May 2023 11:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684002506; x=1686594506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/skyL1sLWdeVWQOTLH4B/eNUzzrc9hV+v4n2aX70iXk=;
        b=G0WSmFIDrbVpJnxA9vpq/+boMjF9sbPpuRcq/wRTF+rvSiPClVefSbA/Jm14QEe6PX
         BXt+NA2Bbavm3P/r6lUp+m42FltmWO2O2Eo+W9Y2YjVaObvHtfcVQeKMGEkhMIP1EvHr
         RxYaVGxah6XG4y7V8ffKGPej4l7rM/TxK2jSHEWLR6AIplNAhqjjLptXJAfQnbBd6ooD
         dk71FI55LsAlOFey7nU7iP4DPulUDmZiLTi9pfMSkcXAZ4VYcABlBQM1RiXRIfEy0JJN
         snHoVzbzI6sxKlgJO4SlWsiBWaJXpjiaSjNi02viIIhOjY7O9QniU+IXRz7CDIAVh2c1
         n5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684002506; x=1686594506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/skyL1sLWdeVWQOTLH4B/eNUzzrc9hV+v4n2aX70iXk=;
        b=PSRVM/430vyIxjFOuwieH0939q6UZiHJebPt9JjzlN+ZlrOqlZFNrbxOtC7cEbdHus
         wlL52zEdelbtx3v+pFHiygwBsjT8NSnezNg4QCfSO+kcFS+DH1HrUgcnxSC1Q78/CNMu
         yun+QhS6g5Gqc36kym3icAVUQZoCnNL58nwB2hGRbtxrFVsIP2P/NEzumAs4v60oGm2H
         l+cH7ER3FzaDPmqS8EG2lmeq6NORPi1b8i96OpLSPlM2hPbx9f29qZsUAcJRyx7YxSdY
         Zfvjf6RadjT3kn5//OJlu1hfNLyR8cJUqkzC2n0a0KJwI6usj65eIxU/ueA5mBANdcEI
         heWQ==
X-Gm-Message-State: AC+VfDwc454JdUDScTeqZiSXNZ6iZZJSH7BjX6aJ5umZ0u4xa6fF5aBa
	8XHLAwlJUKWHefnbIH9YwpMWknGxDVAJFig5+ngN/g==
X-Google-Smtp-Source: ACHHUZ6BZjAGfoNRaV4SZYpzLVlE5wxvvxIlWnwclnXWyUvW+KjYeL4jTHPXBIuhzNmNzRxBc6Fsmw==
X-Received: by 2002:a17:907:1c8c:b0:965:cac1:53ad with SMTP id nb12-20020a1709071c8c00b00965cac153admr28615039ejc.8.1684002506136;
        Sat, 13 May 2023 11:28:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4? ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id de9-20020a1709069bc900b0094e6a9c1d24sm7172177ejc.12.2023.05.13.11.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 11:28:25 -0700 (PDT)
Message-ID: <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
Date: Sat, 13 May 2023 20:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_112829_524721_7D209A31 
X-CRM114-Status: GOOD (  10.33  )
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

On 12/05/2023 15:11, Neil Armstrong wrote:
> Expose VCLK2_SEL clock id and add new ids for the CTS_ENCL and CTS_ENCL_SEL
> clocks on G12A compatible SoCs.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/g12a.h              | 1 -
>  include/dt-bindings/clock/g12a-clkc.h | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)

Bindings must be a separate patch from the driver changes. If this
causes bisectability issues, this means entire solution breaks ABI and
is not appropriate anyway...

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
