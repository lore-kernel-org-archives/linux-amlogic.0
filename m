Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F38C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDelOLtWvZgOz52e1ah0sjkrH8V+HrobYAX6Tv9jifU=; b=gjcH+UFh9+8zS7
	/K459qlVccpL15LgSJmIFRs3tya1I+pFFjNRmbdqNvFEoaEOW2kVI1RQk1eVlqTp1H43eX6ugRpRM
	4zv63a8esGd3D+5ddqPT/upVtaKtg9NOlNInPECd9RqHsJsJ5KPjcT+gYdL2uscbQ7jIThaAdYj3G
	VoobD0v4RxfF6uD9kpgFyB70TNcvSnxfnuXtc0O+4bS/wx9IiFF0pdrqP7rhDxUxFC395rUS9PfJg
	Ee4ngR4dO42qEQp/bSCXV58tFMnmHD137mRyFnEsqafLKSUq4kbYUqSNwBIg15tjW+Jdnf1KMiMhF
	vY1zrZUwmeKbrQsqH19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoMA-00000008Shw-0fXG;
	Tue, 13 Feb 2024 08:41:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoM7-00000008ShL-0N6j
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 08:41:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-411c779ab2dso1049695e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707813685; x=1708418485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Elw2QVaNkQ4rL2xxLyGZjRSAhs18pKU57JuyRhuNOHk=;
        b=Qk+xUifbblYQu21mqacwpU3ofE9XxfdWAhsz2TS7XFqL514cbn/AfiI75NhIrToxff
         FuXv68gYeFvJat9zksNVstktgfljcMcE+0SgpbKdoJ9uAmkgCLmuWdA1iv37Usx2z3ag
         SDr+ra1pz0KZdDgUsV5q+sXZyd3qdNQMUbYBYBizhp1B8/9kbVWO3jKpOFHAVIcjiUiO
         Trph6KLQtu5MQ4dF5t7DtuW59LCWf4euYs10GfvslWJv1xyt7jQZ6646bar4nEFZC97f
         5G3lJG3PXY45dzOQs/st2TKAalj6wyQjKmJuTHXyQX+6x13Rn2DClZVB/DjLI4raBOIz
         kX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813685; x=1708418485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Elw2QVaNkQ4rL2xxLyGZjRSAhs18pKU57JuyRhuNOHk=;
        b=ZNeESI5zsCzmAzQTEFvgDbkXWBjsT3F+hFp3YhwMG1HI3/I+C6Fkx/vxrwOcK82AKB
         lZdHIDEjZ/eR/uMuKzyZ9qCdbQZkA2VPeQ7hx7hnOJdg/XLXMa7olZxpQDvfFnfactA1
         SD1jKTXL+cNvTk9b86lYBENzYsuwr4RDjS8qabBPCfkHZFgMzbZiYDw74DBaLMhgvhh2
         8Ys7edYX2JuPWKs4FPgfkc29+KniBVt/rcg5mxN+3cXEBrpz8maieMXGfLADVK6ZWGI4
         5PJT3vRLHlbvXA5PFwMZZttMCvyforzD5jHiO3L19LQfhg+v9KsLcXa3EHFbAT8YZOXi
         NtvQ==
X-Forwarded-Encrypted: i=1; AJvYcCURTRcnbFklRWXFufj0LqLYJj1lGS/xTDcypMy2jGSIfg65Ym/r70fW5gX9g50YVq4WrEfgBLUqejxodUUW0+jThKdwSruN7ci9yi8PN4dZfUU=
X-Gm-Message-State: AOJu0YzVsvn42Lwf//jAAb/ZJ6mN0v6AkQTaNaocKx71ZyKFFhi7tgZu
	Ujh4BuVhEQQpz9QBlOO+GJMKlHb1xE9PqyLbojNsO0NPqPrwu4Hf9xV/MOwwANKOeKYiwiQTHWb
	f
X-Google-Smtp-Source: AGHT+IF1/t76Fzxra3TAMt/4bG4QepPpU1vkKPjNtqOZeYIaAjk3tm5hf8eUGzplp0SAfxKIHUI/1w==
X-Received: by 2002:a05:600c:190b:b0:410:cba3:e9bd with SMTP id j11-20020a05600c190b00b00410cba3e9bdmr3593951wmq.28.1707813685543;
        Tue, 13 Feb 2024 00:41:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRk4K88UmfydCUdygJRAB+ERtrG3vEUR+8x5kBqJDLX1Vq6MyGyDVc9adaJYhYNsYlmRX3KgsZxBixDZwTjd3T0NA27ihXNS4C7ZWh9d61VNNZU7uut/2i/NXyx7T8wIcKcy9EdUpP5HDYGTpw1TEAl1MAoTFbfrFk32ARMksG0r0ddK7OzDAoEoR7AmDagxrAa5Y9pycMulJpy0OgvnzBQn+EqYdz2pzfeWuWuomeIHYWKvw2omUD/nqk0/vY4qQoW5WS4Wbr8B8/NmGL8Rt0b2l/sfuaKtQy7690ocesRomrIzwInYFJ907laa2uBOlpgbI/V7v62tiuNTSukDZ73eeDHOvJ4+X+NvHQx7ajp6RfirjP4YmweuUeFShq
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b00410820995dcsm10446311wmb.23.2024.02.13.00.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 00:41:25 -0800 (PST)
Message-ID: <959b8135-a687-4781-993c-5fa5ba3b9c8e@linaro.org>
Date: Tue, 13 Feb 2024 09:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: amlogic: add fbx8am binding
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <8a148279-05e1-4f00-87c1-6ed9ed1cb3dd@freebox.fr>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8a148279-05e1-4f00-87c1-6ed9ed1cb3dd@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_004131_171806_14C669FA 
X-CRM114-Status: GOOD (  11.22  )
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

On 12/02/2024 18:50, Marc Gonzalez wrote:
> Add binding for the Amlogic Meson G12A-based Freebox Pop (fbx8am).
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index caab7ceeda45a..fce12e44c00af 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -148,6 +148,7 @@ properties:
>                 - amlogic,u200
>                 - radxa,zero
>                 - seirobotics,sei510
> +              - freebox,fbx8am

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
