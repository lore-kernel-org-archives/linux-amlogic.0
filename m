Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE13EB64D7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jun 2023 07:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDm0oEeZe+wfOPRQptu/zwv8nuC9x9sVpl3ob1M+gYU=; b=exgAdSfajGzRqa
	6Xn3NlmElfNwK2Ij6TH9nRf4Eha4iiEaZj+CXUlMgjQ3aFbxXjfUTzCRxguvineCDvv4SIABL1wKx
	FCryZzkUH3MUtDUmnEcFvjj91bAMgr+IIh0Makztwk2vYQog+ZalKP6DK5rnsySFPl2qSk7pu5/rd
	eUlM0uLzn2YsItcmOTdl0X/e9AUXBpm9wevf4O62vYFr3EFOpspy+US1JVTiFRMWatlSWuGuYfdaJ
	gW4+CJq9k11qnBg3g4rlvYcu0LtVn5kbyZPO2zpLDAmUB7eG2ADa1VtEsY+uXyL9boJHsg1arUFNt
	4tjgVOg4HpYq3Zm4Ddpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVtw-00APY0-0z;
	Tue, 20 Jun 2023 07:35:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVtX-00APH2-1Z
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Jun 2023 07:35:22 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-988c495f35fso209306766b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jun 2023 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687246517; x=1689838517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6fqHgVGTvAGEge4slHeahAPuPVrMwSOfozTjAKGa0Y=;
        b=Yji/pgBZN7d++Sid+HcEIidtRXT0Fb6QIzrEUFmRX0qd74h2FSoWudHPjf9s+ifBS8
         wZnxIn6zEZ+niUv1s+WCDxAUGGAPRO0/7Y7waFkw8X4NnMJbzXfd+5E1xz+tFItjrp+v
         ZO9+rKbq7ZViNuWPDClur+ZoZZTiE/xPNjKdwPi/FY1k5xKQIp6rkEqULJMmxY+SHtb+
         gF5Ppj3fyddf++DUjfRttZyFAP4f24EUniMk4WdlpPP5nkvRio2tZOgJ2Zh/7Baf7bf5
         IxUV+UkqxYIm29rq/BOa8aoxzWBUVe1liiKSC2umDeOEZV6bEAw13TixXZCaaMBnQdfu
         QX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687246517; x=1689838517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6fqHgVGTvAGEge4slHeahAPuPVrMwSOfozTjAKGa0Y=;
        b=R2kLR/SFCjXDfXCwrorvtqDrSt3lFq4Mg0q32DuFQtdFT6c6pTEDA0rPZLM59waRIw
         /bBo+lMCIwGdSqoD3ST0Gu3VmDSh4Ls38HtcvpzJYU3JZvx7ynxwvX38uy2I4/+Ew07c
         JYtWg1HIjSvdqrEhsq0B40UcfRwfFGNVPaBSHn+4X4aDARt3bNvHR2sL5cv4NniqUVxL
         rvp7po29NKY0OZwDikAt6xFsBfWMVyQJzzvNbmR9mvKSDpnjtsyEP42RBtdWqNTbH0W6
         5+x7cfzzfZ6PckL0qX+bFll7x6I83do2jOsROaTvHAn4xqRU2Eob/1uSnKU4W97Jasy4
         Lk2g==
X-Gm-Message-State: AC+VfDwdG9PDxwl1D5THqKpIU9FRE4J/vk2cFHEJYnWRsFNpLUgartMZ
	FdTd4T8YZWh9kOgx4gNTV7/F1Q==
X-Google-Smtp-Source: ACHHUZ6IGq0LH6ffc+9WenmwXXDz0VXornUzZFY4Y2O4BUaSbVbU6In+6roCGuExwy1p2OlGDdY8Xw==
X-Received: by 2002:a17:907:7ea6:b0:988:dfdc:5a33 with SMTP id qb38-20020a1709077ea600b00988dfdc5a33mr2947774ejc.64.1687246517174;
        Tue, 20 Jun 2023 00:35:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906125700b0098733a40bb7sm851867eja.155.2023.06.20.00.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 00:35:16 -0700 (PDT)
Message-ID: <2e762290-46f1-0f0c-48b1-b399812f9ac1@linaro.org>
Date: Tue, 20 Jun 2023 09:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] dt-bindings: interrupt-controller: New binding for
 Meson-C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>, tglx@linutronix.de,
 maz@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230620070849.2059451-1-huqiang.qin@amlogic.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230620070849.2059451-1-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_003519_544932_EB9737E1 
X-CRM114-Status: GOOD (  12.41  )
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

On 20/06/2023 09:08, Huqiang Qin wrote:
> Update dt-binding document for GPIO interrupt controller of Meson-C3 SoCs
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> index bde63f8f090e..fdea0488a98c 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> @@ -19,6 +19,7 @@ Required properties:
>      "amlogic,meson-sm1-gpio-intc" for SM1 SoCs (S905D3, S905X3, S905Y3)
>      "amlogic,meson-a1-gpio-intc" for A1 SoCs (A113L)
>      "amlogic,meson-s4-gpio-intc" for S4 SoCs (S802X2, S905Y4, S805X2G, S905W2)
> +    "amlogic,meson-c3-gpio-intc" for C3 SoCs (C308L, C302X)

Where is the user?

If there is going to be resend/new version:
A nit, subject: drop second/last, redundant "New binding for". The
"dt-bindings" prefix is already stating that these are bindings.
"Add Meson C3 SoC interrupt controller"

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
