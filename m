Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91955C77B7A
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsrlLJPwCMlZSIbPY6bTekjtyjfljX0vpXCmPEwXBP4=; b=ibVtYJ2phSTSgk
	Xm/PPSkza/jnbbWc2hS/WOrD0Nxu4Y5dNijBuoIB4kIKxSttrMAiIl02L5sCl90x6K3ntFMnOXnbr
	HosJoEBbLfiHKMK1EL7PylqSlzOQ3ZqGKE+hHdnsnct5qjvHRpYs7g8s/ir+rdEOJGlTLv2fWfZ7U
	nbiWVzE1Q9g7nK/uMbU8OsCooWGQsAgmpzCT0q1Onvo4KDZvgUeHoSzUiazeoOsU2m1ftk9kYqhEJ
	J9kVHMRcBBbv1IW1HAyIonGGvFUH+PuFFTNTRiBw3IWM3EOTitqwmQJRgWxjvrpRiAq+RyxCXdgf7
	ATzGijbEgxFmIRxnT4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81c3-00GaE8-2j;
	Sat, 10 Jun 2023 16:38:51 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81c1-00GaBI-0i
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jun 2023 16:38:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-977d0288fd2so472156766b.1
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jun 2023 09:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415128; x=1689007128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/IK3y3lAajqv953jEwAcRgSDGZ5+ngtefnLO3SjzOE=;
        b=Ce4WSK769ea8Oxg8QQjhmSAWOczAq9c/FzE7d2Qf5i3hWR/FlWJfP0CUrAsLbcjbya
         cP/ROrfCjqLUwtbK9pEctvTHNrpGOu8tI7IUW9CZZtz8GqNfPlqfMGZHdtX+G2aDpL8H
         iR5v9zz8FV3siaKI87lzSunQBRETu5Vs/d7J6agdaweoC6GkJUnhvRCLmvYc3atBKcD/
         SXxSOHwj+u4x0ZM/xPNdemq7uXIlJl8bVE1r89aaoZb8K5MCtrzIZGX9HPy/WsMXIwmA
         4QkcVzS5Y3G3xIG4cNcfjWPKdWPTOF2y/aGVoDpNlc7ldHs1QjEut9pnaOKNMGZ6at2c
         q5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415128; x=1689007128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/IK3y3lAajqv953jEwAcRgSDGZ5+ngtefnLO3SjzOE=;
        b=EuEbnA3Jt/gftlrjLdoe0xPI89iOr15+CTZhkZNh0m7zCJYFabG3nFVvuXiq3mYafu
         TAUuYPGJMBPc6ry4JZh8UZDHZP+P99q8kjnYJKB165THan01+hWIeamQkS64I3SGyEVS
         WgBCJIOfCfSC26IrWcELEBUKklpivNqX+kHkpmbHg43EvhWJDFRzyv8lOZwt3TUVz+a/
         F8IVcIFMb5wzw+l8fGmn+cWjzFdYUQB1c2ds1RrA3pw8PHWhv4cwktF8Quiw9OptrVyq
         7XhrhuwYCZFe9ibescEOwt2791bY8rX1LXNFu4k4pWp2Tzmt/t92L9OVMly9H+nvBXMM
         R0tA==
X-Gm-Message-State: AC+VfDwI+quz+XRjtK+gvWl+q/C/PPRQjyra7u2nFpmlBHQuqMYkZ0re
	rwjMsfZYjtrqiUrBayLG1bjFwQ==
X-Google-Smtp-Source: ACHHUZ7S4a5+MvZbWH/1o0Fq16e0+n0hmSgAsAmZmXouOm/2AQVgs8AxE/kvpVAABCdu1nDDjZg5iA==
X-Received: by 2002:a17:907:7244:b0:974:55a2:cb0b with SMTP id ds4-20020a170907724400b0097455a2cb0bmr5084226ejc.55.1686415127691;
        Sat, 10 Jun 2023 09:38:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n21-20020aa7c795000000b0050dfd7de30dsm2985086eds.94.2023.06.10.09.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:38:47 -0700 (PDT)
Message-ID: <ada8dddb-9794-538d-19dd-992894580051@linaro.org>
Date: Sat, 10 Jun 2023 18:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 11/18] dt-bindings: clk: amlogic,a1-peripherals-clkc:
 expose all clock ids
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
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-11-9676afa6b22c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-11-9676afa6b22c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_093849_262327_A750A109 
X-CRM114-Status: GOOD (  10.63  )
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
> It was decided to move every A1 peripherals ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
