Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD292C636D4
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Feb 2023 10:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIkxqdBnMx7fg0JFZuCIxJ3JnducJ2MrBC9mMNra98A=; b=RG5Tl6GPaekLd6
	YosiSJxCuctMTt5rUtjK1LTBML+PYXRHyjoAiJ+AWiYLOkY0oLEoCGg3fn+h6t3BBTPlHWTci1SYu
	Vr23w9U6B+OxilwDAx6v1Jnd3X6nEMUi+OCEAQsQWguWo7PbZFZFudmvMbqNp7/HGiywYmKRYzxaX
	zGbdCx2uEAzRYCTH1MDv2nXhVSZd3B0usM8R0elGI/CJPWDXXiXgUbNkANOZbmOoJMdgkwVgQtTgD
	5F32gFgEShczBjnK2yipvio2pgAfdJTYQlpQntHmzZrs3xN9jO/kjxeKey8ylCJKd/BVc7dNVak9i
	c+Aho2sZZe6g/HtrpJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSxxl-00DgrB-EU; Fri, 17 Feb 2023 10:27:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSxxi-00DgpM-VA
	for linux-amlogic@lists.infradead.org; Fri, 17 Feb 2023 10:27:32 +0000
Received: by mail-pj1-x102b.google.com with SMTP id o97-20020a17090a0a6a00b0023058bbd7b2so774701pjo.0
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Feb 2023 02:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676629647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dYUz8oisVi2MXZNU739kVbVZfuIh484HESHjTvaz9UM=;
        b=meORSfrOitZ4zlTOzjjoOw+lVQAZ9cPa9GCbsF5D7r2vSISSZGzNJGvYAoYrHiKEKv
         D6pebsua3r4XJBH5BiGIQkY8vipuODqMajcUK7EWXtgMLAScFJtklAIJJ0Z4hFgSIXNr
         y/qUyoGREIkKZKzoA+5sVCkhERCmguZJd6+/PewB/3Eg+irdm5wISjIz0QibvzahWSHI
         cda4g/Pef9SXm8+7XBMbYEZwkWd4TA06wYEwGRpWqC9QiNY4lpav8XLnqv8PM1qR3BpS
         9alx2cRI00R44N9Owo8bWeX9A7bKgN0720YIXMWx1jSE3xgHdcARDIxYrKlD999FjCpT
         YBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676629647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYUz8oisVi2MXZNU739kVbVZfuIh484HESHjTvaz9UM=;
        b=u6XCbzY/BNZhhRDLGShpmhc7p93KNx4fU8/u7qkF9Y9QsZ4WYV9J8Dl7KnJjW+84gf
         MgDOVVkMzUnNLSPOLV47loO/nnjk7mrAmEUW9Xz024r4KxT155w/xAGDK1qA5zanq9EU
         3N+qe3j9HED1YyPYjSR575dJI8XEdJ9YJQxXMSU/WuBWY4UKoWtvHTgRuWYJMCaQ7+3B
         LIzrR+mx77165QCi0z9AMkr3f+KVmdiYaKnR0qfxziT498kxUpm60wnie0rD+2SXvZeC
         G2eMTYgG8v9F4gfocZw9ZXeUd0a0zwwdbDad1w8sjqivG089VJRT4bu1PspcjKOjGneS
         5+OA==
X-Gm-Message-State: AO0yUKXtiI4eT0iKwpn24Ez/upWUFdODEVL49kvYPCEtH9QYWptEg1Pi
	rhWcDOg/Z1CTN/jrBuw3Ch2YgLJJDkFsFUQvrX9BXg==
X-Google-Smtp-Source: AK7set8Zqc99tI1n8m5kImc/yYJuO2ErLq/s41RuQOt/YA+reJHb6HINNqc7ZSfnEhsxkCMLALMX2fO1gyvLLpvOClo=
X-Received: by 2002:a17:902:8d89:b0:199:15c2:99ae with SMTP id
 v9-20020a1709028d8900b0019915c299aemr77197plo.20.1676629647338; Fri, 17 Feb
 2023 02:27:27 -0800 (PST)
MIME-Version: 1.0
References: <c1437eb6-0c01-809f-422b-cb1109489355@gmail.com>
In-Reply-To: <c1437eb6-0c01-809f-422b-cb1109489355@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Feb 2023 11:26:50 +0100
Message-ID: <CAPDyKFp-ASckmet2hA7XuycijRSe64HEkVRzPSBKP4G4NG6v-g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: meson-gx: fix interrupt binding
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_022731_027615_9371F9E7 
X-CRM114-Status: GOOD (  15.33  )
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

On Thu, 16 Feb 2023 at 20:50, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Reflect in the binding that the cd interrupt is optional,
> and add a description of the interrupts.
>
> Fixes: 09b31a610328 ("dt-bindings: mmc: meson-gx: support specifying cd interrupt")
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
> v2:
> - omit maxItems and use items
> ---
>  .../devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index c8c30300d..bc403ae9e 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -28,7 +28,10 @@ properties:
>      maxItems: 1
>
>    interrupts:
> -    maxItems: 2
> +    minItems: 1
> +    items:
> +      - description: mmc controller instance
> +      - description: card detect
>
>    clocks:
>      maxItems: 3
> --
> 2.39.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
