Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C19C636CC
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEee9ojdDpTEq2Pr/VZK0YKY4TkwyDnLEAoU5WUPmgk=; b=IYiPrZqU2BKfdJ
	RD8p0Oxjmdjc5XoxQ0jYZ9egaeUWscUWDCxYtwrFr+O/g4SbYeOlnE4bKXxS9442Wv5IMU1HJjQtV
	fxfWmy58BLC2jNnzr4dmHiBNOmXFr1QsHMTI5qRCIXdvSPwvqLP095r+cEp4HUw8dzew9Kyvhaye4
	hfl3YMyurDvXJLxY9TivahsrBNbdt+kY92PKWITm1/yOSoTYBU74j9l+uR5zx10NsDhJQ/vgld8pD
	I5gGghsS0OyB9Y9pYy4K7X8fnsX+HdS8hJq+jLdyIHpDu/wvsbI/solNFpCSsEoOor1LfFplDpfm4
	ZJCZ2e7TvRJdblGhUXAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqiu-000qor-N3; Fri, 03 Feb 2023 07:43:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqir-000qnx-Rn
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 07:43:03 +0000
Received: by mail-wr1-x430.google.com with SMTP id h12so3824655wrv.10
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 23:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5b+vj5d7mAcnPJNRiH9TynU/xKQ/CpSAEs4T/HSo6WM=;
        b=OVW5q3e2AWBaEpv9pU1V5tHYMvWGjFz38LsAYxF3RZ1R1cJM/8rvHD2DO7yNCseQRC
         ACuGazwu75CVNmUtL7LI0ziZK7bxVPotpYyjs47CeDSWxymaNaO14TNmsnPqRga/mS1+
         srh64uY8bCmkVt5YxIsaaAFHtjbSMUq23s5n1EJras2wUyYp3tL7IyuvskGPFHwLLWkK
         z0TI1/jBvPvYJeIczmEZJwUx6nYFxQzO7wHbmZYfPewuJqTd8PzBljQrxdH8uO+Yfm1w
         WSwgQ2Ed5aOSGvXe1jsMpnOElovWta7yUvuNnFnrCsf2Uba6APuU3jAGHfpCBcRVt6Iv
         2dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5b+vj5d7mAcnPJNRiH9TynU/xKQ/CpSAEs4T/HSo6WM=;
        b=7QHZtJy+NZEANkLnfdEGsyQyEMzhASSg+/CvasFPc+MEEDFIKZXvpJGttKEilmgGlA
         XFFfLvn0ukuIh7XzflmdWkdHN2t98rir9BN1OqdO2NydIS6PkySRYcQJs/+AyywuQbRo
         Dwp2xuuUx5xuDXQ8BtA/Y2wUzqrdRI62i9mF6Nk+YxRiLr/RtU2Re7+LmVHy8hkGpdAf
         Ey9JXDNf4LvIwsdLOsWSHLelXyvQqDGDzN3Pt8TbVlokORlh0hN2f3VbumoXOn/RNhkS
         S2U5DUJaE3qGDzz9ju60CnAKamD+FbU0cy0d5LDLC121XQtmIXh9pqMJjgg4dgcJ6XMg
         jXaw==
X-Gm-Message-State: AO0yUKW6yFRbf081QftsbbXfu2wWUUK6NuOeTloW+2SGn3fDf67Dbb+7
	oYy4E+XTt23wHnEIhtWLbK7FXA==
X-Google-Smtp-Source: AK7set/Nnmyc06o1/eWZDo8c5sq7iLgNIWGrOpe8J8PK7wCX78+RHVK3sEOmbgp+Qq0mXKw22iV1SA==
X-Received: by 2002:a5d:6707:0:b0:2bd:e1fd:2536 with SMTP id o7-20020a5d6707000000b002bde1fd2536mr7402011wru.9.1675410179537;
        Thu, 02 Feb 2023 23:42:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ba9-20020a0560001c0900b002c3c725bdb5sm1275864wrb.117.2023.02.02.23.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 23:42:59 -0800 (PST)
Message-ID: <cb02ef03-b3b9-2169-1df6-b82221128909@linaro.org>
Date: Fri, 3 Feb 2023 08:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/9] ASoC: dt-bindings: meson: convert axg tdm interface
 to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-4-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-4-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_234301_937538_475E47E7 
X-CRM114-Status: GOOD (  10.94  )
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
> Convert the DT binding documentation for the Amlogic tdm interface to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


> +title: Amlogic Audio TDM Interfaces
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller-.*"

Such pattern is also not correct (see your patch #2), but so far we do
not require node naming from individual schemas, so I propose just to
drop it.

> +
> +  compatible:
> +    items:

Drop items

> +      - const: 'amlogic,axg-tdm-iface'

Drop quotes

> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: Bit clock
> +      - description: Sample clock
> +      - description: Master clock #optional
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: sclk
> +      - const: lrclk
> +      - const: mclk
> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +
> +    tdmif_a: audio-controller-0 {

audio-controller (and drop the label)

> +        compatible = "amlogic,axg-tdm-iface";
> +        #sound-dai-cells = <0>;
> +        clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> +                 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
> +                 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
> +        clock-names = "sclk", "lrclk", "mclk";
> +    };

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
