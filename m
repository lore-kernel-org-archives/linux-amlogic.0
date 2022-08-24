Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F3BC00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Aug 2022 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eK5k7PAAmT1btzdBN9M2tHGjmTf1UJ/o5k7DV14zkI=; b=HDLSiFGchLxFOQ
	g8MN92xtlaE9ts2q0IVHHJdAtacanFS5/ex17Otuvi2Z6Nf8vXQPj1L4ZVjE+W6LWnxQUGKHyalO5
	yqiHTOStq/WMpYOPDNsBiKa/nKxknJePV4gD2BGc4vaE701e34ZMz9aVKVaJ7PxjKyVif5OaakMsM
	sFQjlKd3+N+hnBiC614OWaE3NCnDkAS61xW1i+pGnnFL16S14p1LyLZkZZCQrArsnURQ6bmNU04Dt
	CuDwKKUHl+QCWpbyOEJceyQFX1E8TA7zuCoEIILneL87oEc5FtYTsRUHUp/SWQFxh2zumsBJ26iha
	uXrS1ot3O/V9lRO2mycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqZM-00DHWn-0k; Wed, 24 Aug 2022 13:37:20 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqZB-00DHSo-Es
	for linux-amlogic@lists.infradead.org; Wed, 24 Aug 2022 13:37:10 +0000
Received: by mail-lf1-x134.google.com with SMTP id l8so6506464lfc.12
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Aug 2022 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3OQC25wWN31BCwSbCduRMMv4rNNc0uP1j1+GX/KbrNs=;
        b=wpEQNzNKOT3YdGIQFc9W5b5/EtVd8HmW0cSRtQ3McUNiI5LisGZjuU2uYAt2mKyQru
         AzMBKiyOgm8/Q3bG8aYCqcpFdm9vkK4P3WehHpgPTlCHqL6yuPNdZVF7C8uNWKCYlINn
         6+qUm2A6XD3U7BSDZ7Ou+pQ8uFQLnxaZ5xpm7Af3Es0Vkr2Ay4dmtnUkOdN3jXejV+nJ
         1k89Tr5XCrXGp0N2FYyKADU9eQnhR3PcvV86MxfyI/Vz5kstDIweKPpOOTfzTbuVb95p
         lpdUqQgEUOyHo3dBPAZfOOtruz07kPs1C7CdeE84Tq1nMu3TA4KnPpmaOAvqPJhPhf8v
         F8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3OQC25wWN31BCwSbCduRMMv4rNNc0uP1j1+GX/KbrNs=;
        b=Im+3LUJItFIG8UTWeJhPA34pqGtjYbMcAez2k/vkYlFoE+jq2R9Jf9OsnPnU1gaSlr
         5Pmo2LMd+zoYJwmgTpsSQbfv4h1Z7BRm7ga8fm7/Rq27cxHiWdF5ruDZ3a8qNgZWIcW9
         pEDyX7Cs6e3+g2+/R3EXWitNu4xYzqWEEjmyTPgphOfdyybmfFK9yqJlXhinqSy8Z0LY
         OttQHo9fiRntc/JMBu9RPjYEUfqaSHU/hXrWJvO+OfAYSGcSa/BIRGnV6t1gA3EK6xar
         EyhEze2LG4FHVZVg+sbOFz1xyEygLtu5hhXrQO7Br2irFwndHtC8ScSJWY1lVZgs4oJt
         B85A==
X-Gm-Message-State: ACgBeo0SAwVQwxayN851FZUbPDSdCpCFseAidZHYR91PRFJe+lbwmnp4
	fSgVs+40cS8fEA4yvXYZDBvbnQ==
X-Google-Smtp-Source: AA6agR5mW8yFmhKsYKo2N4/NXGAdRcP64LGKPZsWPykSgeE9dIVxYgh3zulrgO870O0ziP3kisYhfg==
X-Received: by 2002:a05:6512:2385:b0:492:e4cc:17ca with SMTP id c5-20020a056512238500b00492e4cc17camr5102483lfv.132.1661348227725;
        Wed, 24 Aug 2022 06:37:07 -0700 (PDT)
Received: from [10.243.4.185] ([194.204.13.210])
        by smtp.gmail.com with ESMTPSA id t17-20020a2e9c51000000b0025e4c49969fsm108927ljj.98.2022.08.24.06.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:37:07 -0700 (PDT)
Message-ID: <c6826de7-591f-97f9-af44-35a6293d17ea@linaro.org>
Date: Wed, 24 Aug 2022 16:37:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V4 1/6] dt-bindings: clock: meson: add S4 SoC PLL clock
 controller bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220823022630.25007-1-yu.tu@amlogic.com>
 <20220823022630.25007-2-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823022630.25007-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_063709_547315_C5F35CBB 
X-CRM114-Status: UNSURE (   6.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 23/08/2022 05:26, Yu Tu wrote:
> Add the documentation to support Amlogic S4 SoC PLL clock driver and
> add S4 SoC PLL clock controller bindings.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
