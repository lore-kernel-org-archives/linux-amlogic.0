Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6833FC7EE2C
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENsRiISt2M9HBEY3PXdUE4tUk0/8UtbhmAOVMjX+5aA=; b=lwde/3F6bRolsTysF8hs+o6BSi
	mJJcbDGF+tE+HhjIIoeVMnEl0lQUsFmtlTnn4IfxxvR5CfyAvWavUwwTtXn5lNWdBD/MFvq1AnQu6
	fCDaoNxGtNgWRR0OHrOcIBjuWlfNwCVGtS4yWqG9xzbV4X2Qn2gbWZRSRyrN8ZPMNptEcWGIjYra6
	cWhDwiF0MZEBrb/7T5sMcUNccl071H9snq44ZppqIsoj1SUYEBKzIMFazJ6FNaxiROKDacgWAYm1o
	Yyd2x13lhyoHtB34stY2SUdleX3m90i5vdK5z4uodyJl7Thczu6R5vUb+g1+H3FNm7MGlzajbS9Nr
	anCLMl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyaia-002gWu-33;
	Mon, 15 May 2023 16:06:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyaiX-002gQx-1z
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 16:06:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so58720925e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684166789; x=1686758789;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lWOCuNPc2Qhm23nE7fOQTHAU+RRC9bg5RSfsC5uCndw=;
        b=CAUxT2wohMzyPhNhiBK32M6vlIx8hjwrVFS/n+Ot/KTQtHRMY3fI6QG2sJREE1OTod
         q0kxQyT51lSIWKyeNrkRGWvXmM6VYcnE/shvjL4QQ4S/Ff4WEwb01lHxi3kURR4jje9q
         yv2/BxYGfvDvqMI2RPSrnPcYwtM7HmfKOr/IYEnmvKwFcPM2CuyqyquUQzVkKRjTpaKS
         4pHa2UrqLiNvuuDBv5dY0qoYXayT+6jQV7Kf56962q/E1fkquwmzEZ0fxvYAJ9PXlxKG
         h9ALmY7IRxNx1ck0lxQ0q1sJua1B/292RKS3TRum9Xg4Ad2WPIGs06g30e6Xa33ZqHKf
         xnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684166789; x=1686758789;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWOCuNPc2Qhm23nE7fOQTHAU+RRC9bg5RSfsC5uCndw=;
        b=bfMBMh3Th7Xgnds5ttu6VCN2iXq3m2POUGy/hTRMWZ74mr7Q6xQfI09iHI+KblHFUK
         /mt6T1RX5xEnlPiGm5BuEyc9/wJ2c8v1Vh1DBHBS2JmSPBjS8R1w8fCyfQbbdO2pLYtr
         MknS2pHnm8LtDPoXV1oYxzVgmorkc263DBZCOdebC269xtcrVj+1omUvD+aYTgcxQuSB
         nmtfbZl9hxL4pRvb4sTQRDYxVmSDtwBiLAce2llJ4H0px6EjirrMNV+29cUNqv+o0qTG
         hrGXgvH0LdMyvIUCEj+pxOfaJrM/SniJzbjQopUyidX/x8HWPiuyYOYNR/ep+TLEHiEU
         25YQ==
X-Gm-Message-State: AC+VfDwI/MjBUY85p7un2wJs8IE8e4me/axs954P6h5AICtqvFn1qS8K
	kPk1RzwcwyvTKOUBOxHcEMbc7Q==
X-Google-Smtp-Source: ACHHUZ5y+S1cl668Cm09EQ1NgXHqr+j/kjOw7Ds31xnaNEbo1aQsxXOF8pRWNpL+J37Gpkvap2Ec/A==
X-Received: by 2002:a05:600c:4444:b0:3f3:284d:8cec with SMTP id v4-20020a05600c444400b003f3284d8cecmr24800387wmn.2.1684166789290;
        Mon, 15 May 2023 09:06:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ee7:a396:6195:bb56? ([2a01:e0a:982:cbb0:ee7:a396:6195:bb56])
        by smtp.gmail.com with ESMTPSA id c3-20020a7bc843000000b003f42314832fsm25497766wml.18.2023.05.15.09.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:06:28 -0700 (PDT)
Message-ID: <9fa0662e-8854-05f9-da7f-ec8e08d2badf@linaro.org>
Date: Mon, 15 May 2023 18:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
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
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_090633_653040_5AB717D6 
X-CRM114-Status: GOOD (  12.92  )
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

On 13/05/2023 20:28, Krzysztof Kozlowski wrote:
> On 12/05/2023 15:11, Neil Armstrong wrote:
>> Expose VCLK2_SEL clock id and add new ids for the CTS_ENCL and CTS_ENCL_SEL
>> clocks on G12A compatible SoCs.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/meson/g12a.h              | 1 -
>>   include/dt-bindings/clock/g12a-clkc.h | 3 +++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> Bindings must be a separate patch from the driver changes. If this
> causes bisectability issues, this means entire solution breaks ABI and
> is not appropriate anyway...

This is basically how we handled CLK IDs on Amlogic clk bindings for the
last years, the amount of changes is very low and rather exceptional
compared to early development stage.

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
