Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B36C7EE2F
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQzfheDp9L6HRJlkhppDQX4IqHShvd91bMm6toVHDDc=; b=ILHGiEKROpj1nV
	3BTkEbz43BQL0EZ6g7KssCFrK87ZgCv9uH2gNVewGMGpsUPvAvfa7BmvDC0FPbCLDGhmNMrbqY+I5
	XclhTK27g6Rbj+c24Q/nQve2qCOPyCg8xwnvqIzzhajNxcGW40Yaen6oQCc7DWB3CJP8NLvYhQKRB
	pNrYedpgOM5IT9o8s7xh87iDA7T/SMfxSzqkdQ+rP8I3NZWI4RSAKOnQLabT7JviIKPIraD2h/o4q
	0C1dHfBPkJhZNGEAQdYL3M82IMGmPQBMA6A8LtCMGKELvQWdbI+RKKafHPV+OTBUB4AqJr5Yvlnvo
	rU6Ru5pmCeosNmr5ai3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bx-00Ga9D-2K;
	Sat, 10 Jun 2023 16:38:45 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81bv-00Ga6d-0c
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jun 2023 16:38:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-977c72b116fso424551466b.3
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jun 2023 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415120; x=1689007120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGY+07fHtLZ1KBnWoGU3+DqFHhYsAN1rcupom6JoV8o=;
        b=lU46AegLxXOrFth50v5CpwxnCgHudkiOYF1TdXjD6C7m9WeUbN0yntoNKzXDeJrFDO
         pO6/klGWzrF2Etdkcy4rShvt5MG56euzWG3N2AlYG8J/OGv8sz0AGws5ccBBhIxEbZBg
         HZ3qkbpgnnDC7SLikBur4gvN2G4K980RsZDuM3QOWZtEvcco1WZfxprgllit1jB8CIG9
         JSTWcoa9NWFbN7enSwbnvQhknqPp5eW+Ov55KnqgBJohn+F17E8COANK/tz9KKl0msp8
         irOuTNNIXiHhjwm8OdoZ+Z5J120vkkPC2zgjUmdAKIZ7P95Ybrre40xUd6n+WoFrmpyO
         oKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415120; x=1689007120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGY+07fHtLZ1KBnWoGU3+DqFHhYsAN1rcupom6JoV8o=;
        b=TGwDyuLZaqDSs9liKypBfhTFti4Ra09aAbUWhnYY/FQYUmbsraBmjNwn2sv8orKERW
         AVrRE9mtaBt9cf+gPG6t4ThAc3+fRT1984lhNOOQcPPSFdCz5FbTvyzSB5M1ZeJVFAcg
         atWNKyJsDR6mcua3ETdF5i9+D2pjjHR3SdJx7NCW89aH2gORkht1ELt+b4JagF7wmS7j
         fmrWofiyHrBmdDMqbDg0jQIftNEp7BzMbRK4qntVQOQsKPI1Rzg7kduvUpFj28Z6RtTm
         5fN2QPHRv45+w9Zb1/RGQ3ngXX5x9y/kY3/9aXm6nJhv/67mwb2M2pQbWQmYjNxypuo2
         5gkg==
X-Gm-Message-State: AC+VfDxwSC5uTwd+58le7lvj46i98GYxt62zNGRLmsZx84GE3w50MfxO
	aZ7xBAgBjqhenQf9N0tDxdKPTg==
X-Google-Smtp-Source: ACHHUZ7vum1iNdxQLpebiV3c/Lp2Lb4W2rvQGgXBK7h1zcpBZK8iZshqTm+rVbCvvlDsv0NZ/GXJfQ==
X-Received: by 2002:a17:907:7249:b0:978:6e73:e841 with SMTP id ds9-20020a170907724900b009786e73e841mr3704404ejc.35.1686415120467;
        Sat, 10 Jun 2023 09:38:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id x22-20020aa7cd96000000b0050bca43ff55sm3047459edv.68.2023.06.10.09.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:38:40 -0700 (PDT)
Message-ID: <4c91a18d-c1ab-f79f-b80b-d18b6e966e10@linaro.org>
Date: Sat, 10 Jun 2023 18:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 10/18] dt-bindings: clk: meson8b-clkc: expose all clock
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
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-10-9676afa6b22c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-10-9676afa6b22c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_093843_236541_EB7A5044 
X-CRM114-Status: UNSURE (   8.73  )
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

On 07/06/2023 12:56, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
