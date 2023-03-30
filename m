Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A6C761AF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Mar 2023 07:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yN00BGHlNua4jLg5kEF0ahtVVXDp2pAh9y9zVnor66s=; b=1DC7FWXBU7DrlAQaeucuF10n8/
	RuxGAFDi7cnzI/vaGBWk5VcPkePdgG/ahxOIlFjpldJDuo7vtRoDO656XVirh822PjvrFZedF9Yat
	6vo8sfF9mZiEr7VtrnfFeUDycCRRoCTI27l8FKxvZEa4FhRx953pwTIAIpFLlpCjMGTP+bR3F8XR3
	j/4CeJ9kIEHZ/49tGbHIz+/wydJtRve+SlcUmrlA8OrP3Nhtwq4Gbucml2/GA/RrQ08IgpNmAr3QQ
	apGRZH+KtH2W7pS4As4dBYqf9D15z3y9Iph1i/wD7Ca7Mj5SNbapvj6SRBZp05dE3vS/tII3khChO
	pfgNJ/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmkl-002twP-0H;
	Thu, 30 Mar 2023 07:31:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmki-002to7-2I
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Mar 2023 07:31:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id l37so10280088wms.2
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Mar 2023 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680161480;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gv8JVciuDxQ0wesT323VY8sddT9TR9dSupeai1kGABw=;
        b=zSozlUjEPWi4/jPhKpPD0C6ryndKS450YaiCkk5K6zfzdIkAgtnLWUJuqip8reAA+G
         m8KkCUhyj8NceK3K4vNBbB3vCjptyYz0hDyaYEQk/BGeBbu9xzDi3teEqOZLy2Os7Gtk
         0DJcwLVFAacIyewhxbY2yA6qQ7BpDyJFnav0KjjJYRDzBOyynQV4MZO8ndEnlquJQtmp
         uqab2pc6lcF0XsEH7nwODf8J2bSQnKOyKpECAkVtxh3eArxE9o9iXaeK1CzBkDLakEzV
         u3dkqQKfLey/rKeaXjTYhziIsNYZ//fq7v7pSZN1tfvFHNbqcgU06PUaSU7olCpsiWfD
         u1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680161480;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gv8JVciuDxQ0wesT323VY8sddT9TR9dSupeai1kGABw=;
        b=m2l53Fz74hJZGYycqfsG3V05l69QEu8aDk3Ndv94WiwEMt817QgraOhk+S8MzPF+W6
         PK/tKkm0PnXuRtjRGNgzQz5hpA2tTA98pZbWG0wNih+31qONm+THa5kmoL/dPmxnUfLu
         rPNFH0e0oZTXOfQ51BHvZ7QND4FtDwHDLQn9yPciJB/W6swhG16yx5gsYuwK0cpR+Nu/
         l4wGt5FNLXSCk91Xiz2PosczzlpBWz8eCEZmPVmvLxJQ+Zs7JWEwXex2OfKMOcGXjC19
         EICRp6KYhRnZzq9gYypl4Rs4EF9TEYDkCEVYW8mnyX8dq16TNoipxQmRaYrHEOR0LQLc
         R6rw==
X-Gm-Message-State: AO0yUKW4uribrfgnq7xUo0TOkLXxGAy/fQiUReQ0KD9ImpSXi8xtN9JR
	b0B4IH5vBeSdB2pPPJ9vXyfjFA==
X-Google-Smtp-Source: AK7set/8syKQO2oLKnczLLSt+e88iWzGJM51xpz2K8yppyOXjZwYcbmpU/VbsF2MocQQGOy4acHhtg==
X-Received: by 2002:a1c:7516:0:b0:3ef:3ce6:7c69 with SMTP id o22-20020a1c7516000000b003ef3ce67c69mr16845825wmc.8.1680161480232;
        Thu, 30 Mar 2023 00:31:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f? ([2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f])
        by smtp.gmail.com with ESMTPSA id l10-20020a1ced0a000000b003ee1acdb036sm4833807wmh.17.2023.03.30.00.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:31:19 -0700 (PDT)
Message-ID: <c63d6fb5-fcc4-3370-7b4b-f46846136d19@linaro.org>
Date: Thu, 30 Mar 2023 09:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: rng: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230327170153.4105594-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230327170153.4105594-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_003120_748883_52177E0E 
X-CRM114-Status: UNSURE (   9.74  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/03/2023 19:01, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 4 ++--

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml | 4 ++--
>   Documentation/devicetree/bindings/rng/mtk-rng.yaml           | 4 ++--
>   Documentation/devicetree/bindings/rng/ti,keystone-rng.yaml   | 2 +-
>   4 files changed, 7 insertions(+), 7 deletions(-)
> 

<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
