Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536D3C83005
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 16:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDnBPFG53NauHP0QdsNGRnac1Q52Zzh9u4yBUQ0gWhI=; b=dzF2AJHg9ZU5Hc
	yGOAZB+4zVnxuL8WNglNxcPDsLj0tBzuBt4gcLtQl+BKbuSiiNgV5reTIR9ZsYfp0yNZy9AUgPyHy
	QVipU7eoe4KT9WhlS3YB1F+oBcbl0lzpKwWNWOKJ5r107eZb3Xw3C9JSd7ljs2jOm/oVXQKAZp+Ac
	lyRPUIcanbvXqzSdfRUdfANN4/Wzcm7gbjCnNAEc3wOnVfrEca53dRJeSVK3Epb7sX/2JphdgRjCJ
	UnRl7Pu8ZEyk3i6aU3cGYFUVcOynCcJqzU8R8DZ0J6ULB402ZBgANcSH6jZDIbfk3bFXUfVSRBGwu
	HsPNtL99b5LXCAJ9zwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bc-00GZzV-2f;
	Sat, 10 Jun 2023 16:38:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bW-00GZwm-14
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jun 2023 16:38:19 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-977cc662f62so414930166b.3
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jun 2023 09:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415097; x=1689007097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0FYa9qOs26ReIayAA4rt+zd9rx/ezbf9Nt79iNJ6KJk=;
        b=mzHil76DrUesZXbQpE9y+Gdxx5ZAAW3eGk8u54VrM1lUBvoofXR0IyELD/IiS7HCAo
         x7xTMbO6EBQACXRY4KZi4KcSyf6eT+XwvVgScxtjXDuO/LjrSfeV6gPzu7iYhU8CqCt/
         EoSHux8D3qiFCazBhScu/KHEJqWM8dyVVEY/Ww2S4A8WBA+yyGDSzAasL9daZDZ/MP7o
         iIbCAthJfMW0eKXT7A5e9xScGdINgkhpeicQDqJvhduz+cf2dbTVin8N/0QsLIzMpjS4
         7d5yFFt2NOGrs/aY1j5hJroP69G9z6OoBSW0qEIhLhlzpvHMpDYJaG8tGtngsR1DGntA
         UfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415097; x=1689007097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FYa9qOs26ReIayAA4rt+zd9rx/ezbf9Nt79iNJ6KJk=;
        b=VRpY8OWhFbpgiLTAwdeRe5z4W8OJUjEmAKnOkZiPmi5Q435RBmixnQydX6HA+TJAyv
         SXleAkxRQfwyeXgbqFM/U/OhUb+Bp8mgCBJzYTpp7BCZrpXc5+afU4bgFfLO/Nn+50TX
         ImUi6fpewjlZAHwP1pL5HA2zQHaIGiN4SA4k6ClVtMmHWC9REyARCzRP86vpf+8jYuBs
         Fic9um291RXX0aaYC4I1ZFBtZXD6mz2qbYzjM7BVubbUgl99c9b76JU0J+uKYHZPIgUb
         txgqvLXh4V2Mc7eEcC75M1lwYUlac7zYyoF4RU2ePLTZl71KD0CFgS4tMTuu63NyijFx
         ABQA==
X-Gm-Message-State: AC+VfDxJDUf45IRXDj1jj+rOAlYG3KawbTZhmBi9pb8Prc2NVJf4r2zx
	dcgwx5So+W05yiPhIQXu+PDg/Q==
X-Google-Smtp-Source: ACHHUZ6ceMsU7bgNBufu53cXEXJfgiNSG08Ttd71Mh/KuCaXKtb7/l1oFgBD4K63EsrBCNktz0IZ3g==
X-Received: by 2002:a17:906:58d2:b0:96f:f19b:887a with SMTP id e18-20020a17090658d200b0096ff19b887amr5102173ejs.56.1686415097068;
        Sat, 10 Jun 2023 09:38:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z8-20020a1709067e4800b00977ecf6942bsm2769460ejr.90.2023.06.10.09.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:38:16 -0700 (PDT)
Message-ID: <46f62582-5b88-2fb8-4ebb-74a2783b65ce@linaro.org>
Date: Sat, 10 Jun 2023 18:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 07/18] dt-bindings: clk: axg-clkc: expose all clock ids
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
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-7-9676afa6b22c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-7-9676afa6b22c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_093818_379272_4E66B77E 
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
> It was decided to move every axg-clkc ID to the public clock
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
