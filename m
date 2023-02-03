Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF44C61DA4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 07:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzYhTVE7mv6jl3yXBP8zjhS8Y27ZniG0rYkaXgbMZRM=; b=aCdqB60oM7In+5
	Ua/Okr9wuXP/WSkBph5YrB9WR3KURICGNDd/S7rV1idtNbMTNVQiXS6puVF8Kw1dztgNd5spvZKar
	dYJUdXdWJxGEc3idFQxFH/7qf29rZnrfPRnS9dGHriAMWL2sjC4MydslvZnX9m0/CsoTFRRxpTm73
	SU6JYPEUCdbLYhsAy2iPGOI5wqw1OKQ3mdOPyJ32CS7IJvLAXQkY+RX2b/Ga1xbRw6KCSomjeLi2W
	uDLrg3S07Qwarz+lNFm2lCfNBBbnw3aUNy/w8zlP1jtWwzJJrBbV7NFFL2ELIIFAxe0a7aVaKcugB
	1NyZl11w090ImVfJYSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqfx-000q4Q-Mk; Fri, 03 Feb 2023 07:40:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqfv-000q37-Kg
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 07:40:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso3177981wms.3
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 23:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDG+Tq9iDGbHsf5EgNu0sPH0oktHNFK56axN09nipps=;
        b=yptLRVcqgMEv8JFQdUEfePL7JJZ5m6e8TTX6WXgdibOU5Xgo43x2mz1dEM1ustKfPV
         TojcrLeEU06LWS9QaEqyVsJF9DvFP/uM5FBnYICrJmklLai385IRWMYCye7Q8e00aqko
         5cNF/XAhVJ44XEB0TIFQm0lLj0SxLQyVPuCQRyMu/oEwnY34X+gboWZOJV0hb/Xg+tV0
         Ozv3lTqxqQHZcGKMU/7E/dA8YKdioh1tx23nD6Ndr+nbIwXcq30e1/RxsWZ3KZXh0f/1
         7rxeAf/947EThE7vujkmhADU7gxp3YmZDFASuX6fP54AQWqdq7oYBCIu9TWzd+GjBTDc
         9mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDG+Tq9iDGbHsf5EgNu0sPH0oktHNFK56axN09nipps=;
        b=sw+51phgzAA2CU02RX5sMy4SCjPlaBQ190SiNv0GDpfrbd+q3gTItwLQRqLO5GLybS
         Mnq9uT0faI5Iy7NNDm0H5qKicfpwwgQY9ev9GfXKfWzRAeMnLqNATyByrGCNxG2xFWbC
         7F6WSNSDJKfL9GT2VYJVkUSYpsoqF5LPh6P1vzbzgOX+6GRjsNs4QxOB0NcMewFc9KAB
         +x4OooY/kUNdSigcrSQCIUb3y9s2K+ibPzEC8KvhJuSJ9dcCpij666uFRHp136qOZ7YB
         FGZ0u0MPON67mS/cDjNoVQocFE/v0ESFcfjhuzAORs5d3C8DJypMd4FOj1es4sub72zD
         eBnw==
X-Gm-Message-State: AO0yUKVdbjpOMWtUOFX4pGsMYGhE2Zirnv62I6UCcMss7xObJkrmD0GP
	dyrGH95awtZG1Ow/cgO1t8eMYA==
X-Google-Smtp-Source: AK7set+WVSL5lEE03IKAtRDn0G9GQ2gh7h7Cg2Buma4kwR1Id2znaqCke5/4PO5RGEDw3TtaU0/xNw==
X-Received: by 2002:a05:600c:5389:b0:3dc:557f:6126 with SMTP id hg9-20020a05600c538900b003dc557f6126mr10773527wmb.4.1675409998149;
        Thu, 02 Feb 2023 23:39:58 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003dc49e0132asm6747405wmj.1.2023.02.02.23.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 23:39:57 -0800 (PST)
Message-ID: <0012a2d8-ef4c-400d-7236-a2afbcdddf47@linaro.org>
Date: Fri, 3 Feb 2023 08:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/9] ASoC: dt-bindings: meson: fix gx-card codec node
 regex
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-3-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_233959_715711_704E3C00 
X-CRM114-Status: UNSURE (   8.08  )
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

On 02/02/2023 19:36, Jerome Brunet wrote:
> 'codec' is a valid node name when there is a single codec
> in the link. Fix the node regular expression to apply this.
> 
> Fixes: fd00366b8e41 ("ASoC: meson: gx: add sound card dt-binding documentation")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
