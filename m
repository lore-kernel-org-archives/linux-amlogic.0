Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46888C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQChOu5ccMFeJU0l6bHXJYBHU34w5hMeMbZriahUZ3s=; b=ymH8G9tiTJf+S0+1j/+2WNOEw0
	KZpqqYL//gwUObcR9AcgRC62YgLF+aqa3QCYBfLRXRhsKd68YEJbXP9Zqy4b/aHnERvOkLftw+NFx
	Bp6yprmtpKa4f/rPBE6yiKM7JM7pVbU73PNNdiUzVKJtDkDLTAmN0dfZoExh9jXklf6EZyMZ1wqI3
	hDU5vxVNtmkKGI7wSuav46RW/NJUahz6q2ni+vKheHcSb0s7nE8VzqYl96BAF4BXXf1YuadLiyikB
	gpJK/DtzfOhdEMfmUhYvb+urxWptbCzOBmASJu+0O7Guj1BiProkhbuoLl4V1JjM+8cQzYKSzg8v+
	17u1SpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oycJH-000hTT-Fg; Fri, 25 Nov 2022 17:16:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oycJF-000hQw-DZ
	for linux-amlogic@lists.infradead.org; Fri, 25 Nov 2022 17:16:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id cl5so7701704wrb.9
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Nov 2022 09:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D5t5pk/Tw2Avo20xT44DfzVJuCpgbHlNJ6TbleqnB8c=;
        b=nIX/RrPlgp/BOtELVRhcFd6OE1QFdwbFsoHrePhw1cx9839H3Ixo+BgSJFMGF+jzO7
         TOo8dOoN798NqveINmFSHegz/B7bGBM5mkNQlCPyrc4/Gf87XRVv21qPPSOxfJSdpgEM
         2qe0v+t43jzB0fXsBfd0jGTYProEBC9XYQzywO37nclhh9o+aItgx/NTsSbn0Ydo7NN8
         DIDKRUyTUJsRQ/EKC3LnCTX+R5z2vcPGK5M7UxYkQHgEYSaTfaFpLqV6Roh2wtj/Q7Yg
         MQeu89ncHiSTtHfogJ2nW2SYe6HfsRyp8Qwst4nc6gTj1lq+Z5vHNZ42ujPmwk+a64P9
         TysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5t5pk/Tw2Avo20xT44DfzVJuCpgbHlNJ6TbleqnB8c=;
        b=vKpVN4TnbW+5lVynEx61w+qzC2o9+4wXFJyMcw+D8oaqrES8DBlKsqGhuMPZv9jaS3
         t7tCNqV6MYGCNSXrPd22zfvocUsIf01hAsilnu68IhluTFbo+t8jEgA2JkZULI74Le8W
         qcB/XFf/EbTI46JmvY0WMrglRpaKHFWX1mAjD83AuPFScC/0Phc7PKSIyEjwznMmgghu
         onfJNAHVOihUokJrewIuQmo/9GbZSkwz/8VhrvLOphQOAt+dZa2kBHs1d5n13keixOLP
         pmxldF3vbPwUprgiCTT9weYHbmWHrnAPYzbKeS0uidymH/H8orKq7pkyUB1ZJr9hQCmb
         pPXw==
X-Gm-Message-State: ANoB5pni7wgvE7k6Dpw+BCEYYXuwdIsxAwAAka/NiiUlX9l+hti8FOnB
	FdLg77zehkb+VvkUYoaronH8HA==
X-Google-Smtp-Source: AA0mqf7Rcx3H1sfAYSftgETBIQmzgTPqE79fmZWHKA/WNteq3AkzMFTo1swYpB3H3F1/pas4fOKOhg==
X-Received: by 2002:a5d:5b19:0:b0:241:dea3:ad48 with SMTP id bx25-20020a5d5b19000000b00241dea3ad48mr14423755wrb.357.1669396573516;
        Fri, 25 Nov 2022 09:16:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe? ([2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm10667777wmq.31.2022.11.25.09.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 09:16:13 -0800 (PST)
Message-ID: <c8d9e319-238c-8c33-f146-90d292cf63d5@linaro.org>
Date: Fri, 25 Nov 2022 18:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] ARM: dts: meson: align LED node names with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221125144120.476933-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221125144120.476933-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_091617_517789_F4FA5175 
X-CRM114-Status: UNSURE (   9.05  )
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

On 25/11/2022 15:41, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern:
> 
>    meson8-minix-neo-x8.dtb: gpio-leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm/boot/dts/meson8-minix-neo-x8.dts | 2 +-
>   arch/arm/boot/dts/meson8b-ec100.dts       | 2 +-
>   arch/arm/boot/dts/meson8b-odroidc1.dts    | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 

<snip>


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
