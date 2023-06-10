Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B584C77B7A
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqx4KMIvvxRzMzRAiUl40MVArBco0c/59nXs+t3tmvI=; b=ATRVAXL+DqRUX9
	GXrQpDCbOuEsyESgom5kE90m2BmVBLsBw6rix+7jgCKHwqMi/Sugi2eRHsyNVYmibRT28bPXMI7nl
	LLvqvVGb1/Qkjas+KRpYhHcG6UniAvhEnuYsT+DtLfxMZ3hFVO3U2cW3ZC9fvzQ7nm+2rSzXuP2KK
	gzrO97ao3SSeGsd/K2TlWGB4c89bB3/RZp9VP6+89eWqvw9OiIFvwSZorBeEDvMjSKx6BA5bYCqk4
	dQwUqNtA5K/R3OYgtJ2Gc/lAj/Hodc/yIGh5Ym6ZoFZ/R9ldcKEcqBx1pRCZgeuEvh//wwlT8i6Yo
	OyKZl2Tkdf3WKha/Cxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81cT-00GaRi-2T;
	Sat, 10 Jun 2023 16:39:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81cR-00GaQ0-1J
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jun 2023 16:39:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so4146163a12.0
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jun 2023 09:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415154; x=1689007154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYRNaZZWvIO3JyhV4C5ts/iImEde7OfTy8GQTAVDiq0=;
        b=NRTuQOucr9g/g0w9Rn1gblcRZDMbm9wB3TOFDPjKnGQZkpLvFTRd6UnmA4u7x+zRj8
         Kk0DTGui5luvucKTcoMW+Kvq12rbRbcMt/1HQX2T/vJeesfx3WgA7CXw2wJFqsDm9Ovi
         P6+RxlGE5uxW9KVTcFHQW1DDZvldHJbzMxD0/kLRr+Ap2tQCZLrragyrGi0MNg/T9HN+
         8Gw5fbCqDmDyBzAFEBNRwy0tOdpBn15OgvGEZG6NI5sF66Rzb5QZjpKYNv6YpvHIQVvW
         eCFWu84WtrRdSkVLaCy/bKoeBi4OAIR0ChSfgOnnT7G9HzeOVjV3weGnuuD0yla4Ye9A
         U5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415154; x=1689007154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYRNaZZWvIO3JyhV4C5ts/iImEde7OfTy8GQTAVDiq0=;
        b=NURYeKKGt9cZpu7QFaCa0aQgwZMaWB/VZ/ijOS7bP5ZWo5OZok1lHfGiq4EbXohtGx
         zDTSNXADwApuR9zKoMGtOcyxZQv5glJr237RB32xmJmiTowP4rNNHsLfLRIouIExleUt
         W8Ku1OMhBxC+hE0u1GMVjffPKaCL+dyfYQXuXiGKxlNsrInazsnZwkO6arnHo1Zwk6gj
         SJop4qsNvuzYopc4q4ec59CgzMFDHVZ4B/xRsJAAzNrEfD8+PrM48vGcey3odLm+52OS
         pv3YYIfJgeNoVgxm2wqalTNUKWFwj9Ut8p8hT8ILciJBTx0nahNCzKO0uQMcfKs+Jof9
         BbHQ==
X-Gm-Message-State: AC+VfDxAphlxJ/zOMCfCPbUCTXRu3qhVq+bfjR+WOJshpywZgX3dyfjN
	DG2UDO843ALMKvz2PsIcgWrhgw==
X-Google-Smtp-Source: ACHHUZ4RlNWgvJaw5Czsbg2CvOrwzUP7dhxbLbAtcji3Fh6iECuh9pfdfKxpju0rExcl1Z8DC50kzA==
X-Received: by 2002:a17:907:7e99:b0:967:5c5f:e45c with SMTP id qb25-20020a1709077e9900b009675c5fe45cmr4491929ejc.0.1686415153969;
        Sat, 10 Jun 2023 09:39:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lr12-20020a170906fb8c00b00959b3c30f2csm2715157ejb.222.2023.06.10.09.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:39:13 -0700 (PDT)
Message-ID: <9f0a9234-b453-69a8-859d-84c0d43a303e@linaro.org>
Date: Sat, 10 Jun 2023 18:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 13/18] dt-bindings: clk: axg-audio-clkc: expose all clock
 ids
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-13-9676afa6b22c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-13-9676afa6b22c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_093915_451504_1654EE79 
X-CRM114-Status: GOOD (  10.48  )
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

On 07/06/2023 12:56, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 
> It was decided to move every axg-audio-clkc ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
